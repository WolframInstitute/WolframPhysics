---
name: wolfram-symbol-page
description: "Author a Wolfram Language symbol reference page (a function/symbol documentation page, like the built-in ref/ pages) for an exported symbol of the WolframInstitute/WolframPhysics paclet, as a literate-markdown document under docs/en/ReferencePages/Symbols/ built with MarkdownToNotebook from the tools/MarkdownToNotebook submodule. Keep the symbol's guide membership synchronized with the page. Use this whenever the user wants to write, extend, or repair reference documentation for a paclet symbol (the Usage, Details & Options, Examples, Scope, Options, and Possible Issues of a ref/ page) rather than hand-editing the DocumentationTools authoring notebook."
---

# Authoring a symbol reference page in markdown

`MarkdownToNotebook` fills the DocumentationTools symbol authoring notebook (the
`ref/` reference page the paclet ships under
`WolframPhysics/Documentation/English/ReferencePages/Symbols/`) from a
literate-markdown document with the `Symbol` template.

Before authoring, read the converter's own conventions, in the
`tools/MarkdownToNotebook` submodule, whose pointer follows the commit deployed as the
public resource function and which the build loads:

- [tools/MarkdownToNotebook/docs/doc-pages.md](../../tools/MarkdownToNotebook/docs/doc-pages.md):
  the *Conventions across all doc pages* section covers the rules shared by Symbol,
  Guide, and TechNote pages (the `[Symbol]()` / backticks split, italics for argument
  names, `EvaluateSeparator` for state-threading, the `<!-- => ... -->` hints are
  author-only, the build-and-inspect loop, the no-`Needs[…]` rule, headless
  rasterization, bare Associations render badly, ...).
- [tools/MarkdownToNotebook/docs/examples.md](../../tools/MarkdownToNotebook/docs/examples.md):
  the one-demonstration-per-cell rule, captions, `---` delimiters.
- [tools/MarkdownToNotebook/docs/formatting.md](../../tools/MarkdownToNotebook/docs/formatting.md):
  inline formatting, the `#|` cell directives, tables, links.

There is no exemplar page in this repository yet: the paclet exports no functions
today, and `docs/en/ReferencePages/Symbols/` is empty. The first page written with this
skill becomes the exemplar for the next; until then the frontmatter and section
templates below are the model, and the built-in ref pages (compare the Details of
[`ListLinePlot`](https://reference.wolfram.com/language/ref/ListLinePlot.html)) are the
voice.

A symbol page documents one symbol and belongs to the paclet (author the guide with the
[wolfram-guide-page](../wolfram-guide-page/SKILL.md) skill, tutorials with
[wolfram-tech-note](../wolfram-tech-note/SKILL.md)).

What gets a page. Every symbol the paclet exports gets its own page, and nothing else
does. The exported set is the `PackageExported` lines under `WolframPhysics/Kernel/`
(an author-facing fact; the page itself never names a file). Today that set holds only
the version parameter `$WolframInstituteWolframPhysicsVersion`, which is not a function
and takes no page. Do not write a page for a name that is not exported (a resource
function, another paclet's symbol, a symbol still being proposed on a guide), and do
not leave an exported function without one: `tools/dev/doc_symbols_check.py` fails CI
on a page whose symbol the paclet does not export and on a link to a `ref/` page the
paclet does not have.

Where the page goes. The source is `docs/en/ReferencePages/Symbols/<Name>.md`; once
category guides exist, a page may sit under
`docs/en/ReferencePages/Symbols/<Category>/` the way its guide and kernel file do, and
the build writes the notebook flat by basename either way, to
`WolframPhysics/Documentation/English/ReferencePages/Symbols/<Name>.nb`. The built
notebooks are artifacts, ignored by git: `./build_docs.sh` regenerates them with every
example evaluated against the current checkout, and every publish rebuilds them, so
the markdown is the only thing a change commits (CONTRIBUTING.md, "Building the
documentation"). Never hand-edit a built notebook; edit the markdown and rebuild.

Read first, the canonical guidelines (a symbol ref page lives inside a paclet, so the
Paclet Repository rules apply to it):

- Paclet Repository, creating paclets: https://resources.wolframcloud.com/PacletRepository/creating-paclets
- Paclet Repository, submission guidelines: https://resources.wolframcloud.com/PacletRepository/guidelines
- [GUIDE.md](../../GUIDE.md), this repo's style guide and the single home of the design
  rules this skill applies. Load-bearing here: its *Documentation* section (no
  subroutine vocabulary; verify by evaluation; verify rendering, not source; *Showcase
  what functions return*; the typography rules) and its no-em-dash and
  no-source-file-citation rules.
- [docs/notes/doc-example-state.md](../../docs/notes/doc-example-state.md): what a
  `---` and a heading throw away on a built page (the state rules below rest on it).

## Frontmatter

```
---
Template: Symbol
Name: <Name>
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/ref/<Name>
Keywords: [hypergraph, multiway, rewriting, causal graph]
SeeAlso: [<OtherPacletSymbol>, <BuiltIn>]
RelatedGuides: [WolframPhysics]
---
```

`Name` must equal the file basename and the tail of `URI` (CamelCase, no spaces).
`scripts/build_notebooks.wls` writes `<Name>.nb` and fails loudly when `Name` and the
basename disagree, so a page never lands under a title-shaped filename. `SeeAlso` and
`RelatedGuides` are context-aware links: a System symbol links to its system ref page,
a paclet symbol to the paclet's ref page (the converter resolves this). Related paclet
symbols cross-link one another through `SeeAlso`, and every page lists the guide that
chips it in `RelatedGuides`.

Before finishing, confirm the symbol appears in the guide (`docs/en/Guides/`) where it
is core and that each local `RelatedGuides` target exists. If guide membership changes,
apply the `wolfram-guide-page` rules to the guide, including its rule for an external
entry the new symbol supersedes.

## Sections

- `## Usage`: one statement per paragraph. Usage lists only input/construction
  signatures, the `DownValues` forms `Sym[args]` that produce a result. Instance
  application (`obj[input]`), property access (`obj["prop"]`), and parameter
  substitution are `SubValues` (behavior of an already-constructed object) and belong
  in `## Details` / `## Scope` / `## Properties and Relations`, never Usage. For an
  object-head symbol, an `obj[…]` action line in Usage is a category error. The same
  goes for every other non-signature footnote: result-type notes ("The result is a
  [Graph]() ..."), definitional prose ("Two states are the same when ..."), and
  cross-references. Describing the result or the concept is `## Details` material;
  every Usage paragraph must BE a signature (start with `<code>[`), with only option
  paragraphs ("The option ...") as the exception. The canonical signature form wraps
  the whole signature in an inline `<code>` tag so markdown viewers process the nested
  markdown inside it (links, italics, math) while rendering the whole span in code
  style:

      <code>[MySymbol]()[*rules*, *init*, *n*]</code> rewrites the hypergraph *init* under *rules* for *n* steps.

  GitHub and Pandoc render this as a code-styled clickable link (the symbol's ref
  page), then literal brackets, then italic argument names. The converter strips the
  `<code>` wrapper, peels the `[`Name`](…)` link down to the name, drops `*…*` italics
  around args, and rewrites a `$x_i$` to the template form `x$i` before handing the
  reconstructed signature to DocumentationTools' usage template-parser. Bare backtick
  / prose / hybrid forms still work as fallbacks.
- `## Details & Options`: bullets become `Notes` cells; pipe tables become grids (use
  one for the options table and one for the property table). Every table on a symbol
  page has a blank header row: `|   |   |   |` followed by the `|---|---|---|`
  separator, as `scripts/lint_docs.wls` enforces (a named header would render as an
  unwanted first row in the reference notebook, which is not how the built-in Wolfram
  ref pages set an option grid). Known converter limitation: the converter always
  emits the first row as a bold header band, so the blank row shows as an empty band in
  the built notebook. That is accepted; a named header is not. Link another symbol
  inline by wrapping its actual name in the inferred-link form, e.g.
  `<code>[Graph]()</code>` to link `Graph`, `<code>[MySymbol]()</code>` to link a
  paclet symbol; the literal name goes between the brackets, never the word "Symbol".
  Two things matter here: the empty parens (without them markdown viewers do not
  render the `[…]` as a link element), and the `<code>` wrapper (markdown forbids
  nested formatting inside backticked code spans, but processes markdown inside an
  inline HTML element, so the `[link]()` inside `<code>` renders as a clickable link
  with code styling). The converter strips the wrapper and routes the empty-URL link to
  a `paclet:` ref in the notebook.
- `## Basic Examples` then the extended sections `## Scope`, `## Options`,
  `## Applications`, `## Properties and Relations`, `## Possible Issues`,
  `## Neat Examples`. The example-authoring rule (one demonstration per cell,
  one-sentence `:`-terminated caption, `---` between siblings, `### Heading` becomes
  an `ExampleSubsection`) is documented once in
  [examples.md](../../tools/MarkdownToNotebook/docs/examples.md); follow it everywhere
  example cells appear.
  - Give more than one example. A single example almost never covers what a symbol
    can do: several argument forms, options, properties of what it returns. Under
    `## Basic Examples`, author several distinct cells (each its own demonstration,
    `---`-separated), and use `## Scope` and the other extended sections to exercise
    the different cases, options, and properties. Aim to leave a reader who has read
    the page knowing the breadth of what the symbol does, not just one canonical
    evaluation.
  - Coverage criteria. Beyond "more than one", a page's examples must clear these
    bars; use them as a checklist:
    - Basic Examples are present. Every symbol has a `## Basic Examples` section with
      at least one worked cell.
    - Every argument pattern / Usage statement is exercised. Each distinct signature
      in `## Usage` gets an example that uses it. A symbol with three Usage lines needs
      at least one example per line.
    - At least as many total examples as Details & Options statements. Count the
      `## Details & Options` bullets and rows; the page's total example cells (across
      all example sections) should meet or exceed that count. A stated behavior a
      reader cannot see demonstrated is under-documented.
    - Every option is exercised. A symbol with options needs an example covering each
      one, showing the option set to a non-default value and its effect, ideally more
      than one value where the values change the result differently. When the option
      list is long, `### "OptionName"` subsections under `## Options`, one per option,
      in the order of the options table, keep it walkable.
    - A symbol with options has an options table in `## Details & Options` (the
      three-column option, default, description grid described above, with its blank
      header row). A symbol that takes the same options as a sibling says so and
      documents only what differs.
    - Every accepted name is described somewhere. Every option, property string and
      argument form the kernel file accepts is named in some page, and the natural
      home is the symbol page's table. A new option or property is not shipped until
      some page names it.
    - Non-trivial attributes are shown. If the symbol carries any attribute beyond
      `{Protected, ReadProtected, Locked, Temporary}` (e.g. `Listable`, `HoldFirst`),
      demonstrate that attribute's observable effect under
      `## Properties and Relations`.
    - Every example has a caption: the one-sentence, `:`-terminated line the
      example-authoring rule requires; no bare, uncaptioned cells.
    - Balance across sections. The bars above count total examples across all example
      sections, not Basic alone. When a symbol already has a rich `## Scope` and many
      Usage-signature examples, a leaner `## Basic Examples` (one or two canonical
      cells) is fine; don't pad Basic Examples to hit a number the extended sections
      already cover.
  - A boolean or count mapped across cases is many examples, not one. An example that
    maps over a list of inputs and returns `{True, False}` or `{154, 6}` is neither
    helpful nor elegant: the reader cannot tell which input gave which answer, and the
    point of each case is lost. Split it: make each input its own example cell, with
    its own caption saying what that case shows. Reserve list output for when the list
    itself is the genuine result (a `Table` over step counts showing growth, a
    per-element mask), not as a way to pack several unrelated checks into one cell.

## Recording design and scope decisions

A symbol page carries two kinds of "why", and they go in different places by audience.
Do not mix them, and do not leave either only in the kernel source or a sidecar notes
file.

Broad, end-user-facing facts go in the visible sections. What the symbol does, the
cases it supports, its options, the properties of a returned object, and the scope a
reader must know (what returns unevaluated, what is out of scope) are for the reader,
and they are written exactly as the built-in Wolfram ref pages write them:

- `## Details & Options`, as `Notes` bullets: the representation conventions the
  arguments follow (a rule is `lhs -> rhs`, each side a list of hyperedges, a vertex in
  *rhs* only is fresh), the supported cases, what each convention decides, what the
  symbol does and does not guarantee.
- `## Scope`: demonstrate the supported cases and, crucially, the scope boundary: an
  in-scope-looking input that is actually out of scope. This paclet's symbols answer
  bad input with a message and return unevaluated, or fail with a `Failure` when an
  attempt that began could not finish (GUIDE.md, *Bulletproofing*). Show the message
  and what comes back, and record it in the output hint. The repo convention for a
  message cell's hint is the value first, then the message:

      <!-- => $Failed; the message MySymbol::unknownprop is issued -->
      <!-- => the message MySymbol::badrule is issued and the expression returns unevaluated -->

  with the real message names substituted and the real outcome stated (the hint
  records what happens, not what the built-in pages would do). A descriptive hint
  (`<!-- => the input, unevaluated -->`) is still fine when the echoed form is long,
  provided the hint also names the message. Wrappers that merely name the head hide the
  behavior the example exists to show.
- `## Possible Issues`: the limitations a reader can hit: the exponential growth of an
  uncanonicalized evolution, a property that needs an option the evolution was not run
  with, a convention that differs from a neighbouring function's. A message example
  shows its message: never wrap it in `Quiet`. The reader of the built page sees the
  message in red under the input, exactly as the built-in pages show theirs, and the
  hint names it. The caption says what issues the message and what comes back, never
  that the message is "quieted here". `scripts/run_doc_examples.wls` requires of a
  cell exactly the messages its hint names, and fails it on any other message or on
  none of the named ones; `General::stop` is ignored. `Quiet` is for an incidental
  warning that is not the example's point, inside a larger expression whose value is;
  then it names that one message (`Quiet[expr, Sym::tag]`) and the hint does not,
  since the reader never sees it.

Write visible prose in the neutral, informational voice of the built-in ref pages.
State facts about the symbol (what it does, which cases it supports, what it returns,
where the boundary is) as plain declarative sentences, the way the Details of a
built-in like `ListLinePlot` read. Two things do not belong in visible prose. First,
no editorializing: no quality claims ("high-performance", "powerful", "robust"), no
first-person-plural design talk ("we chose", "we deliberately"). Second, the easy
trap: no sentence that just re-states one of this skill's own instructions as if it
were a fact about the symbol. Compare:

- Informational (keep): "An unknown property issues a message and the result is `$Failed`."
- Rationale leaking onto the page (move it): "The function refuses rather than
  guesses, because a silent empty result would be worse than a message."

The first tells the reader the observable behavior they need; the second transcribes
the why behind the design, which is `#| annotation` material. When you catch yourself
explaining a decision in the Details, Scope, or Possible Issues, move the explanation
to the annotation tier and leave only the observable behavior visible.

Low-level, author-facing rationale goes in an MTN `annotation` marker, not the visible
prose. Why a name was chosen, why the argument structure is what it is, why a
canonicalization is applied where it is, why a cap is by arrival order: this is
design-review material for the next developer, and an end user should not meet it in
the Details. Attach it to the relevant block (typically the first `## Basic Examples`
cell) with MarkdownToNotebook's `annotation` directive inside an HTML comment:

```
<!-- #| annotation: 26.09.16: Design review - <the low-level rationale> -->
```

MTN round-trips this as a real, removable `TextAnnotation` on the block: it lives in
the notebook as an editorial annotation, out of the visible Notes/Examples flow, and
is not stripped the way a `<!-- => ... -->` output hint is. The leading `YY.MM.DD:`
date is part of the annotation text, and `scripts/lint_docs.wls` checks that it is a
date in that order. MTN's
[formatting.md](../../tools/MarkdownToNotebook/docs/formatting.md) documents the
directive. The `#|` cell directives this skill uses are `file`, `eval`, `boxes`,
`style`, `tags`, `annotation`, `collapse`, `screenshot`, `tear`, `flag` and `init`;
the converter source (`tools/MarkdownToNotebook/MarkdownToNotebook.wl`, the
`Lookup[block["Options"], ...]` reads) is the authority on the set it accepts.

The test for which tier: would a working user need this to use the symbol correctly?
Then it is a visible Detail / Scope / Possible-Issue note. Is it about why the code is
shaped this way, of interest to whoever maintains or extends it? Then it is an
`#| annotation`.

Every page carries a design discussion; this is not reserved for the complicated
symbols. At minimum, write one `#| annotation` design-review note on the Basic
Examples. And where the symbol has prior art, position it against how other systems
solve the same thing. In this field there is nearly always prior art: the Wolfram
Physics Project's `WolframModel` and `MultiwaySystem` resource functions, the
SetReplace paclet, WolframInstitute/Hypergraph, Wolfram/Multicomputation and
WolframInstitute/HypergraphRewriteEngine are the obvious neighbours of any symbol this
paclet adds, and the guide entry the symbol supersedes (a tagged link, per the
`wolfram-guide-page` skill) names the closest one. Say plainly how ours differs (a
typed return, exact isomorphism canonicalization during exploration, causal and
branchial structure in one result, a convention the neighbour lacks) or, if it does
the same thing the same way, say that and why we still provide our own. If there is
genuinely nothing to position against, note that too, so a reader knows the comparison
was considered rather than skipped. An alternative name recorded on the guide bullet
as `<!-- ALT: AltName -->` is restated here as an "Alternative name considered:
AltName." clause. This positioning is design rationale, so it belongs in the
`#| annotation` tier, never in the guide abstract. The one visible outlet is a
`## Properties and Relations` note, and only when the comparison genuinely helps a
user choose between functions; keep that note factual (state what differs,
neutrally), not a verdict that ours is preferable.

## Prose conventions

- Keep each backtick span whole on one line. When wrapping prose to the column width,
  break at a space between spans, so every span opens and closes on the same line. A
  span whose content itself contains a backtick (a WL context name such as
  `` WolframInstitute`WolframPhysics` `` or `` System`Private` ``) takes double-backtick
  delimiters with a space of padding, exactly as written here in the source.
  `scripts/lint_docs.wls` verifies both rules over all doc sources and runs in CI, so
  a clean lint is part of done.
- No em dashes, and no `--` standing in for one. Use a plain hyphen with spaces, a
  comma, a colon, or a new sentence. This holds in prose, captions, hints, table cells
  and code comments alike (GUIDE.md).
- Argument names are italics, not math. `*rules*`, `*init*`, `*n*`, `*prop*` in the
  signature, in Details bullets and in prose alike, so one name looks the same
  everywhere it appears. A subscripted argument is math (`$v_1$`, never `*v_1*`, which
  leaks the underscore, and never `*v1*`, which renders the literal pair). Never
  camelCase an argument name (`*initialEdges*`); use a short lowercase word (`*init*`).
  WL syntax being TYPED (a Rule `->`, an option, a pattern, a property string) goes in
  `<code>`/backticks, not `$...$` (which is only for math).
- Inline math is `$...$`, parsed by `LaTeXMathParse` of the `Wolfram/Parser` paclet,
  which the build installs on the building machine. This paclet's pages need little
  of it; when a formula is genuinely needed, a word never sits raw inside it
  (`$steps$` renders as a product of italic letters: write `*steps*` or
  `$\text{steps}$`), and inside a `<code>` Usage signature the `$...$` token is the
  template-argument slot, where no backslash macro survives. The full rules and probe
  evidence are in [doc-math-rendering.md](../../docs/notes/doc-math-rendering.md) and
  [doc-arg-naming.md](../../docs/notes/doc-arg-naming.md).
- No bold in prose. Don't `**bold**` words for emphasis; symbols are the only formatted
  spans, written as backtick/linked code. Uppercase for emphasis ("FINER than
  isomorphism") is the same defect in a different font.
- No subroutine-library or object-oriented vocabulary (GUIDE.md, *Documentation*). No
  "call", no "routine", no "invoke", no "returns" in the subroutine sense. Say "returns
  unevaluated", in the active voice. Write "a non-matching argument returns
  unevaluated", never "the call is returned unevaluated" and never the passive "the
  expression is returned unevaluated". Sweep the whole page, not the sentence in front
  of you. Grep the finished page (prose, captions and `<!-- => ... -->` hints alike)
  for "call", "invoke" and "routine" before you finish.
- No source-file citations. A ref page never names a kernel file, a `tools/` probe
  script, a research report under `docs/research/` or a build directory: the reader has
  the paclet, not the repository. Quote the measurement, not the script that took it.
- Property strings and option names are code, not prose. `"StatesGraph"`,
  `"CanonicalizeStates" -> Full`, `"NumStates"` in backticks every time.

## Examples and outputs

A page is not done until you have built it and read back every output cell. A fenced
`wl` cell is evaluated at build time; probe each example against the live paclet first
and paste the REAL result into an `<!-- => ... -->` HTML comment after the cell; a
wrong hint is worse than none. The hint documents the output for the reader and is
stripped from the built page. To load the paclet so examples run, give the `Context`
frontmatter; the converter inserts the `Needs[...]` initialization; do not add your
own `Needs`. `#|` cell options work as elsewhere (the full set is listed under
"Recording design and scope decisions").

Verify by evaluation, never from memory (GUIDE.md, *Documentation*). Every example on
the page must have been evaluated and must produce what the page claims, and every
version-sensitive claim about a built-in must be checked against the same kernel the
tests run on. A hint written from recollection is a defect even when it turns out to
be right.

### How examples are evaluated here

The examples run against this checkout's paclet, not an installed release. Probe from a
scratch `.wls` file, run from the repository root, never through `wolframscript -code`
(a `-code` string is parsed before `Needs` runs, so every symbol lands in `` Global` ``
and comes back unevaluated), and never `cd` first (a probe run from elsewhere loads
whatever paclet is installed instead):

```wl
PacletDirectoryLoad[FileNameJoin[{Directory[], "WolframPhysics"}]];
Needs["WolframInstitute`WolframPhysics`"];
Print[Context[MySymbol]];   (* assert the symbol resolved before trusting any output *)
rules = {{{1, 2}} -> {{1, 3}, {3, 2}}};
Print[MySymbol[rules, {{1, 2}}, 3]];
```

`wolframscript -file <path>` on that file is the whole loop. The full docs build does
the same load through `PacletDirectoryUnload`/`PacletDirectoryLoad` of
`WolframPhysics/`, so what the probe shows is what the built page shows. Record outputs
char-exact as `ToString[result, InputForm]`; regenerate, don't transcribe. Graphics and
summary boxes get no hint.

### Keep examples small

A multiway system grows exponentially. The chain rule `{{1, 2}} -> {{1, 3}, {3, 2}}`
from one edge reaches over a hundred states within five steps when every branch is
kept and only a handful when states are identified up to isomorphism, and the exact
counts depend on the convention the function implements, which is why a page measures
them rather than quoting them. The evaluation itself is usually fast on these; what
scales badly is the `Graph` built from the result and the picture the reader has to
read. "Small" therefore means:

- a rule whose left-hand side has one or two edges, an initial state of one to three
  edges, and 2 to 5 steps; go higher only with canonical states or a count, and say
  why in the caption;
- prefer a count (`"NumStates"` or whatever the symbol names it) when the point is a
  number: a count is exact, cheap, and hint-able char-exact;
- prefer a structure variant of a graph over the styled graph when the point is
  structure: it renders faster and smaller, and the styled variants exist to be looked
  at, not to make a point about edge counts;
- canonical states on any pictured evolution beyond three steps, so the picture stays
  readable; the uncanonicalized picture is the one that shows why canonicalization
  exists, and one such picture per page is enough;
- every styled graph gets an explicit `ImageSize`, through whatever route the symbol
  offers (an option it passes to the graph it returns, or the `Graph` option itself
  when the symbol returns a plain `Graph`). A graph that draws each state as a
  thumbnail with an absolute size is stored by the build's kernel-side typesetting at a
  small raw width, so a reader sees thumbnails that cannot shrink piled on each other.
  Size by the widest layer, about 55 pt per thumbnail: 420 up to 8 states, 540 up to
  16, 640 up to 30, never more than 640 (the documentation column). Above about 30
  states the thumbnails cannot fit at any allowed width: use a structure variant or
  fewer steps. `AspectRatio` reshapes a layered layout and is the only thing that does
  (`ImageSize` never changes a graph's ratio): a deep evolution or causal graph is two
  to three times taller than wide without it, so give one (`AspectRatio -> 1` or
  `1/2`) to any graph whose natural layout is taller than about 1.5 times its width,
  and leave it off a graph whose render with and without it is pixel-identical. A tall
  cell still trips the `CellHeight` / `LargeCellBounds` check; prefer a compact example
  over cropping with `#| tear: h`. Verify by rasterizing the BUILT notebook's output
  cells through the front end and looking at them, knowing that an unsized graph is
  re-laid out at 360 pt there and so looks fine in that probe while still being crowded
  for the reader: only a cell with an explicit `ImageSize` renders the same everywhere.

### Raw records

A result that is an Association of Associations keyed by id (states, events, each value
a record with keys such as `"Id"`, `"Step"`, `"Edges"`) does not render cleanly in the
built notebook as a bare Association. Show a raw record through `Keys` (to show what a
record carries) or a `Part` / `First` (one record), and say in the caption which view
the reader is looking at. A `Dataset` is for record structure the reader must see,
never for rows of numbers: data is drawn (a bar or line chart, a histogram, an
`ArrayPlot`, a labelled scatter) wherever a picture can carry it. A cell whose input is
hand-typed data starts with `#| collapse: input`, so its output shows and the input
opens from the group bracket.

### One expression per cell, and what a cell may rely on

Every `wl` cell is one expression with one output. No `;`-separated compound cells
(`rules = ...; MySymbol[rules, ...]`), no multi-line statement sequences, and no
`{f[a], g[b]}` bundles that pack unrelated results into one list. A binding the page
needs becomes its own captioned cell whose output shows the object: under
`## Basic Examples` when later sections share it, otherwise directly before the cell
that uses it in the same example group (no `---` between them).

Example cells live only as long as the built page keeps them. The cells evaluate in one
kernel in document order, but the built page resets state as it goes: a `---` and any
heading are reset boundaries, and once the page's protection snapshot arms (at the
first canonical example-section heading, `Scope`, `Options`, `Applications`,
`Properties and Relations`, `Possible Issues`, `Neat Examples`, ..., that follows an
evaluated cell), every boundary clears every binding made after it. Three rules
follow:

- Shared setup belongs under `## Basic Examples`, which is everything before that
  first canonical heading and is kept for the whole page. Define the sample rule and
  initial state there, as captioned cells whose output shows them, and every later
  section can use them.
- Every cell in a later section stands on its own. A definition and its use are safe
  together only while no `---` and no heading separates them, so put them in one cell
  group. Never fold the definition into the use as a `;`-hidden compound: a cell is one
  expression with one output, and a `;`-hidden binding is an object the reader never
  sees.
- Spell the standard section headings canonically (`Properties and Relations`, not
  `Properties & Relations`), since the canonical spelling is what the converter
  recognizes as an example section.

A cell that reads a binding a boundary threw away usually shows no error at all: it
echoes its own input back as its output, which is how the effect ships unnoticed.
`scripts/run_doc_examples.wls` evaluates every page under these exact semantics and
fails such a cell. The full rule and the probe evidence are in
[doc-example-state.md](../../docs/notes/doc-example-state.md).

Show the symbol's own return value raw, one evaluation per display. The page's symbol
gets at least one display cell whose output IS its unreduced return value (GUIDE.md,
*Showcase what functions return*), and each display cell makes one point:

- Display the raw result first; a reduced view (`Length`, `VertexCount`, a count of
  the same evolution) is its own follow-up cell with a lead-in.
- Give each distinct evaluation (a different signature, option value, or property)
  its own cell and lead-in sentence, rather than bundling them into one `{...}`
  output. A list final is right only when the list is the natural single showcase,
  like `Table[MySymbol[rules, init, k, "NumStates"], {k, 5}]` showing growth.
- Where a System function covers a property of the result, examples use it:
  `VertexCount[g]` on the returned graph, `IsomorphicGraphQ` between two results,
  `TransitiveReductionGraph` beside a transitive-reduction property, rather than a
  hand-rolled reduction.

## Build

Build the whole doc set with the repo build script. It loads `MarkdownToNotebook` from
the `tools/MarkdownToNotebook` checkout (the deployed resource only where the checkout
is missing), loads `WolframPhysics/` so the examples run against this build, and
discovers every `docs/en/**/*.md`, so a new page needs no wiring:

```
wolframscript -file scripts/build_notebooks.wls            # evaluate every example
wolframscript -file scripts/build_notebooks.wls structure   # input-only cells into docs/en/.generated, no evaluation
./build_docs.sh [structure] [only=<regex>]                  # the wrapper: finds wolframscript, inits the submodule, runs the build
```

The build is incremental (a manifest, `.doc_manifest.wl` beside the notebooks, keyed
on the markdown, the converter, the script and the build mode), converts tutorials
with `"EvaluateSeparator" -> None` and everything else with the default, and fails
loudly on a `Name`/basename mismatch. The paclet's Kernel is not part of the key: a
page whose examples evaluate paclet code is not rebuilt when that code changes, so
after a Kernel change delete the manifest or the page's notebook to force it. The
built notebook is the page the paclet ships, and it is never committed: it is rebuilt
from the markdown before every publish, and `scripts/docbuild.wls` fails the build on
a notebook that is missing or older than its markdown.

To iterate on ONE page without a full rebuild, load the converter the way the build
script does (`Get[FileNameJoin[{Directory[], "tools", "MarkdownToNotebook", "MarkdownToNotebook.wl"}]]`
after the `PacletDirectoryLoad` and `Needs`, from a scratch `.wls` run from the
repository root) and convert the single page to a scratch path, e.g.
`MarkdownToNotebook["docs/en/ReferencePages/Symbols/MySymbol.md", "<scratch>/MySymbol.nb"]`.
The build script is the single place that resolves where `MarkdownToNotebook` comes
from: the submodule checkout, never a patched copy. Nothing else runs after it: the
built notebook is the page the paclet ships, and no `DocumentationBuild` pass is
involved until `scripts/docbuild.wls` prepares a deploy (AGENTS.md, "Toolchain the
skills assume").

## Check

Verify rendering, not source, for anything typographic (GUIDE.md, *Documentation*).
Context names, argument subscripts, tables and cell heights are all correct-in-source,
wrong-on-delivery failure modes that reading the markdown cannot catch: build the page
and look at the built result.

Run every gate before calling the page done:

1. `wolframscript -file scripts/run_doc_examples.wls docs/en/ReferencePages/Symbols/<Name>.md`:
   the runner mirrors the built page's state semantics (reset at boundaries for ref
   pages), compares every recorded hint with the real output, and fails a cell that
   would echo unevaluated or read a lost binding.
2. `wolframscript -file scripts/lint_docs.wls` from the repository root: clean, whole
   tree.
3. `python3 tools/dev/doc_symbols_check.py`: the page's symbol is exported, and every
   `ref/`, `guide/` and `tutorial/` link on it resolves.
4. `./build_docs.sh only=<Name>`: the page the paclet will ship, built from the
   markdown you are about to commit. Look at it; commit the markdown alone.
5. Optional, and only meaningful when someone opens the built notebook in a front
   end: the docked *Check* button on the page. None of this paclet's gates depends on
   it.

The docked *Check* button (top of a DocumentationTools authoring notebook) lints the
document against the Wolfram documentation guidelines and reports hints by level.
Headless, the same lint runs through
`` DefinitionNotebookClient`CheckDefinitionNotebook[nbo] `` after stamping CellIDs and
saving (the headless build does not assign CellIDs, and the scraper needs them to
locate cells):

```wl
Needs["DefinitionNotebookClient`"]
UsingFrontEnd @ Block[{nbo = NotebookOpen[File["MySymbol.nb"]]},
    CurrentValue[nbo, CreateCellID] = True;
    SelectionMove[nbo, All, Notebook];
    FrontEndTokenExecute[nbo, "Save"];
    Normal @ DefinitionNotebookClient`CheckDefinitionNotebook[nbo]
]
```

Each row is `<|"Level" -> ..., "Tag" -> ..., "Parameters" -> ...|>` with `Level` one
of `Suggestion` / `Warning` / `Error`. Tags worth acting on when the check is run:
`DescriptionTooLong` (shorten to under 128 chars), `ExampleTextLastCharacter` (end an
example caption with `:`), `FoundUnformattedCode` (wrap a stray WL symbol in
`` `backticks` `` or in an inferred link with empty parens like `[Graph]()`),
`ThreeDotEllipsis` (use `…` not `...` in prose), `NotASystemSymbol` (link foreign
names instead of formatting them as system symbols), `LargeCellBounds/CellHeight`
(rasterized output too big: set `ImageSize`, or shrink the example).
