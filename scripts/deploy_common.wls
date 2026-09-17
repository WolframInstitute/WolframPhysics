#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Shared Wolfram Cloud deploy machinery for WolframInstitute/WolframPhysics, ported from
   HypergraphRewritingEngine's scripts/deploy_common.wls (the same helpers carry an hg prefix
   there, and a pm prefix in PureMath's). Get this file, then drive a deploy with

     wpOffscreenFrontEnd[]                          give a headless Linux front end the offscreen
                                                    Qt platform (docbuild, publish, build_site local)
     wpRequireBuiltDocs[repo, label]                the built documentation notebooks, which are
                                                    NOT tracked in git, are present and current with
                                                    the markdown under docs/en; True when they are,
                                                    else the pages are named and False is returned
                                                    (docbuild, publish, build_paclet)
     wpCloudConnect[repo, label]                    credentials from the environment or .env, the
                                                    connection, and the account printed; True when
                                                    the kernel is connected afterwards
     wpInstallDeployPatches[pacletName, symbols]    every generic deploy fix, plus the
                                                    pacletDeclaredSymbols pin for the symbols the
                                                    deployed paclet declares
     wpFillCategories[defNb, categories]            fill the definition notebook's Categories
                                                    grid from the resource system's own list
     wpInjectHero[image]                            inject the shingle hero image; None deploys
                                                    the resource without one
     wpScrapeAndDeploy[defNb, pacletName, dryRun]   headless scrape, then the public CloudDeploy;
                                                    with dryRun True it stops after the scrape and
                                                    reports what would be deployed where

   Getting this file loads nothing: the resource stack (PacletResource`, PacletTools`,
   DefinitionNotebookClient`) is loaded inside the functions that patch or drive it, so a script
   that only needs the offscreen helper or the build guard and never deploys (scripts/build_site.wls,
   scripts/docbuild.wls, scripts/build_paclet.wls) can Get it without pulling the deploy stack into
   its kernel.

   Every fix is documented at its definition, with what breaks without it; each was root-caused
   against PacletResource's Deploy.m / Notebooks.m / Utilities.m and DefinitionNotebookClient.

   Knobs: WP_UPLOAD_DELTA=0 re-uploads every documentation file, WP_SKIP_PERMS=1 skips the
   permissions pass, WP_SCRAPE_TOLERANT=1 lets the scrape through Error-level definition-notebook
   findings (CloudDeploy still validates the resource), WP_SCRAPE_TIMEOUT=<seconds> bounds the
   scrape and deploy (default 3600; see wpScrapeAndDeploy); WOLFRAM_CLOUD_USER and
   WOLFRAM_CLOUD_PASSWORD are read by wpCloudConnect. *)

(* ====================================================================== *)
(* wpOffscreenFrontEnd: a headless Linux front end (a CI box, a pod) has  *)
(* no display to open and aborts at launch, so the front end fails to      *)
(* start and DocumentationBuild builds nothing, the scrape cannot open the *)
(* definition notebook and the local render writes no page; the offscreen *)
(* Qt platform gives it one to draw into. Set only where neither the       *)
(* platform nor a display is configured, so a desktop session keeps its    *)
(* own. Every script that drives the front end calls this first.           *)
(* ====================================================================== *)
wpOffscreenFrontEnd[] := If[
	$OperatingSystem === "Unix" && ! StringQ[Environment["QT_QPA_PLATFORM"]] && ! StringQ[Environment["DISPLAY"]],
	SetEnvironment["QT_QPA_PLATFORM" -> "offscreen"]
]

(* ====================================================================== *)
(* wpRequireBuiltDocs: the guard the two scripts that turn the built       *)
(* documentation into something shipped run first. The notebooks under     *)
(* WolframPhysics/Documentation and WolframPhysics/ResourceDefinition.nb   *)
(* are BUILD OUTPUT and are not tracked in git, so a checkout can hold     *)
(* markdown no build has converted yet, or notebooks older than the        *)
(* markdown, and scripts/docbuild.wls and scripts/build_paclet.wls would   *)
(* otherwise build and pack them without noticing.                          *)
(*                                                                         *)
(* For every source under docs/en, and for docs/ResourceDefinition.md,     *)
(* the notebook scripts/build_notebooks.wls writes for it must exist AND   *)
(* the incremental-build manifest beside the notebooks                      *)
(* (Documentation/English/.doc_manifest.wl, an Association of notebook     *)
(* path relative to English/ -> build key, which that script Puts) must    *)
(* record the CURRENT build key for it. The key is not invented here: it   *)
(* is recomputed exactly as scripts/build_notebooks.wls computes it,       *)
(*   page:       Hash[{FileHash[src, "SHA256"], structureMode, tutorialQ, scriptStamp}] *)
(*   definition: Hash[{FileHash[src, "SHA256"], structureMode, scriptStamp}]            *)
(* with structureMode False (the shipping tree takes full builds only; a   *)
(* structure build writes under docs/en/.generated with its own manifest)  *)
(* and tutorialQ True for Template TechNote or a source under Tutorials.   *)
(*                                                                         *)
(* scriptStamp is the one part of the key this side cannot compute: it is  *)
(* Hash[{FileHash[build_notebooks.wls, "SHA256"], converter}], and the     *)
(* converter half is whatever the BUILD used, which may be a               *)
(* MarkdownToNotebook.wl this machine does not have or the deployed        *)
(* resource function, whose stamp is a version number no offline check can *)
(* read. So it is not computed here at all: the build records it in the    *)
(* manifest under "$BuildStamp" and this reads it back. Two older shapes   *)
(* still work. A manifest written before the build recorded its stamp has  *)
(* none, and the stamp is re-derived from this checkout's converter        *)
(* (WP_MTN_SOURCE, else the tools/MarkdownToNotebook submodule), which is  *)
(* right whenever that is the converter the build used and reports every   *)
(* page stale when it is not. A manifest with no stamp on a machine with   *)
(* no converter cannot be judged at all, and that FAILS: the case exists   *)
(* to be rebuilt, not waved through. Where the recorded stamp and this     *)
(* checkout's differ, one line says the notebooks were built elsewhere and *)
(* the recorded stamp stands, because what the guard is for is markdown    *)
(* edited after the build, not a converter that moved under it.            *)
(*                                                                         *)
(* Three other ways a page can be wrong are checked beside the key. A      *)
(* notebook under the output roots that no source maps to is an ORPHAN:    *)
(* the build sweeps those, so one here is output nothing regenerates and   *)
(* it would ship. WolframPhysics/ResourceDefinition.nb left behind by a    *)
(* deleted docs/ResourceDefinition.md is the same thing and nothing sweeps *)
(* it, so it is named on its own line. And a notebook built from a source  *)
(* with wl examples that carries no evaluated cell is INPUT-ONLY: a        *)
(* structure build's notebook copied into the shipping tree, or a          *)
(* truncated one, which would ship as a page whose examples show no        *)
(* output.                                                                 *)
(*                                                                         *)
(* Returns True when every page is built and current. Otherwise prints one *)
(* line per page, with what to run, and returns False; the caller exits    *)
(* non-zero.                                                               *)
(* ====================================================================== *)
$wpDocManifestName = ".doc_manifest.wl"

(* The `Key: value` lines of a source's leading --- block, as raw strings. Only the frontmatter is
   read (the Template and the Name), so the converter is not loaded to answer a path question.

   This is a second parser for something MarkdownToNotebook already parses, so it is deliberately
   the more tolerant of the two: every place it is stricter than the converter is a page the build
   converts happily and this reports as broken, with a message telling the author the build refuses
   something it does not. Hence the leading-whitespace normalization, the spaces allowed after each
   fence and around the key's colon, and the unquoting of a quoted value. *)
wpDocFrontmatter[file_String] := Module[{text, body},
	text = Quiet @ Check[Import[file, "Text"], $Failed];
	If[! StringQ[text], Return[<||>, Module]];
	text = StringReplace[StringDelete[text, StartOfString ~~ "\:feff"], "\r\n" -> "\n"];
	text = StringDelete[text, StartOfString ~~ WhitespaceCharacter ..];
	body = Replace[
		StringCases[text,
			StartOfString ~~ "---" ~~ (" " | "\t") ... ~~ "\n" ~~ Shortest[b___] ~~
				"\n---" ~~ (" " | "\t") ... ~~ ("\n" | EndOfString) :> b, 1],
		{{found_String} :> found, _ -> $Failed}];
	If[! StringQ[body], Return[<||>, Module]];
	Association @ Cases[
		StringSplit[body, "\n"],
		line_String /; StringMatchQ[line, RegularExpression["[A-Za-z][A-Za-z0-9]*[ \t]*:.*"]] :>
			With[{kv = PadRight[StringSplit[line, ":", 2], 2, ""]},
				StringTrim[First[kv]] -> StringReplace[StringTrim[Last[kv]], {
					StartOfString ~~ "\"" ~~ Shortest[inner___] ~~ "\"" ~~ EndOfString :> inner,
					StartOfString ~~ "'" ~~ Shortest[inner___] ~~ "'" ~~ EndOfString :> inner}]]]
]

(* The converter half of the build key, or None when no MarkdownToNotebook.wl is on this machine
   (the build would then use the deployed resource function, whose stamp needs the cloud). The
   search order is scripts/build_notebooks.wls's own: WP_MTN_SOURCE, then the submodule. *)
wpDocConverterStamp[repo_String] := Module[{env, local},
	env = With[{e = Environment["WP_MTN_SOURCE"]},
		If[StringQ[e] && e =!= "",
			If[DirectoryQ[e], FileNameJoin[{e, "MarkdownToNotebook.wl"}], e],
			None]];
	local = SelectFirst[
		Flatten[{
			If[StringQ[env], {env}, {}],
			FileNameJoin[{repo, "tools", "MarkdownToNotebook", "MarkdownToNotebook.wl"}]}],
		FileExistsQ, None];
	If[StringQ[local], FileHash[local, "SHA256"], None]
]

(* A built page shows what its examples evaluate to; an input-only notebook does not. A structure
   build (./build_docs.sh structure) lays the cells out without evaluating anything and writes a
   valid notebook at the right path, and a copy of one in the shipping tree, or a notebook
   truncated mid-write, is indistinguishable from a built one by existence alone: it would pack
   and deploy as a page whose examples are blank. Two tests, both over text: the source has a
   fence the converter evaluates (wl, wolfram or mathematica, unless the info string turns
   evaluation off), and the notebook has no cell style only an evaluation produces. Inside a
   notebook string a quote is escaped, so an unescaped "Output" is a style token and never prose.
   A source with nothing to evaluate is never input-only. *)
$wpDocWLFence = RegularExpression[
	"(?im)^```[ \\t]*(wl|wolfram|mathematica)\\b(?![^\\n]*eval[ \\t]*[=:][ \\t]*false)"];
$wpDocEvaluatedCell = RegularExpression["(?<!\\\\)\"(Output|Print|Message)\""];

wpDocInputOnlyQ[src_String, nb_String] := Module[{srcText, nbText},
	srcText = Quiet @ Check[Import[src, "Text"], $Failed];
	If[! StringQ[srcText] || ! StringContainsQ[srcText, $wpDocWLFence], Return[False, Module]];
	nbText = Quiet @ Check[Import[nb, "Text"], $Failed];
	StringQ[nbText] && ! StringContainsQ[nbText, $wpDocEvaluatedCell]
]

wpRequireBuiltDocs[repo_String, label_String] := Module[
	{srcDir, resDefSrc, englishRoot, buildScript, manifestFile, manifest, converterStamp,
	 scriptStamp, recordedStamp, staleWhy, subdirFor, sources, expected, missing, stale,
	 unmappable, inputOnly, orphans, resDefOrphan, roots, existing, pages},
	srcDir       = FileNameJoin[{repo, "docs", "en"}];
	resDefSrc    = FileNameJoin[{repo, "docs", "ResourceDefinition.md"}];
	englishRoot  = FileNameJoin[{repo, "WolframPhysics", "Documentation", "English"}];
	buildScript  = FileNameJoin[{repo, "scripts", "build_notebooks.wls"}];
	manifestFile = FileNameJoin[{englishRoot, $wpDocManifestName}];

	If[! DirectoryQ[srcDir] && ! FileExistsQ[resDefSrc],
		Print[label, "no documentation sources under ", srcDir, "; nothing to check"];
		Return[True, Module]];

	(* No manifest at all is the fresh clone: nothing has been built here yet. Say that, rather
	   than reporting every page as missing. *)
	If[! FileExistsQ[manifestFile],
		Print[label, "the documentation notebooks have not been built here: no build manifest at ", manifestFile];
		Print[label, "  WolframPhysics/Documentation and WolframPhysics/ResourceDefinition.nb are build output"];
		Print[label, "  and are not tracked in git. Run ./build_docs.sh to build them from docs/en."];
		Return[False, Module]];
	manifest = Replace[Quiet @ Get[manifestFile], Except[_?AssociationQ] -> None];
	If[manifest === None,
		Print[label, manifestFile, " is not a build manifest (an Association of notebook -> build key);"];
		Print[label, "  delete it and run ./build_docs.sh to rebuild the notebooks."];
		Return[False, Module]];

	(* The stamp the build's keys were computed with. Read it from the manifest, where the build
	   records it, rather than re-deriving it: re-deriving asks this machine which converter the
	   BUILD used, and it does not know. Getting that wrong is wrong in both directions, and both
	   were live before the build recorded it: a machine with no converter could judge nothing and
	   passed every page, so a source edited and never rebuilt shipped; and a machine whose
	   converter merely differs from the build's recomputed a different key for every page and
	   failed a tree that was perfectly current. *)
	converterStamp = wpDocConverterStamp[repo];
	recordedStamp = Lookup[
		Replace[Lookup[manifest, "$BuildStamp", <||>], Except[_?AssociationQ] -> <||>],
		"ScriptStamp", None];
	scriptStamp = If[converterStamp === None || ! FileExistsQ[buildScript],
		None,
		Hash[{FileHash[buildScript, "SHA256"], converterStamp}]];
	Which[
		recordedStamp =!= None,
			(* The recorded stamp is what the keys beside it were computed with, so it is what
			   they are checked against; a converter that has moved since is worth a line, but it
			   is not a reason to fail markdown nobody has touched. *)
			If[scriptStamp =!= None && scriptStamp =!= recordedStamp,
				Print[label, "the notebooks were built with a different converter or scripts/build_notebooks.wls than"];
				Print[label, "  this checkout has, so they are checked against docs/en as that build saw it."];
				Print[label, "  Rerun ./build_docs.sh to rebuild them here."]];
			scriptStamp = recordedStamp,
		scriptStamp === None,
			(* An old manifest, on a machine that cannot recompute the stamp either. Nothing here
			   can tell a current page from a stale one, and passing what cannot be judged is how
			   a stale page ships. *)
			Print[label, "the manifest records no build stamp and no MarkdownToNotebook.wl is on this machine, so the"];
			Print[label, "  notebooks cannot be checked against docs/en. Run ./build_docs.sh, or restore the converter"];
			Print[label, "  with: git submodule update --init tools/MarkdownToNotebook"];
			Return[False, Module]];
	(* A manifest that records no stamp is checked against this checkout's converter, which is
	   right when it is the one the build used and reports every page stale when it is not. *)
	staleWhy = If[recordedStamp =!= None,
		"the markdown has changed since it was built",
		"the markdown, the converter or scripts/build_notebooks.wls has changed since it was built"];

	subdirFor[tmpl_] := Switch[tmpl,
		"Symbol",   {"ReferencePages", "Symbols"},
		"Guide",    {"Guides"},
		"TechNote", {"Tutorials"},
		_,          None];

	(* Every markdown under docs/en, minus the dot-directories (a structure build writes into
	   one, and nothing under them is a source). *)
	sources = If[DirectoryQ[srcDir],
		Select[Sort[FileNames["*.md", srcDir, Infinity]],
			Function[f,
				! AnyTrue[FileNameSplit[FileNameDrop[f, FileNameDepth[srcDir]]], StringStartsQ[#, "."] &]]],
		{}];

	expected = {}; missing = {}; stale = {}; unmappable = {}; inputOnly = {}; resDefOrphan = False;
	Do[
		Module[{meta, tmpl, name, subdir, srcSubdir, rel, nb, key, recorded, shown},
			meta      = wpDocFrontmatter[f];
			tmpl      = Lookup[meta, "Template", None];
			name      = Lookup[meta, "Name", None];
			subdir    = subdirFor[tmpl];
			srcSubdir = FileNameSplit[DirectoryName[FileNameDrop[f, FileNameDepth[srcDir]]]];
			shown     = FileNameDrop[f, FileNameDepth[repo]];
			Which[
				subdir === None,
					AppendTo[unmappable, {shown, "Template " <> ToString[tmpl] <>
						" is not Symbol, Guide or TechNote, so the build writes no notebook for it"}],
				name =!= FileBaseName[f],
					AppendTo[unmappable, {shown, "frontmatter Name " <> ToString[name] <>
						" is not the basename " <> FileBaseName[f] <> ", which the build refuses"}],
				True,
					(* The output is flat by basename however the sources are nested, exactly as
					   scripts/build_notebooks.wls writes it. *)
					rel = FileNameJoin[Append[subdir, name <> ".nb"]];
					nb  = FileNameJoin[{englishRoot, rel}];
					key = Hash[{FileHash[f, "SHA256"], False,
						tmpl === "TechNote" || MemberQ[srcSubdir, "Tutorials"], scriptStamp}];
					recorded = Lookup[manifest, rel, None];
					AppendTo[expected, rel];
					Which[
						! FileExistsQ[nb],
							AppendTo[missing, {"WolframPhysics/Documentation/English/" <> rel, shown}],
						recorded === None,
							AppendTo[stale, {"WolframPhysics/Documentation/English/" <> rel, shown,
								"the manifest has no entry for it, so no build wrote this copy"}],
						recorded =!= key,
							AppendTo[stale, {"WolframPhysics/Documentation/English/" <> rel, shown, staleWhy}],
						wpDocInputOnlyQ[f, nb],
							AppendTo[inputOnly, "WolframPhysics/Documentation/English/" <> rel]]]],
		{f, sources}];

	(* The paclet's resource definition: one fixed pair outside docs/en, keyed in the same
	   manifest under its own name and built to the paclet root. *)
	If[FileExistsQ[resDefSrc],
		Module[{rel = "ResourceDefinition.nb", nb, key, recorded, shown = "docs/ResourceDefinition.md"},
			nb  = FileNameJoin[{repo, "WolframPhysics", rel}];
			key = Hash[{FileHash[resDefSrc, "SHA256"], False, scriptStamp}];
			recorded = Lookup[manifest, rel, None];
			Which[
				! FileExistsQ[nb],
					AppendTo[missing, {"WolframPhysics/" <> rel, shown}],
				recorded === None,
					AppendTo[stale, {"WolframPhysics/" <> rel, shown, "the manifest has no entry for it, so no build wrote this copy"}],
				recorded =!= key,
					AppendTo[stale, {"WolframPhysics/" <> rel, shown, staleWhy}],
				wpDocInputOnlyQ[resDefSrc, nb],
					AppendTo[inputOnly, "WolframPhysics/" <> rel]]],
		(* And the other direction for it. The orphan sweep below covers the three roots under
		   Documentation/English, and the build's own sweep covers the same three, so neither
		   reaches this one: a notebook left behind by a deleted docs/ResourceDefinition.md would
		   be packed by build_paclet.wls and scraped by publish.wls indefinitely, with nothing left
		   in the repository saying what it was built from. *)
		resDefOrphan = FileExistsQ[FileNameJoin[{repo, "WolframPhysics", "ResourceDefinition.nb"}]]];

	(* The reverse direction: a notebook under the output roots that no source maps to. The build's
	   own sweep deletes those, so one here is output nothing regenerates, and it would ship. *)
	roots    = {{"Guides"}, {"Tutorials"}, {"ReferencePages", "Symbols"}};
	existing = Join @@ (FileNames["*.nb", #, Infinity] & /@
		Select[FileNameJoin[Prepend[#, englishRoot]] & /@ roots, DirectoryQ]);
	orphans  = Select[FileNameDrop[#, FileNameDepth[englishRoot]] & /@ existing, ! MemberQ[expected, #] &];

	pages = Length[expected] + Boole[FileExistsQ[resDefSrc]];
	If[missing === {} && stale === {} && unmappable === {} && inputOnly === {} && orphans === {} &&
		! TrueQ[resDefOrphan],
		Print[label, pages, " documentation page(s) built and current (", manifestFile, ")"];
		Return[True, Module]];

	Print[label, "the built documentation does not match the markdown under docs/en:"];
	Scan[Print[label, "  MISSING     ", First[#], "  (built from ", Last[#], ")"] &, missing];
	Scan[Print[label, "  STALE       ", First[#], "  (from ", #[[2]], ": ", Last[#], ")"] &, stale];
	Scan[Print[label, "  UNMAPPABLE  ", First[#], "  (", Last[#], ")"] &, unmappable];
	Scan[Print[label, "  INPUT-ONLY  ", #,
		"  (built by ./build_docs.sh structure, or truncated; rebuild with ./build_docs.sh)"] &, inputOnly];
	Scan[Print[label, "  ORPHAN      WolframPhysics/Documentation/English/", #,
		"  (no source under docs/en maps to it)"] &, orphans];
	(* Its own line: the Scan above prints the Documentation/English/ prefix, and this one lives at
	   the paclet root. *)
	If[TrueQ[resDefOrphan],
		Print[label, "  ORPHAN      WolframPhysics/ResourceDefinition.nb",
			"  (docs/ResourceDefinition.md is gone; delete the notebook)"]];
	If[Length[stale] === pages && pages > 1 && recordedStamp === None,
		(* Every page at once, out of a manifest that records no build stamp, is the signature of a
		   converter or build script that differs from the one the build used: both are part of
		   every page's key. A manifest a current build wrote records its stamp, and the keys are
		   then checked against that, so this cannot be the reason there. *)
		Print[label, "every page is stale and the manifest records no build stamp, so what changed is the converter"];
		Print[label, "or scripts/build_notebooks.wls, not the markdown: the next ./build_docs.sh rebuilds the whole"];
		Print[label, "tree and records the stamp it built with."]];
	Print[label, "run ./build_docs.sh to rebuild the notebooks from docs/en; they are build output and are"];
	Print[label, "not tracked in git, so a checkout holds only what the last build on this machine wrote."];
	False
]

(* ====================================================================== *)
(* wpCloudConnect: the one connection path of the deploying scripts.      *)
(* Credentials come from WOLFRAM_CLOUD_USER / WOLFRAM_CLOUD_PASSWORD in    *)
(* the environment, else from the gitignored .env at the repository root   *)
(* (only those two keys are read from it; the pod and license secrets in   *)
(* it stay where they are). A line is KEY=VALUE as the shell reads it      *)
(* (set -a; . ./.env): an optional leading export, and a value that may be *)
(* wrapped in single or double quotes, which are stripped. The configured  *)
(* account decides where everything lands (<account>/DeployedResources/... *)
(* and <account>/<site>), so given credentials win over whatever login the *)
(* kernel already holds: a cached personal login would otherwise publish   *)
(* under the wrong account. Without credentials the kernel's own           *)
(* connection, if any, is used, and nothing interactive is attempted: a    *)
(* bare CloudConnect[] in a headless kernel waits on a dialog nobody can   *)
(* answer. The account is printed as soon as it is known, before any       *)
(* write. Returns True when the kernel is connected afterwards; the caller *)
(* decides what a missing connection means (a dry run may go on).          *)
(* ====================================================================== *)
wpUnquote[value_String] := If[
	StringLength[value] >= 2 && MemberQ[{"\"", "'"}, StringTake[value, 1]] && StringTake[value, 1] === StringTake[value, -1],
	StringTake[value, {2, -2}],
	value
]
wpLoadDotEnv[file_String] := If[FileExistsQ[file],
	Scan[
		Function[line,
			With[{kv = StringTrim /@ StringSplit[StringDelete[StringTrim[line], StartOfString ~~ "export" ~~ Whitespace], "=", 2]},
				If[Length[kv] === 2 && MemberQ[{"WOLFRAM_CLOUD_USER", "WOLFRAM_CLOUD_PASSWORD"}, First[kv]] &&
						! StringQ[Environment[First[kv]]] && wpUnquote[Last[kv]] =!= "",
					SetEnvironment[First[kv] -> wpUnquote[Last[kv]]]
				]
			]
		],
		Select[StringSplit[Import[file, "Text"], "\n"], ! StringStartsQ[StringTrim[#], "#"] &]
	]
]
wpCloudConnect[repo_String, label_String] := Module[{user, pass},
	(* A kernel whose preferences deny Internet use cannot connect at all (CloudConnect::offline);
	   the caller exists to talk to the cloud, so the permission is granted for this session only. *)
	If[! TrueQ[$AllowInternet],
		Print[label, "$AllowInternet was False; enabling Internet use for this session"];
		$AllowInternet = True
	];
	wpLoadDotEnv[FileNameJoin[{repo, ".env"}]];
	user = Environment["WOLFRAM_CLOUD_USER"];
	pass = Environment["WOLFRAM_CLOUD_PASSWORD"];
	Which[
		StringQ[user] && StringQ[pass] && ! (TrueQ[$CloudConnected] && $WolframID === user),
			If[TrueQ[$CloudConnected],
				Print[label, "the kernel is connected as ", $WolframID, "; connecting as the configured account instead"]];
			Quiet @ CloudConnect[user, pass, "RememberMe" -> False],
		! StringQ[user] || ! StringQ[pass],
			Print[label, "WOLFRAM_CLOUD_USER / WOLFRAM_CLOUD_PASSWORD not set (environment or .env)",
				If[TrueQ[$CloudConnected], "; using the kernel's own connection", ""]]
	];
	If[TrueQ[$CloudConnected],
		Print[label, "connected as ", $WolframID, " (", First[$CloudRootDirectory], ")"]];
	TrueQ[$CloudConnected]
]

(* Cloud-side record of what the documentation target already holds (rel -> hash of the processed
   file), private to the deploying account; only changed or missing files upload. Deleting it, or
   WP_UPLOAD_DELTA=0, forces a full re-upload: the recovery for any cloud-side drift. *)
$wpDeployManifestName = "WolframPhysicsDeployManifest.wl"

(* The bound on the scrape and deploy, in seconds. A headless scrape or deploy that hangs (a front
   end waiting on a dialog nobody can answer, a cloud call that never returns) would otherwise hold
   the process, and on a CI pod the bill, indefinitely; the bound turns a hang into a failed run
   ($TimedOut, which publish.wls reports). A slow cloud can legitimately need more, so it is a knob
   rather than a constant. *)
$wpScrapeTimeout = With[{value = Environment["WP_SCRAPE_TIMEOUT"]},
	If[StringQ[value] && StringMatchQ[StringTrim[value], DigitCharacter ..] && FromDigits[StringTrim[value]] > 0,
		FromDigits[StringTrim[value]],
		3600]]

(* ====================================================================== *)
(* wpMergeDeployDocs: no-purge in-place documentation merge.               *)
(* The stock "DocumentationNotebooks" deploy CopyDirectory's into a target  *)
(* it first DeleteObject's, 404ing every page for the whole redeploy. This  *)
(* copies each processed file in place (overwrite, no purge) and returns    *)
(* those CloudObjects, one per file and no others, as the resource's        *)
(* "DocumentationNotebooks": returning recursiveCloudObjects instead would  *)
(* also pull in stale .html, which createSidebarHTML maps .html -> .html,   *)
(* doubling every page in the navigation rail.                              *)
(* ====================================================================== *)
wpMergeDeployDocs[root_, dir_, opts : OptionsPattern[CloudObject]] :=
	Module[{target, files, tasks, manifest, hashes, toUpload},
		target = FileNameJoin[{root, "Documentation"}];
		files = Select[FileNames["*", dir, Infinity], ! DirectoryQ[#] &];
		(* each file's destination CloudObject, with the embedded options PacletResource adds *)
		tasks = Map[
			Function[file,
				Module[{parts = Drop[FileNameSplit[file], Length[FileNameSplit[dir]]], object},
					object = FileNameJoin[Join[{target}, parts]];
					<|
						"File" -> file,
						"Target" -> PacletResource`Private`addEmbeddedOptions[object],
						"Object" -> object,
						"Rel" -> FileNameJoin[parts]
					|>
				]
			],
			files
		];
		manifest = If[Environment["WP_UPLOAD_DELTA"] === "0",
			<||>,
			Replace[Quiet @ Check[CloudGet[CloudObject[$wpDeployManifestName]], <||>], Except[_Association] -> <||>]
		];
		hashes = Association @ Map[#["Rel"] -> FileHash[#["File"], "SHA256", "Base64Encoding"] &, tasks];
		toUpload = Select[tasks, Lookup[manifest, #["Rel"]] =!= hashes[#["Rel"]] &];
		Print["deploy: merging ", Length[files], " documentation files into ", First[target],
			" (", Length[toUpload], " changed, ", Length[files] - Length[toUpload], " already up to date; no purge)"];
		Scan[CopyFile[#["File"], #["Target"], OverwriteTarget -> True] &, toUpload];
		If[Environment["WP_UPLOAD_DELTA"] =!= "0",
			Quiet @ Check[
				(
					CloudPut[hashes, CloudObject[$wpDeployManifestName]];
					SetOptions[CloudObject[$wpDeployManifestName], Permissions -> "Private"]
				),
				Print["deploy: WARNING - manifest save failed; the next run re-uploads everything"]
			]
		];
		(* The permissions pass always runs: skipping it when nothing uploaded would assume the
		   previous pass had succeeded, and a failed enumeration returns {} silently, so the tree
		   could stay private forever with every run declaring itself unchanged. *)
		If[Environment["WP_SKIP_PERMS"] === "1",
			Print["deploy: permissions pass skipped (WP_SKIP_PERMS=1)"],
			PacletResource`Private`setCODirectoryPermissions[CloudObject[target], OptionValue[CloudObject, {opts}, Permissions]]
		];
		Print["deploy: documentation merge complete (", Length[files], " files, ", Length[toUpload], " uploaded)"];
		(* the resource needs the CloudObject of every file, uploaded or already present *)
		Map[#["Object"] &, tasks]
	]

(* ====================================================================== *)
(* wpNarrateDeploy: setDNCProgress is reached at every step of the         *)
(* PacletResource deploy (including per-page "Creating documentation page:  *)
(* X" in the embed loop) but only sets an invisible notebook-UI variable;   *)
(* routing it to Print as well makes the whole post-merge phase log itself. *)
(* Without it a headless deploy is silent for its whole duration.           *)
(* ====================================================================== *)
wpNarrateDeploy[] := (
	Quiet @ Needs["PacletResource`"];
	If[DownValues[PacletResource`Private`setDNCProgress] =!= {},
		Unprotect[PacletResource`Private`setDNCProgress];
		PacletResource`Private`setDNCProgress[expr_] := (
			Print["deploy: ", expr];
			DefinitionNotebookClient`$StripeProgressDisplay = expr
		);
		Print["deploy: vendor progress events routed to the log"],
		Print["deploy: WARNING - setDNCProgress not found; vendor steps stay silent"]
	]
)

(* ====================================================================== *)
(* wpInstallDeployPatches: every generic deploy fix, plus the               *)
(* pacletDeclaredSymbols pin (the PacletSymbol click-to-copy list).         *)
(* ====================================================================== *)
wpInstallDeployPatches[pacletName_String, symbols : {___String}] := (

	Needs["PacletResource`"];
	(* The scrape/deploy path uses PacletTools`PacletExtensionFiles to enumerate the documentation
	   files, but under a headless Needs sequence PacletTools is not autoloaded, so the expression
	   stays symbolic and cascades into Values::invrl / FileNameSplit::fstr / Complement::heads (and
	   a downstream StringTake::take on the resulting empty string), and the resource carries no
	   documentation. Loading it explicitly is the fix. *)
	Needs["PacletTools`"];

	(* DocumentationBuild's RewriteHyperlinkString does StringTake[c, -1] on a possibly empty
	   hyperlink segment: a Module-local with no global symbol to patch, some of it front-end-side
	   out of reach of a scoped Quiet, so the message is switched off for the whole run. The
	   errored result is discarded and the output is correct; without the Off the log fills with
	   one StringTake::take per empty segment. *)
	Off[StringTake::take];

	(* No-purge: strip the redundant Quiet[DeleteObject[...]] from the three deploy functions (each
	   is immediately followed by an OverwriteTarget copy) and replace the "DocumentationNotebooks"
	   rule with the in-place merge above. With the stock rules every page 404s for the whole
	   redeploy. *)
	If[DownValues[PacletResource`Private`cloudExportPacletResourceContent] =!= {} &&
			DownValues[PacletResource`Private`cloudDeployPacletWebFile] =!= {},
		With[{noPurge = HoldPattern[Quiet[DeleteObject[_], ___]] :> Null},
			Quiet @ Unprotect[
				PacletResource`Private`cloudExportPacletResourceContent,
				PacletResource`Private`cloudDeployPacletWebFile,
				PacletResource`Private`cloudDeployNB
			];
			DownValues[PacletResource`Private`cloudExportPacletResourceContent] =
				DownValues[PacletResource`Private`cloudExportPacletResourceContent] /. noPurge;
			DownValues[PacletResource`Private`cloudDeployPacletWebFile] =
				DownValues[PacletResource`Private`cloudDeployPacletWebFile] /. noPurge;
			DownValues[PacletResource`Private`cloudDeployNB] =
				DownValues[PacletResource`Private`cloudDeployNB] /. noPurge;
			PrependTo[
				DownValues[PacletResource`Private`cloudDeployPacletWebFile],
				HoldPattern[PacletResource`Private`cloudDeployPacletWebFile[
						as_, root_, "DocumentationNotebooks", dir_?DirectoryQ, opts : OptionsPattern[CloudObject]
				]] :> wpMergeDeployDocs[root, dir, opts]
			]
		];
		Print["deploy: no-purge deploy installed (resource + page deletes stripped, docs merged)"],
		Print["deploy: WARNING - deploy internals not found; stock purging deploy in effect"]
	];

	(* prefetchURL does a throwaway URLRead warm-up that prints URLRead::invhttp on a slow fetch
	   and adds nothing to the deploy; keep its URL return, drop the warm-up. *)
	If[DownValues[PacletResource`Private`prefetchURL] =!= {},
		Quiet @ Unprotect[PacletResource`Private`prefetchURL];
		PacletResource`Private`prefetchURL[url_] := URLBuild @ URLParse @ url;
		Print["deploy: prefetchURL cache warm-up disabled"],
		Print["deploy: WARNING - prefetchURL not found; cache warm-up URLRead in effect"]
	];

	(* DeployedResourceShingle's processshingleData uses htmlFragmentExport, undefined anywhere in
	   the system, which breaks a string-valued Details section (the shingle build fails on it).
	   The detail is already an HTML fragment, so define it as the identity (after loading the
	   shingle stack so it lands right). *)
	ResourceSystemClient`Private`loadDeployResourceShingle[];
	If[DownValues[DeployedResourceShingle`Private`htmlFragmentExport] === {} &&
			OwnValues[DeployedResourceShingle`Private`htmlFragmentExport] === {},
		DeployedResourceShingle`Private`htmlFragmentExport[s_String] := s;
		Print["deploy: defined missing htmlFragmentExport (identity for HTML fragments)"]
	];

	(* Pin pacletDeclaredSymbols: the build copy's PacletInfo declares "Symbols", but at deploy time
	   pacletDeclaredSymbols re-resolves the paclet by name through fullPacletObjectInfo, which on a
	   machine with an older copy registered can resolve to one whose PacletInfo predates the
	   declaration, leaving documented code unwrapped (a bare symbol that fails in a fresh kernel
	   when pasted). Answer with the symbols being deployed regardless of which copy wins. *)
	If[symbols =!= {} && DownValues[PacletResource`Private`pacletDeclaredSymbols] =!= {},
		Quiet @ Unprotect[PacletResource`Private`pacletDeclaredSymbols];
		PrependTo[DownValues[PacletResource`Private`pacletDeclaredSymbols],
			HoldPattern[PacletResource`Private`pacletDeclaredSymbols[pacletName]] :> symbols];
		PrependTo[DownValues[PacletResource`Private`pacletDeclaredSymbols],
			HoldPattern[PacletResource`Private`pacletDeclaredSymbols[KeyValuePattern["Name" -> pacletName]]] :> symbols];
		Print["deploy: pinned pacletDeclaredSymbols to ", Length[symbols], " ", pacletName, " symbols"],
		Print["deploy: WARNING - no symbols to pin; PacletSymbol click-to-copy may be empty"]
	];
)

(* ====================================================================== *)
(* wpInjectHero: the headless Interactive -> False scrape does not capture *)
(* the definition notebook's HeroImage cell, so deployExtraPacletWebFiles   *)
(* is augmented to add an image expression (a file path instead falls       *)
(* through to Missing[] and no hero is deployed). None, for a definition    *)
(* notebook with no Hero Image section, installs nothing: the resource      *)
(* system deploys without a hero (deployExtraPacletWebFiles DeleteMissing's *)
(* the absent key, the shingle's hero frame is guarded by StringQ@#HeroImage *)
(* and the definition check validates the section only where one exists).  *)
(* ====================================================================== *)
wpInjectHero[heroImage_] :=
	Which[
		ImageQ[heroImage] || MatchQ[heroImage, _Graphics | _Graphics3D],
			Quiet @ Unprotect[PacletResource`Private`deployExtraPacletWebFiles];
			PrependTo[
				DownValues[PacletResource`Private`deployExtraPacletWebFiles],
				HoldPattern[PacletResource`Private`deployExtraPacletWebFiles[
						id_,
						as_?(AssociationQ[#] && KeyExistsQ[#, "PacletFile"] && ! KeyExistsQ[#, "HeroImage"] &),
						root_, opts___]] :>
					PacletResource`Private`deployExtraPacletWebFiles[id, Append[as, "HeroImage" -> heroImage], root, opts]
			];
			Print["deploy: hero-image injection installed"],
		heroImage === None,
			Print["deploy: no hero image; the resource is deployed without one and the shingle shows none"],
		True,
			Print["deploy: WARNING - the hero image is not an Image or Graphics; the shingle gets none"]
	]

(* ====================================================================== *)
(* wpFillCategories: the Paclet template's Categories grid is a             *)
(* CheckboxesCell whose item list DefinitionNotebookClient fetches from the *)
(* resource system through the cloud connection. A build machine without    *)
(* one gets CheckboxesCell::autofail and an empty grid, which this repairs: *)
(* the cell is regenerated here, connected, and saved into the definition   *)
(* notebook the scrape reads. A machine that does hold a login already      *)
(* converts a populated grid, and this rewrites it with the same content.   *)
(* Without a connection the notebook is left as it is and the shingle shows *)
(* no categories (a submission hint, not an error). Each requested name has *)
(* to come back checked, as CheckboxBox[name, {_, name}]; a name the        *)
(* resource system does not know is silently dropped from the grid, so any  *)
(* that did not come back checked is named here.                            *)
(* ====================================================================== *)
wpFillCategories[defNb_String, categories : {___String}] := Module[{cell, checked, missing, notebook, gridCell, filled},
	Needs["DefinitionNotebookClient`"];
	Which[
		categories === {},
			Print["deploy: no categories declared; the Categories grid stays as built"],
		! TrueQ[$CloudConnected],
			Print["deploy: WARNING - not connected, so the Categories grid cannot be filled (it needs the resource system's item list)"],
		True,
			cell = Quiet @ DefinitionNotebookClient`CheckboxesCell[<|
				"ResourceType" -> "Paclet", "Property" -> "Categories", "Checked" -> categories
			|>];
			If[MatchQ[cell, _Cell] && FreeQ[cell, GridBox[{{}}, ___]],
				checked = Cases[cell, (CheckboxBox | Checkbox)[Except[False], {_, name_String}] :> name, Infinity];
				missing = Complement[categories, checked];
				notebook = Get[defNb];
				gridCell = Cell[___, CellTags -> tags_List /; MemberQ[tags, "Categories-Checkboxes"], ___];
				filled = notebook /. gridCell :> cell;
				(* the regenerated cell carries the same tags, so a second run finds the grid it
				   filled and leaves it alone *)
				Which[
					FreeQ[notebook, gridCell],
						Print["deploy: WARNING - no Categories grid found in ", defNb],
					filled === notebook,
						Print["deploy: Categories grid already holds ", checked],
					True,
						Put[filled, defNb];
						Print["deploy: Categories grid filled with ", checked]
				];
				If[missing =!= {},
					Print["deploy: WARNING - the resource system does not offer the category(s) ", missing,
						"; they are unchecked in the grid. Use a name from its own list."]
				],
				Print["deploy: WARNING - the resource system returned no category items; the Categories grid stays as built"]
			]
	]
]

(* A failed scrape reports only "Scraping the resource ... failed", which says nothing about which
   check blocked it (the strict gate fails on one Error-level finding as readily as on twenty).
   Name them, and point at the tolerant knob. A successful scrape passes straight through. *)
wpReportScrapeBlockers[nbo_][res_] := (
	If[! MatchQ[res, _ResourceObject],
		Print["deploy: the scrape was blocked; definition-notebook findings:"];
		Scan[
			Print["  [", Lookup[#, "Level", "?"], "] ", Lookup[#, "Tag", "?"],
				With[{params = Lookup[#, "Parameters", <||>]},
					If[params === <||> || params === {}, "", "  " <> ToString[Short[params, 3]]]]] &,
			Replace[Quiet @ Check[Normal @ DefinitionNotebookClient`CheckDefinitionNotebook[nbo], {}],
				Except[_List] -> {}]
		];
		Print["  (only Error-level findings block; WP_SCRAPE_TOLERANT=1 deploys anyway)"]
	];
	res
)

(* What a real run would do, from the scraped resource: its identity and the location it would
   replace. The location is the cloud's own computation (defaultCloudObjectLocation, under the
   connected account's root) and needs a connection; without one the shape is printed with the
   account left open. *)
wpDryRunReport[res_ResourceObject, pacletName_String, nbo_] := Module[{target, findings},
	Print["dry run: the scrape succeeded; nothing was deployed"];
	(* the check's non-blocking findings, which a blocked scrape would have listed above *)
	findings = Replace[Quiet @ Check[Normal @ DefinitionNotebookClient`CheckDefinitionNotebook[nbo], {}], Except[_List] -> {}];
	If[findings =!= {},
		Print["dry run: definition-notebook findings (none blocks; a Warning or Suggestion is for the author to weigh):"];
		Scan[Print["  [", Lookup[#, "Level", "?"], "] ", Lookup[#, "Tag", "?"]] &, findings]];
	Print["dry run: resource ", Quiet @ Check[res["Name"], pacletName], " of type ", Quiet @ Check[res["ResourceType"], "Paclet"]];
	Print["dry run: description: ", Quiet @ Check[res["Description"], Missing["NotAvailable"]]];
	Print["dry run: properties: ", Quiet @ Check[res["Properties"], Missing["NotAvailable"]]];
	Print["dry run: hero image: ", If[MatchQ[Quiet @ Check[res["HeroImage"], Missing["NotAvailable"]], _?ImageQ | _Graphics | _Graphics3D], "present", "none (the shingle shows no hero)"]];
	target = If[TrueQ[$CloudConnected],
		Replace[
			Quiet @ Check[DeployedResourceShingle`Private`defaultCloudObjectLocation["Paclet", pacletName], $Failed],
			Except[_CloudObject] -> $Failed],
		$Failed
	];
	Print["dry run: would CloudDeploy with Permissions -> \"Public\" to ",
		If[MatchQ[target, CloudObject[_String, ___]],
			First[target],
			"<cloud base>/obj/<account>/DeployedResources/Paclet/" <> pacletName <> " (not connected, so the account is unknown here)"
		]
	];
	Print["dry run: the deploy replaces whatever resource is live at that location"];
]

(* ====================================================================== *)
(* wpScrapeAndDeploy: the headless equivalent of "Deploy -> Publicly in    *)
(* the cloud": open the definition notebook in place, warm up paclet        *)
(* resolution, scrape with Interactive -> False, and CloudDeploy to the     *)
(* location the button computes (<account>/DeployedResources/Paclet/        *)
(* <Publisher>/<Name>, slash kept) with Permissions -> "Public". A dry run   *)
(* stops after the scrape and returns the ResourceObject. Returns the        *)
(* deploy result otherwise, or $TimedOut past WP_SCRAPE_TIMEOUT seconds.    *)
(* ====================================================================== *)
wpScrapeAndDeploy[defNb_String, pacletName_String, dryRun : (True | False) : False] := Module[{res},
	Needs["PacletResource`"];
	Needs["PacletTools`"];   (* see wpInstallDeployPatches: never autoloaded headlessly *)
	Needs["DefinitionNotebookClient`"];
	Needs["PacletResource`DefinitionNotebook`"];
	(* ScrapeResource runs CodeInspector over the paclet's .wl source as an incidental lint, which
	   is irrelevant to publishing (the kernel files are covered by the tests), and on a
	   daily-build image its bundled CodeParser can assert and, through "FailureCondition" ->
	   "Error", kill the scrape. Force the scrape's per-file gate to False so no source file is
	   handed to CodeInspector; the scrape's other checks are untouched. *)
	Quiet[
		Unprotect[DefinitionNotebookClient`Inspectors`PackagePrivate`codeInspectFileQ];
		DownValues[DefinitionNotebookClient`Inspectors`PackagePrivate`codeInspectFileQ] =
			{HoldPattern[DefinitionNotebookClient`Inspectors`PackagePrivate`codeInspectFileQ[_]] :> False}
	];
	wpNarrateDeploy[];
	Print["deploy: the scrape", If[dryRun, "", " and deploy"], " must finish within ", $wpScrapeTimeout, " s (WP_SCRAPE_TIMEOUT)"];
	res = UsingFrontEnd @ TimeConstrained[
		Enclose @ Module[{nbo},
			nbo = ConfirmMatch[
				NotebookOpen[defNb, Visible -> False],
				_NotebookObject,
				"Opening the definition notebook failed."
			];
			(* The scrape refreshes the notebook's "Paclet files" cells from the paclet directory
			   (ensureCurrentManifest, as the deploy button does) and reads them back keyed by
			   CellID. MarkdownToNotebook writes the definition notebook without the CreateCellID
			   option (it stamps its own deterministic IDs on the cells it builds), so the front
			   end gives every file cell it adds CellID 0, scrapeFileManagerData's
			   AssociationThread[ids -> files] collapses them into one entry, no file matches
			   PacletInfo.wl and the scrape is blocked with NoPacletInfoFileCell. Turning the
			   option on for the opened notebook (in memory; the file is not saved) gives each
			   file cell its own ID. *)
			SetOptions[nbo, CreateCellID -> True];
			(* warm up paclet resolution: the definition notebook resolves its paclet relative to
			   its own directory, and a freshly opened notebook misses until PacletObject and
			   ScrapePacletDirectory have each run once *)
			PacletObject[pacletName];
			Quiet[PacletResource`DefinitionNotebook`ScrapePacletDirectory[nbo]];
			WithCleanup[
				Module[{scraped, location},
					scraped = ConfirmMatch[
						wpReportScrapeBlockers[nbo][
							DefinitionNotebookClient`ScrapeResource[
								"Paclet", nbo,
								Interactive -> False,
								"FailureCondition" -> If[Environment["WP_SCRAPE_TOLERANT"] === "1", None, "Error"]
							]
						],
						_ResourceObject,
						"Scraping the resource from the definition notebook failed."
					];
					If[dryRun,
						wpDryRunReport[scraped, pacletName, nbo];
						scraped,

						ResourceSystemClient`Private`loadDeployResourceShingle[];
						location = Replace[
							DeployedResourceShingle`Private`defaultCloudObjectLocation["Paclet", scraped["Name"]],
							Except[_CloudObject] :> CloudObject[]
						];
						Print["deploy: CloudDeploy with Permissions -> \"Public\" to ",
							If[MatchQ[location, CloudObject[_String, ___]],
								First[location],
								"a new anonymous cloud object (the resource system computed no location)"]];
						With[{deployed = CloudDeploy[scraped, location, Permissions -> "Public"]},
							ResourceRegister[scraped, "Cloud", "StoreContent" -> False];
							deployed
						]
					]
				],
				NotebookClose[nbo]
			]
		],
		$wpScrapeTimeout,
		$TimedOut
	];
	res
]
