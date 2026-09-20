#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Build the single-page documentation browser over this paclet's pages, for either target:

     wolframscript -file scripts/build_site.wls site    assemble the shell and DEPLOY it to the cloud
     wolframscript -file scripts/build_site.wls local   render every page offline into build/local-docs
     wolframscript -file scripts/build_site.wls help    print the usage (wolframscript takes -h and
                                                        --help for itself, so the word is the flag)
     DRYRUN=1 wolframscript -file scripts/build_site.wls <target>    print the navigation and stop

   Ported from HypergraphRewritingEngine's scripts/build_site.wls, with the guide hierarchy of
   PureMath's scripts/build_docs.wls: one root guide, and a Guides group nesting the guides it
   links, the guides those link, and so on down.

   Why a shell at all. The stock paclet shingle deploys each documentation page as a delayed embed
   that fetches the page's static render with a one second budget: a heavy page comes back empty,
   and a link inside a page escapes into the resource chrome, where the reader loses the navigation
   entirely. So the site target deploys ONE page, index.html, which frames the deployed resource's
   live Documentation/{guide,ref,tutorial}/<Name>.html pages: a persistent collapsible tree on the
   left, one iframe in the middle, and a same origin click hook that routes a link to another page
   of the tree back through the loader (a link to anything else, Wolfram's own documentation above
   all, keeps its own navigation and opens in a new tab). The frame is fed through a notebook host
   page (docs/web/docs_page.html) that injects the cloud's own static render into the container it
   then hands the notebook embedder, so the page is painted before the embedder has fetched anything.

   The local target is the same shell with no cloud in it at all, not even a font: it renders each
   authoring notebook to static HTML with a headless front end (DocumentationBuild`DocumentationBuildHTML),
   points the shell's BASE at those files and writes everything under build/local-docs, which
   scripts/docs_local.sh serves over http://localhost. A render is cached by a hash of the source
   notebook, so a rebuild with nothing changed takes seconds instead of minutes. The site is built
   in a staging directory and judged there, every page with every image it references and every
   shared bundle a page names; only a complete site replaces build/local-docs, and a failed run
   leaves the staging tree for inspection and the previous site untouched. Everything the
   documentation build prints goes to build/local-docs-render.log, so the terminal shows this
   script's lines and the inventory.

   The navigation is read from the markdown sources, not from a list kept here. The guide named
   by rootGuide below is the root of the tree, and the guides under docs/en/Guides (at any depth;
   the built notebooks are flat by basename) form the Guides group as a TREE rather than a flat
   list: a guide's children are the guides its own body links (paclet:<paclet>/guide/<Name>,
   written on the page as the target of a "### " heading), in the order it links them, and the
   walk is depth first from the root, so an area guide sits under the root and its leaves under
   the area. The hierarchy is a DAG, not a tree: a guide several pages link is expanded under the
   first parent the walk reaches and never entered twice, so every page is in the navigation
   exactly once. A guide no page links still belongs in the tree, and follows at the end of the
   top level, alphabetically. The RelatedTutorials of the guides, read in that tree order, give
   the Tutorials group in the order the guides name them; the symbols the guides mention as code
   spans, in the same order, give the Reference group in the order they are introduced. A
   tutorial or a symbol page no guide names still belongs in the tree, alphabetically after the
   named ones. A group with no page is left out. Every page's Title and Keywords come from its own
   frontmatter (Title on the guides and the tutorials; a symbol page is titled by its symbol). A
   page added under docs/en appears here with no edit to this script.

   Environment knobs:
     DRYRUN=1            print the navigation tree and stop, before any render or deploy
     WP_LOCAL_ONLY=<p>   local: render this page again, cached or not. The rest come from the cache,
                         and whatever the cache does not hold yet is rendered too, so the site is
                         always whole. The value is a basename (GettingStarted) or a path under
                         Documentation/English without the extension (Tutorials/GettingStarted); a
                         value that names no page stops the run
     WP_HTML_CACHE=0     local: ignore the render cache and render every page again
     WOLFRAM_CLOUD_USER, WOLFRAM_CLOUD_PASSWORD    site: the account the shell is deployed under,
                         from the environment or from the gitignored .env at the repository root;
                         without them the kernel's own connection is used (wpCloudConnect in
                         scripts/deploy_common.wls)
     QT_QPA_PLATFORM / DISPLAY    local: when neither is set on Linux the script sets
                         QT_QPA_PLATFORM=offscreen for the headless front end (wpOffscreenFrontEnd
                         in scripts/deploy_common.wls)

   Prerequisites: local needs the authoring notebooks under WolframPhysics/Documentation/English
   (./build_docs.sh; they are build output and are not tracked in git, so a fresh clone has none
   until that has run), a front end (headless on Linux, see the local target) and no cloud; site
   needs a cloud connection, and the deployed resource (scripts/publish.wls) is what it frames.

   Exit status: 0 when the site was delivered (or the dry run printed), 1 when the sources, the
   render, the assembly or the deploy fail; a failed local run leaves build/local-docs untouched.

   The name. ./build_docs.sh in this repository already means "markdown to notebooks", so this one
   is build_site.wls and its server wrapper is scripts/docs_local.sh. *)

scriptPath = ExpandFileName[$InputFileName];
repo = FileNameDrop[scriptPath, -2];

usage = "usage: [DRYRUN=1] wolframscript -file scripts/build_site.wls site|local|help";
arguments = Select[Rest[Join[$ScriptCommandLine, {""}]], StringQ];
target = ToLowerCase[First[arguments, ""]];
If[! MemberQ[{"site", "local"}, target],
	Print[usage];
	Print["  site    assemble the shell and deploy it to the Wolfram Cloud"];
	Print["  local   render the pages offline into build/local-docs (no cloud connection)"];
	Print["  help    this text"];
	Print["  DRYRUN=1 prints the navigation tree and stops before either"];
	Exit[If[target === "help", 0, 1]]
];
say[args___] := Print["build_site[", target, "]: ", args];
(* the offscreen front end and the cloud connection are shared with the deploying scripts and
   explained there; Getting the file loads no package *)
Get[FileNameJoin[{repo, "scripts", "deploy_common.wls"}]];

guidesDir = FileNameJoin[{repo, "docs", "en", "Guides"}];
tutorialsDir = FileNameJoin[{repo, "docs", "en", "Tutorials"}];
symbolsDir = FileNameJoin[{repo, "docs", "en", "ReferencePages", "Symbols"}];
webDir = FileNameJoin[{repo, "docs", "web"}];
pacletDir = FileNameJoin[{repo, "WolframPhysics"}];
pacletName = "WolframInstitute/WolframPhysics";
(* where scripts/publish.wls deploys the resource, under the account root *)
resourceRelative = "DeployedResources/Paclet/" <> pacletName;
(* The cloud objects this script writes all live under one directory, <account>/WolframPhysics:
   index.html is the shell (the cloud serves a directory's index.html at the directory's own URL, so
   the site's address is the bare name) and page.html the notebook host beside it. The paclet
   resource itself is at <account>/DeployedResources/Paclet/..., a different path, so the two never
   collide. *)
siteObject = "WolframPhysics";
(* the guide at the root of the tree, docs/en/Guides/WolframPhysics.md *)
rootGuide = "WolframPhysics";

If[! DirectoryQ[guidesDir],
	say["no guide directory at ", guidesDir];
	Exit[1]
];

(* ==================== the navigation, read from the markdown sources ==================== *)

sourceText[file_String] := sourceText[file] = Import[file, "Text"];
(* everything after the closing --- of the frontmatter: the prose, where a symbol is mentioned *)
sourceBody[file_String] := sourceBody[file] =
	StringDelete[sourceText[file], StartOfString ~~ "---" ~~ Shortest[___] ~~ "\n---"];

(* YAML quotes a frontmatter value that carries a colon and a space. The notebook build unquotes
   it, so the navigation must too, or such a page reads as quoted in the tree. *)
unquote[value_String] := With[{trimmed = StringTrim[value]},
	If[StringLength[trimmed] > 1 && StringMatchQ[trimmed, ("\"" ~~ ___ ~~ "\"") | ("'" ~~ ___ ~~ "'")],
		StringTake[trimmed, {2, -2}],
		trimmed
	]
];

field[file_String, key_String] := Replace[
	StringCases[sourceText[file],
		StartOfLine ~~ key ~~ ":" ~~ Whitespace ... ~~ value : Except["\n"] .. :> value, 1],
	{{value_String} :> unquote[value], _ -> ""}
];

(* a bracketed frontmatter list, as Keywords and RelatedTutorials are written *)
listField[file_String, key_String] := Replace[
	StringCases[sourceText[file],
		StartOfLine ~~ key ~~ ":" ~~ Whitespace ... ~~ "[" ~~ value : Except["]"] .. ~~ "]" :> value, 1],
	{{value_String} :> Select[StringTrim /@ StringSplit[value, ","], # =!= "" &], _ -> {}}
];

(* A symbol page carries no Title: the symbol is its own title, and its basename is the symbol. *)
titleOf[file_String] := Replace[field[file, "Title"], "" -> FileBaseName[file]];
keywordsOf[file_String] := ToLowerCase[StringRiffle[listField[file, "Keywords"], " "]];

entryOf[type_String, file_String] := <|
	"id" -> type <> "/" <> FileBaseName[file],
	"name" -> FileBaseName[file],
	"title" -> titleOf[file],
	"keywords" -> keywordsOf[file]
|>;

(* The pages of a kind, by basename, from any depth under their directory: the built notebooks
   are flat by basename, so two sources sharing one would build to the same notebook, and the run
   stops on that rather than hiding one of them. *)
filesByName[dir_String] := If[DirectoryQ[dir],
	With[{files = FileNames["*.md", dir, Infinity]},
		If[Length[files] =!= Length[DeleteDuplicates[FileBaseName /@ files]],
			say["two pages under ", dir, " share a basename: ",
				StringRiffle[Keys @ Select[Counts[FileBaseName /@ files], # > 1 &], ", "]];
			Exit[1]
		];
		Association[(FileBaseName[#] -> #) & /@ files]
	],
	<||>
];

counted[n_Integer, noun_String] := ToString[n] <> " " <> noun <> If[n == 1, "", "s"];

guideFiles = filesByName[guidesDir];
tutorialFiles = filesByName[tutorialsDir];
symbolFiles = filesByName[symbolsDir];
If[! KeyExistsQ[guideFiles, rootGuide],
	say["no root guide ", rootGuide, ".md under ", guidesDir];
	Exit[1]
];

(* A guide links its children in its body, as paclet:<paclet>/guide/<Name>, in a deliberate
   order; on the page that link is the target of a "### " heading, and it is the parent-to-child
   edge of the hierarchy, which the directory layout does not decide. The Guides group is that
   graph walked depth first from the root: the root's children are the areas, an area's children
   are its leaves. *)
guideLinks[file_String] := DeleteDuplicates @ StringCases[sourceBody[file],
	StartOfLine ~~ "###" ~~ Whitespace ~~ "[" ~~ Shortest[___] ~~ "](paclet:" ~~ pacletName ~~
		"/guide/" ~~ name : (WordCharacter ..) ~~ ")" :> name];
childGuides[name_String] := childGuides[name] =
	Select[guideLinks[guideFiles[name]], KeyExistsQ[guideFiles, #] &];

(* The graph is a DAG: a guide may be linked by several parents (a leaf that two areas both
   want), and a body link back up would be a cycle. So the walk keeps a seen set and enters a
   page once, under the first parent that reaches it, which both breaks the cycle and keeps every
   page in the navigation exactly once, as the loader's findLink assumes. The root is seen before
   the walk starts, so it is never a member of its own group. *)
visited = <||>;
guideNode[name_String] := Module[{children = {}},
	visited[name] = True;
	Scan[
		Function[child, If[! KeyExistsQ[visited, child], AppendTo[children, guideNode[child]]]],
		childGuides[name]
	];
	Append[entryOf["guide", guideFiles[name]], "children" -> children]
];
rootNode = guideNode[rootGuide];

(* A guide the walk never reached belongs in the tree all the same, at the end of the top level
   and alphabetically: a page nothing links is a page under construction, or one whose parent
   lost its heading, and leaving it out of the navigation is how it stays lost. A guide no page
   links at all heads such a branch, and takes whatever it links with it; anything still
   unreached after those is linked only from inside its own unreachable island, and the
   alphabetically first of them heads the next branch. *)
linkedAnywhere = DeleteDuplicates[Catenate[childGuides /@ Keys[guideFiles]]];
unreached[] := Sort @ Select[Keys[guideFiles], ! KeyExistsQ[visited, #] &];
orphanNodes = {};
Module[{remaining = unreached[], next},
	While[remaining =!= {},
		next = First[Select[remaining, ! MemberQ[linkedAnywhere, #] &], First[remaining]];
		AppendTo[orphanNodes, guideNode[next]];
		remaining = unreached[]
	]
];
If[orphanNodes =!= {},
	say[counted[Length[orphanNodes], "guide"], " no page links, at the end of the top level: ",
		StringRiffle[#["name"] & /@ orphanNodes, ", "]]
];

(* a node and everything under it, in the order the tree presents them *)
descend[node_Association] := Prepend[Catenate[descend /@ Lookup[node, "children", {}]], node];
(* the items of the Guides group: the root's own branches, then the branches nothing links *)
guideNodes = Join[rootNode["children"], orphanNodes];
(* every guide, root first, in the order the tree presents them: the order in which their
   RelatedTutorials and their symbol mentions are collected below *)
guidesInOrder = #["name"] & /@ Join[descend[rootNode], Catenate[descend /@ orphanNodes]];

(* The guides list their tutorials in a deliberate reading order, so that is the order of the
   Tutorials group; a tutorial no guide names still belongs in the tree, and follows. *)
namedTutorials = DeleteDuplicates[Join @@ (listField[guideFiles[#], "RelatedTutorials"] & /@ guidesInOrder)];
relatedTutorials = Select[namedTutorials, KeyExistsQ[tutorialFiles, #] &];
tutorialOrder = Join[relatedTutorials, Complement[Keys[tutorialFiles], relatedTutorials]];

(* The guides introduce the symbols section by section, each as a code span; that introduction
   order is the order of the Reference group, with anything no guide mentions after it. *)
guideMentions = DeleteDuplicates[Join @@ (
	StringCases[sourceBody[guideFiles[#]], "`" ~~ name : (WordCharacter ..) ~~ "`" :> name] & /@ guidesInOrder)];
mentionedSymbols = Select[guideMentions, KeyExistsQ[symbolFiles, #] &];
symbolOrder = Join[mentionedSymbols, Complement[Keys[symbolFiles], mentionedSymbols]];

(* a group of the tree, or nothing when it has no page; an item of the Guides group carries the
   items under it, an item of the other two is a page on its own *)
groupOf[label_String, class_String, items_List] :=
	If[items === {}, Nothing,
		<|"label" -> label, "class" -> class, "items" -> items|>];

tree = <|
	"root" -> KeyDrop[rootNode, "children"],
	"groups" -> {
		groupOf["Guides", "gd", guideNodes],
		groupOf["Tutorials", "tut", entryOf["tutorial", tutorialFiles[#]] & /@ tutorialOrder],
		groupOf["Reference", "sym", entryOf["ref", symbolFiles[#]] & /@ symbolOrder]
	}
|>;
(* the pages of the navigation, flat and in tree order, whatever the nesting *)
pages = KeyDrop[#, "children"] & /@ Prepend[
	Catenate[Catenate[descend /@ #["items"]] & /@ tree["groups"]], tree["root"]];
say[counted[Length[guidesInOrder], "guide"], ", ", counted[Length[tutorialOrder], "tutorial"], ", ",
	counted[Length[symbolOrder], "symbol"], ": ", counted[Length[pages], "page"]];
If[Length[pages] =!= Length[DeleteDuplicates[#["id"] & /@ pages]],
	say["a page appears twice in the navigation"];
	Exit[1]
];

(* ---- DRYRUN: print what would be deployed or rendered, and stop ----
   The indentation is the nesting: an area sits under the Guides label and its leaves under the
   area, which is how a page that landed in the wrong branch is seen before anything is built. *)
showItem[entry_Association, depth_Integer] := (
	Print["      ", StringJoin[ConstantArray["  ", depth]], "- ", entry["title"], "  [", entry["id"], "]"];
	Scan[showItem[#, depth + 1] &, Lookup[entry, "children", {}]]
);
If[Environment["DRYRUN"] === "1",
	Print["+ ", tree["root"]["title"], "  [", tree["root"]["id"], "]"];
	Scan[
		Function[group,
			Print["    ", group["label"]];
			Scan[showItem[#, 0] &, group["items"]]
		],
		tree["groups"]
	];
	(* the account is $CloudRootDirectory, read from the cloud, and even asking $CloudConnected
	   makes a kernel with a cached login connect; a dry run touches no cloud, so it is a placeholder *)
	Print["    BASE ", If[target === "site",
		"<account>/" <> resourceRelative <> " (the account is resolved at deploy time)",
		". (the files under build/local-docs)"]];
	say["DRYRUN, stopping before ", If[target === "site", "the deploy", "the render"]];
	Exit[0]
];

(* ==================== local target: render every page offline ==================== *)

If[target === "local",
	(* PacletTools` is loaded before DocumentationBuild`: under a headless Needs sequence it is not
	   autoloaded, and a documentation build call that reaches for it (PacletExtensionFiles) then
	   stays symbolic instead of listing the pages (scripts/deploy_common.wls explains the same
	   fix for the scrape). Loading it explicitly is what makes the render produce pages here. *)
	Needs["PacletTools`"];
	Needs["DocumentationBuild`"];
	docsDir = FileNameJoin[{pacletDir, "Documentation"}];
	englishDir = FileNameJoin[{docsDir, "English"}];
	(* the site is built in a staging directory and swapped in at the end, so a server running on
	   the old one never serves a half written site, and a failed run never replaces a good one *)
	siteFinal = FileNameJoin[{repo, "build", "local-docs"}];
	siteStage = FileNameJoin[{repo, "build", "local-docs.new"}];
	(* the cache and the log live under build/ so that all of it is covered by the /build/ ignore *)
	cacheDir = FileNameJoin[{repo, "build", "local-docs-cache"}];
	assetCache = FileNameJoin[{cacheDir, "_assets"}];
	renderLog = FileNameJoin[{repo, "build", "local-docs-render.log"}];
	(* The authoring notebooks are build output and are not tracked in git, so a fresh clone has
	   none of them and neither the directory nor its emptiness is an odd state: it is the build
	   not having run here. Say that, rather than rendering a site with no page in it and failing
	   later on an empty inventory. *)
	If[! DirectoryQ[englishDir] || FileNames["*.nb", englishDir, Infinity] === {},
		say["no authoring notebooks under ", englishDir, ": they are build output (not tracked in git),"];
		say["and the build has not run here. Run ./build_docs.sh to build them from docs/en, then rerun this."];
		Exit[1]
	];
	(* the render drives a front end; a headless Linux box needs the offscreen Qt platform (see
	   wpOffscreenFrontEnd in scripts/deploy_common.wls) *)
	wpOffscreenFrontEnd[];
	(* the paclet is loaded from the repository, so the build resolves this paclet's own paclet: links *)
	PacletDirectoryLoad[pacletDir];

	renderOptions = {"CompleteHTMLQ" -> True, "LinkBase" -> pacletName};
	cacheOn = Environment["WP_HTML_CACHE"] =!= "0";
	only = Replace[Environment["WP_LOCAL_ONLY"], Except[_String] -> ""];
	pageSources = FileNames["*.nb", englishDir, Infinity];
	relativeParts[source_String] := FileNameSplit[StringDrop[source, StringLength[englishDir] + 1]];
	typeOf[source_String] := Replace[First[relativeParts[source]],
		{"Guides" -> "guide", "Tutorials" -> "tutorial", _ -> "ref"}];
	(* DocumentationBuildHTML writes the pages under <out>/html/{guide,ref,tutorial}/, and the
	   images of a page beside it in Files/<Name>.en *)
	renderedOf[source_String] := FileNameJoin[{siteStage, "html", typeOf[source], FileBaseName[source] <> ".html"}];
	renderedFilesOf[source_String] := FileNameJoin[{siteStage, "html", typeOf[source], "Files", FileBaseName[source] <> ".en"}];

	(* A page references its images as src="Files/<Name>.en/<file>", relative to itself. A page is
	   complete when it is a real page and every image it references is beside it: the one test
	   for a cache entry, for what a render delivered, and for the finished site. A page with no
	   images (a guide) is complete on its own. *)
	imageRefs[html_String] := DeleteDuplicates @ StringCases[Import[html, "Text"],
		"src=\"Files/" ~~ Shortest[path__] ~~ "\"" :> "Files/" <> path];
	missingImages[html_String] := Select[imageRefs[html], ! FileExistsQ[FileNameJoin[{DirectoryName[html], #}]] &];
	completeQ[html_String] := FileExistsQ[html] && FileByteCount[html] >= 2000 && missingImages[html] === {};

	(* A render is keyed by its source notebook, so a page whose notebook has not changed is
	   copied from the cache and never touches the front end. An entry is a directory holding the
	   page beside its Files/<Name>.en images, laid out as the page is served; it is written under
	   a temporary name and renamed into place, so an interrupted run leaves nothing a later run
	   could take for an entry, and it counts only while it is complete, so an entry that lost its
	   images is a miss and is rendered again rather than restored without its pictures. The last
	   element of the key names the entry layout: a change to the layout changes it, and every
	   entry of the old layout misses. *)
	keyOf[source_String] := keyOf[source] =
		Hash[{FileHash[source, "SHA256", "Base64Encoding"], $Version, "1"}, "SHA256", "HexString"];
	cacheEntryOf[source_String] := FileNameJoin[{cacheDir, keyOf[source]}];
	cachedPageOf[source_String] := FileNameJoin[{cacheEntryOf[source], FileBaseName[source] <> ".html"}];
	cachedFilesOf[source_String] := FileNameJoin[{cacheEntryOf[source], "Files", FileBaseName[source] <> ".en"}];
	cachedQ[source_String] := cacheOn && completeQ[cachedPageOf[source]];
	landedQ[source_String] := completeQ[renderedOf[source]];
	selectedQ[source_String] := only === FileBaseName[source] ||
		only === StringDrop[StringRiffle[relativeParts[source], "/"], -3];

	If[only =!= "" && ! AnyTrue[pageSources, selectedQ],
		say["WP_LOCAL_ONLY=", only, " names no page under ", englishDir];
		say["it is a basename (GettingStarted) or a path without the extension (Tutorials/GettingStarted)"];
		Exit[1]
	];
	(* to render: the selected page whether cached or not, and every page the cache does not hold *)
	misses = Select[pageSources, (only =!= "" && selectedQ[#]) || ! cachedQ[#] &];
	hits = Complement[pageSources, misses];
	say[counted[Length[hits], "page"], " from the cache, ", Length[misses], " to render"];
	(* every page cached but no cached asset bundle: render one page anyway, for the shared assets *)
	If[misses === {} && ! DirectoryQ[assetCache],
		misses = {FileNameJoin[{englishDir, "Guides", rootGuide <> ".nb"}]}
	];

	(* nothing on disk is touched before this point, so a run that stops above leaves no trace *)
	If[DirectoryQ[siteStage], DeleteDirectory[siteStage, DeleteContents -> True]];
	CreateDirectory[siteStage, CreateIntermediateDirectories -> True];

	(* Everything the documentation build prints and every message it emits goes to the log
	   rather than the terminal: a cold render says a few hundred lines of XMLElement::attrhs,
	   CreateDirectory::eexist, Syntax::sntufn and its own progress prints, none of which reaches
	   the pages, and the lines of this script would be lost behind them. The pages are judged by
	   the inventory at the end; the log is there when a page fails. *)
	log = OpenWrite[renderLog];
	render[options___] := Block[{$Output = {log}, $Messages = {log}},
		UsingFrontEnd @ DocumentationBuild`DocumentationBuildHTML[docsDir, siteStage, options, Sequence @@ renderOptions]
	];
	(* time constrained, so a page whose front end wedges is reported and skipped rather than
	   taking the whole run down *)
	renderOne[source_String] := TimeConstrained[render["SingleFile" -> source]; True, 300, False] === True;

	renderTime = First @ AbsoluteTiming @ If[misses === {},
		(* nothing to render: the cached asset bundles and the cached pages are the whole site *)
		Scan[
			CopyDirectory[#, FileNameJoin[{siteStage, FileNameTake[#]}]] &,
			Select[FileNames["*", assetCache], DirectoryQ]
		],

		If[Length[misses] >= 5,
			(* a cold or largely cold tree: one whole tree render costs less than a call per page
			   and brings the shared web assets with it. It is not trusted: it can return normally
			   having written only some of the pages, so what it delivered is counted, and the rest
			   is rendered a page at a time below. *)
			say["rendering the whole tree"];
			render[];
			say[Count[misses, _?landedQ], " of ", Length[misses], " pages landed from the whole tree render"]
		];
		(* the rest, one page at a time; a page gets two tries before the run gives it up *)
		Do[
			Scan[
				Function[source,
					say["rendering ", FileBaseName[source], If[attempt == 2, " (second try)", ""]];
					If[! renderOne[source], say["TIMED OUT rendering ", FileBaseName[source]]];
					If[! landedQ[source], say[FileBaseName[source], " did not land"]]
				],
				Select[misses, ! landedQ[#] &]
			],
			{attempt, 2}
		];
		(* a bundle the render did not write (a single page render brings them, but nothing
		   depends on that) comes from the asset cache when there is one *)
		If[DirectoryQ[assetCache],
			Scan[
				If[! DirectoryQ[FileNameJoin[{siteStage, FileNameTake[#]}]],
					CopyDirectory[#, FileNameJoin[{siteStage, FileNameTake[#]}]]] &,
				Select[FileNames["*", assetCache], DirectoryQ]
			]
		]
	];
	Close[log];
	rendered = Select[misses, landedQ];
	say["render took ", Round[renderTime], " s; the documentation build's own output is in ", renderLog];

	(* the pages that were not rendered come from the cache, images and all; so does a page whose
	   render failed, when the cache holds it (WP_LOCAL_ONLY renders a cached page again) *)
	restore[source_String] := With[{out = renderedOf[source], images = renderedFilesOf[source]},
		If[! DirectoryQ[DirectoryName[out]], CreateDirectory[DirectoryName[out], CreateIntermediateDirectories -> True]];
		CopyFile[cachedPageOf[source], out, OverwriteTarget -> True];
		If[DirectoryQ[images], DeleteDirectory[images, DeleteContents -> True]];
		If[DirectoryQ[cachedFilesOf[source]],
			If[! DirectoryQ[DirectoryName[images]], CreateDirectory[DirectoryName[images], CreateIntermediateDirectories -> True]];
			CopyDirectory[cachedFilesOf[source], images]
		]
	];
	Scan[restore, hits];
	Scan[
		If[! landedQ[#] && cachedQ[#], say["taking ", FileBaseName[#], " from the cache instead"]; restore[#]] &,
		misses
	];

	(* store what was rendered, and the shared asset bundles, for the next run *)
	storeEntry[source_String] := Module[{entry = cacheEntryOf[source], tmp = cacheEntryOf[source] <> ".tmp"},
		If[DirectoryQ[tmp], DeleteDirectory[tmp, DeleteContents -> True]];
		CreateDirectory[FileNameJoin[{tmp, "Files"}], CreateIntermediateDirectories -> True];
		CopyFile[renderedOf[source], FileNameJoin[{tmp, FileBaseName[source] <> ".html"}]];
		If[DirectoryQ[renderedFilesOf[source]],
			CopyDirectory[renderedFilesOf[source], FileNameJoin[{tmp, "Files", FileBaseName[source] <> ".en"}]]];
		If[DirectoryQ[entry], DeleteDirectory[entry, DeleteContents -> True]];
		RenameDirectory[tmp, entry]
	];
	If[cacheOn,
		If[! DirectoryQ[cacheDir], CreateDirectory[cacheDir, CreateIntermediateDirectories -> True]];
		Scan[storeEntry, rendered];
		If[misses =!= {} || ! DirectoryQ[assetCache],
			With[{tmp = assetCache <> ".tmp"},
				If[DirectoryQ[tmp], DeleteDirectory[tmp, DeleteContents -> True]];
				CreateDirectory[tmp];
				Scan[
					If[DirectoryQ[#] && FileNameTake[#] =!= "html",
						CopyDirectory[#, FileNameJoin[{tmp, FileNameTake[#]}]]] &,
					FileNames["*", siteStage]
				];
				If[DirectoryQ[assetCache], DeleteDirectory[assetCache, DeleteContents -> True]];
				RenameDirectory[tmp, assetCache]
			]
		];
		(* the cache holds the current notebooks and nothing else: an entry for a version of a page
		   that is gone, one of another layout, or a temporary name an interrupted run left, is
		   removed, so the cache stays the size of the site *)
		With[{keep = Append[keyOf /@ pageSources, "_assets"]},
			Scan[
				If[! MemberQ[keep, FileNameTake[#]],
					say["pruning ", FileNameTake[#], " from the cache"];
					If[DirectoryQ[#], DeleteDirectory[#, DeleteContents -> True], DeleteFile[#]]
				] &,
				FileNames["*", cacheDir]
			]
		]
	];

	(* A rendered page carries relative references written for a page served at the root of a site:
	   its images beside it, its shared assets three levels up (which a browser clamps to the root)
	   and a link to another page two levels up and down again, as ../../ref/<Name>.html. So the
	   guide, ref and tutorial directories are lifted out of html/ to the root of the site, beside
	   the asset bundles; every link then resolves on its own, and the shell's click hook is what
	   keeps navigation inside the frame rather than what makes it work at all. *)
	With[{renderedDir = FileNameJoin[{siteStage, "html"}]},
		If[! DirectoryQ[renderedDir],
			say["the render produced no pages under ", renderedDir, "; see ", renderLog];
			Exit[1]
		];
		Scan[
			With[{destination = FileNameJoin[{siteStage, FileNameTake[#]}]},
				If[DirectoryQ[#], RenameDirectory[#, destination], RenameFile[#, destination]]] &,
			FileNames["*", renderedDir]
		];
		DeleteDirectory[renderedDir, DeleteContents -> True]
	];

	(* Asset path skew in the documentation build of 15.0: the pages it writes reference their
	   stylesheets and scripts under language-assets-v2, while the bundle it ships beside them is
	   named language-assets. Without the copy every page loads unstyled and its scripts do not
	   run; the bundle is duplicated under the referenced name, so a page resolves either. *)
	With[{shipped = FileNameJoin[{siteStage, "language-assets"}], referenced = FileNameJoin[{siteStage, "language-assets-v2"}]},
		If[DirectoryQ[shipped] && ! DirectoryQ[referenced], CopyDirectory[shipped, referenced]]
	];

	(* The jQuery the render ships is corrupt at its source: in 15.0 the copy in the documentation
	   build's asset bundle ends with two lines of a dependency-check log appended after the code,
	   so the file does not parse, every page script that needs $ fails with it, and the collapsed
	   sections of a symbol page (Details and Options, Scope, the option subsections) cannot be
	   opened. A jQuery build is a licence comment and one line of code, ending in */ and ;, so the
	   file is cut back to its last line that ends in either. *)
	Scan[
		Function[file,
			Module[{lines = Import[file, "Lines", CharacterEncoding -> "UTF-8"], kept},
				kept = lines;
				While[kept =!= {} && ! StringEndsQ[Last[kept], ";" | "*/"], kept = Most[kept]];
				If[kept === {},
					say["jquery.min.js has no script line at all: ", file];
					Exit[1]
				];
				If[Length[kept] < Length[lines],
					Export[file, kept, "Lines", CharacterEncoding -> "UTF-8"];
					say["cut ", Length[lines] - Length[kept], " trailing non-script lines from ",
						StringDrop[file, StringLength[siteStage] + 1]]
				]
			]
		],
		FileNames["jquery.min.js", FileNameJoin[{siteStage, "common", "js"}], Infinity]
	];
];

(* ==================== site target: connect and derive the account bases ==================== *)

If[target === "site",
	(* The credentials, the connection and the account (wpCloudConnect in scripts/deploy_common.wls
	   prints it). $CloudRootDirectory is the account root, and both the deployed resource and this
	   shell live under it, so deriving from it runs under whatever cloud identity is configured
	   rather than hardcoding an account. *)
	If[! wpCloudConnect[repo, "build_site[" <> target <> "]: "],
		say["cloud connection failed; set WOLFRAM_CLOUD_USER and WOLFRAM_CLOUD_PASSWORD"];
		Exit[1]
	];
	accountBase = First[$CloudRootDirectory];
	say["site target ", accountBase, "/", siteObject, " (index.html and page.html), framing the pages of ",
		accountBase, "/", resourceRelative];
];

(* ==================== the shell ==================== *)

esc[value_] := StringReplace[ToString[value],
	{"&" -> "&amp;", "<" -> "&lt;", ">" -> "&gt;", "\"" -> "&quot;"}];

readAsset[name_String] := With[{path = FileNameJoin[{webDir, name}]},
	If[FileExistsQ[path],
		Import[path, "Text"],
		say["missing asset ", path];
		Exit[1]
	]
];

(* BASE, DOCS, HOME and the fonts are the whole difference between the targets: the site frames
   the deployed resource's live pages, which it keeps under Documentation/, opens on its landing
   page and takes its fonts from Wolfram's CDN; the local build frames the files just rendered at
   the root of the site, opens on the root guide and takes its fonts from the bundle the render
   ships beside the pages, so it needs no network at all. PAGE, the notebook host, exists only in
   the cloud. *)
{base, docsPath, homeURL, fontBase} = If[target === "site",
	{accountBase <> "/" <> resourceRelative, "/Documentation/",
		accountBase <> "/" <> resourceRelative <> "/", "https://www.wolframcdn.com/fonts"},
	{".", "/", "./guide/" <> rootGuide <> ".html", "fonts"}
];
hostPage = If[target === "site", accountBase <> "/" <> siteObject <> "/page.html", ""];
pageURLOf[id_String] := base <> docsPath <> id <> ".html";

(* A navigation link carries its id, which the loader turns into the page URL, and the page URL
   itself in href, so the tree works with scripting off and a middle click opens the page on its
   own. data-kw carries the page's own frontmatter keywords and its group, which is what the
   filter box matches besides the title, so "branchial" or "reference" finds pages whose titles
   say neither. *)
linkTag[entry_Association, class_String, group_String] := StringJoin[
	"<a class=\"", class, "\" data-id=\"", esc[entry["id"]],
	"\" data-kw=\"", esc[StringTrim[entry["keywords"] <> " " <> group]],
	"\" href=\"", esc[pageURLOf[entry["id"]]], "\">", esc[entry["title"]], "</a>"
];

(* An item of a group, and under it the pages it links. A page with children is a <details>, so
   an area folds away; it is written closed, and the loader opens the ancestors of whatever page
   is showing (openAnc in docs_site.js), so the branch the reader is in is the one that is open.
   The classes say where the item sits: "sub" on anything below the top level of its group, and
   "area" on a page that has children, which is what the stylesheet reads. *)
itemHTML[entry_Association, class_String, group_String, depth_Integer] := Module[
	{children = Lookup[entry, "children", {}], itemClass},
	itemClass = class <> If[depth > 0, " sub", ""] <> If[children === {}, "", " area"];
	If[children === {},
		"<li class=\"leaf\">" <> linkTag[entry, itemClass, group] <> "</li>",
		StringJoin[
			"<li class=\"branch\"><details><summary>", linkTag[entry, itemClass, group],
			"</summary><ul class=\"kids\">",
			StringJoin[itemHTML[#, class, group, depth + 1] & /@ children],
			"</ul></details></li>"
		]
	]
];

groupHTML[group_Association] := StringJoin[
	"<li class=\"branch\"><details open><summary><span class=\"grp\">", esc[group["label"]],
	"</span></summary><ul>",
	StringJoin[(itemHTML[#, group["class"], ToLowerCase[group["label"]], 0] &) /@ group["items"]],
	"</ul></details></li>"
];

sidebar = StringJoin[
	"<ul class=\"nav-root\"><li class=\"branch\"><details open><summary>",
	linkTag[tree["root"], "gd root", "guide"],
	"</summary><ul>",
	StringJoin[groupHTML /@ tree["groups"]],
	"</ul></details></li></ul>"
];
(* the ids of the pages, as a JavaScript array, for the notebook host page: it has no tree to
   ask, and only a link to one of these is routed back through the shell *)
idsJS = "[" <> StringRiffle[("\"" <> #["id"] <> "\"") & /@ pages, ","] <> "]";

indexHTML = TemplateApply[
	StringTemplate[readAsset["docs_site.html"]],
	<|
		"title" -> esc[tree["root"]["title"]],
		"fonts" -> esc[fontBase],
		"css" -> readAsset["docs_site.css"],
		"base" -> esc[base],
		"homeURL" -> esc[homeURL],
		"sidebar" -> sidebar,
		"js" -> TemplateApply[
			StringTemplate[readAsset["docs_site.js"]],
			<|"BASE" -> base, "DOCS" -> docsPath, "HOME" -> homeURL, "PAGE" -> hostPage, "ROOT" -> rootGuide|>
		]
	|>
];
If[! StringQ[indexHTML],
	say["the index did not assemble"];
	Exit[1]
];
say["index.html assembled, ", StringLength[indexHTML], " characters"];

(* ==================== deliver ==================== *)

If[target === "local",
	Export[FileNameJoin[{siteStage, "index.html"}], indexHTML, "Text"];

	(* The run is judged on the staging tree, before anything is replaced: every page in the
	   navigation must be there as a real page with every image it references beside it, and
	   every shared bundle a page names (three levels up, which a browser clamps to the root) must
	   be in the tree. Only a site that passes replaces the previous one. *)
	pageFile[entry_Association] := FileNameJoin[Join[{siteStage}, FileNameSplit[entry["id"] <> ".html"]]];
	bad = Select[pages, ! completeQ[pageFile[#]] &];
	Scan[
		With[{file = pageFile[#]},
			say["page ", #["id"], If[FileExistsQ[file] && FileByteCount[file] >= 2000,
				": " <> ToString[Length[missingImages[file]]] <> " of its " <> ToString[Length[imageRefs[file]]] <> " images missing",
				": missing or empty"]]] &,
		bad
	];
	bundleRefs[html_String] := DeleteDuplicates @ StringCases[Import[html, "Text"],
		("href=\"" | "src=\"") ~~ "../../../" ~~ Shortest[path__] ~~ "\"" :> First[StringSplit[path, "?"]]];
	missingBundles = DeleteDuplicates[Join @@ Map[
		Function[entry, Select[bundleRefs[pageFile[entry]], ! FileExistsQ[FileNameJoin[{siteStage, #}]] &]],
		Select[pages, FileExistsQ[pageFile[#]] &]
	]];
	Scan[say["a page references a shared asset the site does not have: ", #] &, missingBundles];
	siteBytes = Total[FileByteCount /@ Select[FileNames["*", siteStage, Infinity], FileExistsQ[#] && ! DirectoryQ[#] &]];
	say[Length[pages] - Length[bad], " of ", Length[pages], " pages complete, with every image they reference, ",
		Round[siteBytes / 1024^2], " MB in all"];
	If[bad =!= {} || missingBundles =!= {},
		say["incomplete site, left at ", siteStage, " for inspection; ", siteFinal, " is untouched; the render log is ", renderLog];
		Exit[1]
	];
	(* the previous site serves right up to this swap *)
	If[DirectoryQ[siteFinal], DeleteDirectory[siteFinal, DeleteContents -> True]];
	RenameDirectory[siteStage, siteFinal];
	say["site under ", siteFinal];
	say["serve it with scripts/docs_local.sh, or python3 -m http.server --directory ", siteFinal, " 8000"],

	(* site: deploy the shell and its notebook host page; the frame loads the resource's own pages *)
	Module[{deleteTree, deploy},
		deleteTree[object_] := (
			With[{children = Quiet @ CloudObjects[object]}, If[ListQ[children], deleteTree /@ children]];
			Quiet @ DeleteObject[object]
		);
		(* clear the directory, so a stale file cannot shadow a page *)
		say["clearing ", accountBase, "/", siteObject];
		deleteTree[CloudObject[siteObject]];
		deploy[content_, type_, path_String] := With[{result = CloudExport[content, type, CloudObject[siteObject <> "/" <> path], Permissions -> "Public"]},
			If[! MatchQ[result, _CloudObject], say[path, " failed to deploy: ", result]; Exit[1]];
			say["wrote ", First[result]];
			result];
		deploy[TemplateApply[StringTemplate[readAsset["docs_page.html"]], <|"BASE" -> base, "DOCS" -> docsPath, "IDS" -> idsJS|>],
			{"String", "text/html"}, "page.html"];
		deploy[indexHTML, {"String", "text/html"}, "index.html"];
		Print["published: ", accountBase, "/", siteObject]
	]
];
Exit[0]
