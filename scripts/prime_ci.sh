#!/usr/bin/env bash
#
# Provision a Prime Intellect CPU pod, run the WolframPhysics documentation build and deploy on
# it (scripts/build_all.wls inside the Wolfram container: build_notebooks -> docbuild -> publish
# -> build_site site, one process), print the deployed URLs, and ALWAYS tear the pod down.
# Driven by the publish job of .github/workflows/build_paclet.yml; runnable from a checkout with
# the same environment. Ported from PureMath's scripts/prime_ci.sh, with the pod-side steps of
# its prime_pod_build.sh folded in: one ssh session streams the build here, and this process
# owns the pod for its whole life.
#
# Why a pod: GitHub-hosted runners have 2-4 vCPUs and little free disk beside the 3.9 GB
# Wolfram image, and the doc build drives a headless front end through DocumentationBuild and
# then a cloud scrape that can take an hour; a Prime CPU pod gives 16-32 vCPUs and its own disk
# on demand. The runner (or the developer machine) stays a thin launcher; every Wolfram kernel
# runs on the pod, in the same image the check job uses.
#
# Required environment:
#   PRIME_API_KEY                Prime Intellect API key (pod provisioning).
#   PRIME_SSH_KEY                Private SSH key registered with the Prime account (to reach the pod).
#   WOLFRAM_CLOUD_USER           The Wolfram Cloud account the build deploys AS: the resource lands
#   WOLFRAM_CLOUD_PASSWORD       under <account>/DeployedResources/Paclet/WolframInstitute/WolframPhysics.
#   and one license, in this order of preference:
#   .mathpass at the repo root, or WP_MATHPASS_B64 (the same file, base64, how CI carries it):
#                                licenses the full product OFFLINE, unlimited parallel kernels.
#   WOLFRAMSCRIPT_ENTITLEMENTID  an on-demand entitlement, used as given when there is no mathpass.
# Optional (every knob is WP_*):
#   WP_VCPUS=16                  Minimum vCPUs to ask for; the sweep below takes what is in stock.
#   WP_DISK=80                   Pod disk size in GB (the Wolfram image alone unpacks to ~10 GB).
#   WP_IMAGE                     Wolfram docker image (default wolframinstitute/wolfram:15.0). The
#                                mathpass is mounted at the layout path of the image's version tag
#                                (/usr/local/Wolfram/Wolfram/<tag>/...), so the tag must be the
#                                product version the image installs.
#   WP_KEEP_POD=0                1 = leave the pod running on exit, for inspection; IT BILLS
#                                until `prime pods terminate <id> --yes`.
#   WP_TEAM_ID                   Prime team whose wallet funds the pod. A fresh CLI config (a CI
#                                runner) defaults to the personal account, and an unfunded one
#                                answers every create with "Payment required".
#   WP_BUILD_ONLY, WP_PUBLISH_DRY_RUN
#                                Forwarded into the build container when set, so the pod can be
#                                exercised without deploying (build_all.wls reads both; it puts
#                                build_site under its own DRYRUN=1 for a dry run). DRYRUN alone is
#                                deliberately NOT forwarded: build_all.wls sets it only after
#                                publish.wls has run, and publish.wls never reads it, so a
#                                DRYRUN-only run would deploy the resource for real.
#   WP_POD_ATTEMPT               Internal: the retry counter of the self-heal below. Not for use.
# Output: the build streams to stdout and to /tmp/prime_ci_build.log (the workflow uploads it);
#         the deployed URLs go to stdout and to $GITHUB_STEP_SUMMARY when that is set.
# Exit:   0 deployed and the pod verified gone; 1 anything else, INCLUDING a pod that could not
#         be verified gone, since a leaked pod bills by the hour in silence.
#
set -euo pipefail

export PATH="$HOME/.local/bin:$PATH" PRIME_DISABLE_VERSION_CHECK=1
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE="${WP_IMAGE:-wolframinstitute/wolfram:15.0}"
# One name per (run, run attempt, pod attempt), so the workflow's safety net can find every pod
# this run made by the prefix, and the retry below never shares a name with a pod it gave up on.
POD_ATTEMPT="${WP_POD_ATTEMPT:-1}"
POD_NAME="wp-ci-${GITHUB_RUN_ID:-local}-${GITHUB_RUN_ATTEMPT:-1}-${POD_ATTEMPT}"
POD_ID=""
SSH_TARGET=""
LOG_FILE=/tmp/prime_ci_build.log
# Constants of the provisioning sweep (Prime's CPU catalog is small and its stock moves minute
# to minute; these were tuned on it and are not knobs).
AVAIL_TRIES=40         # x 30 s: the whole availability sweep waits up to 20 minutes
POD_ATTEMPTS=4         # pods tried before giving up (a pod that never boots, or fails the smoke)
MAX_PRICE=2.00         # $/h ceiling for the widened (non-CPU-node) pool of the last quarter
REGION=FI              # preferred location prefix (see the ranking in the sweep)
BUILD_TIMEOUT=6000     # seconds the pod-side build may run; the workflow's timeout-minutes exceeds it
SMOKE_TIMEOUT=480      # seconds for the pod smoke test (image pull + license + cloud + paclet server)
MATHPASS_FILE="$REPO_ROOT/.mathpass"

log() { printf '\n\033[1;36m%s >> %s\033[0m\n' "$(date +%H:%M:%S)" "$*"; }
die() { printf '\n\033[1;31mprime_ci: %s\033[0m\n' "$*" >&2; exit 1; }

# --- pod bookkeeping through the Prime CLI. `prime pods list --output json` is either a list
#     or an object with a "pods"/"data" list; both are read. ---
pod_id_by_name() {  # pod_id_by_name <name> -> id or ""
    prime pods list --output json 2>/dev/null | POD_NAME="$1" python3 -c 'import json,sys,os
try: d = json.load(sys.stdin)
except Exception: sys.exit(0)
rows = d if isinstance(d, list) else d.get("pods", d.get("data", []))
print(next((r["id"] for r in rows if r.get("name") == os.environ["POD_NAME"]), ""))' 2>/dev/null || true
}
pod_listed() {      # pod_listed <id>: 0 when the pod is still in the account's list
    prime pods list --output json 2>/dev/null | POD_ID="$1" python3 -c 'import json,sys,os
try: d = json.load(sys.stdin)
except Exception: sys.exit(1)
rows = d if isinstance(d, list) else d.get("pods", d.get("data", []))
sys.exit(0 if any(r.get("id") == os.environ["POD_ID"] for r in rows) else 1)' 2>/dev/null
}
# Terminate, then VERIFY. A swallowed failure here leaks a pod that bills by the hour while the
# job still reports success; the verification is what makes "always tears the pod down" true.
terminate_verified() {  # terminate_verified <id>: 0 verified gone, 1 still listed after 3 attempts
    local id="$1" attempt
    for attempt in 1 2 3; do
        prime pods terminate "$id" --yes >/dev/null 2>&1 || true
        sleep $(( attempt * 5 ))
        pod_listed "$id" || return 0
        log "pod $id still listed after terminate attempt $attempt"
    done
    return 1
}

cleanup() {
    local rc=$?
    # A build session still open (a cancel mid-build) is ended first; the pod it runs on goes next.
    if [ -n "${BUILD_PID:-}" ]; then
        pkill -TERM -P "$BUILD_PID" 2>/dev/null || true
        kill -TERM "$BUILD_PID" 2>/dev/null || true
    fi
    # Died mid-provision before the id was read? Look the pod up by name so it never leaks.
    if [ -z "$POD_ID" ] && [ -n "${POD_NAME:-}" ]; then POD_ID="$(pod_id_by_name "$POD_NAME")"; fi
    if [ -n "$POD_ID" ]; then
        if [ "${WP_KEEP_POD:-0}" = "1" ]; then
            log "WP_KEEP_POD=1: leaving pod $POD_ID running (${SSH_TARGET:-ssh not yet known}); it bills until: prime pods terminate $POD_ID --yes"
        else
            log "terminating pod $POD_ID"
            if terminate_verified "$POD_ID"; then
                log "pod $POD_ID verified gone"
            else
                printf '\n\033[1;31mprime_ci: POD LEAKED - %s is still listed and billing. Terminate it: prime pods terminate %s --yes\033[0m\n' "$POD_ID" "$POD_ID" >&2
                # a leak costs money silently, so it fails the job unless the run was already failing
                [ "$rc" -eq 0 ] && rc=1
            fi
        fi
    fi
    exit "$rc"
}
trap cleanup EXIT
# GitHub cancels a job (a newer run, a manual cancel, the timeout) with SIGTERM, then SIGKILL
# after a grace period. An UNTRAPPED SIGTERM kills bash WITHOUT running the EXIT trap, and the
# pod leaks. Trap the signals to just `exit`; the single EXIT trap above then runs cleanup
# exactly once. SIGKILL cannot be trapped; the workflow's always() teardown step is the backstop
# for that. Values are 128+signal by convention.
trap 'exit 143' TERM HUP
trap 'exit 130' INT

# --- licensing mode. A mathpass licenses the FULL product offline: no entitlement, no per-kernel
#     cloud activation, no metered lease to throttle into "No valid password". It is registered
#     to ONE MathID, 6536-73489-11225, and a container reaches that MathID by running with the
#     fixed machine-id and hostname below (both mounted/set on every container); the values are
#     the pin, and changing either one turns the mathpass into a password for a machine that does
#     not exist. The values, the pm in them included, are the ones PureMath's CI mathpass was
#     registered under: WP_MATHPASS_B64 must be that same mathpass, and this pin is the one thing
#     the port does not rename, since a new hostname or machine-id needs a new mathpass (the
#     workflow's "Stage license" step and CI_MATHID in sync_ci_secrets.sh carry the same pin).
#     The workflow's check job stages the same pin. Without a mathpass the on-demand entitlement
#     is used as given. The mathpass mount path follows the image's version tag: the product
#     installs under /usr/local/Wolfram/Wolfram/<version>/, and a kernel reads the mathpass only
#     from its own layout. ---
LIC_MID_STRING="d0c5a1b2e3f40000000000000000pmci"
LIC_HOSTNAME="pmci"
LIC_MATHPASS_IN_IMAGE="/usr/local/Wolfram/Wolfram/${IMAGE##*:}/Configuration/Licensing/mathpass"
if [ ! -s "$MATHPASS_FILE" ] && [ -n "${WP_MATHPASS_B64:-}" ]; then
    MATHPASS_FILE="$(mktemp)"
    printf '%s' "$WP_MATHPASS_B64" | base64 -d > "$MATHPASS_FILE" 2>/dev/null || true
fi
LIC_MODE="entitlement"; [ -s "$MATHPASS_FILE" ] && LIC_MODE="mathpass"

REQ="PRIME_API_KEY PRIME_SSH_KEY WOLFRAM_CLOUD_USER WOLFRAM_CLOUD_PASSWORD"
[ "$LIC_MODE" = "entitlement" ] && REQ="$REQ WOLFRAMSCRIPT_ENTITLEMENTID"
for v in $REQ; do
    [ -n "${!v:-}" ] || die "missing required env var: $v"
done
command -v prime >/dev/null 2>&1 || die "the prime CLI is not installed (pip install prime)"
log "licensing: $LIC_MODE; deploying as Wolfram Cloud account $WOLFRAM_CLOUD_USER (pod attempt $POD_ATTEMPT/$POD_ATTEMPTS)"

# with_timeout <seconds> <cmd...>: coreutils timeout where present (Linux, or macOS with
# coreutils); a bare macOS has none, and the call then runs unguarded.
with_timeout() { if command -v timeout >/dev/null 2>&1; then timeout "$@"; else shift; "$@"; fi; }

# --- prime auth + SSH key ---
log "configuring prime + ssh key"
prime config set-api-key "$PRIME_API_KEY" >/dev/null
if [ -n "${WP_TEAM_ID:-}" ]; then
    prime config set-team-id "$WP_TEAM_ID" >/dev/null 2>&1 || log "warning: could not set team id $WP_TEAM_ID"
fi
KEY_FILE="$(mktemp)"; printf '%s\n' "$PRIME_SSH_KEY" > "$KEY_FILE"; chmod 600 "$KEY_FILE"
# ServerAlive*: the build is ONE long ssh session, and a silent session is what a NAT drops.
# Keepalives hold it open across the quiet phases (a long scrape prints nothing for minutes).
SSH_OPTS="-i $KEY_FILE -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=20 -o ServerAliveInterval=30 -o ServerAliveCountMax=10 -o LogLevel=ERROR"
podssh() { ssh $SSH_OPTS "$SSH_TARGET" "$@"; }

# --- pick a CPU offering ---
# Prime's availability is dynamic (CPU nodes appear and vanish minute to minute), so the sweep
# retries for a while. Candidates are ranked (the order is spelled out at the sort below): CPU
# nodes, the preferred region, non-spot before spot (a spot pod can be preempted mid-build),
# meeting WP_VCPUS, the smallest that does, the cheapest. The gpu_type of a CPU node is
# "CPU NODE" / "CPU NODE (Spot)", and is_spot may be null (treated as non-spot).
# Some nodes fail to provision (HTTP 500 on create), so the sweep gathers a RANKED list of
# candidates and tries each until one actually creates. `prime pods create` prompts for vCPUs
# even with --yes, so --vcpus is passed explicitly and `yes ''` answers any residual prompt; the
# pod id is read from the "created pod <id>" line. `yes` gets SIGPIPE when create exits, so
# errexit/pipefail are off around it.
# The CPU catalog is five SKUs (2/4/8/16/32 vCPU). The first half of the sweep holds a floor of
# 8 (a small pod builds slowly), then relaxes to 4 rather than fail on a window where only the
# small SKUs are in stock. The last quarter widens past CPU nodes: the CPU nodes come from ONE
# provider in ONE region, so a quiet hour there would stall every publish while other nodes sit
# idle, and for a CPU-only build a GPU node is just an expensive CPU box, capped at MAX_PRICE.
log "selecting a CPU offering (target >= ${WP_VCPUS:-16} vCPUs, prefer non-spot, up to $(( AVAIL_TRIES / 2 )) min)"
for _try in $(seq 1 "$AVAIL_TRIES"); do
    if [ "$_try" -gt $(( AVAIL_TRIES / 2 )) ]; then
        FLOOR=4
        [ "$_try" = "$(( AVAIL_TRIES / 2 + 1 ))" ] && log "no node >= 8 vCPUs yet; accepting >= 4 vCPUs for the rest of the sweep"
    else
        FLOOR=8
    fi
    if [ "$_try" -gt $(( AVAIL_TRIES * 3 / 4 )) ]; then
        POOL=any
        [ "$_try" = "$(( AVAIL_TRIES * 3 / 4 + 1 ))" ] && log "still no CPU node; widening to any non-spot node <= \$${MAX_PRICE}/h"
    else
        POOL=cpu
    fi
    # stderr is captured too, and the parser tells "no capacity right now" (retry) from "that
    # was not availability JSON" (fatal): `prime` EXITS 0 with a dead API key, printing the error
    # where the JSON should be, and swallowing that would make a dead key look like scarcity.
    AVAIL_RAW="$(prime availability list --output json 2>&1)"
    set +e   # the parser's exit 3 must reach the check below, not trip errexit
    CANDIDATES="$(printf '%s' "$AVAIL_RAW" | WP_VCPUS="${WP_VCPUS:-16}" FLOOR="$FLOOR" POOL="$POOL" MAX_PRICE="$MAX_PRICE" REGION="$REGION" python3 -c '
import json, os, sys
want = int(os.environ["WP_VCPUS"])
try:
    rows = json.load(sys.stdin)["gpu_resources"]
except Exception:
    sys.exit(3)   # not availability JSON at all (auth failure, CLI drift, outage)
def vc(r):
    v = r.get("vcpus")
    return int(str(v).split("-")[-1]) if isinstance(v, str) else int(v or 0)
floor = int(os.environ["FLOOR"])
# The status is matched EXACTLY: "Unavailable" contains "avail", and a substring test admits
# sold-out nodes, which `prime pods create` answers with HTTP 500, one by one, for the whole sweep.
in_stock = lambda r: str(r.get("stock_status", "")).strip().lower() in ("available", "low")
is_cpu = lambda r: "CPU" in str(r.get("gpu_type", "")).upper()
is_spot = lambda r: bool(r.get("is_spot")) or "spot" in str(r.get("gpu_type", "")).lower()
def price(r):
    try: return float(r.get("price_value") or 0)
    except (TypeError, ValueError): return 0.0
cpu = [r for r in rows if is_cpu(r)]
avail = [r for r in cpu if in_stock(r) and vc(r) >= floor]
if os.environ["POOL"] == "any":
    # the widened pool stays non-spot: a preempted pod is a lost build, whatever the node
    maxp = float(os.environ["MAX_PRICE"])
    avail += [r for r in rows if not is_cpu(r) and in_stock(r) and not is_spot(r)
              and vc(r) >= want and price(r) <= maxp]
if not avail:
    # Say what the catalog held: "nothing available" alone cannot distinguish an empty
    # catalog from one holding only nodes below the floor.
    sys.stderr.write("prime_ci: no match (floor {} vCPUs). CPU rows: {}\n".format(
        floor, ", ".join("{}v/{}/{}".format(vc(r), r.get("stock_status"), r.get("location")) for r in cpu) or "NONE"))
# Ranking: CPU nodes first; then the preferred region (the mathpass licenses offline, so
# proximity to a licensing server does not matter, but the region prefix given as REGION is
# where the pods reliably have working container networking); then non-spot; then meeting
# the vCPU target; then the SMALLEST that meets it (small nodes provision more reliably than
# the largest ones); then cheaper.
region = os.environ["REGION"].upper()
inregion = lambda r: 0 if str(r.get("location", "")).upper().startswith(region) else 1
avail.sort(key=lambda r: (0 if is_cpu(r) else 1, inregion(r), is_spot(r),
                          0 if vc(r) >= want else 1, vc(r), price(r)))
for r in avail[:8]:
    print(r["id"], vc(r), str(r.get("location", "?")).replace(" ", "_"))
')"
    _availrc=$?
    set -e
    if [ "$_availrc" = "3" ]; then
        die "prime availability did not return JSON - the API key or CLI is the problem, not capacity:
$(printf '%s' "$AVAIL_RAW" | head -4)"
    fi
    if [ -z "$CANDIDATES" ]; then log "no CPU offering available yet; retrying in 30s"; sleep 30; continue; fi
    # The candidates go into an array FIRST: a `while read` loop with `prime pods create` inside
    # would feed the loop's stdin to create and only ever run the first candidate.
    _cands=()
    while IFS= read -r _line; do [ -n "$_line" ] && _cands+=("$_line"); done <<< "$CANDIDATES"
    for _cand in "${_cands[@]}"; do
        OFFER_ID="${_cand%% *}"; _rest="${_cand#* }"; OFFER_VCPUS="${_rest%% *}"; OFFER_LOC="${_rest##* }"
        log "trying offering $OFFER_ID ($OFFER_VCPUS vCPUs, region $OFFER_LOC)"
        # `yes ''` for residual prompts (SIGPIPE kills it cleanly when create exits), a timeout so a
        # hung provisioning call cannot stall the sweep. Offerings race (HTTP 400 "no longer
        # available" / 500), so a failed create falls through to the next candidate. errexit and
        # pipefail stay OFF across the create AND the id parse: a racy create returns no "created
        # pod" line, the grep then exits 1, and under set -e that would end the sweep at the first
        # miss instead of trying the next candidate.
        set +e +o pipefail
        CREATE_OUT="$(yes '' | with_timeout 200 prime pods create --plain --yes --id "$OFFER_ID" --vcpus "$OFFER_VCPUS" \
            --name "$POD_NAME" --disk-size "${WP_DISK:-80}" 2>&1)"
        POD_ID="$(printf '%s\n' "$CREATE_OUT" | grep -oiE 'created pod [a-f0-9]+' | awk '{print $NF}' | tail -1)"
        set -e -o pipefail
        if [ -n "$POD_ID" ]; then log "created pod $POD_ID on offering $OFFER_ID ($OFFER_VCPUS vCPUs)"; break; fi
        log "  create failed: $(printf '%s' "$CREATE_OUT" | grep -ioE 'HTTP [0-9]+[^\"]*|Error[^\"]*' | head -1)"
    done
    [ -n "$POD_ID" ] && break
    log "all candidates failed to provision; retrying in 30s"
    sleep 30
done
[ -n "$POD_ID" ] || die "could not create a pod on any available offering"
log "pod id: $POD_ID ($POD_NAME)"

# --- self-heal: a pod that never boots, or fails the smoke test, is a bad pod, not a fatal
#     error. Tear it down (verified) and re-exec this script on a fresh one, up to POD_ATTEMPTS. ---
retry_on_fresh_pod() {  # retry_on_fresh_pod <reason>
    log "$1 - retrying on a fresh pod ($POD_ATTEMPT/$POD_ATTEMPTS)"
    if [ "${WP_KEEP_POD:-0}" = "1" ]; then
        die "$1; WP_KEEP_POD=1 keeps pod $POD_ID ($SSH_TARGET) for inspection"
    fi
    terminate_verified "$POD_ID" || printf '\n\033[1;31mprime_ci: POD LEAKED - %s is still listed and billing. Terminate it: prime pods terminate %s --yes\033[0m\n' "$POD_ID" "$POD_ID" >&2
    POD_ID=""
    if [ "$POD_ATTEMPT" -lt "$POD_ATTEMPTS" ]; then
        # exec replaces this process without running its EXIT trap; the pod is already gone.
        exec env WP_POD_ATTEMPT="$(( POD_ATTEMPT + 1 ))" bash "$0"
    fi
    die "$1 on $POD_ATTEMPTS pods"
}

# --- wait for ACTIVE + reachable ssh ---
log "waiting for pod to become ACTIVE"
STATUS=""
for _ in $(seq 1 80); do
    read -r STATUS SSH_TARGET < <(prime pods status "$POD_ID" --output json 2>/dev/null | python3 -c '
import json, sys
try:
    d = json.load(sys.stdin); print(d.get("status", "?"), d.get("ssh") or "")
except Exception:
    print("?", "")
' 2>/dev/null) || true
    if [ "$STATUS" = "ACTIVE" ] && [ -n "$SSH_TARGET" ]; then break; fi
    case "$STATUS" in TERMINATED|FAILED|ERROR|DELETED) break;; esac   # bad node - stop waiting
    sleep 15
done
if [ "$STATUS" != "ACTIVE" ] || [ -z "$SSH_TARGET" ]; then
    retry_on_fresh_pod "pod did not become ACTIVE (last status: ${STATUS:-none})"
fi
# Prime's ssh field is "user@host" or "user@host -p PORT" (providers differ). Split it so ssh,
# scp and rsync all connect; the port goes through -o Port=, which all three accept. The
# `|| true` matters: for the plain form the port grep matches nothing and exits 1, which under
# set -e -o pipefail would kill the script here.
SSH_PORT="$(printf '%s' "$SSH_TARGET" | grep -oiE '[-]p[= ]*[0-9]+' | grep -oE '[0-9]+' | head -1 || true)"; SSH_PORT="${SSH_PORT:-22}"
SSH_TARGET="$(printf '%s' "$SSH_TARGET" | grep -oE '[A-Za-z0-9._-]+@[0-9A-Za-z._-]+' | head -1 || true)"
[ -n "$SSH_TARGET" ] || die "could not parse ssh host from pod status"
SSH_OPTS="$SSH_OPTS -o Port=$SSH_PORT"
log "pod ACTIVE: $SSH_TARGET (port $SSH_PORT)"

for _ in $(seq 1 40); do podssh true 2>/dev/null && break; sleep 10; done
podssh true 2>/dev/null || retry_on_fresh_pod "ssh never came up on $SSH_TARGET"

# The ssh user may be non-root (ubuntu@) and the base image may lack Docker: work out of the
# user's home and install Docker when it is not there.
REMOTE_DIR="$(podssh 'echo "$HOME/wp"')"
ENV_REMOTE="$(podssh 'echo "$HOME/wp.env"')"

log "ensuring Docker is installed on the pod"
podssh 'command -v docker >/dev/null 2>&1 || { sudo apt-get update -qq && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq docker.io >/dev/null; }'
podssh 'command -v docker >/dev/null 2>&1' || retry_on_fresh_pod "Docker unavailable on the pod"

# Docker's bridge network routes container traffic through the host, which needs
# net.ipv4.ip_forward=1. The CPU pods ship it as 0, and with it off every bridged container is
# cut off from the internet: packets are DROPPED, not refused, so each connect burns the full
# TCP SYN-retry ladder instead of failing fast (a 10-second smoke test becomes a 16-minute
# failure, and the deploy's cloud calls hang). The pod HOST is fine either way, which is why
# apt and `docker pull` do not show it. Docker sets the flag when it creates a network, and
# something on these images resets it later, so: rewrite /etc/sysctl.conf (which systemd-sysctl
# reads LAST, outranking any drop-in), set the live value, and keep re-asserting it every
# minute for as long as the pod lives, since a build outlives the reset.
podssh "sudo sed -i 's/^net.ipv4.ip_forward=0/net.ipv4.ip_forward=1/' /etc/sysctl.conf 2>/dev/null || true"
podssh 'sudo sysctl -w net.ipv4.ip_forward=1 >/dev/null 2>&1 || true'
podssh 'setsid -f bash -c "while :; do sudo sysctl -w net.ipv4.ip_forward=1 >/dev/null 2>&1; sleep 60; done" </dev/null >/dev/null 2>&1 || true'
podssh '[ "$(cat /proc/sys/net/ipv4/ip_forward)" = 1 ]' \
    || log "WARNING: net.ipv4.ip_forward is still 0 - bridged containers will have no egress"

# --- stage the license pin and the secrets on the pod ---
# Every container runs with `docker run $LICMOUNTS --env-file $ENV_REMOTE`. In mathpass mode
# the env file leaves WOLFRAMSCRIPT_ENTITLEMENTID out entirely, so no kernel can fall back to
# metered on-demand activation: everything licenses from the mounted mathpass.
LICMOUNTS="--hostname $LIC_HOSTNAME"
if [ "$LIC_MODE" = "mathpass" ]; then
    podssh "printf '%s\n' '$LIC_MID_STRING' > /tmp/wp.mid"
    scp $SSH_OPTS "$MATHPASS_FILE" "$SSH_TARGET":/tmp/wp.mathpass >/dev/null
    LICMOUNTS="$LICMOUNTS -v /tmp/wp.mid:/etc/machine-id:ro -v /tmp/wp.mid:/var/lib/dbus/machine-id:ro -v /tmp/wp.mathpass:$LIC_MATHPASS_IN_IMAGE:ro"
fi
ENV_FILE="$(mktemp)"
{
    [ "$LIC_MODE" = "entitlement" ] && echo "WOLFRAMSCRIPT_ENTITLEMENTID=$WOLFRAMSCRIPT_ENTITLEMENTID"
    echo "WOLFRAM_CLOUD_USER=$WOLFRAM_CLOUD_USER"
    echo "WOLFRAM_CLOUD_PASSWORD=$WOLFRAM_CLOUD_PASSWORD"
} > "$ENV_FILE"
scp $SSH_OPTS "$ENV_FILE" "$SSH_TARGET":"$ENV_REMOTE" >/dev/null
rm -f "$ENV_FILE"
podssh "chmod 600 '$ENV_REMOTE'"

# Every container below runs as `sudo docker run --rm --env-file $ENV_REMOTE $DOCKER_COMMON
# $LICMOUNTS ...`. --dns pins container resolution to public resolvers: a pod host's
# resolv.conf entries can die mid-run (fresh containers then fail every lookup while the host
# keeps resolving), and the deploy's scrape hangs on it. QT_QPA_PLATFORM=offscreen is what lets
# the headless front end the doc build drives come up in a container with no display; without
# it DocumentationBuild aborts in the XCB platform plugin.
DOCKER_COMMON="--dns 1.1.1.1 --dns 8.8.8.8 -e QT_QPA_PLATFORM=offscreen -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8"

# --- pod smoke test: licensing + cloud + paclet server ---
# A pod can be flaky on any of three independent Wolfram round-trips, each a per-pod coin flip:
#   (1) licensing activation   -> "No valid password found"
#   (2) the cloud connection   -> slow or hung "Connecting..." (the deploy cannot happen)
#   (3) the paclet server      -> PacletInstall["Wolfram/Parser"] fails; build_notebooks needs it
#                                 for the LaTeX in the pages and degrades every formula without it
# All three are tested on one kernel; on any failure (or a hang past the timeout) THIS pod is
# torn down and a fresh one tried. The image pull is reused by the real build, so a good pod
# loses nothing. `sudo timeout`, not `timeout sudo`: as the unprivileged pod user, timeout's
# SIGTERM to a root-owned `sudo docker run` is EPERM and the guard never fires; --kill-after
# escalates when the container's PID 1 swallows the TERM.
log "smoke-testing pod ($LIC_MODE licensing + cloud + paclet server) - attempt $POD_ATTEMPT/$POD_ATTEMPTS"
SMOKE="$(podssh "sudo timeout --kill-after=30 $SMOKE_TIMEOUT docker run --rm --env-file '$ENV_REMOTE' $DOCKER_COMMON $LICMOUNTS '$IMAGE' wolframscript -code 'Print[\"PROCS=\", \$ProcessorCount, \" LIC=\", \$LicenseType]; Quiet@If[! \$CloudConnected, CloudConnect[Environment[\"WOLFRAM_CLOUD_USER\"], Environment[\"WOLFRAM_CLOUD_PASSWORD\"]]]; Print[\"CLOUD=\", \$CloudConnected]; Print[\"PACLET=\", Head[Quiet@PacletInstall[\"Wolfram/Parser\"]]]'" 2>&1 || true)"
if printf '%s' "$SMOKE" | grep -q "PROCS=" && printf '%s' "$SMOKE" | grep -q "CLOUD=True" && printf '%s' "$SMOKE" | grep -q "PACLET=PacletObject"; then
    log "  pod OK ($(printf '%s' "$SMOKE" | grep -oE 'PROCS=[0-9]+ LIC=[A-Za-z]*' | head -1), cloud + paclet server reachable)"
else
    log "  pod FAILED smoke test: $(printf '%s' "$SMOKE" | grep -ioE 'No valid password|Connection closed|CLOUD=False|PACLET=[A-Za-z$]+|notavail' | head -2 | tr '\n' ' ')"
    # The raw output and the pod's network state are ALWAYS dumped: a gate that fails without
    # saying what it saw leaves nothing to diagnose from.
    log "  smoke raw: $(printf '%s' "$SMOKE" | tr '\n' '|' | tail -c 900)"
    log "  pod net: ip_forward=$(podssh 'cat /proc/sys/net/ipv4/ip_forward' 2>/dev/null | tr -d '\r')" \
        "host=$(podssh 'curl -sS -m 10 -o /dev/null -w %{http_code} https://www.wolframcloud.com' 2>/dev/null | tr -d '\r')" \
        "container=$(podssh 'sudo timeout 40 docker run --rm curlimages/curl:latest -sS -m 15 -o /dev/null -w %{http_code} https://www.wolframcloud.com' 2>/dev/null | tr -d '\r')"
    retry_on_fresh_pod "pod smoke test failed (Wolfram licensing/cloud/paclet server unreachable)"
fi

# --- sync the repo to the pod ---
# Excluded: the git store (the build does not read it), local build products (the pod builds
# fresh), and the gitignored secrets, which travel by the env file and the license mounts above.
# The built documentation counts as a local build product: WolframPhysics/Documentation (the
# notebooks, the incremental manifest .doc_manifest.wl and the build stamp) and
# WolframPhysics/ResourceDefinition.nb are written by ./build_docs.sh, which build_all.wls runs
# as its first phase on the pod. Sending a local copy would put a manifest on the pod whose
# entries match this machine's markdown, and the incremental build would skip exactly the pages
# it was meant to rebuild, so the pod would publish this machine's last build.
# The submodule checkout under tools/MarkdownToNotebook goes with the tree; build_notebooks.wls
# converts with it and falls back to the deployed resource function without it.
log "syncing repo to pod ($REMOTE_DIR)"
podssh "mkdir -p '$REMOTE_DIR'"
rsync -az --delete -e "ssh $SSH_OPTS" \
    --exclude '.git' --exclude 'build' --exclude 'dist' --exclude '.claude' \
    --exclude '.env' --exclude '.mathpass' \
    --exclude 'WolframPhysics/Documentation' --exclude 'WolframPhysics/ResourceDefinition.nb' \
    "$REPO_ROOT/" "$SSH_TARGET":"$REMOTE_DIR/"

# --- the build, streamed ---
# One container runs scripts/build_all.wls end to end, with the repo mounted at /repo; its exit
# status is the build's. The wolframscript process can exit 0 after an aborted evaluation, so
# success is ALSO judged by what the deploy printed: the `published: <url>` lines publish.wls
# and build_site.wls emit. The pod-side `sudo timeout` bounds a wedged build (a front end
# spinning at 100% prints nothing and never returns): it kills the container, and this
# session returns 124.
PASSTHRU=""
for v in WP_BUILD_ONLY WP_PUBLISH_DRY_RUN; do
    [ -n "${!v:-}" ] && PASSTHRU="$PASSTHRU -e $v=${!v}"
done
[ -n "$PASSTHRU" ] && log "forwarding into the build container:$PASSTHRU"
log "running scripts/build_all.wls on the pod (up to $(( BUILD_TIMEOUT / 60 )) min)"
: > "$LOG_FILE"
# The session runs in the background and the script `wait`s on it: bash defers a trapped signal
# until a FOREGROUND command returns, so a cancel arriving during a foreground ssh would tear
# the pod down only when the build ended (or when the SIGKILL made teardown impossible), while
# `wait` returns to the trap at once. The subshell exits with ssh's status, which is the remote
# command's.
set +e
( podssh "cd '$REMOTE_DIR' && sudo timeout --kill-after=60 $BUILD_TIMEOUT docker run --rm --env-file '$ENV_REMOTE' $DOCKER_COMMON $LICMOUNTS $PASSTHRU -v '$REMOTE_DIR:/repo' -w /repo '$IMAGE' wolframscript -f scripts/build_all.wls" 2>&1 | tee "$LOG_FILE"; exit "${PIPESTATUS[0]}" ) &
BUILD_PID=$!
wait "$BUILD_PID"; BUILD_RC=$?
BUILD_PID=""
set -e
if [ "$BUILD_RC" -ne 0 ]; then
    if [ "$BUILD_RC" = 124 ]; then
        log "build killed by the pod-side timeout after $BUILD_TIMEOUT s"
    else
        log "build failed on the pod (exit $BUILD_RC)"
    fi
    exit 1
fi

if [ -n "$PASSTHRU" ]; then
    log "build finished without deploying (WP_BUILD_ONLY / WP_PUBLISH_DRY_RUN set)"
    exit 0
fi
URLS="$(grep -oE 'published: https://www\.wolframcloud\.com/obj/[^[:space:]]+' "$LOG_FILE" | sed 's/^published: //' | awk '!seen[$0]++' || true)"
if [ -z "$URLS" ]; then
    log "build finished but no 'published: <url>' line was found in the log - the deploy did not happen"
    exit 1
fi
log "DEPLOYED (as $WOLFRAM_CLOUD_USER):"
printf '%s\n' "$URLS" | sed 's/^/  /'
if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
    { echo "## WolframPhysics docs deployed (as $WOLFRAM_CLOUD_USER)"; printf '%s\n' "$URLS" | sed 's/^/- /'; } >> "$GITHUB_STEP_SUMMARY"
fi
