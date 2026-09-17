#!/usr/bin/env bash
#
# Validate the CI credentials and push them to the GitHub repository's Actions secrets.
#
# Why this exists: a CI credential that expires does not announce itself. `prime availability`
# EXITS 0 while printing "API key unauthorized" where the JSON should be, so a stale Prime key
# reads as "no capacity" and burns the availability sweep before failing; a mathpass past its
# date silently degrades every container to on-demand licensing. So: check each credential
# against the live service FIRST, then upload, and never print a secret value. Ported from
# PureMath's scripts/sync_ci_secrets.sh.
#
#   scripts/sync_ci_secrets.sh                  validate everything, push what is valid
#   scripts/sync_ci_secrets.sh --check          validate only, push nothing (run it periodically)
#   scripts/sync_ci_secrets.sh --skip-wolfram   skip the slow (~20 s) cloud login check
#   scripts/sync_ci_secrets.sh --help           this text
#
# Secrets pushed (the names .github/workflows/build_paclet.yml and scripts/prime_ci.sh read):
#   PRIME_API_KEY                 from .env; pod provisioning
#   PRIME_SSH_KEY                 the private key at WP_SSH_KEY_FILE; reaching the pod
#   WP_MATHPASS_B64               .mathpass, base64 (the tabs survive the secret store that way);
#                                 licenses the containers offline, pinned to the CI MathID
#   WOLFRAMSCRIPT_ENTITLEMENTID   from .env, optional; the on-demand fallback when no mathpass
#   WOLFRAM_CLOUD_USER            from .env; the account the build deploys as
#   WOLFRAM_CLOUD_PASSWORD        from .env
#
# Sources (all gitignored, none committed): .env, .mathpass, the SSH private key.
#
# Knobs:
#   WP_REPO=owner/name            target repository (default WolframInstitute/WolframPhysics)
#   WP_SSH_KEY_FILE=<path>        the Prime SSH private key (default ~/.ssh/primeintellect_ed25519)
#
# Prerequisites: the prime CLI (pip install prime), ssh-keygen, gh (logged in, for the push),
# wolframscript for the cloud login check (skipped with a note when absent).
# Exit: 0 every credential checked out (and, without --check, was pushed); 1 otherwise; 2 usage.
#
set -uo pipefail
cd "$(dirname "$0")/.."
REPO="${WP_REPO:-WolframInstitute/WolframPhysics}"
CHECK_ONLY=0; SKIP_WL=0
for a in "$@"; do
    case "$a" in
        --check) CHECK_ONLY=1 ;;
        --skip-wolfram) SKIP_WL=1 ;;
        -h|--help) sed -n '2,/^set -uo/p' "$0" | sed '$d' | sed 's/^# \{0,1\}//'; exit 0 ;;
        *) echo "unknown flag: $a (try --help)" >&2; exit 2 ;;
    esac
done
KEY_FILE="${WP_SSH_KEY_FILE:-$HOME/.ssh/primeintellect_ed25519}"
ok()   { printf '  \033[32mOK\033[0m    %s\n' "$1"; }
bad()  { printf '  \033[31mFAIL\033[0m  %s\n' "$1"; FAILED=1; }
skip() { printf '  \033[33mSKIP\033[0m  %s\n' "$1"; }
# with_timeout <seconds> <cmd...>: coreutils timeout where present (Linux, or macOS with
# coreutils); a bare macOS has none, and the check then simply runs unguarded.
with_timeout() { if command -v timeout >/dev/null 2>&1; then timeout "$@"; else shift; "$@"; fi; }
FAILED=0; PUSH=()

[ -f .env ] || { echo ".env not found - nothing to sync"; exit 1; }
set -a; . ./.env; set +a
export PRIME_DISABLE_VERSION_CHECK=1

echo "validating CI credentials for $REPO"

# --- Prime API key: the exact call CI makes, checked the way CI checks it (JSON or not) ---
if [ -z "${PRIME_API_KEY:-}" ]; then
    bad "PRIME_API_KEY missing from .env"
elif ! command -v prime >/dev/null 2>&1; then
    bad "PRIME_API_KEY: the prime CLI is not installed (pip install prime), so it cannot be checked"
else
    AVAIL="$(prime availability list --output json 2>&1)"
    N="$(printf '%s' "$AVAIL" | python3 -c 'import json,sys
try: rows=json.load(sys.stdin)["gpu_resources"]
except Exception: print(-1); raise SystemExit
print(len([r for r in rows if "CPU" in str(r.get("gpu_type","")).upper()
           and str(r.get("stock_status","")).strip().lower() in ("available","low")]))' 2>/dev/null)"
    if [ "${N:--1}" = "-1" ]; then
        bad "PRIME_API_KEY rejected: $(printf '%s' "$AVAIL" | head -1)"
    else
        ok "PRIME_API_KEY ($N CPU offerings in stock now)"
        PUSH+=("PRIME_API_KEY=$PRIME_API_KEY")
    fi
fi

# --- Prime SSH key: a readable, unencrypted private key (CI writes it to a file and ssh's with it) ---
if [ ! -r "$KEY_FILE" ]; then
    bad "PRIME_SSH_KEY: $KEY_FILE not readable (WP_SSH_KEY_FILE points elsewhere?)"
elif ! ssh-keygen -y -f "$KEY_FILE" >/dev/null 2>&1; then
    bad "PRIME_SSH_KEY: $KEY_FILE is not a valid unencrypted private key"
else
    ok "PRIME_SSH_KEY ($(basename "$KEY_FILE"), $(ssh-keygen -l -f "$KEY_FILE" 2>/dev/null | awk '{print $1" "$4}'))"
    PUSH+=("PRIME_SSH_KEY=$(cat "$KEY_FILE")")
fi

# --- mathpass: must carry the MathID the CI containers pin themselves to, and be in date ---
# Every CI container runs with a fixed machine-id and hostname (see prime_ci.sh and the
# workflow's "Stage license" step), which gives it MathID 6536-73489-11225; a mathpass for
# any other MathID licenses nothing there. That MathID is the machine identity PureMath's CI
# mathpass is registered to (the pmci pin), kept verbatim: WP_MATHPASS_B64 must be that same
# mathpass, and a new pin needs a new mathpass.
CI_MATHID="6536-73489-11225"
HAVE_MATHPASS=0
if [ ! -s .mathpass ]; then
    skip ".mathpass absent - CI will fall back to the on-demand entitlement"
else
    EXP="$(awk '{for(i=1;i<=NF;i++) if ($i ~ /::/) {n=split($i,p,":"); print p[n]}}' .mathpass | sort | tail -1)"
    TODAY="$(date +%Y%m%d)"
    if ! grep -q "$CI_MATHID" .mathpass; then
        bad ".mathpass does not contain the CI MathID $CI_MATHID (the containers pin to it)"
    elif [ -n "$EXP" ] && [ "$EXP" -lt "$TODAY" ] 2>/dev/null; then
        bad ".mathpass expired on $EXP - request a new password for MathID $CI_MATHID"
    else
        ok "WP_MATHPASS_B64 (MathID $CI_MATHID, expires ${EXP:-unknown})"
        PUSH+=("WP_MATHPASS_B64=$(base64 < .mathpass | tr -d '\n')")
        HAVE_MATHPASS=1
    fi
fi

# --- on-demand entitlement: the licensing fallback. Activating against it costs metered time,
#     so it is checked for shape, not by a kernel launch. Required only when no mathpass will
#     be pushed; without either, every CI kernel fails to license. ---
if [ -z "${WOLFRAMSCRIPT_ENTITLEMENTID:-}" ]; then
    if [ "$HAVE_MATHPASS" = "1" ]; then
        skip "WOLFRAMSCRIPT_ENTITLEMENTID absent from .env - no on-demand fallback (the mathpass licenses CI)"
    else
        bad "WOLFRAMSCRIPT_ENTITLEMENTID missing from .env and no .mathpass: CI has no license"
    fi
elif printf '%s' "$WOLFRAMSCRIPT_ENTITLEMENTID" | grep -qE '[[:space:]]'; then
    bad "WOLFRAMSCRIPT_ENTITLEMENTID contains whitespace"
else
    ok "WOLFRAMSCRIPT_ENTITLEMENTID (present; not activated here, activation is metered)"
    PUSH+=("WOLFRAMSCRIPT_ENTITLEMENTID=$WOLFRAMSCRIPT_ENTITLEMENTID")
fi

# --- Wolfram Cloud login: the account the build deploys as ---
if [ "$SKIP_WL" = "1" ]; then
    skip "WOLFRAM_CLOUD_* (--skip-wolfram)"
elif [ -z "${WOLFRAM_CLOUD_USER:-}" ] || [ -z "${WOLFRAM_CLOUD_PASSWORD:-}" ]; then
    bad "WOLFRAM_CLOUD_USER / WOLFRAM_CLOUD_PASSWORD missing from .env"
elif ! command -v wolframscript >/dev/null 2>&1; then
    skip "WOLFRAM_CLOUD_* (no local wolframscript to verify with)"
else
    # "RememberMe" -> False: the check must not replace the cached login of whoever runs it.
    CONN="$(with_timeout 120 wolframscript -code '$AllowInternet=True; Quiet@CloudConnect[Environment["WOLFRAM_CLOUD_USER"],Environment["WOLFRAM_CLOUD_PASSWORD"],"RememberMe"->False]; Print["CONNECTED=", $CloudConnected]' 2>/dev/null | grep -o 'CONNECTED=True')"
    if [ -z "$CONN" ]; then
        bad "WOLFRAM_CLOUD_* rejected by the cloud"
    else
        ok "WOLFRAM_CLOUD_* ($WOLFRAM_CLOUD_USER)"
        PUSH+=("WOLFRAM_CLOUD_USER=$WOLFRAM_CLOUD_USER" "WOLFRAM_CLOUD_PASSWORD=$WOLFRAM_CLOUD_PASSWORD")
    fi
fi

echo
if [ "$CHECK_ONLY" = "1" ]; then
    echo "--check: validated ${#PUSH[@]} secret(s), pushed nothing"
    exit $FAILED
fi
[ ${#PUSH[@]} -eq 0 ] && { echo "nothing valid to push"; exit 1; }

command -v gh >/dev/null 2>&1 || { echo "gh CLI not found - cannot push secrets" >&2; exit 1; }
echo "pushing ${#PUSH[@]} secret(s) to $REPO"
for kv in "${PUSH[@]}"; do
    name="${kv%%=*}"; value="${kv#*=}"
    if printf '%s' "$value" | gh secret set "$name" -R "$REPO" 2>/dev/null; then
        ok "pushed $name"
    else
        bad "could not push $name"
    fi
done
echo
gh secret list -R "$REPO" 2>/dev/null | sed 's/^/  /'
[ "$FAILED" = "1" ] && echo && echo "one or more credentials need attention (see FAIL above)"
exit $FAILED
