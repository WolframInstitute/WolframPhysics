# Wolfram Function Repository functions of the Wolfram Physics Project, swept by contributor

Sweep of the Wolfram Function Repository (WFR) for every function created for, or used by, the Wolfram Physics Project, organised by the three sub-sources that together cover the ground: the Physics Project's own function guide pages (the ground truth for the 2020 batch), the WFR category "Wolfram Physics Project", and a contributor sweep over every one of the 3320 published WFR function pages. The findings tables hold 113 WFR functions and 33 built-in symbols listed on the guide pages, 121 further WFR functions tagged in the category, and 82 further WFR functions found through the contributor sweep: 349 distinct symbols in all. A function appears in exactly one table (the first sub-source that lists it); the contributor index at the end gives the by-contributor view across all three. Descriptions are quoted from the source (the guide page where it gives one, otherwise the lead line of the WFR page). Every function marked seen was seen by me on its own WFR page, in the guide notebook, in the category JSON, or through a kernel ResourceObject evaluation; the Method section says which.

## Method

All scratch files live in the session scratchpad directory (/private/tmp/claude-501/-Users-swish-src-wolfram-WolframPhysics/afd62ccd-b6b1-4cdd-ab6e-411aab4a1e8a/scratchpad/). Sweep date: 16 September 2026.

### Sub-source 1: the Physics Project function guide (ground truth)

1. https://www.wolframphysics.org/functions/ returned HTTP 404 (WebFetch). A WebSearch restricted to wolframphysics.org ("wolframphysics.org functions Wolfram Function Repository WolframModel catalog") found https://www.wolframphysics.org/tools/ instead.
2. https://www.wolframphysics.org/tools/ (WebFetch): the "Guide to Wolfram Physics Project functions (Functions are automatically loaded from the Wolfram Function Repository)" link points at the cloud notebook https://www.wolframcloud.com/obj/wolframphysics/Tools/guide-page; the page also links https://www.wolframcloud.com/obj/wolframphysics/Tools/hands-on-introduction-to-the-wolfram-physics-project.nb.
3. guide.wls: Import of the guide-page URL as "Text" returned only the 517 KB cloud notebook HTML shell, so guide2.wls fetched the notebook itself with `CloudGet[CloudObject["https://www.wolframcloud.com/obj/wolframphysics/Tools/guide-page"]]` (the kernel is cloud-connected) and printed every cell's style, text and ButtonBox links (201 cells). The page title is "Wolfram Physics Project Functions"; its abstract reads "This page links to some of the functions in the Wolfram Function Repository created to support the Wolfram Physics Project, as well as some built-in Wolfram Language functions of particular relevance." Its section headings link to six sub-guide notebooks.
4. subguides.wls: CloudGet of the six sub-guides https://www.wolframcloud.com/obj/wolframphysics/Tools/wolfram-models (201 cells), multiway-systems (121), substitution-systems (93), additional-systems (109), combinators (117) and utilities (77), printing the GuideTitle, GuideAbstract, GuideFunctionsSubsection, GuideText and InlineGuideFunctionListing cells (subguides.out). Every function link is a ResourceFunction template (WFR) or a paclet:ref link (built-in), which is how the Source column was decided. Every function on the main guide page also appears on a sub-guide, so the sub-guides are the tables below.

### Sub-source 2: the WFR category "Wolfram Physics Project"

1. curl of https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel showed the category link https://resources.wolframcloud.com/FunctionRepository/category/wolfram-physics-project. That page is rendered client-side from the JSON it names in data-url: https://www.wolframcloud.com/obj/resourcesystem/published/FunctionRepository/category/wolfram-physics-project-data.json (110 KB, 221 resources, each with Name, UUID, Description, ReleaseDate and FilterCategories). Saved as cat.json, dumped to cat.tsv.

### Sub-source 3: contributor sweep

1. Publisher pages. https://resources.wolframcloud.com/publishers/resources?PublisherID=id is rendered from https://www.wolframcloud.com/obj/resourcesystem/api/1.0/PublicPublisherInformation?PublisherID=id. Queried for JonathanGorard, NikolayMurzin, ChristopherWolfram (all resolve but list no resources: WFR functions are published by the repository, the author is only "Contributed by" metadata on the function page), BradleyKlee (37 Demonstrations plus 43 functions), WillemNielsen (1 function), JesseFriedman (14 functions); WolframResearch, StephenWolfram, MaxPiskunov, EdPeggJr, XerxesArsiwalla, ManoNamuduri, HatemElshatlawy, JoseMartinGarcia, JonathanKogan returned a login or landing page (no such publisher ID). Publisher pages are therefore not the way to enumerate by contributor, and the sweep in step 3 replaces them.
2. WFR search API. The search page https://resources.wolframcloud.com/FunctionRepository/search/?i=term calls https://www.wolframcloud.com/obj/resourcesystem/api/1.0/SearchResources?ResourceTypes=Function&Format=json&Count=1000&WebFiltering=True&Query=term (parameter name read from results-controller.js). Multi-word queries are OR-ed, so only single-word and contributor-name results were used for discovery. Queries run (result counts in brackets): Gorard (87), Jonathan Gorard (91), Piskunov (11), Arsiwalla (5), Murzin (59), Elshatlawy (0), Namuduri (8), Pegg (127), Nielsen (5), Friedman (21), Klee (42), Kogan (0), Martin-Garcia (15), Christopher Wolfram (1000), Stephen Wolfram (1000), hypergraph (28), multiway (51), branchial (20), rulial (0), ruliad (0), ruliology (3), multicomputation (0), multicomputational (1), multispace (1), combinator (30), token (19), event (30), causal (25), hyperedge (4), rewrite (65), rewriting (65), glocal (10), ZX (5), foliation (5), Lorentz (5), sprinkling (6), Knuth-Bendix (9), confluence (4), Riemannian (15), spacetime (25), category (17), metamathematics (1), proof (51), Ricci (5), entanglement (2), quantum (101), Summer School (20), Winter School (10), WolframModel (91), growth rate (17), and the OR-ed multi-word queries Wolfram Physics, Wolfram Physics Project, Wolfram model, causal graph, causal set, substitution system, Turing machine, cellular automaton, string rewriting, hypergraph rewriting, graph rewriting, lambda calculus, tag system, register machine, Petri net, Hausdorff dimension, Lorentz factor, causal invariance, multiway system, Wolfram Summer School, Wolfram Institute, discrete, nested (all saved under search/). The union of the single-word and name results plus the category gave 582 candidates (candidates.json).
3. Full page sweep. https://resources.wolframcloud.com/FunctionRepository/autocomplete/allnames.json lists all 3320 published function names (allnames.json). getmeta.sh fetched every https://resources.wolframcloud.com/FunctionRepository/resources/Name page with curl (16 in parallel, pages/ directory) and extracted the "Contributed by" name (span class line name), the lead description (p class lead) and the latest version and date (meta_allwfr.txt, 3320 lines). Ten pages returned no function page: DateCeiling, DirectionControl, Einstoff, FindNucleicAcidBasePairs, MultipleZetaStar, MultiplePolyLogStar, NucleicAcidBasePairParameters, SimplicialHomologyGroup, SuzukiTrotterProduct, StringStyleJoin. The contributor field of all 3320 was then filtered for Gorard, Piskunov, Arsiwalla, Murzin, Elshatlawy, Namuduri, Stephen Wolfram, Christopher Wolfram, Physics Project, Kogan, Martin-Garcia, Nielsen, Friedman, Klee and Pegg, and every name and description was grepped for hypergraph, multiway, causal, branchial, Wolfram model, rewrit, substitution system, combinator, Turing machine, register machine, tag system, cellular automat, mobile automat, spacetime, Lorentz, Minkowski, causal set, Ricci, Riemann, Einstein, Christoffel, metric tensor, ZX, Petri, foliation, rulial, ruliad, multicomput, token, Hausdorff, geodesic, hyperbolic, Cayley, Knuth, confluen, proof, equational, axiom, metamath, category, functor, monoid, semigroup, entangle, quantum. The physics-relevant hits outside sub-sources 1 and 2 are the sub-source 3 tables; a contributor's unrelated functions (for example Jesse Friedman's geo and image utilities, most of Ed Pegg Jr's geometry, Nikolay Murzin's scoping utilities) are counted in the contributor index but not listed.

### Kernel evaluations (wolframscript -file, WL 15.0, cloud-connected)

1. keywords.wls over the 221 category names, keywords_extra.wls over 63 extra candidates and keywords_extra2.wls over 15 more: for each name `ResourceObject[name]` then the "Keywords", "ContributorInformation" ("ContributedBy"), "Categories" and "Description" properties, wrapped in TimeConstrained (keywords_cat.txt, keywords_extra.txt, keywords_extra2.txt). One category name (DynamicCellularAutomaton) timed out in the kernel but was seen on its web page; SuzukiTrotterProduct, whose web page is missing, resolved in the kernel with contributor Mads Bahrami. The Keywords informed the Topics column.
2. usage.wls: for the 33 built-in symbols the guide pages list, `` Names["System`" <> name] `` confirmed each exists in WL 15.0 (all 33 present) and `WolframLanguageData[name, "PlaintextUsage"]` (falling back to the usage message) gave the first sentence used as the description where the guide gives none (usage.txt).
3. ResourceSearch was not used (the SearchResources JSON API behind the website is the same index and is faster).

### Wolfram MCP

WolframLanguageContext, one query asking which resource functions exist for multiway systems, branchial graphs, rulial space, multicomputation and token-event graphs: it returned the ResourceSearch and ResourceFunction reference pages, the WolframPhysicsProjectStyleData page (its style types are BranchialGraph, CausalGraph, EvolutionCausalGraph, EvolutionObject, ExpressionsEventsGraph, GenericGraph, GenericLinePlot, HypergraphStructurePreservingGraph, Rule, RulialGraph, SetReplaceType, SpatialGraph, SpatialGraph3D, StatesGraph, StatesGraph3D, TypeGraph), and the WolframModelGlocalMultiwaySystem, WolframModelGlocalBranchialGraph, WolframModelData and CategoryResourceFunctions pages. Nothing it returned was outside the sweep.

### Reading the tables

Source is WFR for a Function Repository function (the URL is its resource page) and WL for a built-in symbol the guide lists alongside them (the URL is the reference page, not individually fetched). Description is the guide's own wording in the sub-source 1 tables, and the lead line of the WFR page elsewhere; where a guide lists a function without a description the WFR lead (or, for a built-in, the first sentence of its usage message from usage.wls) is given in parentheses. Topics in the sub-source 1 tables are the guide page and section headings the function sits under; elsewhere they were assigned from the function name and its WFR Keywords. Contributor is the "Contributed by" line of the WFR page. Status seen means the function was seen on its own WFR page, in the guide notebook, in the category JSON or through the kernel; nothing in this report is unconfirmed.

## Findings

### Sub-source 1: Physics Project guide pages (ground truth for the 2020 batch)

Each function is listed under the first sub-guide that carries it, with every guide section it appears in (including the main guide page) in the Topics column. Order within a table follows the guide.

#### Guide page: Wolfram Models & Analysis (https://www.wolframcloud.com/obj/wolframphysics/Tools/wolfram-models)

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| WolframModel | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel | Wolfram model evolution, causal graphs, etc. | main guide / Basic Model Implementation; Wolfram Models & Analysis / Basic Model Implementation | Wolfram Research | seen |
| WolframModelEvolutionObject | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelEvolutionObject | symbolic representation of Wolfram model evolution | main guide / Basic Model Implementation; Wolfram Models & Analysis / Basic Model Implementation | Stephen Wolfram & Max Piskunov | seen |
| WolframModelPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelPlot | visualization of Wolfram model hypergraphs | main guide / Hypergraphs; Wolfram Models & Analysis / Basic Model Implementation | Wolfram Research | seen |
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem | multiway Wolfram model evolution | main guide / Multiway Systems; Wolfram Models & Analysis / Multiway Evolution; Multiway Systems / General; Substitution Systems in the Wolfram Physics Project / Multiway Substitution Systems | Jonathan Gorard, Stephen Wolfram and Max Piskunov | seen |
| WolframModelData | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelData | data on Wolfram models in the Registry of Notable Universes | main guide / Wolfram Model Rules; Wolfram Models & Analysis / Rule Structure & Enumeration | Stephen Wolfram and Bob Sandheinrich | seen |
| CanonicalWolframModelRule | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalWolframModelRule | find a canonical form for a Wolfram model | Wolfram Models & Analysis / Rule Structure & Enumeration | Ed Pegg | seen |
| EnumerateWolframModelRules | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateWolframModelRules | enumerate possible rules with a given signature | main guide / Wolfram Model Rules; Wolfram Models & Analysis / Rule Structure & Enumeration | Ed Pegg Jr and Max Piskunov | seen |
| EnumerateRuleSignatures | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateRuleSignatures | enumerate possible signatures with given total elements | Wolfram Models & Analysis / Rule Structure & Enumeration; Substitution Systems in the Wolfram Physics Project / Rules & Initial Conditions | Stephen Wolfram | seen |
| RandomWolframModel | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RandomWolframModel | (no guide description; WFR page: Generate a random canonical Wolfram model rule with a particular signature) | main guide / Wolfram Model Rules; Wolfram Models & Analysis / Rule Structure & Enumeration | Stephen Wolfram & Max Piskunov | seen |
| ConnectedWolframModelQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ConnectedWolframModelQ | (no guide description; WFR page: Determine whether a Wolfram model rule is left-connected) | Wolfram Models & Analysis / Rule Structure & Enumeration | Max Piskunov | seen |
| CausalInvariantQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalInvariantQ | test if a rule is causal invariant | main guide / Multiway Systems; Wolfram Models & Analysis / Rule Structure & Enumeration; Multiway Systems / Branching & Causal Invariance; Substitution Systems in the Wolfram Physics Project / Causal Invariance, etc. | Jonathan Gorard | seen |
| RulePlot | WL | https://reference.wolfram.com/language/ref/RulePlot.html | give a visual representation of a Wolfram model rule | main guide / Wolfram Model Rules; Wolfram Models & Analysis / Rule Display & Formatting; Substitution Systems in the Wolfram Physics Project / Basic Evolution; Additional Systems / Turing Machines | Wolfram Research (built-in) | seen |
| WolframModelRuleForm | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelRuleForm | (no guide description; WFR page: Represent a Wolfram model in x, y, … letter form) | Wolfram Models & Analysis / Rule Display & Formatting; Wolfram Physics Project Utilities / Display Standardization | Stephen Wolfram | seen |
| WolframModelSignatureForm | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelSignatureForm | (no guide description; WFR page: Give the formatted form of a signature specification for a Wolfram model rule or state) | Wolfram Models & Analysis / Rule Display & Formatting; Wolfram Physics Project Utilities / Display Standardization | Stephen Wolfram | seen |
| WolframModelTraditionalForm | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelTraditionalForm | (no guide description; WFR page: Display a Wolfram model description in an analogue of traditional mathematical notation) | Wolfram Models & Analysis / Rule Display & Formatting; Wolfram Physics Project Utilities / Display Standardization | Stephen Wolfram and Jan Mangaldan | seen |
| EnumerateHypergraphs | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateHypergraphs | (no guide description; WFR page: Enumerate possible ordered hypergraphs with a given signature) | main guide / Hypergraphs; Wolfram Models & Analysis / Hypergraph Generation | Stephen Wolfram and Max Piskunov | seen |
| RandomHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RandomHypergraph | (no guide description; WFR page: Generate a random hypergraph) | Wolfram Models & Analysis / Hypergraph Generation | Stephen Wolfram | seen |
| CanonicalHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalHypergraph | convert a hypergraph to canonical form | main guide / Hypergraphs; Wolfram Models & Analysis / Hypergraph Generation | Ed Pegg Jr | seen |
| BranchialHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BranchialHypergraph | (no guide description; WFR page: Compute the branchial hypergraph of a graph) | Wolfram Models & Analysis / Hypergraph Generation | Nikolay Murzin | seen |
| ConnectedHypergraphQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ConnectedHypergraphQ | (no guide description; WFR page: Determine whether a hypergraph is connected) | main guide / Hypergraphs; Wolfram Models & Analysis / Hypergraph Properties | Stephen Wolfram | seen |
| HypergraphAdjacencyMatrix | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphAdjacencyMatrix | (no guide description; WFR page: Find the adjacency matrix for vertices in a hypergraph) | Wolfram Models & Analysis / Hypergraph Properties | Stephen Wolfram | seen |
| HypergraphNeighborhoods | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphNeighborhoods | (no guide description; WFR page: Enumerate all the neighborhoods of a hypergraph up to a given distance) | main guide / Hypergraphs; Wolfram Models & Analysis / Hypergraph Properties | Stephen Wolfram | seen |
| HypergraphNeighborhoodVolumes | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphNeighborhoodVolumes | (no guide description; WFR page: Find the volumes of successively larger neighborhoods around nodes in a hypergraph) | Wolfram Models & Analysis / Hypergraph Properties | Stephen Wolfram | seen |
| IsomorphicOrderedHypergraphQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IsomorphicOrderedHypergraphQ | (no guide description; WFR page: Determine whether two ordered (directed) hypergraphs are isomorphic) | Wolfram Models & Analysis / Hypergraph Isomorphism | Jonathan Gorard | seen |
| FindOrderedHypergraphIsomorphism | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindOrderedHypergraphIsomorphism | (no guide description; WFR page: Find isomorphisms between two ordered (directed) hypergraphs) | Wolfram Models & Analysis / Hypergraph Isomorphism | Jonathan Gorard | seen |
| IsomorphicHypergraphQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IsomorphicHypergraphQ | (no guide description; WFR page: Determine whether two orderless (undirected) hypergraphs are isomorphic) | Wolfram Models & Analysis / Hypergraph Isomorphism | Jonathan Gorard | seen |
| FindHypergraphIsomorphism | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindHypergraphIsomorphism | (no guide description; WFR page: Find all isomorphisms between two orderless (undirected) hypergraphs) | Wolfram Models & Analysis / Hypergraph Isomorphism | Jonathan Gorard | seen |
| HypergraphToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphToGraph | convert to an ordinary graph by turning hyperedges into subgraphs | Wolfram Models & Analysis / Conversion to Graphs | Stephen Wolfram | seen |
| SubsetReplace | WL | https://reference.wolfram.com/language/ref/SubsetReplace.html | (no guide description; usage: SubsetReplace[list, rules] replaces sublists in list according to the specified rule or list of rules.) | Wolfram Models & Analysis / Low-Level Update Operations | Wolfram Research (built-in) | seen |
| SubsetCases | WL | https://reference.wolfram.com/language/ref/SubsetCases.html | (no guide description; usage: SubsetCases[list, patt] gives a list of the sublists in list that match the pattern patt in any order.) | Wolfram Models & Analysis / Low-Level Update Operations | Wolfram Research (built-in) | seen |
| SubsetPosition | WL | https://reference.wolfram.com/language/ref/SubsetPosition.html | (no guide description; usage: SubsetPosition[list, sublist] gives a list of positions at which sublist appears in list in any order.) | Wolfram Models & Analysis / Low-Level Update Operations | Wolfram Research (built-in) | seen |
| GraphNeighborhoodVolumes | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphNeighborhoodVolumes | (no guide description; WFR page: Find the volumes of successively larger neighborhoods around nodes in a graph) | main guide / Graphs; Wolfram Models & Analysis / Graph Properties | Max Piskunov, Stephen Wolfram and Jan Mangaldan | seen |
| NeighborhoodGraph | WL | https://reference.wolfram.com/language/ref/NeighborhoodGraph.html | (no guide description; usage: NeighborhoodGraph[g, v] gives the graph neighborhood of a vertex v in the graph g.) | Wolfram Models & Analysis / Graph Properties | Wolfram Research (built-in) | seen |
| FindShortestPath | WL | https://reference.wolfram.com/language/ref/FindShortestPath.html | (no guide description; usage: FindShortestPath[g, s, t] finds the shortest path from source vertex s to target vertex t in the graph g.) | main guide / Graphs; Wolfram Models & Analysis / Graph Properties; Multiway Systems / Path Finding & Theorem Proving | Wolfram Research (built-in) | seen |
| FindLongestPath | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindLongestPath | (no guide description; WFR page: Find the longest path between two vertices in a directed acyclic graph) | Wolfram Models & Analysis / Graph Properties | Charles Pooh | seen |
| VertexCount | WL | https://reference.wolfram.com/language/ref/VertexCount.html | (no guide description; usage: VertexCount[g] gives a count of the number of vertices in the graph g.) | Wolfram Models & Analysis / Graph Properties | Wolfram Research (built-in) | seen |
| GraphDiameter | WL | https://reference.wolfram.com/language/ref/GraphDiameter.html | (no guide description; usage: GraphDiameter[g] gives the greatest distance between any pair of vertices in the graph g.) | Wolfram Models & Analysis / Graph Properties | Wolfram Research (built-in) | seen |
| GraphAntipodes | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphAntipodes | (no guide description; WFR page: Find a pair of vertices that are a maximum distance apart on a graph) | Wolfram Models & Analysis / Graph Properties | Stephen Wolfram and Jan Mangaldan | seen |
| GraphMinors | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphMinors | (no guide description; WFR page: Enumerate the graph minors of a graph) | Wolfram Models & Analysis / Graph Properties | Stephen Wolfram and Jan Mangaldan | seen |
| GraphPlot | WL | https://reference.wolfram.com/language/ref/GraphPlot.html | (no guide description; usage: GraphPlot[g] generates a plot of the graph g.) | Wolfram Models & Analysis / Graph Visualization | Wolfram Research (built-in) | seen |
| GraphPlot3D | WL | https://reference.wolfram.com/language/ref/GraphPlot3D.html | (no guide description; usage: GraphPlot3D[g] generates a 3D plot of the graph g.) | Wolfram Models & Analysis / Graph Visualization | Wolfram Research (built-in) | seen |
| LayeredGraphPlot | WL | https://reference.wolfram.com/language/ref/LayeredGraphPlot.html | (no guide description; usage: LayeredGraphPlot[g] generates a layered plot of the graph g.) | Wolfram Models & Analysis / Graph Visualization | Wolfram Research (built-in) | seen |
| LayeredGraphPlot3D | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LayeredGraphPlot3D | (no guide description; WFR page: Generate a layered 3D plot of a graph) | Wolfram Models & Analysis / Graph Visualization | Stephen Wolfram and Jan Mangaldan | seen |
| DistanceLayeredGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DistanceLayeredGraph | (no guide description; WFR page: Render a graph with vertices at heights based on their distance from the root) | Wolfram Models & Analysis / Graph Visualization | Stephen Wolfram and Jan Mangaldan | seen |
| Graph3D | WL | https://reference.wolfram.com/language/ref/Graph3D.html | (no guide description; usage: Graph3D[g] creates a graph with vertices and edges from the graph g and represented as a 3D plot.) | Wolfram Models & Analysis / Graph Visualization | Wolfram Research (built-in) | seen |
| GraphReconstructedSurface | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphReconstructedSurface | render a graph in 3D with an approximate surface | main guide / Graphs; Wolfram Models & Analysis / Graph Visualization | Stephen Wolfram and Jan Mangaldan | seen |
| GraphFunctionPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphFunctionPlot | visualize a function on a graph | main guide / Graphs; Wolfram Models & Analysis / Graph Visualization | Stephen Wolfram and Jan Mangaldan | seen |
| OrderedGraphModelPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/OrderedGraphModelPlot | visualize ordered trivalent graphs | Wolfram Models & Analysis / Ordered Trivalent Graph Models; Additional Systems / Ordered Trivalent Graph Models | Wolfram Physics Project Team | seen |
| TorusGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TorusGraph | (no guide description; WFR page: Create a grid graph of any dimension with the topology of a torus) | main guide / Graphs; Wolfram Models & Analysis / Graph Generation | Stephen Wolfram | seen |
| GeneralizedGridGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GeneralizedGridGraph | (no guide description; WFR page: Generates a generalized version of GridGraph) | main guide / Graphs; Wolfram Models & Analysis / Graph Generation | Max Piskunov | seen |
| HexagonalGridGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HexagonalGridGraph | (no guide description; WFR page: Generate a graph corresponding to a hexagonal grid) | Wolfram Models & Analysis / Graph Generation | Wolfram Research | seen |
| HexagonalTorusGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HexagonalTorusGraph | (no guide description; WFR page: Get a skew graph on a torus with a given number of hexagonal cells) | Wolfram Models & Analysis / Graph Generation | Ed Pegg Jr | seen |
| BuckyballGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BuckyballGraph | (no guide description; WFR page: Create a graph of an order-n buckyball) | Wolfram Models & Analysis / Graph Generation | Jan Mangaldan | seen |
| GeodesicSphereGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GeodesicSphereGraph | (no guide description; WFR page: Create a graph of an order-n geodesic sphere) | Wolfram Models & Analysis / Graph Generation | Jan Mangaldan | seen |
| RegularHyperbolicTilingGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RegularHyperbolicTilingGraph | (no guide description; WFR page: Create a graph of a regular hyperbolic tiling) | Wolfram Models & Analysis / Graph Generation | Wolfram Physics Project Team | seen |
| MeshConnectivityGraph | WL | https://reference.wolfram.com/language/ref/MeshConnectivityGraph.html | (no guide description; usage: MeshConnectivityGraph[mr, 0] gives a graph of points connected by lines.) | Wolfram Models & Analysis / Graph Generation | Wolfram Research (built-in) | seen |
| GraphicsMetricGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphicsMetricGraph | (no guide description; WFR page: Create a mesh representing a metric from a graphic) | Wolfram Models & Analysis / Graph Generation | Stephen Wolfram and Jan Mangaldan | seen |
| CurvedSpacetimeRegionSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvedSpacetimeRegionSprinkling | (no guide description; WFR page: Produce random causal graphs by sprinkling points into a specified region of a (potentially curved) spacetime) | Wolfram Models & Analysis / Causal Graph Generation | Jonathan Gorard | seen |
| CurvedSpacetimeSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvedSpacetimeSprinkling | (no guide description; WFR page: Produce random causal graphs by sprinkling points into a spacetime with a specified algebraic curvature function) | Wolfram Models & Analysis / Causal Graph Generation | Jonathan Gorard | seen |
| FlatSpacetimeSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FlatSpacetimeSprinkling | (no guide description; WFR page: Produce random causal graphs by sprinkling points into flat (Minkowski) spacetime) | Wolfram Models & Analysis / Causal Graph Generation | Jonathan Gorard | seen |
| CausalConnectionGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalConnectionGraph | summarize future overlaps in a causal graph | main guide / Graphs; Wolfram Models & Analysis / Causal Graph Generation | Stephen Wolfram with Jonathan Gorard and Max Piskunov | seen |
| ExtrinsicCurvedManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ExtrinsicCurvedManifoldToGraph | (no guide description; WFR page: Produce random spatial graphs by sprinkling points into a Riemannian manifold with an arbitrary extrinsic curvature) | Wolfram Models & Analysis / Spatial Graph Generation | Jonathan Gorard | seen |
| IntrinsicCurvedManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IntrinsicCurvedManifoldToGraph | (no guide description; WFR page: Produce random spatial graphs by sprinkling points into a Riemannian manifold with a specified intrinsic algebraic curvature function) | Wolfram Models & Analysis / Spatial Graph Generation | Jonathan Gorard | seen |
| FlatManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FlatManifoldToGraph | (no guide description; WFR page: Produce random spatial graphs by sprinkling points into a flat (Euclidean) Riemannian manifold) | Wolfram Models & Analysis / Spatial Graph Generation | Jonathan Gorard | seen |

#### Guide page: Multiway Systems (https://www.wolframcloud.com/obj/wolframphysics/Tools/multiway-systems)

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| MultiwayFunctionSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayFunctionSystem | multiway system based on a function with multiple results | Multiway Systems / Specialized Multiway Systems; Additional Systems / Multiway Systems | Jonathan Gorard and Stephen Wolfram | seen |
| MultiwayOperatorSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem | multiway system based on transformations of patterns | main guide / Other Computational Systems; Multiway Systems / Specialized Multiway Systems | Jonathan Gorard | seen |
| MultiwayTuringMachine | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine | (no guide description; WFR page: Simulate a nondeterministic Turing machine evolution as a multiway system) | main guide / Other Computational Systems; Multiway Systems / Specialized Multiway Systems; Additional Systems / Multiway Systems | Jonathan Gorard (with visualizations by Stephen Wolfram and Max Piskunov) | seen |
| MultiwayCombinator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayCombinator | combinator expression as a multiway system | Multiway Systems / Specialized Multiway Systems; Combinator Functions / Automated Theorem Proving | Jonathan Gorard | seen |
| MultiwayGroup | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayGroup | (no guide description; WFR page: Simulate an arbitrary (potentially abelian) group as a multiway system) | Multiway Systems / Specialized Multiway Systems; Additional Systems / Multiway Systems | Jonathan Gorard | seen |
| MultiwayMonoid | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayMonoid | (no guide description; WFR page: Simulate an arbitrary (potentially commutative) monoid as a multiway system) | Multiway Systems / Specialized Multiway Systems | Jonathan Gorard | seen |
| MultiwaySemigroup | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySemigroup | (no guide description; WFR page: Simulate an arbitrary (potentially commutative) semigroup as a multiway system) | Multiway Systems / Specialized Multiway Systems | Jonathan Gorard | seen |
| QuantumToMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumToMultiwaySystem | convert from a quantum circuit to a multiway system | main guide / Quantum Computing; Multiway Systems / Multiway System Generation | Jonathan Gorard | seen |
| AxiomaticTheory | WL | https://reference.wolfram.com/language/ref/AxiomaticTheory.html | axiom systems to be used in multiway operator systems | Multiway Systems / Multiway System Generation; Combinator Functions / Automated Theorem Proving | Wolfram Research (built-in) | seen |
| TotalCausalInvariantQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TotalCausalInvariantQ | (no guide description; WFR page: Determine whether a given multiway system is causal invariant) | Multiway Systems / Branching & Causal Invariance | Jonathan Gorard | seen |
| BranchPairs | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairs | (no guide description; WFR page: Compute branch pairs for a given multiway system) | main guide / Multiway Systems; Multiway Systems / Branching & Causal Invariance | Jonathan Gorard | seen |
| BranchPairResolutions | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairResolutions | (no guide description; WFR page: Compute branch pair resolutions for a given multiway system) | Multiway Systems / Branching & Causal Invariance | Jonathan Gorard | seen |
| CanonicalBranchPairs | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalBranchPairs | (no guide description; WFR page: Compute canonical branch pairs for a given multiway system) | Multiway Systems / Branching & Causal Invariance | Jonathan Gorard | seen |
| KnuthBendixCompletion | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/KnuthBendixCompletion | (no guide description; WFR page: Compute the Knuth-Bendix completion for a given multiway system) | Multiway Systems / Branching & Causal Invariance | Jonathan Gorard | seen |
| CanonicalKnuthBendixCompletion | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalKnuthBendixCompletion | (no guide description; WFR page: Compute the canonical Knuth-Bendix completion for a given multiway system) | Multiway Systems / Branching & Causal Invariance | Jonathan Gorard | seen |
| FindStringProof | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindStringProof | generate a proof object representing reachability of states | Multiway Systems / Path Finding & Theorem Proving | Jonathan Gorard | seen |
| FindListProof | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindListProof | (no guide description; WFR page: Try to find a proof of equivalence between lists in a given multiway system) | Multiway Systems / Path Finding & Theorem Proving | Jonathan Gorard | seen |
| FindWolframModelProof | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindWolframModelProof | (no guide description; WFR page: Try to find a proof of equivalence between hypergraphs in a given multiway Wolfram model system) | Multiway Systems / Path Finding & Theorem Proving | Jonathan Gorard | seen |
| FindEquationalProof | WL | https://reference.wolfram.com/language/ref/FindEquationalProof.html | (no guide description; usage: FindEquationalProof[thm, axms] tries to find an equational proof of the symbolic theorem thm using the axioms axms.) | Multiway Systems / Path Finding & Theorem Proving | Wolfram Research (built-in) | seen |
| FindEquationalCounterexample | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalCounterexample | find a counterexample to a hypothesis | Multiway Systems / Path Finding & Theorem Proving | Jonathan Gorard | seen |
| GenerationalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GenerationalMultiwaySystem | multiway system with "generational states" | Multiway Systems / Additional String Multiway System Functions | Jonathan Gorard and Stephen Wolfram | seen |
| MultiwayEvolutionPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayEvolutionPlot | specialized visualizations for string multiway systems | Multiway Systems / Additional String Multiway System Functions | Stephen Wolfram and Jonathan Gorard | seen |
| StringOverlapsQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StringOverlapsQ | (no guide description; WFR page: Test whether a string or strings have overlaps) | Multiway Systems / String Overlap Functions; Substitution Systems in the Wolfram Physics Project / Causal Invariance, etc. | Stephen Wolfram | seen |
| StringOverlaps | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StringOverlaps | (no guide description; WFR page: Find substrings that overlap between strings) | Multiway Systems / String Overlap Functions; Substitution Systems in the Wolfram Physics Project / Causal Invariance, etc. | Stephen Wolfram | seen |
| OverlapFreeStringTuples | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/OverlapFreeStringTuples | (no guide description; WFR page: Find all overlap-free strings of a specified length) | Multiway Systems / String Overlap Functions; Substitution Systems in the Wolfram Physics Project / Causal Invariance, etc. | Stephen Wolfram | seen |

#### Guide page: Substitution Systems in the Wolfram Physics Project (https://www.wolframcloud.com/obj/wolframphysics/Tools/substitution-systems)

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| SubstitutionSystem | WL | https://reference.wolfram.com/language/ref/SubstitutionSystem.html | evolution of string substitution systems | main guide / String Substitution Systems; Substitution Systems in the Wolfram Physics Project / Basic Evolution | Wolfram Research (built-in) | seen |
| SubstitutionSystemPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemPlot | neighbor-independent substitution system visualization | Substitution Systems in the Wolfram Physics Project / Basic Evolution | Stephen Wolfram and Jan Mangaldan | seen |
| SequentialSubstitutionSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SequentialSubstitutionSystem | update at each position in left-right order | Substitution Systems in the Wolfram Physics Project / Alternate Updating Orders | Stephen Wolfram | seen |
| PrioritizedSubstitutionSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/PrioritizedSubstitutionSystem | update at specified positions | Substitution Systems in the Wolfram Physics Project / Alternate Updating Orders | Stephen Wolfram and Jan Mangaldan | seen |
| SubstitutionSystemCausalGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalGraph | generate a causal graph for a substitution system | main guide / String Substitution Systems; Substitution Systems in the Wolfram Physics Project / Causal Graphs, etc. | Wolfram Physics Project Team | seen |
| SubstitutionSystemCausalEvolution | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalEvolution | evolution including causal information | Substitution Systems in the Wolfram Physics Project / Causal Graphs, etc. | Wolfram Physics Project Team | seen |
| SubstitutionSystemCausalPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalPlot | visualize evolution including causal information | Substitution Systems in the Wolfram Physics Project / Causal Graphs, etc. | Wolfram Physics Project Team | seen |
| EnumerateSubstitutionSystemRules | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateSubstitutionSystemRules | enumerate rules with a given signature | main guide / String Substitution Systems; Substitution Systems in the Wolfram Physics Project / Rules & Initial Conditions | Stephen Wolfram and Jan Mangaldan | seen |
| RandomSubstitutionSystemRule | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RandomSubstitutionSystemRule | random rule with a given signature | Substitution Systems in the Wolfram Physics Project / Rules & Initial Conditions | Stephen Wolfram | seen |
| StringTuples | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StringTuples | enumerate possible tuples of a given set of characters | Substitution Systems in the Wolfram Physics Project / Rules & Initial Conditions | Stephen Wolfram & Jan Mangaldan | seen |

#### Guide page: Wolfram Physics Project: Additional Systems (https://www.wolframcloud.com/obj/wolframphysics/Tools/additional-systems)

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| CellularAutomaton | WL | https://reference.wolfram.com/language/ref/CellularAutomaton.html | ordinary cellular automaton evolution in any number of dimensions | Additional Systems / Cellular Automata | Wolfram Research (built-in) | seen |
| BlockCellularAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BlockCellularAutomaton | cellular automaton based on block updating | Additional Systems / Cellular Automata | Wolfram Research | seen |
| CellularAutomatonNumber | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CellularAutomatonNumber | find a rule number from an explicit rule specification | Additional Systems / Cellular Automata | Wolfram Physics Project Team | seen |
| CellularAutomatonFromNumber | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CellularAutomatonFromNumber | find an explicit rule specification from a rule number | Additional Systems / Cellular Automata | Wolfram Physics Project Team | seen |
| SequentialCellularAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SequentialCellularAutomaton | cellular automaton with specified cell updating order | Additional Systems / Sequential Versions | Stephen Wolfram | seen |
| MobileAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomaton | mobile automaton evolution | Additional Systems / Sequential Versions | Stephen Wolfram and Jan Mangaldan | seen |
| MobileAutomatonPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomatonPlot | plot of mobile automaton evolution | Additional Systems / Sequential Versions | Stephen Wolfram and Jan Mangaldan | seen |
| IteratedFiniteAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IteratedFiniteAutomaton | iteratively apply a transducer finite automaton | Additional Systems / Sequential Versions | Stephen Wolfram | seen |
| TuringMachine | WL | https://reference.wolfram.com/language/ref/TuringMachine.html | Turing machine evolution (including 2D, etc.) | Additional Systems / Turing Machines | Wolfram Research (built-in) | seen |
| TuringMachineCausalGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineCausalGraph | causal graph for Turing machine evolution | main guide / Other Computational Systems; Additional Systems / Turing Machines | Wolfram Research | seen |
| TuringMachineFromNumber | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineFromNumber | (no guide description; WFR page: Convert numbers specifying a Turing machine into an explicit list of rules) | Additional Systems / Turing Machines | Jan Mangaldan and Mano Namuduri (original content by Stephen Wolfram) | seen |
| MakeZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MakeZXDiagram | make a ZX-diagram from a quantum circuit description, etc. | Additional Systems / Quantum Information Systems | Jonathan Gorard and Manojna Namuduri (with additional contributions by Xerxes Arsiwalla) | seen |

#### Guide page: Combinator Functions (https://www.wolframcloud.com/obj/wolframphysics/Tools/combinators)

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| Application | WL | https://reference.wolfram.com/language/ref/Application.html | combinator application operator | Combinator Functions / Combinatory Terms | Wolfram Research (built-in) | seen |
| CombinatorS | WL | https://reference.wolfram.com/language/ref/CombinatorS.html | Schönfinkel basic combinators | main guide / Combinator Systems; Combinator Functions / Combinatory Terms | Wolfram Research (built-in) | seen |
| CombinatorK | WL | https://reference.wolfram.com/language/ref/CombinatorK.html | Schönfinkel basic combinators | main guide / Combinator Systems; Combinator Functions / Combinatory Terms | Wolfram Research (built-in) | seen |
| CombinatorB | WL | https://reference.wolfram.com/language/ref/CombinatorB.html | (no guide description; usage: CombinatorB represents the B combinator.) | Combinator Functions / Combinatory Terms | Wolfram Research (built-in) | seen |
| CombinatorC | WL | https://reference.wolfram.com/language/ref/CombinatorC.html | (no guide description; usage: CombinatorC represents the C combinator.) | Combinator Functions / Combinatory Terms | Wolfram Research (built-in) | seen |
| CombinatorI | WL | https://reference.wolfram.com/language/ref/CombinatorI.html | (no guide description; usage: CombinatorI represents the I combinator.) | Combinator Functions / Combinatory Terms | Wolfram Research (built-in) | seen |
| CombinatorW | WL | https://reference.wolfram.com/language/ref/CombinatorW.html | (no guide description; usage: CombinatorW represents the W combinator.) | Combinator Functions / Combinatory Terms | Wolfram Research (built-in) | seen |
| CombinatorY | WL | https://reference.wolfram.com/language/ref/CombinatorY.html | (no guide description; usage: CombinatorY represents the Y combinator.) | Combinator Functions / Combinatory Terms | Wolfram Research (built-in) | seen |
| EnumerateCombinators | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateCombinators | enumerate combinators involving a given number of symbols | Combinator Functions / Construction and Enumeration | Wolfram Research | seen |
| SKCombinatorCompile | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SKCombinatorCompile | converts any combinator expression to the SK basis | Combinator Functions / Construction and Enumeration | Wolfram Research | seen |
| ChurchCombinator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ChurchCombinator | (no guide description; WFR page: Evaluate the Church combinator) | Combinator Functions / Construction and Enumeration | Wolfram Research | seen |
| Construct | WL | https://reference.wolfram.com/language/ref/Construct.html | (no guide description; usage: Construct[f, x] gives f[x].) | Combinator Functions / Construction and Enumeration | Wolfram Research (built-in) | seen |
| Function | WL | https://reference.wolfram.com/language/ref/Function.html | (no guide description; usage: body& or Function[body] is a pure (or "anonymous") function.) | Combinator Functions / Construction and Enumeration | Wolfram Research (built-in) | seen |
| Groupings | WL | https://reference.wolfram.com/language/ref/Groupings.html | (no guide description; usage: Groupings[n, k] gives a list of all possible groupings of 1, …, n taken k at a time.) | Combinator Functions / Construction and Enumeration | Wolfram Research (built-in) | seen |
| CombinatorFixedPoint | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorFixedPoint | apply combinator rules until a fixed point is reached | main guide / Combinator Systems; Combinator Functions / Combinator Evolution | Wolfram Research | seen |
| CombinatorFixedPointList | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorFixedPointList | apply combinator rules until a fixed point is reached | Combinator Functions / Combinator Evolution | Wolfram Research | seen |
| CombinatorEvolve | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolve | apply combinators rules for a certain number of steps | main guide / Combinator Systems; Combinator Functions / Combinator Evolution | Wolfram Research | seen |
| CombinatorEvolveList | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolveList | apply combinators rules for a certain number of steps | Combinator Functions / Combinator Evolution | Wolfram Research | seen |
| TraversalOrderSelect | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TraversalOrderSelect | (no guide description; WFR page: Choose positions of an expression by certain traversal-ordering criteria) | Combinator Functions / Combinator Evolution | Wolfram Research | seen |
| CombinatorMatches | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorMatches | (no guide description; WFR page: Get an association of match positions to rule matches, sorted according to traversal scheme, for a combinator expression) | Combinator Functions / Combinator Evolution | Wolfram Research | seen |
| CombinatorStep | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorStep | (no guide description; WFR page: Perform an update to a combinator expression based on defined rules and traversal scheme) | Combinator Functions / Combinator Evolution | Wolfram Research | seen |
| CombinatorPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorPlot | visualize a combinator expression | main guide / Combinator Systems; Combinator Functions / Combinator Visualization | Wolfram Research | seen |
| CombinatorEvolutionPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolutionPlot | visualize combinator evolution | main guide / Combinator Systems; Combinator Functions / Combinator Visualization | Wolfram Research | seen |
| CombinatorExpressionGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorExpressionGraph | show a combinator expression as a graph | Combinator Functions / Combinator Visualization | Wolfram Research | seen |
| CombinatorBracketsPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorBracketsPlot | show a combinator expression using brackets | Combinator Functions / Combinator Visualization | Wolfram Research | seen |
| FindCombinatorProof | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindCombinatorProof | generate proofs in combinatory logic | Combinator Functions / Automated Theorem Proving | Jonathan Gorard | seen |

#### Guide page: Wolfram Physics Project Utilities (https://www.wolframcloud.com/obj/wolframphysics/Tools/utilities)

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| WolframPhysicsProjectStyleData | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframPhysicsProjectStyleData | standardized rendering styles | main guide / Computational Experiment Utilities; Wolfram Physics Project Utilities / Display Standardization | Wolfram Research | seen |
| ParallelMapMonitored | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ParallelMapMonitored | run a parallel computation with dynamic monitoring | main guide / Computational Experiment Utilities; Wolfram Physics Project Utilities / Computer Experiment Utilities | Max Piskunov | seen |
| InteractiveListSelector | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/InteractiveListSelector | render a list with interactive element selection | main guide / Computational Experiment Utilities; Wolfram Physics Project Utilities / Computer Experiment Utilities | Lou D'Andria and Stephen Wolfram | seen |
| LogDifferences | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LogDifferences | compute log differences (e.g. for dimension estimates) | main guide / Sequence & Growth Analysis Utilities; Wolfram Physics Project Utilities / Sequence & Growth Analysis | Stephen Wolfram | seen |
| RaggedMeanAround | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RaggedMeanAround | compute averages of sequences of differing lengths | main guide / Sequence & Growth Analysis Utilities; Wolfram Physics Project Utilities / Sequence & Growth Analysis | Stephen Wolfram | seen |
| Differences | WL | https://reference.wolfram.com/language/ref/Differences.html | (no guide description; usage: Differences[list] gives the successive differences of elements in list.) | Wolfram Physics Project Utilities / Sequence & Growth Analysis | Wolfram Research (built-in) | seen |
| Ratios | WL | https://reference.wolfram.com/language/ref/Ratios.html | (no guide description; usage: Ratios[list] gives the successive ratios of elements in list.) | Wolfram Physics Project Utilities / Sequence & Growth Analysis | Wolfram Research (built-in) | seen |
| FindLinearRecurrence | WL | https://reference.wolfram.com/language/ref/FindLinearRecurrence.html | (no guide description; usage: FindLinearRecurrence[list] finds if possible the minimal linear recurrence that generates list.) | main guide / Sequence & Growth Analysis Utilities; Wolfram Physics Project Utilities / Sequence & Growth Analysis | Wolfram Research (built-in) | seen |
| FindTransientRepeat | WL | https://reference.wolfram.com/language/ref/FindTransientRepeat.html | (no guide description; usage: FindTransientRepeat[list, n] returns a pair of lists {transient, repeat} where the elements of repeat occur successively at least n times after the elements of the transient part of list.) | Wolfram Physics Project Utilities / Sequence & Growth Analysis | Wolfram Research (built-in) | seen |

### Sub-source 2: WFR category "Wolfram Physics Project", functions not on the guide pages

The category JSON lists 221 functions; 100 of them are on the guide pages above. The remaining 121 are grouped here by topic. Release dates come from the category JSON.

#### Wolfram models

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| WolframModelLorentzFactor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelLorentzFactor | Calculate the Lorentz factor of a Lorentz-transformed Wolfram Model causal graph | Wolfram models, causal graphs, relativity (category: Wolfram Physics Project; released 2022-06-17) | Tom Lee, Jon Lederman | seen |

#### Hypergraphs

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| AdjacencyHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AdjacencyHypergraph | Compute the hypergraph with a specified adjacency tensor | hypergraphs, tensors (category: Wolfram Physics Project; released 2021-03-17) | Jonathan Gorard | seen |
| AdjacencyTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AdjacencyTensor | Compute the adjacency tensor of an arbitrary hypergraph | hypergraphs, tensors (category: Wolfram Physics Project; released 2021-03-17) | Jonathan Gorard | seen |
| FindCanonicalHypergraphIsomorphism | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindCanonicalHypergraphIsomorphism | Find a canonical isomorphism between hypergraphs | hypergraphs, isomorphism (category: Wolfram Physics Project; released 2022-05-09) | Nikolay Murzin | seen |
| KirchhoffHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/KirchhoffHypergraph | Compute the hypergraph with a specified Kirchhoff tensor (Laplacian) | hypergraphs, tensors (category: Wolfram Physics Project; released 2021-03-17) | Jonathan Gorard | seen |
| KirchhoffTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/KirchhoffTensor | Compute the Kirchhoff tensor (Laplacian) of an arbitrary hypergraph | hypergraphs, tensors (category: Wolfram Physics Project; released 2021-03-17) | Jonathan Gorard | seen |

#### Multiway systems

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| DepthFirstSearch | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DepthFirstSearch | Search through a multiway space to find special termination points | multiway systems, search (category: Wolfram Physics Project; released 2022-07-25) | Bradley Klee | seen |
| MultispacePlot3D | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultispacePlot3D | Plot multispace in 3D | multiway systems, multispace, graph visualization (category: Wolfram Physics Project; released 2020-07-17) | Nikolay Murzin | seen |
| MultiwayDeletionsGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayDeletionsGraph | Explore graph traversals while deleting visited components | multiway systems, graphs (category: Wolfram Physics Project; released 2022-06-14) | Bradley Klee | seen |

#### Glocal multiway systems

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| CombinatorGlocalBranchialGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorGlocalBranchialGraph | Generate a graph of branch pair ancestry for a combinator evaluation "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2022-01-03) | Jonathan Gorard | seen |
| CombinatorGlocalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorGlocalMultiwaySystem | Simulate the evaluation of a combinator expression as a "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2022-01-03) | Jonathan Gorard | seen |
| ListGlocalBranchialGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ListGlocalBranchialGraph | Generate a graph of branch pair ancestry for a list substitution "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2021-10-26) | Jonathan Gorard | seen |
| ListGlocalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ListGlocalMultiwaySystem | Simulate the evolution of a list substitution system as a "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2021-10-26) | Jonathan Gorard | seen |
| StringGlocalBranchialGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StringGlocalBranchialGraph | Generate a graph of branch pair ancestry for a string substitution "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2021-10-26) | Jonathan Gorard | seen |
| StringGlocalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StringGlocalMultiwaySystem | Simulate the evolution of a string substitution system as a "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2021-10-26) | Jonathan Gorard | seen |
| TuringMachineGlocalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineGlocalMultiwaySystem | Simulate the evolution of a nondeterministic Turing machine as a "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2021-12-13) | Jonathan Gorard | seen |
| WolframModelGlocalBranchialGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelGlocalBranchialGraph | Generate a graph of branch pair ancestry for a Wolfram model "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2021-11-22) | Jonathan Gorard | seen |
| WolframModelGlocalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelGlocalMultiwaySystem | Simulate the evolution of a Wolfram model system as a "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation (category: Wolfram Physics Project; released 2021-11-22) | Jonathan Gorard | seen |

#### Token-event graphs

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| TokenEventGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph | Generate a token-event graph for multicomputational evolution according to particular rules | token-event graphs, multicomputation, causal graphs (category: Wolfram Physics Project; released 2021-10-07) | Stephen Wolfram and Nikolay Murzin | seen |

#### Branchial graphs

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| BranchialGraphs | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BranchialGraphs | Depict branch-like connections between components of a directed acyclic graph | branchial graphs, graphs (category: Wolfram Physics Project; released 2022-06-27) | Bradley Klee | seen |

#### Causal graphs

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| CausalGraphEntanglementEntropyGeneralized | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalGraphEntanglementEntropyGeneralized | Compute the entanglement entropy of a certain subgraph of a causal graph (or subset of a causal set) using the generalized/robust approach | causal graphs, quantum, entanglement entropy (category: Wolfram Physics Project; released 2021-11-09) | Jonathan Gorard and Julia Dannemann-Freitag | seen |
| CausalGraphEntanglementEntropyNaive | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalGraphEntanglementEntropyNaive | Compute the entanglement entropy of a certain subgraph of a causal graph (or subset of a causal set) using the naive/fragile approach | causal graphs, quantum, entanglement entropy (category: Wolfram Physics Project; released 2021-12-07) | Jonathan Gorard and Julia Dannemann-Freitag | seen |
| FoliationClass | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FoliationClass | Generate the foliation set from a causal graph | causal graphs, foliations (category: Wolfram Physics Project; released 2022-06-07) | Tom Lee, Jon Lederman | seen |
| GraphFoliations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphFoliations | Enumerate possible foliations of a directed acyclic graph | causal graphs, foliations (category: Wolfram Physics Project; released 2021-11-07) | Nikolay Murzin | seen |
| LorentzCoordinate2D | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LorentzCoordinate2D | Generate the spatial and temporal coordinate information of a Lorentz-boosted causal graph | causal graphs, relativity (category: Wolfram Physics Project; released 2022-06-14) | Tom Lee, Jon Lederman | seen |
| SimpleCausalGraphCoordinates | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SimpleCausalGraphCoordinates | Generate Cartesian-like coordinates for a simple two-dimensional causal graph | causal graphs, relativity (category: Wolfram Physics Project; released 2021-10-04) | Tom Lee, Jon Lederman | seen |
| TraceCausalGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TraceCausalGraph | Build a causal graph from an expression evaluation trace | causal graphs, multicomputation (category: Wolfram Physics Project; released 2023-10-04) | Nik Murzin | seen |
| VertexStratify | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/VertexStratify | Partition the vertices of a directed acyclic graph into time-ordered level sets | causal graphs, foliations (category: Wolfram Physics Project; released 2022-06-17) | Bradley Klee | seen |

#### Causal sets

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| CurvedSpacetimeTriangulation | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvedSpacetimeTriangulation | Produce causal graphs by dynamically triangulating a specified region of a (potentially curved) spacetime | causal sets, causal graphs (category: Wolfram Physics Project; released 2021-07-23) | Jonathan Gorard | seen |
| FlatSpacetimeTriangulation | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FlatSpacetimeTriangulation | Produce causal graphs by dynamically triangulating a flat (Minkowski) spacetime | causal sets, causal graphs (category: Wolfram Physics Project; released 2021-07-23) | Jonathan Gorard | seen |

#### Spatial graphs

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| ParametricManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ParametricManifoldToGraph | Generate the graph associated with a parametric description of a manifold | spatial graphs, geometry (category: Wolfram Physics Project; released 2021-08-09) | Samuele Mongodi | seen |

#### Dimension estimation

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| WolframHausdorffDimension | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframHausdorffDimension | Compute the Wolfram–Hausdorff dimension of a graph and its associated properties | dimension estimation, graphs, Wolfram models (category: Wolfram Physics Project; released 2021-03-22) | Jonathan Gorard | seen |

#### Curvature

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| WolframRicciCurvatureScalar | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureScalar | Compute the Wolfram–Ricci scalar curvature of a graph and its associated properties | curvature, graphs, Wolfram models (category: Wolfram Physics Project; released 2021-03-16) | Jonathan Gorard | seen |
| WolframRicciCurvatureTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureTensor | Compute projections of the Wolfram–Ricci curvature tensor of a graph and many associated properties | curvature, graphs, Wolfram models (category: Wolfram Physics Project; released 2021-03-16) | Jonathan Gorard | seen |

#### General relativity

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| ADMDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ADMDecomposition | Represent a canonical decomposition of the metric for a Riemannian or pseudo-Riemannian manifold via the ADM formalism | general relativity, tensors (category: Wolfram Physics Project; released 2023-03-22) | Jonathan Gorard | seen |
| ChristoffelSymbols | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ChristoffelSymbols | Represent the Christoffel symbols for (the Levi-Civita connection over) a Riemannian or pseudo-Riemannian manifold | general relativity, tensors (category: Wolfram Physics Project; released 2023-04-19) | Jonathan Gorard | seen |
| DiscreteHypersurfaceDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DiscreteHypersurfaceDecomposition | Decompose a Riemannian or pseudo-Riemannian manifold into a union of discrete hypersurfaces | general relativity, causal sets (category: Wolfram Physics Project; released 2023-03-27) | Jonathan Gorard | seen |
| EinsteinTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EinsteinTensor | Represent the Einstein curvature tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity, tensors (category: Wolfram Physics Project; released 2023-03-01) | Jonathan Gorard | seen |
| ExtrinsicCurvatureTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ExtrinsicCurvatureTensor | Represent the extrinsic curvature tensor field for a Riemannian submanifold | general relativity, tensors (category: Wolfram Physics Project; released 2023-09-22) | Jonathan Gorard | seen |
| MetricTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MetricTensor | Represent a metric tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity, tensors (category: Wolfram Physics Project; released 2023-01-09) | Jonathan Gorard | seen |
| RicciTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RicciTensor | Represent the Ricci curvature tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity, tensors (category: Wolfram Physics Project; released 2023-01-27) | Jonathan Gorard | seen |
| RiemannTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RiemannTensor | Represent the Riemann curvature tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity, tensors (category: Wolfram Physics Project; released 2020-10-06) | Jonathan Gorard | seen |
| SolveVacuumADMEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SolveVacuumADMEquations | Determine whether a given ADM decomposition is a solution to the vacuum ADM equations | general relativity, tensors (category: Wolfram Physics Project; released 2023-08-21) | Jonathan Gorard | seen |
| SolveVacuumEinsteinEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SolveVacuumEinsteinEquations | Determine whether a given Riemannian or pseudo-Riemannian manifold is a solution to the vacuum Einstein field equations | general relativity, tensors (category: Wolfram Physics Project; released 2023-02-27) | Jonathan Gorard | seen |
| StressEnergyTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StressEnergyTensor | Represent a stress-energy tensor (field) over a Riemannian or pseudo-Riemannian manifold | general relativity, tensors (category: Wolfram Physics Project; released 2023-03-22) | Jonathan Gorard | seen |

#### Quantum

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| QuantumDiscreteOperatorToZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteOperatorToZXDiagram | Convert a discrete quantum operator into a ZX-diagram | quantum, ZX-calculus (category: Wolfram Physics Project; released 2021-06-08) | Jonathan Gorard (with modifications by Manojna Namuduri) | seen |
| QuantumDiscreteStateToZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteStateToZXDiagram | Convert a pure quantum discrete state into a ZX-diagram | quantum, ZX-calculus (category: Wolfram Physics Project; released 2021-04-26) | Jonathan Gorard | seen |
| SuzukiTrotterProduct | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SuzukiTrotterProduct | Construct Suzuki–Trotter products and analyze scaling, leading commutators and matrix realizations | quantum, operator algebra (category: Wolfram Physics Project; released 2026-08-24) | Mads Bahrami | seen |
| ZXDiagramToQuantumDiscreteOperator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ZXDiagramToQuantumDiscreteOperator | Convert a ZX-diagram into a discrete quantum operator | quantum, ZX-calculus (category: Wolfram Physics Project; released 2021-06-08) | Jonathan Gorard (with modifications by Manojna Namuduri) | seen |
| ZXDiagramToQuantumDiscreteState | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ZXDiagramToQuantumDiscreteState | Convert a ZX-diagram into a pure quantum discrete state | quantum, ZX-calculus (category: Wolfram Physics Project; released 2021-04-26) | Jonathan Gorard | seen |

#### Category theory

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| AbstractCategory | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractCategory | Make an abstract model of a category (i.e. a collection of objects and morphisms obeying associativity and identity axioms) | category theory (category: Wolfram Physics Project; released 2022-04-06) | Jonathan Gorard | seen |
| AbstractCoproduct | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractCoproduct | Represent the abstract coproduct of an arbitrary collection of objects in an abstract category | category theory (category: Wolfram Physics Project; released 2022-04-22) | Jonathan Gorard | seen |
| AbstractFunctor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractFunctor | Make an abstract model of a functor (i.e. a homomorphism between abstract categories) | category theory (category: Wolfram Physics Project; released 2022-05-09) | Jonathan Gorard | seen |
| AbstractProduct | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractProduct | Represent the abstract product of an arbitrary collection of objects in an abstract category | category theory (category: Wolfram Physics Project; released 2022-04-22) | Jonathan Gorard | seen |
| AbstractPullback | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractPullback | Represent the abstract pullback of a collection of morphisms with common codomain in an abstract category | category theory (category: Wolfram Physics Project; released 2022-04-25) | Jonathan Gorard | seen |
| AbstractPushout | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractPushout | Represent the abstract pushout of a collection of morphisms with common domain in an abstract category | category theory (category: Wolfram Physics Project; released 2022-04-25) | Jonathan Gorard | seen |
| AbstractQuiver | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractQuiver | Make an abstract model of a quiver (i.e. a directed multigraph) that forms the basis of an abstract category | category theory (category: Wolfram Physics Project; released 2022-03-28) | Jonathan Gorard | seen |
| AbstractStrictMonoidalCategory | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractStrictMonoidalCategory | Make an abstract model of a category equipped with a strictly associative and unital tensor product structure | category theory (category: Wolfram Physics Project; released 2022-06-06) | Jonathan Gorard | seen |

#### Combinators

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| CombinatorConvert | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorConvert | Convert between different combinator formats | combinators (category: Wolfram Physics Project; released 2021-03-10) | Mano Namuduri and Jan Mangaldan | seen |
| CombinatorEncode | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEncode | Encode an SK combinator expression into a list of 0s and 1s | combinators (category: Wolfram Physics Project; released 2020-11-03) | Daniel Sanchez | seen |
| CombinatorEvolutionGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolutionGraph | Visualize the state transformations and causal structure of a combinator evolution | combinators, causal graphs (category: Wolfram Physics Project; released 2021-03-08) | Wolfram Research | seen |
| CombinatorToDAG | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorToDAG | Convert a combinator expression to a directed acyclic graph (DAG) | combinators, graphs (category: Wolfram Physics Project; released 2021-02-10) | Wolfram Research | seen |
| CombinatorTraditionalForm | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorTraditionalForm | Display a combinator expression in a default styled form | combinators (category: Wolfram Physics Project; released 2021-03-08) | Wolfram Research | seen |
| SCombinatorHaltsQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SCombinatorHaltsQ | Test whether evolution of an S combinator expression will halt | combinators, ruliology (category: Wolfram Physics Project; released 2021-03-08) | Wolfram Research | seen |
| SKCombinatorLeftmostOutermostFinalExpression | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SKCombinatorLeftmostOutermostFinalExpression | Compute the final state of the leftmost-outermost evolution of an SK combinator expression | combinators, ruliology (category: Wolfram Physics Project; released 2021-03-08) | Wolfram Research | seen |
| SKCombinatorLeftmostOutermostLeafCounts | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SKCombinatorLeftmostOutermostLeafCounts | Compute successive leaf counts during leftmost-outermost evolution of an SK combinator expression | combinators, ruliology (category: Wolfram Physics Project; released 2021-03-01) | Wolfram Research | seen |

#### Tag systems

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| CyclicTagSystemEvolveList | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CyclicTagSystemEvolveList | Generate the evolution of a cyclic tag system | tag systems (category: Wolfram Physics Project; released 2021-03-10) | Wolfram Research | seen |

#### Turing machines and register machines

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| FiniteStateIndicatorIcon | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FiniteStateIndicatorIcon | Give graphics to indicate the state of a finite-state system such as the head of a Turing machine | Turing machines and register machines, visualization (category: Wolfram Physics Project; released 2019-01-14) | Wolfram Staff (original content by Stephen Wolfram) | seen |
| TuringMachineToNumber | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineToNumber | Convert an explicit list of rules into an enumerated Turing machine specification | Turing machines and register machines (category: Wolfram Physics Project; released 2021-04-12) | Mano Namuduri | seen |

#### Cellular automata

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| AutomatonParticleDetect | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AutomatonParticleDetect | Search through one-dimensional cellular automata for periodic structures | cellular automata (category: Wolfram Physics Project; released 2022-03-21) | Bradley Klee | seen |
| BusyBoxesAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BusyBoxesAutomaton | Implementation of the Busy Boxes 3D reversible cellular automaton | cellular automata (category: Wolfram Physics Project; released 2023-08-07) | Nikolay Murzin | seen |
| DynamicCASelector | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DynamicCASelector | Dynamically select between cellular automata | cellular automata, utilities (category: Wolfram Physics Project; released 2022-03-21) | Bradley Klee | seen |
| DynamicCellularAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DynamicCellularAutomaton | Generate a cellular automaton evolution with initial conditions chosen by a click | cellular automata, utilities (category: Wolfram Physics Project; released 2019-11-06) | Wolfram Staff | seen |
| ProbabilisticCellularAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ProbabilisticCellularAutomaton | Generate the evolution of a probabilistic cellular automaton | cellular automata (category: Wolfram Physics Project; released 2021-08-31) | Wolfram Staff | seen |
| RandomCellularAutomatonRule | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RandomCellularAutomatonRule | Randomly sample different cellular automaton rule spaces | cellular automata, rule enumeration (category: Wolfram Physics Project; released 2023-12-20) | Bradley Klee | seen |
| ReversibleCellularAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ReversibleCellularAutomaton | Generate the evolution of a reversible cellular automaton | cellular automata (category: Wolfram Physics Project; released 2021-08-31) | Wolfram Staff | seen |

#### Aggregation systems

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| MultiwayAggregationSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayAggregationSystem | Simulate an aggregation system (a 2D array of cells in which new cells are added at positions with certain neighborhood configurations) as a multiway system | aggregation systems, multiway systems (category: Wolfram Physics Project; released 2021-12-13) | Jonathan Gorard | seen |

#### Computational systems

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| GeneralizedShift | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GeneralizedShift | Simulate the evolution of C. Moore's generalized shift | computational systems, ruliology (category: Wolfram Physics Project; released 2025-11-12) | Pavel Hajek | seen |

#### Petri nets

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| MakePetriNet | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MakePetriNet | Make an abstract representation of a Petri net configuration | Petri nets (category: Wolfram Physics Project; released 2021-11-22) | Jonathan Gorard | seen |
| MultiwayPetriNet | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayPetriNet | Simulate the evolution of a Petri net configuration as a multiway system | Petri nets, multiway systems (category: Wolfram Physics Project; released 2021-12-13) | Jonathan Gorard | seen |
| PetriNetMultiwayEvolution | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/PetriNetMultiwayEvolution | Evolve a Petri net configuration by applying all possible transition firings | Petri nets, multiway systems (category: Wolfram Physics Project; released 2021-12-13) | Jonathan Gorard | seen |
| PetriNetNondeterministicEvolution | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/PetriNetNondeterministicEvolution | Evolve a Petri net configuration nondeterministically by randomly selecting one possible transition firing at each step | Petri nets (category: Wolfram Physics Project; released 2021-12-13) | Jonathan Gorard | seen |

#### Theorem proving

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| FindEquationalModels | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalModels | Find instances of a binary operator that satisfy equational constraints | theorem proving, metamathematics (category: Wolfram Physics Project; released 2019-12-17) | Stephen Wolfram | seen |
| FindEquationalPath | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalPath | Find a path that goes from one expression to another with a sequence of replacements | theorem proving, multiway systems (category: Wolfram Physics Project; released 2023-01-20) | Nikolay Murzin | seen |
| FindFiniteModels | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindFiniteModels | Find finite models consistent with the set of relations | theorem proving, metamathematics (category: Wolfram Physics Project; released 2020-09-16) | Nikolay Murzin | seen |
| MetamathImport | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MetamathImport | Import and work with a Metamath database | theorem proving, metamathematics (category: Wolfram Physics Project; released 2020-09-21) | Mario Carneiro and Nikolay Murzin | seen |

#### Rewriting

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| MultiReplace | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiReplace | Perform replacements and give the positions at which they occur | rewriting, expression structure (category: Wolfram Physics Project; released 2021-11-08) | Nikolay Murzin | seen |
| RuleReverse | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RuleReverse | Reverse a Rule or RuleDelayed expression | rewriting (category: Wolfram Physics Project; released 2022-01-31) | Bradley Klee | seen |

#### Rule enumeration

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| ArrayPatternFromIndex | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ArrayPatternFromIndex | Convert the size, index and base into an integer array pattern | rule enumeration, arrays (category: Wolfram Physics Project; released 2022-07-08) | Ed Pegg Jr | seen |
| ArrayPatternToIndex | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ArrayPatternToIndex | Convert an integer array pattern into a size, index and base | rule enumeration, arrays (category: Wolfram Physics Project; released 2022-07-08) | Ed Pegg Jr | seen |
| ComputationalSystemRules | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ComputationalSystemRules | Find explicit sets of rules for computational systems | rule enumeration, computational systems (category: Wolfram Physics Project; released 2020-07-06) | Wolfram Staff | seen |

#### Expression structure

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| BinaryCompositions | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BinaryCompositions | List all possible binary compositions for a set of chosen symbols | expression structure, rule enumeration (category: Wolfram Physics Project; released 2022-01-10) | Bradley Klee | seen |
| DepthLeafCountSort | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DepthLeafCountSort | Sort expressions by depth and leaf count | expression structure (category: Wolfram Physics Project; released 2020-10-01) | Jan Mangaldan (original work by Stephen Wolfram) | seen |
| FindHeadArities | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindHeadArities | Find the distinct heads that occur in an expression and their corresponding arities | expression structure (category: Wolfram Physics Project; released 2020-09-09) | Stephen Wolfram, Jan Mangaldan and Nikolay Murzin | seen |
| IrreducibleBinaryCompositions | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IrreducibleBinaryCompositions | List all irreducible binary compositions for a set of chosen symbols and a chosen simplification rule | expression structure, rule enumeration (category: Wolfram Physics Project; released 2022-01-31) | Bradley Klee | seen |
| ProperLeafCount | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ProperLeafCount | Count the terminal nodes of an expression tree | expression structure (category: Wolfram Physics Project; released 2022-03-07) | Bradley Klee | seen |
| UpToBinaryCompositions | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/UpToBinaryCompositions | List all possible unary and binary combinations for a chosen set of functions and symbols | expression structure, rule enumeration (category: Wolfram Physics Project; released 2022-02-23) | Bradley Klee | seen |

#### Graphs

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| BidirectedGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BidirectedGraph | Modify Graph to include extraverted double edges | graphs (category: Wolfram Physics Project; released 2022-03-07) | Bradley Klee | seen |
| CayleyNestGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CayleyNestGraph | Create a generalized Cayley graph from generators and relations | graphs, group theory, multiway systems (category: Wolfram Physics Project; released 2020-03-16) | Stephen Wolfram and Jan Mangaldan | seen |
| DirectedAcyclicEvaluate | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DirectedAcyclicEvaluate | Evaluate functions locally over any directed acyclic graph | graphs, multicomputation (category: Wolfram Physics Project; released 2022-04-11) | Bradley Klee | seen |
| EdgeMultiplicity | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EdgeMultiplicity | Count the multiplicity of edges in a graph | graphs (category: Wolfram Physics Project; released 2022-02-15) | Nikolay Murzin | seen |
| FoldGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FoldGraph | Construct a graph by folding a list of arguments | graphs (category: Wolfram Physics Project; released 2022-08-02) | Nikolay Murzin | seen |
| GraphRemoveLooseEnds | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphRemoveLooseEnds | Remove low-valence vertices in a graph | graphs (category: Wolfram Physics Project; released 2021-10-05) | Nikolay Murzin | seen |
| LowestCommonAncestors | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LowestCommonAncestors | Find the lowest common ancestors for pairs of vertices in a graph | graphs, causal graphs (category: Wolfram Physics Project; released 2022-11-01) | Nikolay Murzin | seen |
| NestGraphTagged | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/NestGraphTagged | Create a graph by successively applying a function and differently tagging edges corresponding to different outputs | graphs, multiway systems (category: Wolfram Physics Project; released 2021-10-05) | Nikolay Murzin and Ed Pegg Jr. | seen |
| NestWhileGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/NestWhileGraph | Iteratively construct graphs up to a termination condition | graphs, multiway systems (category: Wolfram Physics Project; released 2022-06-10) | Bradley Klee | seen |
| SubgraphExpand | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SubgraphExpand | Expand a subgraph inside the space of a graph | graphs (category: Wolfram Physics Project; released 2022-04-26) | Bradley Klee | seen |
| ToDirectedAcyclicGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ToDirectedAcyclicGraph | Convert any undirected graph to a cycle-free directed graph | graphs, causal graphs (category: Wolfram Physics Project; released 2022-04-08) | Bradley Klee | seen |

#### Graph generation

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| CrossNodeGridGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CrossNodeGridGraph | Create cross-linked grid graphs | graph generation (category: Wolfram Physics Project; released 2022-07-25) | Utkarsh Patel and Simon Fischer | seen |
| FastFourierGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FastFourierGraph | Create a fast Fourier transform calculation in graphical form | graph generation (category: Wolfram Physics Project; released 2022-04-26) | Bradley Klee | seen |
| TriangularLatticeGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TriangularLatticeGraph | Generate a graph corresponding to a triangular grid | graph generation (category: Wolfram Physics Project; released 2025-12-29) | Anton Antonov | seen |

#### Graph visualization

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| LayeredLayoutGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LayeredLayoutGraph | Render a graph with vertices arranged in the specified layers | graph visualization, causal graphs (category: Wolfram Physics Project; released 2021-11-01) | Nikolay Murzin | seen |

#### Tilings and constraint systems

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| BlockSubmatrices | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BlockSubmatrices | Decompose a matrix into a comprehensive set of smaller matrices | tilings and constraint systems, arrays (category: Wolfram Physics Project; released 2022-03-14) | Bradley Klee | seen |
| CanonicalTilingMask | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalTilingMask | Get a canonical form for an overlap tiling mask | tilings and constraint systems (category: Wolfram Physics Project; released 2022-07-29) | Wolfram Research | seen |
| FindMinimalTilings | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindMinimalTilings | Find minimal sets of templates for constructing tiling patterns | tilings and constraint systems (category: Wolfram Physics Project; released 2021-11-29) | Wolfram Research | seen |
| GenerateTiling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GenerateTiling | Generate a tiling pattern from a set of local template constraints | tilings and constraint systems (category: Wolfram Physics Project; released 2022-03-25) | Wolfram Research | seen |
| GenerateWangTiling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GenerateWangTiling | Generate a tiling pattern from a set of Wang tiles | tilings and constraint systems (category: Wolfram Physics Project; released 2022-06-23) | Bradley Klee | seen |
| PeriodicPatternGenerator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/PeriodicPatternGenerator | Generate a periodic pattern | tilings and constraint systems (category: Wolfram Physics Project; released 2022-07-01) | Ed Pegg Jr | seen |

#### Sequence analysis

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| FindLinearRecurrenceEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindLinearRecurrenceEquations | Find equations describing a linear recurrence corresponding to an input sequence | sequence analysis (category: Wolfram Physics Project; released 2020-04-14) | Max Piskunov and Jan Mangaldan | seen |
| FindNestedTransientRepeat | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindNestedTransientRepeat | Decompose a nested iteration into its transient and repeating parts | sequence analysis (category: Wolfram Physics Project; released 2022-11-01) | Bradley Klee | seen |

#### Physics simulation

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| HardSphereSimulation | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HardSphereSimulation | Simulate hard spheres moving in an n-dimensional box | physics simulation (category: Wolfram Physics Project; released 2021-02-16) | Matt Kafker and Christopher Wolfram | seen |

### Sub-source 3: contributor sweep, physics-relevant functions not in sub-sources 1 or 2

Functions whose contributor is in the Physics Project circle, or whose name or description carries the project's vocabulary, that are neither on the guide pages nor tagged in the category. Grouped by the contributor the sweep was run for; a function co-authored by two named contributors is listed under the first.

#### Jonathan Gorard

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| AggregationSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AggregationSystem | Evolve a 2D array of cells by randomly adding new cells at positions with certain neighborhood configurations | aggregation systems, computational systems | Kabir Khanna and Jonathan Gorard | seen |
| QuantumTensorAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumTensorAutomaton | A quantum cellular automaton model that evolves the tensor product of a collection of initial qubits using arbitrary compositions of unitary operators for a finite number of steps | quantum, cellular automata | Ruhi Shah and Jonathan Gorard | seen |
| SolveEinsteinEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SolveEinsteinEquations | Determine whether a given stress-energy tensor (field) is a solution to the Einstein field equations | general relativity, tensors | Jonathan Gorard | seen |
| TuringMachineGlocalBranchialGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineGlocalBranchialGraph | Generate a graph of branch pair ancestry for a nondeterministic Turing machine "glocal" (hybrid of global and local) multiway system | glocal multiway systems, token-event graphs, multicomputation | Jonathan Gorard | seen |

#### Stephen Wolfram

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| TagSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TagSystem | Compute the evolution of a tag system | tag systems | Stephen Wolfram | seen |
| CyclicTagSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CyclicTagSystem | Compute the evolution of a cyclic tag system | tag systems | Stephen Wolfram | seen |
| TagSystemRulePlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TagSystemRulePlot | Generate the rule icon for a tag system | tag systems, visualization | Stephen Wolfram | seen |
| SequentialSubstitutionSystemPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SequentialSubstitutionSystemPlot | Visualization of the evolution of a sequential substitution system | string substitution systems, visualization | Stephen Wolfram | seen |
| SequentialSubstitutionSystemRulePlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SequentialSubstitutionSystemRulePlot | Generate the rule icon for a sequential substitution system | string substitution systems, visualization | Stephen Wolfram | seen |
| SubstitutionSystemRulePlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemRulePlot | Generate the rule icon for a one-dimensional neighbor-independent substitution system | string substitution systems, visualization | Stephen Wolfram and Jan Mangaldan | seen |
| MobileAutomatonRulePlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomatonRulePlot | Generate the rule icon for a mobile automaton | mobile automata, visualization | Stephen Wolfram and Jan Mangaldan | seen |
| PerturbedCellularAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/PerturbedCellularAutomaton | Evolve a cellular automaton with changes to certain cells | cellular automata | Willem Nielsen, Stephen Wolfram and Dugan Hammock | seen |
| IsingModelCA | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IsingModelCA | Simulate the Ising model using a cellular automaton | cellular automata, physics simulation | Stephen Wolfram | seen |
| FindBooleanAlternative | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindBooleanAlternative | Find alternative Boolean expressions using a given set of operators | Boolean algebra, metamathematics | Stephen Wolfram and Nikolay Murzin | seen |
| ModusPonensToEquational | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ModusPonensToEquational | Convert an axiom system from modus ponens to equational form | theorem proving, metamathematics | Matthew Szudzik & Stephen Wolfram | seen |
| BitBooleanFunction | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BitBooleanFunction | Apply a Boolean function to corresponding bits in integers | Boolean algebra, cellular automata | Stephen Wolfram | seen |

#### Wolfram Research

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| TagSystemConvert | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TagSystemConvert | Convert between compressed and uncompressed representations of tag system states | tag systems | Wolfram Research | seen |
| TagSystemEvolve | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TagSystemEvolve | Generate the final outcome of a tag system evolution | tag systems | Wolfram Research | seen |
| TagSystemEvolveList | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TagSystemEvolveList | Generate the evolution of a tag system | tag systems | Wolfram Research | seen |
| TilingPatternPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TilingPatternPlot | Visualize a set of tiles | tilings and constraint systems, visualization | Wolfram Research | seen |

#### Nikolay Murzin

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| MostGeneralUnifier | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MostGeneralUnifier | Unify expressions containing pattern variables | theorem proving, rewriting | Nikolay Murzin | seen |
| TensorDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TensorDiagram | Display symbolic tensor expressions as a diagram | tensors, visualization | Nikolay Murzin | seen |
| MergeTree | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MergeTree | Merge subtrees of a tree into a graph | graphs, trees | Nikolay Murzin | seen |
| TuringMachineImport | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineImport | Import standard Turing machine formats | Turing machines and register machines | Nik Murzin | seen |
| MultiPerspectiveEmbedding | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiPerspectiveEmbedding | Compute a 3D embedding for multiple graphs so that all pairwise distances are preserved simultaneously along various 2D projections | graph visualization, graphs | Nikolay Murzin | seen |
| MultiPerspectiveEmbeddingViewer | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiPerspectiveEmbeddingViewer | Visualize a MultiPerspectiveEmbedding | graph visualization, graphs | Nikolay Murzin | seen |
| PairwiseMultidimensionalScaling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/PairwiseMultidimensionalScaling | Multidimensional scaling algorithm for embedding pairwise distances into a Cartesian space | graph visualization, geometry | Nikolay Murzin | seen |
| PositionCases | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/PositionCases | Cases for matching subexpressions together with their positions | rewriting, expression structure | Nikolay Murzin | seen |
| SubexpressionPositions | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SubexpressionPositions | Find subexpressions together with their positions | rewriting, expression structure | Nikolay Murzin | seen |
| DragGraphVertices | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DragGraphVertices | Dynamically drag around the vertices of a graph | graph visualization, utilities | Nikolay Murzin | seen |
| WeightedSimpleGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WeightedSimpleGraph | SimpleGraph with edge and vertex weights | graphs | Nikolay Murzin | seen |
| WithDatedResourceFunctions | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WithDatedResourceFunctions | ResourceFunction time machine | utilities | Nikolay Murzin | seen |
| LindbladSolve | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LindbladSolve | Solve the Lindblad master equation | quantum | Mohammad Bahrami and Nikolay Murzin | seen |
| GellMannMatrix | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GellMannMatrix | Generalized Gell-Mann matrix | quantum | Nikolay Murzin and Mohammad Bahrami | seen |

#### Willem Nielsen

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| AdaptiveCellularAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AdaptiveCellularAutomaton | Run an adaptive search for cellular automata | cellular automata, ruliology | Willem Nielsen | seen |

#### Bradley Klee

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| CATransducerGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CATransducerGraph | Obtain an annotated state transition graph for any CellularAutomaton rule | cellular automata, graphs | Brad Klee | seen |
| FixedPointGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FixedPointGraph | Obtain the graph of an iterative computation to a fixed point | graphs, multiway systems | Bradley Klee | seen |
| RecursiveFunction | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RecursiveFunction | Obtain function values for an arbitrary recursive function | computational systems, ruliology | Bradley Klee and Thomas Adler | seen |
| RecursiveFunctionCallGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RecursiveFunctionCallGraph | Obtain a graph whose vertices and edges trace the evaluation of a recursive function | computational systems, graphs | Bradley Klee and Thomas Adler | seen |
| HatHexagons | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HatHexagons | Generate the hat tiling using combinatorial hexagons | tilings and constraint systems | Bradley Klee | seen |
| HatTrialityTree | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HatTrialityTree | Generate trees describing the essential combinatorial structure of the aperiodic hat tiling | tilings and constraint systems, trees | Bradley Klee | seen |
| ParenthesesTrees | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ParenthesesTrees | Obtain a list of syntax trees consistent with a valid pattern of parentheses | expression structure, trees | Bradley Klee | seen |
| AlphaBetaSearch | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AlphaBetaSearch | Find solutions to perfectly played combinatorial games | multiway systems, search | Brad Klee and Andrea Li | seen |
| DirectedGraphTransferMatrix | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DirectedGraphTransferMatrix | Obtain partial probabilities of random walks on a directed graph | graphs, causal graphs | Bradley Klee | seen |

#### Ed Pegg Jr

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| AlgebraicSubstitutionTiling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AlgebraicSubstitutionTiling | Return a substitution tiling | tilings and constraint systems, string substitution systems | Ed Pegg Jr | seen |
| GraphCoordinationSequence | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphCoordinationSequence | Find the number of vertices at each distance in a symmetric graph | graphs, dimension estimation | Ed Pegg Jr | seen |

#### Jose Martin-Garcia

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| ArrayContract | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ArrayContract | General contraction of levels of an array | tensors | Jose Martin-Garcia | seen |
| ArrayContractThread | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ArrayContractThread | General contraction of levels of the outer product of arrays | tensors | Jose Martin-Garcia | seen |

#### Other contributors (Summer School students, staff, community)

| Name | Source | URL | Description | Topics | Contributor | Status |
| --- | --- | --- | --- | --- | --- | --- |
| AdaptiveTuringMachine | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AdaptiveTuringMachine | Run an adaptive evolution of a Turing machine | Turing machines and register machines, ruliology | Nicholas Frieler | seen |
| AdaptiveRegisterMachine | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AdaptiveRegisterMachine | Run an adaptive evolution of a register machine | Turing machines and register machines, ruliology | Mason Pinkerton | seen |
| MultiwayRegisterMachine | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayRegisterMachine | Simulate a nondeterministic register machine evolution as a multiway system | multiway systems, Turing machines and register machines | Pratham Mukewar | seen |
| MobileAutomatonNonlocal | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomatonNonlocal | Compute the evolution of a mobile automaton with nonlocal rules | mobile automata, computational systems | Akshaj Devireddy | seen |
| HypergraphPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphPlot | Plot a hypergraph defined by a list of hyperedges | hypergraphs, visualization | Jaebum Jung | seen |
| SimpleHypergraphPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SimpleHypergraphPlot | Plot a hypergraph defined by a list of hyperedges and isolated vertices | hypergraphs, visualization | Daniel McDonald | seen |
| TransversalHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TransversalHypergraph | Compute the transversal hypergraph of a hypergraph defined by a list of hyperedges and isolated vertices | hypergraphs | Daniel McDonald | seen |
| MultiwayGeneralizedShiftGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayGeneralizedShiftGraph | Multiway state graph of a non-deterministic generalized shift | multiway systems, computational systems | Pavel Hajek | seen |
| GromovHausdorffDistance | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GromovHausdorffDistance | Compute the Gromov–Hausdorff distance of finite metric spaces | geometry, graphs | Pavel Hajek | seen |
| BinaryCombinator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BinaryCombinator | Perform bitwise operations through SK combinators | combinators | Austin Jiang | seen |
| RandomCombinator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RandomCombinator | Generate a pseudorandom combinator | combinators | Robert Nachbar | seen |
| GroupToCombinator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GroupToCombinator | Create combinator expressions for each element of a specified group, as well as the group's operation | combinators, metamathematics | Henry Gustafson and Joseph Stocke | seen |
| ChristoffelSymbol | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ChristoffelSymbol | Return the Christoffel symbol for a given metric | general relativity, tensors | Lars Ulke-Winter | seen |
| RicciScalar | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RicciScalar | Compute the Ricci scalar for a metric | general relativity, tensors | Wolfram Staff (original content by Alfred Gray) | seen |
| RicciCurvature | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RicciCurvature | Compute the components of the Ricci curvature for a metric | general relativity, tensors | Wolfram Staff (original content by Alfred Gray) | seen |
| EinsteinSummation | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EinsteinSummation | Given tensors and their indices, sum over repeated indices | tensors | Carl Woll | seen |
| TensorIndexJuggling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TensorIndexJuggling | Given a metric, convert between covariant and contravariant components of a tensor | tensors | Lars Ulke-Winter | seen |
| TensorCoordinateTransform | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TensorCoordinateTransform | Transform components of tensors with arbitrary rank with regard to their transformation behavior under any given mapping | tensors | Lars Ulke-Winter | seen |
| CoordinateMappingData | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CoordinateMappingData | Calculate characteristic properties for a generalized mapping between two coordinate systems | tensors, geometry | Lars Ulke-Winter | seen |
| RecursiveRewrite | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RecursiveRewrite | Rewrite an expression, replacing repeatedly by strings | rewriting | Enrique Zeleny | seen |
| FromRecursiveRewrite | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FromRecursiveRewrite | Recover expressions using RecursiveRewrite-generated rules | rewriting | Enrique Zeleny | seen |
| HofstadterMURiddle | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HofstadterMURiddle | Get steps of Hofstadter's MU riddle | string substitution systems, multiway systems | Enrique Zeleny | seen |
| RelativisticInertialDeformedRegion | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RelativisticInertialDeformedRegion | Compute the apparent visual shape of an object or region traveling with constant velocity | relativity, geometry | Utkarsh Bajaj (Junior Research Affiliate in the Wolfram Physics Project) | seen |
| TriangularGridGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TriangularGridGraph | Create a triangular grid graph | graph generation | Eric Weisstein (with contributions by Jibiana Jakpor) | seen |
| GeneralizedTriangularGridGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GeneralizedTriangularGridGraph | Create a triangular grid graph with customizable width and height, represented as a parallelogram composed of triangular grids | graph generation | Peter Cullen Burbery | seen |
| HyperbolicTiling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HyperbolicTiling | Compute polygons for hyperbolic tilings | hyperbolic geometry, tilings and constraint systems | Arnoud Buzing | seen |
| LSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LSystem | Generate an L-system | string substitution systems, L-systems | Renan Soares Germano | seen |
| LSystemPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LSystemPlot | Display an L-system | string substitution systems, L-systems | Robert Dickau | seen |
| SymbolicSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SymbolicSystem | Get the evolution of a symbolic system | computational systems, rewriting | Abigail Nussey | seen |
| NestedBranching | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/NestedBranching | Generate a nested branching model | branchial graphs, multiway systems | Katja Della Libera | seen |
| WeakPathGraphs | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WeakPathGraphs | Create path graphs between two vertices in a graph where the paths are constructed without consideration of the direction of the edges | graphs, causal graphs | Seth J. Chandler | seen |
| ParticleDecayChain | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ParticleDecayChain | Compute and visualize possible decays of a particle | hypergraphs, particle physics | Julia Gao and Joseph Brennan | seen |
| NonIsomorphicComponents | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/NonIsomorphicComponents | Return the non-isomorphic components of a graph | graphs, isomorphism | Alejandra Ortiz Duran | seen |
| FindNestPeriod | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindNestPeriod | Try to find the repetition period for nesting of a function | sequence analysis | Richard Phillips | seen |

### Contributor index

Counts over all 3320 WFR function pages, by the "Contributed by" line (a co-authored function counts for each author). "Listed" are the functions in the tables above; "not listed" are the contributor's other WFR functions, judged unrelated to the project.

| Contributor | WFR functions | Listed above | Not listed (unrelated) |
|---|---|---|---|
| Stephen Wolfram | 71 | 63: BitBooleanFunction, CausalConnectionGraph, CayleyNestGraph, ConnectedHypergraphQ, CyclicTagSystem, DepthLeafCountSort, DistanceLayeredGraph, EnumerateHypergraphs, EnumerateRuleSignatures, EnumerateSubstitutionSystemRules, FindBooleanAlternative, FindEquationalModels, FindHeadArities, FiniteStateIndicatorIcon, GenerationalMultiwaySystem, GraphAntipodes, GraphFunctionPlot, GraphMinors, GraphNeighborhoodVolumes, GraphReconstructedSurface, GraphicsMetricGraph, HypergraphAdjacencyMatrix, HypergraphNeighborhoodVolumes, HypergraphNeighborhoods, HypergraphToGraph, InteractiveListSelector, IsingModelCA, IteratedFiniteAutomaton, LayeredGraphPlot3D, LogDifferences, MobileAutomaton, MobileAutomatonPlot, MobileAutomatonRulePlot, ModusPonensToEquational, MultiwayEvolutionPlot, MultiwayFunctionSystem, MultiwaySystem, MultiwayTuringMachine, OverlapFreeStringTuples, PerturbedCellularAutomaton, PrioritizedSubstitutionSystem, RaggedMeanAround, RandomHypergraph, RandomSubstitutionSystemRule, RandomWolframModel, SequentialCellularAutomaton, SequentialSubstitutionSystem, SequentialSubstitutionSystemPlot, SequentialSubstitutionSystemRulePlot, StringOverlaps, StringOverlapsQ, StringTuples, SubstitutionSystemPlot, SubstitutionSystemRulePlot, TagSystem, TagSystemRulePlot, TokenEventGraph, TuringMachineFromNumber, WolframModelData, WolframModelEvolutionObject, WolframModelRuleForm, WolframModelSignatureForm, WolframModelTraditionalForm | BinaryCodedTernary, DateListPlotRanged, DottedArrayPlot, FibonacciEncode, HuffmanCodeWords, HuffmanDecode, HuffmanEncode, ProgressiveMaxPositions |
| Wolfram Research, Wolfram Staff, Wolfram Physics Project Team | 332 | 48: BlockCellularAutomaton, CanonicalTilingMask, CellularAutomatonFromNumber, CellularAutomatonNumber, ChurchCombinator, CombinatorBracketsPlot, CombinatorEvolutionGraph, CombinatorEvolutionPlot, CombinatorEvolve, CombinatorEvolveList, CombinatorExpressionGraph, CombinatorFixedPoint, CombinatorFixedPointList, CombinatorMatches, CombinatorPlot, CombinatorStep, CombinatorToDAG, CombinatorTraditionalForm, ComputationalSystemRules, CyclicTagSystemEvolveList, DynamicCellularAutomaton, EnumerateCombinators, FindMinimalTilings, FiniteStateIndicatorIcon, GenerateTiling, HexagonalGridGraph, OrderedGraphModelPlot, ProbabilisticCellularAutomaton, RegularHyperbolicTilingGraph, ReversibleCellularAutomaton, RicciCurvature, RicciScalar, SCombinatorHaltsQ, SKCombinatorCompile, SKCombinatorLeftmostOutermostFinalExpression, SKCombinatorLeftmostOutermostLeafCounts, SubstitutionSystemCausalEvolution, SubstitutionSystemCausalGraph, SubstitutionSystemCausalPlot, TagSystemConvert, TagSystemEvolve, TagSystemEvolveList, TilingPatternPlot, TraversalOrderSelect, TuringMachineCausalGraph, WolframModel, WolframModelPlot, WolframPhysicsProjectStyleData | 284 (general repository content, not listed) |
| Jonathan Gorard | 87 | 87: ADMDecomposition, AbstractCategory, AbstractCoproduct, AbstractFunctor, AbstractProduct, AbstractPullback, AbstractPushout, AbstractQuiver, AbstractStrictMonoidalCategory, AdjacencyHypergraph, AdjacencyTensor, AggregationSystem, BranchPairResolutions, BranchPairs, CanonicalBranchPairs, CanonicalKnuthBendixCompletion, CausalConnectionGraph, CausalGraphEntanglementEntropyGeneralized, CausalGraphEntanglementEntropyNaive, CausalInvariantQ, ChristoffelSymbols, CombinatorGlocalBranchialGraph, CombinatorGlocalMultiwaySystem, CurvedSpacetimeRegionSprinkling, CurvedSpacetimeSprinkling, CurvedSpacetimeTriangulation, DiscreteHypersurfaceDecomposition, EinsteinTensor, ExtrinsicCurvatureTensor, ExtrinsicCurvedManifoldToGraph, FindCombinatorProof, FindEquationalCounterexample, FindHypergraphIsomorphism, FindListProof, FindOrderedHypergraphIsomorphism, FindStringProof, FindWolframModelProof, FlatManifoldToGraph, FlatSpacetimeSprinkling, FlatSpacetimeTriangulation, GenerationalMultiwaySystem, IntrinsicCurvedManifoldToGraph, IsomorphicHypergraphQ, IsomorphicOrderedHypergraphQ, KirchhoffHypergraph, KirchhoffTensor, KnuthBendixCompletion, ListGlocalBranchialGraph, ListGlocalMultiwaySystem, MakePetriNet, MakeZXDiagram, MetricTensor, MultiwayAggregationSystem, MultiwayCombinator, MultiwayEvolutionPlot, MultiwayFunctionSystem, MultiwayGroup, MultiwayMonoid, MultiwayOperatorSystem, MultiwayPetriNet, MultiwaySemigroup, MultiwaySystem, MultiwayTuringMachine, PetriNetMultiwayEvolution, PetriNetNondeterministicEvolution, QuantumDiscreteOperatorToZXDiagram, QuantumDiscreteStateToZXDiagram, QuantumTensorAutomaton, QuantumToMultiwaySystem, RicciTensor, RiemannTensor, SolveEinsteinEquations, SolveVacuumADMEquations, SolveVacuumEinsteinEquations, StressEnergyTensor, StringGlocalBranchialGraph, StringGlocalMultiwaySystem, TotalCausalInvariantQ, TuringMachineGlocalBranchialGraph, TuringMachineGlocalMultiwaySystem, WolframHausdorffDimension, WolframModelGlocalBranchialGraph, WolframModelGlocalMultiwaySystem, WolframRicciCurvatureScalar, WolframRicciCurvatureTensor, ZXDiagramToQuantumDiscreteOperator, ZXDiagramToQuantumDiscreteState | none |
| Max Piskunov | 11 | 11: CausalConnectionGraph, ConnectedWolframModelQ, EnumerateHypergraphs, EnumerateWolframModelRules, FindLinearRecurrenceEquations, GeneralizedGridGraph, GraphNeighborhoodVolumes, MultiwaySystem, MultiwayTuringMachine, RandomWolframModel, WolframModelEvolutionObject | none |
| Xerxes Arsiwalla | 1 | 1: MakeZXDiagram | none |
| Nikolay Murzin | 59 | 33: BranchialHypergraph, BusyBoxesAutomaton, DragGraphVertices, EdgeMultiplicity, FindBooleanAlternative, FindCanonicalHypergraphIsomorphism, FindEquationalPath, FindFiniteModels, FindHeadArities, FoldGraph, GellMannMatrix, GraphFoliations, GraphRemoveLooseEnds, LayeredLayoutGraph, LindbladSolve, LowestCommonAncestors, MergeTree, MetamathImport, MostGeneralUnifier, MultiPerspectiveEmbedding, MultiPerspectiveEmbeddingViewer, MultiReplace, MultispacePlot3D, NestGraphTagged, PairwiseMultidimensionalScaling, PositionCases, SubexpressionPositions, TensorDiagram, TokenEventGraph, TraceCausalGraph, TuringMachineImport, WeightedSimpleGraph, WithDatedResourceFunctions | 26 |
| Hatem Elshatlawy | 0 | 0: none | none |
| Mano (Manojna) Namuduri | 6 | 6: CombinatorConvert, MakeZXDiagram, QuantumDiscreteOperatorToZXDiagram, TuringMachineFromNumber, TuringMachineToNumber, ZXDiagramToQuantumDiscreteOperator | none |
| Ed Pegg Jr | 127 | 10: AlgebraicSubstitutionTiling, ArrayPatternFromIndex, ArrayPatternToIndex, CanonicalHypergraph, CanonicalWolframModelRule, EnumerateWolframModelRules, GraphCoordinationSequence, HexagonalTorusGraph, NestGraphTagged, PeriodicPatternGenerator | 117 |
| Willem Nielsen | 3 | 2: AdaptiveCellularAutomaton, PerturbedCellularAutomaton | HistogramBubbleChart |
| Jesse Friedman | 19 | 0: none | BooleanCompose, BugOutEffect, CellEvaluationButton, DeepSpaceNetData, ElevateGeoPosition, EnsureExport, FirstRest, FromISOTimestamp, GeoGlobe3D, HeadQ, ImageInspector, InstEffect, NumberParse, OEISSequenceData, OpenWebMap, PersistResourceFunction, PositionTooltips, ReadabilityScore, RecentResourceFunctions |
| Bradley (Brad) Klee | 42 | 30: AlphaBetaSearch, AutomatonParticleDetect, BidirectedGraph, BinaryCompositions, BlockSubmatrices, BranchialGraphs, CATransducerGraph, DepthFirstSearch, DirectedAcyclicEvaluate, DirectedGraphTransferMatrix, DynamicCASelector, FastFourierGraph, FindNestedTransientRepeat, FixedPointGraph, GenerateWangTiling, HatHexagons, HatTrialityTree, IrreducibleBinaryCompositions, MultiwayDeletionsGraph, NestWhileGraph, ParenthesesTrees, ProperLeafCount, RandomCellularAutomatonRule, RecursiveFunction, RecursiveFunctionCallGraph, RuleReverse, SubgraphExpand, ToDirectedAcyclicGraph, UpToBinaryCompositions, VertexStratify | BlockEntropy, CharacterArrayPlot, ChessVoxels, DihedralODE, FindExactCover, HyperellipticODE, ParityPairings, PlanarPolygonFragmentation, PolyominoPlot, RandomSierpinskiMaze, SkipListStructure, SubmatrixReplace |
| Jonathan Kogan | 0 | 0: none | none |
| Jose Martin-Garcia | 2 | 2: ArrayContract, ArrayContractThread | none |
| Christopher Wolfram | 4 | 1: HardSphereSimulation | CompleteConditionalDistribution, OSMImport, WebServerDeploy |
| Jan Mangaldan | 284 | 24: CayleyNestGraph, CombinatorConvert, DepthLeafCountSort, DistanceLayeredGraph, EnumerateSubstitutionSystemRules, FindHeadArities, FindLinearRecurrenceEquations, GeodesicSphereGraph, GraphAntipodes, GraphFunctionPlot, GraphMinors, GraphNeighborhoodVolumes, GraphReconstructedSurface, GraphicsMetricGraph, LayeredGraphPlot3D, MobileAutomaton, MobileAutomatonPlot, MobileAutomatonRulePlot, PrioritizedSubstitutionSystem, StringTuples, SubstitutionSystemPlot, SubstitutionSystemRulePlot, TuringMachineFromNumber, WolframModelTraditionalForm | 260 |
| Julia Dannemann-Freitag | 2 | 2: CausalGraphEntanglementEntropyGeneralized, CausalGraphEntanglementEntropyNaive | none |
| Matt Kafker | 4 | 1: HardSphereSimulation | HydrogenWavefunction, PeriodicBoxDisplacement, PeriodicBoxDistance |
| Mario Carneiro | 1 | 1: MetamathImport | none |
| Pavel Hajek | 4 | 3: GeneralizedShift, GromovHausdorffDistance, MultiwayGeneralizedShiftGraph | VimGraph |
| Utkarsh Bajaj | 1 | 1: RelativisticInertialDeformedRegion | none |
| Tom Lee and Jon Lederman | 4 | 4: FoliationClass, LorentzCoordinate2D, SimpleCausalGraphCoordinates, WolframModelLorentzFactor | none |
| Samuele Mongodi | 1 | 1: ParametricManifoldToGraph | none |
| Utkarsh Patel and Simon Fischer | 1 | 1: CrossNodeGridGraph | none |
| Daniel Sanchez | 8 | 1: CombinatorEncode | BitTest, EasingFunction, Fractran, InverseBoole, KeyTakeDrop, NibbleArray, TurtleArt |
| Anton Antonov | 34 | 1: TriangularLatticeGraph | 33 |
| Lars Ulke-Winter | 5 | 4: ChristoffelSymbol, CoordinateMappingData, TensorCoordinateTransform, TensorIndexJuggling | AntColonyOptimization |
| Enrique Zeleny | 28 | 3: FromRecursiveRewrite, HofstadterMURiddle, RecursiveRewrite | ApproximatedSurface, BakersMap, CatMap, ChladniFigure, ClausenCl, Collatz, ComplexTransformImage, DiracMatrix, EinsteinSolid, FindSubmatrix, GenericInvariant, Goldbach, Graphics3DWireFrame, GraphicsDirectiveQ, GraphicsOptionQ, GraphicsPrimitiveQ, HofstadterButterfly, IconizedView, InequalityPlot, Intrinsic3DCurve, LuckyNumbers, PebbleStoneEffect, PrimitiveToPolygons, RandomBSplineSurface, ShortestTourArt3D |
| Daniel McDonald | 15 | 2: SimpleHypergraphPlot, TransversalHypergraph | AncestralNestTree, AncestralTreeScan, AutomorphismGraph, DefineFunctionByFormula, FindGroupIsomorphism, FindMatchingAlgebraicParameters, FindPolygonIsometry, FindProperColorings, FindStableMatching, GallaiEdmondsDecomposition, GeometricSolve, GraphRandomWalk, VizingEdgeColoring |

## Gaps

- https://www.wolframphysics.org/functions/ does not exist (HTTP 404); the catalog the task describes is the cloud notebook https://www.wolframcloud.com/obj/wolframphysics/Tools/guide-page and its six sub-guides, which were read in full instead. The guide pages were last edited around October 2020 (TentativeID 2020-10-20 markers on AxiomaticTheory and CellularAutomaton), so they predate everything in sub-sources 2 and 3 released after that.
- WFR function pages carry the contributor as plain text, not as a link, and the publisher pages (PublisherID) list only self-published resources, so no contributor page exists for Stephen Wolfram, Jonathan Gorard, Max Piskunov, Xerxes Arsiwalla, Nikolay Murzin, Hatem Elshatlawy, Mano Namuduri, Ed Pegg Jr, Jonathan Kogan, Jose Martin-Garcia or Christopher Wolfram. The by-contributor view was reconstructed from the full page sweep instead; only Bradley Klee, Willem Nielsen and Jesse Friedman have working publisher pages.
- Hatem Elshatlawy and Jonathan Kogan have no WFR function with their name in the "Contributed by" line (search API and full sweep both return nothing), so they have no rows. Xerxes Arsiwalla appears only as an additional contributor on MakeZXDiagram. Christopher Wolfram appears on HardSphereSimulation (with Matt Kafker) and on three unrelated functions.
- Ten WFR pages returned no function page during the sweep (listed under Method); of these only SuzukiTrotterProduct is physics-tagged, and its metadata was recovered through the kernel. The sweep's contributor field is the page text at sweep time and would miss any function whose page failed to load; the count of loaded pages was 3310 of 3320.
- The WFR search index OR-s multi-word queries, so "Wolfram Physics Project" as a description search is not selective; the category tag is the reliable marker, and Summer School projects were found by grepping names, descriptions and contributor lines rather than by a "Wolfram Physics" description search. Summer School attribution is only visible when the contributor line says so (for example Utkarsh Bajaj, DeepSpaceNetData), so student-authored physics functions are listed under "Other contributors" without a school-year attribution.
- Relevance of a contributor's other functions is a judgement: every function of the named contributors was seen (the contributor index gives the counts), but only those whose description or keywords touch the project were tabulated. WFR Keywords were fetched for the 221 category functions and 78 extra candidates, not for all 3320 pages.
- Paclets (Wolfram/QuantumFramework, WolframInstitute/Hypergraph, SetReplace) and the Wolfram Physics Project GitHub repository are covered by other finders and were not swept here, even where a WFR page names them.

## Verification

Independent check of every row of the findings tables on 2026-09-16, by a second agent, against the live sources rather than the sweep's saved files. Scratch files are under the session scratchpad directory in verify/ (rows.tsv, wfrpart_00 to wfrpart_03 .wls and .out, wl.wls, guides.wls, notlisted.wls).

Method:

1. Row extraction. The 349 rows of the findings tables (113 WFR and 33 WL on the guide pages, 121 WFR in the category, 82 WFR from the contributor sweep) were parsed into rows.tsv; there are no duplicate names, and every URL is the resource page (WFR) or reference page (WL) of the name in its row.
2. WFR rows, kernel. All 316 WFR names were evaluated in four batches with wolframscript (WL 15.0, cloud-connected): for each name, `ResourceObject[name]` inside TimeConstrained (60 s), then its "ResourceType", "Description" and "ContributorInformation" properties. 315 resolved as ResourceType "Function"; none timed out. The kernel description matched the report's Description column verbatim for every sub-source 2 and 3 row and for every parenthesised "WFR page:" description in sub-source 1. The kernel "ContributedBy" matched the Contributor column for every row where the property was returned; for five rows (WolframModelData, EnumerateWolframModelRules, StringOverlaps, AdaptiveCellularAutomaton, DynamicCellularAutomaton) the kernel returned no contributor information, and each of these was confirmed instead on its WFR page by WebFetch (name, lead description and "Contributed by" line all as in the row).
3. DynamicCellularAutomaton. The one name that failed by-name lookup (ResourceObject::notfname, twice, also through ResourceFunction) has a live WFR page (WebFetch: "Generate a cellular automaton evolution with initial conditions chosen by a click", Contributed by Wolfram Staff, version 2.0.0 of 30 December 2019), is in allnames.json and in the category JSON, and resolves in the kernel by its UUID 027871b5-112d-42ee-9487-ede4cc20b8f0 to a ResourceObject named DynamicCellularAutomaton of type Function, version 2.0.0. It is therefore on the WFR and its Status stays seen; the by-name failure is a lookup-index quirk, not a missing function.
4. WFR rows, web cross-check. Five rows drawn at random (seed 20260916) were fetched from their URLs with WebFetch: HypergraphNeighborhoodVolumes, FindEquationalModels, RandomSubstitutionSystemRule, MultiwayGroup and MultiwayAggregationSystem. Each page carries the row's name, lead description and contributor.
5. WL rows, kernel. wl.wls evaluated `` Names["System`" <> name] ``  for all 33 built-in names in WL 15.0: all 33 present.
6. Guide pages, independent re-fetch. guides.wls fetched the main guide page and the six sub-guide notebooks by CloudGet and extracted every ResourceFunctionTemplate name (112) and every paclet:ref link (34). All 112 template names are in the sub-source 1 tables and all 113 table WFR names are on the guides (FlatManifoldToGraph is linked as a plain WFRObject button without a URL, in the Spatial Graph Generation listing beside its two siblings, which is why the template count is 112). All 33 table built-ins are among the 34 paclet:ref links; the 34th, FixedPoint (Combinator Functions / Construction and Enumeration), is on the combinators guide but absent from the tables. It was not added, because this pass verifies rather than extends the sweep.
7. Category cross-check. Against the saved category JSON (221 names): 100 sub-source 1 names and all 121 sub-source 2 names are in it, no category name is missing from the tables, no sub-source 3 name is in it, and every release date in the sub-source 2 Topics column matches the JSON.
8. Contributor index. Every name in the "Listed above" column (counts and names) is a row of the findings tables. The 93 names in the "Not listed" column were also run through ResourceObject (notlisted.wls): all 93 resolve as Functions, and every one's "ContributedBy" names the row's contributor.

Result: 349 rows checked, 349 confirmed (348 by kernel evaluation, DynamicCellularAutomaton by its web page and UUID), 0 renamed or re-sourced, 0 removed, 0 left unconfirmed. Every Status is seen.
