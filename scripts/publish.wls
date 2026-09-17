#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Publish the paclet publicly to the Wolfram Cloud, as a Paclet resource carrying its
   documentation: the scripted equivalent of the "Deploy -> Publicly in the cloud" button in
   WolframPhysics/ResourceDefinition.nb. It opens the built definition notebook and runs,
   headlessly, what DefinitionNotebookClient`DeployResource[nb, "CloudPublic"] does: scrape the
   resource, then CloudDeploy it with Permissions -> "Public" to the location the button computes,
   <account>/DeployedResources/Paclet/WolframInstitute/WolframPhysics, which is what makes the
   shingle and the bundled documentation pages serve and resolve anonymously. The account is the
   one the kernel is connected as, read from $CloudRootDirectory at run time, and is printed with
   the target before anything is written. The cloud resolves the resource's own paclet:
   cross-links, so the links MarkdownToNotebook emits work without any per-link rewriting. The
   resource system's safeCloudName URL-encodes the name's own slash when it computes that location,
   and the CloudObject built from it normalizes the path back, so the target prints with the slash,
   the same spelling as the install URL the definition page carries.

   The deploy replaces whatever resource is live at that location. WP_PUBLISH_DRY_RUN=1 does
   everything up to and including the scrape, prints what would be deployed where, and deploys
   nothing; run it first.

   What is deployed is the built copy at build/WolframPhysics, the product of
   scripts/docbuild.wls (the paclet skeleton with the DocumentationBuild pages and the search
   index, and the definition notebook beside them). The scrape packs that copy into
   build/<Name>-<Version>.paclet on the way (gitignored, like all of build/). Build and deploy are
   separate scripts so each is independently runnable.

   Credentials: WOLFRAM_CLOUD_USER and WOLFRAM_CLOUD_PASSWORD, from the environment or from the
   gitignored .env at the repository root (only those two keys are read from it); a kernel that
   already holds a cloud login uses it (wpCloudConnect in scripts/deploy_common.wls).

   The deploy fixes and the scrape/deploy itself live in scripts/deploy_common.wls; this script
   wires in what is specific to this paclet: the built copy, the declared symbols, the categories
   and the hero image. The hero is the definition notebook's own Hero Image output when the
   markdown definition has that section; this one has none (the built notebook carries only the
   template's placeholder there), and the resource deploys without a hero: the scrape yields no
   HeroImage property and raises no finding for it, PacletResource's deployExtraPacletWebFiles
   drops the absent key, and the shingle template renders its hero frame only when a hero URL
   exists.

   Ported from HypergraphRewritingEngine's scripts/publish.wls.

   Prerequisites: the built copy (./build_docs.sh, then scripts/docbuild.wls: neither the authoring
   notebooks nor the built copy is tracked in git, so both are made on the machine that publishes),
   a Wolfram Cloud connection, and a Front End (on a Linux box without a display the script sets
   QT_QPA_PLATFORM=offscreen when neither it nor DISPLAY is set; wpOffscreenFrontEnd in
   scripts/deploy_common.wls). Both are checked before the connection, the authoring notebooks
   against docs/en and the built copy for its existence, so a checkout that has not been built, or
   one built before the last markdown edit, says so instead of failing on the connection or
   deploying a stale page. Prints the public resource-page URL.

   Usage: WP_PUBLISH_DRY_RUN=1 wolframscript -file scripts/publish.wls    (rehearsal)
          wolframscript -file scripts/publish.wls                         (the deploy)
   Knobs: WP_PUBLISH_DRY_RUN=1 stops after the scrape; WP_SCRAPE_TOLERANT=1, WP_SCRAPE_TIMEOUT,
          WP_UPLOAD_DELTA=0 and WP_SKIP_PERMS=1 are deploy_common.wls's (see its header).
   Exit status: 0 when the resource deployed (or, in a dry run, scraped); 1 otherwise, including a
   checkout with no built copy to deploy. *)

scriptPath = ExpandFileName[$InputFileName]
repo = FileNameDrop[scriptPath, -2]
buildPaclet = FileNameJoin[{repo, "build", "WolframPhysics"}]
defNb = FileNameJoin[{buildPaclet, "ResourceDefinition.nb"}]
pacletName = "WolframInstitute/WolframPhysics"
dryRun = Environment["WP_PUBLISH_DRY_RUN"] === "1"

If[dryRun, Print["publish: DRY RUN (WP_PUBLISH_DRY_RUN=1): nothing will be deployed"]]

(* the front-end availability warning is noise: the steps that need a front end run under
   UsingFrontEnd, and the ones that print it do not need one *)
Off[FrontEndObject::notavail]

(* The deploy machinery: the offscreen front end, the connection, the deploy fixes and the
   scrape/deploy itself, each explained where it is defined. Getting the file loads no package. *)
Get[FileNameJoin[{repo, "scripts", "deploy_common.wls"}]]

(* The scrape opens the definition notebook in a front end; on a headless Linux box that needs
   the offscreen Qt platform (see wpOffscreenFrontEnd). *)
wpOffscreenFrontEnd[]

(* The authoring notebooks build/WolframPhysics was made from must themselves be current with
   docs/en. docbuild.wls runs this same guard, but it wipes and rebuilds build/WolframPhysics only
   AFTER it passes, so a guard failure leaves the PREVIOUS build copy sitting there intact: edit
   markdown, run docbuild (which correctly refuses), then run this script on its own, and last
   week's pages go to the cloud. scripts/build_all.wls stops at the first failing phase and never
   gets here, but this script documents itself as runnable alone, so it checks for itself. It costs
   one manifest read and no connection. *)
If[! wpRequireBuiltDocs[repo, "publish: "], Exit[1]]

(* The built copy is docbuild.wls's product: the paclet skeleton, the definition notebook and the
   built documentation. It is checked BEFORE the connection: on a checkout where nothing has been
   built (build/ is gitignored, and the authoring notebooks it is made from are build output that is
   not tracked either) the honest failure is the missing build, not the credentials the connection
   would complain about first. *)
builtPages = FileNames["*.nb", FileNameJoin[{buildPaclet, "Documentation", "English"}], Infinity]
If[! (FileExistsQ[defNb] && builtPages =!= {}),
	Print["publish: nothing to deploy: no built copy under ", buildPaclet, "."];
	Print["publish: the deployed pages are built, not tracked. Run ./build_docs.sh (markdown under docs/en"];
	Print["publish: -> the authoring notebooks), then wolframscript -file scripts/docbuild.wls (-> this copy)."];
	Exit[1]
]
Print["publish: built copy ", buildPaclet, " with ", Length[builtPages], " documentation notebooks"]

(* The credentials, the connection and the account, then the target, before anything is written:
   the target is the account's own root from $CloudRootDirectory plus the path the deploy button
   computes, never a hardcoded account. *)
If[! wpCloudConnect[repo, "publish: "],
	If[dryRun,
		Print["publish: no cloud connection; the dry run continues without one (the exact target cannot be computed)"],
		Print["publish: Wolfram Cloud connection failed; set WOLFRAM_CLOUD_USER and WOLFRAM_CLOUD_PASSWORD."];
		Exit[1]
	],
	Print["publish: target ", StringTrim[First[$CloudRootDirectory], "/"], "/DeployedResources/Paclet/", pacletName,
		If[dryRun, " (dry run: not written)", ""]]
]

info = PacletObject[File[buildPaclet]]
If[! MatchQ[info, _PacletObject],
	Print["publish: ", buildPaclet, " does not read as a paclet"];
	Exit[1]
]
Print["publish: ", info["Name"], " ", info["Version"]]

(* Resolve the paclet from the build copy for the scrape; the declared symbols (filled in by
   docbuild.wls) are what the click-to-copy wraps. *)
PacletDirectoryLoad[buildPaclet]
declaredSymbols = Replace[
	FirstCase[info["Extensions"], {"Kernel", ___, "Symbols" -> s_List, ___} :> s, {}],
	Except[{___String}] -> {}
]
Print["publish: ", Length[declaredSymbols], " declared symbol(s)"]

(* The Paclet template's category checkboxes need the resource system's item list, which
   DefinitionNotebookClient fetches only through a cloud connection; the authoring build has none,
   so the built definition carries an empty Categories grid. Fill it here, connected, from the
   categories the markdown source declares, into the build copy the scrape reads. *)
categories = Replace[
	StringCases[Import[FileNameJoin[{repo, "docs", "ResourceDefinition.md"}], "Text"],
		StartOfLine ~~ "Categories:" ~~ Whitespace ... ~~ "[" ~~ Shortest[c__] ~~ "]" :>
			Select[StringTrim /@ StringSplit[c, ","], # =!= "" &]],
	{{cs_List} :> cs, _ -> {}}
]
wpFillCategories[defNb, categories]

wpInstallDeployPatches[pacletName, declaredSymbols]

(* The hero, when the definition notebook has a Hero Image section, is that section's output,
   rasterized here: the headless scrape does not capture the cell. It is taken from inside the
   template's HeroImage cell group rather than as the first graphics output in the file, so an
   example that rasterizes to a GraphicsBox earlier in the notebook is never mistaken for the hero.
   The cell is rasterized as a cell (the boxes render where the expression they stand for may not).
   A definition without the section, which this one is, deploys without a hero: no HeroImage key is
   scraped, PacletResource's deployExtraPacletWebFiles drops the absent key, and the shingle's hero
   frame is rendered only when a hero URL exists. *)
heroGroup = FirstCase[
	Get[defNb],
	group : Cell[CellGroupData[{header_, ___}, _], ___] /;
		! FreeQ[header, "TemplateGroupName" -> "HeroImage"] :> group,
	None,
	Infinity
]
heroBoxes = If[heroGroup === None,
	None,
	FirstCase[heroGroup, Cell[BoxData[b_GraphicsBox], "Output", ___] :> b, None, Infinity]
]
(* A definition whose markdown has no Hero Image section still carries the template's group, with
   the converter's unfilled placeholder input (tagged DefaultContent / MTNUnfilled) and no output:
   that is the no-hero state, not a hero that failed to evaluate. *)
heroPlaceholderOnly = heroGroup =!= None && heroBoxes === None &&
	AllTrue[Cases[heroGroup, Cell[_, "Input", ___], Infinity],
		! FreeQ[#, CellTags -> {___, "DefaultContent" | "MTNUnfilled", ___}] &]
heroImage = If[heroBoxes === None,
	None,
	UsingFrontEnd @ Quiet @ Check[
		Rasterize[Cell[BoxData[heroBoxes], "Output"], ImageResolution -> 144, Background -> White],
		$Failed
	]
]
(* The resource system's hero limits, as checkHeroImageProperties applies them: the side bounds are
   400 and 1500 px but the tests are conjunctive, so one side out of range is tolerated while the
   other is inside the far bound, and the aspect ratio h/w must lie between 0.5 and 1.25. Four tags
   report a violation, HeroImageTooSmall, HeroImageTooLarge, HeroImageSquashed (below the band) and
   HeroImageStretched (above it), and the shingle then shows no hero. This note is advisory; the
   check itself runs at the scrape. *)
wpHeroSizeNote[image_?ImageQ] := With[
	{w = First[ImageDimensions[image]], h = Last[ImageDimensions[image]]},
	Which[
		(w < 400 && h < 1500) || (h < 400 && w < 1500), " (HeroImageTooSmall)",
		(w > 1500 && h > 400) || (h > 1500 && w > 400), " (HeroImageTooLarge)",
		h < 0.5 w, " (HeroImageSquashed: the height is below half the width)",
		h > 1.25 w, " (HeroImageStretched: the height is above 1.25 times the width)",
		True, ""
	]
]
Which[
	heroGroup === None, Print["publish: no Hero Image section in ", defNb, "; the resource is deployed without a hero"],
	heroPlaceholderOnly, Print["publish: no hero image in the definition (the Hero Image section holds only the template placeholder); the resource is deployed without a hero"],
	heroBoxes === None, Print["publish: WARNING - no graphics output in the Hero Image section of ", defNb, "; the resource is deployed without a hero"],
	ImageQ[heroImage], Print["publish: hero image ", ImageDimensions[heroImage], " px from the definition notebook", wpHeroSizeNote[heroImage]],
	True, Print["publish: WARNING - the hero output cell did not rasterize; the resource is deployed without a hero"]
]
wpInjectHero[If[ImageQ[heroImage], heroImage, None]]

(* Headless deploy (or its rehearsal): open the definition notebook in place, where it resolves its
   paclet relative to its own directory, and scrape it; the dry run stops there. *)
result = wpScrapeAndDeploy[defNb, pacletName, dryRun]

If[dryRun,
	If[MatchQ[result, _ResourceObject],
		Print["publish: dry run complete; nothing was deployed"];
		Exit[0],
		Print["publish: dry run stopped at the scrape: ",
			Which[
				result === $TimedOut, "the scrape did not finish within " <> ToString[$wpScrapeTimeout] <> " s (WP_SCRAPE_TIMEOUT)",
				FailureQ[result], result["Message"],
				True, result
			]];
		Exit[1]
	]
]

(* A failure is read before any URL is looked for: a Failure can itself carry a cloud URL in its
   message or metadata, and a search of the whole result for one would then report a deploy that
   never happened. The exit code gates the release, so a false success is the wrong direction to
   fail in. *)
If[FailureQ[result] || result === $TimedOut,
	Print["publish: deploy failed: ",
		Which[
			result === $TimedOut, "the scrape and deploy did not finish within " <> ToString[$wpScrapeTimeout] <> " s (WP_SCRAPE_TIMEOUT)",
			StringQ[result["Message"]], result["Message"],
			True, result
		]
	];
	Exit[1]
]
url = FirstCase[{result}, c_CloudObject :> First[c], Missing[], Infinity]
If[MissingQ[url],
	url = FirstCase[{result}, s_String /; StringContainsQ[s, "wolframcloud.com"], Missing[], Infinity]
]
If[MissingQ[url],
	Print["publish: deploy did not return a URL. Result: ", result];
	Exit[1]
]
Print["published: ", url]
Exit[0]
