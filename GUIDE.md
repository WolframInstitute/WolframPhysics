# Wolfram Language style guide

Conventions for Wolfram Language code: `.wl` package files, `.wls`
scripts, `.wlt` test files, and code in `` ```wl `` markdown cells. The
rules at the top are non-negotiable; the rest are conventions that keep
code readable and consistent with the IDE auto-formatter.

This guide folds in the Wolfram "Coding Advice" notebook (D. Reiss). Where
that material conflicts with a rule already stated here, the rule here
wins; only the non-conflicting advice was added.

## Code as narrative: the guiding philosophy

A function is a narrative. Your code is a conversation with four readers:
the kernel (which runs it), you-in-the-future, future developers, and
current collaborators who call or change your code. Only the first does
not care whether the code is clear to a human; the other three are why you
write for readability.

Your time is worth far more than the CPU time to run the computation. Make
the code understandable to a human even if it costs a few cycles or
megabytes. Writing this way also surfaces where refactoring could buy real
performance.

## Rules the user has explicitly called out

These are non-negotiable. Strip on sight.

### No em dashes (U+2014) or `--`

Don't write em dashes in source files, docs, comments, or commit
messages, and don't use `--` (double hyphen) as a substitute. Use a
plain hyphen (`-`), a comma, a colon, or a sentence break.

The commit-message hook (`tools/dev/commit_msg_gate.sh`) rejects an em dash
or ` -- ` in a commit message; nothing checks source or docs:
`scripts/lint_docs.wls` carries no dash rule, so a clean lint says nothing
about dashes and the sweep is manual. The sources
a page is researched from (a Community post, a bulletin, another paclet's
documentation) are often full of them; read those for their content and
not for their typography, and never paste one through.

### No source-file citations in user-facing text

A usage message, reference page, guide or tutorial never names a kernel
source file: the reader has the paclet, not the repository, and file
layout is not part of the interface. Refer to the symbol or the concept
instead - "see MultiwaySystemGraph", not "see MultiwaySystemGraph
(Kernel/Multiway/MultiwaySystem.wl)"; "a rule is a pair of hypergraphs
the evolution rewrites by", not "rules live in Rewriting.wl". The same
goes for the resources a guide links: a page says what a function
computes, never which repository or package file computes it. Code
comments, design notes under docs/notes/ and research notes under
docs/research/ are the opposite case: they are written for people editing
the repository, and there a precise file reference is exactly right.

### No bold or uppercase for emphasis in doc prose

A page's only formatted spans are symbol links, code spans and math. A
`**bold**` word set for emphasis and a word set in capitals for emphasis
("FINER than isomorphism") are the same defect in two fonts: the sentence
carries its emphasis on its own, or is rewritten until it does. This holds
in prose, captions, `<!-- => ... -->` hints and table cells alike. The rule is
scoped to what a reader of the paclet sees (pages, captions, hints, usage
messages); repository prose such as this guide, AGENTS.md and the skills may
use bold sparingly, for a rule the reader must not miss.

### No subroutine-library or object-oriented vocabulary in user-facing text

No "call", no "routine", no "invoke", and no "returns" in the subroutine
sense, on any page, in any usage message, caption or `<!-- => ... -->` hint:
there are no calls and no routines, and nothing is instantiated. The
sanctioned form for a non-match is "returns unevaluated", in the active
voice, with the function or the expression as the subject:

```
(* GOOD *)
a non-matching argument returns unevaluated
the message Sym::tag is issued and the expression returns unevaluated

(* BAD - subroutine vocabulary *)
the call is returned unevaluated

(* BAD - passive, or the expression merely sitting there *)
the expression is returned unevaluated
the call is left unevaluated
stays unevaluated / remains unevaluated
```

Where the active form makes a sentence awkward, rewrite the sentence rather
than forcing it. Sweep the whole page rather than the sentence in front of
you: prose, captions and hints alike.

### No Unicode box-drawing characters

Don't use box-drawing characters (U+2500 and relatives) as
visual section banners in comments. Use plain ASCII:

```c
// === lifecycle ===     // good
// --- lifecycle ---     // good
```

Same applies in `.wl` (`(* === lifecycle === *)`) and `.md`
(`## Lifecycle`).

### No decorative Unicode arrows in source

Use `->` (or `>` in shell prompt strings) instead of decorative arrows.
ASCII-only in source files unless the character carries meaning
(mathematical typesetting in a comment is fine when relevant). The
repository's prose documents count as source here too: write `->` or the
word in README, the notes, the research reports and the pages, never
U+2192 or U+2194. Mathematics inside `$...$` on a doc page is the case
where the character carries meaning.

### Dark mode + Standard colors

Always design WL output for both light and dark Wolfram themes from
the start.

- Use **Standard color names** (`StandardBlue`, `StandardRed`,
  `StandardGreen`, `StandardOrange`, `StandardYellow`,
  `StandardPurple`, `StandardGray`) instead of `RGBColor[...]` or
  `Darker[Blue, 0.4]`. They read correctly on light and dark
  backgrounds.
- Use `LightDarkSwitched[lightValue, darkValue]` when a value
  (color, opacity, thickness) genuinely needs to differ between
  modes. Avoid hard-coded `White`/`Black` for `Background`,
  `FaceForm`, etc.; either let the theme drive it, or wrap in
  `LightDarkSwitched`.
- Don't unconditionally pin `Background -> White` on a Graph or
  Graphics. If a static PNG export needs an explicit background,
  set it on the Export call, not on the Graph.

## Naming

The first thing to do when writing a function is decide its name. Revisit
the name as the function evolves; renaming is part of refactoring. The
name is part of the documentation.

- Public symbols: `CamelCase` (e.g. `BuildGraph`, `MakeWidget`). An
  exported symbol carries no prefix: the umbrella context
  `` WolframInstitute`WolframPhysics` `` is the collision guard against
  other paclets, and the never-collide rule below is the guard against
  `` System` ``.
- Internal helpers, function arguments, and localized variables (in
  `Module`/`Block`/`With`): `lowerCamelCase` (e.g. `print`, `loadFn`).
  A leading lowercase letter guarantees the name never collides with a
  built-in.
- Don't prefix internal helpers with `i...`.
- Global parameters / configuration symbols start with `$`
  (like `$UserBaseDirectory`): e.g. `$MyPacletVersion`.
- Predicates (functions returning only `True`/`False`) end in `Q`,
  like `PrimeQ`, `IntegerQ`.
- Compose names from full English words. `simpleGraphPlot`, never
  `smplGrphPlt`. Avoid single characters or very short sequences: a stray
  `x` appears everywhere and is impossible to search for.

### A name must say what the object is

An exported name has to carry enough context to identify the object on its
own. In practice that is two words, often three: `AbstractGroup`,
`FinitelyPresentedGroup`, `SpecialUnitaryGroup`,
`InvariantFactorDecomposition`. The count is not the rule - sufficiency is.
Two words is what sufficiency usually costs; a third is free where it buys
precision. Never trim a name to hit a number.

A single word is admissible only where that word is **unique to the
mathematical object**: a term of art with no competing meaning in the Wolfram
Language and none in ordinary English. `Poset` and `Matroid` qualify.
`Group`, `Module`, `Ring`, `Field`, `Term` and `Variety` do not - each is
already load-bearing somewhere else, so none of them may stand alone. The
test is a fact about the word, not a judgement about the object,
so "I think this one is fine" is not a use of the exemption.

**When in doubt, stop and ask** - before writing, not after. A name is the
most expensive thing in a file to change later: it reaches tests, guides,
reference pages, tutorials and every downstream caller.

### Never abbreviate, contract, or initialise

```wolfram
(* BAD *)   SUNColorTrace
(* GOOD *)  SpecialUnitaryColorTrace
```

This holds even where the abbreviation is standard *in the field*: SU(N),
PID, GCD, ODE read instantly to a specialist and opaquely to a reader who
arrived from a search, and the audience here is explicitly both. An
abbreviation also collides differently from the word it stands for, so it
defeats the collision check below. Established Wolfram Language spellings are
not abbreviations - `Q` for a predicate and `$` for a global are followed
as-is, as are single letters that are the subject's own notation inside a
longer name.

### Never collide with a System symbol

Before naming an exported function, check `` NameQ["System`" <> name] `` (or
just try the bare name in a clean kernel). If the Wolfram Language already
has it, do not redefine it.

This causes a silent issue under StructuredPackageFormat: `PackageExported[Foo]`
silently does nothing if `Foo` is a `` System` `` symbol (the first-pass
reader strips `` System` `` names), and your `Foo[...] :=` then tries to write
to the protected built-in and fails. For example, `SymmetricDifference` is a
built-in: if a name like that is already taken, rename your symbol, or just
use the built-in. The names this paclet will export are the vocabulary of
the Physics Project, and several of them (`Hypergraph`, `WolframModel`,
`MultiwaySystem`) already exist as Function Repository functions or in other
paclets: a name that is free in `` System` `` can still collide with what a
reader has loaded, so the guide says where each function lives and the
research note records what was checked.

Also ask whether a general name *might* become a System function later
(`CellularAutomatonPlot` doesn't exist yet, but could). Prefer specific,
unlikely-to-collide names. Specificity also means *unambiguous in meaning*:
if a proposed name has other unrelated uses - another field's notion, or a
common word carrying a separate technical sense - revisit it and pick a name
that picks out this concept alone. And make sure localized symbols inside a
`Module`/`Block`/`With` don't share a name with a function in your
codebase, or a global rename will rewrite both.

### Avoid depending on `` System`Private` `` internals

Avoid calling undocumented `` System`Private `` symbols (or other unpublished internal
kernel functions) in implementation code. They are not part of the public language,
they can change or disappear between versions, and a reader cannot look them up. If you
need the functionality one provides - an object-validity cache, say - prefer to
re-implement it as a plain, documented paclet helper rather than reaching into the
kernel's private context. A predicate that re-runs its structural check each time is the
simplest such replacement:

```wolfram
(* AVOID: leans on undocumented kernel internals to cache validity *)
c_Foo /; System`Private`HoldNotValidQ[c] && fooDataQ[Unevaluated[c]] :=
	System`Private`SetNoEntry[System`Private`HoldSetValid[c]]
FooQ[c_Foo] := System`Private`HoldValidQ[c] || fooDataQ[Unevaluated[c]]

(* PREFER: a plain predicate that re-validates *)
FooQ[c_Foo] := fooDataQ[Unevaluated[c]]
```

### Formal symbols for variables a function introduces

When a definition puts a *fresh* symbol into its output - a bound/dummy
variable, a generic point, a placeholder in a returned expression like a
generating function's variable - use a Formal symbol (`\[FormalX]`,
`\[FormalY]`, ..., entered `Esc fx Esc`), not a plain `x`. Formal symbols
are `Protected`, carry no global value, and can't be captured by or collide
with the caller's `x`, so the returned expression stays clean.

## Designing the interface

What a function *accepts and returns* is settled before any of the mechanics
below. The rules here came out of a design review of a sibling paclet, where
twenty-five concrete defects turned out to be instances of about a dozen
general rules; the examples keep that review's group-theory flavour, and the
rules are not specific to one area or one paclet.

### Never require a wrapper around what the system already understands

`SymmetricGroup[3]` is a group. It must satisfy the group predicate and be
accepted by the operations without being wrapped first. A wrapper that exists
so the paclet has somewhere to hang extra data is fine; a wrapper the user is
*required* to apply before anything works is not.

Built-in and paclet symbols get identical treatment, in code and in
documentation - same call conventions, same formatting, neither needing a
wrapper the other does not.

### A predicate must not be stricter than the functions it guards

```wolfram
GroupQ[SymmetricGroup[3]]        (* returned False ... *)
GroupOrder[SymmetricGroup[3]]    (* ... while every operation it guards took that input *)
```

If every operation accepts a bare `SymmetricGroup[3]`, the predicate that is
supposed to describe valid input cannot reject it. Whenever you write a
`...Q` that names a structure, evaluate it on each concrete System object the
operations already take.

### A predicate answers True or False, whatever its arity

What makes a `...Q` a predicate is the answer it gives, not the number of arguments it
takes. The System's own predicates take whatever the question needs: of its 225 symbols
ending in `Q`, 87 are documented with two arguments or more, in at least six shapes.

- The object and the variable or domain it is read in: `PolynomialQ[expr, x]`,
  `PolynomialExpressionQ[expr, vars, dom]`, `IrreduciblePolynomialQ[poly, mod]`,
  `SquareFreeQ[poly, mod]`.
- The object and a test applied to its parts: `VectorQ[expr, test]`,
  `MatrixQ[m, test]`, `ArrayQ[expr, depth, test]`, `DuplicateFreeQ[list, test]`.
- The object and a pattern: `MatchQ`, `FreeQ[expr, form, levspec]`,
  `MemberQ[list, form, levspec]`, `StringMatchQ`, `StringContainsQ`.
- An element and the structure it is tested in: `EdgeQ[g, e]`, `VertexQ[g, v]`,
  `GroupElementQ[group, elem]`, `IntervalMemberQ[interval, x]`, `VertexCoverQ[g, vs]`.
- The object and an integer spec: `DiagonalMatrixQ[m, k]`,
  `KEdgeConnectedGraphQ[g, k]`, `UpperTriangularMatrixQ[m, k]`.
- Peer relations, both arguments the things related: `SubsetQ`,
  `IsomorphicGraphQ`, `MoleculeEquivalentQ`, and a formula with its variables,
  `SatisfiableQ[expr, vars]`, `TautologyQ`, `UnateQ`.

So a `CausalInvariantQ[rules, init]` is `SatisfiableQ[expr, vars]` shaped, a
`HyperedgeQ[hypergraph, edge]` is `EdgeQ[g, e]` shaped, and a
`ConfluentQ[rules, steps]` is `KEdgeConnectedGraphQ[g, k]` shaped. None of them owes an
apology for its second argument, and renaming that family to a `...Condition` buys
nothing the System's own vocabulary does not already sanction.

The rule that does bind is about the answer. A predicate returns `True` or `False`
and never guesses: where it cannot decide, it stays unevaluated rather than reporting
`False`, which is the discipline set out under *Argument patterns and fall-throughs*.
Causal invariance and confluence are the cases here: a bounded search that found no
counterexample has not decided the question, and a predicate that answers `True` on
that evidence is guessing. Reserve a non-`Q` name for something that is not a Boolean
question at all: a report, a certificate, a witness, a residual.

### Functions, not an open-ended string accessor

Where a System function already covers a property - `GroupOrder`,
`GroupGenerators`, `GroupElements` - use it, and teach it in the
documentation, rather than standing an `obj["Order"]` accessor beside it.

This is a change of emphasis, not a ban. An accessor bag is load-bearing
where an object has kinds carrying different extra data (a presentation,
coset representatives, product factors), and removing it wholesale closes off
extensibility. The rule is that the accessor must not be the *only* route to
data a reader will reach for.

### Split abstract from concrete deliberately

For any object with both an abstract form and concrete realizations:

- **Representation-independent operations work on the abstract object.**
  Order is a property of the group, not of how it is written.
- **Operations that are themselves abstract return an abstract object**, and
  so compose. The centre of an abstract group is an abstract group, not an
  element list.
- **Operations that genuinely depend on a choice of representation require
  that choice.** Generators and an explicit element list are properties of a
  realization.

Constructing the abstract object from a concrete one gives the *generic*
object, not the argument handed back unchanged - an `AbstractGroup[SymmetricGroup[3]]`
that returns `SymmetricGroup[3]` has done nothing. Going the other way
recovers the specialised form where it applies, and otherwise issues a
message and returns unevaluated.

### Scope has a floor

Narrowing scope is the right move when full generality would need fragile
code (see *Argument patterns and fall-throughs*), but **do not ship a
function that cannot answer the question its name asks, on the inputs a
reader will reach for first.** A predicate that returns `True` or stays
unevaluated - never `False` - is answering "true or cannot tell", and its
name does not say so.

The test is about *headline* cases, not coverage in general. Bounded by cost
is fine and normal; bounded by capability on its own first examples is not.
A `CharacterTable` that computes the complete exact table for S3, D4, S4, A5,
S5 and S6 and is merely slow past order ~1000 has a performance ceiling, and it
ships. A `SolvableByRadicalsQ` that could not decide `x^5 - 2`, the example
everyone tries, is removed. Here the headline cases are the small rules and
initial conditions the guide's own examples use, the ones every introduction
to the Physics Project starts from: an option that changes nothing on those,
or a property that answers only past a size no reader will try first, does
not ship as described.

Where a function is genuinely partial, say so in the usage message and make
sure the name does not promise the general case.

## Indentation and spacing

- Use tabs rather than space indentation. Never use spaces for indentation.
- Spaces around infix operators (`+`, `*`, `->`, `:>`, `&&`, etc.),
  including the pattern colon (`x : pattern`) and `Alternatives`
  (`a | b`). Two exceptions take no surrounding space:
  - `PatternTest` (`?`) binds tightly to the blank in front of it:
    write `t_?NumericQ`, never `t_ ? NumericQ`. It never applies to
    more than one argument, so the tight form is unambiguous.
  - A blank stays attached to its head (`_Integer`, not `_ Integer`),
    since a stray space there is read as `Times` (`_ Plus` parses as
    `Blank[] * Plus`).
- Prefer structural indentation over column alignment.
- One semantic unit per line in long forms (`Which`, `Switch`,
  `Association`, `Table`, option lists).

### Code width

Keep lines within **200 characters** (a hard "you shall not pass"
ceiling); treat **150** as a gentle suggestion to start breaking a line
up. Shorter lines read more easily and stay legible regardless of a
developer's screen size or editor setup. Some structures (long URLs,
complex scanner-style signatures, deeply nested definitions) will
unavoidably run long; prioritize clarity over a strict character count.

When continuing a string use a "\" as the line continuation character.
Do not add indentation when continuing a string to a new line.

Set up vertical rulers in your editor to visualize the limits. In VS
Code, add to `settings.json`:

```json
"editor.rulers": [150, 200]
```

### Never split a binary operator's operands across lines

Operators (`+`, `-`, `*`, `/`, `.`, `&&`, `||`, etc.) must have both
operands on the same line. The Wolfram IDE flags split operands as
`DifferentLine` and the resulting form reads worse than a longer
single line.

```wolfram
(* BAD: trips DifferentLine lint *)
TSet[wTen, wTen - lrHat * mTen
                  / (Sqrt[vTen] * invSqrtB2cor + eps)];

(* GOOD: keep the whole arithmetic chain on one line, even if it's
   long; or factor an intermediate into a named binding first. *)
TSet[wTen, wTen - lrHat * mTen / (Sqrt[vTen] * invSqrtB2cor + eps)];

(* GOOD: factor when the line gets unreadably wide *)
denom = Sqrt[vTen] * invSqrtB2cor + eps;
TSet[wTen, wTen - lrHat * mTen / denom];
```

The lint rule is `wolfram lint(DifferentLine)`; if you see it,
either join the line or factor.

When a long boolean or arithmetic chain genuinely cannot be factored and
would blow past the width limit, rewrite it in `InputForm` functional
head form (`Or[...]`, `And[...]`, `Plus[...]`) with one operand per
line. Each continuation operand starts its own line; never leave an
operator dangling at the end of the previous line.

```wolfram
(* BAD: operators trailing at the ends of lines *)
result = veryLongConditionOne ||
	veryLongConditionTwo ||
	veryLongConditionThree

(* GOOD: functional head, one operand per line *)
result = Or[
	veryLongConditionOne,
	veryLongConditionTwo,
	veryLongConditionThree
]
```

A valid alternative approach is to put the operands inside of () brackets, as in:

```wolfram
result =
    (
    	veryLongConditionOne
    )||
    (
    	veryLongConditionTwo
    )||
    (
    	veryLongConditionThree
    )
```

### Commas, semicolons, and line breaks

- Put a space after every in-line comma: `good[Sin[x], a, b]`, not
  `bad[Sin[x],a,b]`.
- When a comma-separated form wraps onto multiple lines, the comma ends
  the line; never start a continuation line with a leading comma.
- One statement per line: break after each `;`. Don't pack
  `a = 1; b = 2; c = 3` onto a single line.
- Never leave `;;` (`Span`) at the end of a line. It is too easily
  misread as `;` (`CompoundExpression`): `var = {1, 2, a, b};;` quietly
  assigns `Span[{1, 2, a, b}, All]`, not the list you meant.
- No semicolon immediately before a comma, or before the final closing
  bracket of a scoping/control structure. A hanging `;` silently
  evaluates to `Null`.

```wolfram
(* BAD: the hanging ; makes var = Null *)
var = If[True, code;]
var = If[True, code1;, code2]

(* GOOD *)
var = If[True, code]
var = If[True, code1, code2]
```

- Indent one level deeper for each new level of expression, so the tree
  structure is visible at a glance. In `Which`/`Switch`, indent each
  body one level past its test:

```wolfram
Which[
	test1,
		code1,
	test2,
		code2,
	True,
		code3
]
```

## Definitions

Prefer `Module` for local workspaces unless `Block`'s ability to
temporarily assign a value to a parameter is needed.
Don't add a trailing `;` to any
top-level assignment, `SetDelayed` (`:=`) and `Set` (`=`) alike. Each
definition is a complete expression; line breaks separate them.


```wolfram
(* GOOD *)
Options[myFn] = {GraphLayout -> "LayeredDigraphEmbedding"}

myFn[x_] := x + 1

(* BAD *)
Options[myFn] = {GraphLayout -> "LayeredDigraphEmbedding"};
myFn[x_] := x + 1;
```

```wolfram
f[x_] := x + 1

g[args__] := Block[{
	x = ...,
	y
},
	body
]
```

The `Block`/`Module` variable list opens on the same line as the
head (`Module[{`), variable bindings are indented one level deeper,
and `}`, body, and the closing `]` all return to the column where
the line that opens `Module[` starts.

`With` no longer needs nesting for sequential bindings; these are
equivalent, so prefer the flat form:

```wolfram
(* nested - avoid *)
With[{a = 5}, With[{b = 2 a}, Sqrt[b]]]

(* flat - preferred *)
With[{a = 5}, {b = 2 a}, Sqrt[b]]
```

If a `With` gets very complicated and its scoping isn't critical, use
`Block` instead.

### Check a System symbol's attributes before reusing it as notation

Reusing a built-in operator for abstract notation inherits its attributes,
and an attribute rewrites your expressions before any of your definitions
see them.

```wolfram
Attributes[NonCommutativeMultiply]   (* {Flat, OneIdentity, Protected} - reassociates *)
Attributes[CircleTimes]              (* {} - inert, safe as abstract notation *)
```

`NonCommutativeMultiply` being `Flat` silently reassociates a presented word,
which is fatal for group presentations and a false theorem for products that
are not associative at all. `CircleTimes` and `CirclePlus` carry no
attributes, which is what makes them usable.

For an operator that is pure notation the default is **no attributes at
all**: the operator is inert syntax, and every algebraic law belongs to the
structure that interprets the expression, never to the notation.

### Argument patterns and fall-throughs

Write every downvalue with specific patterns, so that input a function does
not handle matches nothing and returns unevaluated rather than
half-evaluated. Reserve a `Failure` object for when the function matched,
tried, and an attempt failed: validate intermediate steps with
`Enclose`/`Confirm` (see Bulletproofing), and never signal failure with a
`Message`-and-`$Failed` fall-through.

```wolfram
(* BAD: pattern too loose, silent on misuse *)
foo[str_] := StringLength[str]

(* GOOD: specific pattern; foo[5] matches nothing and returns unevaluated *)
foo[str_String] := StringLength[str]
```

If a function is meant to take only a specific pattern make sure that that
pattern is specified in the argument of the function's definition.
This is also critically important when a function has several valid
argument forms, give each its own specific pattern; input that matches
none of them returns unevaluated:

```wolfram
foo[str_String] := StringLength[str]
foo[int_Integer] := IntegerLength[int]
foo[nList : {__Integer}] := foo /@ nList
```

For a predicate (a `...Q` function), the natural fall-through is
`predicateQ[___] := False`, not a `Failure`.

### Don't require a `Hold` around arguments

A function should not require its caller to wrap arguments in
`Hold[...]`. Design functions to take ordinary, already-evaluated arguments
so calls compose normally. If passing an argument correctly seems to need an
explicit `Hold` at the call site, treat that as a signal to reconsider the
design.

### Optional arguments

For functions that take Wolfram-style options, use
`opts : OptionsPattern[]`, not `opts___?OptionQ`. The former
integrates with `Options[fn]` declarations and `OptionValue[fn, key]`,
which is the canonical Wolfram pattern.

```wolfram
Options[myFn] = {GraphLayout -> "LayeredDigraphEmbedding"};

myFn[args___, opts : OptionsPattern[]] :=
	With[{layout = OptionValue[GraphLayout]},
		...
	]
```

Document what values each option accepts - especially what `Automatic`
resolves to - in the usage message or a comment, so a later reader need
not reverse-engineer it.

The bare `OptionValue[key]` shorthand is the norm; reach for the explicit
`OptionValue[fn, {opts}, key]` form only where the shorthand cannot
resolve: inside a condition attached to the left-hand side, and in a
helper function that resolves another (public) symbol's options from a
forwarded `opts` sequence. Defaults always live in one `Options[fn]`
declaration - never in an ad-hoc defaults list spliced into each
`OptionValue` call.

### Boolean options: `TrueQ[OptionValue[...]]`

Wrap boolean options in `TrueQ` so non-`True` values (unbound symbols,
typos, `Automatic`, etc.) collapse to `False` instead of propagating
into `If` as an unevaluated test.

```wolfram
(* GOOD *)
If[ TrueQ[OptionValue["Branchial"]], ..., ...]

(* BAD: if user passes "Branchial" -> Bogus, the If never evaluates *)
If[ OptionValue["Branchial"], ..., ...]
```

For stricter validation, confirm the value and fail loudly:

```wolfram
Options[function] = {"UseMyThing" -> True};

function[opts : OptionsPattern[]] :=
	Enclose @ Module[{useMyThing},
		useMyThing = OptionValue["UseMyThing"];
		ConfirmMatch[useMyThing, True | False,
			Message[function::opttf, "UseMyThing", useMyThing]];
		...
    ]
```

### First option wins: put the forced overrides first

When a wrapper needs to force certain options on the inner function but
also let the user pass through extras, put the forced overrides first
and the user's filtered options after them in the argument list.
Wolfram functions take the first setting on collision (verify with
`OptionValue[Graph, {EdgeLabels -> "a", EdgeLabels -> "b"}, EdgeLabels]`,
which gives `"a"`; reading it back off the built object shows the same
first-wins outcome one step further on, since `Graph` normalizes the
setting to a list:
`Options[Graph[{1 -> 2}, EdgeLabels -> "a", EdgeLabels -> "b"], EdgeLabels]`
is `{EdgeLabels -> {"a"}}`).
Don't `/. (Key -> _) -> Nothing` to scrub user options out - just
place the forced override first.

```wolfram
(* GOOD: our forced VertexLabels wins; user's GraphLayout /
   ImageSize / etc. pass through. *)
Graph[
    vs, es,
    VertexLabels -> myLabels,
    Background -> LightDarkSwitched[White, GrayLevel[0.13]],
    FilterRules[Flatten[{opts}], Options[Graph]]
]
```

Thread options to inner functions through `FilterRules`. Always wrap the
options in `Flatten[{opts}]`: `opts` may arrive as a single `Rule`, a
list, or a `Sequence`.

```wolfram
Options[moo1] = {"MyMoo1Exponent" -> 3};
Options[moo2] = Flatten[{Options[moo1], "MyMoo2Exponent" -> 3}];

moo2[x_, opts : OptionsPattern[]] :=
    Enclose @ Module[{e},
        e = OptionValue["MyMoo2Exponent"];
        ConfirmMatch[e, _Integer];
        x^e * moo1[x, FilterRules[Flatten[{opts}], Options[moo1]]]
    ]
```

## Patterns and downvalues

### Make patterns as specific as possible

Patterns, pattern tests, and conditions are how a function controls which
inputs each downvalue handles. The more specific the pattern, the more of
your input validation the evaluator does for free, and the less a loose
clause can swallow inputs it was never meant to.

```wolfram
(* BAD: too loose; this clause catches everything *)
f[a_, b_] := a + b

(* GOOD: each clause says exactly what it accepts *)
f[a_?NumericQ, b_?NumericQ] := a + b
f[a_String, b : Except[_String]] := a <> ToString[b]
```

### Order downvalues most-specific first, and watch the auto-reordering

The evaluator tries to apply more specific definitions before more
general ones, and it *reorders* the downvalues of a symbol by specificity
as you enter them - so the textual order you typed is not always the
order that runs. Write definitions most-specific first anyway, so the
code reads in the order it (usually) evaluates.

The reordering is purely structural. A `Condition` (`/;`) or a
`PatternTest` (`?`) with non-trivial logic on the **left-hand side**
defeats it: the evaluator can't see that one such clause is more specific
than another, so they stay in entry order and you can get the wrong
clause.

```wolfram
(* likely not intended: the general clause is entered first and is
   NOT promoted, because the Condition hides the specificity *)
f[x_Integer?Positive] := "a"
f[x_Integer] /; Positive[x] && EvenQ[x] := "b"
f[2]   (* -> "a", probably not what you wanted *)

(* fix by ordering the clauses manually, most specific first *)
f[x_Integer?(Positive[#] && EvenQ[#] &)] := "b"
f[x_Integer?Positive] := "a"
f[2]   (* -> "b" *)
```

In general, prefer conditions on the right-hand side (see below) and
avoid `Condition` on the LHS when you have many downvalues. You can probe
relative specificity with `` Internal`ComparePatterns[lhs1, lhs2] ``.

### Prefer conditions on the right-hand side

For a function with many downvalues, putting the branch logic on the RHS
(via `Which`/`Switch` or a guarded result) keeps the dispatch readable and
sidesteps the LHS-condition reordering trap above.

```wolfram
(* instead of one guarded clause per case on the LHS *)
dv[args_ /; condition1] := code1
dv[args_ /; condition2] := code2

(* gather the branch logic on the RHS *)
dv[args_] := Which[
	condition1,
		code1,
	condition2,
		code2
]
```

### Too-general patterns surprise you in replacements

The same looseness causes issues in `Replace`/`ReplaceAll`. A blank matches
everything, including the parts you meant to leave alone.

```wolfram
list = {1, "a", 2, "b", 3}

list /. _ -> "NOPE"         (* {"NOPE", "NOPE", ...} - everything *)
list /. _String -> "NOPE"   (* {1, "NOPE", 2, "NOPE", 3} - intended *)
```

### Avoid `Part` (`[[ ]]`)

Reaching into an expression by position is brittle: a positional index
says nothing about what it is pulling out, and it breaks when the shape
shifts. Prefer named patterns, `First`/`Last`/`Rest`/`Most`/`Drop`, or a
small helper function.

```wolfram
(* BAD *)
abbreviation = {letters[[1]], letters[[8]]}

(* GOOD: First / Drop *)
abbreviation = {First[letters], First[Drop[letters, 7]]}

(* GOOD: a named-pattern replacement *)
abbreviation = letters /. {i1_?UpperCaseQ, ___, i2_?UpperCaseQ, ___} :> {i1, i2}
```

### `Set`/`SetDelayed` and `Rule`/`RuleDelayed`: pick the one you mean

Use the delayed form (`:=`, `:>`) whenever the right-hand side names a
pattern variable or should re-evaluate on each use; use the immediate
form (`=`, `->`) when you want the RHS evaluated once, now.

```wolfram
(* immediate: RHS evaluated once, frozen *)
f[x_] = RandomInteger[{0, 10}]   (* every f[x] returns the same number *)

(* delayed: RHS re-evaluated on each call *)
f[x_] := RandomInteger[{0, 10}]  (* a fresh number each time *)
```

A subtle trap: with `Rule`, a pattern name that already has a global
value is substituted before the rule applies, so prefer `:>` whenever the
left-hand side binds a name.

```wolfram
y = 3;
{f[x], g[x]} /. _[y_] -> y   (* y is replaced by 3 first - surprise *)
{f[x], g[x]} /. _[y_] :> y   (* binds y per match, as intended *)
```

## Control flow

Avoid procedural code. If you find yourself writing C/Fortran-style loops
with explicit counters and mutation, step back and use a functional form.

### No `For` loops

Don't write `For[i = 1, i <= n, i++, ...]`. Use:

- `Do[body, {i, n}]` for side effects with a counter.
- `Table[expr, {i, n}]` to build a list.
- `Nest`, `NestList`, `NestWhile`, `Fold`, `FoldList` when there's
  iterative state to thread through a fixed transition.
- `Map`, `Scan` to act over a list.

```wolfram
(* BAD *)
For[i = 1, i <= n, i++,
	AppendTo[acc, f[i]]
]

(* GOOD *)
acc = Table[f[i], {i, n}]
```

### Listability over `Map`

Arithmetic heads (`Power`, `Times`, `Plus`, `Sqrt`, ...) are `Listable`:
they thread over lists on their own. Write the threaded expression
directly and save `Map` for operations that genuinely are not Listable
(applying a derivative to each function in a list, property extraction).

```wolfram
(* BAD *)
Total[Map[#^2 &, s["Velocities"]]]

(* GOOD *)
Total[s["Velocities"]^2]

(* GOOD - Derivative over a list of functions is not Listable *)
Map[#'[t] &, paths]
```

### `Replace` over `Switch` for value-to-value mapping

When the cases are simple value patterns mapping to values (no
structural tests, no side effects), `Replace` with a rule list is
more concise and reads as data, not control flow.

```wolfram
(* GOOD *)
legend = Replace[OptionValue[PlotLegends], {
	None | False -> None,
	Automatic | True :> familyLegend[presentFamilies]
}]
```

Use `Switch` (or `Which`) when branches have side effects, dispatch
on richer patterns, or need fallthrough `_` to the original value.

### No Comma-on-own-line between multi-line branches

When the branches of `If` (or args of `Block`, `Switch`, `With`,
etc.) are each multi-line, put a carriage return between each argument.
The carriage reads as a branch boundary, like a horizontal rule.
If the code blocks in the arguments are large then put a short comment
before each to indicate where that block starts.
Do not put a comma on its own line.

```wolfram
(* GOOD *)
branchial = If[ TrueQ[OptionValue["Branchial"]],
	DeleteDuplicates @ Catenate @ Map[
		s |-> ...,
		sliceKeys
	],

	{}
]

(* GOOD: short branches keep commas inline *)
If[Length[dirs] === 0,
	counter = 0,
	counter += 1
]
```

### No `Head[expr] === Foo` - use `MatchQ`

`Head[x] === Foo` is a structural test that doesn't compose with
patterns. `MatchQ[x, _Foo]` (or `MatchQ[x, Foo[args...]]` for a
shape check) is the canonical form.

```wolfram
(* BAD *)
If[ Head[expr] === Inactive[Equal] && expr[[1]] === expr[[2]], ...]

(* GOOD *)
If[ MatchQ[expr, Inactive[Equal][x_, x_]], ...]
```

### Equality: exact vs approximate

Use `===` (`SameQ`) and `=!=` (`UnsameQ`) to compare exact values and
structure. Use `==` (`Equal`) / `!=` (`Unequal`) when comparing
approximate (machine/real) values, where structural identity is the wrong
question (`1.4142135623730951 == Sqrt[2]` is `True`; `===` is `False`).
In cases of a boolean test you will typically use `===` (`SameQ`) or `=!=` (`UnsameQ`).

### Keep control structures local

Wrap a control structure (`If`, `Which`, `Switch`) around only the part
that actually varies, not around a whole duplicated expression. It is
shorter and the difference between branches jumps out.

```wolfram
(* BAD: the call is duplicated just to swap one argument *)
If[ test,
	func[arg1, arg2, Blue],
	func[arg1, arg2, Red]
]

(* GOOD: the If sits in the argument that changes *)
func[arg1, arg2, If[test, Blue, Red]]

(* GOOD: when logic can't live inline, bind it just above *)
With[{color = If[test, Blue, Red]},
    func[arg1, arg2, color]
]
```

## Bulletproofing

First separate two things a function can do with input it returns no value
for - they are not the same and must not be conflated:

- **A wrong-type or wrong-shape argument is a non-match, not an error.** Put
  the validity in the pattern (see *Argument patterns and fall-throughs*) so
  no clause matches and the expression **returns unevaluated**. Do *not* give
  the function a wide pattern and then `Confirm` the argument's type to manufacture
  a `Failure` - that turns an ordinary non-match (which is free to be used
  symbolically or gain a definition later) into a spurious error, and is the
  anti-pattern this section most wants you to avoid. The same goes for a
  well-formed case you deliberately scoped out: it issues a message and
  **returns unevaluated**, and **never a `Missing`**. A `Missing` is a
  *value* - it flows silently into arithmetic downstream, and it forecloses the later definition
  that would have handled the case. An unevaluated expression does neither,
  and says plainly that nothing was computed.
- **A `Failure` is for an attempt that engaged and could not finish** - a
  clause matched, computation started, and a step only checkable *after*
  starting did not work out. Signal it by **returning a `Failure` object, not
  by throwing a `Message` and returning `$Failed`.**

**The failure mode of a missing guard is not an unhelpful return value, it is
a confident wrong answer.** With no finiteness guard, matrix Lie groups
reached finite-group operations and were *answered* rather than refused:

```wolfram
AbelianGroupQ[GeneralLinearGroup[3, Reals]]   (* returned True *)
```

Write the in-scope pattern so that the cases the algorithm silently assumes
(finite, commutative, char 0, square, non-degenerate) are the cases it can
match, and test the boundary. Predicates need the matching care on the other
side: the `predicateQ[___] := False` fall-through answers "no" to ill-typed
and out-of-scope input, but it must never tell a caller "false" about input
that is valid but undecided - that is a wrong answer wearing a guard's
clothing. Guard the `False` on bad input only and leave the undecidable cases
unevaluated (see *Things to check from time to time*).

Handle the second case with the `Confirm`/`Enclose` paradigm:

- Wrap the body in `Enclose` (`Enclose @ Module[...]` when you need
  locals) and validate intermediate results with `Confirm`, `ConfirmBy`,
  `ConfirmMatch`, `ConfirmAssert`. The first failed `Confirm` sends control
  to the enclosing `Enclose`, which returns a `Failure`. The third argument
  to a `Confirm*` is the message that `Failure` carries:

```wolfram
(* Type is in the pattern, so a non-matrix is a non-match (left unevaluated);
   singularity cannot be seen in the pattern - it is only discovered by
   attempting the inverse, so it is Confirmed and becomes a Failure. *)
safeInverse[m_?MatrixQ] := Enclose[
	ConfirmBy[Quiet @ Inverse[m], MatrixQ, "matrix is singular."]
]
(* safeInverse[5]                  -> safeInverse[5]   (no match, unevaluated) *)
(* safeInverse[{{1, 1}, {1, 1}}]   -> Failure["ConfirmationFailed", <|...|>]   *)
```

- Prefer a `Failure[...]` over `Message[...]; $Failed`. A `Failure` is a
  value: it carries its own message (`failure["Message"]`), is inspectable,
  composes, and propagates cleanly through `Confirm` and `FailureQ`. A
  thrown `Message` is a side effect that a caller cannot catch structurally.
  When constructing one directly, give it a tag and a message template:

```wolfram
Failure["badArgument", <|
   "MessageTemplate" -> "`1` is not a valid argument.",
   "MessageParameters" -> {arg}
|>]
```

- A `Failure[...]` (or `$Failed`) returned by any inner function should
  always be passed upward immediately; test with `FailureQ`, or just `Confirm` it.
- Never use `Return`. Structure the code so the value falls out, or use
  `Confirm`/`Enclose` to return control upward.

## Efficiency

Readability comes first, but a handful of habits buy real speed at no
cost to clarity.

### Collapse repeated tests of one symbol into `Switch`/`Which`

A stack of `If`s that all test the same value is both slower and harder
to read than a single `Switch` (or `Which`).

```wolfram
(* BAD *)
If[ MatchQ[n, 0], m = "a"];
If[ MatchQ[n, 1], m = "b"];
If[ !MatchQ[n, 0 | 1], m = "c"]

(* GOOD *)
m = Switch[n,
	0,
		"a",
	1,
		"b",
	_,
		"c"
]
```

### Hoist a repeated check into a named flag

If the same test appears in several branches, compute it once into a
`With` binding and reuse the flag.

```wolfram
With[{aFlag = NumericQ[a], bFlag = NumericQ[b]},
	Which[
		aFlag && bFlag,
			code1,
		aFlag && !bFlag,
			code2
	]
]
```

### Order tests fastest-first

Inside `And`/`Or`, put the cheap tests first so an early `False`/`True`
short-circuits before the expensive one runs. A `MatchQ` is far cheaper
than an `Integrate`, so test the shape first.

```wolfram
(* GOOD: cheap MatchQ guards the expensive Integrate *)
MatchQ[Hold[expr], Hold[pattern_]] && Integrate[expr, x] == 1
```

### `And[...]`/`AllTrue` over `And @@ {...}`

`And @@ {a, b, c}` builds the whole list first, evaluating every element;
`And[a, b, c]` stops at the first `False`. When you are testing a list
with one predicate, `AllTrue`/`AnyTrue`/`NoneTrue` run the test only as
far as the logic requires.

```wolfram
And[5 > 3, 6 > 4, 7 > 5]
AllTrue[{-3, -2, -1, 0, 1}, Positive]
```

### `Lookup` with a default over nested `Replace`

When you want a keyed value with a fallback, `Lookup` is clearer and
faster than chaining `Replace`/`ReplaceAll` to patch in the default.

```wolfram
(* BAD *)
"Result" /. rules /. "Result" -> None

(* GOOD *)
Lookup[rules, "Result", None]
```

### Check validity before expensive work

Do the cheap rejections first so you never pay for a computation whose
result you are about to discard. Use `Confirm`/`Enclose` (see
Bulletproofing) to bail out the moment an input fails, rather than
computing a result and validating it afterward. For a function that scans
a list or expression, `Catch`/`Throw` lets you exit as soon as a trigger
is hit instead of finishing the scan.

```wolfram
Catch[
	Map[
		If[! FreeQ[#, Root | RootSum] && approximatableQ[#], Throw[#]] &,
		exprList
	]
]
```

### Don't reassign one variable through a pipeline

Reusing a single mutable name for each stage obscures the data flow and
makes debugging harder (you can't inspect an earlier stage). Give each
stage its own descriptive binding instead.

```wolfram
(* BAD: one name, reassigned twice *)
variable = Range[5];
variable = 2 * variable;
variable = Riffle[variable, 0]

(* GOOD: a name per stage *)
Module[{base = Range[5], doubled, riffled},
    doubled = 2 * base;
    riffled = Riffle[doubled, 0]
]
```

(This is about *staged reassignment*, not the single-use values that
should still be inlined - see Composition.)

### Multi-argument `Quiet`, `Sow`/`Reap`, `Catch`/`Throw`

Quiet only the messages you expect, not everything; tag `Sow`/`Reap` and
`Catch`/`Throw` so each sown or thrown value has a known destination.

```wolfram
(* instead of silencing every message *)
Quiet[1/0, Power::infy]

(* tag thrown values so the right Catch picks them up *)
Catch[
	Throw[$Failed, "failureTag"],
	"failureTag"
]
```

### Keep arguments held when a function shouldn't evaluate them

If you must pass an unevaluated expression into a function that lacks a
`Hold*` attribute, wrap it in `Hold` (and unwrap where needed). Any
developer utility like a `debugPrint` should carry `HoldAllComplete` so
it never adds evaluation to normal runtime.

## Mutation

### No `AppendTo` (or other list-growing mutation)

`AppendTo[xs, y]` is `xs = Append[xs, y]`, which copies on every step.
Build the result with `Table`, `Map`, or `Fold` so the final list is
allocated once.

```wolfram
(* BAD *)
out = {};
Do[ AppendTo[out, f[i]], {i, n} ];
out

(* GOOD *)
out = Table[f[i], {i, n}]

(* GOOD: state threaded by Fold *)
acc = Fold[step, init, xs]
```

Same for Associations: use `Association[Table[k -> v, ...]]`,
`AssociationMap`, or `Fold[Append, <||>, kvPairs]` rather than
`assoc[k] = v` inside a `Do`.

### Bracket alignment

A closing `]` (or `}`, `|>`, `)`) goes on its own line, indented
to the same column as the opening head. Never end a multi-line
form with `...]` on the last expression's line.

```wolfram
(* GOOD *)
Module[{x, y, z},
	body1;
	body2
]

(* BAD *)
Module[{x, y, z},
	body1;
	body2]
```

## Pure functions

Pure functions are valuable, but reach for them only when they earn their
keep.

### Don't use a pure function where a named operator does the job

```wolfram
(* BAD *)
(#1 + #2) & @@ {1, 2}

(* GOOD *)
Plus @@ {1, 2}
```

### Prefer the full `Function[{x, ...}, ...]` form for anything non-trivial

Slot (`#`/`&`) syntax is fine for something small and obvious like
`Times[#, 5] & /@ Range[5]`. Past that, named arguments read far better
and make precedence explicit.

```wolfram
(* BAD: opaque slot soup *)
(#1 + (#2^#3 - #1)/#1) &[1, 2, 3]

(* GOOD *)
Function[{x, y, z},
	x + (y^z - x)/x
][1, 2, 3]
```

### Don't nest pure functions

Nested `&` functions are a notorious source of precedence bugs and are
hard to read after the fact. Lift the inner one out into a named helper
or a `Function[var, ...]`.

```wolfram
(* BAD: which # belongs to which &? *)
(# + 1 & /@ #^2) &[Range[4]]

(* GOOD *)
addOne[ex_] := ex + 1
(addOne /@ #^2) &[Range[4]]
```

## Composition

### `@` chain for unary right-application

For chains of unary calls, prefer `f @ g @ h[x]` over `f[g[h[x]]]`.
Less bracket nesting, reads top-down. Use `[]` only where you need
multiple args.

```wolfram
(* GOOD *)
DeleteDuplicates @ Catenate @ Map[fn, xs]

(* BAD: ceremonial nesting *)
DeleteDuplicates[Catenate[Map[fn, xs]]]
```

Reserve `@` for a single symbol head applied to a single argument (or a
chain of them). Never apply `@` to a parenthesized compound expression -
`f@(multipleBitsOfCode)` is hard to read and invites precedence
surprises. Use full `f[...]` application there.

```wolfram
(* BAD: never do this *)
f@(multipleBitsOfCode)

(* GOOD *)
f[multipleBitsOfCode]
```

### `Lookup` is vectorized; prefer it over `Map[Lookup, ...]`

`Lookup[assoc, listOfKeys, default]` returns a list of values in
the order of the keys.

```wolfram
(* GOOD *)
EdgeLabels -> Lookup[edgeRules, edges, ""]
```

### Don't name single-use intermediates

If a value is read exactly once, inline it. Exception: name it when the
expression is long enough that the named form reads better, or when the
name carries domain meaning the inline expression doesn't.

### No postfix `//`

Postfix application reads fine in casual scratch work but is confusing in
committed code and carries surprising precedence. Use prefix or full
application.

```wolfram
(* BAD *)
codeToEvaluate // fnc

(* GOOD *)
fnc[codeToEvaluate]
```

### No infix `~f~` for prefix functions

`{a} ~Join~ {b}` evaluates correctly but makes precedence hard to track.
Write the ordinary prefix call.

```wolfram
(* BAD *)
{a} ~Join~ {b}

(* GOOD *)
Join[{a}, {b}]
```

### Parenthesize where precedence is ambiguous

When the reader (or you) would have to recall the precedence table, add
parentheses. This is especially important around `PatternTest` (`?`),
where `a_?f[x]` is genuinely ambiguous:

```wolfram
(* unclear: is the test f, or f[x]? *)
a_?f[x]

(* spell out what you mean *)
a_?(f[x])    (* PatternTest against f[x] *)
(a_?f)[x]    (* a pattern a_?f, applied to [x] *)
```

Naming a pattern inside `Alternatives` is another precedence trap: the
`:` binds more loosely than `|`, so the name captures the whole
alternation only with explicit grouping.

```wolfram
a : {__} | b : {{_, _}..}        (* head is Optional - probably not intended *)
(a : {__}) | (b : {{_, _}..})    (* head is Alternatives - intended *)
```

`Repeated` (`..`) directly after a literal number parses as intended (`0..`
is `Repeated[0]`, and the kernel itself prints it back as `(0)..`), but the
run of dots reads as a decimal point at a glance. Group the operand:

```wolfram
(* hard to read: the eye sees 0. and a stray dot *)
0..

(* GOOD *)
(0)..
```

### Modularize repeated computation

When the same sub-expression appears in several definitions, factor it
into a well-named helper. The logic flows more clearly and a later change
happens in one place instead of many.

```wolfram
(* BAD: the quadratic formula is copied into each definition *)
fnc1[a_, b_, c_] := (-b + Sqrt[b^2 - 4 a c])/(2 a)
fnc2[d_, e_, f_, x_] := x - (-e + Sqrt[e^2 - 4 d f])/(2 d)

(* GOOD: one helper, reused *)
quadraticRoot[a_, b_, c_] := (-b + Sqrt[b^2 - 4 a c])/(2 a)

fnc1[a_, b_, c_] := quadraticRoot[a, b, c]
fnc2[d_, e_, f_, x_] := x - quadraticRoot[d, e, f]
```

## Usage messages

Write a usage message for every function and parameter, public or not, and
write it *early* - often before the implementation, since drafting it
forces you to settle the argument forms and output shape. The temptation
to "write the usage message later" reliably produces missing or poor
messages. Keep messages in sync with the patterns as the code evolves; the
usage message is part of the code.

Format (this is what gives you Complete Selection and template insertion
for free): the template for each argument form starts the line, followed
by a short description; one form per line.

```wolfram
foo::usage = "foo[string] gives the length of the string.\n\
foo[integer] gives the number of digits in the integer.\n\
foo[{integer1, integer2, ...}] gives a list of the number of digits in each.";
```

Bad usage messages: no description (`"foo[string]"`), no template at the
start (`"gives the length of the string"`), neither (`"foo"`), or empty
(`""`).

If the function takes options, describe them briefly in the usage message.

You can use `` GeneralUtilities`SetUsage `` to format usage messages
consistently with built-in symbols (`` Needs["GeneralUtilities`"] ``).

## Comments

Wolfram code reads as a vertical narrative, so too many inline comments
between lines disrupt it (unlike languages where comments sit off to the
right). Prefer:

- A `Text`-style cell (in a notebook) or a comment block *before* a
  function's definition, describing what it does.
- A short comment at a genuinely subtle point in the code, to alert the
  next developer before they change it.
- Comment non-obvious behavior, quirks, or external format constraints
  (LibraryLink calling conventions, paclet layout expectations, etc.).
- Don't narrate obvious code. Prefer one short section comment over many
  tiny inline comments.
- Put spaces around the text inside a comment: `(* note *)`, not
  `(*note*)`.
- Worth a comment even when the code looks clear: what each function and
  non-obvious helper does, a representative example input, and any case
  where a result is deliberately suppressed (and why).

Record every non-obvious decision where the next person will hit it: a terse
`(* *)` note in the kernel source for per-definition rationale,
`docs/notes/<Topic>.md` for anything above the level of one definition (the
three `doc-*.md` notes there belong to the documentation system itself).
Record what was rejected as well as what was chosen, and say when a
decision was ours to make rather than handed down by the Physics Project's
own definition, the mathematics or a built-in's behavior - a later reader is
entitled to know it can be revisited.
"Element list, not generators" is half a record; "element list, not
generators - generators were rejected because they are
representation-dependent; our call, revisitable" is the whole one.

## Data structures

When a function takes a data structure of a particular shape, describe that
shape explicitly - in the usage message, or in a comment / text cell just
before the code. A later developer should not have to infer the structure
from the implementation.

## Paclet structure (StructuredPackageFormat)

This paclet uses the StructuredPackageFormat (new in Mathematica 15;
installable in 12.1+). It is built on four `` System` `` directives:
`PackageInitialize`, `PackageExported`, `PackageScoped`, `PackageImport`.
The paclet is organized around a single umbrella context for the entire
paclet, `` WolframInstitute`WolframPhysics` ``. The umbrella loads all of the
code in the paclet and there is no need for any sub-contexts.

### Layout

The structured paclet format comprises a single file containing the
`PackageInitialize` for the paclet's context and any number of additional
`.wl` files containing the paclet's codebase. These `.wl` files can exist in
a directory structure that is at most 3 levels deep. Often one only goes one
or two levels deeper than the top-level file containing the
`PackageInitialize`. Those one-level directories are named according to
specific topic or conceptual areas, thus providing clear organization to the
intent of the codebase.

```
WolframPhysics/
  PacletInfo.wl                        manifest: name, version, context, extensions
  Kernel/
    WolframPhysics.wl                  umbrella: PackageInitialize[...] defines the paclet's Context
    InitialEvaluations.wl              loaded first (LoadFirstFiles); empty sections today
    FinalEvaluations.wl                loaded last (LoadLastFiles); empty sections today
    GeneralParameters.wl               paclet-wide symbols: $WolframInstituteWolframPhysicsVersion
    <Category>/
      <Topic>.wl                       feature file: PackageExported[...] declarations (none yet)
  Tests/
    GeneralParameters.wlt              tests mirror the Kernel layout
    <Category>/
      <Topic>.wlt
  Documentation/English/
    Guides/<Name>.nb                   built from docs/en/Guides/<Name>.md
    Tutorials/<Name>.nb                built from docs/en/Tutorials/<Name>.md
    ReferencePages/Symbols/<Name>.nb   built from docs/en/ReferencePages/Symbols/<Name>.md
  ResourceDefinition.nb                built from docs/ResourceDefinition.md
```

The `PackageInitialize` collects all `PackageExported` / `PackageScoped`
symbols into the paclet's context. Feature files are anonymous contributors;
the split is for human organization, and a file's category folder has no
effect on any symbol's context. (`PackageInitialize` only reaches into its
own directory and into directories up to 3 levels deep for code files to
process.) The documentation notebooks are build output of
`scripts/build_notebooks.wls`: the markdown under `docs/en/` is the source of
truth, a notebook is never edited by hand, and no notebook is in git. They are
written by `./build_docs.sh` and rebuilt by every publish
([CONTRIBUTING.md](CONTRIBUTING.md), "Building the documentation"), so the tree
above shows the layout a build produces, not what a clone carries.

### PacletInfo.wl

The manifest, abridged: the `"Description"`, `"Creator"`, `"License"`,
`"Keywords"` and `"Categories"` entries are omitted:

```wolfram
PacletObject[<|
  "Name" -> "WolframInstitute/WolframPhysics",
  "PublisherID" -> "WolframInstitute",
  "Version" -> "0.0.1",
  "WolframVersion" -> "15.0+",
  "PrimaryContext" -> "WolframInstitute`WolframPhysics`",
  "Extensions" -> {
    {"Kernel", "Root" -> "Kernel", "Context" -> {"WolframInstitute`WolframPhysics`"}},
    {"Documentation", "Root" -> "Documentation", "Language" -> "English"},
    {"Test", "Root" -> "Tests", "Method" -> "Experimental-v1"}
  }
|>]
```

Loading and `"Symbols"`. By default a paclet's `"Loading"` is `Manual`: it
loads only on explicit `Needs`/`Get`. To make it autoload (load on first use
of a symbol, no explicit `Needs`), set `"Loading" -> Automatic` on the Kernel
extension and list the trigger symbols in `"Symbols"`. Crucially,
`"Symbols"` does nothing unless `"Loading" -> Automatic` is also set: the
PacletManager only turns `"Symbols"` into autoload triggers under the
`Automatic` branch. So a bare `"Symbols"` list with default (manual) loading
has no effect; either add `"Loading" -> Automatic` or just `Needs` the
paclet. This paclet uses manual loading and the tracked file carries no
`"Symbols"` list; `scripts/docbuild.wls` fills one into the publishable copy
from the `PackageExported` lines, because the resource pages' click-to-copy
wraps documented code in `PacletSymbol` for exactly the symbols declared
there. Bump `"Version"` with every change a user can see. This is not just
bookkeeping: the PacletManager keys on version, so a bump lets a fresh load
prefer this checkout over an installed or cached copy left at the old version
(reinstall or re-cache after bumping).

### The umbrella loader

The umbrella is a single-file StructuredPackageFormat package containing the
`PackageInitialize` that defines the paclet-wide context;
`` Needs["WolframInstitute`WolframPhysics`"] `` then loads the full codebase.
`Kernel/WolframPhysics.wl` is exactly this:

```wolfram
PackageInitialize["WolframInstitute`WolframPhysics`",
	<|
		"HiddenImports" -> {"GeneralUtilities`"},
		"LoadLastFiles" -> {"FinalEvaluations.wl"},
		"LoadFirstFiles" -> {"InitialEvaluations.wl"},
		"IgnoreFiles" -> {}
	|>
]
```

The second argument is where an external context is made available to the
whole paclet (`"HiddenImports"` puts `` GeneralUtilities` `` in reach of every
feature file without exposing it to the user), where the load order is
pinned (`InitialEvaluations.wl` first, `FinalEvaluations.wl` last), and where
a file is excluded. After loading, the umbrella registers
`` WolframInstitute`WolframPhysics`PackageScope` `` as an importable package
and drops it off `$ContextPath` again, so `PackageScoped` symbols are
reachable by short name through
`` Needs["WolframInstitute`WolframPhysics`PackageScope`"] `` (which tests use)
and a plain load exposes no scoped name.

There is no per-category loader; a second `PackageInitialize` with autoload
(`"Loading" -> Automatic` plus a `"Symbols"` list) would need
`"SymbolsToProtect" -> Automatic` so the autoload stubs do not shadow the real
definitions, and this paclet has none.

### Feature files

A feature file is just declarations plus definitions. It declares its public
symbols with `PackageExported`, its cross-file internals with `PackageScoped`,
and the other contexts it uses with `PackageImport`; everything else is
automatically private to the file:

```wolfram
(* WolframInstitute`WolframPhysics` :: Multiway :: MultiwaySystem *)

PackageExported[MultiwaySystemGraph]       (* public: lands in the umbrella context *)
PackageScoped[canonicalHypergraph]         (* shared across the paclet's files, not public *)
PackageImport["GeneralUtilities`"]         (* import another paclet/context *)

MultiwaySystemGraph::usage = "MultiwaySystemGraph[rules, init, n] gives the multiway graph of n steps of rules from init."
MultiwaySystemGraph[rules_, init_, n_Integer?NonNegative] := Enclose[...]
```

- `PackageExported[sym]`: public symbol.
- `PackageScoped[sym]`: shared across the paclet's files but not exported.
- `` PackageImport["Other`Context`"] ``: bring in another paclet/context;
  can import specific names with `` PackageImport["Ctx`", {sym1, sym2}] ``.
  The `` "Other`Context`" `` symbols are only available within the `.wl` file
  within which `PackageImport` is called.
- To provide access to an external context to the full paclet make use of
  the second argument to `PackageInitialize` in the loader file.
- Any symbol you neither export nor scope is automatically private to its
  file.

Put `PackageExported`/`PackageScoped` declarations and usage messages near
the top of the file, then the definitions. The `PackageExported` lines are
also the export list as a document: `scripts/docbuild.wls` reads them to fill
the publishable copy's `"Symbols"`, and `tools/dev/doc_symbols_check.py`
reads them to decide which symbols may have a reference page. So a new public
symbol needs its `PackageExported` line and its usage message, its reference
page and its entry on the guide.

### Referencing symbols: load the context, don't qualify

Don't write fully-qualified `` WolframInstitute`WolframPhysics`MultiwaySystemGraph ``
in code or tests. `Needs` the context you want (which puts it on
`$ContextPath`) and use the short name; load contexts explicitly rather than
reaching across them by full path.

```wolfram
Needs["WolframInstitute`WolframPhysics`"]
$WolframInstituteWolframPhysicsVersion
```

## Tests

Use `VerificationTest`. Test specs live in `.wlt` files under
`WolframPhysics/Tests/`, mirroring the `Kernel` directory layout, run via
`TestReport`. `Tests/GeneralParameters.wlt` is the one that exists today: the
paclet loads, the context exists, and the version association matches
`PacletInfo.wl`.

```wolfram
VerificationTest[
	expression,
	expectedOutput,
	TestID -> "human-readable id"
]
```

Test the scope boundary, and test its two outcomes *distinctly*. Input the
function does not match **returns unevaluated** - assert its head is
intact:

```wolfram
VerificationTest[
	Head @ safeInverse[5],
	safeInverse,
	TestID -> "safeInverse-nonmatching-left-unevaluated"
]
```

A call that engaged and failed returns a `Failure` (see Bulletproofing) - assert
that with `FailureQ`:

```wolfram
VerificationTest[
	FailureQ @ safeInverse[{{1, 1}, {1, 1}}],
	True,
	TestID -> "safeInverse-singular-returns-Failure"
]
```

Don't put `Print` inside test bodies; the runner reports outcomes via
`TestReport`. Make a `.wlt` runnable standalone by registering, at the top,
whichever of `Directory[]` and `FileNameJoin[{Directory[], "WolframPhysics"}]`
holds a `PacletInfo.wl` (copy the `Scan[PacletDirectoryLoad, Select[...]]`
head from `Tests/GeneralParameters.wlt`; run tests from the repo root or the
paclet folder), then `` Needs["WolframInstitute`WolframPhysics`"] ``. The
repository root itself is never registered: a `PacletDirectoryLoad` of a
directory wider than the paclet discovers every paclet copy under it, and a
stale duplicate (a leftover worktree, a sibling checkout) can win over the one
being tested. (`Directory[]` is the working directory the tests are run from,
which is what makes that registration resolve. `$InputFileName` is the trap: `TestReport`
never points it at the test file, it keeps whatever the calling kernel had, so
a `.wlt` run through a `wolframscript -file` script sees that script's path,
while running the `.wlt` itself with `wolframscript -file` does name the
`.wlt`. A test that resolves paths from `$InputFileName` therefore works one
way and breaks the other; anchor on `Directory[]` instead.)

Run the whole suite from the shell with the `.wls` runner,
`scripts/run_tests.wls`, from the repo root, so it loads this checkout's paclet
and not an installed release; it loops over the `.wlt` files, reports each via
`TestReport`, prints a stdout summary, and exits non-zero if anything failed
(so it drops into CI):

```
wolframscript -file scripts/run_tests.wls
wolframscript -file scripts/run_tests.wls WolframPhysics/Tests/GeneralParameters.wlt
```

## Documentation

Documentation is authored as literate markdown under `docs/en/`: a `.md` page
with YAML frontmatter and `## ` sections, which `scripts/build_notebooks.wls`
converts through MarkdownToNotebook from the `tools/MarkdownToNotebook`
submodule (the same code as the resource function deployed at nikm's cloud,
which is fetched only where the checkout is missing; nothing is hand-edited in
the DocumentationTools palette) into the `.nb` the paclet ships under
`WolframPhysics/Documentation/English/`. The converter chooses every cell style
from the markdown structure and evaluates the `wl` cells against the paclet in
`WolframPhysics/`. The three page types each have a skill under
`.agent-skills/`:

- `wolfram-symbol-page`: a `ref/` reference page for one exported symbol
  (Usage, `Details & Options`, then the example sections: Basic Examples,
  Scope, Options, Applications, Properties and Relations, Possible Issues,
  Neat Examples); one per exported symbol, with examples covering every
  argument form, every option and at least one realistic application.
- `wolfram-guide-page`: the `guide/` page, the documentation home: an abstract
  and a content-first index of the functions of the Wolfram Physics Project,
  organized by topic, fundamentals first, with a provenance tag on every entry
  saying where the function lives (a built-in is a chip with `(WL)`; a
  Function Repository, paclet, site or Community function is a markdown link
  with its origin in parentheses, as [AGENTS.md](AGENTS.md) "Guide entries for
  functions that live elsewhere" sets out). The paclet's own symbols, once it
  has them, are chips with no marker.
- `wolfram-tech-note`: a `tutorial/` page, free-flowing prose interleaved with
  runnable examples that thread state from the first cell to the last. A new
  tutorial follows the newest tutorial that passed the gates below for shape
  and voice, not as a template to copy cell for cell, and every cell it takes
  from any page is re-evaluated before it is recorded.

Three more skills cover the rest of the pipeline: `functions-library-ingest`
surveys an external source of Wolfram Physics functions into vetted guide
entries, `implement-wolfram-functions` turns a guide's own symbols into a
kernel feature file under `WolframPhysics/Kernel/<Category>/<Topic>.wl` plus
its tests, with this style guide as its contract, and `deploy-wolfram-physics`
runs or monitors a deploy. No other skill exists or is assumed. CONTRIBUTING's
"Adding a topic" and "Documentation" and the pipeline in
[AGENTS.md](AGENTS.md) say how the research note, the guide entry, the
implementation, the page, the verification and the notebook commit fit
together.

The rules a page must meet follow, one heading each. The rules the user called
out at the top of this guide (no em dashes, no source-file citations, no bold
or uppercase for emphasis, no subroutine vocabulary and its "returns
unevaluated" form) apply to every page, caption and hint as well.

### Voice

A page is written in the neutral declarative voice of the built-in reference
pages and tech notes. No meta-commentary about the document ("this tutorial
walks through", "in this section we will", a "Next steps" or "Summary"
section): content is announced by naming the objects, and the Related Guides
and Tech Notes sections the frontmatter builds are the next steps. No "we" and
no "let's"; "you" is fine. No ritual reassurance ("every example is checked
by evaluation") and no stock intensifiers ("powerful", "seamless", "blows up
quickly"): where a claim can be computed, a cell computes it, and the number
replaces the adjective. No performance claims and no design rationale in
visible prose; rationale for the next developer goes in a `#| annotation`
marker, as the symbol-page skill describes.

### Symbols, strings and argument names

Every Wolfram Language symbol on a page is a link, built-in and paclet symbol
alike: `[Graph]()` and `[MultiwaySystemGraph]()` for a mention, and
`<code>[MultiwaySystemGraph]()[*rules*, *init*, *n*]</code>` for a signature,
so the built page links each name to its reference page. The one exception
is a guide's `## Functions` bullets, where the leading backtick span is the
chip the converter links, and a built-in is marked with a trailing `(WL)`
after it (`` `IsomorphicGraphQ` (WL) ``) while the paclet's own symbols carry
no marker; a function that lives elsewhere is a markdown link with its origin
in parentheses, never a chip, because a bare chip links to this paclet's own
`ref/` page. Backticks are for what is not a symbol: a string, a property
name, an option setting (`"StatesList"`, `"IncludeBoundaryEvents" -> All`),
a pattern or a source fragment. An argument name is markdown italic
(`*rules*`, `*init*`, `*n*`, `*prop*`), spelled the same in the signature,
the Details bullets and the prose; a subscripted name is math (`$v_1$`),
never `*v_1*` (the underscore leaks) or `*v1*` (the literal pair renders); no
argument name is camelCase. A context name in prose is a double-backtick span
with a space inside each end, `` WolframInstitute`WolframPhysics` ``, because
the context's own backtick closes a single-backtick span early. No page
carries a file path of any kind.

### One demonstration per cell

A `wl` cell is one expression with one output, under a one-sentence caption
that ends in `:`, with `---` between sibling demonstrations. No `;`-separated
compound (`edges = ...; Length[Union @@ edges]`): a `;`-hidden binding is an
object the reader never sees. No statements stacked in one fence, which render
as several outputs under one input that the reader cannot copy one at a time,
and no `{f[a], g[b]}` bundle of unrelated results; a list output is right only
when the list is the demonstration, such as a `Table` over step counts showing
growth or the two sides of an identity. A binding the page needs is its own
captioned cell whose output shows the object.

The compound cell and the pair it becomes, as a page carries them:

````md
BAD, the hypergraph is bound and used in one cell, so the object the reader
needs never appears as an output:

```wl
edges = {{1, 2}, {2, 3}, {3, 1}}; Length[Union @@ edges]
```

GOOD, two demonstrations, each under its own caption, with `---` between them:

A hypergraph of three binary edges, as a list of edges:

```wl
edges = {{1, 2}, {2, 3}, {3, 1}}
```

<!-- => {{1, 2}, {2, 3}, {3, 1}} -->

---

The number of vertices it touches:

```wl
Length[Union @@ edges]
```

<!-- => 3 -->
````

### Showcase what functions return

In tutorials and other doc pages with code, every exercised paclet symbol has
its actual return value displayed at least once, an unreduced evaluation the
reader sees, before any reduced use (`Length[...]`, `Min[...]`, a
`=== expected` check, a dimension). For large outputs show an honest
representative slice (`First[...]`, a `Part`, or the smallest instructive
instance) and only then reduce. A page whose every use of a function is a
count or a boolean teaches nothing about the function's return shape. Two
corollaries: display the raw evaluation first and put a `Simplify`d form, when
worth showing, in its own follow-up cell with a lead-in sentence (a
`Simplify[...]` final is for identity checks, where the reduction is the
point); and give each distinct evaluation, a different signature, option or
property, its own cell, under the one-demonstration rule above.

### Show raw records through a view

A result that is an Association of Associations keyed by id (the state or
event records of a multiway evolution are the usual case) renders badly as a
bare Association in the built notebook. Show it through `Keys` (what a record
carries), a `Part` or `First` (one record) or, for record structure the
reader must see, `Dataset`, and say in the caption which view the reader is
looking at. Data is drawn, never tabulated, wherever a picture can carry it: a
bar or line chart, a histogram, an `ArrayPlot` of a grid, a labelled scatter.
A cell whose input is hand-typed data (a corpus, a list of records, a style
list) starts with `#| collapse: input`, so its output shows and the input
opens from the group bracket. Strings, numbers, lists, `Failure` objects,
summary boxes and graphics serialize fine, and a cell whose output is a
summary box or a graphic gets no `<!-- => ... -->` hint; every other hint is
recorded char-exact from `ToString[result, InputForm]`, never transcribed.

The same records bare and through a view:

````md
BAD, an Association of Associations keyed by id lands in the notebook as a
block the reader cannot read:

```wl
records = <|1 -> <|"Edges" -> {{1, 2}}, "Step" -> 0|>, 2 -> <|"Edges" -> {{1, 3}, {3, 2}}, "Step" -> 1|>|>
```

GOOD, the caption names the view and the output is a table of records:

The two states, as a Dataset:

```wl
Dataset[records]
```
````

### Keep cells small and pictures wide

The notebook build and the example runner both evaluate every cell, and the
multiway systems the Physics Project's functions build grow exponentially: a
rule that splits one edge into two doubles and more the number of states at
every step. A cell runs in about a second (a few seconds at most for one
deliberately larger picture) and a page in under half a minute. Only the
example runner sets a per-cell limit, 600 seconds, after which it aborts that
cell and reports it; `build_notebooks.wls` has none, so a runaway cell stalls
the build rather than failing it. That means a rule with one or two left-hand
edges, one to three initial edges and 2 to 5 steps; a count property beyond
that; a structure or shape variant of a graph when the point is shape; and
`ImageSize` on every graph so a cell is at least as wide as it is tall, since
a tall cell reads badly. (`CellHeight` / `LargeCellBounds` is the
resource-submission check's tag for an oversized rasterized output, worth
knowing when a page goes to the repository, but nothing here runs it.) A
Function Repository function is fetched on first use, so the first cell of a
page that uses one is slower than the rest by that fetch; that is a fact
about the page's build, and never a reason to hand-type the output. On a
shared machine the example runner's header names the knob that caps its
kernel pool.

### Verify by evaluation, never from memory

Every documented example is run and produces what the page claims, and every
version-sensitive claim about a built-in is checked against the same kernel
the tests run on. A hint written from recollection is a defect even when it
turns out to be right. Evaluation is from a scratch `.wls` file run from the
repository root with `wolframscript -file`, after
`PacletDirectoryLoad[FileNameJoin[{Directory[], "WolframPhysics"}]]` and
`` Needs["WolframInstitute`WolframPhysics`"] ``, never with
`wolframscript -code` (see [AGENTS.md](AGENTS.md), "How to evaluate Wolfram
Language here"). A function the guide links from elsewhere is evaluated the
way a reader would evaluate it, through `ResourceFunction` or after
`PacletInstall` and `Needs` of its paclet, and the research note records what
came back. That recipe belongs to the scratch file and never to the page: a
page's `Context` frontmatter makes the converter load the paclet before the
first cell evaluates, so no cell of its own carries a `Needs` or a
`PacletDirectoryLoad`.

### A message example shows its message

A cell whose point is a message shows it. The expression is never wrapped in
`Quiet`: the reader of the built page sees the message under the input, as on
the built-in reference pages, and the `<!-- => ... -->` hint names it after
the value, `<!-- => $Failed; the message Sym::tag is issued -->`, or names
each of them, `<!-- => $Failed; the messages Sym::tag1 and Sym::tag2 are issued -->`.
A message is the point of every cell under `## Possible Issues` that issues
one, and of every cell whose caption says a message is issued; a `Quiet`
there, and a caption that reads "quieted here", are the defect.
`scripts/run_doc_examples.wls` reads every `Sym::tag` a
hint names and requires exactly those messages of the cell: the cell fails
when it issues a message its hint does not name, or none of the ones it
names; `General::stop` only says a message repeated and is ignored. `Quiet`
stays only around an incidental warning that is not the example's point, a
warning inside a larger expression whose value is the demonstration, and then
it names that one message, `Quiet[expr, Solve::ifun]`, and the hint does not
name it, since the reader never sees it.

### Example cells live only as long as the built page keeps them

A page's `wl` cells evaluate in one kernel in document order, but the built
page resets that state as it goes: a `---` thematic break and any heading are
reset boundaries, and once the page's protection snapshot arms, every boundary
clears every binding made after it. The snapshot arms at the first heading
whose whole text is one of the twelve canonical example-section names, matched
case-insensitively, that follows an already-evaluated cell: `Basic Examples`,
`Scope`, `Scope and Additional Elements`, `Generalizations and Extensions`,
`Options`, `Applications`, `Visualizations`, `Analysis`,
`Properties and Relations`, `Possible Issues`, `Neat Examples` and
`Requirements` (the list `scripts/run_doc_examples.wls` and
[docs/notes/doc-example-state.md](docs/notes/doc-example-state.md) carry). On
a house-style symbol page that comes to three authoring rules:

- Shared setup belongs under `## Basic Examples`, which is everything before
  that first canonical heading and is kept for the whole page. Define the
  sample rule, the initial hypergraph and the evolution there, and every later
  section can use them.
- Every cell in a later section stands on its own. A definition and its use
  are safe together only while no `---` and no heading separates them, so put
  them in one cell group: the definition as its own captioned cell whose
  output shows the object, then the cell that uses it, with no `---` between.
- Spell the example section headings canonically, `Properties and Relations`
  and not `Properties & Relations`. Both spellings reach the same section, since
  the converter's section key normalizes `" & "` to `" and "`, but the snapshot
  matcher does not: it compares the lowercased heading text against the
  canonical list as it stands, in the converter and in
  `scripts/run_doc_examples.wls` alike, so an ampersand heading arms nothing,
  no boundary ever clears anything, and the page threads state end to end while
  its author writes to the rule above. The rule is about the example sections;
  `Details & Options` keeps its ampersand.

A cell that reads a binding a boundary threw away usually shows no error at
all: it echoes its own input back as its output (`Divisors[modulus]` where the
reader should see `{1, 2, 3, 4, 6, 12}`), which is how the effect shipped
unnoticed. `scripts/run_doc_examples.wls` evaluates every page under these
exact semantics and fails such a cell; locally run it as
`wolframscript -file scripts/run_doc_examples.wls <page.md>`.
Tutorials are the exception the build makes deliberately: they convert with
`"EvaluateSeparator" -> None` and thread state from first cell to last, and
the runner checks them the same way. The full rule, the converter internals
behind it and the probe evidence are in
[docs/notes/doc-example-state.md](docs/notes/doc-example-state.md).

### Math

Math in doc prose is `$...$`, parsed by `LaTeXMathParse` of the
`Wolfram/Parser` paclet; `scripts/build_notebooks.wls` installs it from the
Paclet Repository before converting and prints which version it found, because
without it the converter silently falls back to `ImportString[..., "TeX"]` and
the math renders wrong (a build machine cut off from the paclet server
degrades this way; the CI pod smoke test checks the install). This paclet's
pages need little math (a dimension estimate, a growth rate, a
causal-invariance condition), and two rules cover what they need.

A word never sits raw in inline math. `$topology$` is a product of eight
italic letters, so the built page reads *t o p o l o g y*, not the word. An
argument placeholder takes the markdown italic form (`*rule*`, `*init*`) in
the signature, the Details bullets and the prose alike, and a span made of
nothing but names leaves math altogether, `(*pts*, *blocks*)` rather than
`$(pts, blocks)$`. A word inside a real formula (an operator name, a label in
a script, a unit) is wrapped in `\text{...}` or written with the macro that
already exists for it (`\max`, `\gcd`): `$\{x \in ℝ : \text{cond}\}$`,
`$n_{\text{kmax}}$`. Two argument spellings stay in math because the italic
form cannot carry them, a subscripted name (`$v_1$`) and a Greek name (`$α_1$`
in a signature, `$\alpha_1$` in prose).

A word that is really a symbol name is neither placeholder nor prose: link it,
`<code>[Graph]()</code>`. That one is a convention the lint cannot see, so it
falls to review.

Inside a `<code>` usage signature a `$...$` is a template-argument slot, not a
LaTeX span, and any backslash macro in it leaks onto the page as raw source
(`$\text{rate}$`, `$q_{\max}$`, `$\alpha$` and `$\dots$` all leak there, though
every one of them renders in prose). A signature therefore carries only
markdown italic names (`*init*`, `*n*`), plain subscripted names (`$v_1$`,
`$v_{min}$`) and Unicode Greek (`$α_1$`); an ellipsis is the bare character
next to the slots, `{$x_1$, …}`; a superscript takes the Unicode digit or
moves to prose math beside the span; a subscript that is an expression and two
tokens in one slot leak as well, so each name gets a slot of its own and the
prose states the bound. The same quantity takes `\text{...}` when it reappears
in the prose formula below the signature.

`scripts/lint_docs.wls` enforces both rules, in prose math and in a signature
slot alike, and every construct of the slot paragraph above. CI runs it in the
`check` job and CONTRIBUTING's "The gates" runs it before a commit, so a page
is clean only once the lint has passed on it. How it tells a word from a run
of juxtaposed symbols, which spans do and do not fire, and how a genuine
symbol run earns a place in its `mathWordAllowlist` are in
[docs/notes/doc-math-rendering.md](docs/notes/doc-math-rendering.md).

Backslash Greek letters (a bare `alpha_1` renders letter by letter), Unicode
letters, `\mathfrak`, the `\mathit` and `\text` choice for a subscripted word
base in prose, and the rest of the rendering evidence are in
[docs/notes/doc-math-rendering.md](docs/notes/doc-math-rendering.md) and
[docs/notes/doc-arg-naming.md](docs/notes/doc-arg-naming.md).

### Context backticks in prose and inside `<code>`

Write a context name in prose as the double-backtick span,
`` Needs["WolframInstitute`WolframPhysics`"] ``: it passes the lint in any
paragraph and converts to a plain inline code span. The `<code>` form,
`` <code>Needs["WolframInstitute\`WolframPhysics\`"]</code> `` with the
backticks escaped, converts to an inline formula with `Needs` linked; the
unescaped form converts to the same cell, and the escape is for GitHub's
renderer, which reads the unescaped backticks as a nested code span and shows
`Needs["WolframInstituteWolframPhysics"]` with the context gone. The lint
pairs backtick runs before it sees the tag, so
a single-backtick span later in the same paragraph pairs with the escaped
backtick and the paragraph fails with "backtick code span never closes";
reserve the `<code>` form for a paragraph in which no backtick span follows it.

### Verify rendering, not source, for anything typographic

The rules above are correct-in-source, wrong-on-delivery: a backtick inside a
single-backtick code span silently eats a context name, a word raw in math
sets as spaced letters, and a macro in a signature slot leaks as source. None
of them is visible to a review of the markdown, and argument subscripts and
cell heights fail the same way. If a change is about how something looks,
build the page (`./build_docs.sh only=<Name>`, or a single conversion through
the deployed converter) and look at the built result.

## Things to check from time to time

- Every localized symbol in a `Module`/`Block` is actually listed in its
  binding list (and used).
- Every function's usage message is up to date with its patterns.
- Every predicate (`...Q`) has a `[___] := False` fall-through **for ill-typed or
  out-of-scope input**. The exception: a predicate whose truth is genuinely
  *undecidable* for some otherwise-valid inputs guards its `False` on bad input
  only (e.g. `predQ[a_, b_] := False /; ! (validQ[a] && validQ[b])`) and leaves the
  undecidable cases **unevaluated** rather than answering `False`. A
  robust way to build such a predicate is to decide each direction only where it is
  *sound* (a clause that yields `True` only when provably true, a clause that
  yields `False` only when provably false) and let everything else stay symbolic.
  Other public functions deliberately have **no** catch-all clause - input matching
  no pattern returns unevaluated, never funneled into a `Failure`.
- No leftover internal/`Private` long-name references
  (`` SomeContext`Private`helper ``) or undocumented internal System functions
  (see *Avoid depending on `` System`Private` `` internals*).
- No `Return[...]` in a definition - restructure so the value falls out, or use
  `Catch`/`Throw` or `Enclose`/`Confirm` (see Bulletproofing).
- Every option in an exported symbol's `Options[...]` is described on its
  reference page, and every option a page names is one the symbol accepts.
- No page names a symbol the paclet does not export, and no guide links to a
  `ref/` page that does not exist (`tools/dev/doc_symbols_check.py`). A guide
  entry for a function that lives elsewhere is a markdown link with its
  provenance tag, never a bare chip.
- The pages that ship were built from the markdown as it stands. Nothing in the
  tree can say otherwise, because no notebook is in git; `scripts/docbuild.wls`
  fails a publish whose notebooks are missing or older than their markdown.
- Every entry on the guide still resolves: the Function Repository, paclet,
  site and Community links a survey page carries go stale as those resources
  move, and nothing here checks them.
- The usage messages in the kernel files and the Usage sections of the
  reference pages describe the same argument forms.
