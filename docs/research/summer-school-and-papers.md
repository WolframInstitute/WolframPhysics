# Summer School, Winter School and technical paper sweep: existing Wolfram Physics Project functions

Finder scope: the Wolfram Summer School and Winter School physics-track projects (2019-2026) and the technical papers of the Wolfram Physics Project, recording every reusable Wolfram Language function, paclet or repository they use or cite. Written 2026-09-16 for the WolframInstitute/WolframPhysics paclet guide.

Summary: 309 school project posts were downloaded and mined, 27 papers plus the Rewriting the Universe report were read for citations, and about 170 candidate names were checked in a WL 15 kernel. Sections A to F below list 259 rows; the most-used functions across the school projects are WolframModel (46 posts), MultiwaySystem (43), HypergraphToGraph (19), WolframModelPlot (16), QuantumToMultiwaySystem (10), NestGraphTagged (9), WolframHausdorffDimension (8), MultiwayFunctionSystem (8), WolframPhysicsProjectStyleData (7) and EnumerateWolframModelRules (7). The papers cite Function Repository functions in six families: causal set sprinkling (FlatSpacetimeSprinkling and relatives), ZX-calculus (MakeZXDiagram and relatives), theorem proving (FindWolframModelProof, MultiwayOperatorSystem), discrete geometry (WolframRicciCurvatureScalar, WolframHausdorffDimension and manifold-to-graph functions), Gravitas (MetricTensor, ADMDecomposition and relatives) and Categorica (AbstractCategory and relatives).

## Method

All steps below were run on 2026-09-16 from this session. Web pages were fetched with curl (parallel xargs where noted) and with the WebFetch tool; PDFs were converted with pdftotext; ar5iv HTML was converted to text with a tag-stripping Python script; kernel checks used wolframscript -file on WL 15.0 (cloud connected).

### 1. Summer School and Winter School project listings

1. https://www.wolframphysics.org/wolfram-physics-project-summer-school/ and https://www.wolframphysics.org/summer-school/ both return HTTP 404 (WebFetch). https://www.wolframphysics.org/education-collaboration/ was fetched instead; it links only to the generic school pages.
2. https://writings.stephenwolfram.com/2020/07/a-burst-of-physics-progress-at-the-2020-wolfram-summer-school/ (WebFetch): the 2020 physics-track project list with 32 Community post ids and the Function Repository names it mentions (MultiwaySystem, GenerationalMultiwaySystem, MultiwayTuringMachine, MultispacePlot3D, TorusGraph, QuantumToMultiwaySystem, WolframModel).
3. https://education.wolfram.com/summer-school/programs/physics/ (WebFetch) and https://www.wolframcloud.com/obj/microsites/summerschool/projects.html (curl, 366 project cards parsed with a regex, titles filtered by physics keywords: 136 posts).
4. https://education.wolfram.com/summer-research-institute/alumni/YEAR/ for YEAR 2020 to 2026 (curl): the track sections were parsed (Fundamental Physics Track, NKS and Ruliology, Metamathematics, Foundational Science, Ruliology and Pure Computation) and all 154 alumni pages in those tracks were fetched to read the linked Community post id; 44 posts not already downloaded were added.
5. https://www.wolframphysics.org/technical-documents/ (WebFetch and curl): the Community Research Posts list (84 posts, Summer and Winter School 2023 to 2025) and the technical paper list; 52 posts not already downloaded were added.
6. Wolfram Community Discourse tag listings via JSON: https://community.wolfram.com/tag/ruliology.json?page=N, https://community.wolfram.com/tag/wolfram-summer-research-institute.json?page=N and https://community.wolfram.com/tag/physics.json?page=N (paged until more_topics_url was empty; 2827 topics). Titles matching physics-project keywords and a school tag (WSS, WWS, WSC, WSRP, WSFP, FSWS, WSRI) from 2020 onward gave 176 posts, of which 87 were new (mainly Winter School 2021 to 2026); all were fetched as https://community.wolfram.com/t/SLUG/ID.
7. Every post (309 in total, listed in the appendix) was downloaded with curl and mined with Python: Function Repository links, ResourceFunction["Name"] calls, PacletInstall, Needs and context names, GitHub links. Because the Community notebook embeds render code with a space between every character, the text was first "despaced" (runs of single characters separated by single spaces were joined) before searching; this raised the count of distinct ResourceFunction names found from 13 to about 100.

### 2. Technical papers

8. arXiv API queries (https://export.arxiv.org/api/query?search_query=...): au:Gorard, au:Arsiwalla, au:Elshatlawy, au:Namuduri, ti:"Wolfram model", abs:"Wolfram model", abs:"multiway system", abs:ruliad, abs:"rulial", abs:"multicomputation", abs:"hypergraph rewriting" AND abs:Wolfram, au:Murzin AND (abs:categor OR abs:multiway OR abs:Wolfram OR abs:hypergraph) (no result), au:Assar (no relevant result), ti:"Rewriting the Universe" (no result).
9. ar5iv HTML fetched for 2004.14810 (as PDF), 2011.12174, 2010.02752, 2103.15820, 2105.04057, 2102.09363, 2105.10822, 2301.04690, 2301.12455, 2303.07282, 2402.02331, 2308.16068, 2504.16225, 2311.03973, 2512.20587, 2212.04406, 2301.07494, 2205.05456, 2201.09738, 2403.16269, 2308.07508, 2401.14209, 2102.03321, 2110.03388, 2409.01006. Every href containing wolframcloud, github, wolframphysics or wolframinstitute was extracted; the text was searched for ResourceFunction and named-function patterns.
10. PDFs fetched and converted with pdftotext: https://arxiv.org/pdf/2004.14810, https://arxiv.org/pdf/2111.03460 (no ar5iv version), https://www.wolframcloud.com/obj/wolframphysics/Documents/some-quantum-mechanical-properties-of-the-wolfram-model.pdf, and https://github.com/WolframInstitute/HypergraphRewritingEngine/blob/master/paper/main.pdf (Assar 2026, Rewriting the Universe).
11. GitHub: https://github.com/WolframInstitute/HypergraphRewritingEngine README, paclet_source/README.md and paclet/Documentation/Source/HGEvolve.md (raw.githubusercontent.com); GitHub API listing of paclet/ and paclet/Kernel/.
12. WebSearch: "HypergraphRewritingEngine Assar Wolfram"; "Nikolay Murzin paper multicomputation OR categorical Wolfram Institute"; "bulletins.wolframphysics.org Piskunov Local Multiway Systems ResourceFunction". WebFetch: https://wolframinstitute.org/people/nikolay-murzin, https://wolframinstitute.org/research/hypergraph-rewriting, https://wolframinstitute.org/output/hypergraph-rewriting-and-causal-structure-of-lambda-calculus.
13. Stephen Wolfram writings 2023 to 2026: yearly indexes https://writings.stephenwolfram.com/2023/ ... /2026/ were fetched, 25 physics and ruliology posts were fetched with curl and grepped for FunctionRepository, PacletRepository, ResourceFunction and github links.
14. Wolfram Physics bulletins: https://www.wolframphysics.org/bulletins/ resolved, but bulletins.wolframphysics.org does not resolve from this session (curl and WebFetch both fail with a DNS error), so the individual bulletins (Piskunov Local Multiway Systems, Confluence and Causal Invariance; Gorard double-slit and geometrical formalism notes; Boyd Multicomputational Irreducibility) could not be read.
15. WolframLanguageContext (RAG) query: Function Repository functions for ZX-calculus and multiway systems (ZXMultiwaySystem, QuantumToMultiwayFunction, MakeZXDiagram, ZXDiagramToQuantumDiscreteState).

### 3. Kernel evaluations (WL 15.0, wolframscript -file)

16. For every candidate name (about 170 names across scripts check1.wls to check8.wls in the session scratchpad): ResourceObject["Name"] wrapped in Quiet, Check and TimeConstrained[..., 120], then ro["Description"], ro["Keywords"], ro["ContributorInformation"]["ContributedBy"] and ro["DocumentationLink"]. Names for which ResourceObject failed are reported as NOTFOUND and appear below as unconfirmed or in section C.
17. PacletFindRemote for WolframInstitute/Hypergraph (1.2.3, "Hypergraph tools"), Wolfram/Multicomputation (0.1.8, "Various functions for multicomputation"), Wolfram/QuantumFramework (2.1.1, "Perform analytic and numeric quantum computations"), SetReplace (0.3.196), WolframInstitute/TuringMachine (1.2.0), WolframInstitute/HypergraphRewriteEngine (no remote match).
18. Needs of the contexts `` WolframInstitute`Hypergraph` ``, `` Wolfram`Multicomputation` ``, `` Wolfram`QuantumFramework` ``, `` SetReplace` `` and `` HypergraphRewriting` `` (all installed locally), then `` Names["*`Symbol"] `` and Information[..., "Usage"] for each paclet symbol seen in a post, and `` Names["HypergraphRewriting`*"] `` and `` Names["SetReplace`*"] `` for the two rewriting paclets.

## Findings

### A. Wolfram Function Repository functions used by Summer and Winter School physics-track projects (2019-2026)

Each function below was seen either as a `ResourceFunction["Name"]` call or a Function Repository link in the text of at least one downloaded project post, and its existence, description and contributor were then confirmed with `ResourceObject["Name"]` in the WL 15 kernel (see Method). The program code is the tag in the post title (WSS = Summer School, WWS/FSWS = Winter School, WSC/WSRP = high school programs, WSRI = Summer Research Institute).

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| WolframModel | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/ | Generate evolutions of Wolfram model systems | hypergraph rewriting, Wolfram models | WSC20 [16434](https://community.wolfram.com/t/16434); WSC20 [2034307](https://community.wolfram.com/groups/-/m/t/2034307); WSS20 [2027996](https://community.wolfram.com/groups/-/m/t/2027996); WSS20 [2028496](https://community.wolfram.com/groups/-/m/t/2028496); and 42 more | seen |
| WolframModelPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelPlot/ | Generate a visual display of a hypergraph | hypergraph rewriting, Wolfram models | WSS20 [2029394](https://community.wolfram.com/groups/-/m/t/2029394); WSS20 [2030068](https://community.wolfram.com/groups/-/m/t/2030068); WSS20 [2030275](https://community.wolfram.com/groups/-/m/t/2030275); WSS21 [2314016](https://community.wolfram.com/groups/-/m/t/2314016); and 12 more | seen |
| WolframModelEvolutionObject | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelEvolutionObject/ | Represent the result of evolution of a Wolfram model | hypergraph rewriting, Wolfram models | WSS20 [2029848](https://community.wolfram.com/groups/-/m/t/2029848); WSS21 [2314231](https://community.wolfram.com/groups/-/m/t/2314231); WWS21 [17414](https://community.wolfram.com/t/17414) | seen |
| HypergraphPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphPlot/ | Plot a hypergraph defined by a list of hyperedges | hypergraph rewriting, Wolfram models | WSS21 [2314231](https://community.wolfram.com/groups/-/m/t/2314231); WWS21 [17403](https://community.wolfram.com/t/17403); WSS22 [20366](https://community.wolfram.com/t/20366); WSS24 [3209297](https://community.wolfram.com/groups/-/m/t/3209297) | seen |
| HypergraphToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphToGraph/ | Convert a hypergraph to a graph with the same distance matrix | hypergraph rewriting, Wolfram models | WSC20 [16434](https://community.wolfram.com/t/16434); WSS20 [2027996](https://community.wolfram.com/groups/-/m/t/2027996); WSS20 [2029454](https://community.wolfram.com/groups/-/m/t/2029454); WSS20 [2029483](https://community.wolfram.com/groups/-/m/t/2029483); and 15 more | seen |
| EnumerateWolframModelRules | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateWolframModelRules/ | Enumerate canonical Wolfram model rules with a particular signature | hypergraph rewriting, Wolfram models | WSS20 [2028496](https://community.wolfram.com/groups/-/m/t/2028496); WSS20 [2029394](https://community.wolfram.com/groups/-/m/t/2029394); WSS20 [2036324](https://community.wolfram.com/groups/-/m/t/2036324); WSS21 [2312354](https://community.wolfram.com/groups/-/m/t/2312354); and 4 more | seen |
| RandomWolframModel | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RandomWolframModel/ | Generate a random canonical Wolfram model rule with a particular signature | hypergraph rewriting, Wolfram models | WWS21 [17414](https://community.wolfram.com/t/17414) | seen |
| CanonicalWolframModelRule | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalWolframModelRule/ | Attempt to find a canonical representation for a Wolfram model | hypergraph rewriting, Wolfram models | WSS24 [3210162](https://community.wolfram.com/groups/-/m/t/3210162) | seen |
| FindCanonicalWolframModel | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindCanonicalWolframModel/ | Attempt to find a canonical representation for a Wolfram model | hypergraph rewriting, Wolfram models | FSWS23 [2777621](https://community.wolfram.com/groups/-/m/t/2777621) | seen |
| WolframModelData | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelData/ | Retrieve information on a Wolfram model from the Registry of Notable Universe Models | hypergraph rewriting, Wolfram models | WSS20 [2030275](https://community.wolfram.com/groups/-/m/t/2030275); WSS24 [3209693](https://community.wolfram.com/groups/-/m/t/3209693) | seen |
| EnumerateHypergraphs | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateHypergraphs/ | Enumerate possible ordered hypergraphs with a given signature | hypergraph rewriting, Wolfram models | WSS20 [2029394](https://community.wolfram.com/groups/-/m/t/2029394); WSS21 [2314103](https://community.wolfram.com/groups/-/m/t/2314103) | seen |
| FindCanonicalHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindCanonicalHypergraph/ | Find a canonical version of a directed hypergraph | hypergraph rewriting, Wolfram models | WSS20 [2029394](https://community.wolfram.com/groups/-/m/t/2029394) | seen |
| CanonicalHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalHypergraph/ | Find a canonical version of a directed hypergraph | hypergraph rewriting, Wolfram models | WSS21 [2314103](https://community.wolfram.com/groups/-/m/t/2314103) | seen |
| ConnectedHypergraphQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ConnectedHypergraphQ/ | Determine whether a hypergraph is connected | hypergraph rewriting, Wolfram models | WSS21 [2312354](https://community.wolfram.com/groups/-/m/t/2312354) | seen |
| IsomorphicHypergraphQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IsomorphicHypergraphQ/ | Determine whether two orderless (undirected) hypergraphs are isomorphic | hypergraph rewriting, Wolfram models | WWS25 [25008](https://community.wolfram.com/t/25008); WSS23 [22389](https://community.wolfram.com/t/22389) (paclet version) | seen |
| WolframPhysicsProjectStyleData | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframPhysicsProjectStyleData/ | Look up styles used in the Wolfram Physics Project | hypergraph rewriting, Wolfram models | WSS20 [2027996](https://community.wolfram.com/groups/-/m/t/2027996); WSS20 [2029394](https://community.wolfram.com/groups/-/m/t/2029394); WSS21 [2312958](https://community.wolfram.com/groups/-/m/t/2312958); WWS22 [19410](https://community.wolfram.com/t/19410); and 3 more | seen |
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/ | Compute the evolution of a multiway system and many associated properties | multiway systems, multicomputation | WSC20 [2033895](https://community.wolfram.com/groups/-/m/t/2033895); WSC20 [2034637](https://community.wolfram.com/groups/-/m/t/2034637); WSS20 [16368](https://community.wolfram.com/t/16368); WSS20 [16379](https://community.wolfram.com/t/16379); and 40 more | seen |
| GenerationalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GenerationalMultiwaySystem/ | Compute the evolution of a generational multiway system and many associated properties | multiway systems, multicomputation | WSS20 [2030405](https://community.wolfram.com/groups/-/m/t/2030405) (post text calls it WolframGenerationalMultiwaySystem; listed under this name in the 2020 summer school writeup) | seen |
| MultiwayTuringMachine | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/ | Simulate a nondeterministic Turing machine evolution as a multiway system | multiway systems, multicomputation | WSS20 [2026401](https://community.wolfram.com/groups/-/m/t/2026401); WSS20 [2030103](https://community.wolfram.com/groups/-/m/t/2030103); WSS21 [2312488](https://community.wolfram.com/groups/-/m/t/2312488); WSC22 [20413](https://community.wolfram.com/t/20413); and 2 more | seen |
| MultiwayFunctionSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayFunctionSystem/ | Compute the evolution of a multiway system based on function evaluation over the integers | multiway systems, multicomputation | WWS21 [17412](https://community.wolfram.com/t/17412); WSS22 [20439](https://community.wolfram.com/t/20439); WSS22 [2575004](https://community.wolfram.com/groups/-/m/t/2575004); WWS22 [19409](https://community.wolfram.com/t/19409); and 5 more | seen |
| MultiwayOperatorSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/ | Simulate the evaluation of a formal operator expression as a multiway system | multiway systems, multicomputation | WSS22 [2575951](https://community.wolfram.com/groups/-/m/t/2575951) | seen |
| MultiwayCombinator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayCombinator/ | Simulate the evaluation of a combinator expression as a multiway system | multiway systems, multicomputation | WSC22 [20421](https://community.wolfram.com/t/20421); WWS22 [19409](https://community.wolfram.com/t/19409) | seen |
| MultiwayGroup | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayGroup/ | Simulate an arbitrary (potentially abelian) group as a multiway system | multiway systems, multicomputation | WWS21 [17413](https://community.wolfram.com/t/17413) | seen |
| TokenEventGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph/ | Generate a token-event graph for multicomputational evolution according to particular rules | multiway systems, multicomputation | WSS22 [2574747](https://community.wolfram.com/groups/-/m/t/2574747); WSS24 [3210073](https://community.wolfram.com/groups/-/m/t/3210073) | seen |
| NestGraphTagged | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/NestGraphTagged/ | Create a graph by successively applying a function and differently tagging edges corresponding to different outputs | multiway systems, multicomputation | WSC22 [20384](https://community.wolfram.com/t/20384); WSC22 [20387](https://community.wolfram.com/t/20387); WSS22 [2575839](https://community.wolfram.com/groups/-/m/t/2575839); WWS22 [19409](https://community.wolfram.com/t/19409); and 5 more | seen |
| NestWhileGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/NestWhileGraph/ | Iteratively construct graphs up to a termination condition | multiway systems, multicomputation | WSS23 [2959827](https://community.wolfram.com/groups/-/m/t/2959827); WSRP25 [25762](https://community.wolfram.com/t/25762) | seen |
| FixedPointGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FixedPointGraph/ | Obtain the graph of an iterative computation to a fixed point | multiway systems, multicomputation | WSRP24 [24285](https://community.wolfram.com/t/24285) | seen |
| MultiwayDeletionsGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayDeletionsGraph/ | Explore graph traversals while deleting visited components | multiway systems, multicomputation | WSS22 [2575323](https://community.wolfram.com/groups/-/m/t/2575323) | seen |
| BranchialGraphs | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/BranchialGraphs/ | Depict branch-like connections between components of a directed acyclic graph | multiway systems, multicomputation | WSS22 [2574747](https://community.wolfram.com/groups/-/m/t/2574747) | seen |
| CanonicalKnuthBendixCompletion | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalKnuthBendixCompletion/ | Compute the canonical Knuth-Bendix completion for a given multiway system | multiway systems, multicomputation | WSS20 [2029673](https://community.wolfram.com/groups/-/m/t/2029673) | seen |
| CausalInvariantQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalInvariantQ/ | Determine whether a given multiway system is causal invariant | multiway systems, multicomputation | WSS24 [3209154](https://community.wolfram.com/groups/-/m/t/3209154) | seen |
| MultiReplace | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiReplace/ | Perform replacements and give the positions at which they occur | multiway systems, multicomputation | WSS22 [20338](https://community.wolfram.com/t/20338); WSS22 [20356](https://community.wolfram.com/t/20356) | seen |
| SubstitutionSystemCausalGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalGraph/ | Generate a causal graph from a substitution system using standard updating order | multiway systems, multicomputation, causal graphs | WWS24 [23402](https://community.wolfram.com/t/23402) | seen |
| EnumerateSubstitutionSystemRules | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateSubstitutionSystemRules/ | Enumerate possible inequivalent string substitution rules with a given signature | multiway systems, multicomputation | WSC20 [2034637](https://community.wolfram.com/groups/-/m/t/2034637) | seen |
| MultispacePlot3D | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultispacePlot3D/ | Plot multispace in 3D | multiway systems, multicomputation | WSS20 [2026401](https://community.wolfram.com/groups/-/m/t/2026401) (named in the 2020 summer school writeup) | seen |
| CausalConnectionGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalConnectionGraph/ | Generate a graph giving the relations between regions of causally equivalent events in a causal graph | causal graphs | WSS20 [2029731](https://community.wolfram.com/groups/-/m/t/2029731); WWS22 [19411](https://community.wolfram.com/t/19411); Community [17685](https://community.wolfram.com/t/17685) | seen |
| GraphFoliations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphFoliations/ | Enumerate possible foliations of a directed acyclic graph | causal graphs | FSWS23 [2779503](https://community.wolfram.com/groups/-/m/t/2779503); WSS24 [3209297](https://community.wolfram.com/groups/-/m/t/3209297) | seen |
| LayeredLayoutGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LayeredLayoutGraph/ | Render a graph with vertices arranged in the specified layers | causal graphs | FSWS23 [2779503](https://community.wolfram.com/groups/-/m/t/2779503) | seen |
| VertexStratify | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/VertexStratify/ | Partition the vertices of a directed acyclic graph into time-ordered level sets | causal graphs | WSRP25 [25762](https://community.wolfram.com/t/25762) | seen |
| HasseDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HasseDiagram/ | Construct a Hasse diagram of a poset | causal graphs | WSS21 [2314016](https://community.wolfram.com/groups/-/m/t/2314016) | seen |
| ToDirectedAcyclicGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ToDirectedAcyclicGraph/ | Convert any undirected graph to a cycle-free directed graph | causal graphs | WSS22 [2575423](https://community.wolfram.com/groups/-/m/t/2575423) | seen |
| DirectedAcyclicEvaluate | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DirectedAcyclicEvaluate/ | Evaluate functions locally over any directed acyclic graph | causal graphs | WSS24 [3210476](https://community.wolfram.com/groups/-/m/t/3210476) (Function Repository link in the post) | seen |
| WolframHausdorffDimension | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframHausdorffDimension/ | Compute the Wolfram-Hausdorff dimension of a graph and its associated properties | dimension and curvature | WSS21 [2312426](https://community.wolfram.com/groups/-/m/t/2312426); WSS21 [2313006](https://community.wolfram.com/groups/-/m/t/2313006); WSS22 [2574806](https://community.wolfram.com/groups/-/m/t/2574806); WSS22 [2575606](https://community.wolfram.com/groups/-/m/t/2575606); and 4 more | seen |
| WolframRicciCurvatureScalar | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureScalar/ | Compute the Wolfram-Ricci scalar curvature of a graph and its associated properties | dimension and curvature | WSS23 [22537](https://community.wolfram.com/t/22537); WSS24 [3209154](https://community.wolfram.com/groups/-/m/t/3209154) | seen |
| WolframRicciCurvatureTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureTensor/ | Compute projections of the Wolfram-Ricci curvature tensor of a graph and many associated properties | dimension and curvature | WSS21 [2313006](https://community.wolfram.com/groups/-/m/t/2313006) | seen |
| GraphNeighborhoodVolumes | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphNeighborhoodVolumes/ | Find the volumes of successively larger neighborhoods around nodes in a graph | dimension and curvature | WSC20 [2034307](https://community.wolfram.com/groups/-/m/t/2034307); WSS20 [2027996](https://community.wolfram.com/groups/-/m/t/2027996); WSS20 [2030275](https://community.wolfram.com/groups/-/m/t/2030275); WWS22 [19410](https://community.wolfram.com/t/19410) | seen |
| HypergraphNeighborhoodVolumes | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphNeighborhoodVolumes/ | Find the volumes of successively larger neighborhoods around nodes in a hypergraph | dimension and curvature | WSS20 [2029483](https://community.wolfram.com/groups/-/m/t/2029483); WSS20 [2029995](https://community.wolfram.com/groups/-/m/t/2029995); WSS20 [2030275](https://community.wolfram.com/groups/-/m/t/2030275); WWS22 [19410](https://community.wolfram.com/t/19410) | seen |
| LogDifferences | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/LogDifferences/ | Find logarithmic differences of elements in a list | dimension and curvature | WSC20 [2034307](https://community.wolfram.com/groups/-/m/t/2034307); WSS20 [2029156](https://community.wolfram.com/groups/-/m/t/2029156); WSS20 [2029731](https://community.wolfram.com/groups/-/m/t/2029731); WSS20 [2029995](https://community.wolfram.com/groups/-/m/t/2029995); and 1 more | seen |
| FlatManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FlatManifoldToGraph/ | Produce random spatial graphs by sprinkling points into a flat (Euclidean) Riemannian manifold | dimension and curvature | WSS21 [2313900](https://community.wolfram.com/groups/-/m/t/2313900); WWS22 [19410](https://community.wolfram.com/t/19410) | seen |
| IntrinsicCurvedManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IntrinsicCurvedManifoldToGraph/ | Produce random spatial graphs by sprinkling points into a Riemannian manifold with a specified intrinsic algebraic curvature function | dimension and curvature | WSS21 [2313949](https://community.wolfram.com/groups/-/m/t/2313949) | seen |
| ExtrinsicCurvedManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ExtrinsicCurvedManifoldToGraph/ | Produce random spatial graphs by sprinkling points into a Riemannian manifold with an arbitrary extrinsic curvature | dimension and curvature | WSS21 [2313949](https://community.wolfram.com/groups/-/m/t/2313949) | seen |
| Geodesic | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/Geodesic/ | Compute the geodesics for a parametrized surface | dimension and curvature | WSS20 [2030275](https://community.wolfram.com/groups/-/m/t/2030275) | seen |
| CurvaturePlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvaturePlot/ | Plot a curve defined by its curvature | dimension and curvature | WSS20 [2028929](https://community.wolfram.com/groups/-/m/t/2028929) | seen |
| FlatSpacetimeSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FlatSpacetimeSprinkling/ | Produce random causal graphs by sprinkling points into flat (Minkowski) spacetime | causal sets, causal graphs | WSS21 [2312426](https://community.wolfram.com/groups/-/m/t/2312426); FSWS23 [2777766](https://community.wolfram.com/groups/-/m/t/2777766); WSS24 [3209297](https://community.wolfram.com/groups/-/m/t/3209297); WWS24 [23402](https://community.wolfram.com/t/23402); and 1 more | seen |
| CurvedSpacetimeSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvedSpacetimeSprinkling/ | Produce random causal graphs by sprinkling points into a spacetime with a specified algebraic curvature function | causal sets, causal graphs | WWS24 [23402](https://community.wolfram.com/t/23402) | seen |
| CurvedSpacetimeRegionSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvedSpacetimeRegionSprinkling/ | Produce random causal graphs by sprinkling points into a specified region of a (potentially curved) spacetime | causal sets, causal graphs | WSS21 [2312623](https://community.wolfram.com/groups/-/m/t/2312623); FSWS23 [2777766](https://community.wolfram.com/groups/-/m/t/2777766); WSS23 [22392](https://community.wolfram.com/t/22392); WSS23 [2959318](https://community.wolfram.com/groups/-/m/t/2959318); and 1 more | seen |
| CausalGraphEntanglementEntropyGeneralized | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalGraphEntanglementEntropyGeneralized/ | Compute the entanglement entropy of a certain subgraph of a causal graph (or subset of a causal set) using the generalized/robust approach | causal sets, causal graphs | WSS23 [22392](https://community.wolfram.com/t/22392) (also spelled CausalGraphEntanglementEntropyGeneralised there; only the -ized spelling resolves) | seen |
| MetricTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MetricTensor/ | Represent a metric tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | WSS23 [22392](https://community.wolfram.com/t/22392); WSS23 [2959318](https://community.wolfram.com/groups/-/m/t/2959318); WSS24 [3209154](https://community.wolfram.com/groups/-/m/t/3209154); WSS24 [3209831](https://community.wolfram.com/groups/-/m/t/3209831); and 1 more | seen |
| ChristoffelSymbols | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ChristoffelSymbols/ | Represent the Christoffel symbols for (the Levi-Civita connection over) a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | WSRP26 [27242](https://community.wolfram.com/t/27242) | seen |
| ADMDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ADMDecomposition/ | Represent a canonical decomposition of the metric for a Riemannian or pseudo-Riemannian manifold via the ADM formalism | general relativity (Gravitas) | WSS24 [3209831](https://community.wolfram.com/groups/-/m/t/3209831) | seen |
| DiscreteHypersurfaceDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DiscreteHypersurfaceDecomposition/ | Decompose a Riemannian or pseudo-Riemannian manifold into a union of discrete hypersurfaces | general relativity (Gravitas) | WSS23 [22392](https://community.wolfram.com/t/22392); WSS23 [2959318](https://community.wolfram.com/groups/-/m/t/2959318); WSS24 [3209154](https://community.wolfram.com/groups/-/m/t/3209154); WSS24 [3209831](https://community.wolfram.com/groups/-/m/t/3209831) | seen |
| QuantumToMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumToMultiwaySystem/ | Simulate a quantum evolution as a multiway system | quantum, ZX-calculus | WSS21 [2313182](https://community.wolfram.com/groups/-/m/t/2313182); WSS21 [2315046](https://community.wolfram.com/groups/-/m/t/2315046); WWS21 [17404](https://community.wolfram.com/t/17404); WSS22 [2574866](https://community.wolfram.com/groups/-/m/t/2574866); and 1 more | seen |
| QuantumDiscreteState | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteState/ | Represent a discrete quantum state | quantum, ZX-calculus | WSS21 [2315046](https://community.wolfram.com/groups/-/m/t/2315046); WSS23 [22537](https://community.wolfram.com/t/22537) | seen |
| QuantumCircuitOperator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumCircuitOperator/ | Represent a discrete quantum circuit operator | quantum, ZX-calculus | WSS23 [2959886](https://community.wolfram.com/groups/-/m/t/2959886) | seen |
| MakeZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MakeZXDiagram/ | Make a diagrammatic representation of a linear map in the ZX-calculus | quantum, ZX-calculus | WSS21 [2315046](https://community.wolfram.com/groups/-/m/t/2315046) | seen |
| QuantumDiscreteStateToZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteStateToZXDiagram/ | Convert a pure quantum discrete state into a ZX-diagram | quantum, ZX-calculus | WSS21 [2315046](https://community.wolfram.com/groups/-/m/t/2315046) | seen |
| AbstractCategory | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractCategory/ | Make an abstract model of a category (i.e. a collection of objects and morphisms obeying associativity and identity axioms) | category theory (Categorica) | WSS23 [2958462](https://community.wolfram.com/groups/-/m/t/2958462) | seen |
| AbstractFunctor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractFunctor/ | Make an abstract model of a functor (i.e. a homomorphism between abstract categories) | category theory (Categorica) | WSS23 [2958462](https://community.wolfram.com/groups/-/m/t/2958462) | seen |
| EnumerateCombinators | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateCombinators/ | Generate a list of all combinators with n symbols | combinators, ruliology | WSC22 [20421](https://community.wolfram.com/t/20421); WWS22 [19409](https://community.wolfram.com/t/19409); WSRP24 [24304](https://community.wolfram.com/t/24304) | seen |
| SKCombinatorCompile | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SKCombinatorCompile/ | Represent an expression in terms of the S and K combinators | combinators, ruliology | WSC22 [20421](https://community.wolfram.com/t/20421); WSRP24 [24304](https://community.wolfram.com/t/24304) | seen |
| CombinatorFixedPoint | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorFixedPoint/ | Evolve a combinator expression to its fixed point based on defined rules and evaluation scheme | combinators, ruliology | WSC22 [20421](https://community.wolfram.com/t/20421) | seen |
| CombinatorFixedPointList | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorFixedPointList/ | Show the evolution of a combinator expression to its fixed point based on defined rules and an evaluation scheme | combinators, ruliology | WSRP24 [24304](https://community.wolfram.com/t/24304) | seen |
| CombinatorEvolveList | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolveList/ | Show evolution of a combinator expression for a certain number of steps based on defined rules and an evaluation scheme | combinators, ruliology | WSRP24 [24304](https://community.wolfram.com/t/24304) | seen |
| CombinatorEvolutionPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolutionPlot/ | Visualize the evolution of a combinator expression | combinators, ruliology | WSRP24 [24304](https://community.wolfram.com/t/24304) | seen |
| MobileAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomaton/ | Compute the evolution of a mobile automaton | ruliology | WSS22 [2575004](https://community.wolfram.com/groups/-/m/t/2575004); WSS23 [2960211](https://community.wolfram.com/groups/-/m/t/2960211) | seen |
| MobileAutomatonPlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomatonPlot/ | Visualization of the evolution of a mobile automaton | ruliology | WSS22 [2575004](https://community.wolfram.com/groups/-/m/t/2575004) | seen |
| MobileAutomatonRulePlot | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomatonRulePlot/ | Generate the rule icon for a mobile automaton | ruliology | WSS23 [2960211](https://community.wolfram.com/groups/-/m/t/2960211) | seen |
| IteratedFiniteAutomaton | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IteratedFiniteAutomaton/ | Iteratively apply a transducer finite automaton | ruliology | WSRI26 [3761828](https://community.wolfram.com/groups/-/m/t/3761828) | seen |
| CATransducerGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CATransducerGraph/ | Obtain an annotated state transition graph for any CellularAutomaton rule | ruliology | WSS24 [3210464](https://community.wolfram.com/groups/-/m/t/3210464) | seen |
| IsingModelCA | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IsingModelCA/ | Simulate the Ising model using a cellular automaton | ruliology | FSWS23 [2777995](https://community.wolfram.com/groups/-/m/t/2777995); WSS23 [22412](https://community.wolfram.com/t/22412) | seen |
| AggregationSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AggregationSystem/ | Evolve a 2D array of cells by randomly adding new cells at positions with certain neighborhood configurations | ruliology | WSS19 [1728662](https://community.wolfram.com/groups/-/m/t/1728662); WSS21 [2312514](https://community.wolfram.com/groups/-/m/t/2312514); WSS23 [2959726](https://community.wolfram.com/groups/-/m/t/2959726) | seen |
| HatTrialityTree | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HatTrialityTree/ | Generate trees describing the essential combinatorial structure of the aperiodic hat tiling | ruliology | WSS23 [2958428](https://community.wolfram.com/groups/-/m/t/2958428) | seen |
| HardSphereSimulation | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HardSphereSimulation/ | Simulate hard spheres moving in an n-dimensional box | statistical mechanics, second law | FSWS23 [2778438](https://community.wolfram.com/groups/-/m/t/2778438); WSS24 [3210285](https://community.wolfram.com/groups/-/m/t/3210285) | seen |
| TorusGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TorusGraph/ | Create a grid graph of any dimension with the topology of a torus | graph generators and utilities | WSS21 [2312018](https://community.wolfram.com/groups/-/m/t/2312018); WSRI26 [3763367](https://community.wolfram.com/groups/-/m/t/3763367) | seen |
| KleinBottleGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/KleinBottleGraph/ | Create a grid graph in the shape of a Klein bottle | graph generators and utilities | WSRI26 [3763367](https://community.wolfram.com/groups/-/m/t/3763367) | seen |
| HexagonalGridGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HexagonalGridGraph/ | Generate a graph corresponding to a hexagonal grid | graph generators and utilities | WSS20 [2030734](https://community.wolfram.com/groups/-/m/t/2030734); WWS21 [17421](https://community.wolfram.com/t/17421); WSS23 [22397](https://community.wolfram.com/t/22397); WSS23 [2959571](https://community.wolfram.com/groups/-/m/t/2959571) | seen |
| GraphRemoveLooseEnds | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GraphRemoveLooseEnds/ | Remove low-valence vertices in a graph | graph generators and utilities | WSRP23 [22483](https://community.wolfram.com/t/22483) | seen |
| MetamathImport | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MetamathImport/ | Import and work with a Metamath database | metamathematics | WSS25 [25679](https://community.wolfram.com/t/25679) | seen |
| UnformalizeSymbols | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/UnformalizeSymbols/ | Convert formal symbols in an expression into non-formal versions | metamathematics | WSS22 [2575951](https://community.wolfram.com/groups/-/m/t/2575951) | seen |
| ArrayRotations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ArrayRotations/ | Get the rotations and reflections of an array | games and search | WSS23 [2959726](https://community.wolfram.com/groups/-/m/t/2959726) (Function Repository link in the post) | seen |
| AlphaBetaSearch | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AlphaBetaSearch/ | Find solutions to perfectly played combinatorial games | games and search | WSS24 [3210476](https://community.wolfram.com/groups/-/m/t/3210476) (Function Repository link in the post) | seen |

### B. Paclet and built-in functions used by school projects

Symbols seen in project code after collapsing the letter-spaced code text of the Community notebook embeds, then confirmed by loading the paclet in the kernel (`Names` and usage messages, see Method). Paclet descriptions are from `PacletFindRemote`.

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| Hypergraph | WolframInstitute/Hypergraph | https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ | Hypergraph object of the WolframInstitute/Hypergraph paclet (paclet description: Hypergraph tools) | hypergraph rewriting, Wolfram models | WSS23 [22389](https://community.wolfram.com/t/22389); WSS24 [24244](https://community.wolfram.com/t/24244); WSS24 [3210556](https://community.wolfram.com/groups/-/m/t/3210556); WWS25 [25009](https://community.wolfram.com/t/25009); WSRI26 [3762683](https://community.wolfram.com/groups/-/m/t/3762683) | seen |
| HypergraphRule | WolframInstitute/Hypergraph | https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ | Hypergraph rewriting rule object of the paclet | hypergraph rewriting | WSS23 [22389](https://community.wolfram.com/t/22389); WWS25 [25009](https://community.wolfram.com/t/25009) | seen |
| CanonicalHypergraph | WolframInstitute/Hypergraph | https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ | took a hypergraph and gave its canonical form (post wording) | hypergraph rewriting | WSS23 [22389](https://community.wolfram.com/t/22389) | seen |
| CanonicalHypergraphRule | WolframInstitute/Hypergraph | https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ | took a hypergraph rule and gave its canonical form (post wording) | hypergraph rewriting | WSS23 [22389](https://community.wolfram.com/t/22389) | seen |
| IsomorphicHypergraphQ | WolframInstitute/Hypergraph | https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ | compares two hypergraphs and verifies whether they are isomorphic or not (post wording) | hypergraph rewriting | WSS23 [22389](https://community.wolfram.com/t/22389) | seen |
| SimpleHypergraphPlot | WolframInstitute/Hypergraph | https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ | Plot a hypergraph (used as a VertexShapeFunction in a NestGraph of canonical states) | hypergraph rewriting, visualization | WSS23 [22389](https://community.wolfram.com/t/22389) | seen |
| MultiwaySystem | Wolfram/Multicomputation | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ | Multiway system of the Wolfram/Multicomputation paclet (paclet description: Various functions for multicomputation); the Rewriting the Universe report benchmarks against it | multiway systems, multicomputation | WWS25 [3357778](https://community.wolfram.com/groups/-/m/t/3357778); WWS26 [26347](https://community.wolfram.com/t/26347); Assar 2026 technical report | seen |
| HypergraphMulti | Wolfram/Multicomputation | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ | Multiway evolution of hypergraph-encoded expressions (used with "Graph" property) | multiway systems, multicomputation, metamathematics | WSS22 [2575951](https://community.wolfram.com/groups/-/m/t/2575951) | seen |
| FromLinkedHypergraph | Wolfram/Multicomputation | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ | Convert a linked hypergraph back to an expression ("Expression" property) | multicomputation, metamathematics | WSS22 [2575951](https://community.wolfram.com/groups/-/m/t/2575951) | seen |
| QuantumState | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Represent a quantum state (paclet description: Perform analytic and numeric quantum computations) | quantum | WSS22 [2574363](https://community.wolfram.com/groups/-/m/t/2574363); WSS23 [2959886](https://community.wolfram.com/groups/-/m/t/2959886); WWS24 [23410](https://community.wolfram.com/t/23410); WWS25 [25006](https://community.wolfram.com/t/25006); and 8 more | seen |
| QuantumOperator | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Represent a quantum operator | quantum | WSS22 [2574363](https://community.wolfram.com/groups/-/m/t/2574363); WSS23 [2959959](https://community.wolfram.com/groups/-/m/t/2959959); WWS24 [23410](https://community.wolfram.com/t/23410); and 8 more | seen |
| QuantumCircuitOperator | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | represents a quantum circuit with a list of quantum operators (usage message) | quantum | WSS22 [2574363](https://community.wolfram.com/groups/-/m/t/2574363); WSS23 [2959886](https://community.wolfram.com/groups/-/m/t/2959886); WWS24 [23410](https://community.wolfram.com/t/23410); WSRI26 [3763738](https://community.wolfram.com/groups/-/m/t/3763738); and 7 more | seen |
| QuantumMeasurementOperator | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Represent a quantum measurement operator | quantum | WSS22 [2574363](https://community.wolfram.com/groups/-/m/t/2574363); FSWS23 [2777794](https://community.wolfram.com/groups/-/m/t/2777794); WSRI26 [3763738](https://community.wolfram.com/groups/-/m/t/3763738) | seen |
| QuantumBasis | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Represent a quantum basis (also a WFR function of the same name by Gorard and Shah) | quantum | ZX-calculus II paper (cites the WFR function of this name); the WSS22 [2574363](https://community.wolfram.com/groups/-/m/t/2574363) attribution was removed on verification, the post does not contain the name | seen |
| QuantumChannel | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Represent a quantum channel | quantum | WSS23 [2959886](https://community.wolfram.com/groups/-/m/t/2959886); WSS24 [3209638](https://community.wolfram.com/groups/-/m/t/3209638) | seen |
| QuantumEntanglementMonotone | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Compute an entanglement monotone of a quantum state | quantum | FSWS23 [2778618](https://community.wolfram.com/groups/-/m/t/2778618); WSS23 [2959853](https://community.wolfram.com/groups/-/m/t/2959853); WWS25 [25006](https://community.wolfram.com/t/25006) | seen |
| QuantumTensorProduct | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Tensor product of quantum objects | quantum | WSS23 [2958725](https://community.wolfram.com/groups/-/m/t/2958725); WSS24 [3209980](https://community.wolfram.com/groups/-/m/t/3209980) | seen |
| QuantumPartialTrace | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Partial trace of a quantum object | quantum | WSS23 [2959886](https://community.wolfram.com/groups/-/m/t/2959886); WWS24 [23410](https://community.wolfram.com/t/23410); WWS25 [25006](https://community.wolfram.com/t/25006) | seen |
| QuantumEvolve | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Evolve a quantum state under a Hamiltonian | quantum | WSS24 [3209729](https://community.wolfram.com/groups/-/m/t/3209729) | seen |
| QuantumDistance | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | Distance between quantum states | quantum | FSWS23 [2778618](https://community.wolfram.com/groups/-/m/t/2778618) | seen |
| QuantumCircuitMultiwayGraph | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | represents a multiway graph of the quantum circuit (usage message) | quantum, multiway systems, branchial graphs | WWS25 [25006](https://community.wolfram.com/t/25006) | seen |
| WolframModel | SetReplace | https://github.com/maxitg/SetReplace | generates an object representing the evolution of the Wolfram model with the specified rules from the initial condition init for generationCount generations (usage message) | hypergraph rewriting, Wolfram models | WSS20 [2029848](https://community.wolfram.com/groups/-/m/t/2029848); WSS21 [2314231](https://community.wolfram.com/groups/-/m/t/2314231); WSS23 [2959098](https://community.wolfram.com/groups/-/m/t/2959098); WWS25 [25008](https://community.wolfram.com/t/25008); WSRI26 [3763367](https://community.wolfram.com/groups/-/m/t/3763367) | seen |
| WolframModelPlot | SetReplace | https://github.com/maxitg/SetReplace | plots an ordered hypergraph represented as a list of vertex lists (usage message, shared with HypergraphPlot) | hypergraph rewriting, visualization | WSS22 [20366](https://community.wolfram.com/t/20366); WSRP24 [24285](https://community.wolfram.com/t/24285) | seen |
| HypergraphPlot | SetReplace | https://github.com/maxitg/SetReplace | plots an ordered hypergraph represented as a list of vertex lists (usage message) | hypergraph rewriting, visualization | WSS19 [1729148](https://community.wolfram.com/groups/-/m/t/1729148); WSS22 [20366](https://community.wolfram.com/t/20366) | seen |
| WolframModelEvolutionObject | SetReplace | https://github.com/maxitg/SetReplace | is an evolution object generated by WolframModel (usage message) | Wolfram models | WSS20 [2029848](https://community.wolfram.com/groups/-/m/t/2029848); WWS21 [17414](https://community.wolfram.com/t/17414); WSS22 [20366](https://community.wolfram.com/t/20366) | seen |
| SetReplace | SetReplace | https://github.com/maxitg/SetReplace | attempts to replace a subset input of set with output (usage message) | hypergraph rewriting | WSS19 [1729148](https://community.wolfram.com/groups/-/m/t/1729148); WSS20 [2028486](https://community.wolfram.com/groups/-/m/t/2028486) | seen |
| SetSubstitutionSystem | SetReplace | https://github.com/maxitg/SetReplace | Earlier name used in the 2019 confluent set substitution systems project ("CausalNetwork" property); symbol still exists in SetReplace 0.3.196 without a usage message | hypergraph rewriting, causal graphs | WSS19 [1729148](https://community.wolfram.com/groups/-/m/t/1729148) | seen |
| HypergraphAutomorphismGroup | SetReplace | https://github.com/maxitg/SetReplace | gives the automorphism group of hypergraph represented as a list of hyperedges (usage message); the FSWS23 post describes a function of this name built from GraphAutomorphismGroup | hypergraph rewriting | FSWS23 [2777621](https://community.wolfram.com/groups/-/m/t/2777621) | seen |
| GeneralizedGridGraph | SetReplace | https://github.com/maxitg/SetReplace | gives the k-dimensional grid graph, optionally "Circular" in a dimension (usage message; also a WFR function by Max Piskunov) | graph generators and utilities | WSRI26 [3763367](https://community.wolfram.com/groups/-/m/t/3763367) | seen |
| TransitiveReductionGraph | WL | https://reference.wolfram.com/language/ref/TransitiveReductionGraph.html | Built-in transitive reduction of a graph, used to reduce causal graphs | causal graphs | WSS22 [2575606](https://community.wolfram.com/groups/-/m/t/2575606); WSS22 [2575710](https://community.wolfram.com/groups/-/m/t/2575710) | seen |
| NestGraph | WL | https://reference.wolfram.com/language/ref/NestGraph.html | Built-in graph of iterated function application, used to build state graphs of canonical hypergraphs | multiway systems | WSS23 [22389](https://community.wolfram.com/t/22389); WSRI26 [3763367](https://community.wolfram.com/groups/-/m/t/3763367) | seen |

### C. Project-local functions, packages and repositories from school projects

These names were seen in project posts but are not Function Repository or Paclet Repository resources (`ResourceObject` returned nothing for each), so they are recorded as project-local reusable code; "seen" in the Status column means the name was found on the linked page or repository, not that it is a published resource. They mark places where a paclet could absorb summer school work.

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| RuliadTrotter | Community | https://community.wolfram.com/groups/-/m/t/2575951 | Meta-modeling metamathematical observers: package built on MultiwayOperatorSystem and the Multicomputation paclet; reused by three later posts | rulial space, metamathematics, observer theory | WSS22 [2575951](https://community.wolfram.com/groups/-/m/t/2575951); FSWS23 [2777734](https://community.wolfram.com/groups/-/m/t/2777734); WWS24 [3100969](https://community.wolfram.com/groups/-/m/t/3100969); WSS25 [3496072](https://community.wolfram.com/groups/-/m/t/3496072); WSRI26 [3763276](https://community.wolfram.com/groups/-/m/t/3763276) | seen |
| HyperPlot | Community | https://community.wolfram.com/t/24285 | generation of temporally coherent hypergraphs (physics-simulation layout of SetReplace evolutions) | hypergraph rewriting, visualization | WSRP24 [24285](https://community.wolfram.com/t/24285); cited by WSS24 [24244](https://community.wolfram.com/t/24244) and FSWS23 [2775300](https://community.wolfram.com/groups/-/m/t/2775300) | seen |
| MultiwayLifetime | Community | https://community.wolfram.com/groups/-/m/t/3763652 | Fitness metric in a Wolfram Language paclet for adaptive evolution over hypergraph rule space (paclet name not given in the post) | hypergraph rewriting, adaptive evolution, ruliology | WSRI26 [3763652](https://community.wolfram.com/groups/-/m/t/3763652) | seen |
| CayleyHypergraph | Community | https://community.wolfram.com/groups/-/m/t/3762683 | Draw the Cayley hypergraph of a hypergroup; CayleyHypergraphObject builds the same object with the WolframInstitute/Hypergraph paclet | hypergraph rewriting, entailment graphs | WSRI26 [3762683](https://community.wolfram.com/groups/-/m/t/3762683) | seen |
| CausalDiamondDimensionEstimator | Community | https://community.wolfram.com/t/17414 | estimate the dimension of the graph starting from a random sample of the starting events (post wording) | dimension and curvature, causal graphs | WWS21 [17414](https://community.wolfram.com/t/17414) | seen |
| CausalGraphEntanglementEntropyGeneralised | Community | https://community.wolfram.com/t/22392 | British spelling used in the WSS23 post for the WFR function CausalGraphEntanglementEntropyGeneralized | causal sets, quantum | WSS23 [22392](https://community.wolfram.com/t/22392) | seen |
| QuantumToMultiwayFunction | Community | https://community.wolfram.com/groups/-/m/t/2778080 | Name in the FSWS23 post title The Experimental Correlates of QuantumToMultiwayFunction; the post code uses QuantumToMultiwaySystem | quantum, multiway systems | FSWS23 [2778080](https://community.wolfram.com/groups/-/m/t/2778080) | seen |
| ZXTensorNetwork | Wolfram/QuantumFramework | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ | converts the output of the toZX function into a string diagram which is returned as a graphic (post wording, credited to Nikolay Murzin); the post defines it inline with the same definition that Kernel/ZX.m of Wolfram/QuantumFramework 2.1.1 exports (PackageExport, not on the paclet guide page) | ZX-calculus, quantum | WWS24 [23410](https://community.wolfram.com/t/23410) | seen |
| AdinkraGraph | Community | https://community.wolfram.com/groups/-/m/t/2576265 | Adinkra graphs (supersymmetry) built with WolframModelPlot | Wolfram models, gauge theory | WSS22 [2576265](https://community.wolfram.com/groups/-/m/t/2576265) | seen |
| CreateFibreBundleGraph | Community | https://community.wolfram.com/groups/-/m/t/2312018 | Build a discrete principal fibre bundle graph from a base graph and a group (the torus case is isomorphic to TorusGraph) | gauge theory, graph generators and utilities | WSS21 [2312018](https://community.wolfram.com/groups/-/m/t/2312018) | seen |
| MultiwayGames | Community | https://community.wolfram.com/groups/-/m/t/2574363 | Multiway graphs of quantum probabilistic tic-tac-toe built on the QuantumFramework paclet | multiway systems, games and search, quantum | WSS22 [2574363](https://community.wolfram.com/groups/-/m/t/2574363) | seen |
| MultiwayChemicalReactionNetwork | Community | https://community.wolfram.com/groups/-/m/t/3210073 | Multiway chemical reaction networks analysed with chemical space networks and TokenEventGraph | multiway systems, chemistry | WSS24 [3210073](https://community.wolfram.com/groups/-/m/t/3210073) | seen |
| MultiwayTagSystem | Community | https://community.wolfram.com/groups/-/m/t/2575839 | Multi-way tag systems in coordinatized rulial space (with RandomMultiwayTagSystem), built on MultiwaySystem and NestGraphTagged | rulial space, multiway systems | WSS22 [2575839](https://community.wolfram.com/groups/-/m/t/2575839) | seen |
| PhysicalMultiwaySystem | Community | https://community.wolfram.com/groups/-/m/t/3357778 | Select the physical (Leibnizian) part of a Multicomputation MultiwaySystem graph; code in the fsdundar/wws25 repository | multiway systems, quantum | WWS25 [3357778](https://community.wolfram.com/groups/-/m/t/3357778) | seen |
| WeylMultiwaySystem | SamWhittington/WeylMultiwaySystem | https://github.com/SamWhittington/WeylMultiwaySystem | Multiway systems of Dynkin diagrams / Weyl groups as a Mathematica package | multiway systems, Lie algebras | WWS21 [17412](https://community.wolfram.com/t/17412) | seen |
| QuiverGeometry | taliesinb/QuiverGeometry | https://github.com/taliesinb/QuiverGeometry | Taliesin Beynon package for quiver geometry, lattice quivers and rewriting, used by three physics-track projects; the repository was renamed and the URL now redirects to https://github.com/taliesinb/MathTools | discrete geometry, graph rewriting | WSS21 [2314740](https://community.wolfram.com/groups/-/m/t/2314740); WSS22 [2575438](https://community.wolfram.com/groups/-/m/t/2575438); WWS22 [19402](https://community.wolfram.com/t/19402) | seen |
| HypergraphTools.wl | Community | https://community.wolfram.com/groups/-/m/t/2314103 | Cloud package (wolframcloud.com/obj/daniels/HypergraphTools.wl, which now returns a Wolfram sign-in page) wrapping EnumerateHypergraphs, EnumerateWolframModelRules and CanonicalHypergraph for coarse-graining state networks | hypergraph rewriting, multiway systems | WSS21 [2314103](https://community.wolfram.com/groups/-/m/t/2314103) | seen |
| Classify-Growth-Rates-for-Wolfram-Models | jatin1109/Classify-Growth-Rates-for-Wolfram-Models | https://github.com/jatin1109/Classify-Growth-Rates-for-Wolfram-Models | Function definitions and notebook database for classifying Wolfram model growth rates | Wolfram models, ruliology | WSS20 [2028496](https://community.wolfram.com/groups/-/m/t/2028496) | seen |
| WSS23_AggSystems | LexLoki/WSS23_AggSystems | https://github.com/LexLoki/WSS23_AggSystems | Efficient discovery of halting paths in aggregation system multiway graphs | multiway systems, ruliology | WSS23 [2959726](https://community.wolfram.com/groups/-/m/t/2959726) | seen |
| wolfram-model-variety | fsdundar/wolfram-model-variety | https://github.com/fsdundar/wolfram-model-variety | Furkan Semih Dundar code for Wolfram model variety and cyclic string quantum theory (with fsdundar/wws25 and fsdundar/qstr-monads) | multiway systems, quantum | WWS25 [3357778](https://community.wolfram.com/groups/-/m/t/3357778); Dundar, Arsiwalla, Elshatlawy 2025 (arXiv 2512.20587) | seen |
| SetReplace (GitHub) | maxitg/SetReplace | https://github.com/maxitg/SetReplace | Wolfram Language package and C++ library for hypergraph rewriting (Max Piskunov); cited by both 2020 launch papers and by the Rewriting the Universe report | hypergraph rewriting, Wolfram models | WSS20 [2028486](https://community.wolfram.com/groups/-/m/t/2028486); WSS20 [2029848](https://community.wolfram.com/groups/-/m/t/2029848); WSS21 [2314231](https://community.wolfram.com/groups/-/m/t/2314231); WSS23 [2959098](https://community.wolfram.com/groups/-/m/t/2959098); WSRI26 [3763367](https://community.wolfram.com/groups/-/m/t/3763367) | seen |

### D. Functions and code cited by the technical papers

For each paper the hyperlinks in the ar5iv HTML (or the pdftotext output for the two 2020 launch papers and the Pregeometric Spaces paper) were extracted; every Function Repository, Paclet Repository and GitHub link is recorded here. Existence and descriptions were confirmed in the kernel except where marked unconfirmed.

#### Gorard 2020, Some Relativistic and Gravitational Properties of the Wolfram Model

Source: https://arxiv.org/abs/2004.14810

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| SetReplace | GitHub | https://github.com/maxitg/SetReplace | the SetReplace paclet, used (among other things) to produce the figures (paper wording) | hypergraph rewriting, Wolfram models | Gorard 2020, Some Relativistic and Gravitational Properties of the Wolfram Model (arXiv 2004.14810) | seen |

#### Gorard 2020, Some Quantum Mechanical Properties of the Wolfram Model (wolframcloud PDF)

Source: https://www.wolframcloud.com/obj/wolframphysics/Documents/some-quantum-mechanical-properties-of-the-wolfram-model.pdf

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| SetReplace | GitHub | https://github.com/maxitg/SetReplace | the SetReplace paclet (reference 99) | hypergraph rewriting, Wolfram models | Gorard 2020, Some Quantum Mechanical Properties of the Wolfram Model (wolframcloud PDF) | seen |

#### Gorard 2020, Algorithmic Causal Sets and the Wolfram Model

Source: https://arxiv.org/abs/2011.12174

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| FlatSpacetimeSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FlatSpacetimeSprinkling/ | Produce random causal graphs by sprinkling points into flat (Minkowski) spacetime | causal sets, causal graphs | Gorard 2020, Algorithmic Causal Sets and the Wolfram Model (arXiv 2011.12174) | seen |
| CurvedSpacetimeSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvedSpacetimeSprinkling/ | Produce random causal graphs by sprinkling points into a spacetime with a specified algebraic curvature function | causal sets, causal graphs | Gorard 2020, Algorithmic Causal Sets and the Wolfram Model (arXiv 2011.12174) | seen |
| CurvedSpacetimeRegionSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvedSpacetimeRegionSprinkling/ | Produce random causal graphs by sprinkling points into a specified region of a (potentially curved) spacetime | causal sets, causal graphs | Gorard 2020, Algorithmic Causal Sets and the Wolfram Model (arXiv 2011.12174) | seen |

#### Gorard, Namuduri, Arsiwalla 2020, ZX-Calculus and Extended Hypergraph Rewriting Systems I

Source: https://arxiv.org/abs/2010.02752

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| MakeZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MakeZXDiagram/ | Make a diagrammatic representation of a linear map in the ZX-calculus | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2020, ZX-Calculus and Extended Hypergraph Rewriting Systems I (arXiv 2010.02752) | seen |
| MultiwayOperatorSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/ | Simulate the evaluation of a formal operator expression as a multiway system | multiway systems, multicomputation | Gorard, Namuduri, Arsiwalla 2020, ZX-Calculus and Extended Hypergraph Rewriting Systems I (arXiv 2010.02752) | seen |
| QuantumToMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumToMultiwaySystem/ | Simulate a quantum evolution as a multiway system | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2020, ZX-Calculus and Extended Hypergraph Rewriting Systems I (arXiv 2010.02752) | seen |
| ZXMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ZXMultiwaySystem/ | Linked from the paper as a Function Repository resource but ResourceObject["ZXMultiwaySystem"] fails in WL 15 (not published or withdrawn) | ZX-calculus, multiway systems | Gorard, Namuduri, Arsiwalla 2020, ZX-Calculus and Extended Hypergraph Rewriting Systems I (arXiv 2010.02752) | unconfirmed |

#### Gorard, Namuduri, Arsiwalla 2021, ZX-Calculus and Extended Wolfram Model Systems II

Source: https://arxiv.org/abs/2103.15820

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| MakeZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MakeZXDiagram/ | Make a diagrammatic representation of a linear map in the ZX-calculus | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2021, ZX-Calculus and Extended Wolfram Model Systems II (arXiv 2103.15820) | seen |
| MultiwayOperatorSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/ | Simulate the evaluation of a formal operator expression as a multiway system | multiway systems, multicomputation | Gorard, Namuduri, Arsiwalla 2021, ZX-Calculus and Extended Wolfram Model Systems II (arXiv 2103.15820) | seen |
| FindWolframModelProof | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindWolframModelProof/ | Try to find a proof of equivalence between hypergraphs in a given multiway Wolfram model system | multiway systems, automated theorem proving, hypergraph rewriting | Gorard, Namuduri, Arsiwalla 2021, ZX-Calculus and Extended Wolfram Model Systems II (arXiv 2103.15820) | seen |
| QuantumBasis | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumBasis/ | Represent a quantum basis | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2021, ZX-Calculus and Extended Wolfram Model Systems II (arXiv 2103.15820) | seen |
| QuantumDiscreteState | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteState/ | Represent a discrete quantum state | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2021, ZX-Calculus and Extended Wolfram Model Systems II (arXiv 2103.15820) | seen |
| QuantumDiscreteOperator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteOperator/ | Represent a discrete quantum operator | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2021, ZX-Calculus and Extended Wolfram Model Systems II (arXiv 2103.15820) | seen |

#### Gorard, Namuduri, Arsiwalla 2021, Fast Automated Reasoning over String Diagrams using Multiway Causal Structure

Source: https://arxiv.org/abs/2105.04057

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| MakeZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MakeZXDiagram/ | Make a diagrammatic representation of a linear map in the ZX-calculus | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2021, Fast Automated Reasoning over String Diagrams using Multiway Causal Structure (arXiv 2105.04057) | seen |
| MultiwayOperatorSystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/ | Simulate the evaluation of a formal operator expression as a multiway system | multiway systems, multicomputation | Gorard, Namuduri, Arsiwalla 2021, Fast Automated Reasoning over String Diagrams using Multiway Causal Structure (arXiv 2105.04057) | seen |
| FindWolframModelProof | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindWolframModelProof/ | Try to find a proof of equivalence between hypergraphs in a given multiway Wolfram model system | multiway systems, automated theorem proving, hypergraph rewriting | Gorard, Namuduri, Arsiwalla 2021, Fast Automated Reasoning over String Diagrams using Multiway Causal Structure (arXiv 2105.04057) | seen |
| QuantumDiscreteStateToZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteStateToZXDiagram/ | Convert a pure quantum discrete state into a ZX-diagram | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2021, Fast Automated Reasoning over String Diagrams using Multiway Causal Structure (arXiv 2105.04057) | seen |
| ZXDiagramToQuantumDiscreteState | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ZXDiagramToQuantumDiscreteState/ | Convert a ZX-diagram into a pure quantum discrete state | quantum, ZX-calculus | Gorard, Namuduri, Arsiwalla 2021, Fast Automated Reasoning over String Diagrams using Multiway Causal Structure (arXiv 2105.04057) | seen |

#### Gorard 2021, Hypergraph Discretization of the Cauchy Problem in General Relativity via Wolfram Model Evolution

Source: https://arxiv.org/abs/2102.09363

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| IntrinsicCurvedManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/IntrinsicCurvedManifoldToGraph/ | Produce random spatial graphs by sprinkling points into a Riemannian manifold with a specified intrinsic algebraic curvature function | dimension and curvature | Gorard 2021, Hypergraph Discretization of the Cauchy Problem in General Relativity via Wolfram Model Evolution (arXiv 2102.09363) | seen |
| ExtrinsicCurvedManifoldToGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ExtrinsicCurvedManifoldToGraph/ | Produce random spatial graphs by sprinkling points into a Riemannian manifold with an arbitrary extrinsic curvature | dimension and curvature | Gorard 2021, Hypergraph Discretization of the Cauchy Problem in General Relativity via Wolfram Model Evolution (arXiv 2102.09363) | seen |
| CurvedSpacetimeRegionSprinkling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CurvedSpacetimeRegionSprinkling/ | Produce random causal graphs by sprinkling points into a specified region of a (potentially curved) spacetime | causal sets, causal graphs | Gorard 2021, Hypergraph Discretization of the Cauchy Problem in General Relativity via Wolfram Model Evolution (arXiv 2102.09363) | seen |
| WolframRicciCurvatureScalar | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureScalar/ | Compute the Wolfram-Ricci scalar curvature of a graph and its associated properties | dimension and curvature | Gorard 2021, Hypergraph Discretization of the Cauchy Problem in General Relativity via Wolfram Model Evolution (arXiv 2102.09363) | seen |
| WolframRicciCurvatureTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureTensor/ | Compute projections of the Wolfram-Ricci curvature tensor of a graph and many associated properties | dimension and curvature | Gorard 2021, Hypergraph Discretization of the Cauchy Problem in General Relativity via Wolfram Model Evolution (arXiv 2102.09363) | seen |

#### Arsiwalla, Gorard 2021, Pregeometric Spaces from Wolfram Model Rewriting Systems as Homotopy Types

Source: https://arxiv.org/abs/2111.03460

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| Wolfram Physics Project tools guide page | Other | https://www.wolframcloud.com/obj/wolframphysics/Tools/guide-page | Software for reproducing all the above Wolfram model objects can be found here (paper wording); no function names given | Wolfram models, multiway systems | Arsiwalla, Gorard 2021, Pregeometric Spaces from Wolfram Model Rewriting Systems as Homotopy Types (arXiv 2111.03460) | seen |

#### Arsiwalla, Gorard, Elshatlawy 2021, Homotopies in Multiway (Non-Deterministic) Rewriting Systems as n-Fold Categories

Source: https://arxiv.org/abs/2105.10822

No Function Repository, Paclet Repository or GitHub links found in the paper text.

#### Gorard 2022, A Functorial Perspective on (Multi)computational Irreducibility

Source: https://arxiv.org/abs/2301.04690

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/ | Compute the evolution of a multiway system and many associated properties | multiway systems, multicomputation | Gorard 2022, A Functorial Perspective on (Multi)computational Irreducibility (arXiv 2301.04690) | seen |
| MultiwayTuringMachine | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/ | Simulate a nondeterministic Turing machine evolution as a multiway system | multiway systems, multicomputation | Gorard 2022, A Functorial Perspective on (Multi)computational Irreducibility (arXiv 2301.04690) | seen |
| TuringMachineGlocalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineGlocalMultiwaySystem/ | Simulate the evolution of a nondeterministic Turing machine as a "glocal" (hybrid of global and local) multiway system | multiway systems, multicomputation | Gorard 2022, A Functorial Perspective on (Multi)computational Irreducibility (arXiv 2301.04690) | seen |
| AbstractCategory | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractCategory/ | Make an abstract model of a category (i.e. a collection of objects and morphisms obeying associativity and identity axioms) | category theory (Categorica) | Gorard 2022, A Functorial Perspective on (Multi)computational Irreducibility (arXiv 2301.04690) | seen |
| AbstractFunctor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractFunctor/ | Make an abstract model of a functor (i.e. a homomorphism between abstract categories) | category theory (Categorica) | Gorard 2022, A Functorial Perspective on (Multi)computational Irreducibility (arXiv 2301.04690) | seen |
| AbstractStrictMonoidalCategory | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractStrictMonoidalCategory/ | Make an abstract model of a category equipped with a strictly associative and unital tensor product structure | category theory (Categorica) | Gorard 2022, A Functorial Perspective on (Multi)computational Irreducibility (arXiv 2301.04690) | seen |

#### Gorard, Dannemann-Freitag 2023, Axiomatic Quantum Field Theory in Discrete Spacetime via Multiway Causal Structure

Source: https://arxiv.org/abs/2301.12455

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| CausalGraphEntanglementEntropyGeneralized | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalGraphEntanglementEntropyGeneralized/ | Compute the entanglement entropy of a certain subgraph of a causal graph (or subset of a causal set) using the generalized/robust approach | causal sets, causal graphs | Gorard, Dannemann-Freitag 2023, Axiomatic Quantum Field Theory in Discrete Spacetime via Multiway Causal Structure (arXiv 2301.12455) | seen |
| CausalGraphEntanglementEntropyNaive | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/CausalGraphEntanglementEntropyNaive/ | Compute the entanglement entropy of a certain subgraph of a causal graph (or subset of a causal set) using the naive/fragile approach | causal sets, causal graphs | Gorard, Dannemann-Freitag 2023, Axiomatic Quantum Field Theory in Discrete Spacetime via Multiway Causal Structure (arXiv 2301.12455) | seen |
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/ | Compute the evolution of a multiway system and many associated properties | multiway systems, multicomputation | Gorard, Dannemann-Freitag 2023, Axiomatic Quantum Field Theory in Discrete Spacetime via Multiway Causal Structure (arXiv 2301.12455) | seen |
| WolframHausdorffDimension | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframHausdorffDimension/ | Compute the Wolfram-Hausdorff dimension of a graph and its associated properties | dimension and curvature | Gorard, Dannemann-Freitag 2023, Axiomatic Quantum Field Theory in Discrete Spacetime via Multiway Causal Structure (arXiv 2301.12455) | seen |
| WolframRicciCurvatureScalar | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureScalar/ | Compute the Wolfram-Ricci scalar curvature of a graph and its associated properties | dimension and curvature | Gorard, Dannemann-Freitag 2023, Axiomatic Quantum Field Theory in Discrete Spacetime via Multiway Causal Structure (arXiv 2301.12455) | seen |
| WolframRicciCurvatureTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureTensor/ | Compute projections of the Wolfram-Ricci curvature tensor of a graph and many associated properties | dimension and curvature | Gorard, Dannemann-Freitag 2023, Axiomatic Quantum Field Theory in Discrete Spacetime via Multiway Causal Structure (arXiv 2301.12455) | seen |
| Gravitas | GitHub | https://github.com/JonathanGorard/Gravitas | open source Gravitas package on GitHub (paper wording) | general relativity (Gravitas) | Gorard, Dannemann-Freitag 2023, Axiomatic Quantum Field Theory in Discrete Spacetime via Multiway Causal Structure (arXiv 2301.12455) | seen |

#### Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems

Source: https://arxiv.org/abs/2303.07282

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| MetricTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MetricTensor/ | Represent a metric tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |
| RicciTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RicciTensor/ | Represent the Ricci curvature tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/ | Compute the evolution of a multiway system and many associated properties | multiway systems, multicomputation | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |
| ADMDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ADMDecomposition/ | Represent a canonical decomposition of the metric for a Riemannian or pseudo-Riemannian manifold via the ADM formalism | general relativity (Gravitas) | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |
| DiscreteHypersurfaceDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DiscreteHypersurfaceDecomposition/ | Decompose a Riemannian or pseudo-Riemannian manifold into a union of discrete hypersurfaces | general relativity (Gravitas) | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |
| StressEnergyTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StressEnergyTensor/ | Represent a stress-energy tensor (field) over a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |
| SolveEinsteinEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SolveEinsteinEquations/ | Determine whether a given stress-energy tensor (field) is a solution to the Einstein field equations | general relativity (Gravitas) | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |
| SolveVacuumEinsteinEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SolveVacuumEinsteinEquations/ | Determine whether a given Riemannian or pseudo-Riemannian manifold is a solution to the vacuum Einstein field equations | general relativity (Gravitas) | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |
| Gravitas | GitHub | https://github.com/JonathanGorard/Gravitas | Gravitas package on GitHub, with ADMDecomposition.wl, DiscreteHypersurfaceDecomposition.wl, SolveEinsteinEquations.wl, SolveVacuumEinsteinEquations.wl and StressEnergyTensor.wl linked | general relativity (Gravitas) | Gorard 2023, Non-Vacuum Solutions, Gravitational Collapse and Discrete Singularity Theorems in Wolfram Model Systems (arXiv 2303.07282) | seen |

#### Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I

Source: https://arxiv.org/abs/2308.07508

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| MetricTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MetricTensor/ | Represent a metric tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| ChristoffelSymbols | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ChristoffelSymbols/ | Represent the Christoffel symbols for (the Levi-Civita connection over) a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| RiemannTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RiemannTensor/ | Represent the Riemann curvature tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| RicciTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RicciTensor/ | Represent the Ricci curvature tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| EinsteinTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EinsteinTensor/ | Represent the Einstein curvature tensor (field) for a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| StressEnergyTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StressEnergyTensor/ | Represent a stress-energy tensor (field) over a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| ADMDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ADMDecomposition/ | Represent a canonical decomposition of the metric for a Riemannian or pseudo-Riemannian manifold via the ADM formalism | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| DiscreteHypersurfaceDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DiscreteHypersurfaceDecomposition/ | Decompose a Riemannian or pseudo-Riemannian manifold into a union of discrete hypersurfaces | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| SolveEinsteinEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SolveEinsteinEquations/ | Determine whether a given stress-energy tensor (field) is a solution to the Einstein field equations | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| SolveVacuumEinsteinEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SolveVacuumEinsteinEquations/ | Determine whether a given Riemannian or pseudo-Riemannian manifold is a solution to the vacuum Einstein field equations | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |
| Gravitas | GitHub | https://github.com/JonathanGorard/Gravitas/ | official GitHub Repository of the Gravitas codebase, over 27,000 lines (paper wording) | general relativity (Gravitas) | Gorard 2023, Computational General Relativity in the Wolfram Language using Gravitas I (arXiv 2308.07508) | seen |

#### Gorard 2024, Computational General Relativity in the Wolfram Language using Gravitas II

Source: https://arxiv.org/abs/2401.14209

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| ADMDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ADMDecomposition/ | Represent a canonical decomposition of the metric for a Riemannian or pseudo-Riemannian manifold via the ADM formalism | general relativity (Gravitas) | Gorard 2024, Computational General Relativity in the Wolfram Language using Gravitas II (arXiv 2401.14209) | seen |
| DiscreteHypersurfaceDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DiscreteHypersurfaceDecomposition/ | Decompose a Riemannian or pseudo-Riemannian manifold into a union of discrete hypersurfaces | general relativity (Gravitas) | Gorard 2024, Computational General Relativity in the Wolfram Language using Gravitas II (arXiv 2401.14209) | seen |
| SolveVacuumADMEquations | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SolveVacuumADMEquations/ | Determine whether a given ADM decomposition is a solution to the vacuum ADM equations | general relativity (Gravitas) | Gorard 2024, Computational General Relativity in the Wolfram Language using Gravitas II (arXiv 2401.14209) | seen |
| Gravitas | GitHub | https://github.com/JonathanGorard/Gravitas/ | Gravitas GitHub repository, approximately 30,000 lines (paper wording) | general relativity (Gravitas) | Gorard 2024, Computational General Relativity in the Wolfram Language using Gravitas II (arXiv 2401.14209) | seen |

#### Gorard 2024, General Relativistic Hydrodynamics in Discrete Spacetime

Source: https://arxiv.org/abs/2402.02331

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| ADMDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ADMDecomposition/ | Represent a canonical decomposition of the metric for a Riemannian or pseudo-Riemannian manifold via the ADM formalism | general relativity (Gravitas) | Gorard 2024, General Relativistic Hydrodynamics in Discrete Spacetime (arXiv 2402.02331) | seen |
| StressEnergyTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/StressEnergyTensor/ | Represent a stress-energy tensor (field) over a Riemannian or pseudo-Riemannian manifold | general relativity (Gravitas) | Gorard 2024, General Relativistic Hydrodynamics in Discrete Spacetime (arXiv 2402.02331) | seen |
| Gravitas | GitHub | https://github.com/JonathanGorard/Gravitas/ | Gravitas GitHub repository | general relativity (Gravitas) | Gorard 2024, General Relativistic Hydrodynamics in Discrete Spacetime (arXiv 2402.02331) | seen |

#### Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I

Source: https://arxiv.org/abs/2403.16269

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| AbstractCategory | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractCategory/ | Make an abstract model of a category (i.e. a collection of objects and morphisms obeying associativity and identity axioms) | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |
| AbstractFunctor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractFunctor/ | Make an abstract model of a functor (i.e. a homomorphism between abstract categories) | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |
| AbstractQuiver | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractQuiver/ | Make an abstract model of a quiver (i.e. a directed multigraph) that forms the basis of an abstract category | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |
| AbstractStrictMonoidalCategory | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractStrictMonoidalCategory/ | Make an abstract model of a category equipped with a strictly associative and unital tensor product structure | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |
| AbstractProduct | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractProduct/ | Represent the abstract product of an arbitrary collection of objects in an abstract category | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |
| AbstractCoproduct | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractCoproduct/ | Represent the abstract coproduct of an arbitrary collection of objects in an abstract category | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |
| AbstractPullback | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractPullback/ | Represent the abstract pullback of a collection of morphisms with common codomain in an abstract category | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |
| AbstractPushout | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/AbstractPushout/ | Represent the abstract pushout of a collection of morphisms with common domain in an abstract category | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |
| Categorica | GitHub | http://github.com/JonathanGorard/Categorica | Categorica GitHub Repository, over 20,000 lines of symbolic Wolfram Language code (paper wording) | category theory (Categorica) | Gorard 2024, Applied Category Theory in the Wolfram Language using Categorica I (arXiv 2403.16269) | seen |

#### Rickles, Elshatlawy, Arsiwalla 2023, Ruliology: Linking Computation, Observers and Physical Law

Source: https://arxiv.org/abs/2308.16068

No Function Repository, Paclet Repository or GitHub links found in the paper text.

#### Arsiwalla, Elshatlawy, Rickles 2023, Pregeometry, Formal Language and Constructivist Foundations of Physics

Source: https://arxiv.org/abs/2311.03973

No Function Repository, Paclet Repository or GitHub links found in the paper text.

#### Elshatlawy, Rickles, Arsiwalla 2025, Towards a Generalized Theory of Observers

Source: https://arxiv.org/abs/2504.16225

No Function Repository, Paclet Repository or GitHub links found in the paper text.

#### Dundar, Arsiwalla, Elshatlawy 2025, Quantum Gates from Wolfram Model Multiway Rewriting Systems

Source: https://arxiv.org/abs/2512.20587

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| qstr-monads | GitHub | https://github.com/fsdundar/qstr-monads | Code related to the present study (paper wording) | multiway systems, quantum | Dundar, Arsiwalla, Elshatlawy 2025, Quantum Gates from Wolfram Model Multiway Rewriting Systems (arXiv 2512.20587) | seen |

#### Du Plessis, Arsiwalla 2022, A Cosine Rule-Based Discrete Sectional Curvature for Graphs

Source: https://arxiv.org/abs/2212.04406

No Function Repository, Paclet Repository or GitHub links found in the paper text.

#### Zapata-Carratala, Schich, Beynon, Arsiwalla 2023, Beyond Binary: Hypermatrix Algebra and Irreducible Arity

Source: https://arxiv.org/abs/2301.07494

No Function Repository, Paclet Repository or GitHub links found in the paper text.

#### Zapata-Carratala, Arsiwalla, Beynon 2022, Heaps of Fish

Source: https://arxiv.org/abs/2205.05456

No Function Repository, Paclet Repository or GitHub links found in the paper text.

#### Zapata-Carratala, Arsiwalla 2022, An Invitation to Higher Arity Science

Source: https://arxiv.org/abs/2201.09738

No Function Repository, Paclet Repository or GitHub links found in the paper text.

#### Zeschke 2021, Growth Functions, Rates and Classes of String-Based Multiway Systems

Source: https://arxiv.org/abs/2102.03321

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/ | Compute the evolution of a multiway system and many associated properties | multiway systems, multicomputation | Zeschke 2021, Growth Functions, Rates and Classes of String-Based Multiway Systems (arXiv 2102.03321) | seen |
| Hands-on introduction notebook | Other | https://www.wolframcloud.com/obj/wolframphysics/Tools/hands-on-introduction-to-the-wolfram-physics-project.nb | hands-on introduction to the Wolfram Physics Project notebook (linked) | Wolfram models | Zeschke 2021, Growth Functions, Rates and Classes of String-Based Multiway Systems (arXiv 2102.03321) | seen |

#### Leuenberger 2021, Emergence of Minkowski-Spacetime by Simple Deterministic Graph Rewriting

Source: https://arxiv.org/abs/2110.03388

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| Tree-of-Lorentz-Boosts-in-Poincare-Disk-Model | GitHub | https://github.com/Leuenberger/Tree-of-Lorentz-Boosts-in-Poincare-Disk-Model | GitHub code for the deterministic graph rewriting emergence of Minkowski spacetime | graph rewriting, special relativity | Leuenberger 2021, Emergence of Minkowski-Spacetime by Simple Deterministic Graph Rewriting (arXiv 2110.03388) | seen |

#### Bajaj 2024, Hypergraph rewriting and causal structure of lambda calculus

Source: https://arxiv.org/abs/2409.01006

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/ | Compute the evolution of a multiway system and many associated properties | multiway systems, multicomputation | Bajaj 2024, Hypergraph rewriting and causal structure of lambda calculus (arXiv 2409.01006) | seen |

#### Assar 2026, Rewriting the Universe: High-Performance Hypergraph Rewriting for the Wolfram Physics Project (Wolfram Institute technical report)

Source: https://github.com/WolframInstitute/HypergraphRewritingEngine/blob/master/paper/main.pdf

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| HGEvolve | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | performs multiway hypergraph rewriting of the hypergraph initial under rules for steps steps, returning the combined evolution/causal/branchial graph (doc source); the paclet is WolframInstitute/HypergraphRewriteEngine, context HypergraphRewriting | hypergraph rewriting, multiway systems, causal graphs, branchial graphs | Assar 2026, Rewriting the Universe: High-Performance Hypergraph Rewriting for the Wolfram Physics Project (Wolfram Institute technical report); the report names the paclet, the function name comes from the GitHub doc source and kernel file | seen |
| HypergraphRewritingEngine | GitHub | https://github.com/WolframInstitute/HypergraphRewritingEngine | A high-performance multiway hypergraph rewriting engine for the Wolfram Physics Project (C++20/CUDA with Wolfram Language paclet) | hypergraph rewriting, multiway systems | Assar 2026, Rewriting the Universe: High-Performance Hypergraph Rewriting for the Wolfram Physics Project (Wolfram Institute technical report) | seen |
| MultiwaySystem | Wolfram/Multicomputation | https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ | the Wolfram/Multicomputation paclet MultiwaySystem, the authority this work is compared against (paper wording) | multiway systems, multicomputation | Assar 2026, Rewriting the Universe: High-Performance Hypergraph Rewriting for the Wolfram Physics Project (Wolfram Institute technical report) | seen |
| SetReplace | GitHub | https://github.com/maxitg/SetReplace | SetReplace: A Wolfram language package and C++ library for hypergraph rewriting (reference 11); computes a different object (single-history evolution) | hypergraph rewriting | Assar 2026, Rewriting the Universe: High-Performance Hypergraph Rewriting for the Wolfram Physics Project (Wolfram Institute technical report) | seen |

### E. Symbols exported by the locally installed WolframInstitute/HypergraphRewriteEngine 0.0.1

The GitHub paclet_source/README.md (master, 2026-09) says HGEvolve is the paclet's only exported function and that the physics analyses moved to a companion hypergraph_viz project. The copy installed on this machine (version 0.0.1) still exports the following symbols; they were seen only in the kernel evaluation of `` Names["HypergraphRewriting`*"] `` and their usage messages, so they are recorded here as unconfirmed for the published paclet. PacletFindRemote returned no match for this paclet name on 2026-09-16.

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| HGBrillLindquist | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a Brill-Lindquist initial condition (discrete spacetime around two black holes) (usage message) | initial conditions, general relativity | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGCylinder | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a cylindrical topology graph (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGDimensionFilmstrip | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | shows a grid of timestep union graphs with dimension coloring (usage message) | dimension and curvature | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGGeodesicFilmstrip | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | returns a list of lists of geodesic plots, one list per timestep (usage message) | geodesics | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGGeodesicPlot | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | plots geodesic paths overlaid on a state graph with dimension coloring (usage message) | geodesics | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGGrid | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a regular grid graph (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGGridWithHoles | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a grid with circular holes (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGHausdorffAnalysis | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | computes local Hausdorff dimension for each vertex in a graph (usage message) | dimension and curvature | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGKleinBottle | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a Klein bottle topology graph (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGLensingPlot | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | plots gravitational lensing: deflection angle vs impact parameter with GR prediction overlay (usage message) | general relativity | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGMinkowskiSprinkling | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a causal set by Minkowski sprinkling (usage message) | causal sets | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGMobiusStrip | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a Mobius strip topology graph (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGPoissonDisk | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a Poisson disk sampled graph (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGRotationCurvePlot | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | plots orbital velocity vs radius with Keplerian prediction overlay (usage message) | general relativity | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGRotationOrbitsPlot | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | shows orbital paths overlaid on a state graph, colored by velocity deviation (usage message) | general relativity | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGSphere | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a spherical topology graph using UV sampling (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGStateDimensionPlot | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | plots a hypergraph with vertices colored by local dimension (usage message) | dimension and curvature | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGTimestepUnionPlot | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | plots the union graph at a timestep with dimension coloring (usage message) | dimension and curvature | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGToGraph | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | converts an initial condition result or edge list to a Graph (usage message) | graph generators and utilities | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGTorus | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a toroidal topology graph (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| HGUniformRandom | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | generates a uniformly random point cloud graph (usage message) | initial conditions | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |
| EdgeId | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine | wraps an edge identifier (usage message) | hypergraph rewriting | kernel evaluation only (installed paclet 0.0.1) | unconfirmed |

### F. Functions cited by the 2023-2026 Stephen Wolfram writings listed on the technical-documents page, and search-only finds

The writings pages were fetched and grepped for Function Repository, Paclet Repository and GitHub links (code cells are images, so this catches only explicit links). Another finder covers the writings in full; this table only records what the pages link to.

| Name | Source | URL | Description | Topics | Used by (program [post id]) | Status |
|---|---|---|---|---|---|---|
| HardSphereSimulation | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HardSphereSimulation/ | Simulate hard spheres moving in an n-dimensional box | statistical mechanics, second law | Computational Foundations for the Second Law of Thermodynamics (2023-02) | seen |
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/ | Compute the evolution of a multiway system and many associated properties | multiway systems, multicomputation | Expression Evaluation and Fundamental Physics (2023-09); Aggregation and Tiling as Multicomputational Processes (2023-11) | seen |
| TraceGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TraceGraph/ | Generate a graph of all expressions in an evaluation chain | metamathematics | Expression Evaluation and Fundamental Physics (2023-09) | seen |
| GenerateTiling | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/GenerateTiling/ | Generate a tiling pattern from a set of local template constraints | ruliology | Aggregation and Tiling as Multicomputational Processes (2023-11) | seen |
| HatHexagons | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/HatHexagons/ | Generate the hat tiling using combinatorial hexagons | ruliology | Aggregation and Tiling as Multicomputational Processes (2023-11) | seen |
| FindMinimalTilings | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindMinimalTilings/ | Find minimal sets of templates for constructing tiling patterns | ruliology | What Can We Learn about Engineering and Innovation from Half a Century of the Game of Life (2025-03) | seen |
| TuringMachine (Lean proofs) | WolframInstitute/TuringMachine | https://github.com/WolframInstitute/TuringMachine | WolframInstitute/TuringMachine repository linked for a Lean proof (Proofs/OneSidedTM/PlusOne.lean); the paclet WolframInstitute/TuringMachine 1.2.0 (Tools for exploring and analyzing Turing machines) is on the Paclet Repository | Turing machines, ruliology | Towards a Theory of Bugs: The Ruliology of the Unexpected (2026-07) | seen |
| WolframModelGlocalMultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelGlocalMultiwaySystem/ | Simulate the evolution of a Wolfram model system as a "glocal" (hybrid of global and local) multiway system | multiway systems, multicomputation | WebSearch result for the Piskunov Local Multiway Systems bulletin (bulletins.wolframphysics.org unreachable); confirmed by ResourceObject | seen |
| QuantumDiscreteOperatorToZXDiagram | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteOperatorToZXDiagram/ | Convert a discrete quantum operator into a ZX-diagram | quantum, ZX-calculus | WolframLanguageContext search for ZX-calculus functions (companions of the functions cited by the ZX papers); confirmed by ResourceObject | seen |
| ZXDiagramToQuantumDiscreteOperator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ZXDiagramToQuantumDiscreteOperator/ | Convert a ZX-diagram into a discrete quantum operator | quantum, ZX-calculus | WolframLanguageContext search for ZX-calculus functions (companions of the functions cited by the ZX papers); confirmed by ResourceObject | seen |


## Gaps

1. bulletins.wolframphysics.org does not resolve from this session (DNS failure in both curl and WebFetch), so the bulletins by Piskunov (Local Multiway Systems, Confluence and Causal Invariance), Gorard (double-slit note, candidate geometrical formalism), Boyd (Multicomputational Irreducibility) and Wolfram (Multiway Turing Machines, Exploring Rulial Space, Multicomputation with Numbers, Event Horizons) were not read; only the WebSearch snippet pointing at WolframModelGlocalMultiwaySystem was captured.
2. The pages https://www.wolframphysics.org/wolfram-physics-project-summer-school/ and https://www.wolframphysics.org/summer-school/ return 404; the project rosters were reconstructed from the alumni index pages, the projects microsite, the technical-documents page and the Community tag listings instead. Five physics-track alumni pages (Georgios Smyridis 2021, Dugan Hammock 2022, Kurt Swanson 2022, Sanjib Katuwal 2022, Srishti Nautiyal 2023) carry no Community link; two of those projects were found by title elsewhere.
3. Community posts embed notebook code partly as images. Only code that is present as text (after despacing) was searchable; a project that used a Function Repository function only inside an image is not attributed here. One Discourse post (20324, WSS22 Regge theory) returned an empty page twice.
4. No arXiv paper by Nikolay Murzin on multicomputation or categorical rewriting was found by the arXiv API or WebSearch; his contributions appear as Function Repository functions (TokenEventGraph, NestGraphTagged, GraphFoliations, LayeredLayoutGraph, MultiReplace, GraphRemoveLooseEnds, MetamathImport, MultispacePlot3D) and the Wolfram/Multicomputation and WolframInstitute/Hypergraph paclets cited by the posts.
5. The arXiv full-text search only covers papers with an ar5iv rendering; the Stephen Wolfram arXiv items (2004.08210, 2101.10907, 2103.04961, 2111.04895, 2204.05123, 2103.12811, 2311.10722) have no ar5iv version and their PDFs (scans of the writings) were not downloaded; the writings versions were grepped instead (section F), where code is in images.
6. ZXMultiwaySystem is linked from the ZX-calculus I paper as a Function Repository resource but ResourceObject fails for it; it is listed as unconfirmed.
7. The Gravitas and Categorica GitHub repositories and the SetReplace repository were not enumerated function by function (other finders cover GitHub and paclets); only the functions the papers cite are listed.
8. The WolframInstitute/HypergraphRewriteEngine paclet is not on the remote paclet server (PacletFindRemote returned nothing) although the README says PacletInstall works; the locally installed 0.0.1 copy was used for the section E symbol list.
9. ResourceSearch was not run (slow); coverage of Function Repository functions is limited to names seen in the sources.

## Appendix: project posts examined

All posts downloaded and mined in this sweep, ordered by program year (program tag in the title). Post ids below 100000 are Discourse topic ids (https://community.wolfram.com/t/ID); larger ids are legacy ids (https://community.wolfram.com/groups/-/m/t/ID).

| Post | Title |
|---|---|
| [1728662](https://community.wolfram.com/groups/-/m/t/1728662) | [WSS19] Aggregation Systems: A stochastic approach to CA |
| [1729148](https://community.wolfram.com/groups/-/m/t/1729148) | [WSS19] Confluent Set Substitution Systems |
| [1729355](https://community.wolfram.com/groups/-/m/t/1729355) | [WSS19] Quantum Cellular Automata |
| [1729587](https://community.wolfram.com/groups/-/m/t/1729587) | [WSS19] Extract Data From Discrete Plot Images Using Semantic Segmentation |
| [1730380](https://community.wolfram.com/groups/-/m/t/1730380) | [WSS19] Converting a Chemical Structure to its Graph Representation |
| [16434](https://community.wolfram.com/t/16434) | [WSC20] Visualisations of a multiway graph |
| [2033895](https://community.wolfram.com/groups/-/m/t/2033895) | [WSC20] Cyclic string substitution and multiway systems |
| [2034307](https://community.wolfram.com/groups/-/m/t/2034307) | [WSC20] Explorations of the hypergraph wm44586 |
| [2034637](https://community.wolfram.com/groups/-/m/t/2034637) | [WSC20] Looking for multiway systems of intermediate growth |
| [16368](https://community.wolfram.com/t/16368) | [WSS20] Exploring statistical mechanics in string substitution systems |
| [16379](https://community.wolfram.com/t/16379) | [WSS20] Multiway circular-string rewrite systems |
| [2025797](https://community.wolfram.com/groups/-/m/t/2025797) | [WSS20] Through a Glass Darkly - Deciphering the Micro- and Macrocosmos |
| [2026401](https://community.wolfram.com/groups/-/m/t/2026401) | [WSS20] Multi perspectives, 3D graph embeddings and multispace |
| [2026483](https://community.wolfram.com/groups/-/m/t/2026483) | [WSS20] Constructing directed graphs of email conversations |
| [2027996](https://community.wolfram.com/groups/-/m/t/2027996) | [WSS20] Local Dimension Measure and Rotation Groups in Wolfram Models |
| [2028486](https://community.wolfram.com/groups/-/m/t/2028486) | [WSS20] Exploring CPT invariance in Wolfram Models |
| [2028496](https://community.wolfram.com/groups/-/m/t/2028496) | [WSS20] Classify growth rates for Wolfram Models |
| [2028575](https://community.wolfram.com/groups/-/m/t/2028575) | [WSS20] Finding Conservation Laws in (Hyper)graph Rewritings |
| [2028586](https://community.wolfram.com/groups/-/m/t/2028586) | [WSS20] Investigating quantum interference effects in Wolfram Models |
| [2028831](https://community.wolfram.com/groups/-/m/t/2028831) | [WSS20] Quantum teleportation in string substitution system |
| [2028871](https://community.wolfram.com/groups/-/m/t/2028871) | [WSS20] Exploring Networks in Hard Sphere Models |
| [2028929](https://community.wolfram.com/groups/-/m/t/2028929) | [WSS20] Study of Shapes and Curves Defined by Curvature vs Arc Length |
| [2029156](https://community.wolfram.com/groups/-/m/t/2029156) | [WSS20] Interpreting the distributions of dimensions in the Wolfram Models |
| [2029289](https://community.wolfram.com/groups/-/m/t/2029289) | [WSS20] Shor's algorithm in multiway systems |
| [2029300](https://community.wolfram.com/groups/-/m/t/2029300) | [WSS20] Quantum Effects in Fluid Flow Cellular Automata |
| [2029319](https://community.wolfram.com/groups/-/m/t/2029319) | [WSS20] The quantum harmonic oscillator in the Wolfram Physics Model |
| [2029394](https://community.wolfram.com/groups/-/m/t/2029394) | [WSS20] Studying state transition diagrams in finite Wolfram Models |
| [2029454](https://community.wolfram.com/groups/-/m/t/2029454) | [WSS20] Comparing expansion in physical and branchial space |
| [2029483](https://community.wolfram.com/groups/-/m/t/2029483) | [WSS20] Exploring the dimensionality of Wolfram Models |
| [2029538](https://community.wolfram.com/groups/-/m/t/2029538) | [WSS20] Graph Representation of Biological Evolution |
| [2029555](https://community.wolfram.com/groups/-/m/t/2029555) | [WSS20] Find a Graph Approximation to the Cosmic Web |
| [2029673](https://community.wolfram.com/groups/-/m/t/2029673) | [WSS20] Terminations and completions in string multiway systems |
| [2029731](https://community.wolfram.com/groups/-/m/t/2029731) | [WSS20] Hunting for black holes |
| [2029759](https://community.wolfram.com/groups/-/m/t/2029759) | [WSS20] An Exploration of the AdS/CFT Correspondence within Wolfram Models |
| [2029848](https://community.wolfram.com/groups/-/m/t/2029848) | [WSS20] Finding gravitational waves in Wolfram Models |
| [2029995](https://community.wolfram.com/groups/-/m/t/2029995) | [WSS20] Weyl's law and The Wolfram Model of physics |
| [2030068](https://community.wolfram.com/groups/-/m/t/2030068) | [WSS20] Wolfram Models as discretization methods for numerical PDE solver |
| [2030103](https://community.wolfram.com/groups/-/m/t/2030103) | [WSS20]Random walks in branchial TM space&quest for simplest universal NDTM |
| [2030275](https://community.wolfram.com/groups/-/m/t/2030275) | [WSS20] A Path to Higher Order Corrections for Einstein's Equations |
| [2030337](https://community.wolfram.com/groups/-/m/t/2030337) | [WSS20] Full Discretization of Local Gauge Invariance |
| [2030405](https://community.wolfram.com/groups/-/m/t/2030405) | [WSS20] EPR interactions in generational multiway systems |
| [2030710](https://community.wolfram.com/groups/-/m/t/2030710) | [WSS20] WMs: State transition networks of non-growing hypergraph evolutions |
| [2030734](https://community.wolfram.com/groups/-/m/t/2030734) | [WSS20] Particles and fields from topological defects in spacetime mesh |
| [2031510](https://community.wolfram.com/groups/-/m/t/2031510) | [WSS20] Evolution of (hyper)graph invariants under (hyper)graph rewritings |
| [2032113](https://community.wolfram.com/groups/-/m/t/2032113) | [WSS20] Homotopic foundations of Wolfram Models |
| [2036324](https://community.wolfram.com/groups/-/m/t/2036324) | [WSS20] Multiple transformation rules that give slow growth |
| [18434](https://community.wolfram.com/t/18434) | [WSS21] Towards discretizing metric-affine gravity via elastic hypergraphs |
| [2310789](https://community.wolfram.com/groups/-/m/t/2310789) | [WSS21] Cellular automata in nested quasicrystals |
| [2311181](https://community.wolfram.com/groups/-/m/t/2311181) | [WSS21] On charge -spin networks from multiway systems branchial graphs |
| [2311732](https://community.wolfram.com/groups/-/m/t/2311732) | [WSS21] Color spin networks |
| [2311778](https://community.wolfram.com/groups/-/m/t/2311778) | [WSS21] Non-trivial homotopies of arbitrary hypergraphs and their solitons |
| [2311808](https://community.wolfram.com/groups/-/m/t/2311808) | [WSS21] Study backtracking in cellular automata as a multiway system |
| [2311840](https://community.wolfram.com/groups/-/m/t/2311840) | [WSS21] Implementing Blum's: conscious turing machines |
| [2311924](https://community.wolfram.com/groups/-/m/t/2311924) | [WSS21] Functorial QFT and its connections with the Wolfram Model |
| [2312007](https://community.wolfram.com/groups/-/m/t/2312007) | [WSS21] The 3-colored distributed consensus problem |
| [2312018](https://community.wolfram.com/groups/-/m/t/2312018) | [WSS21] Gauge field theories on discrete principal fibre bundles |
| [2312075](https://community.wolfram.com/groups/-/m/t/2312075) | [WSS21] Designing a framework for adaptive feedback |
| [2312085](https://community.wolfram.com/groups/-/m/t/2312085) | [WSS21] Computing hydrocarbon chemical reactions based on graphs |
| [2312354](https://community.wolfram.com/groups/-/m/t/2312354) | [WSS21] Dimension decay in the early universe |
| [2312426](https://community.wolfram.com/groups/-/m/t/2312426) | [WSS21] Effects of causal graph dimension variations in null geodesics |
| [2312455](https://community.wolfram.com/groups/-/m/t/2312455) | [WSS21] Confluence in multiway cellular automata |
| [2312488](https://community.wolfram.com/groups/-/m/t/2312488) | [WSS21] Computational complexity classes, homotopy classes, and n-machines |
| [2312514](https://community.wolfram.com/groups/-/m/t/2312514) | [WSS21] Study aggregation systems with multiway graphs |
| [2312623](https://community.wolfram.com/groups/-/m/t/2312623) | [WSS21] Comparing Wolfram Model and causal set entanglement entropies |
| [2312765](https://community.wolfram.com/groups/-/m/t/2312765) | [WSS21] Quantum gravity in (2+1) dimensions and multiway system |
| [2312929](https://community.wolfram.com/groups/-/m/t/2312929) | [WSS21] Kretschmann scalar for hypergraphs |
| [2312958](https://community.wolfram.com/groups/-/m/t/2312958) | [WSS21] Distributed consensus in multiway graph cellular automata |
| [2313006](https://community.wolfram.com/groups/-/m/t/2313006) | [WSS21] Studying cosmology in the case of dimension change |
| [2313171](https://community.wolfram.com/groups/-/m/t/2313171) | [WSS21] Into the ternary world |
| [2313182](https://community.wolfram.com/groups/-/m/t/2313182) | [WSS21] Multiway quantum many-body system |
| [2313900](https://community.wolfram.com/groups/-/m/t/2313900) | [WSS21] Recovering scalar fields effects in The Wolfram Model |
| [2313949](https://community.wolfram.com/groups/-/m/t/2313949) | [WSS21] Asymptotics of the volume of manifolds and graphs |
| [2313964](https://community.wolfram.com/groups/-/m/t/2313964) | [WSS21] Adaptive memorization method using the "recurrent power law" model |
| [2314016](https://community.wolfram.com/groups/-/m/t/2314016) | [WSS21] A topological introduction to causal set theory & Wolfram Physics |
| [2314058](https://community.wolfram.com/groups/-/m/t/2314058) | [WSS21] Towards proving causal invariance in The Wolfram Model |
| [2314103](https://community.wolfram.com/groups/-/m/t/2314103) | [WSS21] Coarse-graining state networks with approximate graph isomorphism |
| [2314231](https://community.wolfram.com/groups/-/m/t/2314231) | [WSS21] Plotting the evolution of a Wolfram Model in 3-dimensions |
| [2314523](https://community.wolfram.com/groups/-/m/t/2314523) | [WSS21] Foundations of differential geometric algebra package |
| [2314652](https://community.wolfram.com/groups/-/m/t/2314652) | [WSS21] Exploring 1+1D Euclidean dynamical triangulations |
| [2314740](https://community.wolfram.com/groups/-/m/t/2314740) | [WSS21] Lie algebras and curvature in discrete geometry |
| [2315046](https://community.wolfram.com/groups/-/m/t/2315046) | [WSS21] Bell's equation in The Wolfram Model multiway formalism |
| [17401](https://community.wolfram.com/t/17401) | [WWS21] Causal graph geodesics to continuous geodesics |
| [17402](https://community.wolfram.com/t/17402) | [WWS21] Relativistic mass transformations from simple causal graph |
| [17403](https://community.wolfram.com/t/17403) | [WWS21] Alexander Orbach Relation and Random Walks on Hypergraphs |
| [17404](https://community.wolfram.com/t/17404) | [WWS21] Exploring the gauge symmetries in Wolfram Model |
| [17405](https://community.wolfram.com/t/17405) | [WWS21] Hypergraphs as chains of string bits |
| [17406](https://community.wolfram.com/t/17406) | [WWS21] Dimension Algorithm and Dimension Tensor in Wolfram Model |
| [17407](https://community.wolfram.com/t/17407) | [WWS21]Towards a spin-statistics theorem for Wolfram model multiway systems |
| [17411](https://community.wolfram.com/t/17411) | [WWS21] Relationship between causal multiway systems and spin foams in loop |
| [17412](https://community.wolfram.com/t/17412) | [WWS21] The Multiway Systems of Dynkin Diagrams |
| [17413](https://community.wolfram.com/t/17413) | [WWS21] Multiway Systems as Cayley Graphs |
| [17414](https://community.wolfram.com/t/17414) | [WWS21] Analyzing Effects of Dimensional Perturbations in Wolfram Models |
| [17415](https://community.wolfram.com/t/17415) | [WWS21] Rules generating elementary particle behavior in the Wolfram Model |
| [17418](https://community.wolfram.com/t/17418) | [WWS21] Discretization of a Non-Abelian SU(2) Gauge Theory |
| [17421](https://community.wolfram.com/t/17421) | [WWS21] Defect movement in lattice rewriting systems |
| [20384](https://community.wolfram.com/t/20384) | [WSC22] Multicomputational polynomials |
| [20387](https://community.wolfram.com/t/20387) | [WSC22] Multiway sandpile models with applications to LCFTs |
| [20413](https://community.wolfram.com/t/20413) | [WSC22] Multiway sequential cellular automata |
| [20421](https://community.wolfram.com/t/20421) | [WSC22] Boolean logic in SK combinators |
| [20324](https://community.wolfram.com/t/20324) | [WSS22] Study of Regge Theory using 2-body motion in fractional spacetime |
| [20338](https://community.wolfram.com/t/20338) | [WSS22] A study in proof space Topology |
| [20356](https://community.wolfram.com/t/20356) | [WSS22] Some structural and categorical aspects of metamathematical space |
| [20366](https://community.wolfram.com/t/20366) | [WSS22] Temporally coherent animations of the evolution of Wolfram Models |
| [20439](https://community.wolfram.com/t/20439) | [WSS22] Spin models' time dynamics in the framework of multiway systems |
| [2574000](https://community.wolfram.com/groups/-/m/t/2574000) | [WSS22] Proof of useful ruliad work |
| [2574158](https://community.wolfram.com/groups/-/m/t/2574158) | [WSS22] Computational implications of the third law of Thermodynamics |
| [2574186](https://community.wolfram.com/groups/-/m/t/2574186) | [WSS22] Fluid dynamics on graphs |
| [2574363](https://community.wolfram.com/groups/-/m/t/2574363) | [WSS22] Tic-Tac-Toe: a quantum probabilistic approach |
| [2574554](https://community.wolfram.com/groups/-/m/t/2574554) | [WSS22] Exploring 3D camera motions and multiway graph animation |
| [2574747](https://community.wolfram.com/groups/-/m/t/2574747) | [WSS22] Investigating speciation in a population of artificial critters |
| [2574806](https://community.wolfram.com/groups/-/m/t/2574806) | [WSS22] Photon propagation through variable-dimensional space |
| [2574866](https://community.wolfram.com/groups/-/m/t/2574866) | [WSS22] QuantumToMultiwaySystem to explore quantum entanglement |
| [2574980](https://community.wolfram.com/groups/-/m/t/2574980) | [WSS22] Implementing a multiway system for expression simplification |
| [2575004](https://community.wolfram.com/groups/-/m/t/2575004) | [WSS22] Multiway mobile automata |
| [2575045](https://community.wolfram.com/groups/-/m/t/2575045) | [WSS22] Riordan Arrays for the enumeration of combinatorial structures |
| [2575323](https://community.wolfram.com/groups/-/m/t/2575323) | [WSS22] A new class of self avoiding walks on queen graphs |
| [2575423](https://community.wolfram.com/groups/-/m/t/2575423) | [WSS22] Quantum Ethernet |
| [2575438](https://community.wolfram.com/groups/-/m/t/2575438) | [WSS22] Topological invariants in discrete lattice via graph rewriting |
| [2575527](https://community.wolfram.com/groups/-/m/t/2575527) | [WSS22] Establishing maximal entanglement speed via branchial lightcones |
| [2575537](https://community.wolfram.com/groups/-/m/t/2575537) | [WSS22] Multiway graphs for minimal chess endgames |
| [2575559](https://community.wolfram.com/groups/-/m/t/2575559) | [WSS22] Branchial graph density diffusion in dynamic multiway systems |
| [2575570](https://community.wolfram.com/groups/-/m/t/2575570) | [WSS22] Graph tilings and constrained network systems |
| [2575606](https://community.wolfram.com/groups/-/m/t/2575606) | [WSS22] Gravitational lensing in The Wolfram Model |
| [2575623](https://community.wolfram.com/groups/-/m/t/2575623) | [WSS22] Compiling different models of computation into hypergraph rewriting |
| [2575710](https://community.wolfram.com/groups/-/m/t/2575710) | [WSS22] Investigating the weak censorship hypothesis in the Wolfram Model |
| [2575760](https://community.wolfram.com/groups/-/m/t/2575760) | [WSS22] Machine learning to date photographs |
| [2575839](https://community.wolfram.com/groups/-/m/t/2575839) | [WSS22] Multi-way tag systems in coordinatized rulial space |
| [2575939](https://community.wolfram.com/groups/-/m/t/2575939) | [WSS22] Particle tracks in bubble chamber |
| [2575951](https://community.wolfram.com/groups/-/m/t/2575951) | [WSS22] RuliadTrotter: meta-modeling Metamathematical observers |
| [2576045](https://community.wolfram.com/groups/-/m/t/2576045) | [WSS22] Analogs to elementary cellular automata on alternative tilings |
| [2576265](https://community.wolfram.com/groups/-/m/t/2576265) | [WSS22] Implementing Adinkras in the Wolfram Physics Project |
| [2577128](https://community.wolfram.com/groups/-/m/t/2577128) | [WSS22] An adaptive-mesh PDE solver with potential connections to W. Model |
| [19395](https://community.wolfram.com/t/19395) | [WWS22] Deducing commutativity relations from string multiway systems |
| [19402](https://community.wolfram.com/t/19402) | [WWS22] Emergent Geometry in String Rewrite Systems |
| [19404](https://community.wolfram.com/t/19404) | [WWS22] A novel multiway isomorphism model of consistency and completeness |
| [19409](https://community.wolfram.com/t/19409) | [WWS22] Characterisation of infinitary rewrite systems |
| [19410](https://community.wolfram.com/t/19410) | [WWS22] Identifying homogeneity in hypergraphs via approximate isomorphism |
| [19411](https://community.wolfram.com/t/19411) | [WWS22] Explore and classify horizons in causal graphs |
| [19420](https://community.wolfram.com/t/19420) | [WWS22] Identification of the quantum Zeno effect in the Wolfram Model |
| [19422](https://community.wolfram.com/t/19422) | [WWS22] Modeling spin network interactions via branchial graphs |
| [19423](https://community.wolfram.com/t/19423) | [WWS22] Black hole entropy of 2D spin networks |
| [19425](https://community.wolfram.com/t/19425) | [WWS22] Translating holographic entanglement entropy to rewriting model |
| [2775300](https://community.wolfram.com/groups/-/m/t/2775300) | [FSWS23] Studying Localization of Perturbations in Hypergraph Evolution |
| [2777621](https://community.wolfram.com/groups/-/m/t/2777621) | [FSWS23] What should space look like in the Wolfram Model? |
| [2777734](https://community.wolfram.com/groups/-/m/t/2777734) | [FSWS23] Testing Eugene Fama’s EMH via ‘Economic Observer Theory' |
| [2777766](https://community.wolfram.com/groups/-/m/t/2777766) | [FSWS23] Possible Spacetime Discretization in Astrophysical Phenomena |
| [2777794](https://community.wolfram.com/groups/-/m/t/2777794) | [FSWS23] Target probabilities with quantum circuits |
| [2777844](https://community.wolfram.com/groups/-/m/t/2777844) | [FSWS23] A Classification for Xenomathematical Systems |
| [2777995](https://community.wolfram.com/groups/-/m/t/2777995) | [FSWS23] Studying Phase Transition in 2D Ising Model with Multiway Systems |
| [2778062](https://community.wolfram.com/groups/-/m/t/2778062) | [FSWS23] A Multiway Model of Chemical Reactions |
| [2778080](https://community.wolfram.com/groups/-/m/t/2778080) | [FSWS23] The Experimental Correlates of QuantumToMultiwayFunction |
| [2778438](https://community.wolfram.com/groups/-/m/t/2778438) | [FSWS23] Characterizing Coarse Graining with Causal Graphs |
| [2778534](https://community.wolfram.com/groups/-/m/t/2778534) | [FSWS23] A Philosophical Analysis of The Physicalization of Metamathematics |
| [2778553](https://community.wolfram.com/groups/-/m/t/2778553) | [FSWS23] An Empirical Study - String Rewrite System Reducibility |
| [2778618](https://community.wolfram.com/groups/-/m/t/2778618) | [FSWS23] Quantum State Estimation |
| [2778683](https://community.wolfram.com/groups/-/m/t/2778683) | [FSWS23] Perturbation Effects in Branchial Graphs |
| [2779503](https://community.wolfram.com/groups/-/m/t/2779503) | [FSWS23] Musical Composition with Multiway Turing Machines |
| [2780972](https://community.wolfram.com/groups/-/m/t/2780972) | [FSWS23] Listening to substitution system |
| [2781097](https://community.wolfram.com/groups/-/m/t/2781097) | [FSWS23] Effects of Dimensions D≠3 on Galactic Rotational Velocity Curves |
| [22452](https://community.wolfram.com/t/22452) | [WSRP23] Finding holes in multiway systems |
| [22473](https://community.wolfram.com/t/22473) | [WSRP23] Analyzing structures in causal graphons and potential applications to fundamental physics |
| [22476](https://community.wolfram.com/t/22476) | [WSRP23] On the mergers of numerical multiway systems |
| [22483](https://community.wolfram.com/t/22483) | [WSRP23] Exploring computational dynamics of formal-language syntax using multiway systems |
| [22357](https://community.wolfram.com/t/22357) | [WSS23] Empirical metamathematics: extending the Lean-to-Mathematica bridge |
| [22389](https://community.wolfram.com/t/22389) | [WSS23] The Ruliology of Network Mobile Automata |
| [22392](https://community.wolfram.com/t/22392) | [WSS23] Black hole entanglement entropy from causal graphs |
| [22397](https://community.wolfram.com/t/22397) | [WSS23] Studying behavior of simple network rewriting system |
| [22398](https://community.wolfram.com/t/22398) | [WSS23] Explorations on the ruliad via modular Arithmetic |
| [22412](https://community.wolfram.com/t/22412) | [WSS23] Multiway systems for exactly solved lattice models |
| [22537](https://community.wolfram.com/t/22537) | [WSS23] Exploring the AdS/CFT correspondence in discrete spacetimes via tensor networks |
| [2957268](https://community.wolfram.com/groups/-/m/t/2957268) | [WSS23] Hat tiling space reduction and grow function implementation |
| [2958268](https://community.wolfram.com/groups/-/m/t/2958268) | [WSS23] Exploration of distributed consensus on graphs |
| [2958428](https://community.wolfram.com/groups/-/m/t/2958428) | [WSS23] HatGame: a journey through the hat tile configuration space |
| [2958462](https://community.wolfram.com/groups/-/m/t/2958462) | [WSS23] Towards a homoiconic foundation in the Wolfram Language |
| [2958640](https://community.wolfram.com/groups/-/m/t/2958640) | [WSS23] Exploring minimized reversible circuits for n-bit functions |
| [2958725](https://community.wolfram.com/groups/-/m/t/2958725) | [WSS23] Investigating the claims of "Grover's algorithm offers no quantum advantage" |
| [2958734](https://community.wolfram.com/groups/-/m/t/2958734) | [WSS23] Black box optimization: the mesh adaptive direct search (MADS) algorithm |
| [2958851](https://community.wolfram.com/groups/-/m/t/2958851) | [WSS23] Study of the possibility of phase transitions in LLMs |
| [2959065](https://community.wolfram.com/groups/-/m/t/2959065) | [WSS23] Exploring spin dynamics: an Ising model study |
| [2959079](https://community.wolfram.com/groups/-/m/t/2959079) | [WSS23] Interactive demonstration of Lagrangian mechanics |
| [2959098](https://community.wolfram.com/groups/-/m/t/2959098) | [WSS23] Animating Wolfram Model evolutions in 3D |
| [2959123](https://community.wolfram.com/groups/-/m/t/2959123) | [WSS23] Turing machines on graphs |
| [2959142](https://community.wolfram.com/groups/-/m/t/2959142) | [WSS23] Study of Statistical evolution of a gaseous system as a consequence of iterative simple rule |
| [2959211](https://community.wolfram.com/groups/-/m/t/2959211) | [WSS23] Exploring neighbor dependent substitution systems using cluster size entropy and MSD |
| [2959295](https://community.wolfram.com/groups/-/m/t/2959295) | [WSS23] Tree of Thoughts: Exploratory Problem Solving with LLMs |
| [2959318](https://community.wolfram.com/groups/-/m/t/2959318) | [WSS23] Black hole entanglement entropy from causal graphs |
| [2959382](https://community.wolfram.com/groups/-/m/t/2959382) | [WSS23] What Happens IF You "DRUG" LLMs? |
| [2959430](https://community.wolfram.com/groups/-/m/t/2959430) | [WSS23] Rewriting the Ricci tensor using Vector Calculus |
| [2959571](https://community.wolfram.com/groups/-/m/t/2959571) | [WSS23] Studying behavior of simple network rewriting system |
| [2959684](https://community.wolfram.com/groups/-/m/t/2959684) | [WSS23] Exploring generalized Collatz functions |
| [2959726](https://community.wolfram.com/groups/-/m/t/2959726) | [WSS23] Efficient discovery of halting paths in aggregation system multiway graphs |
| [2959794](https://community.wolfram.com/groups/-/m/t/2959794) | [WSS23] Cosmological imprints on the 2-point correlation function of over-dimension fields |
| [2959827](https://community.wolfram.com/groups/-/m/t/2959827) | [WSS23] Hackenbush games as multicomputational systems |
| [2959853](https://community.wolfram.com/groups/-/m/t/2959853) | [WSS23] Exploring random quantum circuits without unitary matrix decomposition |
| [2959886](https://community.wolfram.com/groups/-/m/t/2959886) | [WSS23] Quantum gate complexity of Boolean functions |
| [2959959](https://community.wolfram.com/groups/-/m/t/2959959) | [WSS23] Developing a variational quantum eigensolver |
| [2959971](https://community.wolfram.com/groups/-/m/t/2959971) | [WSS23] Domain walls in graphs |
| [2960211](https://community.wolfram.com/groups/-/m/t/2960211) | [WSS23] Exploration and characterization of mobile automata |
| [2960649](https://community.wolfram.com/groups/-/m/t/2960649) | [WSS23] Single photon, single angle pair bell experiment |
| [24248](https://community.wolfram.com/t/24248) | [WSRP24] Analyzing Catalan numbers through multiway systems |
| [24271](https://community.wolfram.com/t/24271) | [WSRP24] Exploring holomorphic dynamics with multiway systems |
| [24285](https://community.wolfram.com/t/24285) | [WSRP24] HyperPlot: on the generation of temporally coherent hypergraphs |
| [24304](https://community.wolfram.com/t/24304) | [WSRP24] Constructing combinators for arithmetic and arbitrary-length bitwise operations |
| [24219](https://community.wolfram.com/t/24219) | [WSS24] Pre-lie structures of graph rewriting and associated axiom systems |
| [24244](https://community.wolfram.com/t/24244) | [WSS24] Morphology of hypergraphs: a study of hyperedge evolution |
| [3208800](https://community.wolfram.com/groups/-/m/t/3208800) | [WSS24] Adaptive evolution of finite 2D cellular automata |
| [3209154](https://community.wolfram.com/groups/-/m/t/3209154) | [WSS24] Gravitational radiation in discrete spacetimes |
| [3209199](https://community.wolfram.com/groups/-/m/t/3209199) | [WSS24] Adaptive evolution for Turing machines |
| [3209297](https://community.wolfram.com/groups/-/m/t/3209297) | [WSS24] The equivalence principle, hyperbolic geometry and gyrogeometry |
| [3209439](https://community.wolfram.com/groups/-/m/t/3209439) | [WSS24] Classification and perturbation analysis of particle-like structures in cellular automata |
| [3209638](https://community.wolfram.com/groups/-/m/t/3209638) | [WSS24] Studying the effects of noise in simple quantum logical systems |
| [3209693](https://community.wolfram.com/groups/-/m/t/3209693) | [WSS24] On motion and special relativity in Wolfram Models |
| [3209729](https://community.wolfram.com/groups/-/m/t/3209729) | [WSS24] Truncated Fock space as a way to model 2nd quantization in Wolfram Language |
| [3209831](https://community.wolfram.com/groups/-/m/t/3209831) | [WSS24] Investigating binary black hole merger from rewriting rules in Wolfram Models |
| [3209864](https://community.wolfram.com/groups/-/m/t/3209864) | [WSS24] Automated experimental data processing: example of Halite fluid inclusion Paleo-temperatures |
| [3209980](https://community.wolfram.com/groups/-/m/t/3209980) | [WSS24] Electronic structure of atoms using quantum computing techniques |
| [3210073](https://community.wolfram.com/groups/-/m/t/3210073) | [WSS24] Analyzing multiway chemical reaction networks using chemical space networks |
| [3210162](https://community.wolfram.com/groups/-/m/t/3210162) | [WSS24] Search for rules that preserve geometric structure in Wolfram models |
| [3210285](https://community.wolfram.com/groups/-/m/t/3210285) | [WSS24] Graph theory approach to hard sphere fluids |
| [3210337](https://community.wolfram.com/groups/-/m/t/3210337) | [WSS24] Particles in a box: kinetic gas theory and simulations |
| [3210348](https://community.wolfram.com/groups/-/m/t/3210348) | [WSS24] Building blocks' aggregation systems |
| [3210386](https://community.wolfram.com/groups/-/m/t/3210386) | [WSS24] Expansion of the fractal Mandelbrot set to 3D using dimensional folding |
| [3210464](https://community.wolfram.com/groups/-/m/t/3210464) | [WSS24] Non-possible blocks of a cellular automaton |
| [3210476](https://community.wolfram.com/groups/-/m/t/3210476) | [WSS24] Introducing combinatorial games in Wolfram Language's Entity framework with OOP |
| [3210556](https://community.wolfram.com/groups/-/m/t/3210556) | [WSS24] Compositional paths on hypergraphs |
| [3210754](https://community.wolfram.com/groups/-/m/t/3210754) | [WSS24] Searching for indications of fractional dimensions |
| [3210765](https://community.wolfram.com/groups/-/m/t/3210765) | [WSS24] A computational model for invasion sports |
| [3210817](https://community.wolfram.com/groups/-/m/t/3210817) | [WSS24] Study "Logic Puzzle" axiom/proof graphs from TPTP.org |
| [3210833](https://community.wolfram.com/groups/-/m/t/3210833) | [WSS24] Exploring call graphs of nestedly recursive functions |
| [3210878](https://community.wolfram.com/groups/-/m/t/3210878) | [WSS24] Finding patterns in quantum information: a computational approach |
| [3211260](https://community.wolfram.com/groups/-/m/t/3211260) | [WSS24] Finding and bounding generalized Ising model ground state energies |
| [3213271](https://community.wolfram.com/groups/-/m/t/3213271) | [WSS24] Computational exploration for the Three-Body Problem |
| [23402](https://community.wolfram.com/t/23402) | [WWS24] Comparing Causal Graphs Between String Rewriting and Poisson Sprinkling in Spacetime |
| [23409](https://community.wolfram.com/t/23409) | [WWS24] Modeling rewrite systems as a virtual double category |
| [23410](https://community.wolfram.com/t/23410) | [WWS24] Classical Simulability of Quantum Circuits Via Stabilizer Rényi Entropy and ZX-Diagrams |
| [23419](https://community.wolfram.com/t/23419) | [WWS24] SYK model from Wolfram hypergraphs |
| [23422](https://community.wolfram.com/t/23422) | [WWS24] Markov categories and multiway systems |
| [3100273](https://community.wolfram.com/groups/-/m/t/3100273) | [WWS24] A Single Pair Bell Correlation measurement, using a 'pseudo' unbunching operator |
| [3100855](https://community.wolfram.com/groups/-/m/t/3100855) | [WWS24] Multipartite Entanglement Witness with Four-Point Fermion Correlations |
| [3100869](https://community.wolfram.com/groups/-/m/t/3100869) | [WWS24] Lean Exploration: A Deep Dive into the Wolfram Axiom |
| [3100969](https://community.wolfram.com/groups/-/m/t/3100969) | [WWS24] Computational Pre-phenomenology: A Meta-Structural Foundation of Consciousness Science |
| [3101088](https://community.wolfram.com/groups/-/m/t/3101088) | [WWS24] Dimensional Waves |
| [3101578](https://community.wolfram.com/groups/-/m/t/3101578) | [WWS24] Graphical Exploration of Topological Particles in the Skyrme Model |
| [3101823](https://community.wolfram.com/groups/-/m/t/3101823) | [WWS24] How many dimensions are there? Dynamical Dimensions & Dimension Reduction |
| [25699](https://community.wolfram.com/t/25699) | [WSRP25] State evolution in multiway register machines featuring applications to recursive functions |
| [25745](https://community.wolfram.com/t/25745) | [WSRP25] Analyzing terminating behaviors of triangular aggregations using multiway systems |
| [25762](https://community.wolfram.com/t/25762) | [WSRP25] On the density and multiway spectral theory of aggregation systems |
| [25655](https://community.wolfram.com/t/25655) | [WSS25] Multiway system computations in knot probabilities |
| [25664](https://community.wolfram.com/t/25664) | [WSS25] Searching for holes in the proof space |
| [25665](https://community.wolfram.com/t/25665) | [WSS25] Adaptive Evolution of Hypergraph Rewriting Systems |
| [25673](https://community.wolfram.com/t/25673) | [WSS25] An Investigation of Discrete SU(2) Gauge Theory through the Hopf Fibration and Wilson Loops |
| [25674](https://community.wolfram.com/t/25674) | [WSS25] Units: How we got here and Methodology for Implementation in the Wolfram Physics |
| [25678](https://community.wolfram.com/t/25678) | [WSS25] The Ruliad as an Optimal Framework for Unifying Mind, Matter, and the Infinite |
| [25679](https://community.wolfram.com/t/25679) | [WSS25] Classifying mathematical statements via using Metamath dependency graph |
| [3494864](https://community.wolfram.com/groups/-/m/t/3494864) | [WSS25] Limited Edition - Using CAs to Create Distinct Design and Connect Community |
| [3495324](https://community.wolfram.com/groups/-/m/t/3495324) | [WSS25] Mining Pockets of Computational Reducibility with AI: Transformer Models of Graph Rewriting |
| [3496072](https://community.wolfram.com/groups/-/m/t/3496072) | [WSS25] Towards Agency in Computational Systems |
| [3496270](https://community.wolfram.com/groups/-/m/t/3496270) | [WSS25] Investigating Register Base Effects on Iterated Map Behaviour |
| [3496907](https://community.wolfram.com/groups/-/m/t/3496907) | [WSS25] Multiway system computations in knot probabilities |
| [3496929](https://community.wolfram.com/groups/-/m/t/3496929) | [WSS25] Adaptative Evolution in Totalistic Cellular Automaton |
| [3496966](https://community.wolfram.com/groups/-/m/t/3496966) | [WSS25] An optimization program designed to discover specific cellular automaton rules |
| [3497488](https://community.wolfram.com/groups/-/m/t/3497488) | [WSS25] Evaluating the multiplicad |
| [3497558](https://community.wolfram.com/groups/-/m/t/3497558) | [WSS25] Interpretable Symbolic Regression with Kolmogorov-Arnold Networks |
| [3497586](https://community.wolfram.com/groups/-/m/t/3497586) | [WSS25] A Graph Theoretic Approach to Feynman Checkers |
| [3497643](https://community.wolfram.com/groups/-/m/t/3497643) | [WSS25] An Investigation of Discrete SU(2) Gauge Theory through the Hopf Fibration and Wilson Loops |
| [3497702](https://community.wolfram.com/groups/-/m/t/3497702) | [WSS25] Computation through smooth dynamics: simulating TKFT’s |
| [3497743](https://community.wolfram.com/groups/-/m/t/3497743) | [WSS25] Exploring continuous cellular automata with respect to small perturbations |
| [3497811](https://community.wolfram.com/groups/-/m/t/3497811) | [WSS25] Entanglement in the Wolfram model |
| [25004](https://community.wolfram.com/t/25004) | [WWS25] Entanglement on quantum optics kit towards creating physical correlates of multiway diagrams |
| [25005](https://community.wolfram.com/t/25005) | [WWS25] Finding hypermatrix products via hypergraph classification |
| [25006](https://community.wolfram.com/t/25006) | [WWS25] Entanglement spreading in quantum circuits, multiway graphs, and branchial graphs |
| [25007](https://community.wolfram.com/t/25007) | [WWS25] Geodesic congruence in casual graphs |
| [25008](https://community.wolfram.com/t/25008) | [WWS25] Exploring ruliological engineering of well-defined geometries from hypergraph rewriting |
| [25009](https://community.wolfram.com/t/25009) | [WWS25] Lie brackets on hypergraphs |
| [3357778](https://community.wolfram.com/groups/-/m/t/3357778) | [WWS25] A suggestive quantum theory for cyclic character strings |
| [3358066](https://community.wolfram.com/groups/-/m/t/3358066) | [WWS25] Lee-Yang theorem and phase transitions - computational approach |
| [3358302](https://community.wolfram.com/groups/-/m/t/3358302) | [WWS25] Exploring vector fields on graphs and their derivations |
| [3358433](https://community.wolfram.com/groups/-/m/t/3358433) | [WWS25] Pascal's simplexes using cellular automata rules |
| [3761646](https://community.wolfram.com/groups/-/m/t/3761646) | [WSRI26] Classifying Defects in Cellular Automata |
| [3761828](https://community.wolfram.com/groups/-/m/t/3761828) | [WSRI26] Iterated Finite Automata |
| [3761847](https://community.wolfram.com/groups/-/m/t/3761847) | [WSRI26] Emergent Continuum Behavior in Reversible Multiway Systems |
| [3762138](https://community.wolfram.com/groups/-/m/t/3762138) | [WSRI26] Shedding light on black holes |
| [3762249](https://community.wolfram.com/groups/-/m/t/3762249) | [WSRI26] Lie Algebras from Strings to Hyperstrings |
| [3762337](https://community.wolfram.com/groups/-/m/t/3762337) | [WSRI26] Where Will It Settle? Exploring Polymer Folding with Minimal Discrete Models |
| [3762419](https://community.wolfram.com/groups/-/m/t/3762419) | [WSRI26] Enumerating Sequential Substitution Systems |
| [3762535](https://community.wolfram.com/groups/-/m/t/3762535) | [WSRI26] Weight Sensitivity of MLP: A Dynamics Approach |
| [3762683](https://community.wolfram.com/groups/-/m/t/3762683) | [WSRI26] One Droplet at a Time: How Entailment Graphs Condense |
| [3762711](https://community.wolfram.com/groups/-/m/t/3762711) | [WSRI26] Anisotropy of Space From Discretization |
| [3762726](https://community.wolfram.com/groups/-/m/t/3762726) | [WSRI26] On Games and Graphs |
| [3762735](https://community.wolfram.com/groups/-/m/t/3762735) | [WSRI26] Running Computational Clinical Trials on Cellular Automata |
| [3762800](https://community.wolfram.com/groups/-/m/t/3762800) | [WSRI26] Limits of Multi-Objective Adaptive Evolution for Cellular Automata |
| [3762954](https://community.wolfram.com/groups/-/m/t/3762954) | [WSRI26] A Computational Study of Benford's Law in Integer Sequences |
| [3762980](https://community.wolfram.com/groups/-/m/t/3762980) | [WSRI26] Self-Replication in Rewriting Systems |
| [3763003](https://community.wolfram.com/groups/-/m/t/3763003) | [WSRI26] Adaptive Evolution of Solid Structures under Simulated Incompressible Fluid Flows |
| [3763192](https://community.wolfram.com/groups/-/m/t/3763192) | [WSRI26] Quantum Thickening of Reversible Block Cellular Automata: Analyzing Paths from S4 to U(4) |
| [3763276](https://community.wolfram.com/groups/-/m/t/3763276) | [WSRI26] Observer Coordinatisation and Agreement in Graphical Contexts |
| [3763308](https://community.wolfram.com/groups/-/m/t/3763308) | [WSRI26] Observer Theory in Cellular Automata |
| [3763335](https://community.wolfram.com/groups/-/m/t/3763335) | [WSRI26] Evolving Circles: Adaptive Search in a Cellular Automaton Rule Space |
| [3763367](https://community.wolfram.com/groups/-/m/t/3763367) | [WSRI26] HyperVacuum: A Dimension-Agnostic Hypergraph Lattice Model of the Quantum Vacuum |
| [3763609](https://community.wolfram.com/groups/-/m/t/3763609) | [WSRI26] Non-Projectional Rigidity in Finite-Axiom Theorem Spaces, and the System-135 Phenomenon |
| [3763652](https://community.wolfram.com/groups/-/m/t/3763652) | [WSRI26] Structure-Adaptive Evolutionary Framework for Navigating the Rule-space of Hypergraphs |
| [3763738](https://community.wolfram.com/groups/-/m/t/3763738) | [WSRI26] Evaluating Black-Box Physics Through Optical Emulation |
| [3763864](https://community.wolfram.com/groups/-/m/t/3763864) | [WSRI26] Classifying Cellular Automaton Rules by Diagonal Period Mod[p] |
| [3763898](https://community.wolfram.com/groups/-/m/t/3763898) | [WSRI26] Searching for d-3 Quantum Error Correcting Codes on a 27-qubit Superconducting Processor |
| [27218](https://community.wolfram.com/t/27218) | [WSRP26] Spectral universality of deficit-angle curvature in Regge Laplace-Beltrami geometry |
| [27238](https://community.wolfram.com/t/27238) | [WSRP26] Modelling the movement of modular robots using multiway graphs |
| [27242](https://community.wolfram.com/t/27242) | [WSRP26] Exploring spaghettification around black holes |
| [26340](https://community.wolfram.com/t/26340) | [WWS26] Wolfram multiway diagrams from Pythagorean triples |
| [26344](https://community.wolfram.com/t/26344) | [WWS26] Branchial graph stability |
| [26345](https://community.wolfram.com/t/26345) | [WWS26] Ruliology of Boolean networks |
| [26347](https://community.wolfram.com/t/26347) | [WWS26] Tracking EMEs: a persistence view of multiway hypergraph rewriting |
| [26352](https://community.wolfram.com/t/26352) | [WWS26] Noncommutative geometry and graph rewriting systems |
| [26354](https://community.wolfram.com/t/26354) | [WWS26] Holographic duality between causal and branchial graphs |
| [26393](https://community.wolfram.com/t/26393) | [WWS26] Birdwatching: A tale of S combinator arithmetic |
| [17685](https://community.wolfram.com/t/17685) | Black Hole Discussion (based on “[WSS20] Hunting for Black Holes” post) |

## Verification

Verified on 2026-09-16 by a second agent that checked every one of the 259 rows in sections A to F against its stated source. Scratch scripts are in the session scratchpad directory verify-ssp-1789585454 (wfr_check.wls, paclet_check.wls, paclet_names.wls).

### Method

1. WFR rows (168 rows, 118 distinct names). One scratch script evaluated `Quiet@ResourceObject[name]` for every name (wolframscript -file, WL 15.0, cloud connected, TimeConstrained 60 s per name) and printed ResourceType, Description and ContributorInformation. 117 names returned ResourceType Function with descriptions identical to the table text (the only differences are en dashes in Wolfram-Hausdorff and Wolfram-Ricci, written as hyphens here). ZXMultiwaySystem failed; its repository URL answers HTTP 302 to a wolframcloud sign-in page (statusCode=401) where a live function URL answers 200, and a WebSearch for the name found nothing. Five names chosen at random (QuantumCircuitOperator, AbstractPullback, QuantumDiscreteState, GraphFoliations, CausalInvariantQ) were also cross-checked with WebFetch of their repository pages; name, description and contributor matched.
2. Section A attributions. For all 91 rows the first attributed Community post was downloaded with curl and the despaced text was searched for the function name; all 91 names were found on their posts. The same check over the 52 rows of sections B and C found one bad attribution (QuantumBasis, see corrections).
3. Paclet rows. The installed paclets were loaded and `Names` of each context printed: `` WolframInstitute`Hypergraph` `` 1.2.3 (59 names) contains all 6 table names, `` Wolfram`Multicomputation` `` 0.1.9 (41 names) contains MultiwaySystem, HypergraphMulti and FromLinkedHypergraph, `` Wolfram`QuantumFramework` `` 2.1.1 (50 names) contains all 12 table names and ZXTensorNetwork, `` SetReplace` `` 0.3.196 (57 names) contains all 8 table names, and `` HypergraphRewriting` `` 0.0.1 (24 names) contains HGEvolve and the 22 other section E names. PacletFindRemote listed WolframInstitute/Hypergraph 1.2.3, Wolfram/Multicomputation 0.1.8, Wolfram/QuantumFramework 2.1.1, SetReplace 0.3.196 and WolframInstitute/TuringMachine 1.2.0 and no match for WolframInstitute/HypergraphRewriteEngine. The Paclet Repository guide pages for WolframInstitute/Hypergraph, Wolfram/Multicomputation and Wolfram/QuantumFramework were read with WebFetch and list every table name except HypergraphMulti and ZXTensorNetwork; those two were confirmed from PackageExport lines in the paclet kernel files (Kernel/LinkedHypergraph.m of Multicomputation 0.1.8 and 0.1.9, Kernel/ZX.m of QuantumFramework 2.1.1 and of WolframResearch/QuantumFramework main on GitHub).
4. WL rows. `` Names["System`TransitiveReductionGraph"] `` and `` Names["System`NestGraph"] `` are non-empty in WL 15.0.
5. Community rows (15). Each post was downloaded with curl and its despaced text searched; every name appears on its post. The cloud object wolframcloud.com/obj/daniels/HypergraphTools.wl now returns a Wolfram sign-in page.
6. GitHub rows. Every repository named in a row (maxitg/SetReplace, JonathanGorard/Gravitas, JonathanGorard/Categorica, fsdundar/qstr-monads, fsdundar/wolfram-model-variety, fsdundar/wws25, Leuenberger/Tree-of-Lorentz-Boosts-in-Poincare-Disk-Model, WolframInstitute/HypergraphRewritingEngine, WolframInstitute/TuringMachine, SamWhittington/WeylMultiwaySystem, taliesinb/QuiverGeometry, jatin1109/Classify-Growth-Rates-for-Wolfram-Models, LexLoki/WSS23_AggSystems) was confirmed with the GitHub API. The Gravitas root holds ADMDecomposition.wl, DiscreteHypersurfaceDecomposition.wl, SolveEinsteinEquations.wl, SolveVacuumEinsteinEquations.wl, StressEnergyTensor.wl and the other tensor files; the Categorica root holds AbstractCategory.wl, AbstractFunctor.wl, AbstractStrictMonoidalCategory.wl, AbstractProduct.wl, AbstractCoproduct.wl, AbstractPullback.wl and AbstractPushout.wl (AbstractQuiver has no file of its own there; all eight names resolve in the WFR); WolframInstitute/TuringMachine holds Proofs/OneSidedTM/PlusOne.lean. On the HypergraphRewritingEngine master branch, paclet/Kernel/HypergraphRewriting.wl has PackageExport lines for HGEvolve and for session symbols only; HGTorus, HGToGraph and the other section E generators are defined inside the private context and the plot and analysis names are absent, so the section E rows stay unconfirmed for the published paclet. paclet/Documentation/Source/HGEvolve.md exists on master.
7. Paper rows (section D). The ar5iv HTML of every cited arXiv paper was fetched and searched for each attributed name; all were found. 2111.03460 has no ar5iv version; its PDF was converted with pdftotext and contains the Tools/guide-page link. The Assar report PDF (paper/main.pdf on master, dated 2026-09-11) names the Wolfram/Multicomputation MultiwaySystem (reference 12) and SetReplace (reference 11) and the paclet WolframInstitute/HypergraphRewriteEngine, but not HGEvolve.
8. Section F. The five writings pages were fetched with curl: HardSphereSimulation is in a click-to-copy code attribute of the second-law post; MultiwaySystem, TraceGraph, GenerateTiling, HatHexagons and FindMinimalTilings appear as Function Repository links on their posts; the bugs post links Proofs/OneSidedTM/PlusOne.lean in WolframInstitute/TuringMachine. The two wolframcloud Tools pages (guide-page, titled Wolfram Physics Project Functions, and the hands-on introduction notebook) return HTTP 200 and were read with WebFetch.

### Corrections

- ZXTensorNetwork (section C): re-sourced from Community to Wolfram/QuantumFramework. The WWS24 post defines it inline (credited to Nikolay Murzin) with the same definition that Kernel/ZX.m of Wolfram/QuantumFramework 2.1.1 exports; it is in `` Names["Wolfram`QuantumFramework`*"] `` in the kernel although the paclet guide page does not list it. Status set to seen.
- QuantumBasis (section B, Wolfram/QuantumFramework row): the post WSS22 [2574363] does not contain the string QuantumBasis (it uses QuantumState and QuantumOperator), so that attribution was removed from the row; the remaining evidence is the ZX-calculus II paper, which cites the WFR function of the same name.
- QuiverGeometry (section C): https://github.com/taliesinb/QuiverGeometry now redirects to https://github.com/taliesinb/MathTools (repository renamed); noted in the row, the original URL is kept because it still resolves.
- HGEvolve (section D, Assar 2026): the Used by cell now says that the report names the paclet, not the function.
- HypergraphTools.wl (section C): the row now says the cloud object returns a sign-in page.
- Section C intro and section E intro: wording made precise (what "seen" means in section C; the "only exported function" statement comes from paclet_source/README.md).

### Status changes

30 rows changed from unconfirmed to seen after the checks above: the 14 project-local Community function rows of section C (names found on their posts), the GitHub repository rows WeylMultiwaySystem, QuiverGeometry, Classify-Growth-Rates-for-Wolfram-Models, WSS23_AggSystems and wolfram-model-variety, the five Gravitas rows, Categorica, qstr-monads, Tree-of-Lorentz-Boosts-in-Poincare-Disk-Model, the two Other rows (tools guide page and hands-on notebook), and ZXTensorNetwork.

Rows left unconfirmed (23): ZXMultiwaySystem (cited by the ZX-calculus I paper but not a public Function Repository resource) and the 22 section E symbols other than HGEvolve (present in the locally installed WolframInstitute/HypergraphRewriteEngine 0.0.1 but not exported by the GitHub master kernel file, and the paclet is not on the remote server).

Removed: none. Every row names something that exists at its stated source or is marked unconfirmed with the reason given above.
