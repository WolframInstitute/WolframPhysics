#!/usr/bin/env wolframscript
(* Run every ```wl code cell in the markdown doc sources (docs/en, plus
   docs/ResourceDefinition.md) as a test. The cells are evaluated the way the
   BUILT page evaluates them, so a cell that would echo unevaluated under red
   messages for a reader fails here. Ported from PureMath's
   scripts/run_doc_examples.wls by way of HypergraphRewritingEngine's; the walk,
   the reset semantics, the hint rule and the failure rules are theirs, the
   paclet is this repo's.

   Usage:
     wolframscript -f scripts/run_doc_examples.wls              (all doc files)
     wolframscript -f scripts/run_doc_examples.wls a.md b.md    (specific files)

   Environment:
     WP_DOC_EXAMPLES_KERNELS=<n>   cap the parallel worker pool at n kernels
                                   (default: LaunchKernels[], one per core)

   Prints a per-file line and an overall summary; exits 1 if any cell fails
   (a message, an abort, a binding the built page has already thrown away, or
   an output that disagrees with the cell's recorded hint), suitable for CI.
   A tree with no wl cell at all passes with zero cells, and so does a page
   with no code: a documentation-only paclet is a valid state of this repo,
   not a misconfiguration.

   ---- The hint rule ----

   A wl cell may be followed by an author-facing <!-- => ... --> comment
   recording what the cell produces. The converter strips those comments before
   it evaluates anything, so nothing on the build path ever compares one with
   the real output, and a hint that went stale when the code changed rides
   through every other check. This runner compares them: the cell's last output,
   printed with ToString[..., InputForm, PageWidth -> Infinity] and its runs of
   whitespace collapsed, has to equal the hint, or equal the part of it before
   the "; " or ", " a hint puts a note behind
   ("$Failed; the message Foo::unknownprop is issued and quieted here",
   "10, after the printed lines").
   Cells whose output is a graphic, a summary box or a Dataset carry no hint and
   are not compared.

   ---- The rendering rule this runner mirrors ----

   MarkdownToNotebook evaluates a page's executable cells in ONE kernel session,
   in document order, inside a private per-page context, and it RESETS that
   state as it goes (option "EvaluateSeparator"). The reset is not the naive
   "everything dies at every heading":

     * A reset BOUNDARY is a thematic break (a line of three or more identical
       "-", "_" or "*") or ANY ATX heading, at any level. A boundary inside a
       fenced block is code, not a boundary.
     * Boundaries do nothing until the page's PROTECTION SNAPSHOT is armed.
       It arms at the first heading whose text is one of the canonical
       example-section names ($canonicalHeadings below, matched case-insensitively
       on the whole heading text) AND that follows at least one already-evaluated
       cell. At that instant every symbol the page has defined so far is
       protected for the rest of the page.
     * From then on every boundary ClearAll-s every page symbol that is not in
       the snapshot. Definitions that live OUTSIDE the page context (a paclet
       symbol's UpValues, $Assumptions, Off[...], SetOptions) are never cleared.

   On a house-style symbol page (Usage / Details & Options / Basic Examples /
   Scope / ...) the first cell is under "Basic Examples", the "## Basic Examples"
   heading itself precedes it and so does not arm anything, and the next
   canonical heading - usually "## Scope" - arms the snapshot. That is why only
   Basic-Examples bindings survive: they are everything defined before the arming
   heading. A page whose sections after the first cell are all NON-canonical
   ("Details & Options", a "### subsection", "Properties & Relations" spelled
   with an ampersand) never arms the snapshot and threads state throughout.

   Tutorials are built with "EvaluateSeparator" -> None (see build_notebooks.wls),
   which disables boundaries entirely, so a tutorial legitimately threads state
   from its first cell to its last. This runner applies None to docs/en/Tutorials
   for the same reason.

   A cell FAILS when it issues a message, aborts, or - the reset-specific case -
   when it reads a page symbol whose definition a boundary threw away, either
   echoing it back in its output or quietly computing something else from it.
   That last check is what catches the reader-visible "2 + b1" echo, which
   produces no message at all. *)

repoRoot = FileNameDrop[ExpandFileName[$InputFileName], -2]
pacletDir = FileNameJoin[{repoRoot, "WolframPhysics"}]
pacletContext = "WolframInstitute`WolframPhysics`"
(* the same values in the harness context, so a worker can reload the paclet
   from inside runFile (see the guard there) *)
RunDocExamples`pacletDir = pacletDir
RunDocExamples`pacletContext = pacletContext

$kernelCap = Replace[Quiet[ToExpression[Environment["WP_DOC_EXAMPLES_KERNELS"]]], Except[_Integer?Positive] -> None]
$kernelCapNote = If[IntegerQ[$kernelCap], " (WP_DOC_EXAMPLES_KERNELS=" <> ToString[$kernelCap] <> ")", ""]

argFiles = Rest[$ScriptCommandLine]
docFiles = If[argFiles === {},
	Select[
		Join[
			FileNames["*.md", FileNameJoin[{repoRoot, "docs", "en"}], Infinity],
			(* the resource-definition page ships with the paclet and its examples are
			   evaluated by the same build, but it sits outside docs/en *)
			Select[{FileNameJoin[{repoRoot, "docs", "ResourceDefinition.md"}]}, FileExistsQ]],
		StringContainsQ[Import[#, "Text"], "```wl"] &],
	ExpandFileName /@ argFiles
]

(* Nothing to run is a pass, not an error: the tree has pages but none carries a
   wl cell (the documentation-only state of this paclet). No kernel is launched. *)
If[docFiles === {},
	Print["run_doc_examples: no doc file with a wl cell under docs/en (or docs/ResourceDefinition.md)"];
	Print[""];
	Print["PASS  0 cells across 0 file(s)"];
	Exit[0]
]

(* per-cell wall clock; generous - a doc example that needs longer than this is
   wedged, and one wedged page must not hold the whole tree hostage *)
$cellTimeout = 600;

(* ---------------------------------------------------------------- *)
(* Segmentation: the ordered stream of executable cells and reset     *)
(* boundaries, parsed the way the converter parses a page.            *)
(* ---------------------------------------------------------------- *)

RunDocExamples`canonicalHeadings = {
	"basic examples", "scope", "scope and additional elements",
	"generalizations and extensions", "options", "applications",
	"visualizations", "analysis", "properties and relations",
	"possible issues", "neat examples", "requirements"};

RunDocExamples`fenceQ[line_String] := StringMatchQ[StringTrim[line], "```" ~~ ___]
RunDocExamples`fenceLen[line_String] :=
	StringLength[FirstCase[StringCases[StringTrim[line], StartOfString ~~ f : "`" .. :> f], _String, ""]]
RunDocExamples`headingQ[line_String] := StringMatchQ[line, "#" .. ~~ " " ~~ ___]
RunDocExamples`headingText[line_String] :=
	StringTrim[StringReplace[StringTrim[line], StartOfString ~~ "#" .. ~~ " " -> ""]]
(* a thematic break: three or more of the SAME character, from - _ * *)
RunDocExamples`separatorQ[line_String] := Module[{RunDocExamples`chars = Characters[StringTrim[line]]},
	Length[RunDocExamples`chars] >= 3 &&
		MemberQ[{"-", "_", "*"}, First[RunDocExamples`chars, ""]] &&
		Length[DeleteDuplicates[RunDocExamples`chars]] === 1
]

(* frontmatter, then HTML comments outside fenced blocks - a "#|" comment is the
   cell-option directive and survives as a bare "#|" line, everything else is
   author-only and is dropped, exactly as the converter drops it *)
RunDocExamples`dropFrontmatter[lines_List] := Module[{RunDocExamples`i, RunDocExamples`j},
	RunDocExamples`i = SelectFirst[Range[Length[lines]], StringTrim[lines[[#]]] =!= "" &, 0];
	If[RunDocExamples`i === 0 || StringTrim[lines[[RunDocExamples`i]]] =!= "---", Return[lines]];
	RunDocExamples`j = SelectFirst[Range[RunDocExamples`i + 1, Length[lines]],
		StringTrim[lines[[#]]] === "---" &, 0];
	If[RunDocExamples`j === 0, lines, Drop[lines, RunDocExamples`j]]
]

RunDocExamples`stripComments[lines_List] := Module[
	{RunDocExamples`out = {}, RunDocExamples`buf = {}, RunDocExamples`inFence = False,
		RunDocExamples`openLen = 0, RunDocExamples`flush},
	RunDocExamples`flush[] := (
		If[RunDocExamples`buf =!= {},
			RunDocExamples`out = Join[RunDocExamples`out,
				StringSplit[
					StringReplace[StringRiffle[RunDocExamples`buf, "\n"],
						"<!--" ~~ RunDocExamples`inner : Shortest[___] ~~ "-->" :>
							Which[
								StringStartsQ[StringTrim[RunDocExamples`inner], "#|"],
									StringReplace[StringTrim[RunDocExamples`inner], "\n" ~~ WhitespaceCharacter ... -> " "],
								(* an output hint is kept as a "#=>" marker line, which parseItems attaches
								   to the cell above it; every other comment is author-only and goes *)
								StringStartsQ[StringTrim[RunDocExamples`inner], "=>"],
									"#=>" <> StringReplace[StringDrop[StringTrim[RunDocExamples`inner], 2],
										"\n" ~~ WhitespaceCharacter ... -> " "],
								True, ""]],
					"\n", All]]];
		RunDocExamples`buf = {}
	);
	Do[
		Which[
			! RunDocExamples`inFence && RunDocExamples`fenceQ[RunDocExamples`line],
				RunDocExamples`flush[]; RunDocExamples`inFence = True;
				RunDocExamples`openLen = RunDocExamples`fenceLen[RunDocExamples`line];
				AppendTo[RunDocExamples`out, RunDocExamples`line],
			RunDocExamples`inFence && RunDocExamples`fenceQ[RunDocExamples`line] &&
				RunDocExamples`fenceLen[RunDocExamples`line] >= RunDocExamples`openLen,
				AppendTo[RunDocExamples`out, RunDocExamples`line];
				RunDocExamples`inFence = False; RunDocExamples`openLen = 0,
			RunDocExamples`inFence, AppendTo[RunDocExamples`out, RunDocExamples`line],
			True, AppendTo[RunDocExamples`buf, RunDocExamples`line]
		],
		{RunDocExamples`line, lines}
	];
	RunDocExamples`flush[];
	RunDocExamples`out
]

(* {"Code", source} | {"Code", source, hint} | {"Heading", text} | {"Separator"}
   in document order. Only EXECUTABLE cells become "Code": the converter's
   orderedCode keeps a fenced block only when its language is wl/wolfram/
   mathematica, its "eval" option is not False and it is not a literal-boxes
   cell. A "#=>" marker line (an output hint kept by stripComments) attaches its
   text to the Code item just above it. *)
RunDocExamples`parseItems[src_String] := Module[
	{RunDocExamples`lines, RunDocExamples`items = {}, RunDocExamples`inFence = False,
		RunDocExamples`openLen = 0, RunDocExamples`lang = "", RunDocExamples`body = {},
		RunDocExamples`pending = <||>, RunDocExamples`opts, RunDocExamples`optLines,
		RunDocExamples`codeLines},
	RunDocExamples`lines = RunDocExamples`stripComments[
		RunDocExamples`dropFrontmatter[StringSplit[src, "\n", All]]];
	Do[
		Which[
			! RunDocExamples`inFence && RunDocExamples`fenceQ[RunDocExamples`line],
				RunDocExamples`inFence = True;
				RunDocExamples`openLen = RunDocExamples`fenceLen[RunDocExamples`line];
				RunDocExamples`lang = ToLowerCase[First[StringSplit[StringDelete[
					StringDrop[StringTrim[RunDocExamples`line], RunDocExamples`openLen], {"{", "}"}]], ""]];
				RunDocExamples`body = {},
			RunDocExamples`inFence && RunDocExamples`fenceQ[RunDocExamples`line] &&
				RunDocExamples`fenceLen[RunDocExamples`line] >= RunDocExamples`openLen,
				RunDocExamples`inFence = False;
				RunDocExamples`optLines = TakeWhile[RunDocExamples`body,
					StringMatchQ[StringTrim[#], "#|" ~~ ___] &];
				RunDocExamples`codeLines = Drop[RunDocExamples`body, Length[RunDocExamples`optLines]];
				RunDocExamples`opts = Join[RunDocExamples`pending,
					Association[StringTrim[First[#]] -> StringTrim[Last[#]] & /@
						Select[StringSplit[StringReplace[StringTrim[#], StartOfString ~~ "#|" -> ""], ":", 2] & /@
							RunDocExamples`optLines, Length[#] === 2 &]]];
				RunDocExamples`pending = <||>;
				If[ MemberQ[{"wl", "wolfram", "mathematica"}, RunDocExamples`lang] &&
						! MemberQ[{"false", "False"}, Lookup[RunDocExamples`opts, "eval", "true"]] &&
						! KeyExistsQ[RunDocExamples`opts, "boxes"],
					AppendTo[RunDocExamples`items,
						{"Code", StringRiffle[RunDocExamples`codeLines, "\n"]}]],
			RunDocExamples`inFence, AppendTo[RunDocExamples`body, RunDocExamples`line],
			StringTrim[RunDocExamples`line] === "", Null,
			StringStartsQ[StringTrim[RunDocExamples`line], "#|"],
				RunDocExamples`pending = Join[RunDocExamples`pending,
					Association[StringTrim[First[#]] -> StringTrim[Last[#]] & /@
						Select[{StringSplit[StringReplace[StringTrim[RunDocExamples`line],
							StartOfString ~~ "#|" -> ""], ":", 2]}, Length[#] === 2 &]]],
			StringStartsQ[StringTrim[RunDocExamples`line], "#=>"],
				If[ MatchQ[Last[RunDocExamples`items, None], {"Code", _String}],
					RunDocExamples`items = Append[Most[RunDocExamples`items],
						Append[Last[RunDocExamples`items],
							StringTrim[StringDrop[StringTrim[RunDocExamples`line], 3]]]]],
			RunDocExamples`headingQ[RunDocExamples`line],
				AppendTo[RunDocExamples`items,
					{"Heading", RunDocExamples`headingText[RunDocExamples`line]}],
			StringMatchQ[StringTrim[RunDocExamples`line], "![" ~~ ___ ~~ "](" ~~ ___ ~~ ")"], Null,
			RunDocExamples`separatorQ[RunDocExamples`line],
				AppendTo[RunDocExamples`items, {"Separator"}],
			True, Null
		],
		{RunDocExamples`line, RunDocExamples`lines}
	];
	RunDocExamples`items
]

(* the page's evaluation context path, as the converter assembles it: the
   frontmatter Context, the paclet's own context, System`, the converter's frame
   packages, and the sub-contexts of those - notably NOT Global` *)
RunDocExamples`frontmatterValue[src_String, key_String] := Module[{RunDocExamples`m},
	RunDocExamples`m = StringCases[src,
		StartOfLine ~~ key ~~ ":" ~~ RunDocExamples`v : Except["\n"] .. :> StringTrim[RunDocExamples`v]];
	If[RunDocExamples`m === {}, "", First[RunDocExamples`m]]
]

RunDocExamples`framePackages = {"ResourceSystemClient`", "DefinitionNotebookClient`", "DocumentationTools`"};

RunDocExamples`contextPath[src_String] := Module[{RunDocExamples`base},
	RunDocExamples`base = DeleteDuplicates[DeleteCases[Flatten[{
		RunDocExamples`frontmatterValue[src, "Context"],
		StringReplace[RunDocExamples`frontmatterValue[src, "Paclet"], "/" -> "`"] <> "`",
		"System`"}], "" | "`"]];
	DeleteDuplicates[Join[
		RunDocExamples`base,
		RunDocExamples`framePackages,
		Flatten[Function[RunDocExamples`c,
			Select[Contexts[RunDocExamples`c <> "*"], ! StringEndsQ[#, "Private`"] &]] /@
				DeleteCases[RunDocExamples`base, "System`"]]]]
]

(* Whether the paclet is loaded in THIS kernel: its context is registered in
   $Packages once Needs has read the umbrella file. A subkernel the pool
   resurrects after a death comes back without it (the parallel framework re-sends
   distributed definitions, not what ParallelEvaluate did), and then every paclet
   symbol on a page is inert: no message, no value, a whole file of phantom
   failures. Fully qualified: this is defined before the paclet is loaded on a
   worker. *)
RunDocExamples`pacletLoadedQ[] := MemberQ[$Packages, RunDocExamples`pacletContext]

(* ---------------------------------------------------------------- *)
(* Evaluation                                                        *)
(* ---------------------------------------------------------------- *)

(* The hint check. Runs of whitespace are collapsed, so a hint written across a
   wrapped line still matches, and the message-cell convention "<value>; <prose>"
   is compared on the value alone. The cell's outputs are collected as it
   evaluates, so the Check wrapper that turns a message into a verdict never
   reaches this: the value compared is the value the reader sees. *)
RunDocExamples`normWS[RunDocExamples`t_String] :=
	StringReplace[StringTrim[RunDocExamples`t], Whitespace -> " "]

(* Two values are the same output when they agree up to floating-point noise: a
   machine real printed to its last digit differs between one machine and another
   (1.4150374992788433 on one, ...437 on the other), and a hint measured on one
   must pass the gate on the other. Reals agree within a relative 10^-9 (an
   absolute 10^-9 near zero); lists agree elementwise; associations agree key by
   key in order; an exact number never stands for an inexact one; anything else
   must be identical. The text comparison runs first, so a hint that is not a
   parsable value (a note after the value, a message convention) is judged as
   before. *)
RunDocExamples`closeQ[RunDocExamples`a_, RunDocExamples`b_] := Which[
	NumericQ[RunDocExamples`a] && NumericQ[RunDocExamples`b],
		(Precision[RunDocExamples`a] === Infinity) === (Precision[RunDocExamples`b] === Infinity) &&
			TrueQ[Abs[N[RunDocExamples`a] - N[RunDocExamples`b]] <=
				10^-9 Max[1, Abs[N[RunDocExamples`a]], Abs[N[RunDocExamples`b]]]],
	ListQ[RunDocExamples`a] && ListQ[RunDocExamples`b],
		Length[RunDocExamples`a] === Length[RunDocExamples`b] &&
			And @@ MapThread[RunDocExamples`closeQ, {RunDocExamples`a, RunDocExamples`b}],
	AssociationQ[RunDocExamples`a] && AssociationQ[RunDocExamples`b],
		RunDocExamples`closeQ[Keys[RunDocExamples`a], Keys[RunDocExamples`b]] &&
			RunDocExamples`closeQ[Values[RunDocExamples`a], Values[RunDocExamples`b]],
	True,
		RunDocExamples`a === RunDocExamples`b]

(* the hint's value part, parsed: the whole hint, else the part before the
   "; " or ", " a note follows; Null when neither parses *)
RunDocExamples`hintValue[RunDocExamples`hint_String] :=
	Module[{RunDocExamples`candidates, RunDocExamples`parsed},
		RunDocExamples`candidates = DeleteDuplicates[Prepend[
			Map[StringTrim[First[StringSplit[RunDocExamples`hint, #, 2]]] &, {"; ", ", "}],
			RunDocExamples`hint]];
		RunDocExamples`parsed = Quiet[Check[ToExpression[#, InputForm, Hold], $Failed]] & /@
			RunDocExamples`candidates;
		RunDocExamples`parsed = DeleteCases[RunDocExamples`parsed, $Failed];
		If[RunDocExamples`parsed === {}, {}, ReleaseHold /@ RunDocExamples`parsed]
	]

RunDocExamples`hintMismatch[RunDocExamples`hint_String, RunDocExamples`outs_List] :=
	Module[{RunDocExamples`got, RunDocExamples`want, RunDocExamples`values},
		If[RunDocExamples`outs === {}, Return[None]];
		RunDocExamples`got = RunDocExamples`normWS[
			ToString[Last[RunDocExamples`outs], InputForm, PageWidth -> Infinity]];
		RunDocExamples`want = RunDocExamples`normWS[RunDocExamples`hint];
		If[ RunDocExamples`got === RunDocExamples`want ||
				StringStartsQ[RunDocExamples`want, RunDocExamples`got <> ";"] ||
				StringStartsQ[RunDocExamples`want, RunDocExamples`got <> ","],
			Return[None]];
		RunDocExamples`values = RunDocExamples`hintValue[RunDocExamples`want];
		If[ AnyTrue[RunDocExamples`values, RunDocExamples`closeQ[Last[RunDocExamples`outs], #] &],
			None,
			{RunDocExamples`got, RunDocExamples`want}]
	]

SetAttributes[RunDocExamples`definedQ, HoldFirst];
RunDocExamples`definedQ[RunDocExamples`s_Symbol] :=
	OwnValues[RunDocExamples`s] =!= {} || DownValues[RunDocExamples`s] =!= {} ||
	SubValues[RunDocExamples`s] =!= {} || UpValues[RunDocExamples`s] =!= {} ||
	NValues[RunDocExamples`s] =!= {} || FormatValues[RunDocExamples`s] =!= {}
RunDocExamples`definedNameQ[name_String] :=
	TrueQ[ToExpression[name, InputForm, RunDocExamples`definedQ]]

(* A cleared binding shows up in a cell in two ways: the cell's output still
   mentions the symbol (the reader's unevaluated echo), or the cell reads it and
   quietly computes something else. Both are the page being wrong, so both fail -
   except where the cell binds the name itself, as a pattern variable, an
   iterator, or a Module/Block/With/Function local, which is a different symbol
   wearing the same name and no defect at all. *)
RunDocExamples`localizedQ[code_, RunDocExamples`sym_] :=
	! FreeQ[code, List[RunDocExamples`sym, ___]] ||
	! FreeQ[code, Verbatim[Pattern][RunDocExamples`sym, _]] ||
	AnyTrue[{Module, Block, With, Function},
		! FreeQ[code, HoldPattern[#][List[___, RunDocExamples`sym, ___], ___]] &]

(* assumes the name is currently undefined - the caller checks that first, so
   that ToExpression here yields the symbol and not some binding's value *)
RunDocExamples`staleHitQ[name_String, outs_, code_] := Module[{RunDocExamples`sym},
	RunDocExamples`sym = ToExpression[name];
	! FreeQ[outs, RunDocExamples`sym] ||
		(! FreeQ[code, RunDocExamples`sym] &&
			! RunDocExamples`localizedQ[code, RunDocExamples`sym])
]

(* The messages a cell's hint names, as "Sym::tag" strings. A cell whose point is a message
   shows it on the built page, as the built-in reference pages do, so it is never quieted: its
   hint names the message, and the cell must issue exactly the messages its hint names. A hint
   naming none expects none. *)
RunDocExamples`hintMessages[RunDocExamples`hint_String] :=
	DeleteDuplicates[StringCases[RunDocExamples`hint,
		RegularExpression["\\b[A-Za-z$][A-Za-z0-9$]*::[A-Za-z][A-Za-z0-9]*\\b"]]]

(* The names of the messages a cell SHOWS, "Sym::tag" by short name. The handler sees
   every message as Hold[Message[Sym::tag, args...], shown]; a quieted or Off-ed one
   carries False and is not something the reader sees, so it is skipped. Matched by
   pattern, never by Part: indexing into the held Message re-issues it. *)
RunDocExamples`recordMessage[RunDocExamples`evt_] := Replace[RunDocExamples`evt, {
	Hold[Message[MessageName[RunDocExamples`s_Symbol, RunDocExamples`t_String], ___], True] :>
		AppendTo[RunDocExamples`msgNames, SymbolName[Unevaluated[RunDocExamples`s]] <> "::" <> RunDocExamples`t],
	_ :> Null}]

(* One file: parse it into cells and boundaries, then walk them keeping exactly
   the state the built page keeps. Every harness local and iterator is
   context-qualified: a Block/Do binding named like a symbol a cell uses
   (k, src, cells, ...) would CAPTURE it during the cell's evaluation, so a
   cell's own k would read as its cell index. *)
runFile[file_] := Block[{
		RunDocExamples`src, RunDocExamples`items, RunDocExamples`mode, RunDocExamples`ctx,
		RunDocExamples`failures = {}, RunDocExamples`nCells = 0,
		RunDocExamples`protected = None,
		RunDocExamples`primed = False, RunDocExamples`lost = {}, RunDocExamples`lastBoundary = "",
		RunDocExamples`toRemove, RunDocExamples`held, RunDocExamples`outs, RunDocExamples`res,
		RunDocExamples`hadMessage, RunDocExamples`stale, RunDocExamples`msgNames,
		RunDocExamples`expected, RunDocExamples`unexpected, RunDocExamples`missing,
		RunDocExamples`snippet, RunDocExamples`mismatch},
	Quiet[Clear @@ Complement[Names["Global`*"], $harnessGlobalSymbols]];
	(* A worker without the paclet (a resurrected clone, or a loaded machine where the
	   paclet manager lost the Needs) would evaluate every cell of every page it takes
	   against inert symbols. Reload once, and say so plainly rather than reporting a
	   whole file of phantom failures. *)
	If[ ! RunDocExamples`pacletLoadedQ[],
		Quiet[PacletDirectoryLoad[RunDocExamples`pacletDir]; Needs[RunDocExamples`pacletContext]];
		If[ ! RunDocExamples`pacletLoadedQ[],
			Return[{file, 0, {{0, "the paclet is not loaded in this kernel, so every cell of the page would evaluate against inert symbols",
				"Needs[\"" <> RunDocExamples`pacletContext <> "\"]"}}}]]];
	RunDocExamples`src = Import[file, "Text"];
	RunDocExamples`items = RunDocExamples`parseItems[RunDocExamples`src];
	(* build_notebooks.wls converts docs/en/Tutorials with
	   "EvaluateSeparator" -> None, so a tutorial threads state end to end *)
	RunDocExamples`mode = If[MemberQ[FileNameSplit[file], "Tutorials"], None, Automatic];
	RunDocExamples`ctx = "WPDoc`P" <> IntegerString[Hash[file], 36] <> "`";
	Block[{$Context = RunDocExamples`ctx,
			$ContextPath = RunDocExamples`contextPath[RunDocExamples`src]},
		Do[
			Which[
				RunDocExamples`item[[1]] === "Heading" || RunDocExamples`item[[1]] === "Separator",
					(* the snapshot arms BEFORE the boundary it sits on resets anything *)
					If[ RunDocExamples`item[[1]] === "Heading" && RunDocExamples`protected === None &&
							RunDocExamples`primed &&
							MemberQ[RunDocExamples`canonicalHeadings, ToLowerCase[RunDocExamples`item[[2]]]],
						RunDocExamples`protected = Names[RunDocExamples`ctx <> "*"]];
					If[ RunDocExamples`mode =!= None && RunDocExamples`protected =!= None,
						RunDocExamples`toRemove = Complement[
							Names[RunDocExamples`ctx <> "*"], RunDocExamples`protected];
						RunDocExamples`lastBoundary = If[RunDocExamples`item[[1]] === "Heading",
							"the \"" <> RunDocExamples`item[[2]] <> "\" heading", "a --- separator"];
						(* remember only the ones that carried a DEFINITION: a bare symbolic
						   variable (the x of an Integrate) is cleared too and losing it is
						   not a defect. An entry stays until the page defines the symbol
						   again, so a binding lost at one boundary is still reported at the
						   next one. *)
						With[{RunDocExamples`gone = Select[RunDocExamples`toRemove, RunDocExamples`definedNameQ]},
							RunDocExamples`lost = Join[
								DeleteCases[RunDocExamples`lost, {Alternatives @@ RunDocExamples`gone, _}],
								{#, RunDocExamples`lastBoundary} & /@ RunDocExamples`gone]];
						If[RunDocExamples`toRemove =!= {},
							Quiet[ClearAll @@ RunDocExamples`toRemove]]
					],
				RunDocExamples`item[[1]] === "Code",
					RunDocExamples`nCells++;
					RunDocExamples`primed = True;
					RunDocExamples`outs = {};
					RunDocExamples`hadMessage = False;
					RunDocExamples`msgNames = {};
					RunDocExamples`expected = If[Length[RunDocExamples`item] >= 3 && StringQ[RunDocExamples`item[[3]]],
						RunDocExamples`hintMessages[RunDocExamples`item[[3]]], {}];
					RunDocExamples`held = Quiet[ToExpression[RunDocExamples`item[[2]], InputForm, Hold]];
					(* each cell is its own evaluation on the built page, so the repeat count
					   behind General::stop starts afresh with every cell *)
					RunDocExamples`res = Block[{$MessageList = {}}, Internal`HandlerBlock[{"Message", RunDocExamples`recordMessage},
						Check[
							TimeConstrained[
								If[ Head[RunDocExamples`held] === Hold,
									(* the converter evaluates a cell statement by statement and shows an
									   output for each one that does not end in a semicolon *)
									Do[
										With[{RunDocExamples`stmt =
												Extract[RunDocExamples`held, RunDocExamples`i, Hold]},
											If[ MatchQ[RunDocExamples`stmt, Hold[_CompoundExpression]],
												ReleaseHold[RunDocExamples`stmt],
												AppendTo[RunDocExamples`outs, ReleaseHold[RunDocExamples`stmt]]]],
										{RunDocExamples`i, Length[RunDocExamples`held]}],
									AppendTo[RunDocExamples`outs,
										ToExpression[RunDocExamples`item[[2]], InputForm]]],
								$cellTimeout],
							RunDocExamples`hadMessage = True]]];
					(* the verdict on messages: the ones the hint names are expected, and
					   General::stop only says one repeated *)
					RunDocExamples`unexpected = DeleteDuplicates @ DeleteCases[RunDocExamples`msgNames,
						Alternatives @@ Append[RunDocExamples`expected, "General::stop"]];
					RunDocExamples`missing = Complement[RunDocExamples`expected, RunDocExamples`msgNames];
					(* the reset-specific failure: the reader sees the cell echo a binding the
					   built page threw away at the last boundary *)
					RunDocExamples`stale = Select[RunDocExamples`lost,
						! RunDocExamples`definedNameQ[First[#]] &&
							RunDocExamples`staleHitQ[First[#], RunDocExamples`outs,
								RunDocExamples`held] &];
					RunDocExamples`snippet = StringTake[RunDocExamples`item[[2]], UpTo[70]];
					If[ RunDocExamples`stale =!= {} || RunDocExamples`res === $Aborted ||
							RunDocExamples`unexpected =!= {} || RunDocExamples`missing =!= {},
						AppendTo[RunDocExamples`failures, {
							RunDocExamples`nCells,
							Which[
								RunDocExamples`stale =!= {},
									"stale " <> StringRiffle[
										Last[StringSplit[First[#], "`"]] & /@ RunDocExamples`stale, ", "] <>
										" cleared at " <> RunDocExamples`stale[[1, 2]],
								RunDocExamples`res === $Aborted, "timeout",
								RunDocExamples`unexpected =!= {},
									"message the hint does not name: " <> StringRiffle[RunDocExamples`unexpected, ", "],
								True,
									"message the hint names but the cell did not issue: " <> StringRiffle[RunDocExamples`missing, ", "]],
							RunDocExamples`snippet}]];
					(* the recorded output. The converter strips a hint before it evaluates
					   anything, so this is the only place a page's claim meets the code. *)
					RunDocExamples`mismatch = If[
						Length[RunDocExamples`item] >= 3 && RunDocExamples`res =!= $Aborted,
						RunDocExamples`hintMismatch[RunDocExamples`item[[3]], RunDocExamples`outs],
						None];
					If[ RunDocExamples`mismatch =!= None,
						AppendTo[RunDocExamples`failures, {
							RunDocExamples`nCells,
							"hint records " <> RunDocExamples`mismatch[[2]] <> ", the cell gives " <>
								RunDocExamples`mismatch[[1]],
							RunDocExamples`snippet}]],
				True, Null
			],
			{RunDocExamples`item, RunDocExamples`items}
		]
	];
	Quiet[ClearAll[RunDocExamples`ctx <> "*"]];
	Quiet[Remove[RunDocExamples`ctx <> "*"]];
	{file, RunDocExamples`nCells, RunDocExamples`failures}
]

$harnessGlobalSymbols = Names["Global`*"];

(* worker pool: each worker loads the paclet and captures its own harness
   baseline; ParallelMap preserves file order for reporting.
   WP_DOC_EXAMPLES_KERNELS caps the pool. Scheduling is FinestGrained:
   clearing a binding at a boundary can make the cell that reads it afterwards
   slow, and with the default contiguous batches one such page holds its whole
   batch, and the run, hostage. *)
If[IntegerQ[$kernelCap], LaunchKernels[$kernelCap], LaunchKernels[]]
Print["run_doc_examples: ", Length[Kernels[]], " parallel kernel(s)", $kernelCapNote]
DistributeDefinitions["RunDocExamples`"]
DistributeDefinitions[runFile, $cellTimeout]
With[{pd = pacletDir, ctx = pacletContext},
	ParallelEvaluate[
		(* a shadow warning reflects the order this harness happened to load its
		   packages in, not anything the page does: the converter's kernel loads the
		   same contexts in its own order and the built page carries no such message *)
		Off[General::shdw];
		PacletDirectoryLoad[pd];
		Needs[ctx];
		(* the converter Needs its frame packages before evaluating a page, which
		   puts them on the page's context path; mirror that once per worker *)
		Quiet[Check[Needs[#], Null]] & /@ RunDocExamples`framePackages;
		$harnessGlobalSymbols = Names["Global`*"];
	]
]
Off[General::shdw]
PacletDirectoryLoad[pacletDir]
Needs[pacletContext]
Quiet[Check[Needs[#], Null]] & /@ RunDocExamples`framePackages;
$harnessGlobalSymbols = Names["Global`*"];

results = ParallelMap[runFile, docFiles, Method -> "FinestGrained"]

Scan[
	Function[r,
		Print[
			If[r[[3]] === {}, "  ok    ", "  FAIL  "],
			StringDrop[r[[1]], StringLength[repoRoot] + 1], "  (", r[[2]], " cells)"
		];
		Scan[
			f |-> Print["          cell ", f[[1]], " failed (", f[[2]], "): ", f[[3]]],
			r[[3]]
		]
	],
	results
]

totalCells = Total[#[[2]] & /@ results]
failedFiles = Select[results, #[[3]] =!= {} &]

Print[""]
Print[
	If[failedFiles === {}, "PASS  ", "FAIL  "],
	totalCells, " cells across ", Length[results], " file(s)",
	If[failedFiles === {}, "", "; " <> ToString[Length[failedFiles]] <> " file(s) with failures"]
]
If[failedFiles =!= {}, Exit[1]]
