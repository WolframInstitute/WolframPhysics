---
name: wolfram-guide-page
description: "Author, repair, or reorganize a WolframPhysics guide page under `docs/en/Guides/`: the root `docs/en/Guides/WolframPhysics.md`, an area hub `docs/en/Guides/<Area>/<Area>.md`, or a leaf page beside it, with their placement in the body-link guide DAG, reciprocal `RelatedGuides`, parent summaries and tutorial backlinks. A guide organizes a topic's vocabulary by subject, drawing on three pools: the paclet's own symbols (none yet), built-in Wolfram Language functions, and functions that live elsewhere in the Wolfram Physics ecosystem (the Function Repository, published paclets, GitHub, Wolfram Community, wolframphysics.org), which are listed as links with a provenance tag, or under a per-source section heading that carries the provenance for every entry beneath it. Use this whenever the user wants to create or change a guide, audit guide coverage or hierarchy completeness, add or split out a topic, fold in built-ins or ecosystem functions, reorganize sections, or rewrite a guide abstract. Trigger even when the user only provides a guide path or a topic name without saying \"guide\"."
---

# Authoring a WolframPhysics guide page

A guide page is the thematic landing page for one area of the
`WolframInstitute/WolframPhysics` paclet. It does not document a single symbol (that
is the [wolfram-symbol-page](../wolfram-symbol-page/SKILL.md) skill); it organizes an
area's vocabulary into titled sections, each highlighting the relevant functions with
one-line descriptions, under a short abstract. The sources live under
`docs/en/Guides/` and build to `WolframPhysics/Documentation/English/Guides/<Name>.nb`
with `scripts/build_notebooks.wls` (wrapper: `./build_docs.sh`). The markdown is the
source of truth; a built notebook is a build artifact, ignored by git and rebuilt by
every publish (CONTRIBUTING.md, "Building the documentation"). Never hand-edit one.

The page is content-first. It is organized by the subject (hypergraph rewriting,
Wolfram models, multiway systems, causal and branchial structure, rulial space,
multicomputation), not by where a function comes from. Model it on a real Wolfram
Language guide page (e.g. `reference.wolfram.com/language/guide/GraphsAndNetworks.html`):
sections run from the fundamentals near the top to the advanced material lower down;
each section leads with the functions that matter to that topic, each on a bullet with
a short description; and a section (or the page) may close with a bare, unannotated
index of the lesser-used functions for the topic.

Your goal: a useful, ordered index of the topic's important functions, the ones a
reader actually reaches for to state a rule, run an evolution, build the graphs, and
explore the multiway and rulial structure. Draw them from three pools and intersperse
them by relevance to the topic, not by source:

1. WolframPhysics symbols: net-new symbols the paclet exports. Unmarked chips. There
   are none yet; the pool exists so the page needs no restructuring when the first one
   lands.
2. Built-in System functions: what the kernel already provides for the topic. A chip
   marked with a trailing `(WL)`.
3. Functions from elsewhere in the ecosystem: the Wolfram Function Repository, a
   published paclet (SetReplace, WolframInstitute/Hypergraph, Wolfram/Multicomputation,
   WolframInstitute/HypergraphRewriteEngine, ...), a GitHub repository, a Wolfram
   Community post, or a page on wolframphysics.org. A markdown link to the function's
   own page, its name as a code span inside the link, followed by a provenance tag in
   parentheses.

This third pool is the deliberate difference from a PureMath guide, where a Function
Repository function never goes in the body. Here it does, because the paclet's purpose
today is to index the ecosystem: a reader arrives to find out where a capability lives,
and the answer is often "in this resource function" or "in that paclet". That rule
is this repository's future state, entry by entry: once a WolframPhysics symbol
supersedes an external function, the external entry leaves the body (see *The future
state of an external entry* below).

Surveying the built-ins is not optional. The kernel ships dozens of functions a reader
uses with every object this field produces (`Graph` and its measures, layouts,
predicates and highlighting; `RulePlot`; the graph and network guide as a whole), and
those belong on the page, interspersed with the ecosystem functions by topic. Before
writing any section, survey what the kernel
already provides for that topic (the documentation, `Names` on likely stems and
synonyms). A page that lists only external functions and omits the built-ins a reader
needs beside them is incomplete.

The survey is also a gate, not just a coverage exercise. Listing the built-ins makes
the page complete; the same survey decides whether a proposed WolframPhysics symbol
should exist at all, and whether an external entry is really the best home for a
capability. This is the point in the pipeline where a duplicate is cheapest to stop,
before it has kernel code, tests, and a reference page. For every net-new symbol you are
about to chip, satisfy yourself that no built-in already does the job under any name:

- Search by what the operation does, not by the name you plan to give it. A clean
  `` Names["System`<Name>"] `` proves nothing: an audit of a sibling paclet's every
  export against every `` System` `` name found zero name collisions while real
  duplicates hid behind unrelated names (`SmithNormalForm` beside
  `SmithDecomposition`, `HeavisideExpansion` beside `InverseLaplaceTransform`). Search
  the documentation by capability.
- A near-match is a `(WL)` entry plus a note, not a silent net-new symbol. If a
  built-in nearly does the job, prefer chipping the built-in. Propose the WolframPhysics
  symbol only when you can state the difference in one line (typed return, wider domain,
  a different convention), and record that line: it becomes the required Properties and
  Relations example on the symbol's reference page.
- Verify against the repo's target kernel (WL 15.0 here, which is also what the paclet requires) and
  say which you used. Built-in coverage is `$VersionNumber`-dependent; a cloud or MCP
  evaluator may be older and will miss recent additions. A "no built-in exists" claim
  recorded without a version is not recheckable.

Mirror and extend the corresponding built-in system guide. The built-in
`guide/GraphsAndNetworks` is the completeness baseline for everything a reader applies
to a states, causal or branchial graph; the Wolfram Physics Project's own function guide
(`https://www.wolframcloud.com/obj/wolframphysics/Tools/guide-page`, linked from
`wolframphysics.org/tools` as "Guide to Wolfram Physics Project functions") is the
baseline for the project's resource functions. Every function on those pages that
belongs to this topic should appear on ours (as a
`(WL)`-marked chip or a tagged link), organized under our subject-first section
structure. Our page is then the Wolfram Physics view of that material: it mirrors the
system guide's functions and extends them with the ecosystem's and, in time, the
paclet's own. Note the counterpart you mirrored (in `RelatedGuides` where a guide link
fits, or in your summary) so a reviewer can check the correspondence.

Not every function in any pool needs a line. Highlight what matters to the section;
round out the topic with a bare index of lesser-used functions at the end.

## Read first

- [GUIDE.md](../../GUIDE.md), this repo's style guide and the single home of the design
  rules a guide page inherits. Load-bearing here: *Never require a wrapper around what
  the system already understands* (built-in and paclet symbols get identical treatment
  on the page, the provenance tag being the one sanctioned asymmetry, and that mechanism
  is provisional, so build nothing that depends on its exact spelling), *A name must say
  what the object is*, and its *Documentation* section. The guide-page rules themselves
  (ordering by centrality, reachability, hub versus leaf, never chipping a symbol that
  does not exist) live in this skill, below.
- [wolfram-symbol-page/SKILL.md](../wolfram-symbol-page/SKILL.md) and the *Conventions
  across all doc pages* in
  [tools/MarkdownToNotebook/docs/doc-pages.md](../../tools/MarkdownToNotebook/docs/doc-pages.md):
  these cover the rules shared by Symbol and Guide pages (the `[Symbol]()` empty-parens
  link form, author-only `<!-- => ... -->` hints, the no-`Needs[]` rule, `...` becoming
  `…` in prose). Read the Guide section there. Note especially: the leading inline-code
  symbol of each `- ` bullet becomes a linked `InlineGuideFunction` chip, and a bullet
  may lead with several comma-separated symbols, each of which becomes its own chip.
  Built-in System symbols resolve to chips the same way paclet symbols do; a bullet
  that does not start with a backtick span renders as plain guide text.
- The structural templates, one per role. Read the page of the role you are writing
  and copy its structure, not just this text:
  [docs/en/Guides/WolframPhysics.md](../../docs/en/Guides/WolframPhysics.md) for the
  root, `docs/en/Guides/<Area>/<Area>.md` for an area hub, and any other page in such a
  folder for a leaf. A leaf is the full form: frontmatter, `## Abstract`, `## Functions`
  with `### ` topic subsections ordered fundamentals-first, then the per-source
  subsections, the `- ` bullet with a one-line description, the `(WL)` marker on
  built-ins, the tagged link form on ecosystem functions, and a trailing more-functions
  list. The root and a hub are the short form: an abstract, then `### ` headings that
  link their children with three to six representative bullets under each.
- The research reports under `docs/research/` (flat `.md` files, one per source
  surveyed: a Function Repository keyword, a paclet, a Community series, a repository,
  a paper). They are the inventory: each names the functions a source provides, where
  each lives, what it computes, and what overlaps what. Trust them for the map, verify
  them for every fact you put on the page: a link, a `(WL)` claim and a "no built-in
  does this" verdict are all rechecked before shipping. A guide never cites a research
  report; the reader has the paclet, not the repository. Where the inventory is missing
  for a source, the [functions-library-ingest](../functions-library-ingest/SKILL.md)
  skill writes it.
- The exported symbol list, which is the `PackageExported` lines under
  `WolframPhysics/Kernel/` (author-facing; the page never cites the file). A guide
  chips only what is exported. Today the paclet exports no functions: its one exported
  name is the version parameter, which is not guide material.
- The current target page, if you are fixing rather than creating one. Preserve what is
  already good; change only what the rules below require.

## Page format

Choose the page role before applying a template:

- Root: `docs/en/Guides/WolframPhysics.md`, the documentation home, and a hub. A short
  abstract for the whole field, then a `## Functions` section whose
  `### [<Area>](paclet:WolframInstitute/WolframPhysics/guide/<Name>)` headings link the
  areas in reading order, each followed by three to six representative bullets. It
  links the area hubs and the leaves it carries itself.
- Area hub: `docs/en/Guides/<Area>/<Area>.md`, the eponymous page of its folder. An
  abstract for the area, then a
  `### [<Leaf Title>](paclet:WolframInstitute/WolframPhysics/guide/<Leaf>)` heading per
  leaf, each with three to six representative bullets. A hub is an index of its area,
  not a second copy of it.
- Leaf: any other page in such a folder, `docs/en/Guides/<Area>/<Leaf>.md`, or a page
  at the top level of `docs/en/Guides/` that the root carries itself. It is the full
  page: an abstract, then `## Functions` with plain `### ` subsections, the per-source
  subsections below, and the trailing more-functions lists.
- Hybrid hub: a page that carries substantial function content while its linked
  subsection headings are also child-guide edges. No page in the tree is one today.

The hierarchy is THEMATIC. It is organized by subject and never by source, at every
level: an area is a part of the field, a leaf is a topic of that area, and a page holds
whatever the topic needs from every pool. So the same function and the same paclet
recur across pages, each listing written for its page's angle, and that is correct, not
a duplication to fix (see the cross-listing rules below). The layout follows the
hierarchy: a leaf sits in the folder of the area that links it. Tell hub from leaf by
the path, before you touch a heading: a hub is an eponymous page (basename equals the
containing folder) or the root; anything else is a leaf. A linked `### ` heading is a hub
construct: on a leaf it is not a cross-reference but a new parent-to-child edge, and
adding one silently reparents that area in the hierarchy. Never replace a linked child
heading with a plain topic heading while reorganizing a hub; the link is navigation
data consumed by the documentation sidebar, not decoration.

The build writes notebooks flat by basename however the sources nest, and the
documentation system resolves `guide/<Name>` in a flat namespace, so every guide `Name`
is unique across the whole tree. The root's notebook is also the `MainGuide` of
`docs/ResourceDefinition.md`; renaming the root is a resource-definition change too.

Frontmatter (match the existing guide exactly; guides carry a `Description` and a
`Title`, unlike the generic converter docs):

```
---
Template: Guide
Name: <Name>
Title: <Name With Spaces>
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/<Name>
Description: <one line, topics only - same spirit as the abstract>
Keywords: [lowercase, comma, separated, terms]
RelatedGuides: [<parents>, <children and other related local or System guides>]
RelatedTutorials: [<TutorialName>, ...]
Links: ["[label](https://…)", ...]
---
```

`Name` must equal the file basename and the URI tail (CamelCase, no spaces); the build
fails loudly when they disagree. `RelatedTutorials:` and `Links:` are optional: the
guide builder fills the page's Tech Notes section from `RelatedTutorials:` (one
tutorial link per entry) and the Related Links section from `Links:` (one hyperlink per
entry). The project-level pages (wolframphysics.org, the Wolfram Institute, a paclet's
repository) belong in `Links:`, not in the body; a function's own page belongs in the
body as a tagged link. Omit either when empty. A long flow-list may wrap across several
physical lines; the frontmatter parser folds it back.

Body:

```
## Abstract

<one short paragraph - see rules below>

## Functions

### <Fundamental topic>

- `Graph` (WL) short description with no trailing period
- [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR) short description with no trailing period
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) short description
- `PacletSymbol` short description, once the paclet exports one

- `VertexCount` (WL), `EdgeCount` (WL), `IsomorphicGraphQ` (WL), …
- [`WolframModelPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelPlot/) (WFR), [`HypergraphPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphPlot/) (WFR), …

### <More advanced topic>

- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) short description
- `TransitiveReductionGraph` (WL) short description

### WolframInstitute/Infrageometry

- [`InfrageometryName`](https://github.com/WolframInstitute/Infrageometry) short description, and no tag: the heading carries the source
- [`AnotherName`](https://github.com/WolframInstitute/Infrageometry) short description
```

A body link on a hub is a heading, not a bullet: the same `## Functions` section, with
`### [<Child Title>](paclet:WolframInstitute/WolframPhysics/guide/<Child>)` in place of
each plain topic heading, and three to six representative bullets under it.

Two tiers of entry, and how they interleave:

- Annotated entries are the content-first core: a `- ` bullet leading with one chip or
  one link and a short description. Paclet symbols, built-ins and ecosystem functions
  are interspersed here in the order the subject calls for, most-foundational first,
  regardless of which pool each comes from.
- A trailing more-functions list closes a section: a `- ` bullet (or a few) of
  comma-separated entries with no descriptions and no heading, holding that topic's
  lesser-used functions. It is source-agnostic in what it holds, though the converter
  forces one mechanical split (below): chips and links sit in separate tail bullets.
  The list is bare: no per-entry descriptions, and no explanatory lead-in sentence
  introducing it. This is exactly how the built-in Wolfram guides render the tail (the
  "▪"-separated rows closing a section on
  `reference.wolfram.com/language/guide/OperationsOnVectors.html` carry no prose);
  match that. The list holds more than one entry, ideally three or more, and ends in
  ` …` (a space, then the ellipsis character) when further unstated functions exist,
  written as the guides write it: `` `A` (WL), `B` (WL), … ``. The converter
  appends a remainder made only of punctuation straight to the chips, so the close
  never becomes a description; anything else after the last chip does, and renders
  after a long dash. Never a one-item trailing list: a single commentless entry reads
  as an orphan. When a section would leave exactly one function for the tail, promote
  it into the annotated list above and give it a one-line description like the other
  entries.

### Per-source subsections

Where a page's topic draws a whole run of entries from one source, the source moves off
the bullets and onto a heading. A tag on every bullet of such a run is noise: twenty
consecutive `(WolframInstitute/Infrageometry)` tags say one thing twenty times.

- A page's subsections run THEMATIC FIRST: the curated core of the topic, drawn from
  every source and ordered by the subject, fundamentals first. A built-in there keeps
  its `(WL)` marker, the one marker the house style always keeps, and an external entry
  keeps its provenance tag where the subsection genuinely mixes sources.
- Then come the per-source subsections, one for each source that gives this topic a run
  of entries, roughly eight or more. The heading is the source, spelled exactly as the
  inventory names it: `### WolframInstitute/Infrageometry`,
  `### Wolfram/DiagrammaticComputation`, `### SetReplace`,
  `### Wolfram Function Repository`, `### Wolfram Community`.
- Inside a per-source subsection NO entry carries a tag. The heading says where
  everything under it lives, and the entry forms are otherwise unchanged (a link whose
  text is a code span, a plain-text title for a post or a paper). Its first bullet may
  link the source's own page to say what it is.
- A source that gives the topic only a handful of entries stays in the thematic
  subsections, with its tag. Do not open a subsection for three bullets.
- This is a labelling arrangement inside a page, not a reordering of the page. The
  thematic subsections still hold what the topic is about; the per-source subsections
  hold the rest of that source's vocabulary for this topic, and the page is still read
  top to bottom as subject then source, never source alone.

### The three entry forms, and what the converter does with each

The converter decides an entry's rendering from its first characters, so the form is
not a matter of taste:

- A bare backtick chip (`` `Graph` ``) becomes a linked `InlineGuideFunction` chip. The
  converter infers the kind from context: a name that resolves to a System symbol
  renders in italic and links to the System `ref/` page; any other name links to this
  paclet's own `ref/<Name>` page. There is no third case. So a bare chip is only ever a
  System symbol or an exported WolframPhysics symbol; a chip for a resource function or
  another paclet's symbol is a dead link into a page this paclet does not have, and
  `tools/dev/doc_symbols_check.py` fails the build on it.
- A markdown link whose text is a code span (``[`WolframModel`](https://…)``) is not
  a chip. The bullet renders as guide text: the name as a code-styled hyperlink, the
  tag and description following as ordinary text, and no long-dash separator. That is
  the intended rendering for every function that lives outside this paclet and outside
  the kernel, and the form the guides use. A link with plain text
  (`[WolframModel](https://…)`) converts too, but renders the name in text style; use
  the code-span form so an external function reads like the chips beside it.
- A bullet is all chips or all links, never a mix. The chip-run parser stops at the
  first item that is not a backtick span and treats the rest of the line as the
  description, so `` `VertexCount` (WL), [`Foo`](url) (WFR) `` renders as a chip, a
  long dash and then the literal link-and-tag text. Keep a tail of chips and a tail of
  links as two bullets.

The provenance tag in parentheses, right after the chip or link, is mandatory on every
entry of a thematic subsection, in both tiers. Under a per-source heading no entry
carries one: the heading is the provenance of everything beneath it.

| Pool | Form | Tag |
| --- | --- | --- |
| Built-in | `` `Graph` (WL) `` | `(WL)` |
| WolframPhysics symbol | `` `Name` `` | none: the page's home symbols carry no tag |
| Function Repository | ``[`Name`](https://resources.wolframcloud.com/FunctionRepository/resources/Name/) (WFR)`` | `(WFR)` |
| Paclet Repository paclet | ``[`Name`](https://resources.wolframcloud.com/PacletRepository/resources/Publisher/Paclet/ref/Name.html) (Publisher/Paclet)`` | the paclet's name as its publisher spells it |
| Paclet deployed as a cloud resource | ``[`Name`](https://www.wolframcloud.com/obj/<account>/DeployedResources/Paclet/Publisher/Paclet/Documentation/ref/Name.html) (Publisher/Paclet)`` | the paclet's name; the ref page under the deployed resource is the one that serves anonymously |
| Other paclet | ``[`Name`](https://github.com/owner/repo/…) (SetReplace)`` | the paclet's name; the link is its published reference page where one exists, else the repository page for the function |
| GitHub | ``[`Name`](https://github.com/owner/repo) (GitHub)`` | `(GitHub)` |
| Wolfram Community | `[Title](https://community.wolfram.com/groups/-/m/t/…) (Wolfram Community)` | `(Wolfram Community)`; a post is prose, so its title is plain text |
| wolframphysics.org | ``[`Name`](https://www.wolframphysics.org/…) (wolframphysics.org)`` | `(wolframphysics.org)` |

The research report for a source records the canonical link and tag for each of its
functions; take them from there rather than reconstructing a URL. The converter reads
none of the tags: `(WL)` rides along as a verbatim parenthetical after a chip, and a
link bullet goes through the ordinary inline-text path. The tags are the human-readable
cue in the
markdown source, where a reviewer sees at a glance where every entry lives, and they
are what keeps the page from ever sorting by source.

### The future state of an external entry

An external entry is the best available home for a capability today, not a permanent
fixture. When the paclet gains a symbol that supersedes it (the same computation, or a
design-principled superset), the rule that keeps an external function out of the body
takes over for that entry:

- The WolframPhysics symbol takes the bullet, as an unmarked chip, and the external
  entry leaves the body.
- Where the external function is still worth knowing about (a different convention, a
  feature the paclet's symbol does not yet have), it may be cited once as an alternative
  in an italic note line under the entry, using the same italic-note mechanism the
  pages use for prose asides:

  ```
  *Alternative implementation:* [`WolframModel`](https://…) (WFR) computes such-and-such.
  ```

- The comparison itself (what differs, why the paclet has its own) belongs on the
  symbol's reference page, in its `#| annotation` design-review note and, when it helps
  a user choose, a Properties and Relations example; never in the guide bullet.

Until a superseding symbol exists, do not paper over the gap with a note: the external
function is the entry.

## Conventions, and why they matter

- Keep each backtick span whole on one line. When wrapping prose to the column width,
  break at a space between spans, so every span opens and closes on the same line. A
  span whose content itself contains a backtick (a WL context name such as
  `` System`Private` `` or `` WolframInstitute`WolframPhysics` ``) takes double-backtick
  delimiters with a space of padding, exactly as written here in the source.
  `scripts/lint_docs.wls` verifies both rules over all doc sources and runs in CI, so
  a clean lint is part of done.
- No em dashes, and no `--` standing in for one: not in a bullet as a separator between
  chip and description (the converter supplies the separator on the built page; the
  source is `` - `Symbol` description ``), not in the abstract, not anywhere
  (GUIDE.md).
- Symbols are written in plain backticks in the markdown source (`` `Graph` ``). The
  converter turns the leading inline-code symbol of each bullet into a linked chip, so
  the symbol must be the first thing in the bullet. A bullet may lead with several
  comma-separated symbols; each becomes its own chip.
- Order is by the subject, not by source. Sections run fundamentals-first,
  advanced-last, ordered by centrality to the field: never alphabetically, never by
  which pool an entry comes from, and never in the order the research reports happened
  to survey them. Related areas sit adjacent. Within a section, place the most
  foundational entries first and intersperse the pools by relevance. Never group a
  section into a "resource functions block" then a "built-ins block"; that is the
  source-sorting this format exists to remove. The per-source subsections are the one
  exception, and a narrow one: they sit after the thematic subsections, they hold what
  a single source adds beyond the topic's core, and they never stand in for that core.
  A page whose every subsection is a source name has been sorted by source.
- An entry MAY appear as a primary bullet under more than one section when it
  genuinely fits both (a multiway evolution function under running an evolution and
  again under the branchial graph): cross-listing is allowed, not a duplication error.
  Give each listing a description written for that section's angle. Only two things
  count as duplicates to fix: the same entry listed twice within one section, and merge
  artifacts (an entry left in two places by a conflict resolution where only one
  placement was intended). When a repeat spans sections and each placement is
  topically justified, leave it.
- The same function, and the same paclet, MAY appear on several guides. The hierarchy
  is thematic, so a function that three topics all reach for is listed on all three;
  the placement question is always "does this page's subject need it", never "which
  page owns it". When a topic straddles two guides, cross-list the entries the way the
  existing guides do. Each page gets its own bullet, with a description written for
  that page's angle. What is not allowed is mirroring a whole section across both
  pages: that is one page written twice, and a reader meets the same run of vocabulary
  under two different sets of descriptions. And do not reach for a
  `### [Area](paclet:…)` heading to pull the other guide's entries in: on a leaf page
  that heading is a hierarchy edge, not a cross-reference (see *Page format*). A
  `RelatedGuides` entry is the right way to point at the sibling page.
- Cross-listing extends to whole pages, not just entries. Keep one canonical child
  page, `Name`, URI, and category-neutral abstract. For every intended parent, add
  `### [<Title>](paclet:WolframInstitute/WolframPhysics/guide/<Name>)` to the parent
  body (the parent being a hub page, never a leaf), add the child to that parent's
  `RelatedGuides`, and add the parent to the child's `RelatedGuides`. Tailor any
  representative bullets beneath the heading to the parent's angle. Body links are
  directional parent-to-child edges; do not add a reciprocal body link that creates a
  cycle. A child may have several parents because the hierarchy is a DAG. Reparenting
  or removal also deletes the obsolete body heading and both sides of its old metadata
  relationship.
- Mark every built-in System function with a trailing `(WL)` immediately after its
  chip, wherever it appears, annotated entry or trailing more-functions list:
  `` `IsomorphicGraphQ` (WL) whether two states are the same up to relabeling ``, and
  `` - `VertexCount` (WL), `EdgeCount` (WL), … `` in a comma-separated tail. The paclet's
  own symbols never carry a tag (they are the page's home symbols). The converter is
  what surfaces the distinction on the built page: it infers built-in-versus-paclet
  purely from context and never parses the marker. The marker is the redundant,
  human-readable cue in the source, where both chip pools are bare backticks and
  otherwise indistinguishable.
- A `(WL)` tag MUST mark a real, current System symbol: verify, never guess. The marker
  is a factual claim that the chip is a built-in the kernel actually provides; a
  mislabeled chip (a `(WL)` on a name that is not a System symbol, or a plausible-
  sounding name that does not exist) is a bug. Do not trust the research report or
  memory for this; built-in availability is `$VersionNumber`-dependent and both can be
  stale. Confirm each tagged name against the target kernel (`wolframscript` 15.0 here)
  from a scratch `.wls` run with `wolframscript -file`:
  `` MemberQ[Names["System`*"], "<Name>"] `` must return `True`. If it does not, the
  chip is either a paclet symbol (drop the `(WL)`) or a name that does not exist (remove
  or correct it). A one-shot check of a whole page's tagged names:
  `` Select[{"NameA", "NameB", ...}, Names["System`" <> #] === {} &] `` returns the
  offenders.
- A link MUST resolve to the function's own page: verify, never guess. The link side of
  the same standard. Fetch every URL the page carries once before shipping (a `curl -sI`
  status line, or `URLRead[url]["StatusCode"]` from a scratch `.wls`) and confirm the
  page it lands on names the function: a Function Repository URL that redirects to the
  repository's search page, a Paclet Repository ref page for a symbol the paclet
  renamed, or a Community post that moved are the link-shaped version of a mislabeled
  chip. Record in your summary that the links were fetched and when.
- Never chip a symbol that does not exist. The same factual standard applies to the
  untagged, paclet side: a bare chip is one of the paclet's exported symbols, and
  `tools/dev/doc_symbols_check.py` fails on a built guide that links to a `ref/` page
  the paclet does not have. Where the paclet genuinely lacks something the guide ought
  to have, the answer today is a tagged link to where it lives; where nothing in the
  ecosystem has it either, leave it off the page and record the gap in
  `docs/notes/<Topic>.md`. A guide that lists what is missing is worse than a short
  guide. (A symbol you are proposing in the same pass, on its way to kernel code, is
  not this case; an entry that will never be implemented is.)
- Built-in, paclet and ecosystem functions otherwise get identical treatment: same
  sections, same bullet form, same one-line descriptions, same ordering by the subject.
  The provenance tag is the single sanctioned asymmetry between the pools, and it is
  provisional: do not build anything that depends on its exact spelling.
- No trailing period on the `- ` bullet descriptions. They are labels, not sentences.
- Descriptions are one line, with no parentheticals. A bullet description is a terse
  label, ideally landing on a single line. Drop parenthetical asides and qualifications:
  a caveat, a default, a version note, a "(deprecated in favor of …)". That content has
  a home: the function's own page, or the research report. The guide bullet says only
  what the function is, in the fewest words the section needs. The provenance tag is
  the one parenthetical a bullet carries.
- No bold in prose. Don't `**bold**` words for emphasis, not even the paclet name, and
  never leftover author tags. A page's only formatted spans are symbols (backtick or
  linked code, plus the provenance tags), links, and math (`$...$`).
- Content-focused prose. The body of the page is about hypergraph rewriting and the
  structures it produces, not about the paclet or the ecosystem. In reader-facing
  section prose and bullet descriptions, describe the objects and constructions
  directly (rules, states, events, the causal and branchial relations, rulial space);
  don't narrate what the paclet does or turn "WolframPhysics" or "the Function
  Repository" into the running subject. The one place the paclet is named in prose is
  the abstract of the root guide, which situates it against the ecosystem it indexes
  (see below).

  This aversion is about reader-facing prose only; it is not a ban on the word. The
  `` WolframInstitute`WolframPhysics` `` context in frontmatter and code is an
  identifier, not prose; and this skill's own author-facing shorthand ("WolframPhysics
  symbols", the names of the three pools) is developer guidance that never renders on
  a page.
- Property strings and option names on a guide are code, not chips. A guide may
  mention `"StatesGraph"` or `"CausalGraph"` in a description (in backticks, not as a
  bullet's leading chip; only symbols become chips). Where a topic is really an option
  or property family, the section's bullets are the functions that take the options,
  and the description names the family.
- Inline math is `$...$`, a LIMITED LaTeX subset (matching ref pages); a Wolfram
  Physics guide needs little of it. When a formula is needed, a word never sits raw
  inside it (`$steps$` renders as a product of italic letters), and WL syntax being
  TYPED (a Rule `->`, a property string, a pattern) stays in backticks, not `$...$`.
  The `$...$` handler is `LaTeXMathParse` of the `Wolfram/Parser` paclet, which the
  build installs; the rules and probe evidence are in
  [doc-math-rendering.md](../../docs/notes/doc-math-rendering.md) and
  [doc-arg-naming.md](../../docs/notes/doc-arg-naming.md).
- Title is separate words, not CamelCase. The `Title` frontmatter is the topic spelled
  as words (`Title: Wolfram Physics`, `Title: Multiway Systems`); the `Name` frontmatter
  stays CamelCase (`Name: WolframPhysics`, `Name: MultiwaySystems`).
- Naming for any new symbol you propose: CamelCase, predicates end in `Q`, no
  single-letter names, no abbreviations (GUIDE.md, *Never abbreviate, contract, or
  initialise*), and the name must not already be a System symbol; check with
  `` Names["System`<Name>"] `` from a scratch `.wls` before proposing it. The `$`
  prefix is not a generic constant marker: it is reserved for a value tied to how the
  Wolfram Language evaluates, a global setting or piece of session state that changes
  how code runs (as `$RecursionLimit` and `$Assumptions` do). A domain constant that is
  simply a value takes no `$`. Proposing is all a guide does: a symbol that is not
  exported is not chipped until it is.
- Don't propose a WolframPhysics symbol for an inert wrapper. A symbol earns its place
  only if it does something a caller cannot already get from the built-in or the
  ecosystem function it would wrap: explicit-object semantics, input validation, a
  different return shape, a composition of several calls, a symbolic form that stays
  inspectable. A thin pass-through that renames a resource function adds noise, not
  vocabulary; list that function as a tagged link instead. When unsure whether a
  proposed wrapper clears this bar, ask the user rather than guessing.
- Functionality clashes matter more than name clashes. A name collision is the easy
  case; the dangerous one is a built-in, or an ecosystem function already on the page,
  that does the job under a different name. Before proposing any symbol, search by what
  it computes: the documentation, `ResourceSearch`, `Names` on likely stems and
  synonyms, and the research reports. If something already does it, do not mint a
  synonym: list the existing function.
- Property-test predicates usually belong in the trailing more-functions list, not the
  annotated headline. A section's headline entries are its substantive objects,
  constructions, and transforms, the things a reader comes to the topic for. A `...Q`
  that merely tests whether something has a property is supporting vocabulary; demote
  it to the trailing list unless the predicate genuinely is the section's central
  concept.

### Author-hint tags on a bullet

One author-only tag may trail a `- ` bullet as an HTML comment. It is review
scaffolding, invisible in the built notebook, and the guide-side half of a note whose
visible home is the symbol's reference page:

- `<!-- ALT: AltName -->` records an alternative name considered for a proposed
  WolframPhysics symbol. The proposal must appear in both places: keep the tag on the
  guide bullet, and mirror it into the symbol page's design-review `#| annotation` as an
  "Alternative name considered: AltName." clause (see the `wolfram-symbol-page` skill).
  A reviewer weighing the name should meet the same suggestion on the guide and on the
  ref page.

The tag is a `<!-- ... -->` comment, so like the `<!-- => ... -->` output hints it is
stripped by the converter and never renders. That is also why the alternative name must
be re-stated on the symbol page in an `#| annotation` (which does round-trip into the
notebook as a visible, removable annotation).

## Workflow

Work the topic as a content-organization problem, not a transcription job.

1. Locate and orient. Settle the page's role first, from its path (root, area hub,
   leaf), because the role decides the template. Then read the research reports under
   `docs/research/` for every source that covers the topic, the current page, its
   parent hub and the root, its sibling leaves, the symbol pages under
   `docs/en/ReferencePages/Symbols/` and the tutorials under `docs/en/Tutorials/`, so
   the page's sections track what the paclet and the ecosystem actually provide, and
   so a function a sibling already carries is placed knowingly rather than by
   accident. Find the corresponding built-in system guide
   (`guide/GraphsAndNetworks` for the graph side) and the project's function guide;
   their function lists are the completeness baseline you mirror and extend. An area's
   code (once there is any) lives at `WolframPhysics/Kernel/<Area>/`, its tests at
   `WolframPhysics/Tests/<Area>/` and its symbol pages under
   `docs/en/ReferencePages/Symbols/`: the guide that chips a symbol decides its
   category, and the area above that guide names it.

2. Build the inventory from the three pools.
   - WolframPhysics symbols: the exported symbols, each placed under every topic it is
     core to. None yet.
   - Built-in System functions: list the kernel functions a practitioner reaches for
     in this topic. Sort them in your head into the core ones (worth an annotated line,
     marked `(WL)`) and the lesser-used ones (the trailing more-functions list, still
     marked `(WL)`).
   - Ecosystem functions: from the research reports, the functions each source
     provides for the topic, with the canonical link and tag the report records. Where
     two sources provide the same capability (a resource function and a paclet symbol
     that compute the same thing), the report's verdict on which is canonical decides
     the headline entry; the other may sit in the tail or be cross-listed where its
     convention differs.

3. Check completeness and prune. Ask explicitly: what would a reader of this page look
   for and not find? Walk the field's workflow (state a rule, choose an initial
   condition, evolve, choose what comes back, identify states up to isomorphism, build
   the states, causal and branchial graphs, explore the multiway system, move in rulial
   space, enumerate and visualize rules) and confirm each step is reachable from the
   page through an entry or a `RelatedTutorials` link. For each gap, add coverage from
   whichever pool fits. Then look the other way: remove functionality unrelated to the
   topic, redundant with a better entry, or too trivial to deserve a line. The page
   should read as the considered core vocabulary, neither thin nor padded.

   Reachability is part of completeness. Every function a reader would look for from
   this page must be reachable from it, and every cross-link must resolve. Work from
   the reader in: name what a specialist would arrive looking for, and confirm each one
   is on this page or cross-listed onto it from wherever it lives.

4. Check the other guides for equivalents, and report them. Once there is more than
   one guide, the same operation recurs across topics under different names. Before
   settling a new entry, scan the other pages under `docs/en/Guides/` for a function
   that already does the same thing, matching by what it computes, not by name. Prefer
   reusing or cross-referencing an existing entry over adding a near-duplicate, and
   tell the user what you found: the equivalent's name, which guide it lives in, and
   how it relates, so they can decide whether to unify or keep both.

5. Order and group. Organize the inventory into a handful of `### ` subsections by
   topic, ordered fundamentals-first and advanced-last (look at how a real Wolfram
   guide page carves its field). Within each section, place the annotated bullets
   most-foundational first, interspersing the three pools by relevance and tagging each
   entry. Close the section with a trailing more-functions list holding its lesser-used
   functions, chips in one bullet and links in another. Then count what each source
   contributes: a source with a run of entries in this topic, roughly eight or more,
   takes a per-source subsection of its own after the thematic ones, with no tag on its
   entries; a source with a handful stays tagged in the thematic subsections. On a hub
   there is no such pass: its subsections are its children, and its bullets are the few
   that represent each.

6. Write the abstract (see below), last, once the topics are settled.

7. Synchronize the hierarchy and backlinks. Add or repair every intended body-link edge
   and reciprocal `RelatedGuides`, then check the complete guide set: `WolframPhysics`
   is the sole root, every guide is reachable from it through body links (a guide
   nothing links lands at the end of the sidebar's top level, which is the symptom of a
   heading that was dropped), and there are no cycles, duplicate edges, or dangling
   local body-link targets. The filename basename, frontmatter
   `Name`, URI suffix, and every parent link target must agree and be unique across the
   tree. Refresh affected parent summaries. Every tutorial the guide names in
   `RelatedTutorials` names the guide back in its own `RelatedGuides`; every symbol
   page whose symbol the guide chips lists the guide in its `RelatedGuides`. A rename or
   primary reparent synchronizes its filename, `Name`, `Title`, URI, and metadata while
   preserving custom tutorial relationships; cross-listing alone does not add every DAG
   parent to `RelatedTutorials`.

8. Run the gates. From the repository root: `wolframscript -file scripts/lint_docs.wls`
   (clean, whole tree), then `python3 tools/dev/doc_symbols_check.py` (no chip links to
   a `ref/` page the paclet lacks, no dead `guide/` or `tutorial/` link), then
   `python3 tools/dev/doc_links_check.py docs/en/Guides/<Area>/<Name>.md` (every external
   entry's link serves a page; a Wolfram resource address that redirects to a sign-in
   page names a resource that does not exist, which is how a Paclet Repository link for
   a paclet published only as a cloud resource fails). On a rename, also use `rg` to
   prove no stale old Name, URI, or path remains.

9. Convert and inspect only the changed page when rendered evidence is needed. Load
   the converter the way `scripts/build_notebooks.wls` does (`Get` of
   `tools/MarkdownToNotebook/MarkdownToNotebook.wl` after `PacletDirectoryLoad` of
   `WolframPhysics/`, from a scratch `.wls` run from the repository root) and convert
   the single source to a scratch path:
   `MarkdownToNotebook["docs/en/Guides/WolframPhysics.md", "<scratch>/WolframPhysics.nb"]`.
   A guide has no evaluated cells, so this is cheap; do it whenever the chip rendering,
   a link bullet, the tail ellipsis or the Tech Notes section is in doubt. Do not run
   the full build for a routine single-page edit. Commit the markdown only: the
   notebook under `WolframPhysics/Documentation/English/Guides/` is not in git, and
   `./build_docs.sh` writes it again before anything is published.

The guides also drive the documentation site: `scripts/build_site.wls` reads its
navigation from the markdown, walking the body links from the root depth first, so the
sidebar nests exactly as the pages link one another, with the areas under the root and
the leaves under their area. A page reachable from two parents is shown under the
first, and a page nothing links is shown at the end of the top level. The
`RelatedTutorials` follow in the order named, and the symbols the guides chip in the
order introduced. The order you settle here is the sidebar's order, and
`DRYRUN=1 wolframscript -file scripts/build_site.wls local` prints it, nesting and all,
without building anything.

## Writing the abstract

The abstract is a short, plain, topics-only paragraph whose subject is the field
itself, not the paclet, the ecosystem or the Wolfram Language. Keep these rules:

- Lead with the subject. Open with what the area is or does, then continue straight
  into the covered topics. The reader is already on the paclet's documentation page, so
  the subject carries the whole paragraph on its own.
- Describe the topics covered. Name the objects and constructions (rules and
  hypergraphs, states and events, the multiway system, the causal and branchial
  relations, rulial space) and let the Functions sections below carry the functions.
  Written well, the abstract reads correctly even standing apart from the software.
- Plain and straightforward prose, where every word earns its place; shorter is
  better. No performance adjectives.
- Name the areas in the same order as the page's own sections, and name them all. The
  abstract's topic sequence must track the page's thematic `### ` headings top to
  bottom; write it last, and read it against the section list before shipping.
- Fixing an existing abstract: lightly rewrite into this style while keeping as much
  of the original wording and substance as you can; this is an edit toward the style,
  not a rewrite from scratch. The reliable recipe: keep (or write) a one-sentence
  subject lead, then splice the existing topic list onto it ("X applies …, producing
  A; B; and C." or "X is …: A; B; and C.").
- A hub, and the root, describe the areas they span the same way ("Multicomputation
  spans A, B, and C."), naming the children in the order the linked headings name them,
  and may close with "Each area has its own guide." A leaf's abstract names that leaf's
  own subject and its `### ` topics, and never the area around it; the hub above it is
  what places it.
- A per-source subsection is not a topic, and never appears in an abstract. The
  abstract names the subject; where a source's vocabulary lives is a fact about the
  page's arrangement, not about the field.

The target voice (note how each leads with the subject and names only topics):

> Hypergraph rewriting applies a set of rules to a hypergraph in every possible way,
> producing the states reached, the events that relate them, and the causal and
> branchial structure among those events and states: rules and initial conditions;
> the evolution and what it returns; identity of states up to isomorphism; the
> multiway system of all branches; and the causal and branchial graphs.

> Graphs and networks appear in a variety of contexts, and support creating,
> analyzing, and visualizing them.

The umbrella project statement (the Wolfram Physics Project's aim of finding the
fundamental theory of physics through hypergraph rewriting, and this library's aim of
gathering the project's functionality into one paclet) belongs to the resource page and
to the root guide's abstract, where the paclet is situated against the ecosystem it
indexes; topic abstracts stay with their topic.
