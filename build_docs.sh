#!/bin/bash
# Build the paclet documentation notebooks from the markdown sources under docs/en/
# (Guides, Tutorials, ReferencePages/Symbols) into WolframPhysics/Documentation/English/, and
# docs/ResourceDefinition.md into WolframPhysics/ResourceDefinition.nb.
#
# Turnkey: vendors MarkdownToNotebook (git submodule), finds wolframscript on PATH and runs
# scripts/build_notebooks.wls. No manual checkout, no paths to pass. Every argument is passed
# through to the script (order-independent):
#
#   ./build_docs.sh                  generate + evaluate examples (renders the paclet's output)
#   ./build_docs.sh structure        input-only cells into docs/en/.generated/ (gitignored): the
#                                    page layout without evaluating anything; never touches
#                                    WolframPhysics/Documentation/English/, which holds evaluated
#                                    notebooks only
#   ./build_docs.sh only=<regex>     build only the sources whose basename matches <regex>
#
# Knobs (read by scripts/build_notebooks.wls):
#   WP_MTN_SOURCE   an explicit MarkdownToNotebook.wl (or the directory holding one) to convert
#                   with instead of the submodule checkout
#
# Prerequisites: wolframscript on PATH (Wolfram Engine or Mathematica, 15.0+); git for the
# one-time submodule fetch. Exit status: 0 when every notebook wrote and verified (the script's
# .build_ok sentinel), 1 otherwise.
#
# The built notebooks are build artifacts, ignored by git: the markdown under docs/en is the
# source of truth, this script is what produces the pages the paclet ships, and every publish
# runs it first. The build is incremental and sweeps notebooks that no source maps to any more
# (see the script header).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

# Label the run for the messages below, and learn where the sentinel lands; the arguments
# themselves go through untouched.
MODE=""
for a in "$@"; do
    [[ "$a" == structure ]] && MODE="structure"
done
ENGLISH="WolframPhysics/Documentation/English"
# Structure mode lands outside the shipping tree (scripts/build_notebooks.wls does the same when
# run directly): the shipping tree holds evaluated notebooks only, and an input-only one there
# would be packed and deployed as a page whose examples show no output.
GENERATED="docs/en/.generated"
TARGET="$ENGLISH"
[[ "$MODE" == structure ]] && TARGET="$GENERATED"
SCRIPT="$ROOT/scripts/build_notebooks.wls"

# 1. The converter is MarkdownToNotebook from the tools/MarkdownToNotebook submodule, whose
#    pointer follows the commit deployed as the public resource function; the build falls back
#    to the deployed resource only when the checkout is missing. Initialise the submodule here
#    when it is absent so a fresh clone builds offline; never patch it.
if [[ ! -f tools/MarkdownToNotebook/MarkdownToNotebook.wl ]]; then
    echo "==> fetching the MarkdownToNotebook submodule"
    # NOT --recursive: its own example submodules are SSH-only and the converter is all that is needed.
    git submodule update --init tools/MarkdownToNotebook || echo "   (no submodule; the build will use the deployed resource function)"
fi

# 2. wolframscript must be on PATH: the build runs the Wolfram kernel natively on this machine.
if ! command -v wolframscript >/dev/null 2>&1; then
    echo "error: wolframscript not found on PATH (install Wolfram Engine or Mathematica, or add its bin directory to PATH)" >&2
    exit 1
fi

# 3. Build the notebooks. wolframscript can exit non-zero on the benign exit-time license-release
#    message ("The product exited because of a license error") even after a clean DONE, so the
#    result is judged on build_notebooks.wls's .build_ok sentinel, which is written only after
#    every notebook wrote and verified, never on the process exit code.
echo "==> building documentation notebooks (${MODE:-full evaluation})"
set +e
wolframscript -file "$SCRIPT" "$@"
ws_rc=$?
set -e
if [[ ! -f "$TARGET/.build_ok" ]]; then
    echo "error: documentation generation did not complete (wolframscript rc=$ws_rc)." >&2
    exit 1
fi
rm -f "$TARGET/.build_ok"
if [[ "$MODE" == structure ]]; then
    echo "==> done: input-only notebooks in $TARGET/ ($ENGLISH/ untouched; the shipped notebooks come from a full build)"
else
    echo "==> done: notebooks in $TARGET/"
fi
