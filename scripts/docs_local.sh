#!/usr/bin/env bash
#
# Build the local documentation site and serve it over http://localhost.
#
# The site is the single-page documentation browser that scripts/build_site.wls assembles: the
# tree of this paclet's pages on the left, one page in a frame beside it. This is the CLOUD-FREE
# half of it. No CloudConnect and no CloudDeploy, and no network at all: the authoring notebooks
# under WolframPhysics/Documentation/English are rendered to static HTML by a headless front end,
# the fonts come from the bundle the render ships, and Python's standard library server serves
# the result. It is how a documentation change is read as a reader will read it, before anything
# is published.
#
#   scripts/docs_local.sh                                 build every page, then serve on :8000
#   PORT=9000 scripts/docs_local.sh                       serve on another port
#   WP_LOCAL_ONLY=WolframPhysics scripts/docs_local.sh    render that page again; the rest from the cache
#   WP_HTML_CACHE=0 scripts/docs_local.sh                 ignore the cache and render every page
#   scripts/docs_local.sh --help                          this text
#
# The first build renders every page and takes minutes; afterwards a page whose notebook has not
# changed is served from the cache under build/local-docs-cache, so a rebuild takes seconds. The
# site itself is build/local-docs, the documentation build's own output goes to
# build/local-docs-render.log, and all of build/ is gitignored. A build that does not deliver
# every page with every image it references stops here with a non-zero exit, leaves the previous
# site as it was, and the server is not started.
#
# Prerequisites: wolframscript, a front end, python3, and the authoring notebooks (./build_docs.sh).
# Exit status: that of the build when it fails; otherwise the server runs until interrupted.
set -euo pipefail

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
	# the header comment above is the help text, up to the first line that is not a comment
	awk 'NR > 1 && /^#/ { sub(/^# ?/, ""); print; next } NR > 1 { exit }' "$0"
	exit 0
fi

repo="$(cd "$(dirname "$0")/.." && pwd)"
wolframscript -file "$repo/scripts/build_site.wls" local
PORT="${PORT:-8000}"
printf '\nserving %s at http://localhost:%s  (Ctrl-C to stop)\n' "$repo/build/local-docs" "$PORT"
exec python3 -m http.server --directory "$repo/build/local-docs" "$PORT"
