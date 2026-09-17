---
name: wolfram-tech-note
description: "Author a tutorial / tech note for the WolframInstitute/WolframPhysics paclet (a free-flowing prose-and-code documentation page under docs/en/Tutorials/, built to a tutorial/ page) as a literate-markdown document built with MarkdownToNotebook from the tools/MarkdownToNotebook submodule. Use this whenever the user wants to write, extend, or rework a tutorial, tech note, walkthrough, or narrative documentation page for this repo (prose interleaved with runnable examples) rather than hand-editing the DocumentationTools tutorial authoring notebook. Carries this repo's authoring rules, example budget, verification gates, and the anti-patterns review has edited out of generated prose."
---

# Authoring a tutorial / tech note in markdown

`MarkdownToNotebook` fills the DocumentationTools tech-note authoring notebook (the
`tutorial/` page the paclet ships under `WolframPhysics/Documentation/English/Tutorials/`)
from a literate-markdown document with the `TechNote` template. Unlike a symbol or
guide page, a tech note has no fixed sections: it is free-flowing prose and code.

Before authoring, read the converter's own conventions, in the
`tools/MarkdownToNotebook` submodule, whose pointer follows the commit deployed as the
public resource function and which the build loads:
[tools/MarkdownToNotebook/docs/doc-pages.md](../../tools/MarkdownToNotebook/docs/doc-pages.md)
(the *Conventions across all doc pages* section covers the rules shared by Symbol,
Guide, and TechNote pages: the `[Symbol]()` / backticks split, italics for argument
names, the `<!-- => ... -->` hints are author-only, the build-and-inspect loop, the
no-`Needs[…]` rule, headless rasterization, bare Associations render badly),
[tools/MarkdownToNotebook/docs/examples.md](../../tools/MarkdownToNotebook/docs/examples.md)
(one demonstration per cell) and
[tools/MarkdownToNotebook/docs/formatting.md](../../tools/MarkdownToNotebook/docs/formatting.md)
(the `#|` directives, tables, links). Then [GUIDE.md](../../GUIDE.md), whose
*Documentation* section is the contract every rule below applies.

There is no tutorial in this repository yet: `docs/en/Tutorials/` is empty. The first
page written with this skill becomes the exemplar for shape and voice; the built-in
tech notes (e.g. https://reference.wolfram.com/language/tutorial/Patterns.html) are the
voice until then.

The intended set. `GettingStarted` is the only fixed name: the page a newcomer walks
first. Every later page is named by its subject, CamelCase, one page per `Name`, and
planned so that the set together teaches the whole surface the root guide indexes:
today that surface is the ecosystem's (the Wolfram Physics Project's resource
functions, the published paclets), and a tutorial may walk it with those functions in
its cells; as the paclet gains symbols of its own, the tutorials shift to them. A
tutorial that walks an option or property family is where a reader learns it, so plan
the set against the guide's sections.

## Where the page goes

The source is `docs/en/Tutorials/<Name>.md`; tutorials are a flat directory. The built
notebook lands in `WolframPhysics/Documentation/English/Tutorials/<Name>.nb`, and it is
a build artifact, ignored by git: it ships in the paclet, `./build_docs.sh` regenerates
it with every cell evaluated against the current checkout, and every publish rebuilds
it, so only the markdown is ever committed (CONTRIBUTING.md, "Building the
documentation"). Never hand-edit it.

`Name` must equal the file basename and the tail of `URI`; `scripts/build_notebooks.wls`
writes `<Name>.nb` and fails loudly when they disagree, so a page never lands under a
title-shaped filename. `Title` is the displayed heading, spelled as words.

A tutorial is linked from both sides: its own `RelatedGuides` / `RelatedTutorials`
frontmatter, and the `RelatedTutorials` frontmatter of the guide and each sibling
tutorial that should point back. Adding a page without the backlinks strands it. The
documentation site (`scripts/build_site.wls`) lists tutorials in the order the root
guide's `RelatedTutorials` names them, so that order is the sidebar's order.

## Frontmatter

```
---
Template: TechNote
Name: GettingStarted
Title: Getting Started with Wolfram Physics
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/tutorial/GettingStarted
Keywords: [hypergraph, multiway, rewriting, tutorial]
RelatedGuides: [WolframPhysics]
RelatedTutorials: [SiblingName]
---
```

## Body, and how state behaves

Markdown maps to cells: `##` becomes a Section, `###` a Subsection, paragraphs Text,
fenced `wl` cells Input/Output with `<!-- => ... -->` recording the expected output.
Do not repeat the title as a `# ` heading in the body; `Title:` is the heading.

Tutorials thread state end to end. This repo's build (`scripts/build_notebooks.wls`)
converts tutorials with `"EvaluateSeparator" -> None`, so, unlike ref pages, which
reset their example kernel at every `---` and heading once the protection snapshot
arms, a binding made early in a tutorial is visible to every later cell, and
`scripts/run_doc_examples.wls` checks tutorials the same way. Use that: define the
running rule and initial state once, near the top, and reuse them. A page must still
read well (a reader may dip into a section cold), so name bindings mnemonically
(`rules`, `init`, `evolution`) and re-show an object rather than assuming the reader
remembers it.

Cells are single expressions. One demonstration per cell, a one-sentence
`:`-terminated caption above it, `---` between sibling examples. No compound multiline
cells; decompose into steps that each showcase an intermediate object. Three
evaluations stacked in one fence render as three outputs under one input, and the
reader cannot copy any one of them. This is the repo's visual-first rule: the reader
learns from the objects on screen, so

- every function used shows its real return value at least once, never only a
  `Length`, a `True`, or another reduction of it; the evolution object, the states
  graph, the causal graph all appear as themselves before any count of them;
- an object whose natural output is a wall of `InputForm` is shown as its summary box
  or through a property, and a cell whose output is a summary box or a graphic goes
  hint-less: no `<!-- => ... -->`, and never a prose description inside one;
- a result that is an Association of Associations keyed by id renders poorly bare;
  show what a record carries through `Keys` or one record by `Part`, and say which
  view the reader is looking at. A table is the last resort for data: a page never
  shows rows of numbers where a picture can carry them (a bar or line chart, a
  histogram, an `ArrayPlot` of a grid, a labelled scatter, a `Graph`), and a
  `Dataset` of many rows is reserved for record structure the reader must see. A cell
  whose input is hand-typed data (a corpus, a list of records, a style list) starts
  with `#| collapse: input`, so its output shows and the input opens from the group
  bracket;
- nothing is asserted in prose that a one-line computation on the page could show
  instead; when a claim can compute, compute it ("canonical states collapse 154 to 6"
  is a cell with a count property, not a sentence);
- prose must match the pictures; after a rendering change, re-read the sentences
  around every graphic.

Cells are cheap, and the multiway system is not. The notebook build evaluates every
cell with no time budget, and the example runner aborts a cell after 600 seconds and
reports it; either way a slow page slows every build and every gate, and the CI pod
bills by the hour while it waits. The
functions are fast on small inputs; what grows is the multiway system itself and the
`Graph` built from it: a one-edge rule from one edge reaches over a hundred states
within five steps when every branch is kept, and thousands soon after. So:

- small means 2 to 5 steps of a rule with one or two left-hand edges from one to
  three initial edges; go deeper only with states identified up to isomorphism or a
  count, and say why in the caption;
- prefer a count when the point is a number;
- prefer a structure variant of a graph over the styled graph when the point is
  structure; the styled graph is for the one or two places the reader should look at
  states;
- canonical states on any pictured evolution beyond three steps, so the picture stays
  readable; one uncanonicalized picture per page shows why;
- every styled graph gets an explicit `ImageSize`, through the option route the
  function offers (an option it passes to the graph it returns, or the `Graph` option
  itself when the function returns a plain `Graph`): the build stores the graph at a
  small raw width while state thumbnails cannot shrink, so unsized they pile up. About
  55 pt per thumbnail in the widest layer (420 up to 8 states, 540 up to 16, 640 up to
  30, never above 640); more states than that means a structure variant or fewer
  steps. `AspectRatio`, unquoted, is what reshapes a deep layout (`ImageSize` never
  does); give one to any graph taller than about 1.5 times its width. The full rule,
  and how to verify by rasterizing the built notebook, is in the symbol-page skill
  under *Keep examples small*;
- keep each cell to a few seconds locally and the whole page well under a minute, and
  check the page's total with a timing pass before calling it done.

Functions from elsewhere on a page. While the paclet has no symbols of its own, a
tutorial's cells may use a resource function (`ResourceFunction["WolframModel"]`) or
a symbol of an installed paclet. Two things follow. The build and the example runner
evaluate every cell, so the building machine must be able to resolve what the page
uses: a resource function is fetched from the cloud on first use and cached, and a
paclet must be installed; say in your summary what a page depends on. And a cell
binds the resource function once, as a captioned cell whose output is the function's
own summary box (`wolframModel = ResourceFunction["WolframModel"]`), then the page
uses the binding, so the reader sees where the function comes from before it is used
and every later cell stays a single short expression.

## Write for humans: the anti-patterns

A tutorial is read by a person, and machine-written prose has tells. Every pattern
below is one that review has edited OUT of tutorials in this documentation system; do
not write them in the first place. The voice to match is the built-in tech notes, e.g.
https://reference.wolfram.com/language/tutorial/Patterns.html: declarative sentences,
"you" is fine, no narrator, and every sentence carries information.

- No meta-commentary about the document. "This tutorial walks through", "In this
  section we will..." get rewritten to previews that name actual objects: "A rule,
  the states it reaches in three steps, and the causal graph among the events that
  reached them." Announce content by naming it, never by describing the act of
  presenting it. No "Next steps", "Conclusion" or "Summary" section that restates
  what the reader just did; the Related Guides and Tech Notes sections the frontmatter
  builds are the next steps.
- No ritual reassurance. "Every example is checked against the test suite" is not a
  sentence for the page. Confidence is conveyed by the computation on the page, not by
  an assurance formula; if a claim needs backing, compute it in a cell.
- The symbol does the verifying, not the narrator. "and the two conventions really do
  agree" becomes a cell whose output is the two counts side by side (that list IS the
  demonstration). When prose starts narrating a verification, replace the narration
  with the named symbol and its output.
- Literal words over evocative ones. "blows up quickly" becomes the numbers;
  "high-performance" becomes nothing at all. If a term is doing mood instead of
  meaning, replace it with the literal statement. The same goes for the stock
  intensifiers (powerful, elegant, seamless, simply, straightforward) and for "Note
  that" / "It is worth noting", which mark a sentence that either matters (then say it
  directly) or does not (then cut it).
- No "we", no "let's". The built-in tech notes address the reader as "you" and
  otherwise write declaratively; there is no authorial "we" walking anyone anywhere.
- Paraphrase drift is the worst tell. When restating what a function guarantees
  ("states are identified up to isomorphism; which representative is reported is not
  specified"), carry its qualifiers exactly or quote the symbol page; smooth prose that
  says slightly less than the source is wrong prose.
- Break the template rhythm. Uniform three-sentence paragraphs, rule-of-three
  adjective lists, "not only X but Y" scaffolds, and a signposting back-reference at
  every section boundary read as generated text. Vary paragraph length with the
  content; refer back only when the reader genuinely needs the earlier object.

## Typography

`scripts/lint_docs.wls` enforces the first three; the rest are manual, and GUIDE.md
states each:

- Context names in prose need double-backtick spans with space padding:
  `` WolframInstitute`WolframPhysics` ``. A single-backtick span closes at the
  context's own backtick and the rest of the line is corrupted (lint).
- Keep each backtick span whole on one line; wrap at a space between spans (lint).
- A word never sits raw in inline math: `$steps$` renders as a product of italic
  letters. An argument placeholder takes markdown italics (`*steps*`); a word a
  formula genuinely needs takes `\text{...}` (lint). This paclet's pages need almost
  no math; the full rules are in
  [doc-math-rendering.md](../../docs/notes/doc-math-rendering.md) and
  [doc-arg-naming.md](../../docs/notes/doc-arg-naming.md).
- No em dashes, and no `--` standing in for one: a plain hyphen with spaces, a comma,
  a colon, or a new sentence (manual: the lint carries no dash rule).
- No bold in prose, and no uppercase for emphasis (manual).
- No subroutine vocabulary: no "call", "invoke", "routine"; "returns unevaluated" in
  the active voice. Grep the finished page for the three words (manual).

## What a tutorial may cite

- Paclet symbols, via `<code>[MySymbol]()</code>`; built-ins the same way
  (`<code>[Graph]()</code>`, `<code>[Dataset]()</code>`).
- A resource function or another paclet's symbol by the code that reaches it
  (`ResourceFunction["WolframModel"]` in backticks), with a markdown link to its own
  page the first time it appears, the way the guide links it.
- Property strings and option names in backticks (`"StatesGraph"`,
  `"CanonicalizeStates" -> Full`).
- Never kernel `.wl` file paths, `tools/` probe scripts, benchmark output, research
  reports under `docs/research/`, build directories, or absolute paths of any kind. A
  measurement may be quoted with its conditions ("at depth 7, 5,914 states"); the
  script that took it stays out of the page.
- The Wolfram Physics Project and the Wolfram Institute by name and in `Links:` on the
  guide, not as a body paragraph on every page.
- The word "dogfood" is banned; say "the docs use the paclet's own symbols".

## Graphics

- Anything graph-shaped is drawn by the function's own graph properties where it has
  them (a states graph, a causal graph, a branchial graph, their structure variants);
  a tutorial never hand-builds a `Graph` from raw states and events when a property
  gives it. If the drawing a tutorial needs does not exist, that is kernel work first.
- Look at every graphic you record: export it to PNG from the scratch probe and read
  it back, in light and dark appearance where the graph carries explicit colors. A
  headless export renders the light branch; a `Graph`'s stored options are
  unreachable by `ReplaceAll` (rebuild from `VertexList`/`EdgeList`/`Options`).
- A graph whose labels collide, whose layout is a hairball at the requested depth, or
  that is illegible on dark is a defect: of the page if fewer steps, canonical states,
  a structure variant or `ImageSize` fix it, of the kernel otherwise.

## Build and verify

Run every gate before calling the page done; they exist because each has caught
silently-broken shipped pages.

1. Evaluate the page yourself, the way it will build. One scratch `.wls` under your
   scratch directory, one fresh kernel, every cell in page order, run with
   `wolframscript -file <path>` from the repository root. Load the paclet with
   `PacletDirectoryLoad[FileNameJoin[{Directory[], "WolframPhysics"}]]` then
   `` Needs["WolframInstitute`WolframPhysics`"] ``; never `wolframscript -code` (its
   string is parsed before `Needs` runs, so every symbol lands in `` Global` ``), and
   never `cd` before `wolframscript`: a probe run from elsewhere silently loads
   whatever paclet is installed instead. Assert a symbol the page depends on actually
   resolved (`Context[MySymbol]`) before trusting any output.
2. Record outputs char-exact as `ToString[result, InputForm]`. Regenerate, don't
   transcribe. Graphics and summary boxes get no hint.
3. `wolframscript -file scripts/run_doc_examples.wls docs/en/Tutorials/<Name>.md`:
   the runner mirrors the built page's state semantics (threaded for tutorials),
   compares every recorded hint with the real output, and fails a cell that would echo
   unevaluated or read a lost binding.
4. `wolframscript -file scripts/lint_docs.wls`: clean, whole tree.
5. `python3 tools/dev/doc_symbols_check.py`: every `ref/`, `guide/` and `tutorial/`
   link the page carries resolves.
6. Build the page through the converter the way `scripts/build_notebooks.wls` does:
   `./build_docs.sh only=<Name>` for the notebook the paclet will ship, or `Get` the
   checkout's `tools/MarkdownToNotebook/MarkdownToNotebook.wl` after the
   `PacletDirectoryLoad` and convert the single page to a scratch path, and inspect the
   built cells whenever anything about rendering is in doubt. Commit the markdown
   alone; the notebook is rebuilt before every publish, and `scripts/docbuild.wls`
   fails the build on one that is missing or older than its markdown.

## The companion pattern

When a subject splits into using the machinery and why the machinery works, prefer
two pages over one long one: the main page stays an arc a newcomer can walk, the
Advanced page carries the reasoning with its own computations (why a canonical form is
finer than isomorphism and not an approximation of it; why a cap by arrival order is
not a sample; what a frontier retains), and the two cross-link in both directions
through `RelatedTutorials`. Split when a page's cell count makes it unwalkable, and say
in the opening paragraphs of each which page the reader is on and what the other one
holds, by naming the objects, not by describing the document.
