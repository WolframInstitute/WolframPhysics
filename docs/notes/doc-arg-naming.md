# Argument/variable naming in documentation pages (subscripts, letter-number, interCaps)

Ported from PureMath's `docs/notes/`; the rendering rules hold here, the
converter being the same. In this repository the converter is the
MarkdownToNotebook checkout in `tools/MarkdownToNotebook`, loaded with `Get` by
`scripts/build_notebooks.wls` (the deployed resource function is used only when
the checkout is missing, and no cloud login is needed either way), and the probe
snippet below is written that way.

Status: findings, 2026-07-17. Author: BJ (with Claude Code).
Scope: argument names in `## Usage` `<code>` signatures and variable names in
prose/caption math, in `docs/en/ReferencePages/Symbols/**/*.md` pages built to
notebooks with `MarkdownToNotebook` + `DocumentationBuild`. Companion to
[doc-math-rendering.md](doc-math-rendering.md), which covers the LaTeX-subset gaps.
This note covers three naming artifacts that leak onto built pages as unrendered
text.

Still accurate as of the 2026-08-07 re-probe: the bare-`alpha_1` finding below
reproduces exactly. Note that the companion's `\mathbb` / bare-`\sqrt` /
`/`-in-script findings do not reproduce any more - those constructs render
correctly now, so where this note mentions them in passing, treat only the naming
half of the example as live.

## TL;DR - the rules

Three ways an author writes a subscripted or multi-token variable name that the
converter does not turn into the intended symbol, so the built page shows raw
text (`v_1`, `v1`, `alpha1`, `sideA`) instead of a formatted argument:

- DO NOT use a literal underscore in a markdown arg span. `*v_1*` renders as
  the literal string `v_1` (the underscore shows). Write the subscript as math:
  `$v_1$` -> *v*₁. (The "underscore should be an explicit subscript" rule.)
- DO NOT use letter-number run-together names. `*v1*` / `*c1*` render as the
  literal glyph pair `v1` / `c1`, not *v*₁ / *c*₁; a spelled-out Greek name like
  `*alpha1*` renders as the literal string `alpha1`. Write `$v_1$`, `$c_1$`, and
  for Greek `$α_1$` (see next rule).
- DO NOT interCaps (camelCase) argument names. `*sideA*`, `*includedAngle*`,
  `*homogPolys*`, `*freeVariables*` render as one italic run and read as an
  identifier, not a math argument - off the Wolfram documentation house style
  (built-in ref pages use short lowercase words: `expr`, `x`, `n`, `list`).
  Rename to a short lowercase word, or subscript a base letter (`$a_1$`, `$a_2$`).

- A subscripted WORD base is still a word raw in math, in prose. Probed
  2026-08-20 on a built page: in a `<code>` signature `$cond_1$` gives
  `SubscriptBox[StyleBox["cond","TI"], ...]` (one italic run - correct), but the
  same `$cond_i$` in the prose after it gives
  `StyleBox["c","TI"], StyleBox["o","TI"], StyleBox["n","TI"], SubscriptBox[...]`
  - a letter product. So the same name renders two ways on one page. In prose
  give the base a macro (`$\mathit{struct}_1$` to match the signature's italic,
  `$\text{cond}_i$` for upright); in the signature leave it bare.

- DO NOT leave a word raw inside math. `$point$`, `$eqn$`, `$(pts, blocks)$`
  set the word as a product of italic letters. An argument placeholder takes the
  markdown italic form (`*point*`, `*eqn*`, `(*pts*, *blocks*)`); a word a real
  formula genuinely needs takes `\text{...}`
  (`$\text{point} - \text{rate} \cdot \nabla f$`, `$v_{\text{min}}$`).
  Re-probed 2026-08-20: `\text{...}` renders in prose as a single upright run
  (`StyleBox[..., FontSlant -> "Plain"]`) through both `LaTeXMathParse` and a
  built `Symbol` page.

Two rules that are context-dependent (a form that works in prose breaks in a
signature, and vice-versa):

- No backslash macro of any kind survives a `<code>` SIGNATURE. Re-probed
  2026-08-20 on a built page: `$\text{rate}$`, `$v_{\text{min}}$`, `$q_{\max}$`,
  `$\alpha$` and `$\dots$` all leak as raw source in a signature slot, while
  `$v_{min}$` (SubscriptBox), `$α$` (Unicode) and `*vmin*` (StyleBox "TI") all
  render. So the wrapping rule reverses at the `<code>` boundary: `\text{...}`
  belongs in the prose formula, never in the signature. `$\dots$` and bare Greek
  macros are still live in many inherited signatures across PureMath's tree.
- Greek subscript in a `<code>` SIGNATURE: use the Unicode letter, not the
  backslash macro. `$α_1$` -> α₁ (works). `$\alpha_1$` and `$\[Alpha]_1$` both
  leak raw (`$\alpha_1$` shows on the page) inside a signature, because there
  the `$...$` token is the template-argument slot, not a full LaTeX span.
- Greek subscript in PROSE: the backslash macro is correct. `$\alpha_1$`,
  `$\zeta_n$` -> α₁, ζₙ. In prose the `$...$` handler is the LaTeX one, so bare
  `α` and `\alpha` both work; but a bare `alpha_1` (no `$...$`, no backslash)
  renders letter-by-letter as `alph` + `a₁`.

## Evidence (from built notebooks)

Built a `Symbol`-template probe with `MarkdownToNotebook` and inspected the box
structure of each `Usage`/`Notes` cell (same method as
[doc-math-rendering.md](doc-math-rendering.md)):

```wl
Get["tools/MarkdownToNotebook/MarkdownToNotebook.wl"];
MarkdownToNotebook["Probe.md", "Probe.nb"];
Cases[Import["Probe.nb", "Notebook"], Cell[BoxData[b_], "InlineFormula", ___] :> b, Infinity]
```

In a `<code>` Usage signature:

| Source in signature | Built box structure | Verdict |
| --- | --- | --- |
| `$v_1$` | `SubscriptBox[StyleBox["v","TI"], StyleBox["1","TR"]]` | OK - *v*₁ (the target form) |
| `*v_1*` | `RowBox[{StyleBox["v_","TI"], "1"}]` | literal `v_1` - underscore leaks |
| `*v1*` | `StyleBox["v1","TI"]` | literal `v1` - no subscript |
| `*sideA*`, `*includedAngle*` | `StyleBox["sideA","TI"]`, `StyleBox["includedAngle","TI"]` | one italic run - off house style |
| `*alpha1*` | `StyleBox["alpha1","TI"]` | literal `alpha1` - not α₁ |
| `$\alpha_1$` | `RowBox[{"$","\\",StyleBox["alpha_","TI"],"1","$"}]` | raw `$\alpha_1$` leaks |
| `$\[Alpha]_1$` | `RowBox[{"$\\[Alpha]_","1","$"}]` | raw leak |
| `$α_1$` (Unicode α) | `SubscriptBox[StyleBox["α","TR"], StyleBox["1","TR"]]` | OK - α₁ (the Greek fix) |

In prose (`## Details`/captions):

| Source in prose | Built structure | Verdict |
| --- | --- | --- |
| `$v_1$` | `SubscriptBox[StyleBox["v","TI"], "1"]` | OK - *v*₁ |
| `v_1` (bare) | plain string `"...v_1..."` | literal underscore text |
| `v1` / `c1` (bare) | plain string `"...v1..."` | literal glyph pair |
| `$\alpha_1$`, `$\zeta_n$` | `SubscriptBox[\[Alpha],1]`, `SubscriptBox[\[Zeta],StyleBox["n","TI"]]` | OK - α₁, ζₙ |
| `alpha_1` (bare) | plain string `"...alpha_1..."` | literal text |

Confirmed on a real symbol page:

- Usage `{*alpha1*, *alpha2*, ...}` -> `StyleBox["alpha1","TI"]` (literal `alpha1`).
- Details `$\mathbb{Q}(alpha_1, alpha_2, \dots)$` -> `alph` + `SubscriptBox["a",1]`
  (the `alpha_1` renders as "alph" then "a₁"; the `\mathbb{Q}` in the same span
  renders fine - see [doc-math-rendering.md](doc-math-rendering.md)).

The fix: the signature reads `{$\alpha_1$, $\alpha_2$, …}` and the Details span
`$ℚ(\alpha_1, \alpha_2, \dots)$`.

## How this surfaces to a reader

On the built page the reader sees an argument or variable that never became a
symbol: a visible underscore (`v_1`), a run-together pair (`v1`), a spelled-out
Greek word (`alpha1`, or `alph`+`a₁`), or a camelCase identifier (`sideA`) where a
short math argument was meant. The common thread, as in the companion note, is
"unrendered partial source leaking onto the page".

This repository has no symbol pages yet; the rules apply to the first one
written.

## Mechanical fix

Partly mechanical, partly a semantic rename - always rebuild the touched page and
inspect the boxes before committing.

- literal underscore -> math subscript: `\*([A-Za-z]+)_([A-Za-z0-9]+)\*`
  -> `$\1_\2$`. (If the base is a Greek word, apply the Greek rule below.)
- letter-number -> math subscript: `\*([A-Za-z]+)([0-9])\*` -> `$\1_\2$`.
  (`*v1*` -> `$v_1$`, `*p2*` -> `$p_2$`.)
- Greek base: do NOT emit `$\alpha_1$` inside a signature - it leaks. Use the
  Unicode letter: `alpha`->`α`, `beta`->`β`, `gamma`->`γ`, `zeta`->`ζ`,
  `sigma`->`σ`, so `*alpha1*` / `*alpha_1*` -> `$α_1$`. In prose the backslash
  macro `$\alpha_1$` is fine (and preferred).
- interCaps -> rename (not a regex): pick a short lowercase argument name in
  the Wolfram house style, or subscript a base letter. `*sideA*, *sideB*` ->
  `$a$, $b$` or `*side*₁...`; `*includedAngle*` -> `*angle*` or `$\gamma$`;
  `*homogPolys*` -> `*polys*`; `*freeVariables*` -> `*vars*`. Keep the name and any
  prose/`SeeAlso` references consistent.
- bare tokens in prose (`v_1`, `v1`, `alpha_1` outside `$...$`): wrap in math -
  `$v_1$`, `$\alpha_1$`.
