#!/usr/bin/env wolframscript
(* Convert the markdown documentation sources (docs/en/**/*.md) into the paclet's
   documentation notebooks with MarkdownToNotebook: the checkout in tools/MarkdownToNotebook,
   a submodule whose pointer follows the commit deployed as the public resource function at
   https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/MarkdownToNotebook, so the
   two are the same code and no cloud access is needed to build; the deployed resource is
   fetched only where the checkout is missing. The converter is never patched here.
   Ported from HypergraphRewritingEngine's scripts/build_notebooks.wls.

   Each source's Template frontmatter (Symbol / Guide / TechNote) selects the target
   directory under WolframPhysics/Documentation/English, and the notebook is named after the
   page's Name, which must equal the file's basename (the build fails loudly otherwise):
     docs/en/Guides/**/<Name>.md                  -> WolframPhysics/Documentation/English/Guides/<Name>.nb
     docs/en/Tutorials/**/<Name>.md               -> WolframPhysics/Documentation/English/Tutorials/<Name>.nb
     docs/en/ReferencePages/Symbols/**/<Name>.md  -> WolframPhysics/Documentation/English/ReferencePages/Symbols/<Name>.nb
     docs/ResourceDefinition.md                   -> WolframPhysics/ResourceDefinition.nb
   The source walk is recursive and the output is FLAT by basename however the sources are
   nested (ReferencePages/Symbols/<Category>/<Name>.md is the intended layout once the paclet
   has symbols): the documentation system resolves guide/tutorial/ref URIs in a flat namespace,
   and the sidebar hierarchy comes from the guide-to-guide link graph, not the directories.
   The built notebooks are BUILD ARTIFACTS and are not in git (see .gitignore); the markdown
   is the source of truth. They ship in the paclet, so every publish runs this script first.

   Usage (prefer the wrapper, which finds wolframscript + inits the submodule):
     ./build_docs.sh                      # generate + evaluate into Documentation/English/
     ./build_docs.sh structure            # input-only cells into docs/en/.generated/ (never the shipping tree)
     ./build_docs.sh only=WolframPhysics  # only the sources whose basename matches the regex
   Or directly:
     wolframscript -file scripts/build_notebooks.wls [structure] [only=<regex>]

   Knobs:
     WP_MTN_SOURCE   an explicit MarkdownToNotebook.wl (or the directory holding one), tried
                     before the submodule checkout; one that does not exist is reported

   Example cells are evaluated during conversion against the paclet in WolframPhysics/
   (loaded below), so the notebooks carry the current paclet's rendered output. Tutorials
   (Template TechNote, or anything under docs/en/Tutorials) convert with
   "EvaluateSeparator" -> None so their examples thread state across sections; every
   other page keeps the converter's default reset-at-section semantics (see
   docs/notes/doc-example-state.md). A stale-notebook sweep deletes any notebook under
   the three output roots that no current source maps to, so a renamed page leaves no
   orphan. The build is incremental: a page is rebuilt only when its markdown, the
   converter, this script or the build mode changed, or its notebook is missing. The
   paclet's Kernel is NOT part of the key: a page whose examples evaluate paclet code is not
   rebuilt when that code changes, so after a Kernel change delete the manifest
   (.doc_manifest.wl beside the notebooks) or the notebook to force the page. scripts/docbuild.wls
   indexes the notebooks from English/.

   Exit status: 0 when every notebook wrote and verified (the .build_ok sentinel is written
   beside the notebooks, for build_docs.sh; a source tree with no page at all writes the
   sentinel too and builds nothing), 1 on a bad frontmatter Name or Template, a duplicate
   target, a stale notebook that would not delete, a notebook that did not write, a paclet
   that did not load, or no converter at all. *)

(* Args are optional and order-independent:
     structure     skip inline evaluation (input-only cells); the notebooks go to docs/en/.generated
                   (gitignored), so an input-only notebook can never land where the paclet ships
                   it, where a publish would pack and deploy a page showing no output
     only=<regex>  build only the sources whose file basename matches <regex>; the Name check and
                   the stale sweep still cover every source, and unbuilt pages keep their notebooks *)
prefixArgQ[p_][a_] := StringMatchQ[ToString[a], p ~~ "=" ~~ ___];
stripPrefix[p_, a_] := StringDrop[a, StringLength[p] + 1];
scriptArgs    = Rest[$ScriptCommandLine];
structureMode = MemberQ[scriptArgs, "structure"];
onlyArg       = SelectFirst[scriptArgs, prefixArgQ["only"], None];
onlyPattern   = If[onlyArg === None, None, stripPrefix["only", onlyArg]];

scriptPath = ExpandFileName[$InputFileName];
repo       = FileNameDrop[scriptPath, -2];
pacletDir  = FileNameJoin[{repo, "WolframPhysics"}];
pacletContext = "WolframInstitute`WolframPhysics`";

(* THE CONVERTER: MarkdownToNotebook from the checkout in tools/MarkdownToNotebook when it is
   there, else the deployed resource function. They are the same code: the deployed resource is
   that file inlined into its definition, and the submodule pointer follows the deployed commit,
   so a notebook built either way is the same notebook. The checkout is tried first because it
   converts while the Wolfram Cloud is down; the cloud path stands for a checkout that is not
   there (a clone without the submodule). WP_MTN_SOURCE names an explicit MarkdownToNotebook.wl,
   and one that does not exist is a typo, not a preference: it is reported before the search
   moves on. *)
mtnURL   = "https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/MarkdownToNotebook";
mtnEnvSource = With[{e = Environment["WP_MTN_SOURCE"]},
  If[StringQ[e] && e =!= "", If[DirectoryQ[e], FileNameJoin[{e, "MarkdownToNotebook.wl"}], e], None]];
If[StringQ[mtnEnvSource] && ! FileExistsQ[mtnEnvSource],
  Print["warning: WP_MTN_SOURCE does not exist: ", mtnEnvSource, " (falling back to the submodule checkout)"]];
mtnLocal = SelectFirst[
  Flatten @ {
    If[StringQ[mtnEnvSource], {mtnEnvSource}, {}],
    FileNameJoin[{repo, "tools", "MarkdownToNotebook", "MarkdownToNotebook.wl"}]},
  FileExistsQ, None];
If[StringQ[mtnLocal],
  (* A plain Get into this script's own context, the way the converter's own build script loads
     it: reading it into an isolated context costs symbol pages their paclet: cross-links, since
     link resolution reads $ContextPath as it stands while the file is read. *)
  Get[mtnLocal];
  mtn = MarkdownToNotebook;
  mtnSource = "checkout " <> mtnLocal; mtnStamp = FileHash[mtnLocal, "SHA256"],
  (* The cloud path, judged by the head of the result and never by messages: a fresh kernel's
     resource system issues CloudConnect::nocred and URLParse::invuri from a login the public
     resource does not need, and still returns the function. ResourceObject[url] rather than a
     bare ResourceFunction[url]: the bare form fails to resolve on a fresh kernel. *)
  mtn = TimeConstrained[Quiet[ResourceFunction[ResourceObject[mtnURL]], {CloudConnect::nocred, URLParse::invuri}], 900, $Failed];
  If[Head[mtn] =!= ResourceFunction,
    Print["error: no converter. tools/MarkdownToNotebook has no MarkdownToNotebook.wl (run: git submodule update --init tools/MarkdownToNotebook)"];
    Print["       and the deployed resource function at ", mtnURL, " did not resolve."]; Exit[1]];
  mtnSource = "deployed " <> mtnURL; mtnStamp = Hash[mtn["Version"]]];
Print["converter: ", mtnSource];

(* THE LATEX PARSER. The converter renders $...$ math through Wolfram`Parser`LaTeXMathParse and,
   without it, through ImportString[..., "TeX"], which decodes every UTF-8 byte of a literal math
   character as its own Latin-1 character, so a page written with a literal blackboard letter
   would ship as mojibake. Install the paclet once when the repository serves it, say what
   happened, and never fail the build over it: the pages that carry math are the ones that need
   it, and the converter says so per page (its ::noparser message) when it is absent. *)
parser = Quiet @ Check[PacletInstall["Wolfram/Parser", UpdatePacletSites -> True], $Failed];
Print["LaTeX parser: ", If[parser === $Failed, "not installed (the Paclet Repository did not serve Wolfram/Parser; math would fall back to ImportString)", "Wolfram/Parser " <> ToString[Quiet @ Check[parser["Version"], "?"]]]];
(* The converter uses the front end when one is there and falls back to a kernel-only path that
   yields the same notebooks when there is none (wolframscript without a front end); the warning
   about the fallback is noise, not a defect in the build. *)
Off[FrontEndObject::notavail];

srcDir  = FileNameJoin[{repo, "docs", "en"}];
(* A full build writes the notebooks straight into the standard paclet layout under
   Documentation/English. A structure build writes them under docs/en/.generated (gitignored, the
   directory): the shipping tree holds evaluated notebooks only, and an input-only notebook there
   is indistinguishable from a built one to everything downstream, which would pack and deploy
   it as a page whose examples show no output. *)
shippingRoot  = FileNameJoin[{pacletDir, "Documentation", "English"}];
generatedRoot = FileNameJoin[{repo, "docs", "en", ".generated"}];
docRoot = If[structureMode, generatedRoot, shippingRoot];

(* Load the paclet being built so MarkdownToNotebook's per-page Needs of the frontmatter
   Context resolves to THIS checkout and the example cells render the current paclet's output,
   not an installed release's. *)
PacletDirectoryUnload[pacletDir];
PacletDirectoryLoad[pacletDir];
(* and load the context into THIS kernel too. A [Name]() link resolves to the paclet's ref page
   only when Names[pacletContext <> name] answers in the converting kernel, and the converter's
   per-page Needs runs inside the conversion without leaving the context behind (the paclet's
   Names are empty again afterwards). Without this line every mention of a paclet symbol converts
   to dead text. A paclet that does not load is fatal: the notebooks would build, silently
   without a single link to the paclet's own pages. *)
pacletLoaded = Quiet[Check[Needs[pacletContext]; True, False]];
If[! pacletLoaded || ! MemberQ[$Packages, pacletContext],
  Print["error: the paclet at ", pacletDir, " did not load (Needs[\"", pacletContext, "\"] failed);"];
  Print["       fix WolframPhysics/PacletInfo.wl or WolframPhysics/Kernel/ before building the notebooks."]; Exit[1]];

(* `structure` generates INPUT-ONLY notebooks: the cells are laid out but examples are NOT
   evaluated during conversion, so it makes no per-example resource-system/cloud calls. Use it to
   see a page's cell layout on a machine that cannot evaluate inline. Its notebooks are scratch
   output under docs/en/.generated (docRoot above): the shipped notebook of a page comes from a
   full build. This is the converter's own "Evaluate" -> False option. *)
convertOpts = If[structureMode, {"Evaluate" -> False}, {}];

subdirFor[tmpl_] := Switch[tmpl,
  "Symbol",   {"ReferencePages", "Symbols"},
  "Guide",    {"Guides"},
  "TechNote", {"Tutorials"},
  _,          None];
outputRoots = {{"Guides"}, {"Tutorials"}, {"ReferencePages", "Symbols"}};

relSource[f_] := FileNameDrop[f, FileNameDepth[srcDir]];

(* Sources, minus anything under a dot-directory of docs/en. docs/en/.generated is a structure
   build's own output tree and sits inside the source tree; FileNames descends into it, and
   because the output is flat by basename a stray .md under there would build straight into the
   shipping tree and then read as an orphan to the deploy guard, or collide with a real page's
   basename and fail the build below. The guard in scripts/deploy_common.wls walks docs/en the
   same way and skips the same directories; the two walks must agree, or each reports the
   other's sources as defects. *)
files = Select[Sort[FileNames["*.md", srcDir, Infinity]],
  Function[f, ! AnyTrue[FileNameSplit[relSource[f]], StringStartsQ[#, "."] &]]];
(* No page is a complete build of nothing, and build_docs.sh judges the run by the sentinel, so
   the sentinel is written before the empty run exits 0. *)
If[files === {},
  Print["no source docs in ", srcDir];
  If[! DirectoryQ[docRoot], CreateDirectory[docRoot, CreateIntermediateDirectories -> True]];
  Export[FileNameJoin[{docRoot, ".build_ok"}], "ok", "Text"];
  Exit[0]];

(* Read every source's frontmatter through the converter's own parser (the "Association" spec).
   "Evaluate" -> False matters: without it the spec converts the page in full, running every
   example just to read its metadata. *)
pageInfo[f_] := Module[{meta, tmpl, name, subdir, srcSubdir, tutorialQ},
  meta      = mtn[f, "Association", "Evaluate" -> False]["Metadata"];
  tmpl      = Lookup[meta, "Template", None];
  name      = Lookup[meta, "Name", None];
  subdir    = subdirFor[tmpl];
  srcSubdir = FileNameSplit[DirectoryName[relSource[f]]];
  (* Tutorials thread state across sections (a narrative, not independent reference cells):
     a page is one by Template, or by living under docs/en/Tutorials. *)
  tutorialQ = tmpl === "TechNote" || MemberQ[srcSubdir, "Tutorials"];
  <|"File" -> f, "Template" -> tmpl, "Name" -> name, "Subdir" -> subdir, "SourceSubdir" -> srcSubdir,
    "TutorialQ" -> tutorialQ,
    "Rel" -> If[subdir === None || ! StringQ[name], None, FileNameJoin[Join[subdir, {name <> ".nb"}]]]|>];
pages = pageInfo /@ files;

(* The notebook is named after the frontmatter Name, and the documentation system resolves
   guide/<Name>, tutorial/<Name> and ref/<Name> against that file name, so Name must equal the
   source's basename. A mismatch is a page whose links would dangle: fail before building anything.
   Two sources with one basename under different category directories map to one notebook and
   fail the same way. *)
badName = Select[pages, #["Name"] =!= FileBaseName[#["File"]] &];
badTmpl = Select[pages, #["Subdir"] === None &];
dupRel  = Select[Tally[DeleteCases[pages[[All, "Rel"]], None]], Last[#] > 1 &][[All, 1]];
Scan[Print["ERROR: frontmatter Name must equal the file basename (the notebook and its URI are named after it)",
           "\n  file:     ", #["File"], "\n  Name:     ", ToString[#["Name"]],
           "\n  basename: ", FileBaseName[#["File"]]] &, badName];
Scan[Print["ERROR: unknown Template ", ToString[#["Template"]], " in ", #["File"],
           " (expected Symbol, Guide or TechNote)"] &, badTmpl];
Scan[Print["ERROR: more than one source maps to ", #] &, dupRel];
If[badName =!= {} || badTmpl =!= {} || dupRel =!= {}, Exit[1]];
(* The Template decides the output directory; a source filed under a different top-level
   directory of docs/en still builds, but say so, because scripts/run_doc_examples.wls reads the
   tutorial semantics off the path. Deeper nesting under the right directory is the layout, not
   a mismatch. *)
prefixQ[path_List, prefix_List] := Length[path] >= Length[prefix] && Take[path, Length[prefix]] === prefix;
Scan[Function[p,
  If[! prefixQ[p["SourceSubdir"], p["Subdir"]],
    Print["warning: ", relSource[p["File"]], " has Template ", p["Template"], " but lives under ",
          FileNameJoin[p["SourceSubdir"]], "; the Template decides, so its notebook goes to ",
          FileNameJoin[p["Subdir"]]]]], pages];

(* Stale-notebook sweep: any notebook under the three output roots at docRoot that no current
   source maps to is an orphan (a renamed or deleted page) and would ship in the paclet. Delete it. *)
expectedRel = pages[[All, "Rel"]];
existingNbs = Join @@ (FileNames["*.nb", #, Infinity] & /@
  Select[FileNameJoin[Prepend[#, docRoot]] & /@ outputRoots, DirectoryQ]);
stale = Select[existingNbs, ! MemberQ[expectedRel, FileNameDrop[#, FileNameDepth[docRoot]]] &];
sweepFailed = {};
Do[
  Print["removed stale notebook ", FileNameDrop[nb, FileNameDepth[docRoot]], " (no source under docs/en maps to it)"];
  Quiet[DeleteFile[nb]];
  If[FileExistsQ[nb], AppendTo[sweepFailed, nb]],
  {nb, stale}];
If[sweepFailed =!= {},
  Print["ERROR: could not delete ", Length[sweepFailed], " stale notebook(s):"];
  Scan[Print["  ", #] &, sweepFailed];
  Exit[1]];

(* Incremental build. The manifest maps each notebook's relative path to the build key that
   produced the copy currently at docRoot. A doc is rebuilt only when its key changed (markdown
   content, structure/full mode, tutorial semantics, converter or this script) or its notebook is
   missing; an unchanged doc is skipped, so its already-built notebook is left untouched. *)
scriptStamp  = Hash[{FileHash[scriptPath, "SHA256"], mtnStamp}];
buildKey[p_] := Hash[{FileHash[p["File"], "SHA256"], structureMode, p["TutorialQ"], scriptStamp}];
manifestName = ".doc_manifest.wl";
oldManifest  = With[{p = FileNameJoin[{docRoot, manifestName}]},
  If[FileExistsQ[p], Replace[Quiet@Get[p], Except[_?AssociationQ] -> <||>], <||>]];
newManifest  = <||>;

failed = {}; nBuilt = 0; nCached = 0; nFiltered = 0;
Do[
  Module[{f = p["File"], tmpl = p["Template"], rel = p["Rel"], target, key, opts},
    target = FileNameJoin[{docRoot, rel}];
    key    = buildKey[p];
    opts   = Join[convertOpts, If[p["TutorialQ"], {"EvaluateSeparator" -> None}, {}]];
    Which[
      onlyPattern =!= None && ! StringContainsQ[FileBaseName[f], RegularExpression[onlyPattern]],
        (* Outside the only= filter: not built, notebook left as is, manifest entry carried over. *)
        nFiltered++;
        If[KeyExistsQ[oldManifest, rel], newManifest[rel] = oldManifest[rel]],
      Lookup[oldManifest, rel, None] === key && FileExistsQ[target],
        (* Unchanged and already built: skip. *)
        Print["cached ", tmpl, " -> ", rel];
        nCached++;
        newManifest[rel] = key,
      True,
        (* Rebuild. *)
        If[! DirectoryQ[DirectoryName[target]],
          CreateDirectory[DirectoryName[target], CreateIntermediateDirectories -> True]];
        (* Delete any prior copy so a post-write FileExistsQ is a true success signal. *)
        If[FileExistsQ[target], DeleteFile[target]];
        mtn[f, target, Sequence @@ opts];
        (* MarkdownToNotebook's Export can fail (e.g. Export::noopen) without aborting, which would
           otherwise leave a missing/stale notebook while we falsely report success. Verify. *)
        If[TrueQ[FileExistsQ[target]] && FileByteCount[target] > 0,
          Print["built ", tmpl, " -> ", rel, If[p["TutorialQ"], "  (EvaluateSeparator -> None)", ""]];
          nBuilt++;
          newManifest[rel] = key,
          Print["FAILED ", tmpl, " -> ", rel, "  (Export did not write the notebook)"];
          AppendTo[failed, rel]]]],
  {p, pages}];

(* The paclet's resource definition (docs/ResourceDefinition.md, Template Paclet) is the Paclet
   Repository's deployable definition of the whole paclet: its metadata, the landing-page prose
   and, when the source carries them, an Examples section and the hero image (this one carries
   neither). It is not a documentation page (no URI, nothing the
   documentation index resolves), so it lives beside docs/en rather than in it and builds to the
   paclet root, WolframPhysics/ResourceDefinition.nb, which is build output like the notebooks
   under Documentation/English and, like them, is not in git. It ships in the deployed resource:
   scripts/docbuild.wls copies it into the built copy and scripts/publish.wls scrapes it there.
   A structure build writes it under docs/en/.generated with the other input-only notebooks. It
   joins the incremental manifest under its own name and honours only=. *)
resDefSrc = FileNameJoin[{repo, "docs", "ResourceDefinition.md"}];
resDefRel = "ResourceDefinition.nb";
resDefOut = FileNameJoin[{If[structureMode, generatedRoot, pacletDir], resDefRel}];

(* The Paclet template inherits the generic resource template's Examples surface: an
   "ExampleNotebook" template group carrying the ExampleInitialization cells (the
   PacletDirectoryLoad and Needs the examples run under), and after it one Subsection cell per
   standard example section, heading-only where the page had nothing for it. A page's own example
   cells land as siblings of that group, under their section's heading, and the scrape reads them
   with it: the resource scraped from this definition carries the Input and Output cells of every
   section that has content, so nothing here has to move them into the group.

   Two things are dropped. A heading with nothing under it, because the definition notebook check
   reads it as an orphaned cell (an Error that blocks the scrape); bareness is positional, so a
   heading is dropped only when the next sibling is another example heading, the next section, or
   the end of the notebook, and a heading a demonstration follows keeps its cells. And the
   ExampleNotebook group itself when the definition carries no examples at all: with no raw
   material the deploy-time Examples wrapper has nothing to show. A definition that does carry
   examples keeps the group, since the group's tag is what the scrape collects them under, and the
   initialization cells with it. *)
templateGroupQ[name_String][Cell[CellGroupData[{header_, ___}, _], ___]] :=
  ! FreeQ[header, "TemplateGroupName" -> name];
templateGroupQ[_String][_] := False;
exampleHeadingTitles = {"Basic Examples", "Scope", "Generalizations & Extensions",
  "Generalizations and Extensions", "Options", "Applications", "Properties & Relations",
  "Properties and Relations", "Possible Issues", "Neat Examples", "Requirements"};
exampleHeadingQ[Cell[title_String, "Subsection", ___]] := MemberQ[exampleHeadingTitles, title];
exampleHeadingQ[___] := False;
sectionGroupQ[Cell[CellGroupData[{Cell[_, "Section", ___], ___}, _], ___]] := True;
sectionGroupQ[___] := False;
dropBareHeadings[cells_List] := With[{n = Length[cells]},
  Table[
    If[exampleHeadingQ[cells[[i]]] &&
        (i === n || exampleHeadingQ[cells[[i + 1]]] || sectionGroupQ[cells[[i + 1]]]),
      Nothing,
      cells[[i]]],
    {i, n}]];
(* Replace works children first, so nested groups are cleaned before their parents; only the
   siblings after a group's header are filtered, never the header itself. The converter leaves the
   example headings at the notebook's top level, beside the section groups, so the notebook's own
   cell list is filtered the same way. *)
dropBareExampleHeadings[notebook_] := Replace[
  Replace[notebook,
    Cell[CellGroupData[{header_, rest___}, state_], opts___] :>
      Cell[CellGroupData[Prepend[dropBareHeadings[{rest}], header], state], opts],
    {0, Infinity}],
  Notebook[cells_List, opts___] :> Notebook[dropBareHeadings[cells], opts]];
(* Empty means no Input or Output cell of the group's own: the ExampleInitialization group is
   always there and is not content, so it is set aside before the test. *)
emptyExampleGroupQ[group_] := FreeQ[
  DeleteCases[group, _?(templateGroupQ["ExampleInitialization"]), {0, Infinity}],
  Cell[_, "Input" | "Output", ___]];
normalizePacletNotebook[out_] := Module[{notebook = dropBareExampleHeadings[Get[out]], groups, examplesQ},
  groups = Cases[notebook, _?(templateGroupQ["ExampleNotebook"]), {0, Infinity}];
  examplesQ = ! FreeQ[notebook, _?exampleHeadingQ] || ! AllTrue[groups, emptyExampleGroupQ];
  If[groups =!= {},
    Print["  ExampleNotebook: ",
      If[examplesQ,
        "kept, the definition carries examples",
        "empty, dropped with its unused headings"]]];
  If[! examplesQ,
    notebook = DeleteCases[notebook, _?(templateGroupQ["ExampleNotebook"]), {0, Infinity}]];
  Put[notebook, out]];

resDefStatus = Which[
  ! FileExistsQ[resDefSrc],
    "no source",
  onlyPattern =!= None && ! StringContainsQ[FileBaseName[resDefSrc], RegularExpression[onlyPattern]],
    If[KeyExistsQ[oldManifest, resDefRel], newManifest[resDefRel] = oldManifest[resDefRel]];
    "outside only=",
  True,
    Module[{key = Hash[{FileHash[resDefSrc, "SHA256"], structureMode, scriptStamp}]},
      If[Lookup[oldManifest, resDefRel, None] === key && FileExistsQ[resDefOut],
        newManifest[resDefRel] = key;
        "cached",
        If[! DirectoryQ[DirectoryName[resDefOut]],
          CreateDirectory[DirectoryName[resDefOut], CreateIntermediateDirectories -> True]];
        If[FileExistsQ[resDefOut], DeleteFile[resDefOut]];
        mtn[resDefSrc, resDefOut, Sequence @@ convertOpts];
        If[TrueQ[FileExistsQ[resDefOut]] && FileByteCount[resDefOut] > 0,
          normalizePacletNotebook[resDefOut];
          newManifest[resDefRel] = key;
          "built",
          AppendTo[failed, resDefRel];
          "FAILED"]]]];
Print[resDefStatus, " Paclet -> ", resDefRel, " (", resDefOut, ")"];

If[failed =!= {},
  Print[""];
  Print["ERROR: ", Length[failed], " notebook(s) failed to write:"];
  Scan[Print["  ", #] &, failed];
  Exit[1]];

(* Persist the manifest next to the notebooks. It records the key for every doc this run
   (rebuilt, cached and filtered alike), so the next run sees an accurate baseline; a swept
   notebook's entry is gone with it. *)
(* Beside the per-notebook keys, record the stamp this run's keys were computed with. The
   deploy guard (wpRequireBuiltDocs in scripts/deploy_common.wls) has to know which converter
   and which build script produced these notebooks, and it cannot re-derive that: a machine
   without tools/MarkdownToNotebook has no converter to hash, and a run that converted through
   the deployed resource function stamped itself with a version number no offline check can
   read. Reading the stamp back is exact where re-deriving it is a guess, so the guard compares
   the markdown against the keys the build actually wrote. "$BuildStamp" is not a notebook path
   relative to docRoot, so it collides with no rel and this run's own
   Lookup[oldManifest, rel, None] never sees it. *)
newManifest["$BuildStamp"] = <|"ScriptStamp" -> scriptStamp, "StructureMode" -> structureMode|>;
If[! DirectoryQ[docRoot], CreateDirectory[docRoot, CreateIntermediateDirectories -> True]];
Put[newManifest, FileNameJoin[{docRoot, manifestName}]];

(* Success sentinel. build_docs.sh judges the build on THIS file, not on wolframscript's process
   exit code: the benign exit-time "The product exited because of a license error" message can
   make an otherwise-clean run return non-zero, which would fail the wrapper (set -e) after a
   build that wrote every notebook. Reaching here means every notebook wrote and verified. *)
Export[FileNameJoin[{docRoot, ".build_ok"}], "ok", "Text"];
Print["DONE ", Length[files], " docs (", nBuilt, " built, ", nCached, " cached",
  If[onlyPattern =!= None, ", " <> ToString[nFiltered] <> " outside only=" <> onlyPattern, ""],
  If[stale =!= {}, ", " <> ToString[Length[stale]] <> " stale removed", ""], ") in ", docRoot];
