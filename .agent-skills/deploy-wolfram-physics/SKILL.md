---
name: deploy-wolfram-physics
description: "Run or monitor a WolframPhysics deploy from an agent coding harness: the docs build, the DocumentationBuild pass, the publish of the WolframInstitute/WolframPhysics paclet resource to the Wolfram Cloud and the documentation-site shell over it, with the dry runs that go before each cloud write. Use this whenever the user asks to deploy, publish, push live, redeploy, or update the live WolframPhysics resource page, its documentation or the docs site, or to diagnose a stuck or failed deploy. Trigger it even when the request names only one artifact (the home page, a doc page, the shingle, the Links section)."
---

# Deploying WolframPhysics from an agent harness

Deploys are cloud actions: run them only when the user explicitly asks for a deploy.
The publish scripts (`publish.wls`, `build_site.wls site`) write to a shared cloud
account and replace what is live there; never run them to verify a change. Verify by
reading the source, building locally (`./build_docs.sh`, `scripts/docbuild.wls`,
`scripts/build_site.wls local`) or fetching already-live URLs, and when a question
genuinely requires a cloud run, ask the user to run it or to confirm the run.

## Read first

[CONTRIBUTING.md](../../CONTRIBUTING.md) "Publishing" and "Deploying from CI" are the
source of truth for the pipeline, the environment, the known limits and the
verification. Every script's
header comment states what it does, its usage lines, the `WP_*` knobs it reads, its
prerequisites and its exit status; read the header of each script you are about to
run. This skill adds only what is specific to running that pipeline from inside a
coding-agent harness, and restates the fixed rules so they are not lost.

## The pipeline

From a tree with the markdown in place, from the repository root, in this order. The
first two steps are local; the dry run is the rehearsal that goes before each cloud
write.

```
./build_docs.sh                                        # docs/en -> WolframPhysics/Documentation/English (build artifacts, not in git)
                                                       #   and docs/ResourceDefinition.md -> WolframPhysics/ResourceDefinition.nb
wolframscript -file scripts/docbuild.wls               # DocumentationBuild the paclet into the built copy at build/WolframPhysics
                                                       #   (the skeleton, the built pages, the search index, the declared symbols)
WP_PUBLISH_DRY_RUN=1 wolframscript -file scripts/publish.wls   # rehearsal: connect, fill the categories, scrape, print the
                                                               #   account and the location a deploy would write, deploy nothing
wolframscript -file scripts/publish.wls                # the deploy: the resource at
                                                       #   <account>/DeployedResources/Paclet/WolframInstitute/WolframPhysics
DRYRUN=1 wolframscript -file scripts/build_site.wls site       # rehearsal: print the navigation tree and stop
wolframscript -file scripts/build_site.wls site        # the documentation browser at <account>/WolframPhysics
```

`scripts/build_all.wls` drives `./build_docs.sh` -> `docbuild` -> `publish` ->
`build_site site` from one command, each phase its own `wolframscript` process run in
sequence, which is how the CI pod runs it; `WP_BUILD_ONLY=1` stops it after the docbuild, with
the built copy at `build/WolframPhysics`, for a machine that builds but must not deploy, and
`WP_PUBLISH_DRY_RUN=1` rehearses the whole run (publish stops after the scrape and
`build_site` runs under `DRYRUN=1`). The installable archive is a separate, cloud-free
path: `scripts/build_paclet.wls` archives `WolframPhysics/` as it stands into `dist/`
(the built notebooks ship in it, so `./build_docs.sh` comes first or the archive
carries no documentation), and `scripts/install_local.wls` builds that archive in a
scratch directory, uninstalls every installed copy and installs it
(`WP_INSTALL_DRY_RUN=1` prints what would change and changes nothing).

The notebooks are build artifacts. They are ignored by git, a clone has none, and
`./build_docs.sh` writes them from the markdown that is in git. So the build is not an
optional first step of this pipeline, it is where the shipped pages come from, and
nothing a deploy writes is ever left behind as an uncommitted file. Never skip it,
never deploy from notebooks an earlier session built unless you have just rebuilt
them: `scripts/docbuild.wls` fails a build whose notebooks are missing or older than
their markdown, which is the backstop, not the plan.

## The account, and the dry run

- The account is resolved at deploy time, never hardcoded. `publish.wls` and
  `build_site.wls site` connect from `WOLFRAM_CLOUD_USER` / `WOLFRAM_CLOUD_PASSWORD`
  when those are set (in the environment, or in the gitignored `.env`, loaded with
  `set -a; . ./.env; set +a`; the file is plain `KEY=VALUE` lines, and without
  `set -a` the variables never reach the wolframscript child process), and otherwise
  use the login the kernel already holds. The developer machine's cached login is
  `nikm`, so the live targets are
  `https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/WolframPhysics`
  and `https://www.wolframcloud.com/obj/nikm/WolframPhysics`.
- Every deploying script prints the account it will write to, and the target, before
  it writes anything: `publish: connected as <id> (<cloud root>)` followed by
  `publish: target <root>/DeployedResources/Paclet/WolframInstitute/WolframPhysics`, and
  `build_site`'s `connected as` line with the account base. Gate the run on those
  lines: read the account before letting the run continue, and on a wrong account kill
  the process group immediately. A cached personal session sends the whole deploy to
  that person's cloud in silence otherwise.
- Always the dry run first. `WP_PUBLISH_DRY_RUN=1` does everything up to and including
  the scrape (connect, fill the Paclet Repository categories, rasterize the hero image
  from the definition notebook and check its size, scrape the resource, list the
  definition check's findings by level) and prints the account and the location a
  deploy would write, then stops. `DRYRUN=1` on `build_site.wls` prints the navigation
  it read from the markdown and stops. Read what each prints; the deploy replaces
  whatever resource is live at that location.
- A deploy from a tree that is not `main` at the commit CI would deploy, or from a
  tree with uncommitted documentation markdown, needs the user's explicit say-so,
  because the next CI publish on `main` replaces it. Locally built notebooks are not
  uncommitted work; they are what this pipeline builds every time.

## Launching

- Run the long scripts (`publish.wls` and `build_site.wls site` especially) as
  harness-tracked background jobs. `nohup ... &` from a tool shell dies with the tool
  timeout (the whole process group is signalled), and bare `setsid ... &` leaves you
  tracking the wrong PID.
- Export the environment in the same tool call that launches the job (`.env`, the
  display, any `WP_*` knobs); environment does not persist between tool calls.
- A headless front end. `scripts/docbuild.wls` and `publish.wls` drive
  DocumentationBuild and the resource scraper through the Front End, which can crash on
  a desktop X display partway into a build; the scripts set `QT_QPA_PLATFORM=offscreen`
  where they need it, and a local run on Linux without a display sets it too. This is
  a kept workaround for an upstream front-end fault, explained where the scripts set
  it.
- Time-box every cloud step you drive yourself. The scrape plus `CloudDeploy` inside
  `publish.wls` runs under a `TimeConstrained` of `WP_SCRAPE_TIMEOUT` seconds (default
  3600): a scrape that hangs would otherwise hold the kernel forever, and a full deploy
  that exceeds the window ends with the doc-page merge done and the resource shingle
  not updated. Raise the knob for a large tree rather than removing the cap.

## Monitoring

- Progress during the docbuild is the built-notebook count under `build/WolframPhysics`
  (`find build/WolframPhysics -name '*.nb' | wc -l`), not the log: the docbuild prints
  nothing per page. The deploy narrates itself: `deploy_common.wls` routes the resource
  system's progress events to the log (`deploy: ...` lines, one per documentation page
  once the merge starts) and prints the changed/unchanged counts of the merge.
- Working versus wedged: working means the main kernel is in state R at high CPU with
  established sockets and pages appearing at their URLs; wedged means a flat count for
  15 or more minutes. Check before killing anything.
- Time-box every probe (`timeout`, `TimeConstrained`); a probe running far past its
  expected time is a broken probe, not hard work. A scrape alone (`ScrapeResource` on
  the definition notebook, no deploy) takes about 90 seconds when healthy; the full
  scrape plus deploy step runs tens of minutes, so do not judge it by the probe
  timescale.
- Kill Wolfram processes by exact name (`pkill -x WolframKernel`, `pkill -x WolframNB`);
  a `-f` pattern that appears in your own command line kills your own shell.
- Ignore benign log noise: `FrontEndObject::notavail` (no front end for a step that
  does not need one), the `StringTake::take` the scripts switch off (a harmless message
  from DocumentationBuild's hyperlink rewrite on an empty segment, explained where
  `deploy_common.wls` sets `Off[StringTake::take]`), autorelease-pool lines, and
  `DocumentationBuild::warning` about See Also links to pages not yet written.
- The documentation merge uploads the built pages as a delta against a manifest in
  the account and never purges what is there (the stock deploy deletes the target
  directory first, which 404s every page for the whole redeploy), so a page removed
  from the tree stays live until a full upload; `WP_UPLOAD_DELTA=0` forces one, and
  that is the fix for a stale page or any cloud-side drift, not a manual delete. The
  other `deploy_common.wls` knobs are `WP_SKIP_PERMS=1` (skip the permissions pass)
  and `WP_SCRAPE_TOLERANT=1` (deploy past Error-level definition-notebook findings the
  dry run lists); the script header explains each.

## Verify

Fetch the live URLs and confirm the specific change that motivated the deploy (for
example, count the External Links entries on the resource home page, or open the doc
page that changed through the site shell). Exit status alone is not success: judge a
deploy by the live artifacts.

## CI

Merges to `main` deploy automatically: `.github/workflows/build_paclet.yml` runs the
check job (the python gates under `tools/dev/`, then lint, the tests and the
doc-example runner in the Wolfram container, then the packed `.paclet` archive as the
run's artifact) on every push to `main` and every pull request against it, and on
`main` the publish job runs `scripts/prime_ci.sh`,
which provisions a Prime Intellect CPU pod running the Wolfram image, runs
`scripts/build_all.wls` there, and always tears the pod down. The workflow's secrets
(`PRIME_API_KEY`, `PRIME_SSH_KEY`, `WP_MATHPASS_B64` or else
`WOLFRAMSCRIPT_ENTITLEMENTID`, `WOLFRAM_CLOUD_USER` / `WOLFRAM_CLOUD_PASSWORD`) are
validated against the live services and pushed from the local `.env`, `.mathpass` and
SSH key by `scripts/sync_ci_secrets.sh` (the Prime key and the cloud login are checked
against the live services, the SSH key, mathpass and entitlement locally); `--check`
validates without pushing. Run it whenever a CI run fails on credentials: an expired
Prime key does not announce itself. `WP_TEAM_ID`, the Prime team whose wallet funds
the pod, is a repository variable rather than a secret. `scripts/prime_ci.sh` is
runnable from a checkout with the same environment (its header lists the pod knobs:
`WP_VCPUS`, `WP_DISK`, `WP_IMAGE`, `WP_KEEP_POD`, `WP_TEAM_ID`), and it forwards
`WP_BUILD_ONLY` and `WP_PUBLISH_DRY_RUN` into the build container, so the pod can be
exercised without deploying (`DRYRUN` on its own is not forwarded: `publish.wls` does
not read it, so a `DRYRUN`-only run would deploy the resource for real). A CI deploy
is verified the same way as a local one, by the live artifacts.
