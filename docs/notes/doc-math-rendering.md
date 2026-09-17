# Math rendering in documentation pages (MarkdownToNotebook LaTeX subset)

Ported from PureMath's `docs/notes/`; the rendering rules hold here, the
converter being the same. In this repository the converter is the
MarkdownToNotebook checkout in `tools/MarkdownToNotebook`, loaded with `Get` by
`scripts/build_notebooks.wls` (the deployed resource function is used only when
the checkout is missing, and no cloud login is needed either way), and the probe
snippet below is written that way.

Status: findings 2026-07-16 (JSS with Claude Code); superseded 2026-08-11 -
the failures below were re-probed and traced to a missing dependency, not to
the converter's math handler. Kept for history; the current rules are these:

## TL;DR - the rules (2026-08-11)

`MarkdownToNotebook` parses `$...$` with `LaTeXMathParse` from the
`Wolfram/Parser` paclet when it is available, and silently falls back to a
much weaker `ImportString[..., "TeX"]` path when it is not. Every 2026-07-16
failure below (empty `\mathbb`, leaked bare `\sqrt`, `/`-in-script fractions)
came from that fallback: the July probe environment lacked the paclet (the
note's own caveat guessed this "is not the cause" - it was exactly the cause).
With `Wolfram/Parser` (0.2.3 verified) installed:

- `\mathbb`, `\mathfrak`, `\mathcal`, `\mathbf` all render (Unicode
  double-struck/fraktur/script glyphs, bold StyleBox). Unicode letters in the
  source (`ℚ ℤ ℝ`, `𝔤 𝔣`) remain equally fine - both conventions are legal.
  But `\mathfrak` and `\mathcal` render one glyph per box, so a
  multi-letter name inside them comes out spaced - see
  "Multi-letter `\mathfrak` sets spaced" (2026-08-26) below.
- Unbraced `\sqrt2` renders as a proper radical (bracing still reads
  better in source).
- `/` inside a script renders inline (`N_{L/K}` is a subscript label, not
  a stacked fraction).
- DO backslash Greek letters - still real: a bare word like `alpha_1`
  renders letter-by-letter. This is the one surviving authoring rule.
- Formal symbols never survive prose or tables (probed 2026-08-13): a bare
  `\[FormalM]` renders as broken literal text (markdown eats the backslash), the
  raw private-use character vanishes, and the backticked or `<code>`-wrapped
  escape becomes an EMPTY InlineFormula box. The only form that renders is the
  math-italic argument form `$m$` (StyleBox "TI"), matching doc-arg-naming.md -
  write formal-symbol defaults and mentions as `$m$`, `$q$`, `$\mu$`, adding
  "the formal symbol" in prose where the distinction matters. Inside a fenced wl
  block `\[FormalM]` is fine (it is real WL source there).
- `\nmid` is not supported (leaks raw source; probed 2026-08-12) -
  reword around it. Verified rendering the same day: `\log`, `\sim`,
  `\ne`, `\int_`, `\gcd`, `\pmod`, `\le`, fractions inside superscripts.
- `\mathit{...}` renders in prose (probed 2026-08-20): one italic run,
  `StyleBox["seq", FontSlant -> "Italic"]`, which matches the `"TI"` a signature
  argument gets - so it is the form for a subscripted word base in prose
  (`$\mathit{struct}_1$`), where `\text{...}` would set it upright instead.
- `\text{...}` renders in prose (probed 2026-08-20, `LaTeXMathParse` and a
  built page): one upright run, which is how a word belongs inside a formula -
  `$\{x \in ℝ : \text{cond}\}$`, `$n_{\text{kmax}}$`, `$2^{\text{set}}$`. Two
  neighbouring gaps found in the same probe: `\Pi` leaks (`RowBox[{"\\Pi"}]`)
  where `\Sigma \Gamma \Delta \Omega \Lambda` all render, so write the Unicode `Π`;
  and a `\,` thin space before `[` truncates the rest of the span
  (`order!\,[k = order]` parses to `order!` and drops the bracket), so use a
  plain space.
- Verified working, unchanged: Greek macros, `\mathrm`, `\frac`/`\tfrac`,
  `\pm \to \times \cdot`, bracketed scripts, `\begin{pmatrix}` (proper
  `GridBox`), `\mid` (`\[VerticalSeparator]`).

Operational rule: any machine that builds docs must have `Wolfram/Parser`
installed - the converter's fallback is silent, so a missing paclet shows up
only as quietly degraded math. `scripts/build_notebooks.wls` installs it from
the Paclet Repository when it can and says what happened; verify the CI pod on
its next docs build. (A `PacletInstall["Wolfram/Parser"]` from the public
repository offered 1.0.0 but failed to install on the PureMath build machine on
2026-08-11 - unresolved whether that listing is the same paclet; the local 0.2.3
is known good.)

Probes: `LaTeXMathParse` directly on each construct, plus TechNote-shaped
pages through both the local `MarkdownToNotebook.wl` and the cloud deployment,
including in parallel subkernels - all render identically with the paclet
present. The 2026-08-11 fraktur "defect" first reported that day was a
detection artifact (grepping built `.nb`s for raw UTF-8 and `Gothic`, missing
WL's `\|01d5xx` escape encoding) and was reverted.

## Multi-letter `\mathfrak` sets spaced (2026-08-26) - convention for Lie algebra names

Design-review defect (frames of the 2026-08-24 recording; possibly the
"formatting mistake in SU3" remark at 1:11:16 - attribution uncertain, defect
real). PureMath's `RootSystem.md` rendered its Lie algebra name as separated
letters, "s u (3)" rather than a set 𝔰𝔲(3).

Cause. `LaTeXMathParse` maps `\mathfrak{...}` to Unicode fraktur
character by character and returns a `RowBox` of one box per letter, and the
front end puts inter-operand space between adjacent boxes in a `RowBox`:

| source | boxes | renders |
| --- | --- | --- |
| `\mathfrak{su}(3)` | `RowBox[{𝔰, 𝔲, "(", 3, ")"}]` | 𝔰 𝔲 (3) - spaced |
| `\mathfrak{g}_2` | `SubscriptBox[𝔤, 2]` | 𝔤₂ - fine |
| `\mathrm{su}(3)` | `StyleBox["su", FontSlant -> Plain]` | su(3) - one run |
| `\mathrm{𝔰𝔲}(3)` | `StyleBox["𝔰𝔲", FontSlant -> Plain]` | 𝔰𝔲(3) - one run |

So this is not the missing-`Wolfram/Parser` fallback (0.2.3 was installed and
`\mathfrak` did produce real fraktur codepoints) and not the 2026-08-11
detection artifact. It is a per-glyph box split that only bites names of two or
more letters. Bare Unicode fraktur in the source is worse, not better: the
parser splits it at the surrogate halves.

The convention (set in PureMath; no prior precedent - that repository had only
`\mathfrak`). A Lie algebra name in prose math:

- two or more letters - raw Unicode fraktur inside `\mathrm{...}`:
  `$\mathrm{𝔰𝔲}(3)$`, `$\mathrm{𝔰𝔬}(10)$`, `$\mathrm{𝔰𝔩}(2)$`,
  `$\mathrm{𝔰𝔭}(1)$`, `$\mathrm{𝔤𝔩}(d)$`. `\mathrm` passes its argument
  through as a single `StyleBox` string, which is what closes the gaps; the
  fraktur is real fraktur, so nothing is lost against `\mathfrak`. `\mathrm`
  not `\mathit`: fraktur has no meaningful slant, and `\mathrm` matches how
  PureMath already sets multi-letter names (`\mathrm{ad}`, `\mathrm{Tr}`).
- one letter - keep `\mathfrak{g}`, `\mathfrak{e}`, `\mathfrak{u}`,
  `\mathfrak{f}`. A single letter is already one box; there is no defect to fix
  and no reason to churn the source.

Verified by building a page through `MarkdownToNotebook` and rasterizing the
resulting box: one `StyleBox` run, 𝔰𝔲(n+1) set tight. A two-letter name never
trips the lint's word-in-math rule, and `\mathrm{...}` is on its silent-wrapper
list either way. The convention also covers the operator-shaped names
`\mathrm{𝔰𝔱𝔯}(J)`, `\mathrm{𝔡𝔢𝔯}(J)`, `\mathrm{𝔱𝔯𝔦}(𝔸)`, `\mathrm{𝔰𝔭𝔦𝔫}(10)`.

The qualified rule (single letter `\mathfrak`, two or more letters Unicode
fraktur in `\mathrm`, with the one-clause reason) belongs in `GUIDE.md`, with a
pointer here.

## How the lint reads a word in math (2026-09-01)

`scripts/lint_docs.wls` enforces the no-word-in-math rule, in prose math and in
a `<code>` signature slot alike; the rule belongs in GUIDE.md's math guidance,
with a pointer here for the detection detail.

The lint reads a word as three or more letters in a row that are lowercase
after the first, which is what separates a word from the juxtaposed symbols
around it: `$ab$`, `$dx$` and `$BC$` are products and `$NkT$` and `$SU$` are
symbol runs, so none of them fires. Neither does math already wrapped
(`\text`, `\mathit`, `\mathrm`, `\operatorname` and the rest of the script's
`mathTextWrappers`), a single letter, Greek in either spelling, the base of a
subscripted name, a fenced block or an inline code span.

A genuine run of symbols that spells a word (an index run such as `$R_{abcd}$`,
a word over an alphabet such as `$abab$`, a monomial such as `$xyz$`) has to be
named in `mathWordAllowlist` in that script. That list is empty in this
repository: PureMath's entries were pruned because no page here spells any of
them. The first such run to appear is added with a comment naming its
mathematics, and a run with no such reason is the defect the rule is looking
for.

## Historical findings (2026-07-16, fallback path)

## Evidence (from built notebooks)

Reproduced by writing a `Symbol`-template probe page and building it:

```wl
Get["tools/MarkdownToNotebook/MarkdownToNotebook.wl"];
MarkdownToNotebook["Probe.md", "Probe.nb"];
Cases[Import["Probe.nb", "Notebook"], Cell[c_, ___] :> c, Infinity]
```

Inspecting the resulting box structures:

| Source in `$...$` | Built box structure | Verdict |
| --- | --- | --- |
| `\mathbb{Q}` | `BoxData[""]` | EMPTY - symbol vanishes |
| `\mathbb{Z}/n\mathbb{Z}` | `RowBox[{FractionBox["", "n"], ""}]` | EMPTY/n - both Z gone |
| `\sqrt2` | `RowBox[{RowBox[{"\\", "sqrt"}], "2"}]` | raw `\sqrt` leaked |
| `\sqrt{2}` | `SqrtBox["2"]` | OK (renders √2) |
| `\tfrac{1-\sqrt5}{2}` | `FractionBox[RowBox[{"1","-",RowBox[{"\\","sqrt"}],"5"}],"2"]` | fraction OK, inner bare `\sqrt5` leaked |
| `N_{L/\mathbb{Q}}(\alpha)` | `SubscriptBox[N, FractionBox[L, ""]] (α)` | `/` -> fraction, `Q` gone |
| `ℚ(\sqrt{2})` (Unicode) | `RowBox[{StyleBox["ℚ","TI"], "(", SqrtBox["2"], ")"}]` | OK - the fix |
| `x^2`, `\zeta_n`, `x^{[L:K]}` | `SuperscriptBox` / `SubscriptBox` | OK |

Note: the probe environment lacked the `Wolfram/Parser` paclet, but this is not
the cause - the vast majority of LaTeX (Greek, `\mathrm`, `\tfrac`, scripts,
braced `\sqrt`) rendered correctly; only the constructs above fail. A
parse-failure fallback that shows raw source is also how a literal underscore or
an empty backtick pair ends up visible on a published page.

## How this surfaces to a reader

On a built page the reader sees, e.g., the extension "ℚ(√2)" instead rendered as
"(√2)" with the field symbol missing, or a literal `\sqrt2`, or `N` with an
`L/Q` fraction where a subscript label was meant. The common thread is
"unrendered partial LaTeX": a leaked backslash, a vanished symbol, or a mangled
script.

## Mechanical fix

- `\mathbb{Q}` -> `ℚ`, `\mathbb{Z}` -> `ℤ`, `\mathbb{R}` -> `ℝ`, `\mathbb{C}` -> `ℂ`,
  `\mathbb{N}` -> `ℕ`, `\mathbb{F}` -> `𝔽` (regex: `\\mathbb\{([QZRCNF])\}` per letter).
- `\sqrt` + token -> braced: regex `\\sqrt([0-9A-Za-z])` -> `\sqrt{\1}`.
- `alpha_`/`beta_` (word-initial, no backslash) -> `\alpha_`/`\beta_`.
- Re-word or restructure `/`-in-script cases (`N_{L/K}`) so the slash is not
  inside the sub/superscript.

Always rebuild the touched page and inspect the boxes (script above) before
committing - the `<!-- => -->` example outputs are unaffected (those are WL, not
LaTeX), but the prose/caption math must be checked.
