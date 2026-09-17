#!/usr/bin/env python3
"""Check the shipped documentation against the symbols the paclet exports.

WHY THIS EXISTS. The Kernel sources under WolframPhysics/Kernel declare the paclet's public
surface with PackageExported[...]. The documentation is authored as markdown under docs/en and
built into notebooks under WolframPhysics/Documentation/English by scripts/build_notebooks.wls
(build artifacts, not in git). A source page is written once and outlives the symbol it
documents: the build keeps converting it and the stale sweep keeps it, because a source still
maps to it, so a reference page for a symbol the paclet no longer exports ships inside the
archive, describing a call a user cannot make. Ported from
HypergraphRewritingEngine's tools/dev/doc_symbols_check.py; the export declaration it reads is
this repository's.

TWO CHECKS, both mechanical, over the markdown sources and over the built notebooks when a
build has written them (the sources because they are the source of truth and the only thing a
checkout carries; the notebooks, where present, because they are what ships):

  ORPHAN PAGE   ReferencePages/Symbols/<Name>.nb (or .md) where <Name> is not exported
  DEAD LINK     a page links to paclet:<this paclet>/ref/<Name> for a <Name> that is not
                exported or has no reference page, or to /guide/<Name> or /tutorial/<Name>
                for a <Name> with no such page

The second matters on its own: removing a page while leaving the guide entry turns a wrong
page into a broken link, which is not an improvement.

EXPORTED SYMBOLS. Every PackageExported[...] under WolframPhysics/Kernel/**/*.wl, in either of
the forms the Kernel uses: one symbol, PackageExported[Name], or a list, PackageExported[{A, B,
...}], which may run over several lines. Comments are stripped first, so a section marker such
as (*PackageExported*) is not a declaration. The list is read from the source text; the paclet
does not have to load, and no kernel is needed.

LINK NAMES. A page is named by its frontmatter Name, which is also the URI tail:
paclet:WolframInstitute/WolframPhysics/ref/X is ReferencePages/Symbols/X. So a link resolves
exactly when a file of that name exists, and the check is a lookup rather than a title search.
A source may sit in a category directory under its kind directory (the build is flat by
basename), so the page set of a kind is collected from every depth under it.
A link whose tail is not a page name at all (a title with spaces) is a dead link for the same
reason. Links into other paclets and into the system documentation (paclet:ref/Graph, which
is what a built-in chip such as `Graph` (WL) becomes) are outside this paclet and are not
examined; nor are the markdown hyperlinks the root guide uses for functions that live in the
Function Repository, in other paclets or on the web. In a notebook a long string is wrapped
with a backslash-newline, and it is wrapped mid-name, so the wrap is undone before matching.

WHAT THIS CANNOT CONCLUDE. It does not check that a page's CONTENT is accurate, only that
its subject exists. A page documenting an exported symbol incorrectly reads as fine here.

Usage:  python3 tools/dev/doc_symbols_check.py        (from anywhere; paths are relative to
        the repository this file sits in)
Exit:   0 clean, 1 findings or a tree the check cannot read (no Kernel sources, no
        PackageExported declaration, no PacletInfo.wl Name). The count is printed; the status
        only says whether the check passed.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
PACLET_DIR = os.path.join(ROOT, "WolframPhysics")
KERNEL_DIR = os.path.join(PACLET_DIR, "Kernel")
PACLET_INFO = os.path.join(PACLET_DIR, "PacletInfo.wl")
SRC = os.path.join(ROOT, "docs", "en")
DOCS = os.path.join(PACLET_DIR, "Documentation", "English")

# The kind in a documentation URI -> the directory that holds pages of that kind, the same
# under docs/en (.md) and English/ (.nb).
KIND_DIR = {
    "ref": os.path.join("ReferencePages", "Symbols"),
    "guide": "Guides",
    "tutorial": "Tutorials",
}
# A frontmatter list in a source page -> the kind of link the converter builds from its entries.
FRONTMATTER_LINKS = {"SeeAlso": "ref", "RelatedGuides": "guide", "RelatedTutorials": "tutorial"}

# A WL comment. Comments nest in the language and this does not follow nesting, but the only
# use here is to blank them before the declaration scan, and a nested comment's tail cannot
# form a PackageExported[...] on its own.
COMMENT_RE = re.compile(r'\(\*.*?\*\)', re.DOTALL)
# PackageExported[Name] or PackageExported[{A, B, ...}], whitespace and newlines anywhere
# inside. A symbol list carries no braces of its own, so the first closing brace ends it.
EXPORT_RE = re.compile(r'PackageExported\[\s*(\{[^}]*\}|[A-Za-z$][A-Za-z0-9$]*)\s*\]', re.DOTALL)
NAME_RE = re.compile(r'[A-Za-z$][A-Za-z0-9$]*')
CONTINUATION_RE = re.compile(r'\\\r?\n')
FRONTMATTER_RE = re.compile(r'\ufeff?---\r?\n(.*?)\r?\n---(?:\r?\n|$)', re.DOTALL)


def kernel_sources():
    """Every .wl under WolframPhysics/Kernel, at any depth, in a fixed order."""
    out = []
    for dirpath, dirs, files in os.walk(KERNEL_DIR):
        dirs[:] = sorted(d for d in dirs if not d.startswith("."))
        out += [os.path.join(dirpath, n) for n in sorted(files) if n.endswith(".wl")]
    return out


def exported_symbols(paths):
    """The set of symbol names every PackageExported[...] in the given sources declares."""
    out = set()
    for path in paths:
        with open(path, errors="replace") as f:
            text = COMMENT_RE.sub("", f.read())
        for inner in EXPORT_RE.findall(text):
            out.update(NAME_RE.findall(inner))
    return out


def paclet_name():
    with open(PACLET_INFO, errors="replace") as f:
        m = re.search(r'"Name"\s*->\s*"([^"]+)"', f.read())
    if not m:
        sys.exit(f'{PACLET_INFO} has no "Name" -> "..." entry; the link scan needs the '
                 f"paclet's URI prefix")
    return m.group(1)


def link_res(paclet):
    """Link regexes for a notebook (the tail runs to the closing quote, so a title with spaces
    is captured whole) and for markdown (the tail ends at whitespace or a link delimiter)."""
    head = r'paclet:' + re.escape(paclet) + r'/(ref|guide|tutorial)/'
    return re.compile(head + r'([^"]*)'), re.compile(head + r'([^"\s)\]>]*)')


def frontmatter_links(text):
    """(kind, name) pairs from the SeeAlso / RelatedGuides / RelatedTutorials lists."""
    m = FRONTMATTER_RE.match(text)
    if not m:
        return []
    out = []
    for key, kind in FRONTMATTER_LINKS.items():
        km = re.search(r'^' + key + r':\s*\[(.*?)\]\s*$', m.group(1), re.M)
        if km:
            out += [(kind, n.strip().strip('"')) for n in km.group(1).split(",") if n.strip()]
    return out


def pages(root, ext):
    """{kind: set of page names} under root, by kind directory, at any depth below it (the
    sources may sit in category directories; the built notebooks are flat by basename)."""
    out = {}
    for kind, d in KIND_DIR.items():
        names = set()
        for dirpath, dirs, files in os.walk(os.path.join(root, d)):
            dirs[:] = sorted(x for x in dirs if not x.startswith("."))
            names |= {n[:-len(ext)] for n in files if n.endswith(ext)}
        out[kind] = names
    return out


def check_tree(root, ext, exported, link_re, findings):
    """ORPHAN and DEADLINK over one tree: docs/en with .md, or English/ with .nb. Returns the
    number of pages scanned."""
    label = "source" if ext == ".md" else "notebook"
    have = pages(root, ext)
    ref_dir = KIND_DIR["ref"]
    for name in sorted(have["ref"]):
        if name not in exported:
            findings.append(
                f"ORPHAN   {os.path.relpath(os.path.join(root, ref_dir), ROOT)}/{name}{ext} "
                f"documents `{name}`, which the Kernel does not export. It ships, so a user "
                f"reads a page for a call they cannot make.")

    scanned = 0
    for dirpath, dirs, files in os.walk(root):
        dirs[:] = sorted(d for d in dirs if not d.startswith("."))
        for name in sorted(files):
            if not name.endswith(ext):
                continue
            path = os.path.join(dirpath, name)
            rel = os.path.relpath(path, ROOT)
            with open(path, errors="replace") as f:
                text = CONTINUATION_RE.sub("", f.read())
            links = set(link_re.findall(text))
            if ext == ".md":
                # A bare paclet: URL in prose can end a sentence; the punctuation is not the name.
                links = {(k, tail.rstrip(".,;:!?")) for k, tail in links}
                links |= set(frontmatter_links(text))
            scanned += 1
            for kind, tail in sorted(links):
                if not NAME_RE.fullmatch(tail):
                    findings.append(
                        f"DEADLINK {rel} links to {kind}/{tail!r}, which is not a page name: "
                        f"a page is addressed by its Name (the file's basename), not by a "
                        f"title. The link resolves to no page.")
                elif kind == "ref" and tail not in exported:
                    findings.append(
                        f"DEADLINK {rel} links to `{tail}`, which the Kernel does not "
                        f"export. The link resolves to no page.")
                elif tail not in have[kind]:
                    findings.append(
                        f"DEADLINK {rel} links to {kind}/{tail}, and there is no {label} page "
                        f"{os.path.join(KIND_DIR[kind], tail + ext)} under "
                        f"{os.path.relpath(root, ROOT)}/. The link resolves to no page.")
    return scanned


def main():
    if not os.path.isdir(KERNEL_DIR):
        sys.exit(f"{KERNEL_DIR} does not exist; run this inside the repository")
    if not os.path.isfile(PACLET_INFO):
        sys.exit(f"{PACLET_INFO} does not exist; the link scan needs the paclet's URI prefix")

    sources = kernel_sources()
    exported = exported_symbols(sources)
    if not exported:
        sys.exit(f"found no PackageExported[...] in {len(sources)} Kernel source(s) under "
                 f"{os.path.relpath(KERNEL_DIR, ROOT)}; refusing to report every page as an "
                 f"orphan on what is more likely a parse failure here")

    nb_re, md_re = link_res(paclet_name())
    findings = []
    counts = []
    if os.path.isdir(SRC):
        counts.append(f"{check_tree(SRC, '.md', exported, md_re, findings)} source page(s)")
    else:
        counts.append(f"no sources under {os.path.relpath(SRC, ROOT)}")
    if os.path.isdir(DOCS):
        counts.append(f"{check_tree(DOCS, '.nb', exported, nb_re, findings)} notebook(s)")
    else:
        counts.append(f"no built notebooks under {os.path.relpath(DOCS, ROOT)}")

    for f_ in findings:
        print(f_)
    print(f"\n{len(findings)} findings over {' and '.join(counts)}, against {len(exported)} "
          f"exported symbol(s) from {len(sources)} Kernel source(s): {', '.join(sorted(exported))}")
    # 1, not the count. sys.exit() takes the low 8 bits of what it is given, so a run with
    # exactly 256 findings (or 512) exits 0 and the gate reports success on its worst result.
    # The count is already printed above; the STATUS only has to say whether the check passed.
    return 1 if findings else 0


if __name__ == "__main__":
    sys.exit(main())
