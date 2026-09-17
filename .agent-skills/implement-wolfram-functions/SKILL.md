---
name: implement-wolfram-functions
description: "Implement the WolframPhysics symbols listed in a guide page as a Wolfram Language feature file under `WolframPhysics/Kernel/<Category>/<Field>.wl` (StructuredPackageFormat: `PackageExported` declarations, usage messages, and definitions), plus a matching `WolframPhysics/Tests/<Category>/<Field>.wlt`. Reads a `docs/en/Guides/...md` guide and writes simple, robust implementations defined in terms of built-ins and other paclet functions, deliberately limiting scope and leaving out-of-scope input unevaluated (reserving `Failure` for an attempt that actually fails) rather than building fragile, hard-to-review machinery. It also keeps the guide contract and the paclet version synchronized. Use this whenever the user wants to turn a guide page into kernel code, implement or stub the symbols a guide lists, write or extend a `WolframPhysics/Kernel/...wl` field file, or \"make the functions in <guide> actually work\". Trigger it even when the user only points at a guide `.md` and a Kernel path without saying \"implement\"."
---

# Implementing a guide page's functions

This skill turns a WolframPhysics guide page (`docs/en/Guides/...md`, authored by the
[wolfram-guide-page](../wolfram-guide-page/SKILL.md) skill) into a kernel feature file
that defines its symbols. The guide is the specification: its unmarked bullets, with
their one-line descriptions, are the contract you implement.

The paclet ships no code today. `WolframPhysics/Kernel/` holds only the umbrella
loader and its parameter files, and the first feature file written with this skill
creates the first category directory. That makes the discipline below more important,
not less: the first file is the model every later one copies.

## The prime directive: simple enough to review at a glance

A human reviewer may not have time to study every definition closely, and fragile,
clever code that is wrong in a corner case is worse than honest code that does less.
So the bar for every definition is: a reader can see at a glance that it is correct.
Two habits get you there, and they are the whole point of this skill:

1. Define each function in terms of built-ins or already-defined paclet functions.
   A canonical form built on `CanonicalGraph` is right because `CanonicalGraph` is
   trusted; a hand-rolled isomorphism test is a liability. Reach for the kernel first
   (`Graph` and its functions, `Subsets`, `Tuples`, `Select`, `Cases`, `Fold`,
   `NestWhile`, `GroupBy`, `ReplaceList`, the `*Graph` families, ...), then for sibling
   symbols in the same paclet, and only then write fresh logic. "Built-ins" means
   documented, public functions: avoid undocumented `` System`Private `` internals; if
   you need what one provides, prefer to re-implement it as a plain paclet helper (see
   GUIDE.md, *Avoid depending on `` System`Private` `` internals*). A definition never
   reaches for `ResourceFunction[...]` or another paclet's context: the paclet loads
   and evaluates with the kernel alone, and a dependency on another paclet is a
   `PacletInfo.wl` decision to agree with the user first.

2. Limit scope instead of chasing generality. If a symbol's full generality would
   need fragile or sprawling code, implement the tractable cases simply, document the
   supported cases in the usage message, and leave every other input unevaluated (a
   later definition can extend it). Narrowing scope is the correct, expected outcome
   here, not a failure to finish. A symbol that reads off finite, explicit hypergraphs
   and returns unevaluated on a symbolic one is doing this right.

When these two pull against "implement everything the guide lists", they win: a
narrowed, obviously-correct definition that leaves the hard cases unevaluated beats a
sprawling one a reviewer has to trust blindly. Say in your summary what you scoped
down.

But scope has a floor: do not ship a function that cannot answer the question its name
asks on the inputs a reader reaches for first ([GUIDE.md](../../GUIDE.md), *Scope has a
floor*). Bounded by cost is fine; bounded by capability on its own first examples is
not. An evolution function that handles the chain rule from one edge for a few steps
and is merely slow past a few thousand states has a performance ceiling, and it ships.
A predicate that returns `True` or returns unevaluated but never `False` is answering
"true or cannot tell", and its name does not say so. Where a function is genuinely
partial, say so in the usage message and make sure the name does not promise the
general case; where it cannot clear the floor, do not ship it: repair the guide
contract instead.

## Read first

- [GUIDE.md](../../GUIDE.md), the paclet's Wolfram Language style guide and the single
  home of the design rules this skill applies. The load-bearing sections for this task
  are *Naming* (*A name must say what the object is*, *Never abbreviate, contract, or
  initialise*, *Never collide with a System symbol*), all of *Designing the interface*
  (never require a wrapper around what the system already understands; a predicate
  must not be stricter than the functions it guards; a predicate answers True or
  False, whatever its arity; functions, not an open-ended string accessor; split
  abstract from concrete deliberately; scope has a floor), *Check a System symbol's
  attributes before reusing it as notation*, *Argument patterns and fall-throughs*
  (give each valid form its own specific pattern; `predicateQ[___] := False`),
  *Bulletproofing* (unsupported input gives a message and returns unevaluated, never a
  `Missing`; signal a failed attempt with a `Failure` object, never `Message` +
  `$Failed`), *Comments* (recording what was rejected), *Usage messages*, *Paclet
  structure (StructuredPackageFormat)*, and *Tests*. This skill states each rule in its
  own words at the point where you hit it; go there for the full statement and the
  reasoning.
- [CONTRIBUTING.md](../../CONTRIBUTING.md): the repository layout, how the paclet is
  loaded and tested, and the version bump. The file goes at
  `WolframPhysics/Kernel/<Category>/<Field>.wl` with a mirrored test at
  `WolframPhysics/Tests/<Category>/<Field>.wlt`, in the same category the field's guide
  and reference pages use.
- The umbrella loader,
  [WolframPhysics/Kernel/WolframPhysics.wl](../../WolframPhysics/Kernel/WolframPhysics.wl):
  a single `PackageInitialize` of the `` WolframInstitute`WolframPhysics` `` context
  that loads every `.wl` under `Kernel/`, `InitialEvaluations.wl` first and
  `FinalEvaluations.wl` last. A new feature file is loaded because it is under
  `Kernel/`; nothing registers it.
- The research report for the source the symbols came from, under `docs/research/`,
  and the guide entry each symbol supersedes: together they carry the closest existing
  implementation (a resource function, a paclet symbol), its argument forms, and what
  it computes. Use them to fix argument forms before you code. Re-verify their claims
  in the target kernel: System-symbol collisions (`` Names["System`<Name>"] ``) and
  built-in availability and behavior are `$VersionNumber`-dependent, and a report can
  be stale or simply wrong. This repo targets WL 15.0 (the paclet needs 15.0 or later: StructuredPackageFormat); a
  cloud or MCP evaluator may be an older version, so confirm any version-sensitive
  fact against the same kernel the tests run on, from a scratch `.wls` run with
  `wolframscript -file`.

## What to implement, and where

Implement only the guide's own WolframPhysics symbols: the unmarked `- ` bullet items
that are bare chips. The `(WL)`-marked entries are built-in System functions that
already exist; never reimplement those. The tagged-link entries are functions that
live elsewhere in the ecosystem; they are not a contract to implement either. A
symbol that supersedes one is proposed on the guide first, as an unmarked bullet per
the `wolfram-guide-page` skill's survey gate, and only then implemented; when it
lands, the external entry changes per that skill's *future state* rule. A symbol may
legitimately be cross-listed, appearing as a primary bullet under more than one
section because it fits both. That is one symbol, so implement it once; the repeated
bullets are not a duplicate to resolve and do not mean two definitions.

Clear every symbol against the built-ins by FUNCTIONALITY before defining it. This
stage is the last line of defense (deciding a symbol against the built-ins is
nominally the `wolfram-guide-page` skill's job) and the check that matters is what the
kernel can already compute, not what the kernel already calls things:

1. Search by capability, under any name. Describe what the symbol does to the
   documentation search, and try synonyms for the operation, not just the name you
   intend to use. Then verify each candidate in the kernel and evaluate it on an
   example alongside your definition.
2. Only then check the name, via the FULLY-QUALIFIED context,
   `` Names["System`<Name>"] =!= {} `` (a bare `` Names["<Name>"] `` resolves through
   `$ContextPath` and can miss or misattribute a collision; the converter's own
   built-in check uses the qualified form). A clean name proves nothing about
   duplication: an audit of a sibling paclet's every export against every `` System` ``
   name found no collisions while the real duplicates sat behind different names.
3. Record the decision where it can be falsified later: which built-ins you evaluated,
   what they returned, and the `$VersionNumber` you evaluated them on. Put it in the
   inline `(* *)` note or `docs/notes/<Topic>.md` (see *Record the design decisions*).

### Naming an exported symbol

A clean collision check tells you a name is available. It does not tell you the name
is good. Both rules below are stated in full in [GUIDE.md](../../GUIDE.md), *A name
must say what the object is* and *Never abbreviate, contract, or initialise*; what
follows is what they cost you at the keyboard.

1. The name must carry enough context to say what the object is: in practice two
   words, often three (`MultiwayEvolution`, `CausalGraph`, `BranchialGraph`,
   `CanonicalHypergraph`). Sufficiency is the rule, not the count; never trim a name to
   hit a number. A single word is admissible only where it is unique to the object;
   `Hypergraph` and `Rule` do not qualify. That is a fact about the word, so "I think
   this one is fine" is not a use of the exemption.

2. Do not abbreviate, contract, or initialise. `HGEvolve` is the neighbouring
   engine's spelling, not this paclet's; here the word is spelled out. This holds for
   abbreviations that are standard in the field, and note that an abbreviation collides
   differently from the word it stands for, so it defeats the collision check above.
   Established Wolfram Language spellings (`Q` for a predicate, `$` for a global) are
   not abbreviations; nor are single letters that are the subject's own notation
   inside a longer name.

When in doubt, stop and ask, before writing, not after. A name is the most expensive
thing in the file to change later: it reaches tests, guides, reference pages, tutorials
and every downstream caller.

Record the naming decision and what you rejected in the inline `(* *)` note, so the
next person can see the choice was made rather than defaulted into.

A justification for a symbol goes stale; write it so it can be rechecked. Built-in
coverage is `$VersionNumber`-dependent and the repo targets WL 15.0, while a cloud or
MCP evaluator may be older and silently miss recent additions. Confirm every
version-sensitive claim against the same kernel the tests run on. Never write a bare
assertion that a built-in is missing or broken.

If a built-in already does the job, by any name, update the guide rather than wrapping
it. If it nearly does the job, the symbol may still be worth having, but then the
difference is the whole justification: state it in the usage message and flag it for
a Properties and Relations example on the ref page (see *Record the design
decisions*). A one-line composition over a built-in that adds no generality, no guard,
and no typed return is not a symbol; it is a name for an expression. The same test
applies against the ecosystem: a symbol that merely renames a resource function adds
nothing the guide's tagged link did not already give the reader. Likewise, if
implementation unifies, renames, defers, or materially reclassifies a listed symbol,
repair the guide contract in the same change instead of leaving a stale bullet.

Choosing the file. The target is `WolframPhysics/Kernel/<Category>/<Field>.wl`, and the
category is decided by the guide: four trees share one taxonomy. `WolframPhysics/Kernel/`,
`WolframPhysics/Tests/`, `docs/en/ReferencePages/Symbols/` and `docs/en/Guides/` carry
the same top-level category directories, so a guide's category is its kernel
category, and its test's, and its ref pages'. Keeping the four aligned is the standing
rule; place new files by it:

- The guide that chips the symbols decides the category. Put the file under the same
  top-level `<Category>/` as the guide page listing its exported symbols, and its
  tests at the mirrored `WolframPhysics/Tests/<Category>/<Field>.wlt`.
- Match on the top level only. Kernel and Tests are one directory deep (a category
  folder holds `.wl` / `.wlt` files directly) while Guides and ReferencePages may
  nest further by field.
- Check whether some of the field's symbols already live in an existing file and
  extend that file rather than creating a parallel one.
- Today there are no categories. The first feature file creates the first one, which
  is a taxonomy decision: agree the category name with the user, then create the
  directory in all four trees at once, with the category's guide as its eponymous
  page (`docs/en/Guides/<Category>/<Category>.md`, per the `wolfram-guide-page` skill)
  and the root guide linking to it. The umbrella loader picks the new directory up
  with no edit.

## Keep related content current

- If a field or guide is added, renamed, moved, or cross-listed, use the
  `wolfram-guide-page` rules to keep its body-link DAG placement, reciprocal
  `RelatedGuides`, parent summaries, and applicable tutorial backlink current, and to
  retire the external entry a new symbol supersedes.
- Bump the version. Increment `"Version"` in `WolframPhysics/PacletInfo.wl` with every
  addition (a new field, or new symbols in an existing one): a patch bump for symbols
  or fixes, a minor bump for a new field. `$WolframInstituteWolframPhysicsVersion` in
  `WolframPhysics/Kernel/GeneralParameters.wl` reads the version from the
  `PacletObject` at load, and `Tests/GeneralParameters.wlt` checks that it does, so
  nothing else changes. The PacletManager keys on version, so a bump lets a fresh load
  prefer your updated paclet over an installed or cached copy left at the old version;
  keep the tree free of stale duplicate copies of the paclet, since
  `PacletDirectoryLoad` discovers them all and `Needs` can still load an older one.
- `scripts/docbuild.wls` fills the Kernel extension's `"Symbols"` list in the built
  copy from the `PackageExported` lines under `Kernel/`, so an exported symbol gets its
  click-to-copy `PacletSymbol` wrapping on the resource pages with no edit to the
  tracked `PacletInfo.wl`.
- A kernel change does not rebuild the documentation by itself. The notebook build's
  incremental key leaves the Kernel out, so a page whose examples evaluate the code
  you changed keeps its old outputs until you delete
  `WolframPhysics/Documentation/English/.doc_manifest.wl` (or the page's notebook) and
  run `./build_docs.sh`; `wolframscript -file scripts/run_doc_examples.wls` shows
  which recorded hints the change broke.

## Feature-file skeleton

Declarations and usage messages at the top, definitions below, grouped by symbol. No
trailing `;` on top-level definitions.

```wolfram
(* ::Package:: *)

(* ::Section:: *)
(*PackageExported*)

PackageExported[SymbolOne]
PackageExported[SymbolTwo]

(* ::Section:: *)
(*PackageScoped*)

(* cross-file-shared internals, if any - often none *)

(* ::Section:: *)
(*UsageMessages*)

SymbolOne::usage = "SymbolOne[arg] gives ... . Supported cases: ... ."
SymbolTwo::usage = "SymbolTwo[a, b] gives ... ."

(* ::Section:: *)
(*Function Definitions*)

(* ::Subsection:: *)
(*SymbolOne*)

(* one or two lines on what it does and any scope limit *)
(* validity is in the pattern, so an unmatched argument returns unevaluated *)
SymbolOne[arg_validForm] := simpleBody
```

Notes that matter:

- A usage message is template-first, one form per line, and states the supported
  cases so the scope limit is visible without reading code. Write it before the
  implementation; it forces you to settle the argument forms.
- Symbols you neither `PackageExported` nor `PackageScoped` are automatically private
  to the file: use lowercase private helpers and scoping predicates (`hypergraphQ`,
  `explicitRuleQ`) freely; they are how you express "in scope".
- A `PackageScoped` symbol is shared across files of the paclet by short name; the
  umbrella loader registers the `` WolframInstitute`WolframPhysics`PackageScope` ``
  context so tests and downstream code can `Needs` it when they must reach one.
- Reference sibling symbols by short name (the context is loaded); never write
  fully-qualified `` WolframInstitute`WolframPhysics`Foo ``.
- Comment in the house style: a file-top header block naming what the file covers and
  pointing to `docs/notes/<Topic>.md`, `(* === group === *)` ASCII banners to cluster
  the definitions, and a terse one-liner above each definition that states the
  encoded relation (`(* lhs edges consumed, rhs edges created, fresh vertices new *)`)
  rather than prose. Keep the deeper rationale for
  `docs/notes/<Topic>.md` and point there. The `(* ::Section:: *)` notebook-cell
  markers above are the structural choice; match whichever the sibling files in your
  target category already use.

## Implementation discipline

- Never require a paclet wrapper around an expression the system already
  understands. A list of edges is a hypergraph, a `Rule` of two such lists is a
  rewriting rule, a `Graph` is a graph: they must be accepted by the operations, and
  satisfy the predicate, without being wrapped first. A wrapper that exists so the
  paclet has somewhere to hang extra data is fine; one the user is required to apply
  before anything works is not. The corollary, because it was got wrong in practice
  elsewhere: a predicate must not be stricter than the functions it guards. Whenever
  you write a `...Q` that names a structure, evaluate it on each concrete System
  object the operations already take.
- Prefer a small set of functions to an open-ended string-accessor interface, and
  where a System function already covers a property (`VertexCount`, `EdgeList`,
  `GraphDistance`) use it rather than standing an `obj["VertexCount"]` accessor
  beside it. This is emphasis, not a ban: an accessor bag is load-bearing where an
  object has kinds carrying different extra data (an evolution's states, events,
  causal and branchial graphs). The rule is that the accessor must not be the only
  route to data a reader will reach for.
- Split abstract from concrete deliberately ([GUIDE.md](../../GUIDE.md), *Split
  abstract from concrete deliberately*). Representation-independent operations take
  the abstract object; operations that are themselves abstract return an abstract
  object, so they compose; operations that genuinely depend on a choice of
  representation (a vertex labeling, an event ordering) require that choice as an
  argument. And constructing the abstract object from a concrete one gives the generic
  object, not the argument handed back unchanged.
- Error handling: prefer unevaluated; reserve `Failure` for a failed attempt. Give
  each valid form its own specific pattern and push validity into the pattern
  (`f[x_Integer]`, `f[x_?okQ]`). Input the function doesn't handle (wrong type, wrong
  shape, or a well-formed case you scoped out) then matches nothing and is returned
  unevaluated, with no catch-all clause. This is idiomatic Wolfram Language: an
  unmatched form is left alone, free to be used symbolically or gain a definition
  later. Return a `Failure[]` only when the function engaged and the attempt failed:
  it matched, began computing, and a step it could check only after entry did not work
  out (next bullet). A `Failure` reports an attempted operation that could not finish;
  it is not a way to scold the caller for the wrong type. Never return `Missing` for
  unsupported input either, and the reason is not stylistic: a `Missing` is a value,
  so it flows silently into arithmetic downstream, and it forecloses the later
  definition that would have handled the case. An unevaluated expression does
  neither, and says plainly that nothing was computed ([GUIDE.md](../../GUIDE.md),
  *Bulletproofing*).
- A missing guard does not give an unhelpful answer, it gives a confident wrong one.
  Write the in-scope pattern so that the cases the algorithm silently assumes
  (explicit edges, integer or symbol vertices, a finite step count, a rule whose
  right-hand side names every left-hand vertex it keeps) are the cases it can match,
  and test the boundary; see *Tests*.
- Predicates (`...Q`) fall through to `False` for ill-typed or out-of-scope input, not
  a `Failure`: `fooQ[___] := False`; a predicate answers a yes/no question, and bad
  input is just "no". A `[___] := False` catch-all must nonetheless never tell a
  caller "false" about input that is valid but undecided; that is a wrong answer
  wearing a guard's clothing. A predicate whose truth is genuinely undecidable for
  some valid inputs should guard its `False` on bad input only and leave the
  undecidable cases unevaluated. A robust way to build a sound-but-incomplete
  predicate is to decide each direction only where it is provable: one clause yields
  `True` only when provably true, another yields `False` only when provably false,
  and the rest stays symbolic.
- Leaving the expression symbolic also covers undecidability. At the code level an
  undecidable case and out-of-scope input are both simply "no matching clause";
  distinguish them for the reader in the usage message (out of scope versus no
  definite value).
- Use `Enclose` + `ConfirmBy`/`ConfirmMatch` for failures you can detect only after
  starting work: a degenerate intermediate, an empty result, a `ConfirmBy` on a value
  the coarse entry pattern had to admit. The first failed `Confirm` makes the
  `Enclose` return a `Failure`, which is right because the function genuinely tried.
  Pass any inner `Failure`/`$Failed` upward immediately; never use `Return`.
- Prefer one `Switch`/`Which` over a stack of `If`s on the same value; check cheap
  validity before expensive work; no `For` loops or `AppendTo` (see GUIDE.md).
- Constants are set with `=` to a value (or held when they must stay symbolic).
  Reserve the `$Name` form for a constant tied to how the Wolfram Language evaluates
  (a global setting or session/system state that changes how code runs, like
  `$RecursionLimit`); a domain constant that is just a value takes no `$`. An
  "object" head (a symbol used as a wrapper like `MultiwayEvolution[...]`) is just
  stored structurally; give it the property/inspection down-values the guide implies,
  and keep them simple.
- Check a System symbol's attributes before reusing it symbolically. Evaluate
  `Attributes[sym]` first, every time. `NonCommutativeMultiply` is `Flat`, so it
  silently reassociates; `CircleTimes` and `CirclePlus` carry no attributes, which is
  exactly what makes them safe as abstract notation. For an operator that is pure
  notation the default is no attributes at all: the operators are inert syntax, and
  every algebraic law belongs to the structure that interprets the expression, never
  to the notation. Do not set `Flat`, `Orderless` or `OneIdentity` on a notational
  head because the structure you have in mind happens to satisfy them.
- A `Function` stored in returned data binds formal symbols. A lambda kept in an
  object's association or returned by a property prints wherever the object does, and
  a plain `v` there leaks its full `` Private` `` context path into the user's output;
  formal symbols (`\[FormalV]`) display as clean italic letters. When the body needs a
  constructor value, inject it structurally so the formals survive:
  `Function[\[FormalV], f[\[FormalV], \[FormalP]]] /. \[FormalP] -> p` rather than
  `Function[\[FormalV], f[\[FormalV], p]]` on a `p_` definition. Purely internal
  lambdas that are applied and gone keep ordinary short names.

## Tests

Write a focused `WolframPhysics/Tests/<Category>/<Field>.wlt`, self-contained the way
`WolframPhysics/Tests/GeneralParameters.wlt` is: register the paclet from whichever of
the working directory and `WolframPhysics/` beneath it holds `PacletInfo.wl` (copy
its `Scan[PacletDirectoryLoad, ...]` head, which never registers the repository root
itself, since a wider `PacletDirectoryLoad` lets a stale duplicate copy win), then
`` Needs["WolframInstitute`WolframPhysics`"] `` and
`VerificationTest[expr, expected, TestID -> "..."]`. Cover, per symbol, a basic correct
case or two, and, importantly, the scope boundary: out-of-scope or ill-typed input is
returned unevaluated (assert with `MatchQ[f[bad], _f]`), and for a step that tries and
fails, `FailureQ @ f[...]` is `True`. Where the symbol supersedes an ecosystem
function, the research report's documented values (a state count at a step, a causal
graph's edge count) are test oracles; cite the source in the test's comment. These
tests are what prove the scope limits actually hold, so they are part of the job, not
an afterthought.

## Record the design decisions

Record what was rejected as well as what was chosen, and say when the decision was
ours to make rather than handed down by the mathematics, a built-in's behavior or a
review: a later reader is entitled to know which decisions can be revisited without
breaking anything ([GUIDE.md](../../GUIDE.md), *Comments*). "Edges as lists, not
`UndirectedEdge`" is half a record; "edges as lists, not `UndirectedEdge`, because a
hyperedge is ordered and has any arity; our call, revisitable" is the whole one.

Design decisions live in three places, by audience:

- Per-symbol: the symbol's reference page, in two tiers by audience. What a user
  needs (the supported cases, the options, and the scope boundary: what returns
  unevaluated, what is out of scope) goes in the visible `## Details & Options`,
  `## Scope`, and `## Possible Issues` sections. The lower-level why (why a name, why
  the argument structure, how ours differs from the resource function or paclet
  symbol it supersedes, a compatibility pin) goes in an MTN
  `<!-- #| annotation: YY.MM.DD: ... -->` marker on the relevant block, which
  round-trips as a removable editorial annotation rather than visible prose. Both are
  authored with the `wolfram-symbol-page` skill (see its *Recording design and scope
  decisions*); when you scope a symbol down or make such a call during
  implementation, write it up, inline for the ref-page author or in your summary, so
  it reaches the right tier of the page.
- Local, developer-facing: inline `(* *)` comments at the definition, the terse "why"
  of one clause, in the house style above.
- Topic-level: `docs/notes/<Topic>.md` (create it if absent), material that spans
  symbols (a shared representation convention, a naming or collision call across the
  file) or that has no symbol to attach to (a capability deferred with no clean
  elementary route, so no `ref/` page exists to carry it). Whenever two proposed
  symbols were unified or one was deferred, this is where the field-level record
  goes; the per-symbol consequence still surfaces on the relevant ref page.

A recurring decision worth recording: whether several proposed symbols are really one
parameterized function (a states graph and a causal graph as two properties of one
evolution rather than two evolutions; a canonical form at several identity conventions
as one option rather than several symbols). Keep a distinct symbol when the concept
genuinely differs. Update the guide when you find them.

## Verify and report

- Run the field's tests:
  `wolframscript -file scripts/run_tests.wls WolframPhysics/Tests/<Category>/<Field>.wlt`
  from the repository root (needs a local Wolfram kernel and the repo on disk), and
  `wolframscript -file scripts/run_tests.wls` for the whole suite before you finish,
  since `Tests/GeneralParameters.wlt` pins the version. If only the cloud
  `WolframLanguageEvaluator` is available, it has no access to the repo files:
  sanity-check definitions by pasting the relevant code and a few example evaluations
  directly into the evaluator instead, and say so.
- In your summary, report faithfully: which symbols you implemented, which cases each
  one supports, what you deliberately left out of scope (and why), anything you found
  redundant with a built-in or an ecosystem function, the guide entries you changed,
  and the actual test results. If tests fail, say so with the output.
