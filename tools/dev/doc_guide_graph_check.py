#!/usr/bin/env python3
"""Check the invariants of the guide hierarchy under docs/en/Guides.

WHY THIS EXISTS. The guides are no longer one page: they are a tree of 35, and the tree itself
is data. A parent names its children with a linked "### " heading whose target is
paclet:WolframInstitute/WolframPhysics/guide/<Name>, and scripts/build_site.wls walks those
headings from the root to build the documentation sidebar. Nothing else records the shape. So a
dropped heading, a one-sided RelatedGuides, or a Name that has drifted from its filename all
ship green today: build_site.wls exits non-zero only on a basename collision and a duplicate nav
id, and prints an unreachable guide as a log line before continuing with exit 0. Losing a whole
branch of the documentation should fail a gate, not scroll past in a build log.

THE INVARIANTS, each a hard failure:

  UNREACHABLE    a guide the root does not reach through linked "### " headings
  IN-DEGREE      a guide linked by other than exactly one parent (the root is linked by none)
  HEADING ROLE   a linked "### " heading on a page that is neither the root nor an eponymous
                 <Area>/<Area>.md hub; on a leaf such a heading is not a cross-reference but a
                 new parent-to-child edge that silently reparents an area
  DANGLING       a "### " heading target or a RelatedGuides entry naming no page
  RECIPROCITY    a parent and a child that do not name each other in RelatedGuides
  IDENTITY       frontmatter Name not equal to the file basename or to the URI tail
  COLLISION      two pages sharing a Name (the build writes notebooks flat by basename)

Run from the repository root. Exit: 0 every invariant holds, 1 otherwise.
"""
import os
import re
import sys

PACLET = "WolframInstitute/WolframPhysics"
GUIDES = os.path.join("docs", "en", "Guides")
ROOT = "WolframPhysics"

HEADING = re.compile(
    r"^###\s+\[[^\]]*\]\(paclet:" + re.escape(PACLET) + r"/guide/(\w+)\)\s*$", re.M
)
FRONT = re.compile(r"\A---\n(.*?)\n---\n", re.S)


def field(front, key):
    m = re.search(r"^" + key + r":[ \t]*(.*(?:\n[ \t]+.*)*)$", front, re.M)
    return m.group(1).strip() if m else None


def flowlist(value):
    if value is None:
        return []
    value = value.strip()
    if value.startswith("[") and value.endswith("]"):
        value = value[1:-1]
    return [x.strip() for x in value.replace("\n", " ").split(",") if x.strip()]


def main():
    if not os.path.isdir(GUIDES):
        print(f"doc_guide_graph_check: no {GUIDES} directory; run from the repository root")
        return 1
    pages = {}
    problems = []
    for dirpath, _dirnames, filenames in os.walk(GUIDES):
        for filename in sorted(filenames):
            if not filename.endswith(".md"):
                continue
            path = os.path.join(dirpath, filename)
            base = filename[:-3]
            text = open(path, encoding="utf-8").read()
            m = FRONT.match(text)
            front = m.group(1) if m else ""
            body = text[m.end():] if m else text
            page = {
                "path": path,
                "base": base,
                "folder": os.path.basename(dirpath),
                "name": field(front, "Name"),
                "uri": field(front, "URI"),
                "related": flowlist(field(front, "RelatedGuides")),
                "children": HEADING.findall(body),
            }
            if base in pages:
                problems.append(f"COLLISION two pages share the name {base}: "
                                f"{pages[base]['path']} and {path}")
            pages[base] = page

    if ROOT not in pages:
        problems.append(f"no root guide {ROOT}.md under {GUIDES}")
        for line in problems:
            print("doc_guide_graph_check: " + line)
        return 1

    # IDENTITY and HEADING ROLE
    for base, page in sorted(pages.items()):
        if page["name"] != base:
            problems.append(f"IDENTITY {page['path']}: Name {page['name']!r} is not the "
                            f"basename {base!r}")
        tail = (page["uri"] or "").rsplit("/", 1)[-1]
        if tail != base:
            problems.append(f"IDENTITY {page['path']}: URI tail {tail!r} is not the "
                            f"basename {base!r}")
        is_hub = base == ROOT or base == page["folder"]
        if page["children"] and not is_hub:
            problems.append(f"HEADING ROLE {page['path']} is a leaf but carries linked "
                            f"guide headings: {', '.join(page['children'])}")

    # DANGLING
    for base, page in sorted(pages.items()):
        for child in page["children"]:
            if child not in pages:
                problems.append(f"DANGLING {page['path']}: heading links guide {child}, "
                                "which has no page")
        for other in page["related"]:
            if other not in pages:
                problems.append(f"DANGLING {page['path']}: RelatedGuides names {other}, "
                                "which has no page")

    # IN-DEGREE
    indegree = {base: 0 for base in pages}
    for page in pages.values():
        for child in page["children"]:
            if child in indegree:
                indegree[child] += 1
    for base in sorted(pages):
        want = 0 if base == ROOT else 1
        if indegree[base] != want:
            problems.append(f"IN-DEGREE {pages[base]['path']}: linked by "
                            f"{indegree[base]} parent(s), expected {want}")

    # UNREACHABLE
    seen = set()
    stack = [ROOT]
    while stack:
        base = stack.pop()
        if base in seen:
            continue
        seen.add(base)
        stack.extend(c for c in pages[base]["children"] if c in pages)
    for base in sorted(set(pages) - seen):
        problems.append(f"UNREACHABLE {pages[base]['path']}: the root does not reach it")

    # RECIPROCITY
    for base, page in sorted(pages.items()):
        for child in page["children"]:
            if child not in pages:
                continue
            if child not in page["related"]:
                problems.append(f"RECIPROCITY {page['path']}: links child {child} but does "
                                "not name it in RelatedGuides")
            if base not in pages[child]["related"]:
                problems.append(f"RECIPROCITY {pages[child]['path']}: is linked by {base} "
                                "but does not name it in RelatedGuides")

    for line in problems:
        print("doc_guide_graph_check: " + line)
    print(f"doc_guide_graph_check: {len(pages)} guides, "
          f"{'; '.join([f'{len(problems)} problem(s)']) if problems else 'every invariant holds'}")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
