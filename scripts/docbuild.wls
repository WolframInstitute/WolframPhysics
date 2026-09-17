#!/usr/bin/env wolframscript
(* DocumentationBuild the authoring notebooks into the publishable copy at build/WolframPhysics.

   scripts/build_notebooks.wls (wrapper: ./build_docs.sh) leaves the MarkdownToNotebook authoring
   notebooks under WolframPhysics/Documentation/English (build output, NOT tracked in git; they
   ship in the .paclet archive, where the Documentation Center builds them on demand) and the
   paclet's definition notebook at WolframPhysics/ResourceDefinition.nb. The Wolfram Cloud resource
   that scripts/publish.wls deploys needs the built pages instead: the guide/ref/tutorial notebooks
   DocumentationBuild produces from them, plus the search index. This script makes that copy without
   touching the authoring tree, behind one precondition and in three steps:
     0. require that the authoring notebooks are there and current with the markdown under docs/en
        (wpRequireBuiltDocs in scripts/deploy_common.wls). They are build output and are not tracked
        in git, so a checkout holds only what the last ./build_docs.sh on this machine wrote, and a
        page whose markdown has moved on since would be built and published as it stands;
     1. copy the paclet skeleton (PacletInfo.wl, Kernel, Tests, ResourceDefinition.nb: everything
        under WolframPhysics/ except the authoring Documentation and dotfiles) to
        build/WolframPhysics;
     2. fill the Kernel extension's "Symbols" list in the copy's PacletInfo.wl, not the tracked
        source file's, from the PackageExported declarations under Kernel/**/*.wl (the paclet is
        StructuredPackageFormat, so those declarations are its exported surface), each confirmed to
        exist once the paclet is loaded. PacletResource reads it (pacletDeclaredSymbols) to wrap
        documented code in PacletSymbol[...] for the click-to-copy, and without it the copied code
        carries bare symbols that fail in a fresh kernel. The tracked PacletInfo.wl stays clean;
     3. DocumentationBuild`DocumentationBuildNotebooks from WolframPhysics/Documentation into
        build/WolframPhysics/Documentation with "LinkBase" -> "WolframInstitute/WolframPhysics".
        Serial and whole-tree: the tree is a handful of pages, and the stock build writes the
        search index itself.

   Every run is a full rebuild of build/WolframPhysics. All of build/ is gitignored; nothing
   tracked changes. Ported from HypergraphRewritingEngine's scripts/docbuild.wls.

   Prerequisites: the authoring notebooks (./build_docs.sh; step 0 refuses to run without them) and
   a Front End, which the build uses to resolve links and metadata. On a Linux box without a display
   the front end needs QT_QPA_PLATFORM=offscreen; the script sets it there when neither it nor
   DISPLAY is set (wpOffscreenFrontEnd in scripts/deploy_common.wls, which is Get for that helper
   and the build guard, and loads no package). No cloud connection is involved.

   Usage: wolframscript -file scripts/docbuild.wls
   Knobs: none.
   Exit status: 0 when every authoring page has a built twin; 1 otherwise, naming the pages that
   did not build (a page mid-edit is the usual cause), the pages whose notebook is missing or stale
   against docs/en (step 0, before anything is copied), or the skeleton problem that stopped the
   build before it started. *)

scriptPath = ExpandFileName[$InputFileName];
repo = FileNameDrop[scriptPath, -2];
srcPaclet = FileNameJoin[{repo, "WolframPhysics"}];
buildPaclet = FileNameJoin[{repo, "build", "WolframPhysics"}];
srcDoc = FileNameJoin[{srcPaclet, "Documentation"}];
destDoc = FileNameJoin[{buildPaclet, "Documentation"}];
kernelDir = FileNameJoin[{srcPaclet, "Kernel"}];
pacletName = "WolframInstitute/WolframPhysics";
context = "WolframInstitute`WolframPhysics`";

(* DocumentationBuild's HTML transform RewriteHyperlinkString does StringTake[c, -1] on a possibly
   empty hyperlink segment: a Module-local with no global symbol to patch, partly front-end-side,
   so the noise message is switched off for the whole run (the errored result is discarded and the
   output is correct; without the Off the log fills with one message per empty segment). The
   front-end availability warning is noise for the same reason. *)
Off[StringTake::take];
Off[FrontEndObject::notavail];

(* The shared helpers: the build guard just below, and the offscreen front end further down.
   Getting the file loads no package. *)
Get[FileNameJoin[{repo, "scripts", "deploy_common.wls"}]];

(* 0. The authoring notebooks are build output and are not tracked in git, so a checkout holds
   whatever the last ./build_docs.sh on this machine wrote: a page added or edited since then has no
   notebook, or an old one, and this script would build that and hand it to the publish. Require
   that every source under docs/en, and docs/ResourceDefinition.md, has its notebook and that the
   build manifest beside the notebooks records the current build key for it, before anything is
   copied. The helper names the offending pages and says to run ./build_docs.sh. *)
If[! wpRequireBuiltDocs[repo, "docbuild: "], Exit[1]];

authoring = FileNames["*.nb", FileNameJoin[{srcDoc, "English"}], Infinity];
If[authoring === {},
	Print["docbuild: no authoring notebooks under ", srcDoc, "; run ./build_docs.sh first."];
	Exit[1]];
If[! FileExistsQ[FileNameJoin[{srcPaclet, "ResourceDefinition.nb"}]],
	Print["docbuild: ", FileNameJoin[{srcPaclet, "ResourceDefinition.nb"}], " not found; run ./build_docs.sh first."];
	Exit[1]];

(* A headless Linux front end (a CI pod) needs the offscreen Qt platform: without it the front
   end fails to start and DocumentationBuild builds nothing (wpOffscreenFrontEnd explains it). *)
wpOffscreenFrontEnd[];

(* 1. A fresh build copy: everything in WolframPhysics/ except the authoring Documentation, which
   DocumentationBuild produces below, and dotfiles. *)
If[DirectoryQ[buildPaclet], DeleteDirectory[buildPaclet, DeleteContents -> True]];
CreateDirectory[buildPaclet, CreateIntermediateDirectories -> True];
Do[
	With[{name = FileNameTake[item], target = FileNameJoin[{buildPaclet, FileNameTake[item]}]},
		Which[
			name === "Documentation" || StringStartsQ[name, "."], Null,
			DirectoryQ[item], CopyDirectory[item, target],
			True, CopyFile[item, target]]],
	{item, FileNames["*", srcPaclet]}];
Print["docbuild: paclet skeleton copied to ", buildPaclet];

(* 2. The exported surface, read from the PackageExported declarations in the kernel files (both
   PackageExported[sym] and PackageExported[{sym, ...}]), each confirmed to exist once the paclet
   is loaded. The file is parsed held, in a scratch context, so the scan evaluates nothing and
   creates no Global` symbol that would later shadow the paclet's own. Names[context <> "*"] is not
   used: it would also list any symbol a test or a scoped definition leaves in the public context.
   The build copy is what gets loaded, so the deploy's symbol resolution and the scrape later see
   one paclet. *)
wpDeclaredExports[file_String] := Block[{$Context = "WPDocbuildScan`", $ContextPath = {"WPDocbuildScan`", "System`"}},
	Module[{held = Quiet @ ToExpression[Import[file, "Text"], InputForm, HoldComplete]},
		If[! MatchQ[held, _HoldComplete], Return[$Failed, Module]];
		Flatten @ Cases[held,
			h_Symbol[decl_] /; SymbolName[Unevaluated[h]] === "PackageExported" :>
				Cases[HoldComplete[decl], s_Symbol :> SymbolName[Unevaluated[s]], {1, 2}],
			Infinity]]];
kernelFiles = FileNames["*.wl", kernelDir, Infinity];
scanned = AssociationMap[wpDeclaredExports, kernelFiles];
unparsed = Keys @ Select[scanned, # === $Failed &];
If[unparsed =!= {},
	Print["docbuild: these kernel files do not parse: ", unparsed];
	Exit[1]];
exports = Sort @ DeleteDuplicates @ Flatten @ Values[scanned];

PacletDirectoryLoad[buildPaclet];
Needs[context];
missingSyms = Select[exports, ! NameQ[context <> #] &];
If[exports === {} || missingSyms =!= {},
	Print["docbuild: the export list is ", exports, " and these do not exist after Needs: ", missingSyms];
	Exit[1]];
symbols = (context <> #) & /@ exports;

infoFile = FileNameJoin[{buildPaclet, "PacletInfo.wl"}];
infoText = Import[infoFile, "Text"];
(* Rebuild "Symbols" symbolically, not by text surgery: parse the file to its PacletObject
   association without evaluating PacletObject (that would normalize and re-key it), set the list on
   the Kernel extension, and re-serialize. The tracked file's comments do not survive the
   round trip; the build copy is not tracked, so nothing is lost. *)
held = ToExpression[infoText, InputForm, HoldComplete];
assoc = Replace[held, {
	HoldComplete[___, PacletObject[a_Association], ___] :> a,
	_ :> (Print["docbuild: ", infoFile, " is not a PacletObject[<|...|>]"]; Exit[1])}];
extensions = Lookup[assoc, "Extensions", {}];
If[! MemberQ[extensions, {"Kernel", ___}],
	Print["docbuild: no Kernel extension in ", infoFile];
	Exit[1]];
newExtensions = Replace[extensions,
	e : {"Kernel", ___} :> Append[DeleteCases[e, "Symbols" -> _], "Symbols" -> symbols], {1}];
newAssoc = <|assoc, "Extensions" -> newExtensions|>;

newText = If[StringStartsQ[StringTrim[infoText], "(* ::Package:: *)"], "(* ::Package:: *)\n\n", ""] <>
	With[{a = newAssoc}, ToString[Unevaluated[PacletObject[a]], InputForm, PageWidth -> 100]] <> "\n";
If[! SyntaxQ[newText],
	Print["docbuild: the regenerated PacletInfo.wl is not valid syntax; build copy left as is"];
	Exit[1]];
Export[infoFile, newText, "Text"];
Print["docbuild: declared ", Length[symbols], " symbol(s) in the build copy's PacletInfo.wl: ", symbols];

(* 3. DocumentationBuild. The result of the whole-tree build is not what decides success: the
   built tree is compared with the authoring tree, so a page that failed to build is named. *)
Needs["DocumentationBuild`"];
Print["docbuild: DocumentationBuild ", srcDoc, " -> ", destDoc];
buildResult = UsingFrontEnd @ DocumentationBuild`DocumentationBuildNotebooks[srcDoc, destDoc,
	"LinkBase" -> pacletName, "SuccessThreshold" -> 0.];

relPath[f_, base_] := FileNameDrop[f, FileNameDepth[base]];
authoringRel = relPath[#, FileNameJoin[{srcDoc, "English"}]] & /@ authoring;
builtRel = relPath[#, FileNameJoin[{destDoc, "English"}]] & /@
	FileNames["*.nb", FileNameJoin[{destDoc, "English"}], Infinity];
missing = Complement[authoringRel, builtRel];
indexDirs = Select[FileNames["*Index*", FileNameJoin[{destDoc, "English"}]], DirectoryQ];

Print["docbuild: built ", Length[Intersection[authoringRel, builtRel]], " of ", Length[authoringRel],
	" documentation notebooks under ", destDoc,
	If[indexDirs === {}, " (no search index directory found)",
		" (index: " <> StringRiffle[FileNameTake /@ indexDirs, ", "] <> ")"]];
If[missing =!= {},
	Print["docbuild: ", Length[missing], " page(s) did not build:"];
	Scan[Print["  ", #] &, missing];
	Exit[1]];
If[builtRel === {},
	Print["docbuild: DocumentationBuild produced no pages; result was ", buildResult];
	Exit[1]];
Exit[0]
