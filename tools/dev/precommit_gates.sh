#!/usr/bin/env bash
# The repository-completeness gates CI runs, run BEFORE a commit exists, so a push never goes
# red on a check that costs seconds locally: the three python gates over the tree (the
# documentation names only symbols the paclet exports; the guide hierarchy holds together; every
# web link the sources carry serves a page) and the house-style lint over every markdown file
# (scripts/lint_docs.wls).
# Notebook freshness is not a gate here: the built notebooks are not tracked in git, so no commit
# can carry a stale one. That guarantee lives on the build side, where the notebooks are read:
# scripts/docbuild.wls and scripts/build_paclet.wls refuse a tree whose notebooks are missing or
# older than the markdown (wpRequireBuiltDocs in scripts/deploy_common.wls).
# The Wolfram test suite and the doc-example runner are not here: they take a kernel and
# minutes, and CI runs them in the Wolfram container. Ported from HypergraphRewritingEngine's
# tools/dev/precommit_gates.sh; the gates it runs are this repository's.
#
# Install on a clone:  ln -sf ../../tools/dev/precommit_gates.sh .git/hooks/pre-commit
#
# Knobs:
#   WP_SKIP_LINT=1   do not run scripts/lint_docs.wls (a machine without wolframscript); the
#                    lint still runs in CI. Without it, a missing wolframscript FAILS the gate,
#                    because a gate that silently skips is not a gate.
#   WP_SKIP_LINKS=1  do not fetch the documentation's web links (a machine without network);
#                    tools/dev/doc_links_check.py reads it and says so, and CI still checks them.
# Exit: 0 every gate passed, 1 otherwise.
set -uo pipefail
cd "$(git rev-parse --show-toplevel)" || exit 1
fail=0

# A reference page or a paclet: link must be for a symbol the Kernel exports.
python3 tools/dev/doc_symbols_check.py || fail=1

# The guide hierarchy is a tree the sidebar is built from: every guide reachable from the root,
# one parent each, linked headings only on the root and the area hubs, reciprocal RelatedGuides,
# and Name, basename and URI tail in agreement.
python3 tools/dev/doc_guide_graph_check.py || fail=1

# Every web link in the documentation sources serves a page (the guide is an index of links
# into the Function Repository, other paclets, GitHub and the web).
python3 tools/dev/doc_links_check.py || fail=1

# The markdown house style: code spans, $ balance, math words, table headers, dated markers.
if [ "${WP_SKIP_LINT:-0}" = "1" ]; then
    echo "pre-commit: WP_SKIP_LINT=1, scripts/lint_docs.wls not run here (CI runs it)"
elif command -v wolframscript >/dev/null 2>&1; then
    wolframscript -f scripts/lint_docs.wls || fail=1
else
    echo "pre-commit: wolframscript not found, so scripts/lint_docs.wls cannot run; install the" \
         "Wolfram Engine, or set WP_SKIP_LINT=1 to leave the lint to CI" >&2
    fail=1
fi

exit $fail
