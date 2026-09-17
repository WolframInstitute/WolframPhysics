#!/usr/bin/env bash
# The commit-message contract, checked on the message being committed (pre-commit cannot: it
# runs before the message exists). A message has a subject line, and it keeps the house style
# scripts/lint_docs.wls holds the markdown to, because git log and the GitHub history render a
# message the way a page renders prose: no em dash (U+2014), no box-drawing characters
# (U+2500 to U+257F), and no " -- " standing in for a dash. Comment lines (#) and the
# trailers git appends are read like any other line. Ported from HypergraphRewritingEngine's
# tools/dev/commit_msg_gate.sh; the contract it checks is this repository's.
#
# Install on a clone:  ln -sf ../../tools/dev/commit_msg_gate.sh .git/hooks/commit-msg
#
# Usage: tools/dev/commit_msg_gate.sh <message-file>     (git passes the file)
# Exit:  0 the message passes, 1 a finding (printed with its line number), 2 no message file.
set -uo pipefail
cd "$(git rev-parse --show-toplevel)" || exit 1
[ -n "${1:-}" ] && [ -r "$1" ] || { echo "commit-msg: no message file given" >&2; exit 2; }
exec python3 - "$1" <<'PY'
import re
import sys

path = sys.argv[1]
lines = open(path, encoding="utf-8", errors="replace").read().splitlines()
findings = []

# The subject: the first line that is not a comment and not blank.
if not any(line.strip() and not line.startswith("#") for line in lines):
    findings.append("no subject line: the message is empty apart from comments")

for n, line in enumerate(lines, 1):
    if line.startswith("#"):
        continue
    if "\u2014" in line:
        findings.append(f"line {n}: em dash (U+2014); write a comma, a colon or a full stop")
    if re.search("[\\u2500-\\u257f]", line):
        findings.append(f"line {n}: box-drawing character; the message is plain text")
    if " -- " in line:
        findings.append(f'line {n}: " -- " used as a dash; write a comma, a colon or a full stop')

for f in findings:
    print(f"commit-msg: {f}", file=sys.stderr)
sys.exit(1 if findings else 0)
PY
