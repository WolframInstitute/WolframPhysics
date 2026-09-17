# Example state on a built page (what a `---` and a heading throw away)

Ported from PureMath's `docs/notes/` (the measurements and the page names in it
are PureMath's). The rule holds here unchanged: the converter is the same
`MarkdownToNotebook`, the checkout in `tools/MarkdownToNotebook` that
`scripts/build_notebooks.wls` loads with `Get` (the deployed resource function
is used only when the checkout is missing, and no cloud login is needed either
way). The probe pages and the probe script that produced the evidence below
are not carried in this repository; they were re-pointed at each paclet that
ported the note and can be rebuilt from the descriptions given here.

Status: established 2026-08-20 against the deployed `MarkdownToNotebook`, by
building probe pages and reading the outputs the converter computed, then
confirmed against the converter's own definitions.

## TL;DR - the rule

A page's `wl` cells evaluate in one kernel session, in document order, inside
a private per-page context, and the built page throws part of that state
away as it goes:

- A reset boundary is a thematic break (a line of three or more identical
  `-`, `_` or `*`) or any ATX heading, at any level. Inside a fenced block
  both are code, not boundaries.
- Boundaries do nothing until the page's protection snapshot arms. It arms
  at the first heading whose whole text is one of the canonical example-section
  names, matched case-insensitively, and that follows at least one
  already-evaluated cell:

  > basic examples, scope, scope and additional elements, generalizations and
  > extensions, options, applications, visualizations, analysis, properties and
  > relations, possible issues, neat examples, requirements

  At that instant every symbol the page has defined so far is protected for the
  rest of the page.
- From then on, every boundary `ClearAll`s every page symbol outside the
  snapshot.

For a house-style symbol page (Usage, Details & Options, Basic Examples, Scope,
Properties and Relations, Possible Issues) that reads: the first cell sits under
`## Basic Examples`; the `## Basic Examples` heading itself precedes it, so it
arms nothing; the next canonical heading, usually `## Scope`, arms the snapshot.
A definition therefore survives the whole page exactly when it is made before
that heading, which in house style means under `## Basic Examples`. A cell in
Scope or any later section keeps its bindings only until the next `---` or
heading.

Two consequences worth naming, because they look like exceptions:

- A page whose sections after the first cell are all non-canonical
  (`### a subsection`, `Details & Options`, `Properties & Relations` spelled
  with an ampersand) never arms the snapshot, so nothing is ever cleared and the
  page threads state end to end. Spelling an example section canonically is what
  arms the rule; `Properties and Relations` arms it, `Properties & Relations`
  does not.
- Only symbols in the page's own context are cleared. A paclet symbol's
  `UpValues`, `$Assumptions`, `Off[...]`, `SetOptions` and anything else set
  outside that context survive every boundary.

## Probe evidence

The probe page `DocExampleResetRule.md` (not carried here) is a symbol page
that defines `p1` under `## Basic Examples`, `p2` after a `---` still inside
Basic Examples, `p3` after a non-canonical `### subheading` still inside
Basic Examples, then `q1` and `q2` under `## Scope`. Built with the converter,
it computes:

| input cell | built output | reading |
| --- | --- | --- |
| `{p1, p2, p3}` (end of Basic Examples) | `{1, 2, 3}` | the `---` and the `###` inside Basic Examples cleared nothing |
| `{p1, p2, p3, q1}` (Scope, before any boundary) | `{1, 2, 3, 4}` | a Scope binding is live inside its own cell group |
| `{p1, p2, p3, q1}` (Scope, after `---`) | `{1, 2, 3, q1}` | the separator cleared `q1`; `p1`, `p2`, `p3` are all protected, so the snapshot armed at `## Scope`, not at the earlier `###` |
| `{q2}` (after a non-canonical `###` in Scope) | `{q2}` | once armed, any heading resets, canonical or not |
| `{p1, p2, p3, q1, q2}` (Properties and Relations) | `{1, 2, 3, q1, q2}` | Basic-Examples bindings reach the last section |

An earlier two-section probe showed the same thing in miniature: `a1 = 11`
defined in Basic Examples still answers `12` four boundaries later, while
`b1 = 21` defined under `## Scope` is gone at the very next separator and its
consumer builds as `2 + b1`.

The reader-visible failure mode is that last cell: a lost binding usually
produces no message at all, just an input echoed back as its own output.

## Where it comes from in the converter

The mechanism is template-independent; it lives in the evaluator, not in the
templates. `MarkdownToNotebook`'s `"EvaluateSeparator"` option drives a fold
over the page's executable cells, separators and headings:

- `resetBoundaryQ[mode, item]` is `False` for `mode` `None`; for `All` it is
  every executable cell as well; otherwise it is exactly
  `MatchQ[item["Type"], "Separator" | "Heading"]`.
- `captureProtectedQ` takes the snapshot when no snapshot exists yet, at least
  one cell has run, and the item is a heading whose text is in the converter's
  `$exampleOrder` list (the canonical names quoted above).
- `resetState` clears nothing while no snapshot exists; afterwards it
  `ClearAll`s `Complement[<page context symbols>, <snapshot>]`.
- Separators are recognized as three or more identical `-`, `_` or `*`;
  headings as a line starting with `#` characters and a space.

## The three templates

The evaluator is the same for all of them; what differs is the heading
vocabulary each template's house style uses, plus the option this repository passes:

- Symbol pages carry canonical example headings by construction, so the
  snapshot arms on essentially every page and the rule bites.
- Guide pages use `Abstract`, `Functions` and `### subsection`
  headings, none of which is canonical, so a guide never arms the snapshot. The
  Guide template also drops code cells entirely - a guide's examples are not
  rendered at all, and no guide in `docs/en` has any.
- TechNote (tutorial) pages are built with `"EvaluateSeparator" -> None`
  (see the `TutorialQ` page flag and the per-page conversion options in
  `scripts/build_notebooks.wls`), which
  disables boundaries outright, so a tutorial legitimately threads state from
  its first cell to its last.

## What the gate does with it

`scripts/run_doc_examples.wls` mirrors the rule: it parses each page into the
same ordered stream of cells, separators and headings, evaluates the cells in a
per-page context on the converter's context path, arms the same snapshot and
`ClearAll`s at the same boundaries. A cell fails when it issues a message, when
it times out, or when it reads a page symbol whose definition a boundary threw
away - either echoing the symbol back in its output, or quietly computing
something else from it. Three guards keep that last check honest: only symbols
that carried a definition are tracked, so the plain `x` of an `Integrate` is
never mistaken for a lost binding; a cell that binds the name itself (a
pattern variable, an iterator, a `Module`/`Block`/`With`/`Function` local) is a
different symbol wearing the same name and passes; and `General::shdw` is off,
because a shadow warning reports the order this harness loaded its packages in
and the built page carries no such message.

The silent-computation half of the check is not a refinement, it is a quarter of
the corpus of the defect. On PureMath's built `GeneralizedEigenspace` page,
`Length[NullSpace[j - 3 IdentityMatrix[3]]]` reads a `j` cleared at the
separator above it and neither echoes nor complains: `Plus` threads over the
identity matrix, `NullSpace` gets a perfectly good symbolic matrix, and the page
prints 0 where the author documented 1.

Measured over PureMath's `docs/en` on 2026-08-20, on 20639 cells in 2243 pages:
the runner before this change passed every one of them; the runner after it
condemns 149 pages, all of them reference pages (`ReferencePages/Symbols`),
no tutorial. A control run of the same runner with only the resets disabled
leaves 0 failures, so the resets are the whole of the difference. (That control
first reported 2, both of them one load-order shadow warning on a
`LinearModelFit` page that the built notebook does not carry, which is why
`General::shdw` is off.) Wall time is unchanged (5:32 against 5:04 before),
because the mirror is one sequential pass with a `ClearAll` at each boundary,
not a re-evaluation per segment.

Two fixture pages pinned the gate down in the repositories that carried them
(neither is carried here; each is a few lines to recreate):

- `DocExampleResetFail.md` names `modulus` under `## Scope` and reads it after
  a `---`. The built page shows `Divisors[modulus]` and `Prime[modulus]` echoed
  back. The pre-2026-08-20 runner called the page clean; the runner now fails
  both cells.
- `DocExampleResetPass.md` makes the same binding under `## Basic Examples`
  and keeps its Scope cells self-contained. Both runners call it clean, and the
  built page shows real values throughout.

The authoring rules that follow from this belong in GUIDE.md, under its
documentation section.
