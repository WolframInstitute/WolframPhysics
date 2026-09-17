# GitHub and source-code sweep: Wolfram Physics Project functions

Research report for the WolframInstitute/WolframPhysics guide page. Source swept: GitHub (maxitg/SetReplace, every WolframInstitute repository, WolframResearch, JonathanGorard, sw1sh, maxitg, xarsiwalla, the GitHub topics and keyword searches) plus the local Wolfram kernel (WL 15) to confirm resource functions and installed paclets. Every function listed was seen in a fetched file, a search result or a kernel evaluation; the Method section says where.

Total: 184 rows in 28 tables. Main functions have their own rows; for the larger paclets the remaining symbols are grouped into one row per kernel file or name group that names every symbol in it, and the bullet list under such a table repeats every symbol with its own usage line, so no function is dropped. Symbol names with a dollar sign are written in code spans.

## Method

All GitHub access went through the authenticated gh CLI (account sw1sh) on 2026-09-16. Raw files were fetched with `gh api repos/OWNER/REPO/contents/PATH` with the raw-content Accept header, trees with `gh api repos/OWNER/REPO/git/trees/BRANCH?recursive=1`. Kernel checks used `wolframscript -file` on scratch .wls scripts (WL 15.0).

Organization and user listings:

- `gh api orgs/WolframInstitute/repos` (paginated) (48 repositories, all examined by name and description; 27 inspected in depth)
- `gh api users/maxitg/repos` (paginated), `users/sw1sh/repos`, `users/JonathanGorard/repos` (non-forks)
- `gh api users/xarsiwalla` returned 404 (no such user); `gh api search/users?q=arsiwalla` and `q=xerxes+arsiwalla` returned nothing
- `gh api orgs/WolframPhysicsProject`, `orgs/WolframPhysics`, `orgs/wolframphysics`, `orgs/wolfram-physics`, `orgs/WolframModel` all 404; `gh api search/users?q=wolframphysics` found no matching organization
- `gh api orgs/WolframResearch/repos` (paginated) (61 repositories; only QuantumFramework matched physics, multiway, hypergraph, rewriting, causal, combinator, automata keywords)
- `gh api repos/GetJonWithIt/WolframPhysics` (Jonathan Gorard's 2020 account, found by keyword search)

Topic searches (`gh search repos` with a topic filter, limit 50): wolfram-physics, wolfram-model, hypergraph-rewriting, multiway, wolfram-physics-project, multiway-systems, setreplace, wolfram-models, causal-graph, branchial.

Keyword repository searches (`gh search repos Q`, limit 40): WolframModel, "wolfram physics", SetReplace, "hypergraph rewriting wolfram", "multiway system wolfram", "causal graph wolfram", branchial, rulial, multicomputation, "wolfram physics project", "Wolfram model hypergraph", ruliology, "wolframphysics archive", "physics project archives notebooks wolfram", TokenEventGraph, "MultiwaySystem wolfram", "WolframModel notebook", ruliad, org:WolframInstitute, "NetworkSystem wolfram".

Code searches (`gh search code Q`, limit 30): "PackageExport Multiway language:Mathematica", "PackageExport BranchialGraph", "PackageExport CausalGraph language:Mathematica", "WolframModel PackageExport", "BeginPackage Multiway", "ResourceFunction[\"WolframModel\"] extension:wl", "Rulial language:Mathematica", "MultiwaySystem BeginPackage", NetworkSystemEvolutionList.

Repositories cloned shallowly (`git clone` with depth 1) and grepped for `PackageExport[...]`, `::usage` and PacletInfo symbol lists: maxitg/SetReplace, WolframInstitute/Hypergraph, WolframInstitute/Multicomputation, WolframInstitute/HypergraphRewritingEngine, WolframInstitute/PureMath, WolframInstitute/Infrageometry, WolframInstitute/PersistenceRewriting, WolframInstitute/InfraCausality.

Files fetched through the API and read: SetReplace README.md and Documentation/*/*.md (index lines of every page); Hypergraph PacletInfo.wl, Kernel/*.m, docs/Symbols/*.md (first Usage line of all 59 pages), docs/Tutorials/HypergraphRewriting.md; Multicomputation README.md, docs/MultiwaySystemRF.md, Multicomputation/PacletInfo.wl, Kernel/*.m, Documentation/English/ReferencePages/Symbols/*.nb (Usage cells); HypergraphRewritingEngine README.md, paclet/PacletInfo.wl, paclet/Kernel/HypergraphRewriting.wl, paclet/Documentation/Source/{HGEvolve,HypergraphRewriting,GettingStarted}.md; PureMath README.md, PureMath/PacletInfo.wl, Kernel/Foundations/{HypergraphRewriting,TypedHypergraphRewriting,RewritingSystems,AlgebraicRewriting,CausalSets}.wl, Kernel/MathematicalPhysics/CausalSetFieldTheory.wl, Kernel/DiscreteMathematics/{GraphCurvature,GraphTheory,PathReconvergence}.wl, docs/en/Guides/{Foundations/RewritingSystems,Foundations/CausalSets,DiscreteMathematics/PathReconvergence}.md; Infrageometry PacletInfo.wl, Kernel/Usage.wl, README.md; InfraCausality PacletInfo.wl, README.md, Kernel/*.wl (all 11); InfraAnalysis PacletInfo.wl, Kernel/Usage.wl, README.md; InfraGaugeTheory PacletInfo.wl, README.md, Kernel/*.wl (all 14); SyntheticInfrageometry PacletInfo.wl, Kernel/Usage.wl, README.md; InfraUniverseRegistry README.md; PersistenceRewriting PacletInfo.wl, Kernel/Usage.wl, Kernel/PersistenceRewriting.wl; TuringMachine PacletInfo.wl, README.md, Kernel/{TuringMachine,Multiway}.wl, docs/Symbols/*.md (59 pages); CellularAutomaton PacletInfo.wl, README.md, Kernel/Functions.wl; WolframLambda PacletInfo.wl, README.md, Kernel/{Lambda,Multiway,Loader}.wl; Ruliobiology PacletInfo.wl, README.md and four Kernel files; PiMachine, IteratedFiniteAutomaton (plus Kernel/Usage.wl), ProgramGames, DiagrammaticComputation and Gravitas PacletInfo.wl; WolframInstitute/Gravitas README.md and Kernel/Gravitas.wl; JonathanGorard/Gravitas tree and DiscreteHypersurfaceDecomposition.wl; JonathanGorard/Categorica tree; JonathanGorard/LivestreamFiles tree; GetJonWithIt/WolframPhysics src/MultiwaySystem.wl; maxitg/CombinatorEvolve README.md and Kernel file; maxitg/PostTagSystem README.md and Kernel/*.m; maxitg/OrientedGraph README.md and OrientedGraph.wl; maxitg/wl-PlanckTime and WolframPhysicsGallery README.md; sw1sh/WolframMetamathematics README.md, PacletInfo.m, Kernel/*.m; sw1sh/DiagramProcess tree; WolframResearch/QuantumFramework tree, Kernel/Multiway.m, PacletInfo.wl, QuantumCircuitMultiwayGraph.nb; asheux/NetworkSystem PacletInfo.wl, README.md, Kernel/NetworkSystemEvolution.m; ClaudePluginComputationalResearch tree and scripts/search_wolfram_physics.wls; trees of TopologicLogic/My-Own-Little-Universe, PaulSchulz/wolfram-physics, boulderpusher/hypergraphs, pfischer1687/wolfram-physics-project, ddyachkova/Wolfram_Physics_Project, dom1ns00/Stephen-Wolfram-Graphs-with-SetReplace-paclet, rossy-awan/wolfram-physics-notebooks, WolframInstitute/DigitalBoards, WolframInstitute/LivestreamMaterials.

Kernel evaluations (scratch files kernel1.wls, kernel2.wls, kernel3.wls):

- `PacletFind` for WolframInstitute/*, Wolfram/Multicomputation, Wolfram/Lambda, Wolfram/QuantumFramework, Wolfram/Metamathematics, SetReplace (lists the installed versions quoted in the tables)
- `Needs` plus `MessageName[sym, "usage"]` for Wolfram/Lambda, Wolfram/Multicomputation and Wolfram/QuantumFramework multiway symbols (only QuantumCircuitMultiwayGraph has a usage string; the others hold their documentation in notebooks)
- `ResourceObject[name]["Description"]` for MultiReplace, MultiEvaluate, TokenEventGraph, TraceCausalGraph, RandomWolframModel, FindCanonicalHypergraphIsomorphism, ConnectedWolframModelQ, TupleFromIndex, MultiwaySystem, WolframModel, MetricTensor, DiscreteHypersurfaceDecomposition, MultiwayTuringMachine, MultiwayCombinator, SpliceAt, SelectSubsets, EdgeMultiplicity, RandomHypergraph, MultiwayDeterministicTuringMachine (the last and MultiEvaluate failed)
- `Names["WolframInstitute`NetworkSystem`*"]` after loading the installed NetworkSystem paclet


## Findings

### A. Hypergraph rewriting and Wolfram models

#### maxitg/SetReplace (paclet SetReplace)

C++/Wolfram Language package for exploring set and graph rewriting systems. Context `` SetReplace` ``. Symbols read from PackageExport lines in Kernel/*.m and described from Documentation/*.md. The main functions have their own rows; the remaining exports are grouped, and the list below the table describes every symbol.

WolframModelEvolutionObject properties seen in Kernel/WolframModelEvolutionObject.m (strings, not functions): Aborted AllEventsCount AllEventsDistinctElementsCount AllEventsEdgesCount AllEventsEdgesList AllEventsGenerationsList AllEventsList AllEventsRuleIndices AllEventsStatesEdgeIndicesList AllEventsStatesList AllExpressions AtomsCountFinal AtomsCountTotal CausalGraph CompleteGenerationsCount CreatorEvents DestroyerEvents EdgeCountList EdgeCreatorEventIndices EdgeDestroyerEventIndices EdgeDestroyerEventsIndices EdgeGenerationsList EventGenerations EventGenerationsList EventsCount EventsList EventsStatesList EventsStatesPlotsList EvolutionObject ExpressionGenerations ExpressionsCountFinal ExpressionsCountTotal ExpressionsEventsGraph ExpressionsSeparation FeatureAssociation FeatureVector FinalDistinctElementsCount FinalEdgeCount FinalState FinalStatePlot Generation GenerationComplete GenerationEdgeIndices GenerationEventsCountList GenerationEventsList GenerationsCount LayeredCausalGraph MaxCompleteGeneration MultiwayQ PartialGenerationsCount Properties Rules SetAfterEvent StateAfterEvent StateEdgeIndicesAfterEvent StatesList StatesPlotsList StructurePreservingFinalStateGraph TerminationReason TotalGenerationsCount UpdatedStatesList Version VertexCountList.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| WolframModel | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions | the primary function of the package; provides tools for the generation and analysis of set substitution systems | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| WolframModelEvolutionObject | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions | object returned by WolframModel holding an evolution; queried with evolution["property"] (States, CausalGraph, EventsList, ExpressionsEventsGraph, MultiwayQ, FeatureVector, ...) | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| WolframModelPlot | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | alias of HypergraphPlot (exported symbol in Kernel/HypergraphPlot.m) | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| HypergraphPlot | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | plots ordered hypergraphs (edge rendering, vertex coordinates, labels, styles) | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| RulePlot | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | RulePlot of WolframModel gives a HypergraphPlot-based visual representation of hypergraph substitution rules (WL built-in extended by SetReplace) | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| SetReplace | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | performs replacement operations one at a time on a set (the function the package is named after) | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| SetReplaceList | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | performs replacement operations and returns the list of sets after each step | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| SetReplaceAll | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | performs replacements to all non-overlapping subsets at once | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| SetReplaceFixedPoint | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | repeats SetReplace until no more replacements are possible | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| SetReplaceFixedPointList | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | returns the list of all intermediate sets up to the fixed point | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| ToPatternRules | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | convenience function used to quickly enter rules such as {{v1_, v2_, v3_}, {v2_, v4_, v5_}} :> ... | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| GenerateMultihistory | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | the most configurable multihistory generator; with no parameters it attempts to generate all possible histories starting from the initial state | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| GenerateSingleHistory | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | generates single histories by setting MaxDestroyerEvents to one | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| MultisetSubstitutionSystem | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | states are unordered multisets of tokens (arbitrary Wolfram Language expressions); events take submultisets and replace them with other multisets | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| AtomicStateSystem | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | a simple system where states consist of single tokens; rules are patterns on the left and arbitrary code on the right that creates a new state | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| Multihistory | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | a head used for types representing an evaluation history of a computational system | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| CausalDensityDimension | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | estimates the dimension of a subregion of a given graph, using the Myrheim-Meyer dimension estimation algorithm | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| IsomorphicHypergraphQ | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | the natural extension of IsomorphicGraphQ for hypergraphs | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| RandomHypergraph | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | generates a random hypergraph; the first argument specifies either the hypergraph complexity or its signature | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| WolframModelRuleValue | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | computes simple properties of rules, which can be determined without running the evolution | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| HypergraphUnifications | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | constructs all possible hypergraphs that contain subgraphs matching both of its arguments | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| `Generator parameters symbols` | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | event-selection and stopping parameters for GenerateMultihistory and the lists of generators and systems: MaxDestroyerEvents MaxEventInputs MinEventInputs MaxEvents MaxGeneration SetReplaceSystemParameters `$SetReplaceGenerators` `$SetReplaceSystems` | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| `Type system symbols` | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | Multihistory type system: types, conversion, object predicates, property and method wrappers: SetReplaceType SetReplaceTypeConvert SetReplaceObjectQ SetReplaceObjectType SetReplaceProperty SetReplaceMethodImplementation `$SetReplaceTypes` `$SetReplaceProperties` `$SetReplaceTypeGraph` | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| `Utility functions symbols` | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | hypergraph utilities documented under Utility Functions: AcyclicGraphTake IndexHypergraph HypergraphToGraph Subhypergraph WeakSubhypergraph `$WolframModelRuleProperties` `$WolframModelProperties` GeneralizedGridGraph HypergraphAutomorphismGroup HypergraphUnificationsPlot | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |
| `Style and build data symbols` | SetReplace (GitHub paclet) | https://github.com/maxitg/SetReplace/tree/master/Kernel | style lookup, plot themes, methods and build constants: SetReplaceStyleData WolframPhysicsProjectStyleData `$SetReplacePlotThemes` `$WolframPhysicsProjectPlotThemes` `$SetReplaceMethods` `$SetReplaceGitSHA` `$SetReplaceBuildTime` `$SetReplaceLibraryBuildTime` `$SetReplaceLibraryPath` `$SetReplaceRootDirectory` | hypergraph rewriting, Wolfram models, multiway systems, causal graphs | seen |

Every symbol with its usage line or source description:

- WolframModel: the primary function of the package; provides tools for the generation and analysis of set substitution systems
- WolframModelEvolutionObject: object returned by WolframModel holding an evolution; queried with evolution["property"] (States, CausalGraph, EventsList, ExpressionsEventsGraph, MultiwayQ, FeatureVector, ...)
- WolframModelPlot: alias of HypergraphPlot (exported symbol in Kernel/HypergraphPlot.m)
- HypergraphPlot: plots ordered hypergraphs (edge rendering, vertex coordinates, labels, styles)
- RulePlot: RulePlot of WolframModel gives a HypergraphPlot-based visual representation of hypergraph substitution rules (WL built-in extended by SetReplace)
- SetReplace: performs replacement operations one at a time on a set (the function the package is named after)
- SetReplaceList: performs replacement operations and returns the list of sets after each step
- SetReplaceAll: performs replacements to all non-overlapping subsets at once
- SetReplaceFixedPoint: repeats SetReplace until no more replacements are possible
- SetReplaceFixedPointList: returns the list of all intermediate sets up to the fixed point
- ToPatternRules: convenience function used to quickly enter rules such as {{v1_, v2_, v3_}, {v2_, v4_, v5_}} :> ...
- GenerateMultihistory: the most configurable multihistory generator; with no parameters it attempts to generate all possible histories starting from the initial state
- GenerateSingleHistory: generates single histories by setting MaxDestroyerEvents to one
- MaxDestroyerEvents: event-selection parameter that controls the number of inconsistent events allowed to take the same token as an input
- MaxEventInputs: event-selection parameter that controls the maximum number of input tokens allowed per event
- MinEventInputs: event-selection parameter that controls the minimum number of input tokens allowed per event
- MaxEvents: the most basic stopping condition; stops the evaluation once the given number of events is reached
- MaxGeneration: event-selection parameter specifying the maximum generation of created tokens
- SetReplaceSystemParameters: gives the list of parameters that can be used as keys in generators such as GenerateMultihistory
- `$SetReplaceGenerators`: gives the list of all generators that can be used to evaluate systems
- `$SetReplaceSystems`: gives the list of all computational systems that can be used with GenerateMultihistory and other generators
- MultisetSubstitutionSystem: states are unordered multisets of tokens (arbitrary Wolfram Language expressions); events take submultisets and replace them with other multisets
- AtomicStateSystem: a simple system where states consist of single tokens; rules are patterns on the left and arbitrary code on the right that creates a new state
- Multihistory: a head used for types representing an evaluation history of a computational system
- SetReplaceType: represents a SetReplace type, SetReplaceType[name, version]
- SetReplaceTypeConvert: allows one to convert one type (of, e.g., a Multihistory) to another: SetReplaceTypeConvert[newType][object]
- SetReplaceObjectQ: yields True for SetReplace objects and False otherwise
- SetReplaceObjectType: yields the type of an object
- SetReplaceProperty: represents a SetReplace property; used in vertex names of `$SetReplaceTypeGraph`
- SetReplaceMethodImplementation: represents a (usually internal) implementation of either a translation or a property
- `$SetReplaceTypes`: gives the list of all types defined in SetReplace
- `$SetReplaceProperties`: gives the list of all properties defined in SetReplace
- `$SetReplaceTypeGraph`: gives the Graph showing all types (including internal ones) and possible computation paths between them
- CausalDensityDimension: estimates the dimension of a subregion of a given graph, using the Myrheim-Meyer dimension estimation algorithm
- AcyclicGraphTake: gives the intersection of the out-component of the first vertex with the in-component of the second vertex
- IndexHypergraph: replaces the vertices of the hypergraph by its vertex indices
- IsomorphicHypergraphQ: the natural extension of IsomorphicGraphQ for hypergraphs
- HypergraphToGraph: converts a hypergraph to a Graph object (3 ways: distance-preserving, structure-preserving, ...)
- RandomHypergraph: generates a random hypergraph; the first argument specifies either the hypergraph complexity or its signature
- Subhypergraph: selects hyperedges that only contain vertices from the requested list
- WeakSubhypergraph: selects hyperedges that contain any of the requested vertices (exported alongside Subhypergraph in Kernel/Subhypergraph.m)
- WolframModelRuleValue: computes simple properties of rules, which can be determined without running the evolution
- `$WolframModelRuleProperties`: list of properties supported by WolframModelRuleValue
- `$WolframModelProperties`: list of properties supported by WolframModel and WolframModelEvolutionObject
- GeneralizedGridGraph: similar to GridGraph, but allows for additional specifiers in each direction of the grid
- HypergraphAutomorphismGroup: does the same thing as GraphAutomorphismGroup, but for ordered hypergraphs
- HypergraphUnifications: constructs all possible hypergraphs that contain subgraphs matching both of its arguments
- HypergraphUnificationsPlot: plots the unifications from HypergraphUnifications (Kernel/HypergraphUnificationsPlot.m)
- SetReplaceStyleData: allows one to lookup styles used in various SetReplace functions and properties such as HypergraphPlot and CausalGraph
- WolframPhysicsProjectStyleData: older name for SetReplaceStyleData (exported in Kernel/SetReplaceStyleData.m)
- `$SetReplacePlotThemes`: list of plot themes available for SetReplace plots
- `$WolframPhysicsProjectPlotThemes`: older name for `$SetReplacePlotThemes`
- `$SetReplaceMethods`: list of evaluation methods (Symbolic and LowLevel) for WolframModel
- `$SetReplaceGitSHA`: git SHA of the currently-used version of SetReplace (build data)
- `$SetReplaceBuildTime`: build time of the currently-used version of SetReplace
- `$SetReplaceLibraryBuildTime`: build time of the C++ library libSetReplace
- `$SetReplaceLibraryPath`: path to the loaded libSetReplace library
- `$SetReplaceRootDirectory`: root directory of the loaded SetReplace paclet

#### WolframInstitute/Hypergraph

Paclet WolframInstitute/Hypergraph 1.2.3, Hypergraph tools, context `` WolframInstitute`Hypergraph` ``, creators Nikolay Murzin, Carlos Zapata Carratala and Pavel Hajek. Symbols read from PacletInfo.wl and Kernel PackageExport lines; usage lines from docs/Symbols/*.md. The main functions have their own rows; the rest are grouped, and the list below the table gives every usage line.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| CanonicalHypergraph | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/CanonicalHypergraph.md | CanonicalHypergraph[hg] gives a canonical form of the hypergraph hg, with vertices relabeled by consecutive integers. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| CanonicalHypergraphRule | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/CanonicalHypergraphRule.md | CanonicalHypergraphRule[rule] gives a canonical form of the HypergraphRule rule, with the vertices of both sides relabeled by consecutive integers. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| EdgeSymmetry | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/EdgeSymmetry.md | EdgeSymmetry[hg] gives the explicit vertex permutations each hyperedge of the hypergraph hg is symmetric under. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| EnumerateHypergraphRules | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/EnumerateHypergraphRules.md | EnumerateHypergraphRules[{{m_1, a_1}, …} -> {{k_1, b_1}, …}] enumerates canonical hypergraph rewrite rules whose input has m_1 hyperedges of arity a_1, etc, and whose out | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| EnumerateHypergraphs | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/EnumerateHypergraphs.md | EnumerateHypergraphs[{{m_1, a_1}, {m_2, a_2}, …}] enumerates simple connected hypergraphs with m_1 hyperedges of arity a_1, m_2 hyperedges of arity a_2, etc. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| EnumerateWolframModelRules | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/EnumerateWolframModelRules.md | EnumerateWolframModelRules[{{m_1, a_1}, …} -> {{k_1, b_1}, …}] enumerates canonical Wolfram-model-style rules whose input has m_1 hyperedges of arity a_1, etc, and whose | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| HighlightRule | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/HighlightRule.md | HighlightRule[rule, hg] gives a list of graphics highlighting every way the HypergraphRule rule matches the hypergraph hg, together with the result of each rewrite. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| Hypergraph | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/Hypergraph.md | Hypergraph[{e_1, e_2, …}] yields a hypergraph with hyperedges e_i. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| HypergraphDraw | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/HypergraphDraw.md | HypergraphDraw[] opens an interactive canvas for drawing a hypergraph. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| HypergraphQ | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/HypergraphQ.md | HypergraphQ[expr] gives True if expr is a valid Hypergraph object, and False otherwise. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| HypergraphRule | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/HypergraphRule.md | HypergraphRule[input, output] gives a hypergraph rewriting rule that replaces the hypergraph input with the hypergraph output. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| HypergraphRuleDraw | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/HypergraphRuleDraw.md | HypergraphRuleDraw[] opens two side-by-side interactive canvases for drawing the input and output of a HypergraphRule. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| HypergraphRuleQ | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/HypergraphRuleQ.md | HypergraphRuleQ[expr] gives True if expr is a valid HypergraphRule object, and False otherwise. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| HypergraphToGraph | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/HypergraphToGraph.md | HypergraphToGraph[hg] gives a directed Graph on the vertices of the hypergraph hg, with an edge for every pair of vertices adjacent in some symmetric ordering of a hypere | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| IsomorphicHypergraphQ | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/IsomorphicHypergraphQ.md | IsomorphicHypergraphQ[hg1, hg2] gives True if the hypergraphs hg1 and hg2 are isomorphic, and False otherwise. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| LinkedHypergraph | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/LinkedHypergraph.md | LinkedHypergraph[edges] gives a Hypergraph from the edge list edges, drawn as a pointer-style diagram in which the second vertex of every edge is shown as a framed box ho | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| RandomHypergraph | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/RandomHypergraph.md | RandomHypergraph[n, {{m_1, a_1}, {m_2, a_2}, …}] gives a pseudorandom hypergraph on n atoms with m_1 hyperedges of arity a_1, m_2 hyperedges of arity a_2, etc. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| RandomHypergraphRule | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/RandomHypergraphRule.md | RandomHypergraphRule[{{m_1, a_1}, …} -> {{k_1, b_1}, …}] gives a pseudorandom hypergraph rewrite rule whose input has m_1 hyperedges of arity a_1, etc, and whose output h | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| SimpleHypergraphPlot | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/SimpleHypergraphPlot.md | SimpleHypergraphPlot[hg] generates a plot of the hypergraph hg. | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| ToPatternRules | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/blob/main/docs/Symbols/ToPatternRules.md | ToPatternRules[rule] gives the pattern rule equivalent to the HypergraphRule rule, in the {lhs} :> Module[{new}, {rhs}] form used by SetReplace-style hypergraph rewriting | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| `Matrices and algebra symbols` | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/tree/main/docs/Symbols | adjacency and incidence tensors, hypermatrices, transition matrices, insertion brackets: AdjacencyHypergraph AdjacencyTensor HypergraphIncidence HypergraphIncidenceMatrix HypergraphInsertion HypergraphInsertionBracket HypergraphInsertionBracketDegree HypergraphTransitionMatrix Hypermatrix HypermatrixGraph HypermatrixQ IncidenceHypergraph KoszulSign CanonicalHypergraphGraded | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| `Edges, predicates and transformations symbols` | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/tree/main/docs/Symbols | hyperedge objects and symmetries, edge lists, simple and ordered forms, unions, products, embeddings, display thresholds: ConnectedHypergraphQ CyclicEdge EdgeListTagged EdgeMultiplicity Hyperedge HyperedgeList Hyperedges HyperedgesQ Hypergraph3D HypergraphArityReduce HypergraphEmbedding HypergraphHadamardProduct HypergraphLargeQ HypergraphUnion OrderedHypergraphToGraph SetHypergraphSummaryThresholds SimpleHypergraph SimpleHypergraphPlot3D SimpleHypergraphQ ToLabeledEdges ToLabeledPatternEdges ToOrderedHypergraph | hypergraphs, hypergraph rewriting, rule enumeration | seen |
| `Generation symbols` | WolframInstitute/Hypergraph | https://github.com/WolframInstitute/Hypergraph/tree/main/docs/Symbols | random and enumerated hypergraphs and rules: EnumerateOrderedHypergraphs RandomAllHypergraph RandomConnectedHypergraph | hypergraphs, hypergraph rewriting, rule enumeration | seen |

Every symbol with its usage line or source description:

- AdjacencyHypergraph: AdjacencyHypergraph[tensor] constructs the hypergraph whose adjacency tensor is tensor.
- AdjacencyTensor: AdjacencyTensor[hg] gives the adjacency tensor of the hypergraph hg.
- CanonicalHypergraph: CanonicalHypergraph[hg] gives a canonical form of the hypergraph hg, with vertices relabeled by consecutive integers.
- CanonicalHypergraphRule: CanonicalHypergraphRule[rule] gives a canonical form of the HypergraphRule rule, with the vertices of both sides relabeled by consecutive integers.
- ConnectedHypergraphQ: ConnectedHypergraphQ[hg] gives True if the hypergraph hg is connected, and False otherwise.
- CyclicEdge: CyclicEdge[v1, v2] represents the hyperedge {v1, v2} with cyclic edge symmetry, given in the edge list passed to Hypergraph.
- EdgeListTagged: EdgeListTagged[hg] gives the hyperedges of the hypergraph hg, with tagged edges given as edge -> tag.
- EdgeMultiplicity: EdgeMultiplicity[hg] gives an Association from each distinct hyperedge of the hypergraph hg to the number of times it occurs.
- EdgeSymmetry: EdgeSymmetry[hg] gives the explicit vertex permutations each hyperedge of the hypergraph hg is symmetric under.
- EnumerateHypergraphRules: EnumerateHypergraphRules[{{m_1, a_1}, …} -> {{k_1, b_1}, …}] enumerates canonical hypergraph rewrite rules whose input has m_1 hyperedges of arity a_1, etc, and whose out
- EnumerateHypergraphs: EnumerateHypergraphs[{{m_1, a_1}, {m_2, a_2}, …}] enumerates simple connected hypergraphs with m_1 hyperedges of arity a_1, m_2 hyperedges of arity a_2, etc.
- EnumerateOrderedHypergraphs: EnumerateOrderedHypergraphs[{{m_1, a_1}, {m_2, a_2}, …}] enumerates simple connected hypergraphs with ordered hyperedges, m_1 of arity a_1, m_2 of arity a_2, etc.
- EnumerateWolframModelRules: EnumerateWolframModelRules[{{m_1, a_1}, …} -> {{k_1, b_1}, …}] enumerates canonical Wolfram-model-style rules whose input has m_1 hyperedges of arity a_1, etc, and whose
- HighlightRule: HighlightRule[rule, hg] gives a list of graphics highlighting every way the HypergraphRule rule matches the hypergraph hg, together with the result of each rewrite.
- Hyperedge: Hyperedge[edge] represents a hyperedge on the vertex list edge, with "Unordered" symmetry, for use inside a Hypergraph edge specification.
- HyperedgeList: HyperedgeList[hg] gives the hyperedges of the hypergraph hg as a list of Hyperedge objects, each carrying its own edge symmetry.
- Hyperedges: Hyperedges[e1, e2, …] represents a collection of hyperedges e1, e2, …, each given in the same form as an edge in the list passed to Hypergraph.
- HyperedgesQ: HyperedgesQ[expr] gives True if expr is a valid Hyperedges object, and False otherwise.
- Hypergraph: Hypergraph[{e_1, e_2, …}] yields a hypergraph with hyperedges e_i.
- Hypergraph3D: Hypergraph3D[{e_1, e_2, …}] yields a hypergraph with hyperedges e_i, laid out in three dimensions.
- HypergraphArityReduce: HypergraphArityReduce[hg, k] gives the hypergraph obtained by replacing every hyperedge of hg with all of its size-k vertex subsets.
- HypergraphDraw: HypergraphDraw[] opens an interactive canvas for drawing a hypergraph.
- HypergraphEmbedding: HypergraphEmbedding[hg] gives the coordinates at which the vertices of the hypergraph hg are drawn.
- HypergraphHadamardProduct: HypergraphHadamardProduct[hg1, hg2, …] gives the hypergraph whose vertices are the union of the vertices of hg1, hg2, … and whose hyperedges are those common to all of th
- HypergraphIncidence: HypergraphIncidence[hg] gives an association from each vertex of hg to the list of hyperedges it belongs to.
- HypergraphIncidenceMatrix: HypergraphIncidenceMatrix[hg] gives the incidence matrix of the hypergraph hg.
- HypergraphInsertion: HypergraphInsertion[hg1, hg2, …, hgn] inserts hgn into hg(n-1), the result into hg(n-2), and so on down to hg1, at every allowed vertex at each step, giving a list of one
- HypergraphInsertionBracket: HypergraphInsertionBracket[hg1, hg2, …] gives the graded antisymmetric insertion bracket of the hypergraphs hg1, hg2, …, as an association from resulting hypergraphs to i
- HypergraphInsertionBracketDegree: HypergraphInsertionBracketDegree[hg] gives the grading degree of the hypergraph hg used by HypergraphInsertionBracket.
- HypergraphLargeQ: HypergraphLargeQ[hg] gives True if the hypergraph hg is large enough to display as a summary box instead of a graphical plot, and False otherwise.
- HypergraphQ: HypergraphQ[expr] gives True if expr is a valid Hypergraph object, and False otherwise.
- HypergraphRule: HypergraphRule[input, output] gives a hypergraph rewriting rule that replaces the hypergraph input with the hypergraph output.
- HypergraphRuleDraw: HypergraphRuleDraw[] opens two side-by-side interactive canvases for drawing the input and output of a HypergraphRule.
- HypergraphRuleQ: HypergraphRuleQ[expr] gives True if expr is a valid HypergraphRule object, and False otherwise.
- HypergraphToGraph: HypergraphToGraph[hg] gives a directed Graph on the vertices of the hypergraph hg, with an edge for every pair of vertices adjacent in some symmetric ordering of a hypere
- HypergraphTransitionMatrix: HypergraphTransitionMatrix[hg] gives the transition matrix of a random walk on the vertices of the hypergraph hg.
- HypergraphUnion: HypergraphUnion[hg1, hg2, …] gives the hypergraph whose vertices are the union of the vertices of hg1, hg2, … and whose hyperedges are the concatenation of their hyperedg
- Hypermatrix: Hypermatrix[hg] gives the hypermatrix of the hypergraph hg, a graded collection of adjacency arrays with one rank-k array per group of arity-k hyperedges.
- HypermatrixGraph: HypermatrixGraph[hm] constructs the hypergraph corresponding to the hypermatrix hm.
- HypermatrixQ: HypermatrixQ[expr] gives True if expr is a valid Hypermatrix object, and False otherwise.
- IncidenceHypergraph: IncidenceHypergraph[matrix] constructs the hypergraph whose incidence matrix is matrix.
- IsomorphicHypergraphQ: IsomorphicHypergraphQ[hg1, hg2] gives True if the hypergraphs hg1 and hg2 are isomorphic, and False otherwise.
- KoszulSign: KoszulSign[permutation] gives the Koszul sign incurred by reordering a sequence of graded elements according to permutation, treating every element as degree 0.
- LinkedHypergraph: LinkedHypergraph[edges] gives a Hypergraph from the edge list edges, drawn as a pointer-style diagram in which the second vertex of every edge is shown as a framed box ho
- OrderedHypergraphToGraph: OrderedHypergraphToGraph[hg] gives a Graph encoding of the hypergraph hg that distinguishes each hyperedge and preserves the order of vertices within it.
- RandomAllHypergraph: RandomAllHypergraph[{n, {{m_1, a_1}, {m_2, a_2}, …}}] gives a pseudorandom hypergraph on n atoms with m_1 hyperedges of arity a_1, m_2 hyperedges of arity a_2, etc, with
- RandomConnectedHypergraph: RandomConnectedHypergraph[{n, {{m_1, a_1}, {m_2, a_2}, …}}] gives a pseudorandom connected hypergraph on at most n atoms with m_1 hyperedges of arity a_1, m_2 hyperedges
- RandomHypergraph: RandomHypergraph[n, {{m_1, a_1}, {m_2, a_2}, …}] gives a pseudorandom hypergraph on n atoms with m_1 hyperedges of arity a_1, m_2 hyperedges of arity a_2, etc.
- RandomHypergraphRule: RandomHypergraphRule[{{m_1, a_1}, …} -> {{k_1, b_1}, …}] gives a pseudorandom hypergraph rewrite rule whose input has m_1 hyperedges of arity a_1, etc, and whose output h
- SetHypergraphSummaryThresholds: SetHypergraphSummaryThresholds["key" -> value] sets the named threshold used to decide when a Hypergraph displays as a compact summary box instead of a full plot.
- SimpleHypergraph: SimpleHypergraph[hg] gives the hypergraph obtained from hg by removing hyperedges with a repeated vertex and merging hyperedges that agree up to their edge symmetry.
- SimpleHypergraphPlot: SimpleHypergraphPlot[hg] generates a plot of the hypergraph hg.
- SimpleHypergraphPlot3D: SimpleHypergraphPlot3D[hg] generates a 3D plot of the hypergraph hg.
- SimpleHypergraphQ: SimpleHypergraphQ[hg] gives True if the hypergraph hg has no repeated hyperedges, and False otherwise.
- ToLabeledEdges: ToLabeledEdges[vertexLabels, edges] pairs every vertex occurring in the list of hyperedges edges with its label from the association vertexLabels, giving Labeled[vertex,
- ToLabeledPatternEdges: ToLabeledPatternEdges[hg] gives the pattern form of the hyperedges of the Hypergraph hg, suitable for matching with ResourceFunction["MultiReplace"].
- ToOrderedHypergraph: ToOrderedHypergraph[hg] gives a hypergraph with "Ordered" edge symmetry, obtained by expanding every hyperedge of hg over its full edge symmetry group.
- ToPatternRules: ToPatternRules[rule] gives the pattern rule equivalent to the HypergraphRule rule, in the {lhs} :> Module[{new}, {rhs}] form used by SetReplace-style hypergraph rewriting
- CanonicalHypergraphGraded: graded canonical form of a hypergraph, exported from Kernel/HypergraphInsertionBracket.m (no docs page)

#### WolframInstitute/HypergraphRewritingEngine (paclet WolframInstitute/HypergraphRewriteEngine)

A high-performance multiway hypergraph rewriting engine for the Wolfram Physics Project (C++ with LibraryLink paclet, creator Richard Assar). Context `` HypergraphRewriting` ``. The guide says HGEvolve is the paclet's entire public surface; the session symbols are also exported by paclet/Kernel/HypergraphRewriting.wl. Properties of HGEvolve: StatesGraph CausalGraph BranchialGraph EvolutionGraph EvolutionCausalGraph EvolutionBranchialGraph EvolutionCausalBranchialGraph States Events CausalEdges BranchialEdges NumStates NumEvents NumCausalEdges NumBranchialEdges Debug All GlobalEdges StateBitvectors (plus *Structure variants).

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| HGEvolve | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine/blob/master/paclet/Documentation/Source/HGEvolve.md | HGEvolve[rules, initial, steps] performs multiway hypergraph rewriting of the hypergraph initial under rules for steps steps, returning the combined evolution/causal/branchial graph; HGEvolve[rules, initial, steps, property] returns the specified property | hypergraph rewriting, multiway systems, causal graphs, branchial graphs | seen |
| `HGSession symbols` | WolframInstitute/HypergraphRewriteEngine | https://github.com/WolframInstitute/HypergraphRewritingEngine/blob/master/paclet/Kernel/HypergraphRewriting.wl | continuable evolutions held by an engine worker: HGSessionObject HGSessionOpen HGSessionStep HGSessionQuery HGSessionFrontier HGSessionClose | hypergraph rewriting, multiway systems, causal graphs, branchial graphs | seen |

Every symbol with its usage line or source description:

- HGEvolve: HGEvolve[rules, initial, steps] performs multiway hypergraph rewriting of the hypergraph initial under rules for steps steps, returning the combined evolution/causal/branchial graph; HGEvolve[rules, initial, steps, property] returns the specified property
- HGSessionObject: HGSessionObject[data] is a live exploration held by an engine worker. Produced by HGSessionOpen, advanced by HGSessionStep, read by HGSessionQuery, released by HGSessionClose
- HGSessionOpen: HGSessionOpen[rules, initialEdges, property] opens a continuable evolution and returns an HGSessionObject
- HGSessionStep: HGSessionStep[session, n] carries the session's exploration n steps further from the frontier it stopped at, and returns the property the session was opened for
- HGSessionQuery: HGSessionQuery[session] re-reads the session's accumulated graph without exploring further
- HGSessionFrontier: HGSessionFrontier[session] gives the states a continuation would resume from
- HGSessionClose: HGSessionClose[session] releases the engine holding the session

#### WolframInstitute/PureMath: categorical hypergraph rewriting and rewriting systems

Paclet WolframInstitute/PureMath 0.5.0 (An aggregation of pure-mathematics concepts), context `` WolframInstitute`PureMath` ``. Usage messages read from PureMath/Kernel/Foundations/HypergraphRewriting.wl, TypedHypergraphRewriting.wl, RewritingSystems.wl and AlgebraicRewriting.wl. Hypergraph states here are explicit data (VertexList and EdgeList associations), the ordered multiset-of-tuples reading, with double-pushout rewriting in an adhesive category. The table groups symbols by kernel file; the list below gives every usage line.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Foundations/HypergraphRewriting.wl symbols` | WolframInstitute/PureMath | https://github.com/WolframInstitute/PureMath/blob/main/PureMath/Kernel/Foundations/HypergraphRewriting.wl | hypergraph states and morphisms, pushouts, pullbacks, gluing condition, double-pushout steps, parallel and sequential independence, critical pairs, van Kampen squares and cubes: HypergraphStateQ HypergraphMorphism HypergraphMorphismQ HypergraphMonomorphismQ HypergraphEpimorphismQ HypergraphIsomorphismQ IdentityHypergraphMorphism HypergraphPushout HypergraphPushoutQ HypergraphPullback HypergraphPullbackQ HypergraphGluingConditionQ HypergraphGluingConditionReport HypergraphPushoutComplement HypergraphPushoutComplementQ HypergraphRewritingRule HypergraphRewritingRuleQ HypergraphDoublePushout HypergraphDoublePushoutQ HypergraphParallelIndependentQ HypergraphSequentialIndependentQ HypergraphCriticalPairs HypergraphRuleInterface InterfacedHypergraphJoinability VanKampenSquareQ VanKampenSquareReport VanKampenCube VanKampenCubeQ HypergraphCategory | hypergraph rewriting, double pushout, confluence, critical pairs | seen |
| `Foundations/TypedHypergraphRewriting.wl symbols` | WolframInstitute/PureMath | https://github.com/WolframInstitute/PureMath/blob/main/PureMath/Kernel/Foundations/TypedHypergraphRewriting.wl | typed hypergraph states over a type state (slice category), typed double pushout, molecule instance: TypedHypergraphState TypedHypergraphStateQ TypedHypergraphMorphism TypedHypergraphMorphismQ IdentityTypedHypergraphMorphism TypedHypergraphCategory TypedHypergraphPushout TypedHypergraphPushoutQ TypedHypergraphPullback TypedHypergraphPullbackQ TypedHypergraphRewritingRule TypedHypergraphRewritingRuleQ TypedHypergraphDoublePushout TypedHypergraphDoublePushoutQ MoleculeHypergraphState MoleculeHypergraphTypeState HypergraphStateMolecule | hypergraph rewriting, double pushout, confluence, critical pairs | seen |
| `Foundations/RewritingSystems.wl symbols` | WolframInstitute/PureMath | https://github.com/WolframInstitute/PureMath/blob/main/PureMath/Kernel/Foundations/RewritingSystems.wl | string rewriting: critical pairs, normal forms, joinability, local confluence, confluence reports, branch pairs: StringRewritingCriticalPairs StringRewritingNormalForms StringRewritingJoinableQ StringRewritingLocallyConfluentQ StringRewritingConfluentQ StringRewritingConfluenceReport StringRewritingBranchPairs | hypergraph rewriting, double pushout, confluence, critical pairs | seen |
| `Foundations/AlgebraicRewriting.wl symbols` | WolframInstitute/PureMath | https://github.com/WolframInstitute/PureMath/blob/main/PureMath/Kernel/Foundations/AlgebraicRewriting.wl | linear-algebraic effect vectors, conservation laws, cycle vectors and reachability obstructions of rule systems: RewritingEffectVector RewritingEffectMatrix RewritingConservationLaws RewritingCycleVectors RewritingBalancedQ RewritingReachabilityObstructionQ | hypergraph rewriting, double pushout, confluence, critical pairs | seen |

Every symbol with its usage line or source description:

- HypergraphStateQ: HypergraphStateQ[expr] gives True if expr is a hypergraph state, and False otherwise. A state is an Association < or "VertexList" -> {v, ...}, "EdgeList" -> {{v, ...}, ...} or
- HypergraphMorphism: HypergraphMorphism[domain, codomain, vertexMap, edgeMap] gives the validated morphism between two hypergraph states. A state is an Association < or "VertexList" -> {v, ...},
- HypergraphMorphismQ: HypergraphMorphismQ[expr] gives True if expr is a valid HypergraphMorphism, and False otherwise.
- HypergraphMonomorphismQ: HypergraphMonomorphismQ[m] gives True if the HypergraphMorphism m is a monomorphism - injective on vertices and on edge tokens, which in the presheaf category of hypergra
- HypergraphEpimorphismQ: HypergraphEpimorphismQ[m] gives True if the HypergraphMorphism m is an epimorphism - surjective on vertices and on edge tokens, which in the presheaf category of hypergra
- HypergraphIsomorphismQ: HypergraphIsomorphismQ[m] gives True if the HypergraphMorphism m is an isomorphism - bijective on vertices and on edge tokens, equivalently both a monomorphism and an epi
- IdentityHypergraphMorphism: IdentityHypergraphMorphism[state] gives the identity HypergraphMorphism of the hypergraph state < or "VertexList" -> {v, ...}, "EdgeList" -> {{v, ...}, ...} or >, sending every
- HypergraphPushout: HypergraphPushout[f, g] gives the pushout of the span of HypergraphMorphism legs f: A -> B and g: A -> C, which must share their domain A (valid legs with different domai
- HypergraphPushoutQ: HypergraphPushoutQ[expr] gives True if expr is a valid HypergraphPushout object, and False otherwise.
- HypergraphPullback: HypergraphPullback[f, g] gives the pullback of the cospan of HypergraphMorphism legs f: B -> A and g: C -> A, which must share their codomain A (valid legs with different
- HypergraphPullbackQ: HypergraphPullbackQ[expr] gives True if expr is a valid HypergraphPullback object, and False otherwise.
- HypergraphGluingConditionQ: HypergraphGluingConditionQ[l, m] gives True if the match m: L -> G satisfies the gluing condition for the monomorphic rule leg l: K -> L, and False otherwise. The conditi
- HypergraphGluingConditionReport: HypergraphGluingConditionReport[l, m] gives an association recording the whole gluing-condition analysis of the monomorphic rule leg l: K -> L at the match m: L -> G: "Gl
- HypergraphPushoutComplement: HypergraphPushoutComplement[l, m] gives the pushout complement of the monomorphic rule leg l: K -> L at a match m: L -> G satisfying the gluing condition: the context sta
- HypergraphPushoutComplementQ: HypergraphPushoutComplementQ[expr] gives True if expr is a valid HypergraphPushoutComplement object, and False otherwise.
- HypergraphRewritingRule: HypergraphRewritingRule[l, r] gives the validated double-pushout rewriting rule with span L <- K -> R from two monomorphic HypergraphMorphism legs l: K -> L and r: K -> R
- HypergraphRewritingRuleQ: HypergraphRewritingRuleQ[expr] gives True if expr is a valid HypergraphRewritingRule, and False otherwise.
- HypergraphDoublePushout: HypergraphDoublePushout[rule, m] gives the double-pushout rewrite step of the HypergraphRewritingRule rule at the match m: L -> G, a HypergraphMorphism from the rule's le
- HypergraphDoublePushoutQ: HypergraphDoublePushoutQ[expr] gives True if expr is a valid HypergraphDoublePushout object, and False otherwise.
- HypergraphParallelIndependentQ: HypergraphParallelIndependentQ[step1, step2] gives True if the two HypergraphDoublePushout steps are parallel independent, and False otherwise. The two steps must apply t
- HypergraphSequentialIndependentQ: HypergraphSequentialIndependentQ[step1, step2] gives True if the two-step derivation of step1 followed by step2 is sequentially independent, and False otherwise. The seco
- HypergraphCriticalPairs: HypergraphCriticalPairs[rule1, rule2] gives the critical pairs of two HypergraphRewritingRule objects: the parallel-dependent pairs of direct derivations out of the joint
- HypergraphRuleInterface: HypergraphRuleInterface[x] gives the interface morphism of a rewriting datum x, the discipline under which double-pushout rewriting preserves and compares names. Hypergra
- InterfacedHypergraphJoinability: InterfacedHypergraphJoinability[{step1, step2}, rules] gives True if the divergence of two HypergraphDoublePushout steps out of one host state is joinable under the inter
- VanKampenSquareQ: VanKampenSquareQ[pushout, d] gives True if pulling the pushout square back along the single morphism d into its apex leaves a pushout - the van Kampen biconditional for t
- VanKampenSquareReport: VanKampenSquareReport[pushout, d] gives an association recording the per-face analysis of the cube the single morphism d into the pushout apex determines: "VanKampenSquar
- VanKampenCube: VanKampenCube[bottom, d] gives the commutative cube over the square bottom determined by the single morphism d: D' -> D into its apex - the whole square pulled back along
- VanKampenCubeQ: VanKampenCubeQ[expr] gives True if expr is a valid VanKampenCube object, and False otherwise.
- HypergraphCategory: HypergraphCategory gives the category Hyp of hypergraph states and their morphisms as a ConcreteCategory instance: "Objects" is HypergraphStateQ, "Morphisms" is Hypergrap
- TypedHypergraphState: TypedHypergraphState[typing] gives the validated typed hypergraph state carrying the HypergraphMorphism typing from its underlying hypergraph state into its type state. T
- TypedHypergraphStateQ: TypedHypergraphStateQ[expr] gives True if expr is a valid TypedHypergraphState, and False otherwise.
- TypedHypergraphMorphism: TypedHypergraphMorphism[dom, cod, m] gives the validated morphism of typed hypergraph states from dom to cod carried by the HypergraphMorphism m between their underlying
- TypedHypergraphMorphismQ: TypedHypergraphMorphismQ[expr] gives True if expr is a valid TypedHypergraphMorphism, and False otherwise.
- IdentityTypedHypergraphMorphism: IdentityTypedHypergraphMorphism[s] gives the identity TypedHypergraphMorphism of the typed hypergraph state s, carried by the identity of its underlying state; it is a le
- TypedHypergraphCategory: TypedHypergraphCategory[t] gives the slice category Hyp/t of hypergraph states typed over the type state t as a ConcreteCategory instance, the parameterized sibling of Hy
- TypedHypergraphPushout: TypedHypergraphPushout[f, g] gives the pushout of a span of TypedHypergraphMorphism legs sharing their typed domain (legs over different type states, or valid legs with d
- TypedHypergraphPushoutQ: TypedHypergraphPushoutQ[expr] gives True if expr is a valid TypedHypergraphPushout object, and False otherwise.
- TypedHypergraphPullback: TypedHypergraphPullback[f, g] gives the pullback of a cospan of TypedHypergraphMorphism legs sharing their typed codomain (legs over different type states, or valid legs
- TypedHypergraphPullbackQ: TypedHypergraphPullbackQ[expr] gives True if expr is a valid TypedHypergraphPullback object, and False otherwise.
- TypedHypergraphRewritingRule: TypedHypergraphRewritingRule[l, r] gives the validated typed double-pushout rewriting rule with span L <- K -> R from two TypedHypergraphMorphism legs l and r sharing the
- TypedHypergraphRewritingRuleQ: TypedHypergraphRewritingRuleQ[expr] gives True if expr is a valid TypedHypergraphRewritingRule, and False otherwise.
- TypedHypergraphDoublePushout: TypedHypergraphDoublePushout[rule, m] gives the double-pushout rewrite step of the TypedHypergraphRewritingRule rule at the typed match m, a TypedHypergraphMorphism from
- TypedHypergraphDoublePushoutQ: TypedHypergraphDoublePushoutQ[expr] gives True if expr is a valid TypedHypergraphDoublePushout object, and False otherwise.
- MoleculeHypergraphState: MoleculeHypergraphState[mol] gives the TypedHypergraphState of the Molecule mol: atoms become integer vertices (their realized atom indices) typed by their element symbol
- MoleculeHypergraphTypeState: MoleculeHypergraphTypeState[mols] gives the canonical molecule type state of a list of Molecule objects (a single Molecule is accepted): its vertices are the element symb
- HypergraphStateMolecule: HypergraphStateMolecule[s] gives the Molecule of the chemistry-typed TypedHypergraphState s, inverting MoleculeHypergraphState: vertices become atoms carrying their typed
- StringRewritingCriticalPairs: StringRewritingCriticalPairs[rules] gives the critical pairs of the string rewriting system rules, as a list of associations with keys "Peak" (the shortest word carrying
- StringRewritingNormalForms: StringRewritingNormalForms[rules, string] gives the sorted list of normal forms (irreducible strings) reachable from string under the string rewriting system rules, by br
- StringRewritingJoinableQ: StringRewritingJoinableQ[rules, string1, string2] gives True if string1 and string2 have a common reduct under the string rewriting system rules, False if both reachable
- StringRewritingLocallyConfluentQ: StringRewritingLocallyConfluentQ[rules] gives True if every critical pair of the string rewriting system rules is joinable, which by the critical pair lemma is exactly lo
- StringRewritingConfluentQ: StringRewritingConfluentQ[rules] gives True when confluence of the string rewriting system rules follows from one of three sound criteria: the system has no critical pair
- StringRewritingConfluenceReport: StringRewritingConfluenceReport[rules] gives an association recording the whole confluence analysis of the string rewriting system rules: "CriticalPairs" (each critical p
- StringRewritingBranchPairs: StringRewritingBranchPairs[rules, string] gives one association per unordered pair of distinct redexes of string under the string rewriting system rules, with keys "State
- RewritingEffectVector: RewritingEffectVector[rule] gives the net effect of one application of rule on the type counts of a state, as an Association from basis element to integer: the Parikh (st
- RewritingEffectMatrix: RewritingEffectMatrix[rules] gives an Association describing the effect matrix of the rule list rules (all string rules or all hypergraph rules, as accepted by RewritingE
- RewritingConservationLaws: RewritingConservationLaws[rules] gives a basis of the integer conservation laws of the rule list rules, as Associations from basis element to integer coefficient: the lin
- RewritingCycleVectors: RewritingCycleVectors[rules] gives a basis of the integer right null space of the effect matrix of the rule list rules - the transition invariants (T-invariants) of Petri
- RewritingBalancedQ: RewritingBalancedQ[rule] gives True if the effect vector of rule is zero - one application changes no type count, the analogue over the letter or edge-type basis of a bal
- RewritingReachabilityObstructionQ: RewritingReachabilityObstructionQ[rules, s0, s1] gives True if the linear obstruction to reachability exists: the type-count difference from s0 to s1 lies outside what th

### B. Multiway systems and multicomputation

#### WolframInstitute/Multicomputation (paclet Wolfram/Multicomputation)

Paclet Wolfram/Multicomputation 0.1.9, Various functions for multicomputation, context `` Wolfram`Multicomputation` ``. Documented symbols (PacletInfo): Multi, MultiStringReplace, MultiwaySystem, ToLinkedHypergraph, FromLinkedHypergraph. The remaining symbols are PackageExport lines in Multicomputation/Kernel/*.m; descriptions for those are paraphrased from their definitions. Multi properties (README): Expression, Values, Tuples, EvaluateList, Evaluate, MultiEvaluate, Graph, CausalGraph, BranchialGraph, TokenEventGraph, EvolutionCausalGraph, CausalBranchialGraph, CausalStatesGraph, Events, Edges, Branches, BranchPairs, FoliationSlices. Kernel/WFR.m loads the resource functions MultiReplace, MultiEvaluate, TokenEventGraph and TraceCausalGraph. The main symbols have their own rows; the rest are grouped, and the list below the table describes every symbol.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| Multi | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | Multi[{expr1, expr2, ...}] makes a Multi object that acts as multiple expressions; Multi[expr, rules] makes a Multi object representing a rewriting system (documented symbol) | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| MultiwaySystem | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | MultiwaySystem[rules, init] construct a MultiwaySystem object from a list of rules and an initial condition init; RF-compatible properties AllStatesList, StatesCountsList, CausalInvariantQ, BranchPairsList, StatesGraph, BranchialGraph (documented symbol) | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| MultiStringReplace | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | MultiStringReplace[s, rule] performs all possible string replacements at once (exported symbol) | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| ToLinkedHypergraph | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | ToLinkedHypergraph[string] encode a string as a hypergraph with explicit link and character payload vertices; also encodes trees, graphs, expressions (documented symbol) | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| FromLinkedHypergraph | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | FromLinkedHypergraph[hypergraph, type] decode a linked hypergraph as a given type; default type Graph (documented symbol) | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| MultiwayType | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | MultiwayType[expr] detects the multiway system type of an expression (String, Hypergraph, CA, ...) | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| HypergraphMulti | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | HypergraphMulti[init, rule] Multi object for a hypergraph rewriting system | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| WolframModelMulti | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | WolframModelMulti[init, rules] Multi object for a Wolfram model rewriting system | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| StringMulti | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | StringMulti[init, rule] Multi object for a string rewriting system | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| CAMulti | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | CAMulti[init, rule] Multi object for a cellular automaton | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| `Graph utilities and styles symbols` | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | tree and DAG conversions, initial state handling, complete graphs, vertex shape functions: MultiwaySystemQ WIHypergraphMulti DirectedGraphTree ToDirectedAcyclicGraph AddInitState RemoveInitState RemoveInitEvent VertexCompleteGraph `$StateVertexShapeFunction` `$EventVertexShapeFunction` | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| `Linked hypergraph encoding and rule application symbols` | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | linked-hypergraph predicates, canonical forms, tree conversions, rule conversions and rule application for strings, cellular automata, hypergraphs and Wolfram models: LinkedHypergraphQ CanonicalLinkedHypergraph LinkedHypergraphRoot LinkedHypergraphToIndexedTree LinkedHypergraphToRootTree IndexedTreeToLinkedHypergraph UniquifyIndexedTree LinkedHypergraphRuleToPatternRule PatternRuleToMultiReplaceRule ApplyHypergraphRules ApplyWolframModelRules ApplyStringRules ApplyCARules | multicomputation, multiway systems, causal graphs, branchial graphs | seen |
| `Multiway graph constructors symbols` | Wolfram/Multicomputation | https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel | evolution, branchial, causal, token-event and combined graphs of a Multi: EvolutionGraph BranchialGraph CausalGraph EvolutionCausalGraph CausalBranchialGraph EvolutionBranchialGraph MultiTokenEventGraph CausalStatesGraph | multicomputation, multiway systems, causal graphs, branchial graphs | seen |

Every symbol with its usage line or source description:

- Multi: Multi[{expr1, expr2, ...}] makes a Multi object that acts as multiple expressions; Multi[expr, rules] makes a Multi object representing a rewriting system (documented symbol)
- MultiwaySystem: MultiwaySystem[rules, init] construct a MultiwaySystem object from a list of rules and an initial condition init; RF-compatible properties AllStatesList, StatesCountsList, CausalInvariantQ, BranchPairsList, StatesGraph, BranchialGraph (documented symbol)
- MultiwaySystemQ: tests for a MultiwaySystem object (MultiwaySystem[_Multi, _String])
- MultiStringReplace: MultiStringReplace[s, rule] performs all possible string replacements at once (exported symbol)
- ToLinkedHypergraph: ToLinkedHypergraph[string] encode a string as a hypergraph with explicit link and character payload vertices; also encodes trees, graphs, expressions (documented symbol)
- FromLinkedHypergraph: FromLinkedHypergraph[hypergraph, type] decode a linked hypergraph as a given type; default type Graph (documented symbol)
- LinkedHypergraphQ: tests whether an expression is a linked hypergraph {{link, _, link...}...}
- CanonicalLinkedHypergraph: canonical form of a linked hypergraph
- LinkedHypergraphRoot: root vertex of a linked hypergraph
- LinkedHypergraphToIndexedTree: converts a linked hypergraph to an indexed Tree
- LinkedHypergraphToRootTree: converts a linked hypergraph to a Tree from a given root
- IndexedTreeToLinkedHypergraph: converts an indexed Tree to a linked hypergraph
- UniquifyIndexedTree: makes the indices of an indexed Tree unique
- LinkedHypergraphRuleToPatternRule: converts a linked-hypergraph rule to a pattern rule
- PatternRuleToMultiReplaceRule: converts a pattern rule (lhs :> Module[...]) to a MultiReplace rule
- MultiwayType: MultiwayType[expr] detects the multiway system type of an expression (String, Hypergraph, CA, ...)
- HypergraphMulti: HypergraphMulti[init, rule] Multi object for a hypergraph rewriting system
- WolframModelMulti: WolframModelMulti[init, rules] Multi object for a Wolfram model rewriting system
- WIHypergraphMulti: WIHypergraphMulti[init, rule] Multi object using WolframInstitute/Hypergraph HypergraphRule objects
- StringMulti: StringMulti[init, rule] Multi object for a string rewriting system
- CAMulti: CAMulti[init, rule] Multi object for a cellular automaton
- ApplyHypergraphRules: ApplyHypergraphRules[x, rules] applies hypergraph rules to a linked hypergraph state
- ApplyWolframModelRules: ApplyWolframModelRules[x, rules] applies Wolfram model rules to a state
- ApplyStringRules: ApplyStringRules[hg, rule] applies string rules to a linked-hypergraph-encoded string
- ApplyCARules: ApplyCARules[hg, rules] applies cellular automaton rules to a linked-hypergraph-encoded CA state
- EvolutionGraph: EvolutionGraph[multi, steps] states-and-events evolution graph of a Multi
- BranchialGraph: BranchialGraph[tree] branchial graph from an evolution tree
- CausalGraph: CausalGraph[g, type] causal graph of events from an evolution graph
- EvolutionCausalGraph: EvolutionCausalGraph[cg, type] combined evolution and causal graph
- CausalBranchialGraph: CausalBranchialGraph[cg, n] combined causal and branchial graph
- EvolutionBranchialGraph: EvolutionBranchialGraph[g] combined evolution and branchial graph
- MultiTokenEventGraph: MultiTokenEventGraph[cg, type] token-event graph from a causal graph
- CausalStatesGraph: CausalStatesGraph[cg] causal graph of states
- DirectedGraphTree: DirectedGraphTree[g, root] converts an acyclic directed graph to a Tree
- ToDirectedAcyclicGraph: ToDirectedAcyclicGraph[g, root] converts a graph to a DAG from a root
- AddInitState: AddInitState[g, i] adds an initial state vertex to an evolution graph
- RemoveInitState: removes the initial state vertex from an evolution graph
- RemoveInitEvent: removes the initialization event from an evolution graph
- VertexCompleteGraph: VertexCompleteGraph[vs] complete graph on a vertex list
- `$StateVertexShapeFunction`: vertex shape function used for state vertices in multiway graphs
- `$EventVertexShapeFunction`: vertex shape function used for event vertices in multiway graphs

#### sw1sh/WolframMetamathematics (paclet Wolfram/Metamathematics)

Tools for metamathematics, paclet Wolfram/Metamathematics 1.0.2, context `` Wolfram`Metamathematics` ``. Names read from PackageExport lines in Metamathematics/Kernel/*.m; the files carry no usage messages, so descriptions are paraphrased from file names.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Wolfram/Metamathematics symbols` | Wolfram/Metamathematics | https://github.com/sw1sh/WolframMetamathematics/tree/master/Metamathematics/Kernel | multiway, bidirectional and two-way replacement and unification: MultiReplace MultiStringReplace MultiBiUnify MultiBiReplace MultiCoUnify MultiCoReplace TwoWayMultiReplace TwoWayRuleMultiReplace TwoWayRuleMultiReplaceList TwoWayRuleMultiReplaceGraphList SubexpressionPositions | multiway systems, metamathematics, rewriting | seen |

Every symbol with its usage line or source description:

- MultiReplace: multiway replacement giving all positions (Kernel/MultiReplace.m); origin of the WFR MultiReplace
- MultiStringReplace: multiway string replacement (Kernel/MultiReplace.m)
- MultiBiUnify: bidirectional unification of patterns (Kernel/MultiBiReplace.m)
- MultiBiReplace: bidirectional multiway replacement using unification (Kernel/MultiBiReplace.m)
- MultiCoUnify: co-unification (Kernel/MultiCoReplace.m)
- MultiCoReplace: co-replacement, matching rule right-hand sides (Kernel/MultiCoReplace.m)
- TwoWayMultiReplace: multiway replacement with two-way rules (Kernel/Rewriting.m)
- TwoWayRuleMultiReplace: multiway replacement with TwoWayRule rules (Kernel/TwoWayRule.m)
- TwoWayRuleMultiReplaceList: list of successive two-way multiway replacements (Kernel/TwoWayRule.m)
- TwoWayRuleMultiReplaceGraphList: graphs of successive two-way multiway replacements (Kernel/TwoWayRule.m)
- SubexpressionPositions: positions of subexpressions of an expression (Kernel/SubexpressionPositions.m)

#### WolframResearch/QuantumFramework: multiway functions

Paclet Wolfram/QuantumFramework 2.1.1, Perform analytic and numeric quantum computations. Only the exports of QuantumFramework/Kernel/Multiway.m are listed.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `QuantumCircuit multiway symbols` | Wolfram/QuantumFramework | https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Multiway.m | multiway, causal, path and token-event graphs of quantum circuits: QuantumCircuitMultiwayGraph QuantumCircuitMultiwayCausalGraph QuantumCircuitPathGraph QuantumCircuitTokenEventGraph | multiway systems, quantum | seen |

Every symbol with its usage line or source description:

- QuantumCircuitMultiwayGraph: QuantumCircuitMultiwayGraph[qc] represents a multiway graph of the quantum circuit qc (usage seen in the kernel)
- QuantumCircuitMultiwayCausalGraph: multiway causal graph of a quantum circuit (Kernel/Multiway.m export)
- QuantumCircuitPathGraph: path graph of a quantum circuit evolution (Kernel/Multiway.m export)
- QuantumCircuitTokenEventGraph: token-event graph of a quantum circuit (Kernel/Multiway.m export)

#### SamWhittington/WeylMultiwaySystem

Mathematica package WeylMultiwaySystem (context `` WeylMultiwaySystem` ``, no PacletInfo), the code behind the WWS21 Community post The Multiway Systems of Dynkin Diagrams (https://community.wolfram.com/t/17412). Two files, one PackageExport each, with SetUsage messages; the root-system heads A to G carry usage messages but are not exported. Files fetched raw from the default branch on 2026-09-17.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| WeylMultiwayFinite | SamWhittington/WeylMultiwaySystem | https://github.com/SamWhittington/WeylMultiwaySystem/blob/main/WeylMultiwayFinite.m | WeylMultiwayFinite[FiniteAlgebra, r, n, Options] gives the Multiway System of a Finite Algebra {An,Bn,Cn,Dn,E6,E7,E8,F4,G2} of rank r after n iterations, with Options matching those of MultiwayFunctionSystem (PackageExport, SetUsage) | multiway systems, Lie algebras | seen |
| WeylMultiwayAffine | SamWhittington/WeylMultiwaySystem | https://github.com/SamWhittington/WeylMultiwaySystem/blob/main/WeylMultiwayAffine.m | WeylMultiwayAffine[AffineAlgebra, r, m, n, Options] gives the Multiway System of an Affine Algebra {An,Bn,Cn,Dn,E6,E7,E8,F4,G2} of rank r after n iterations and reflection in the m-plane, with Options matching those of MultiwayFunctionSystem (PackageExport, SetUsage) | multiway systems, Lie algebras | seen |

#### GetJonWithIt/WolframPhysics (Jonathan Gorard, 2020 working repository)

Working repository for my research work on the Wolfram Physics Project. It holds only src/MultiwaySystem.wl, the definition behind the MultiwaySystem resource function. A copy of the same definition is kept at WolframInstitute/Multicomputation Notebooks/MultiwaySystem.wl.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| MultiwaySystem | GitHub (GetJonWithIt/WolframPhysics) | https://github.com/GetJonWithIt/WolframPhysics/blob/master/src/MultiwaySystem.wl | Jonathan Gorard's 2020 working source of the MultiwaySystem resource function (src/MultiwaySystem.wl, 3231 lines): properties include StatesGraph, EvolutionGraph, CausalGraph, BranchialGraph, EvolutionCausalGraph, BranchPairsList, CausalInvariantQ, KnuthBendixCompletion, AllStatesBranchialGraph, SpacelikeStatesGraph, LayeredCausalGraph and event selection functions Sequential, Random, MaxScan | multiway systems, causal graphs, branchial graphs | seen |

#### Function Repository functions referenced by these repositories

Resource functions that the repository code calls (Hypergraph Kernel/ResourceFunctions.m, Multicomputation Kernel/WFR.m, Multicomputation Tests, Gravitas) or that the searches surfaced. Each name was checked in the kernel with ResourceObject[name]["Description"] (kernel2.wls); the description column quotes that result.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| WolframModel | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/ | Generate evolutions of Wolfram model systems | multiway systems, Wolfram models, hypergraphs | seen |
| MultiwaySystem | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/ | Compute the evolution of a multiway system and many associated properties | multiway systems, Wolfram models, hypergraphs | seen |
| MultiReplace | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiReplace/ | Perform replacements and give the positions at which they occur | multiway systems, Wolfram models, hypergraphs | seen |
| MultiEvaluate | cloud resource function, not on the WFR (referenced by Wolfram/Multicomputation Kernel/WFR.m) | https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/WFR.m | deployed in the nikm cloud account (DeployedResources/Function/MultiEvaluate, FunctionLocation CloudObject 6b979e16-9243-4be2-9c6c-80037b595d64) and loaded by Multicomputation as a private resource; the WFR page redirects to a login and ResourceObject lookup fails; the DefinitionData cloud object imports but the function did not load in the kernel | multiway systems, Wolfram models, hypergraphs | unconfirmed |
| TokenEventGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph/ | Generate a token-event graph for multicomputational evolution according to particular rules | multiway systems, Wolfram models, hypergraphs | seen |
| TraceCausalGraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TraceCausalGraph/ | Build a causal graph from an expression evaluation trace | multiway systems, Wolfram models, hypergraphs | seen |
| RandomWolframModel | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RandomWolframModel/ | Generate a random canonical Wolfram model rule with a particular signature | multiway systems, Wolfram models, hypergraphs | seen |
| FindCanonicalHypergraphIsomorphism | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/FindCanonicalHypergraphIsomorphism/ | Find a canonical isomorphism between hypergraphs | multiway systems, Wolfram models, hypergraphs | seen |
| ConnectedWolframModelQ | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/ConnectedWolframModelQ/ | Determine whether a Wolfram model rule is left-connected | multiway systems, Wolfram models, hypergraphs | seen |
| TupleFromIndex | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/TupleFromIndex/ | Return the tuple corresponding to a given index | multiway systems, Wolfram models, hypergraphs | seen |
| SpliceAt | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SpliceAt/ | Splice expressions at certain positions | multiway systems, Wolfram models, hypergraphs | seen |
| SelectSubsets | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/SelectSubsets/ | Generate subsets that satisfy a certain criterion | multiway systems, Wolfram models, hypergraphs | seen |
| EdgeMultiplicity | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/EdgeMultiplicity/ | Count the multiplicity of edges in a graph | multiway systems, Wolfram models, hypergraphs | seen |
| RandomHypergraph | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/RandomHypergraph/ | Generate a random hypergraph | multiway systems, Wolfram models, hypergraphs | seen |
| MetricTensor | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MetricTensor/ | Represent a metric tensor (field) for a Riemannian or pseudo-Riemannian manifold | multiway systems, Wolfram models, hypergraphs | seen |
| DiscreteHypersurfaceDecomposition | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/DiscreteHypersurfaceDecomposition/ | Decompose a Riemannian or pseudo-Riemannian manifold into a union of discrete hypersurfaces | multiway systems, Wolfram models, hypergraphs | seen |
| MultiwayTuringMachine | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/ | Simulate a nondeterministic Turing machine evolution as a multiway system | multiway systems, Wolfram models, hypergraphs | seen |
| MultiwayCombinator | WFR | https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayCombinator/ | Simulate the evaluation of a combinator expression as a multiway system | multiway systems, Wolfram models, hypergraphs | seen |

### C. Causal structure, causal sets and relativity

#### WolframInstitute/InfraCausality

Paclet WolframInstitute/InfraCausality 1.2.0, Causal structure and special relativity on finite directed graphs, creator Pavel Hajek, context `` WolframInstitute`InfraCausality` ``. Exports read from InfraCausality/Kernel/InfraCausality.wl; the Bondi files carry usage messages, the other files carry comments, which the descriptions paraphrase. The table groups symbols by kernel file; the list below gives every symbol.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Colors.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/Colors.wl | causal palette and graph styles: `$CausalColors` CausalGraphStyle | causal graphs, special relativity, light cones | seen |
| `Tools.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/Tools.wl | generic graph utilities: source and sink extraction, random causal graphs, chain finding: GetSources GetSinks RandomCausalGraph FindChain | causal graphs, special relativity, light cones | seen |
| `InfraObjects.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl | multi-realisation wrappers for branchable causal-graph objects and their predicates: InfraChain InfraLightRay InfraLightCone InfraCausalInterval InfraEvent InfraChainQ InfraLightRayQ InfraLightConeQ InfraCausalIntervalQ InfraEventQ | causal graphs, special relativity, light cones | seen |
| `RelativisticMechanics.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl | light cones, causal intervals, universal time and light rays on a finite causal graph: ForwardLightCone BackwardLightCone CausalInterval ChainCausalInterval UniversalFoliation UniversalTime MaximalAbsorber MaximalEmitter OutgoingLightRays IncomingLightRays | causal graphs, special relativity, light cones | seen |
| `RelativisticDynamics.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticDynamics.wl | combinatorial relativistic dynamics on chains of a causal graph (Knuth energy, momentum, mass, interval, velocity): ChainProjection ChainLightReach InfraEnergy InfraMomentum InfraMass InfraInterval InfraVelocity InfraKinematics | causal graphs, special relativity, light cones | seen |
| `EPSAxiomatics.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/EPSAxiomatics.wl | Ehlers-Pirani-Schild axiomatics on a finite directed graph: message and echo functions: MultiMessageFunction FindMessageFunction MultiEchoFunction FindEchoFunction EchoGraph MonotoneQ | causal graphs, special relativity, light cones | seen |
| `Visualization.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/Visualization.wl | interactive and static visualisations for causal-graph constructions: VisualizeLightRays VisualizeFoliatedCausalGraph VisualizeMessageFunction VisualizeEchoFunction | causal graphs, special relativity, light cones | seen |
| `BondiKCalculus.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/BondiKCalculus.wl | Bondi k-calculus: k-factor, rapidity, Lorentz gamma, worldlines, light zigzags, radar coordinates: KFactor VelocityFromK WorldlineAngle Rapidity RapidityFromK LorentzGamma OutgoingRatio IncomingRatio WorldlineDirection WorldlinePoint WorldlineNormal ProperTimeScale WorldlinePointAtProperTime LightDirection LightZigzag RadarCoordinatesFromAlice SimultaneityLine | causal graphs, special relativity, light cones | seen |
| `BondiVisualization.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/BondiVisualization.wl | Bondi constructions: clock, Doppler, time dilation, simultaneity, length contraction, velocity addition, light clock: BondiClock DopplerConstruction TimeDilationConstruction SimultaneityConstruction LengthContractionConstruction VelocityAdditionConstruction LightClockConstruction | causal graphs, special relativity, light cones | seen |
| `BondiExplorer.wl symbols` | WolframInstitute/InfraCausality | https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/BondiExplorer.wl | interactive Manipulate over the seven Bondi constructions: BondiExplorer | causal graphs, special relativity, light cones | seen |

Every symbol with its usage line or source description:

- `$CausalColors`: association of the causal palette colors (Causal, Vertex, Edge, ...) used by the paclet
- CausalGraphStyle: CausalGraphStyle[tier] Graph style options for causal graphs: Default, Opaque, Faint, Gray
- GetSources: sources of a DAG: vertices with in-degree zero
- GetSinks: sinks of a DAG: vertices with out-degree zero
- RandomCausalGraph: RandomCausalGraph[{n, m}] a random connected DAG styled with the causal palette
- FindChain: FindChain[g, ...] find one or several directed chains in the DAG g (Method Longest, TargetSeparation)
- InfraChain: multi-realisation wrapper for branchable chains of a causal graph (Realisations, Length, Expand, First properties)
- InfraLightRay: multi-realisation wrapper for branchable light rays
- InfraLightCone: multi-realisation wrapper for branchable light cones
- InfraCausalInterval: multi-realisation wrapper for branchable causal intervals
- InfraEvent: multi-realisation wrapper for branchable events
- InfraChainQ: tests for an InfraChain wrapper
- InfraLightRayQ: tests for an InfraLightRay wrapper
- InfraLightConeQ: tests for an InfraLightCone wrapper
- InfraCausalIntervalQ: tests for an InfraCausalInterval wrapper
- InfraEventQ: tests for an InfraEvent wrapper
- ForwardLightCone: ForwardLightCone[g, v, len] subgraph induced by all events reachable from v along directed paths
- BackwardLightCone: BackwardLightCone[g, v, len] subgraph induced by events from which v is reachable
- CausalInterval: CausalInterval[g, v1, v2, len] causal interval J+(v1) intersect J-(v2): subgraph of events between v1 and v2
- ChainCausalInterval: ChainCausalInterval[g, c] causal closure of a chain c: events both reachable from c and able to reach c
- UniversalFoliation: UniversalFoliation[g] partition of vertices by maximum directed distance from the sources
- UniversalTime: UniversalTime[g] assigns to every vertex its slice index in the universal foliation
- MaximalAbsorber: MaximalAbsorber[g] per universal-time slice, the events whose backward light cone is maximal
- MaximalEmitter: MaximalEmitter[g] per universal-time slice, the events whose forward light cone is maximal
- OutgoingLightRays: OutgoingLightRays[g, v] vertex set of events on outgoing null geodesics from v
- IncomingLightRays: IncomingLightRays[g, v] vertex set of events on incoming null geodesics to v
- ChainProjection: ChainProjection[g, source, target] fraction of source events whose forward cone reaches the target chain
- ChainLightReach: ChainLightReach[g, c] union of outgoing light rays from every event in chain c
- InfraEnergy: InfraEnergy[p, q] Knuth energy E(p, q) = (p + q)/2
- InfraMomentum: InfraMomentum[p, q] Knuth momentum P(p, q) = (p - q)/2
- InfraMass: InfraMass[p, q] Knuth mass m(p, q) = Sqrt[ or p q or ]
- InfraInterval: InfraInterval[p, q] Knuth squared interval I(p, q) = p q = E^2 - P^2
- InfraVelocity: InfraVelocity[p, q] Knuth velocity beta(p, q) = (p - q)/(p + q)
- InfraKinematics: InfraKinematics[g, ref, targets] projects the reference chain onto each target chain and computes the Knuth kinematic quantities
- MultiMessageFunction: MultiMessageFunction[g, p1, p2] for each event v on path1, the set of events on path2 first reached by light from v (EPS axiomatics)
- FindMessageFunction: FindMessageFunction[g, p1, p2] enumerate every monotone single-valued message function between two paths
- MultiEchoFunction: MultiEchoFunction[g, p1, p2] round-trip of light from path1 to path2 and back
- FindEchoFunction: FindEchoFunction[g, p1, p2] enumerate all monotone single-valued echo maps
- EchoGraph: EchoGraph[echoFn] turn an Association of echo maps into a directed graph
- MonotoneQ: MonotoneQ[p1, p2, f] tests EPS axiom D1: f is monotone
- VisualizeLightRays: VisualizeLightRays[g] click any vertex to highlight its outgoing and incoming light rays
- VisualizeFoliatedCausalGraph: VisualizeFoliatedCausalGraph[g, foliation, chains] render a foliation as coloured slices and chains
- VisualizeMessageFunction: VisualizeMessageFunction[g, path1, path2] click a vertex on path1 to see its message images on path2
- VisualizeEchoFunction: VisualizeEchoFunction[g, path1, path2] static overlay of the echo function on path1 via path2
- KFactor: KFactor[v] returns the Bondi k-factor Sqrt[(1+v)/(1-v)]. KFactor[v, phi] returns the angular form Sqrt[Sin[phi+alpha]/Sin[phi-alpha]] with alpha = ArcTan[v Tan[phi]],
- VelocityFromK: VelocityFromK[k] returns (k^2 - 1)/(k^2 + 1).
- WorldlineAngle: WorldlineAngle[v, phi] returns the Euclidean angle ArcTan[v Tan[phi]] that Bob's worldline makes with Alice's.
- Rapidity: Rapidity[v] returns ArcTanh[v].
- RapidityFromK: RapidityFromK[k] returns Log[k].
- LorentzGamma: LorentzGamma[v] returns (k + 1/k)/2 with k = KFactor[v].
- OutgoingRatio: OutgoingRatio[v, phi] returns Sin[phi]/Sin[phi - alpha], the arc-length ratio from Alice's emission to Bob's reception.
- IncomingRatio: IncomingRatio[v, phi] returns Sin[phi + alpha]/Sin[phi], the arc-length ratio from Bob's emission to Alice's reception.
- WorldlineDirection: WorldlineDirection[v, phi] returns {Sin[alpha], Cos[alpha]}.
- WorldlinePoint: WorldlinePoint[v, s, phi] returns the point on Bob's worldline at Euclidean arc-length s from the origin.
- WorldlineNormal: WorldlineNormal[v, phi] returns the in-plane normal {Cos[alpha], -Sin[alpha]} to Bob's worldline.
- ProperTimeScale: ProperTimeScale[v, phi] returns k/kOut, the ratio of proper time to Euclidean arc-length on Bob's worldline.
- WorldlinePointAtProperTime: WorldlinePointAtProperTime[v, tau, phi] returns the point on Bob's worldline at proper time tau.
- LightDirection: LightDirection[phi, rightgoing] returns the unit vector of a light ray at angle phi to the vertical; rightgoing True points into the +x half-plane.
- LightZigzag: LightZigzag[v, s0, n, phi] returns a list of n+1 reflection events of a light signal bouncing between Alice (at rest) and Bob (velocity v), starting from Alice at arc
- RadarCoordinatesFromAlice: RadarCoordinatesFromAlice[event, phi] returns Alice's radar coordinates for a point event = {x, y}: an Association with keys "RadarTime", "RadarDistance", "EmitArcLen
- SimultaneityLine: SimultaneityLine[v, s, phi, extent] returns three points describing the simultaneity line of Bob's worldline at arc-length s: {leftLightEnd, basePoint, rightLightEnd}.
- BondiClock: BondiClock[v, n] renders Alice's and Bob's worldlines with a light signal bouncing n times between them; tick marks show proper time.
- DopplerConstruction: DopplerConstruction[v, n] shows n evenly spaced light pulses from Alice to Bob, displaying the Bondi k-factor as a pulse-spacing ratio.
- TimeDilationConstruction: TimeDilationConstruction[v] displays the radar construction for a single event on Bob's worldline, with Alice's emission, Bob's event, and Alice's return light ray, i
- SimultaneityConstruction: SimultaneityConstruction[v] overlays Alice's and Bob's simultaneity lines at a common arc-length, showing the relativity of simultaneity.
- LengthContractionConstruction: LengthContractionConstruction[v] shows Alice measuring the length of Bob's rod via radar, yielding L/gamma.
- VelocityAdditionConstruction: VelocityAdditionConstruction[v1, v2] shows three worldlines (Alice, Bob, Carol) with k-factors k1, k2, k1 k2, illustrating that velocity addition is multiplication of
- LightClockConstruction: LightClockConstruction[v, n] draws Bob's transverse light clock with n bounces between observer and mirror.
- BondiExplorer: BondiExplorer[] returns an interactive Manipulate with sliders for velocity, light angle, and bounces, selecting among seven Bondi constructions (Clock, Doppler, Time

#### WolframInstitute/PersistenceRewriting

Paclet WolframInstitute/PersistenceRewriting 0.1.0: Track elementary multiway entities (EMEs) through rewriting system evolutions, computing lifetimes and decay statistics. Depends on WolframInstitute/Hypergraph, WolframInstitute/InfraCausality and Wolfram/Multicomputation. Usage messages from Kernel/Usage.wl.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Lifetime tracking symbols` | WolframInstitute/PersistenceRewriting | https://github.com/WolframInstitute/PersistenceRewriting/blob/main/Kernel/Usage.wl | EME lifetimes, decay rates, forward and backward chains, evolution paths, string substitution token tracking: EmeLifetimes EmeLifeDurations EmeDecayRate LifeDurations DecayRate FollowVertexEmes BacktrackVertexEmes FindStateEvolutionPath RestrictEvolutionCausalGraph AllStateEvolutionPaths SubstitutionSystemTokenTracking SubstitutionSystemCausalGraph EventInteractionDiagram | multiway systems, causal graphs, persistence | seen |
| `Visualization symbols` | WolframInstitute/PersistenceRewriting | https://github.com/WolframInstitute/PersistenceRewriting/blob/main/Kernel/Usage.wl | lifetime histograms, persistence barcodes, event interaction diagrams: LifeDurationsHistogram LifetimesBarcode EventInteractionDiagramPlot | multiway systems, causal graphs, persistence | seen |

Every symbol with its usage line or source description:

- EmeLifetimes: EmeLifetimes[ecg] returns {eme, birth, death} triples from an EvolutionCausalGraph. EmeLifetimes[wmeo] extracts lifetimes from a WolframModelEvolutionObject.
- EmeLifeDurations: EmeLifeDurations[ecg] returns the lifetime durations of emes tracked through an EvolutionCausalGraph or WolframModelEvolutionObject.
- EmeDecayRate: EmeDecayRate[ecg] fits an exponential distribution to eme lifetime durations and returns the decay rate Lambda.
- LifeDurations: LifeDurations[lifetimes] returns the durations (death - birth) for a list of {eme, birth, death} triples.
- DecayRate: DecayRate[durations] fits an exponential distribution and returns the decay rate Lambda.
- FollowVertexEmes: FollowVertexEmes[ecg, emes] returns the forward chain of states through which the given vertex emes persist.
- BacktrackVertexEmes: BacktrackVertexEmes[ecg, emes] returns the backward chain of states from which the given vertex emes descend.
- FindStateEvolutionPath: FindStateEvolutionPath[ecg] returns a random source-to-sink chain of states (a single-way branch) through the state subgraph of an EvolutionCausalGraph.
- RestrictEvolutionCausalGraph: RestrictEvolutionCausalGraph[ecg, states] returns the subgraph of ecg restricted to a given list of states and the events connecting them.
- AllStateEvolutionPaths: AllStateEvolutionPaths[ecg] enumerates every source-to-sink state path through an EvolutionCausalGraph. AllStateEvolutionPaths[ecg, maxPaths] caps the number of paths per
- SubstitutionSystemTokenTracking: SubstitutionSystemTokenTracking[rule, init, steps] tracks character tokens through sequential string rewriting.
- SubstitutionSystemCausalGraph: SubstitutionSystemCausalGraph[rule, init, steps] returns the causal graph from string substitution token tracking.
- LifeDurationsHistogram: LifeDurationsHistogram[durations] plots a histogram of EME lifetimes with optional exponential fit overlay.
- LifetimesBarcode: LifetimesBarcode[lifetimes] creates a persistence barcode visualization of {eme, birth, death} triples.
- EventInteractionDiagram: EventInteractionDiagram[system, event] traces backward/forward EME chains through a specific event.
- EventInteractionDiagramPlot: EventInteractionDiagramPlot[system, event] visualizes the event interaction diagram as a layered graph.

#### WolframInstitute/PureMath: causal sets, graph curvature and path reconvergence

Same paclet as above. Usage messages read from Foundations/CausalSets.wl, MathematicalPhysics/CausalSetFieldTheory.wl, DiscreteMathematics/GraphCurvature.wl and DiscreteMathematics/PathReconvergence.wl (the last one measures how many independent ways two histories can meet again, the multiway states graph case). The table groups symbols by kernel file; the list below gives every usage line.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Foundations/CausalSets.wl symbols` | WolframInstitute/PureMath | https://github.com/WolframInstitute/PureMath/blob/main/PureMath/Kernel/Foundations/CausalSets.wl | finite causal sets: invariants, Myrheim-Meyer dimension, Benincasa-Dowker-Glaser d'Alembertian and action, stems, Kleitman-Rothschild, interval abundance, sequential growth, transitive percolation: CausalSetInvariants MyrheimMeyerOrderingFraction MyrheimMeyerDimension CausalSetLayerCoefficients CausalSetDAlembertian CausalSetAction CausalSetStemQ KleitmanRothschildQ CausalSetIntervalAbundance SprinklingIntervalAbundance LinearExtensionCount CausalSetBirthProbability CausalSetGrowthProbability CausalSetGrowthWeight TransitivePercolationCausalSet | causal sets, dimension estimation, curvature, multiway systems | seen |
| `MathematicalPhysics/CausalSetFieldTheory.wl symbols` | WolframInstitute/PureMath | https://github.com/WolframInstitute/PureMath/blob/main/PureMath/Kernel/MathematicalPhysics/CausalSetFieldTheory.wl | scalar field theory on causal sets: retarded Green function, Pauli-Jordan operator, Sorkin-Johnston state, thickened antichains and spatial homology: CausalSetRetardedGreenFunction CausalSetPauliJordanOperator SorkinJohnstonState CausalSetThickenedAntichain CausalSetSpatialCover CausalSetSpatialHomology CausalSetSpatialHomologyStability | causal sets, dimension estimation, curvature, multiway systems | seen |
| `DiscreteMathematics/GraphCurvature.wl symbols` | WolframInstitute/PureMath | https://github.com/WolframInstitute/PureMath/blob/main/PureMath/Kernel/DiscreteMathematics/GraphCurvature.wl | Ollivier-Ricci and Forman-Ricci curvature, vertex curvature, Wasserstein distance, lazy random walk measure: OllivierRicciCurvature FormanRicciCurvature VertexRicciCurvature GraphWassersteinDistance GraphLazyRandomWalkMeasure | causal sets, dimension estimation, curvature, multiway systems | seen |
| `DiscreteMathematics/PathReconvergence.wl symbols` | WolframInstitute/PureMath | https://github.com/WolframInstitute/PureMath/blob/main/PureMath/Kernel/DiscreteMathematics/PathReconvergence.wl | reconvergence ranks, arc-level first Betti number, rootedness of digraphs (multiway states graphs): PathReconvergenceRank GradedPathReconvergenceRank ArcFirstBettiNumber SimpleGraphFirstBettiNumber RootedDigraphQ DigraphRootList | causal sets, dimension estimation, curvature, multiway systems | seen |

Every symbol with its usage line or source description:

- CausalSetInvariants: CausalSetInvariants[poset] gives the exact integer invariants of a finite causal set as an association: "ElementCount" the number of elements n, "RelationCount" the numbe
- MyrheimMeyerOrderingFraction: MyrheimMeyerOrderingFraction[d] gives the expected ordering fraction Gamma[d+1]Gamma[d/2]/(2 Gamma[3d/2]) of a Poisson sprinkling into an interval of d-dimensional Minkow
- MyrheimMeyerDimension: MyrheimMeyerDimension[poset] gives the Myrheim-Meyer dimension estimate of a finite poset, by inverting MyrheimMeyerOrderingFraction on the poset's own ordering fraction.
- CausalSetLayerCoefficients: CausalSetLayerCoefficients[d] gives the layer coefficients {C[1], C[2], ...} of the Benincasa-Dowker-Glaser discrete d'Alembertian in d dimensions, for a positive integer
- CausalSetDAlembertian: CausalSetDAlembertian[poset, values, d] gives the Benincasa-Dowker-Glaser discrete d'Alembertian of a scalar field on a finite causal set, as an association element -> va
- CausalSetAction: CausalSetAction[poset, d] gives the Benincasa-Dowker-Glaser action of a finite causal set in d dimensions, in discreteness units: minus the total of CausalSetDAlembertian
- CausalSetStemQ: CausalSetStemQ[causet, stem] gives True if the finite poset causet contains a past-closed subposet (an order ideal) order-isomorphic to the finite poset stem, and False i
- KleitmanRothschildQ: KleitmanRothschildQ[poset] gives True if a finite poset is a Kleitman-Rothschild order, the three-layer pancake that almost every finite poset is: height exactly 3, with
- CausalSetIntervalAbundance: CausalSetIntervalAbundance[causet] gives the order-interval abundance histogram of a finite causal set as the list {n[0], n[1], ...}, where n[k] is the number of related
- SprinklingIntervalAbundance: SprinklingIntervalAbundance[n, d] gives the exact expected order-interval abundance {n[0], n[1], ...} of n points sprinkled independently and uniformly into an Alexandrov
- LinearExtensionCount: LinearExtensionCount[poset] gives the number e(P) of linear extensions of a finite poset: the number of ways of listing its elements consistently with the order, equivale
- CausalSetBirthProbability: CausalSetBirthProbability[causet, precursor, couplings] gives the Rideout-Sorkin classical-sequential-growth probability of the birth that adds one element to a finite ca
- CausalSetGrowthProbability: CausalSetGrowthProbability[causet, couplings] gives the net Rideout-Sorkin probability of growing a naturally labeled copy of a finite causal set, as an exact rational fu
- CausalSetGrowthWeight: CausalSetGrowthWeight[causet] gives the number of distinct naturally labeled causal sets order-isomorphic to a finite causal set: e(P)/ or Aut(P) or , the linear extension coun
- TransitivePercolationCausalSet: TransitivePercolationCausalSet[n, p] gives a random n-element causal set grown by transitive percolation: elements are born in order, each new element is linked to each e
- CausalSetRetardedGreenFunction: CausalSetRetardedGreenFunction[poset, 2] gives the massless retarded Green function of a finite causal set in d = 2 dimensions: an exact matrix over the rationals whose r
- CausalSetPauliJordanOperator: CausalSetPauliJordanOperator[poset, 2] gives the Pauli-Jordan operator Delta = K - Transpose[K] of a finite causal set in d = 2 dimensions, with K the retarded Green func
- SorkinJohnstonState: SorkinJohnstonState[poset, 2] gives the Sorkin-Johnston vacuum two-point function W of a massless scalar field on a finite causal set in d = 2 dimensions, as a matrix who
- CausalSetThickenedAntichain: CausalSetThickenedAntichain[poset, antichain, v] gives the v-thickened antichain of a finite causal set: those elements of the inclusive causal future of antichain having
- CausalSetSpatialCover: CausalSetSpatialCover[poset, antichain, v] gives the cover of the v-thickened antichain induced by the antichain's own elements: one set per element a of antichain, holdi
- CausalSetSpatialHomology: CausalSetSpatialHomology[poset, antichain, v] gives the integer homology of the nerve of CausalSetSpatialCover[poset, antichain, v], as an association degree -> {free ran
- CausalSetSpatialHomologyStability: CausalSetSpatialHomologyStability[poset, antichain, {vmin, vmax}] scans the thickening v from vmin to vmax and reports how stable the spatial homology of a discrete Cauch
- OllivierRicciCurvature: OllivierRicciCurvature[g, u, v] gives Ollivier's coarse Ricci curvature 1 - W/d of the vertices u and v of the finite undirected simple graph g, with d the graph distance
- FormanRicciCurvature: FormanRicciCurvature[g, u, v] gives Forman's Ricci curvature of the edge joining the vertices u and v of the finite undirected simple graph g, an exact INTEGER in closed
- VertexRicciCurvature: VertexRicciCurvature[g, v] gives the aggregate of the discrete Ricci curvatures of the edges at the vertex v of the finite undirected simple graph g: by default the Total
- GraphWassersteinDistance: GraphWassersteinDistance[g, mu, nu] gives the exact 1-Wasserstein distance, in the graph metric of the finite undirected graph g, between the probability measures mu and
- GraphLazyRandomWalkMeasure: GraphLazyRandomWalkMeasure[g, v] gives the one-step measure of the simple random walk from the vertex v of the finite undirected simple graph g, as an Association from th
- PathReconvergenceRank: PathReconvergenceRank[g] gives the ungraded reconvergence rank of the directed graph g: the dimension of the span of the arc-indicator differences of pairs of directed pa
- GradedPathReconvergenceRank: GradedPathReconvergenceRank[g] gives the graded reconvergence rank of the directed graph g: the dimension of the span of the arc-indicator differences of pairs of EQUAL-L
- ArcFirstBettiNumber: ArcFirstBettiNumber[g] gives the first Betti number of the directed graph g computed with one 1-cell per ARC: the number of arcs minus the number of vertices plus the num
- SimpleGraphFirstBettiNumber: SimpleGraphFirstBettiNumber[g] gives the first Betti number of the simple undirected graph underlying the directed graph g, obtained by forgetting arc directions and then
- RootedDigraphQ: RootedDigraphQ[g] gives True if the directed graph g is rooted - some vertex reaches every vertex of g - and False otherwise. A multiway states graph evolved from a singl
- DigraphRootList: DigraphRootList[g] gives the roots of the directed graph g, the vertices from which every vertex of g is reachable, in VertexList order. It is {} exactly when g is not ro

#### JonathanGorard/Gravitas (mirror WolframInstitute/Gravitas)

Gravitas: Analytical and numerical general relativity in discrete and continuous spacetimes; the mirror's PacletInfo says General Relativity in the Wolfram Physics Project, creator Jonathan Gorard, context `` WolframInstitute`Gravitas` ``. Function names are the kernel file names (one function per file, no usage messages). Several also exist as resource functions (MetricTensor, DiscreteHypersurfaceDecomposition confirmed in the kernel).

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Discrete spacetime symbols` | GitHub (JonathanGorard/Gravitas) | https://github.com/JonathanGorard/Gravitas | discrete hypersurface decomposition and geodesics on graph discretizations of spacetimes: DiscreteHypersurfaceDecomposition DiscreteHypersurfaceGeodesic | general relativity, discrete spacetime | seen |
| `Continuum tensor and solver symbols` | GitHub (JonathanGorard/Gravitas) | https://github.com/JonathanGorard/Gravitas | one .wl file per symbol: MetricTensor ChristoffelSymbols RiemannTensor RicciTensor EinsteinTensor WeylTensor BachTensor SchoutenTensor ElectromagneticTensor ElectrograviticTensor StressEnergyTensor AngularMomentumTensor AngularMomentumDensityTensor ExtrinsicCurvatureTensor ADMDecomposition ADMStressEnergyDecomposition SolveEinsteinEquations SolveVacuumEinsteinEquations SolveElectrovacuumEinsteinEquations SolveADMEquations SolveVacuumADMEquations | general relativity, discrete spacetime | seen |

#### JonathanGorard/Categorica

Categorica: a pure and applied category theory framework for the Wolfram Language. One .wl file per symbol, no README readable through the API (404).

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Categorica symbols` | GitHub (JonathanGorard/Categorica) | https://github.com/JonathanGorard/Categorica | one .wl file per symbol: AbstractCategory AbstractFunctor AbstractNaturalTransformation AbstractProduct AbstractCoproduct AbstractLimit AbstractPullback AbstractPushout AbstractStrictMonoidalCategory | category theory | seen |

### D. Discrete geometry of graphs and hypergraphs (Infrageometry family)

#### WolframInstitute/Infrageometry

Paclet WolframInstitute/Infrageometry 1.0.59, Discrete geometry of combinatorial objects, creator Nikolay Murzin, context `` WolframInstitute`Infrageometry` ``. README: complexes, hypergraphs, Hodge/Dirac calculus, Forman-Ricci curvature, simplicial maps, and differential forms on graphs. All 266 usage messages read from Infrageometry/Kernel/Usage.wl; the table groups symbols by kernel file and the list below the table gives every usage line.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Infrageometry.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl | simplicial complexes: closure, dimensions, facets, stars, links, spheres, Euler and Fermi characteristics, Lefschetz numbers, curvature, Hodge, Dirac and connection matrices, Betti vectors: ComplexClosure IndexComplex SimplexDimension ComplexDimension ComplexDimensions ComplexInductiveDimension SimplexList ComplexBones ComplexWalls ComplexFacets ComplexFrames ComplexHypergraph ComplexVertexList SimplexCardinality SimplexCardinalities SimplexStar SimplexStarSphere SimplexCore SimplexCoreSphere SimplexUnitSphere SimplexMirror SimplexBoundary ComplexDual SimplexIndex SimplexSign SimplexWeight ContractibleQ ComplexSphereQ ComplexManifoldQ SimplicialMap ComplexJoin ComplexEulerCharacteristic ComplexFermiCharacteristic LefschetzNumber LefschetzCurvature ComplexPolynomial PoincarePolynomial ComplexCurvature ComplexCurvatures DehnSommervilleQ GraphComplex SkeletonComplex ComplexGraph FaceGraph BarycentricRefinement GraphTopology AlexandrovTopology IndexMatrix SignMatrix FaceMatrix ComplexIncidenceMatrix ConnectionMatrix GreenFunctionMatrix GreenOperatorMatrix HodgePropagatorMatrix DiracHodgeMatrix DiracConnectionMatrix DiracBlockMatrix DiracDualBlockMatrix DiracColumns DiracDualColumns HodgeBlock HodgeMatrix HodgeLaplacianMatrix BettiVector MatrixBlocks MatrixNullity MatrixColumns SuperTrace PseudoDeterminant SuperDeterminant ComplexGeodesicFlow SimplexOrbit ComplexGeodesics | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Graph.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Graph.wl | graph utilities: suspension, weights, sectional curvatures, spacetime graphs, edge rotation and kicks, Dirac walks, vertex amplitudes: GraphSuspension RandomGraphAutomorphism GraphEdgeWeights GraphVertexWeights SectionalCurvatures SpacetimeGraph SpacetimeTorusGraph RotateEdge KickEdge PersistEdge RightMatrix ToroidalRightMatrix ToroidalLeftMatrix DiracWalk VertexAmplitudes SymmetricRelationGraph | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Boundary.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl | inner vertex boundary, interior, exterior boundary, eccentricities and center: GraphBoundary GraphInterior GraphExteriorBoundary BoundarylessGraph GraphEccentricities CenterGraph RelativeEccentricity | discrete geometry, curvature, dimension, hypergraphs | seen |
| `VolumeGrowth.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/VolumeGrowth.wl | ball hull, ball, shell, cylinder, tube and interval volumes, geodesic occupation, volume growth observables and dimension-curvature fits: BallHull BallVolumes ShellAreas CylinderVolumes TubeVolumes IntervalVolumes GeodesicIntervalGraph GeodesicOccupation GeodesicEdgeOccupation LogDifferenceQuotients VolumeGrowthObservables DimensionCurvatureFit | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Curvature.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Curvature.wl | Forman-Ricci and Ollivier-Ricci curvature, effective resistance: FormanRicciCurvature OllivierRicciCurvature EffectiveResistance ResistanceQ | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Topology.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl | specialization preorder topology: closure, interior, boundary, neighborhoods, continuous maps: BallTopology TopologicalClosure TopologicalInterior TopologicalBoundary TopologicalNeighborhood ContinuousMapQ TopologyGraph | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Mesh.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Mesh.wl | complex and mesh embeddings, mesh complexes, cell orientation, Moebius and path meshes: ComplexEmbedding ComplexMesh HighlightComplex GraphMesh MeshComplex MeshIncidenceMatrix CellOrientation FlipCellOrientation HighlightCellOrientations OrientMeshRegion TriangulateArrayMesh OrientableMeshRegionQ MoebiusMesh PathMesh | discrete geometry, curvature, dimension, hypergraphs | seen |
| `UniformLengthDiscretization.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/UniformLengthDiscretization.wl | unit-length discretization and embedding: UniformLengthGraph UniformLengthEmbedding | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Chains.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Chains.wl | causal graph chains: spatial reconstruction and coordinatization of causal graphs: SpatialReconstruction CausalGraphSimpleChains CoordinatizeCausalGraph CoordinatizedCausalGraph | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Experimental.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Experimental.wl | experimental / provisional API: f, h and g vectors, link complexes, subcomplexes, random complexes, Betti consistency, Dirichlet energy, geodesic flow: FaceVector HVector GVector LinkComplex InducedSubcomplex VertexDeletion ComplexUnion ComplexIntersection ComplexDifference PureComplexQ RandomSimplicialComplex RandomFlagComplex FacetGraph BettiAssociation EulerBettiConsistencyQ EnumerateComplexes DiscreteDirichletEnergy | discrete geometry, curvature, dimension, hypergraphs | seen |
| `SimplicialSet.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/SimplicialSet.wl | simplicial sets and predicates for delta and simplicial complexes: SimplicialData SimplicialSet SimplicialSetQ DeltaComplexQ SimplicialComplexQ | discrete geometry, curvature, dimension, hypergraphs | seen |
| `TDA.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl | topological data analysis: Betti tables and curves, Vietoris-Rips filtrations, persistent homology, persistence diagrams, popular networks: BettiTable BettiCurves VietorisRipsFiltration VietorisRipsComplex VietorisRipsThresholdGraph PersistentHomology PersistenceIntervals PersistenceDiagram PopularNetwork PopularNetworkNames | discrete geometry, curvature, dimension, hypergraphs | seen |
| `BallIntersectionComplex.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl | order-k ball-intersection complexes (Vietoris-Rips to Cech), miniball radius, filtrations and bifiltrations: MiniballRadius BallIntersectionComplex CechComplex BallIntersectionFiltrationValue BallIntersectionFiltration CechFiltration BallIntersectionBifiltration | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Hypergraph.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl | hypergraph dataset utilities: popular hypergraphs, vertex and edge counts, degrees, maximal edges, complexes, line graphs, 2-sections, summaries: PopularHypergraph PopularHypergraphNames HypergraphVertexSet HypergraphVertexCount HyperedgeCount HyperedgeSizes HyperedgeSizeDistribution HypergraphDegree HypergraphMaximalEdges HypergraphComplex HypergraphLineGraph Hypergraph2Section Weighted2SectionGraph HypergraphSummary | discrete geometry, curvature, dimension, hypergraphs | seen |
| `QuantumCalculus.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl | Quantum Calculus after Oliver Knill: wave equation, Dirac mass, Connes distance, zeta functions, analytic torsion, index expectation curvature: WaveEquationSolution DiscreteWaveStep WavePropagator WuCharacteristic IsospectralDeformation DiracMass ConnesDistance DiracZetaFunction ConnectionZetaFunction LefschetzZetaFunction AnalyticTorsion IndexExpectationCurvature | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Coordinatization.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl | metric coordinatization: radar coordinates, resolving sets, metric dimension, resistance coordinates, ball covers, domination number: RadarCoordinates ResolvingSetQ FindResolvingSet MetricDimension ResistanceCoordinates FindBallCover BallCoverQ DominationNumber | discrete geometry, curvature, dimension, hypergraphs | seen |
| `ExampleGraphs.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/ExampleGraphs.wl | example graphs: Sierpinski, Bethe, branching sequence trees, inflated graphs: SierpinskiGraph BetheGraph BranchingSequenceTree InflateGraph InflatedVertex | discrete geometry, curvature, dimension, hypergraphs | seen |
| `InfraSubstrate.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/InfraSubstrate.wl | InfraSubstrate objects, styles and codes: InfraSubstrateStyle InfraSubstrate InfraSubstrateCode | discrete geometry, curvature, dimension, hypergraphs | seen |
| `TessellationGraphs.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TessellationGraphs.wl | regular and uniform tessellation graphs of surfaces: torus tessellations, curvature, Euler characteristic, genus, coset enumeration, rotation maps: TorusTessellation TessellationGraph TessellationCurvature TessellationEulerCharacteristic TessellationGenus TessellationNeighborhoodGraph CosetEnumeration LowIndexMaps RotationMapGraph | discrete geometry, curvature, dimension, hypergraphs | seen |
| `Displacements.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl | algebra of discrete vector fields (displacements): composition, scaling, inverse, commutator, bracket, magnitude, flows: DisplacementCompose DisplacementScale DisplacementNegative DisplacementInverse DisplacementSum DisplacementCommutator DisplacementBracket DisplacementMagnitude DisplacementReduce DisplacementSingleValuedQ DisplacementBijectionQ DisplacementIsomorphismQ ContinuousDisplacementQ RandomDisplacement FindKillingDisplacement KillingDisplacementMagnitude PolarDisplacements GradientDisplacement TranslationDisplacement DisplacementPlot | discrete geometry, curvature, dimension, hypergraphs | seen |
| `DifferentialForms.wl symbols` | WolframInstitute/Infrageometry | https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl | differential forms on tangent fibers versus cochains on the clique complex: restriction and integration maps, coboundary, wedge, cup and cup-1 products: FormValue CochainValue OrderedCochainValue FormDegree CochainDegree ZeroForm RestrictionMap IntegrationMap Coboundary FormDifferential NaiveDifferential FormWedge CochainCup OrderedCochainCup CochainCupOne AntisymmetrizedCup | discrete geometry, curvature, dimension, hypergraphs | seen |

Every symbol with its usage line or source description:

- ComplexClosure: ComplexClosure[g] returns the simplicial closure of a list of simplices g.
- IndexComplex: IndexComplex[g] relabels vertices of complex g to a consecutive ordering of integers.
- SimplexDimension: SimplexDimension[s] gives the dimension (#vertices - 1) of simplex s.
- ComplexDimension: ComplexDimension[g] gives the maximal simplex dimension of complex g (or -1 for empty).
- ComplexDimensions: ComplexDimensions[g] gives inductive vertex dimensions of complex g.
- ComplexInductiveDimension: ComplexInductiveDimension[g] gives the mean of vertex dimensions (inductive dimension).
- SimplexList: SimplexList[g, k] lists all simplices of dimension <= k (or within a range {kmin,kmax}).
- ComplexBones: ComplexBones[g] returns interior (d-2)-faces ("bones") of a pure d-dimensional complex.
- ComplexWalls: ComplexWalls[g] returns codimension-1 faces ("walls") of a pure complex (potential boundary facets).
- ComplexFacets: ComplexFacets[g] returns all maximal simplices (facets) of g.
- ComplexFrames: ComplexFrames[g] returns the ordered facets (frames) of g: every permutation of each maximal simplex.
- ComplexHypergraph: ComplexHypergraph[g] returns the maximal simplices of g as a hypergraph, peeling top-down by dimension so faces already contained in a higher simplex
- ComplexVertexList: ComplexVertexList[g] returns the sorted list of vertices in g.
- SimplexCardinality: SimplexCardinality[g, k] gives the number of k-dimensional simplices in g.
- SimplexCardinalities: SimplexCardinalities[g] gives counts of simplices in each dimension (f-vector without the leading 1).
- SimplexStar: SimplexStar[g, s] gives the star: all simplices containing s.
- SimplexStarSphere: SimplexStarSphere[g, s] gives the star of s with s itself removed (the simplices strictly containing s).
- SimplexCore: SimplexCore[g, s] gives all simplices contained in s.
- SimplexCoreSphere: SimplexCoreSphere[s] gives the proper faces of s: its closure with s itself removed.
- SimplexUnitSphere: SimplexUnitSphere[g, s] gives the unit sphere (link) around simplex s (its star minus interior).
- SimplexMirror: SimplexMirror[g, s] returns the "mirror" simplex made by the first vertex absent from each coface in the star boundary (used for geodesic continuation
- SimplexBoundary: SimplexBoundary[s] lists codimension-1 faces of simplex s.
- ComplexDual: ComplexDual[g] returns a dual cell structure (barycentric dual) of g.
- SimplexIndex: SimplexIndex[s] gives signed index weight of simplex s; SimplexIndex[s,t] gives relative index if s and t coincide as sets.
- SimplexSign: SimplexSign[s] is the permutation signature of vertex ordering of s; SimplexSign[s,t] relative signature if same underlying set.
- SimplexWeight: SimplexWeight[s] is (-1)^(Length[s]).
- ContractibleQ: ContractibleQ[g] attempts a recursive star decomposition test for contractibility of g.
- ComplexSphereQ: ComplexSphereQ[g] heuristically tests if g is a combinatorial sphere (vertex links spheres + Euler).
- ComplexManifoldQ: ComplexManifoldQ[g] tests if all vertex links are spheres or balls (pseudomanifold / manifold condition).
- SimplicialMap: SimplicialMap[g, perm] builds a simplicial map induced by a vertex permutation.
- ComplexJoin: ComplexJoin[a,b] returns the join of simplicial complexes a and b.
- ComplexEulerCharacteristic: ComplexEulerCharacteristic[g] gives the alternating sum of simplex counts of g.
- ComplexFermiCharacteristic: ComplexFermiCharacteristic[g] gives the multiplicative Fermi characteristic (product of simplex weights).
- LefschetzNumber: LefschetzNumber[g] estimates average Lefschetz number of random automorphisms; LefschetzNumber[g,map] uses a given simplicial map.
- LefschetzCurvature: LefschetzCurvature[g] gives simplexwise curvature contributions via Lefschetz fixed point indices.
- ComplexPolynomial: ComplexPolynomial[g, t] gives the f-polynomial 1 + sum f_i t^i of g.
- PoincarePolynomial: PoincarePolynomial[g, t] gives the Poincaré polynomial from Betti numbers of g.
- ComplexCurvature: ComplexCurvature[g, t] integrates the f-polynomial symbolically.
- ComplexCurvatures: ComplexCurvatures[g, t] gives curvature values for each simplex using its unit sphere.
- DehnSommervilleQ: DehnSommervilleQ[g] tests the Dehn–Sommerville relations f(t)=f(-1-t).
- GraphComplex: GraphComplex[g, k] returns the clique complex of graph g up to dimension k (or range).
- SkeletonComplex: SkeletonComplex[g] returns the 2-skeleton clique complex of graph g.
- ComplexGraph: ComplexGraph[g] returns the 1-skeleton graph of simplicial complex g.
- FaceGraph: FaceGraph[g] returns incidence graph between simplices and subfaces.
- BarycentricRefinement: BarycentricRefinement[g] returns the barycentric subdivision (complex, graph, or iterated form).
- GraphTopology: GraphTopology[g] returns star neighborhoods of each simplex of the clique complex of g.
- AlexandrovTopology: AlexandrovTopology[g] returns the specialization/Alexandrov topology induced by the face poset of g.
- IndexMatrix: IndexMatrix[g,k] returns signed incidence between (k+1)- and k-simplices; IndexMatrix[g] defaults to full complex.
- SignMatrix: SignMatrix[g,k] returns orientation sign incidence matrix between (k+1)- and k-simplices.
- FaceMatrix: FaceMatrix[i][g, x, y] gives the Boolean matrix of the i-th face map between simplex lists x and y (entry 1 when deleting vertex i of a y-simplex yiel
- ComplexIncidenceMatrix: ComplexIncidenceMatrix[g,k] returns the oriented incidence matrix at dimension k.
- ConnectionMatrix: ConnectionMatrix[g] returns Euler-characteristic based connection matrix among simplices.
- GreenFunctionMatrix: GreenFunctionMatrix[g] returns the inverse of ConnectionMatrix[g] in closed form via star-intersection Euler characteristics (Knill's unimodularity th
- GreenOperatorMatrix: GreenOperatorMatrix[g] returns the Moore-Penrose pseudoinverse of the Hodge Laplacian (d + d^T)^2, block-diagonal by simplex degree. Top-left block of
- HodgePropagatorMatrix: HodgePropagatorMatrix[g, k] returns the Moore-Penrose pseudoinverse of the boundary operator d_k = ComplexIncidenceMatrix[g, k], computed as (d_k^T d_
- DiracHodgeMatrix: DiracHodgeMatrix[g] returns d + d^T for the simplicial complex g.
- DiracConnectionMatrix: DiracConnectionMatrix[g] returns L + L^T for connection matrix L.
- DiracBlockMatrix: DiracBlockMatrix[g] is block diagonal with incidence blocks.
- DiracDualBlockMatrix: DiracDualBlockMatrix[g] is dual block diagonal with transposed incidence products.
- DiracColumns: DiracColumns[g] partitions DiracHodgeMatrix columns by simplex dimensions.
- DiracDualColumns: DiracDualColumns[g] returns transposed column blocks of DiracHodgeMatrix.
- HodgeBlock: HodgeBlock[g] returns (d + d^T)^2 for complex g (global, not partitioned).
- HodgeMatrix: HodgeMatrix[g] returns block-diagonal Hodge Laplacian matrices by dimension.
- HodgeLaplacianMatrix: HodgeLaplacianMatrix[g] returns the block form (d^T d + d d^T) aggregated as DiracBlockMatrix^2.
- BettiVector: BettiVector[g] returns Betti numbers (nullities) for each dimension of g.
- MatrixBlocks: MatrixBlocks[m, blocks] splits square matrix m into block submatrices according to cardinalities blocks.
- MatrixNullity: MatrixNullity[m] gives the dimension of the null space of square matrix m.
- MatrixColumns: MatrixColumns[m, blocks] extracts grouped column blocks from square matrix m.
- SuperTrace: SuperTrace[mat] returns graded trace (alternating signs) or from vector of traces.
- PseudoDeterminant: PseudoDeterminant[m] gives product of nonzero eigenvalues of m.
- SuperDeterminant: SuperDeterminant[m] gives graded determinant from pseudo-determinants of blocks.
- GraphSuspension: GraphSuspension[g] adds two new universal vertices and returns a 3D graph embedding.
- RandomGraphAutomorphism: RandomGraphAutomorphism[g, n] samples n automorphisms (All for all, Automatic for one).
- GraphEdgeWeights: GraphEdgeWeights[g] gives edge weights (default 1) for graph g.
- GraphVertexWeights: GraphVertexWeights[g] gives vertex weights (default 1) for graph g.
- GraphBoundary: GraphBoundary[g, S] gives the inner vertex boundary of S in g (vertices where a g-edge escapes S). If S is a vertex list it is treated as the induced
- GraphInterior: GraphInterior[g, S] gives the interior of S in g (= S minus GraphBoundary[g, S]): the vertices all of whose g-edges stay inside the object. S may be a
- GraphExteriorBoundary: GraphExteriorBoundary[g] gives the exterior-boundary (rim) vertices of the whole graph, detected from vertex degrees; GraphExteriorBoundary[mr] gives
- BoundarylessGraph: BoundarylessGraph[g] deletes every edge joining two exterior-boundary vertices (GraphExteriorBoundary[g]) and then the vertices this isolates, preserv
- GraphEccentricities: GraphEccentricities[g] gives the eccentricity max_w d(v, w) of every vertex, in VertexList order , the list form of VertexEccentricity. Also takes a
- CenterGraph: CenterGraph[g, q] gives the induced subgraph on { v : d(v, GraphCenter[g]) <= Floor[q GraphRadius[g]] }, the substrate cut to a fraction q of the way
- RelativeEccentricity: RelativeEccentricity[g] gives (e(v) - radius)/(diameter - radius) for each vertex in VertexList order , 0 on GraphCenter, 1 on GraphPeriphery. Also t
- BallHull: BallHull[g, S] gives the ball hull of vertex subset S in g: the intersection of all closed metric balls containing S, equivalently { v : d(c, v) <= ma
- BallVolumes: BallVolumes[g, v] gives the ball volume profile {V(0), ..., V(ecc(v))}, V(r) = or B_r(v) or ; slot 2 a vertex, a list or All, slot 3 a radius, a window {rm
- ShellAreas: ShellAreas[g, v] gives the shell profile {A(0), ..., A(ecc(v))}, A(r) = V(r) - V(r-1) with V(-1) = 0, the radial derivative of BallVolumes under the s
- CylinderVolumes: CylinderVolumes[g, sources, targets, s] gives the matrix of cylinder volumes between every source-target pair; the cylinder from p to q is the metric
- TubeVolumes: TubeVolumes[g, core] gives the tube profile {T(0), ..., T(sMax)} of a vertex list, T(s) = or {w : d(w, core) <= s} or ; TubeVolumes[g, p, q] takes the metr
- IntervalVolumes: IntervalVolumes[g, p, q] gives the profile {I(0), ..., I(rMax)} of the interval at slack r, I(r) = or {x : d(p, x) + d(x, q) <= d(p, q) + r} or ; IntervalV
- GeodesicIntervalGraph: GeodesicIntervalGraph[g, u, v] gives the metric interval I(u, v) = { w : d(u, w) + d(w, v) == d(u, v) } (all u-v geodesics) as a directed acyclic grap
- GeodesicOccupation: GeodesicOccupation[dag] gives the association w -> c(w) of per-vertex geodesic occupation over a geodesic DAG, c(w) = (number of source -> w paths) *
- GeodesicEdgeOccupation: GeodesicEdgeOccupation[dag] gives the association DirectedEdge[u, v] -> c(u -> v) of per-edge geodesic occupation over a geodesic DAG, c(u -> v) = (nu
- FormanRicciCurvature: FormanRicciCurvature[g] returns Association[edge -> kappa] with Forman's combinatorial Ricci curvature on the clique complex of g. Options: "OnCells"
- OllivierRicciCurvature: OllivierRicciCurvature[g] returns Association[edge -> kappa] with the Ollivier-Ricci curvature kappa(u, v) = 1 - W_1(mu_u, mu_v) / d(u, v), where mu_x
- LogDifferenceQuotients: LogDifferenceQuotients[w] gives the log-difference quotients q(r) = (Log w(r) - Log w(r-1)) / (Log(r+1) - Log r) of a sequence w = {w(0), w(1), ...},
- VolumeGrowthObservables: VolumeGrowthObservables[g, v, window] fits dimension and scalar curvature to the ball and sphere growth at v by DimensionCurvatureFit and returns prof
- DimensionCurvatureFit: DimensionCurvatureFit[{{r, q(r)}, ...}] fits < or "Dimension", "ScalarCurvature" or > to log-difference quotients by Bishop-Gromov regression on r (r + 1);
- SectionalCurvatures: SectionalCurvatures[g] estimates discrete sectional curvatures for edge neighborhoods (if implemented).
- EffectiveResistance: EffectiveResistance[g, u, v] returns the Klein-Randic resistance distance R(u, v) = (e_u - e_v)^T L^+ (e_u - e_v) for the graph Laplacian pseudoinvers
- ResistanceQ: ResistanceQ[r] tests whether a real symmetric n x n matrix r with zero diagonal is realisable as a resistance distance matrix (Klein-Randic / Schoenbe
- SpacetimeGraph: SpacetimeGraph[{m,n}] builds a 2D causal diamond style spacetime graph grid.
- SpacetimeTorusGraph: SpacetimeTorusGraph[{m,n}] builds a periodic (toroidal) spacetime graph.
- RotateEdge: RotateEdge[e,{m,n}] rotates a directed edge in toroidal coordinates.
- KickEdge: KickEdge[e] applies one 'kick' transition edge transformation.
- PersistEdge: PersistEdge[e] returns edge advanced forward without lateral change.
- RightMatrix: RightMatrix[g,{m,n}] returns sparse right-step transition matrix for a graph walk.
- ToroidalRightMatrix: ToroidalRightMatrix[g] returns right-walk transition matrix with wrap-around edges.
- ToroidalLeftMatrix: ToroidalLeftMatrix[g] returns left-walk transition matrix with wrap-around edges.
- DiracWalk: DiracWalk[g,p] returns coined quantum walk transition matrix (mix of kick/persist).
- VertexAmplitudes: VertexAmplitudes[g, edgeWeights,{m,n}] returns complex amplitude per vertex from adjacent weighted edges.
- BallTopology: BallTopology[g, r] returns the Hasse diagram of the r-ball specialization preorder on V(g): directed edge q -> p iff the closed r-ball at p is contain
- TopologicalClosure: TopologicalClosure[topo, verts] gives the closure of vertex list verts in the specialization-preorder digraph topo: the union of the in-components (do
- TopologicalInterior: TopologicalInterior[topo, verts] gives the interior int(S) = V cl(V\S) of vertex list verts in the digraph topo, with carrier V = VertexList[topo]
- TopologicalBoundary: TopologicalBoundary[topo, verts] gives the (two-sided) boundary cl(S) int(S) of vertex list verts in the digraph topo.
- TopologicalNeighborhood: TopologicalNeighborhood[topo, verts] gives the unique minimal open neighborhood of vertex list verts in the digraph topo: the union of the out-compone
- ContinuousMapQ: ContinuousMapQ[f, topo1, topo2] tests whether the vertex map f is continuous from preorder digraph topo1 to topo2, i.e. every Hasse edge q -> p of top
- TopologyGraph: TopologyGraph[g, topo] draws the graph g overlaid with the Hasse arrows of the specialization-preorder digraph topo.
- ComplexEmbedding: ComplexEmbedding[g,d] numerically embeds complex g in R^d via energy minimization (d=2 or 3).
- ComplexMesh: ComplexMesh[g,d] builds a MeshRegion from complex g (with optional explicit coordinates).
- HighlightComplex: HighlightComplex[g, h] renders the mesh of complex g with the simplices in h highlighted (each h entry a vertex list, optionally wrapped in Style).
- GraphMesh: GraphMesh[g] builds a MeshRegion from graph g using its embedding + cliques up to size 4.
- MeshComplex: MeshComplex[mr] returns the simplicial complex induced by MeshRegion mr.
- MeshIncidenceMatrix: MeshIncidenceMatrix[mr,k] gives oriented incidence matrix between (k-1)- and k-cells.
- CellOrientation: CellOrientation[cell] gives orientation sign (+/-1) of a mesh cell.
- FlipCellOrientation: FlipCellOrientation[cell] reverses or rotates orientation of a cell consistently.
- HighlightCellOrientations: HighlightCellOrientations[mr] colors top-dimensional cells by orientation sign.
- OrientMeshRegion: OrientMeshRegion[mr] attempts to orient all top-dimensional cells consistently.
- TriangulateArrayMesh: TriangulateArrayMesh[mr] refines a mesh to bounded cell measure.
- OrientableMeshRegionQ: OrientableMeshRegionQ[mr] heuristically tests orientability via connectivity of oriented adjacency.
- MoebiusMesh: MoebiusMesh[nu,nv] constructs a triangulated Möbius band strip.
- PathMesh: PathMesh[list] returns a simple path mesh through given vertices.
- UniformLengthGraph: UniformLengthGraph[region, n] returns the contact graph of an n-sphere hard-sphere packing relaxed in region (filling a solid, meshing a surface); eve
- UniformLengthEmbedding: UniformLengthEmbedding[graph] embeds graph in R^d (option "Dimension") so every edge is a unit segment, returning coordinates in VertexList order (cf.
- SymmetricRelationGraph: SymmetricRelationGraph[f, assoc] builds an undirected graph joining keys whose values satisfy relation f.
- SpatialReconstruction: SpatialReconstruction[g, slice, n] returns spatial relation graph from causal graph slice after n steps.
- CausalGraphSimpleChains: CausalGraphSimpleChains[g] finds simple source-sink path families in causal graph g.
- CoordinatizeCausalGraph: CoordinatizeCausalGraph[g,{obs1,obs2}] assigns 2D coordinates from pairs of observer chains.
- CoordinatizedCausalGraph: CoordinatizedCausalGraph[g,{obs1,obs2}] builds a reduced causal graph with observer highlighting.
- FaceVector: FaceVector[g] gives the f-vector (excluding empty face) of complex g.
- HVector: HVector[g] gives the h-vector derived from the f-vector of g.
- GVector: GVector[g] gives the g-vector (first differences of h).
- LinkComplex: LinkComplex[g,s] returns the link of simplex s in g.
- InducedSubcomplex: InducedSubcomplex[g,verts] returns the induced subcomplex on a vertex subset.
- VertexDeletion: VertexDeletion[g,v] removes vertex v (and incident simplices) returning the induced subcomplex.
- ComplexUnion: ComplexUnion[a,b] returns closure of union of complexes a and b.
- ComplexIntersection: ComplexIntersection[a,b] returns simplices common to a and b (no closure).
- ComplexDifference: ComplexDifference[a,b] returns closure of simplices in a not in b.
- PureComplexQ: PureComplexQ[g] tests whether all facets have identical dimension.
- RandomSimplicialComplex: RandomSimplicialComplex[n,p,max] generates Linial–Meshulam random complex up to max dimension.
- RandomFlagComplex: RandomFlagComplex[n,p,k] generates an Erdős–Rényi G(n,p) then clique complex up to dimension k.
- FacetGraph: FacetGraph[g] returns the dual adjacency graph of facets sharing a ridge.
- BettiAssociation: BettiAssociation[g] gives an association from dimension to Betti number.
- EulerBettiConsistencyQ: EulerBettiConsistencyQ[g] checks Euler characteristic equals alternating Betti sum.
- EnumerateComplexes: EnumerateComplexes[verts,d] generates all simplicial complexes on given vertex set with maximal dimension d (default Infinity). Use option "MaxCount"-
- DiscreteDirichletEnergy: DiscreteDirichletEnergy[g,f] gives 1/2 Sum_{(u,v)} (f[u]-f[v])^2 over edges of the 1-skeleton of complex or graph g; f may be an Association or list a
- ComplexGeodesicFlow: ComplexGeodesicFlow[g, path] performs one geodesic extension step of a simplex path within complex g via mirror continuation.
- SimplexOrbit: SimplexOrbit[g, path, n] iteratively applies ComplexGeodesicFlow up to n steps (default Infinity) or until the path self-intersects.
- ComplexGeodesics: ComplexGeodesics[g] returns a list of unique geodesics starting from all the facets.
- SimplicialData: SimplicialData[faceBlocks, degeneracyBlocks] is a container for face- and degeneracy-blocks of correct dimensions representing a simplicial set struct
- SimplicialSet: SimplicialSet[simplices] constructs the minimal simplicial set that contains the given set of simplices. Options: "IncludeDegeneracies"->True (default
- SimplicialSetQ: SimplicialSetQ[sd] checks if the given simplicial data form a valid simplicial set (face and degeneracy maps satisfy simplicial identities).
- DeltaComplexQ: DeltaComplexQ[sd] checks if the given simplicial data form a Delta-complex (face maps satisfy simplicial identities, all degeneracy maps are zero).
- SimplicialComplexQ: SimplicialComplexQ[sd] checks if the given simplicial data form a simplicial complex (each simplex has a unique combination of boundary elements).
- BettiTable: BettiTable[data, radii, opts] returns < or 'Radii'->rlist, 'Betti'->matrix, 'Dimensions'->{d0,...} or > constructed from BettiCurves. Options: passes thro
- BettiCurves: BettiCurves[data, radii, opts] returns an association r -> {b0,b1,...}. Option MaxDimension->k truncates vectors (Automatic = all).
- VietorisRipsFiltration: VietorisRipsFiltration[data, radii, opts] returns association r -> Vietoris–Rips complex at scale r. Options: 'MaxDimension'->k (default Infinity), 'S
- VietorisRipsComplex: VietorisRipsComplex[data, r, k] returns the Vietoris–Rips simplicial complex (clique complex of threshold graph) truncated to dimension k (Infinity fo
- VietorisRipsThresholdGraph: VietorisRipsThresholdGraph[data, r, opts] returns the threshold graph joining points with distance <= r. Options: 'Metric'->f (default EuclideanDistan
- MiniballRadius: MiniballRadius[pts] returns the radius of the smallest enclosing ball of the points (BoundingRegion[pts, 'MinBall']).
- BallIntersectionComplex: BallIntersectionComplex[data, r, k] returns the order-k ball-intersection complex of closed radius-r balls: a simplex is admitted iff every k-subset o
- CechComplex: CechComplex[data, r] returns the Cech complex (nerve) of closed radius-r balls = BallIntersectionComplex[data, r, Infinity].
- BallIntersectionFiltrationValue: BallIntersectionFiltrationValue[data, sigma, k] returns f_k(sigma), the birth radius of sigma in the order-k complex: the max miniball radius over its
- BallIntersectionFiltration: BallIntersectionFiltration[data, radii, k] returns association r -> BallIntersectionComplex[data, r, k] over the sorted radii, ready for PersistenceIn
- CechFiltration: CechFiltration[data, radii] = BallIntersectionFiltration[data, radii, Infinity].
- BallIntersectionBifiltration: BallIntersectionBifiltration[data, radii, orders] returns the (r, k) object as association k -> (association r -> complex); for fixed r the nesting C^
- PersistentHomology: PersistentHomology[filtration, opts] returns association dim -> {{birth,death},...} over GF(2). PersistentHomology[data, radii] builds internal filtra
- PersistenceIntervals: PersistenceIntervals[filtration, opts] internal helper implementing Z2 reduction; same output format as PersistentHomology.
- PersistenceDiagram: PersistenceDiagram[filtration, opts] returns list {dim,birth,death}. Also PersistenceDiagram[data, radii] builds filtration. Option MaxDimension->k.
- PopularNetwork: PopularNetwork[name, what] returns a requested artifact: 'Graph' (default), 'Description', 'Source', or 'All' (association with all fields).
- PopularNetworkNames: PopularNetworkNames[] lists available names for PopularNetwork.
- PopularHypergraph: PopularHypergraph[name, what] returns a hypergraph dataset as list-of-hyperedges ('Hypergraph', default) or derived views: 'IncidenceGraph', '2Section
- PopularHypergraphNames: PopularHypergraphNames[] lists available hypergraph dataset names (FIM transaction itemsets etc.).
- HypergraphVertexSet: HypergraphVertexSet[edges] returns the set of distinct vertices in a list-of-hyperedges representation.
- HypergraphVertexCount: HypergraphVertexCount[edges] gives the number of distinct vertices.
- HyperedgeCount: HyperedgeCount[edges] gives the number of hyperedges.
- HyperedgeSizes: HyperedgeSizes[edges] returns a list of the sizes of each hyperedge.
- HyperedgeSizeDistribution: HyperedgeSizeDistribution[edges] tallies hyperedge sizes as {size,count}.
- HypergraphDegree: HypergraphDegree[edges] returns an association vertex -> number of incident hyperedges (treating duplicates within a hyperedge once).
- HypergraphMaximalEdges: HypergraphMaximalEdges[edges] filters to inclusion-maximal hyperedges (removing those strictly contained in another).
- HypergraphComplex: HypergraphComplex[edges] returns the downward-closed simplicial complex generated by the hyperedges.
- HypergraphLineGraph: HypergraphLineGraph[edges] returns the intersection graph of hyperedges (one vertex per hyperedge).
- Hypergraph2Section: Hypergraph2Section[edges] returns the 2-section (primal) graph connecting vertices co-occurring in a hyperedge of size >= 2.
- Weighted2SectionGraph: Weighted2SectionGraph[edges, min] returns a weighted 2-section graph with edge weights = co-occurrence counts (filtering weights < min).
- HypergraphSummary: HypergraphSummary[edges] returns an association summarizing counts, size stats, average degree, and degree distribution.
- WaveEquationSolution: WaveEquationSolution[g, u0, v0, t] gives the d'Alembert wave equation solution cos(D t) u0 + t sinc(D t) v0 on a simplicial complex g.
- DiscreteWaveStep: DiscreteWaveStep[g, u, uPrev] returns {uNext, u} for one discrete-time leapfrog wave step on complex g.
- WavePropagator: WavePropagator[g, t] returns the unitary wave propagator matrix exp(i D t) for complex g.
- WuCharacteristic: WuCharacteristic[g, m] gives the m-th Wu characteristic (generalized Euler characteristic from m-tuple interactions). Default m=2.
- IsospectralDeformation: IsospectralDeformation[g, t, n] returns the Dirac matrix after Lax-pair isospectral deformation D'=[d-d*,D] for time t in n steps.
- DiracMass: DiracMass[g, t] extracts the diagonal mass term from the isospectrally deformed Dirac operator at time t.
- ConnesDistance: ConnesDistance[g] returns the Connes spectral distance matrix between vertices of complex g.
- DiracZetaFunction: DiracZetaFunction[g, s] gives the super-spectral zeta function str( or D or ^{-s}) of the Dirac operator.
- ConnectionZetaFunction: ConnectionZetaFunction[g, s] gives the spectral zeta function of the connection matrix L.
- LefschetzZetaFunction: LefschetzZetaFunction[g, perm, z] gives the Lefschetz zeta function exp(sum L(T^n)/n z^n) for automorphism perm.
- AnalyticTorsion: AnalyticTorsion[g] gives the analytic torsion exp(1/2 sum (-1)^{k+1} k log det'(H_k)) of complex g.
- IndexExpectationCurvature: IndexExpectationCurvature[g] gives the index-expectation curvature K(x)=E[1-chi(S(x) cap {f<f(x)})], satisfying Gauss-Bonnet: sum K = chi.
- RadarCoordinates: RadarCoordinates[g, basis, v] gives the distance vector (d(v, b))_{b in basis} of vertex v; RadarCoordinates[g, basis] gives the association of all ve
- ResolvingSetQ: ResolvingSetQ[g, basis] tests whether basis is a resolving set: the radar map v or -> (d(v, b))_{b in basis} is injective over the vertices.
- FindResolvingSet: FindResolvingSet[g, n, m] returns up to n resolving sets (metric bases) of g by ascending size; m restricts the sizes (All, an integer max, {min, max}
- MetricDimension: MetricDimension[g] gives the metric dimension of g: the size of a smallest resolving set.
- ResistanceCoordinates: ResistanceCoordinates[g] gives the association vertex -> spectral embedding Phi with or or Phi(u)-Phi(v) or or ^2 == EffectiveResistance[g,u,v]; options "Resca
- FindBallCover: FindBallCover[g, r] returns a minimum r-ball cover of g: a smallest set of centres whose radius-r balls cover every vertex (a minimum r-dominating set
- BallCoverQ: BallCoverQ[g, r, S] tests whether the radius-r balls around the centres S cover every vertex of g. BallCoverQ[g, r, S, targets] tests coverage of the
- DominationNumber: DominationNumber[g, r] gives the r-domination number of g: the size of a minimum r-ball cover. DominationNumber[g, r, targets] gives the size of a min
- SierpinskiGraph: SierpinskiGraph[n] is the trivalent Sierpinski graph: the 3-simplex K_4 with corner-cutting (truncation) iterated n-1 times. 3-regular at every genera
- BetheGraph: BetheGraph[n, z] is the finite Bethe lattice / Cayley tree of n shells and coordination number z (argument order matching CompleteKaryTree[n, k]): the
- BranchingSequenceTree: BranchingSequenceTree[b] is the spherically symmetric rooted tree whose offspring count depends only on depth: a vertex at depth l has b[[l+1]] childr
- InfraSubstrateStyle: InfraSubstrateStyle[size] is the Graph option list a substrate backdrop is drawn with at size "Small" or "Medium" or "Large" , StandardGray edges on an
- InfraSubstrate: InfraSubstrate[name, size] is the named example substrate at size "Small", "Medium" or "Large", or at a raw spec (a cell measure, a radius, grid dimen
- InfraSubstrateCode: InfraSubstrateCode[name, size] is the code behind InfraSubstrate[name, size]: the held construction, without the backdrop style, wrapped in a Graph ca
- TorusTessellation: TorusTessellation[{m, n}, shape] is the vertex-transitive flat-torus graph carrying the regular tessellation indicated by shape, one of "Square" ({4,4
- InflateGraph: InflateGraph[g] grows a fiber of extra vertices over every vertex of g, joins each to its base vertex, and adds random edges between fibers whose base
- InflatedVertex: InflatedVertex[v, i] is the i-th fiber vertex over base vertex v in a graph produced by InflateGraph.
- TessellationGraph: TessellationGraph[{p, q}] is the smallest regular map of type {p, q} as a graph , the Platonic solid when (p-2)(q-2) < 4, the smallest hyperbolic quo
- TessellationCurvature: TessellationCurvature[{p, q}] (or TessellationCurvature[config]) is the combinatorial Gaussian curvature Sum 1/f_i - (k-2)/2 at a vertex of the {p, q}
- TessellationEulerCharacteristic: TessellationEulerCharacteristic[graph, spec] is the Euler characteristic V - E + F of the realised tessellation graph, where spec is its {p, q} symbol
- TessellationGenus: TessellationGenus[graph, spec] is the orientable genus (2 - chi)/2 of the realised tessellation graph, where spec is its {p, q} symbol or vertex confi
- TessellationNeighborhoodGraph: TessellationNeighborhoodGraph[{p, q}, r] is the radius-r graph-distance ball cut from the infinite regular {p, q} tessellation of its covering surface
- CosetEnumeration: CosetEnumeration[p, q, subwords, maxc] is the Todd-Coxeter index [D(p,q,2) : H] of the subgroup H generated by subwords (lists over 1 = x, 2 = x^-1, 3
- LowIndexMaps: LowIndexMaps[p, q, maxIndex] enumerates every genuine {p, q} map of index <= maxIndex up to isomorphism, by low-index subgroup enumeration of the von
- RotationMapGraph: RotationMapGraph[{x, y}] is the 1-skeleton of the orientable map of the rotation pair {x, y}: vertices are the cycles of y, edges the 2-cycles of x y
- DisplacementCompose: DisplacementCompose[d1, d2, ...] composes displacements as flows, the leftmost acting first; targets are collected over every intermediate point.
- DisplacementScale: DisplacementScale[g, d, t] scales displacement d by t: endpoints of the geodesics v -> d(v) rescaled to t times their length (t < 0 reflects through t
- DisplacementNegative: DisplacementNegative[g, d] is the metric negative of d: each step is reflected through its base point, the scale -1 case of DisplacementScale.
- DisplacementInverse: DisplacementInverse[d] reverses the relation d: its value at v is the set of vertices whose d-value contains v. It is the ordinary inverse when d is b
- DisplacementSum: DisplacementSum[g, d1, d2] is the bisector of the two composition orders of d1 and d2 , by Baker-Campbell-Hausdorff the sum of the generators, with t
- DisplacementCommutator: DisplacementCommutator[g, d1, d2] applies the commutator loop selected by Method. Method -> "Inverse" (default) is the exact group commutator of bijec
- DisplacementBracket: DisplacementBracket[g, d1, d2] is DisplacementCommutator[g, d1, d2, Method -> "Negative"], the scale-dependent metric bracket candidate. DisplacementB
- DisplacementMagnitude: DisplacementMagnitude[g, d] is the maximal step length of displacement d , its scale.
- DisplacementReduce: DisplacementReduce[g, d] contracts each value set of d to its metric centre (minimal eccentricity within the set), iterated to a fixed point; genuine
- DisplacementSingleValuedQ: DisplacementSingleValuedQ[d] tests whether every value of displacement d is a single vertex.
- DisplacementBijectionQ: DisplacementBijectionQ[d] tests whether displacement d is a single-valued permutation of the vertex set.
- DisplacementIsomorphismQ: DisplacementIsomorphismQ[g, d] tests whether displacement d is a graph automorphism of g , a discrete Killing displacement.
- ContinuousDisplacementQ: ContinuousDisplacementQ[g, d, k] tests k-continuity of displacement d (default k = 1). Method -> "Weak" requires one close target pair across each edg
- RandomDisplacement: RandomDisplacement[g, r] generates a random continuous displacement of magnitude at most r (default 1): a random continuous section of the scale-r tan
- FindKillingDisplacement: FindKillingDisplacement[g] finds the nontrivial graph automorphism of least displacement magnitude, as a displacement. FindKillingDisplacement[g, All]
- KillingDisplacementMagnitude: KillingDisplacementMagnitude[g] is the least magnitude of a nonidentity graph automorphism, or Infinity when g is asymmetric.
- PolarDisplacements: PolarDisplacements[g, c] gives the polar pair {radial, angular} at centre c: radial steps along geodesics from c (outward, or inward with "Direction"
- GradientDisplacement: GradientDisplacement[g, f] is the steepest-ascent displacement of the vertex function f (an association): each vertex moves to the neighbours maximisi
- TranslationDisplacement: TranslationDisplacement[g, v] translates along the graph embedding: each vertex moves to the vertices whose coordinates are nearest to its own positio
- DisplacementPlot: DisplacementPlot[g, d] draws displacement d as bent arcs over the graph's own embedding. DisplacementPlot[g, {d1, d2, ...}] draws a sequence, the k-th
- FormValue: FormValue[w, v, tuple] gives the value of the germ of form w at vertex v on a tuple of neighbours of v, alternating in the tuple.
- CochainValue: CochainValue[a, tuple] gives the value of the ALTERNATING cochain a on an arbitrary vertex tuple, by the sign of the permutation taking it to increasi
- OrderedCochainValue: OrderedCochainValue[a, tuple] gives the value of the ORDERED cochain a on an increasing vertex tuple, 0 off the complex, and Missing["NonIncreasingTup
- FormDegree: FormDegree[w] gives the degree of form w, read off a stored germ.
- CochainDegree: CochainDegree[a] gives the degree of cochain a: one less than the number of vertices of a stored cell.
- ZeroForm: ZeroForm[g, f] is the vertex function f (an association or a function) as a 0-form on g.
- RestrictionMap: RestrictionMap[g, a] is the form R a obtained from the alternating cochain a by reading it with the base vertex prepended; it vanishes off cliques.
- IntegrationMap: IntegrationMap[g, w] is the alternating cochain I w obtained by averaging the germs of w over the vertices of each clique with the orientation sign. I
- Coboundary: Coboundary[g, a] is the coboundary of cochain a: the alternating sum over the faces of every clique one dimension up. It agrees on the alternating and
- FormDifferential: FormDifferential[g, w] is the differential of form w: the graph gradient on 0-forms, and on 1-forms the difference of germ values corrected by the tra
- NaiveDifferential: NaiveDifferential[g, w] is the differential of the 1-form w with the transport term dropped; integrating it loses the factor (k+1)/(k+2).
- FormWedge: FormWedge[w, e] is the wedge product of forms, the exterior product on each tangent fiber. It is strictly associative and graded-commutative, but its
- CochainCup: CochainCup[g, a, b] is the cup product of ALTERNATING cochains: the full antisymmetrisation of the Alexander-Whitney formula over the (p+q+1)! orderin
- OrderedCochainCup: OrderedCochainCup[g, a, b] is the bare Alexander-Whitney cup product of ORDERED cochains, a(v0..vp) b(vp..v_{p+q}) on each increasing clique. Associat
- CochainCupOne: CochainCupOne[g, a, b] is the Steenrod cup-1 product of ORDERED cochains. For closed a and b it is a primitive for the graded commutator: Coboundary[g
- AntisymmetrizedCup: AntisymmetrizedCup[g, a, b] is an alias of CochainCup, the name the antisymmetrised product carried before it became the cup product.

#### WolframInstitute/InfraAnalysis

Paclet WolframInstitute/InfraAnalysis 1.0.2, Analysis on directed graphs: integration, derivative, coordinatization, and renormalization, creator Pavel Hajek. Usage messages from InfraAnalysis/Kernel/Usage.wl.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Graph constructions symbols` | WolframInstitute/InfraAnalysis | https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl | sources, sinks, directed paths, cones, laminar decomposition, radial expansion, blow-up and contraction: GraphSources GraphSinks DirectedPath ConeGraph LaminarDecomposition RadialExpansion GraphBlowUp GraphContract | directed graphs, discrete calculus | seen |
| `Calculus symbols` | WolframInstitute/InfraAnalysis | https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl | integration, derivative, vector fields, finite and directional differences, weighted derivations and Leibniz rule: GraphIntegrate GraphDerivative GraphIntegral GraphVectorFieldQ GraphVectorFields GraphVectorFieldEndomorphism GraphFiniteDifference GraphDirectionalDifference GraphWeightedDerivation GraphTwistedProduct GraphWeightedLeibnizQ | directed graphs, discrete calculus | seen |

Every symbol with its usage line or source description:

- GraphSources: GraphSources[g] returns the source vertices (in-degree 0) of graph g.
- GraphSinks: GraphSinks[g] returns the sink vertices (out-degree 0) of graph g.
- DirectedPath: DirectedPath[n] returns the directed path graph on n vertices.
- ConeGraph: ConeGraph[g] adds a cone vertex connected to all vertices of g.
- LaminarDecomposition: LaminarDecomposition[g] decomposes a directed graph into laminar layers (a DAG of layers plus per-layer subgraphs).
- RadialExpansion: RadialExpansion[g, layers] grows g by appending concentric vertex rings outside the sources; layers is a list of ring sizes.
- GraphBlowUp: GraphBlowUp[g, n] replaces each vertex v with a fiber of n copies {v,1}..{v,n} and each edge u->v with the complete bipartite K_{n,n}. GraphBlowUp[g, n, f] also diffuses
- GraphContract: GraphContract[g] collapses a blown-up graph back to original vertices (using Origin annotations). GraphContract[g, f] also sums f over each fiber, returning < or "Graph" ->
- GraphIntegrate: GraphIntegrate[g, f] returns g annotated with the integral of f. Method -> "Ordered" or "Cumulative" or "Conservative" or "Laminar".
- GraphDerivative: GraphDerivative[g, f] returns g annotated with the derivative of f. Method -> "Ordered" or "Cumulative" or "Conservative" or "Laminar" or "Directional" or "Weighted".
- GraphIntegral: GraphIntegral[g, f, v] returns the total of f over all predecessors of v. GraphIntegral[g, f, sources, sinks] integrates over the subdag between sources and sinks.
- GraphVectorFieldQ: GraphVectorFieldQ[g, X] returns True if X is a vector field on g (each X[v] is a neighbor of v).
- GraphVectorFields: GraphVectorFields[g] enumerates all vector fields on g.
- GraphVectorFieldEndomorphism: GraphVectorFieldEndomorphism[g, X] returns the pullback endomorphism f or -> (v or -> f(X(v))).
- GraphFiniteDifference: GraphFiniteDifference[g, f] returns f(v) minus the sum of f over in-neighbors of v.
- GraphDirectionalDifference: GraphDirectionalDifference[g, X, f] returns f(X(v)) - f(v) along vector field X.
- GraphWeightedDerivation: GraphWeightedDerivation[g, X, f, eps] returns (f(X(v)) - f(v)) / eps; eps may be a scalar or a per-vertex association.
- GraphTwistedProduct: GraphTwistedProduct[g, X, f, h] returns the shifted product (f star h)(v) = f(X(v)) h(v).
- GraphWeightedLeibnizQ: GraphWeightedLeibnizQ[g, X, f, h, eps] returns True if the directional difference satisfies the weighted Leibniz rule with weight eps.

#### WolframInstitute/InfraGaugeTheory

Paclet WolframInstitute/InfraGaugeTheory 1.0.7, Discrete gauge theory on graphs: fiber bundles, connections, holonomy, Wilson loops, creator Pavel Hajek. README goals include obtaining fibered graphs from hypergraph rewriting and dynamics of gauge fields in the Wolfram Physics Project. Usage messages read from the Kernel/*.wl files. The table groups symbols by kernel file; the list below gives every usage line.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Connections.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Connections.wl | connections on fibered graphs: horizontal lifts, parallel transport, holonomy, flatness: ConnectionQ RandomConnection FindHorizontalLift ParallelTransport HolonomyMatrix HolonomyMatrices FlatConnectionQ FindHorizontalLeaf | gauge theory, fibered graphs, holonomy | seen |
| `Coordinatization.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Coordinatization.wl | coordinatization of directed graphs from chains: CoordinatizeGraph | gauge theory, fibered graphs, holonomy | seen |
| `CotangentBundle.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/CotangentBundle.wl | cotangent graph, germ flip, tautological section and 1-form: GraphCotangentBundle CotangentFlip CotangentFlipQ InfraTautologicalSection InfraTautologicalOneForm | gauge theory, fibered graphs, holonomy | seen |
| `FiberedGraph.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl | fibered graphs: random construction, base reconstruction, fiber bundle predicates: RandomFiberedGraph ReconstructBaseGraph IsomorphicFibersQ EdgeLiftingPropertyQ AtMostOneEdgeLiftQ LocallyTrivialQ FiberBundleQ | gauge theory, fibered graphs, holonomy | seen |
| `FiberedGraphVisualization.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraphVisualization.wl | visualization of fibered graphs: VisualizeFiberedGraph | gauge theory, fibered graphs, holonomy | seen |
| `GraphAxes.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/GraphAxes.wl | diametral paths, longest geodesics, graph axes: FindDiametralPaths FindLongestGeodesicsThrough FindGraphAxes FindGraphAxesThrough | gauge theory, fibered graphs, holonomy | seen |
| `InteractiveViewers.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/InteractiveViewers.wl | interactive viewers for fibered graphs: RandomFiberedGraphViewer FiberedGraphViewer | gauge theory, fibered graphs, holonomy | seen |
| `LeviCivita.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/LeviCivita.wl | metric Levi-Civita connection, holonomy angles, connection curvature, parallel frames, canonical 1-form: InfraParallelTransport InfraLeviCivitaDefect FindInfraLeviCivitaConnection InfraHolonomy InfraHolonomyAngle InfraConnectionCurvature FindInfraParallelFrame InfraCanonicalOneForm | gauge theory, fibered graphs, holonomy | seen |
| `NeighborhoodTiling.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/NeighborhoodTiling.wl | separating nets and neighborhood tilings: FindSeparatingNet SeparatingNetQ FindNeighborhoodTiling | gauge theory, fibered graphs, holonomy | seen |
| `Sections.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Sections.wl | sections of fibered graphs: random, smooth, zero, canonical: RandomSection SmoothSectionQ SmoothSectionExtension FindZeroSection FindCanonicalSection | gauge theory, fibered graphs, holonomy | seen |
| `TangentBundle.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/TangentBundle.wl | tangent graph as a fibered graph: GraphTangentBundle TangentFiberedGraph | gauge theory, fibered graphs, holonomy | seen |
| `Tools.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Tools.wl | Hausdorff, Frechet and separation distances, relation graphs, geodesic subgraphs: HausdorffDistance FrechetDistance MeanFrechetDistance Separation SymmetricRelationGraph GeodesicSubgraph | gauge theory, fibered graphs, holonomy | seen |
| `VectorTransport.wl symbols` | WolframInstitute/InfraGaugeTheory | https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/VectorTransport.wl | vector transport and covariant derivative along walks, with plots: InfraVectorTransport InfraCovariantDerivative InfraVectorTransportPlot InfraCovariantDerivativePlot | gauge theory, fibered graphs, holonomy | seen |

Every symbol with its usage line or source description:

- ConnectionQ: ConnectionQ[total, proj, connection] verifies that a graph forms a valid connection: unique edge lifting and completeness.
- RandomConnection: RandomConnection[total, proj] generates a random connection on a fibered graph.
- FindHorizontalLift: FindHorizontalLift[total, proj, connection, startVertex, basePath] lifts a base path horizontally starting from a fiber vertex. Returns a truncated list if a lift does no
- ParallelTransport: ParallelTransport[total, proj, connection, path] computes parallel transport along a base path. Returns an Association mapping start fiber vertices to end fiber vertices.
- HolonomyMatrix: HolonomyMatrix[total, proj, connection, loop] returns the holonomy as a permutation matrix. Rows for fiber vertices with blocked transport are zero.
- HolonomyMatrices: HolonomyMatrices[total, proj, connection, basePoint] computes holonomy matrices for all basis cycles routed through basePoint.
- FlatConnectionQ: FlatConnectionQ[total, proj, connection] tests whether a connection has trivial holonomy around all loops at all basepoints.
- FindHorizontalLeaf: FindHorizontalLeaf[connection, proj, startVertex] computes the horizontal leaf through startVertex by BFS on the connection graph. Returns an Association mapping base ver
- CoordinatizeGraph: CoordinatizeGraph[g, chains] assigns spatial coordinates to vertices of a directed graph g based on a list of chain graphs.
- GraphCotangentBundle: GraphCotangentBundle[g] is the radius-r cotangent graph of g as a fibered graph {total, projection}. A covector at p is a germ {p, v} with v in the geodesic graph at p, t
- CotangentFlip: CotangentFlip[g] is the germ flip {p, v} -> {v, p} of the radius-r cotangent graph of g, as an Association on its vertices; germs whose flip is not a vertex are omitted.
- CotangentFlipQ: CotangentFlipQ[g] is True when CotangentFlip[g] is a total involutive graph automorphism of the cotangent graph of g. Same options as GraphCotangentBundle.
- InfraTautologicalSection: InfraTautologicalSection[g] is the tautological (canonical) 1-form of g as a section of the double cotangent graph: the germ {s, t} of the cotangent graph is sent to the
- InfraTautologicalOneForm: InfraTautologicalOneForm[g] evaluates InfraCanonicalOneForm on the germs of InfraTautologicalSection[g], as an Association germ -> value. It is the pairing of a covector
- RandomFiberedGraph: RandomFiberedGraph[g, opts] creates a random fibered graph over a base graph g. Option "IsomorphicFibers" -> True generates a single fiber graph and copies it to all fibe
- ReconstructBaseGraph: ReconstructBaseGraph[total, proj, opts] reconstructs the base space of a fibered graph from total space and projection.
- IsomorphicFibersQ: IsomorphicFibersQ[total, proj, opts] tests whether all fibers are isomorphic as graphs. Option "IsomorphismFunction" -> f uses f[g1, g2] instead of IsomorphicGraphQ.
- EdgeLiftingPropertyQ: EdgeLiftingPropertyQ[total, proj] tests the edge lifting property: for every base edge and every fiber vertex over its source, there exists at least one lift.
- AtMostOneEdgeLiftQ: AtMostOneEdgeLiftQ[total, proj] tests that for every base edge and every fiber vertex, there is at most one lift.
- LocallyTrivialQ: LocallyTrivialQ[total, proj, opts] tests local triviality: trivial holonomy around all cycles in each vertex neighborhood. Option "Radius" -> 1 controls the neighborhood
- FiberBundleQ: FiberBundleQ[total, proj] tests whether a graph morphism is a fiber bundle: isomorphic fibers and local triviality.
- VisualizeFiberedGraph: VisualizeFiberedGraph[total, proj] visualizes a fibered graph. Optional positional arguments: a section (Association) and/or a connection (Graph), in any order, auto-dete
- FindDiametralPaths: FindDiametralPaths[g, n, epsilon] finds paths of length close to the graph diameter.
- FindLongestGeodesicsThrough: FindLongestGeodesicsThrough[g, v, n] finds longest geodesics passing through vertex v.
- FindGraphAxes: FindGraphAxes[g, opts] finds a set of maximally separated long geodesic paths forming axes of the graph.
- FindGraphAxesThrough: FindGraphAxesThrough[g, v, opts] finds maximally separated axes passing through vertex v.
- RandomFiberedGraphViewer: RandomFiberedGraphViewer[g, opts] interactive viewer for randomly generated fibered graphs.
- FiberedGraphViewer: FiberedGraphViewer[total, proj] interactive viewer. FiberedGraphViewer[total, proj, section] includes section. Hover vertices to highlight fibers (red) and section values
- InfraParallelTransport: InfraParallelTransport[g, p, q, r] is the metric Levi-Civita parallel transport of directions from p to q at scale r: the angle-isometry of the radius-r direction spheres
- InfraLeviCivitaDefect: InfraLeviCivitaDefect[g, p, q, r] is the angle-structure mismatch of the best transport p -> q at scale r: 0 iff an exact angle-isometry exists (vertex-transitive case),
- FindInfraLeviCivitaConnection: FindInfraLeviCivitaConnection[g, r] returns the metric Levi-Civita connection on the radius-r direction-sphere fibration as < or "TotalGraph" -> _, "Projection" -> _, "Conne
- InfraHolonomy: InfraHolonomy[g, loop, r] is the scale-r holonomy self-map of the direction sphere over the base point of a closed walk: the minimal-rotation realisation over the per-edg
- InfraHolonomyAngle: InfraHolonomyAngle[g, loop, r] is the rotation angle of InfraHolonomy: 0 iff the loop bounds a flat region, > 0 measuring the enclosed curvature (arc radians for "Angle"
- InfraConnectionCurvature: InfraConnectionCurvature[g, face, r] is the scale-r holonomy angle around the boundary cycle of a face (the discrete curvature 2-form). Options "Angle", "MaxRealizations"
- FindInfraParallelFrame: FindInfraParallelFrame[g, walk, frame0, r] parallel-transports an orthogonal frame frame0 (a list of germ vertices in the radius-r sphere of the first walk vertex) along
- InfraCanonicalOneForm: InfraCanonicalOneForm[g, {x, v}, {y, w}] is the canonical (tautological) 1-form of the double tangent bundle evaluated on the germ {x, v} -> {y, w}: the pairing <v, y>_x
- FindSeparatingNet: FindSeparatingNet[g, k] finds a maximal k-separated vertex set: centers pairwise at graph distance > k, with every vertex within distance k of some center. Method -> "Gre
- SeparatingNetQ: SeparatingNetQ[g, set] tests whether the vertices of set are pairwise at graph distance greater than the option "Distance" (default 1).
- FindNeighborhoodTiling: FindNeighborhoodTiling[g, centers] assigns every vertex of g to a nearest center and returns the tiling as an Association vertex -> center, a graph fibration projection o
- RandomSection: RandomSection[total, proj, domain] generates a random section of a fibered graph.
- SmoothSectionQ: SmoothSectionQ[total, proj, section, domain] tests whether a section respects the fibered graph structure.
- SmoothSectionExtension: SmoothSectionExtension[total, proj] finds a smooth section from scratch. SmoothSectionExtension[total, proj, section] extends a partial section by maintaining smoothness.
- GraphTangentBundle: GraphTangentBundle[g] is the radius-r tangent graph of g as a fibered graph {total, projection}: the fiber over p is the geodesic graph at p (the subgraph induced on the
- TangentFiberedGraph: TangentFiberedGraph[total, proj] is the tangent graph of the total space of a fibered graph, projected all the way down to the original base. Same options as GraphTangent
- HausdorffDistance: HausdorffDistance[d, setX, setY] computes the Hausdorff distance between two sets using a distance matrix or graph.
- FrechetDistance: FrechetDistance[d, setX, setY] computes the FrEAcutechet distance between two point sets.
- MeanFrechetDistance: MeanFrechetDistance[d, setX, setY] computes the mean of point-wise distances between two sets.
- Separation: Separation[d, setX, setY] finds the minimum distance between two sets.
- SymmetricRelationGraph: SymmetricRelationGraph[f, v, opts] creates a graph where vertices are connected if a relation f holds between their values.
- GeodesicSubgraph: GeodesicSubgraph[g, pairs, opts] extracts geodesic paths connecting pairs of vertices or a thickness neighborhood around them.
- InfraVectorTransport: InfraVectorTransport[g, v, walk] parallel-transports the tangent vector First[walk] -> v along the vertex walk: v is a point of the direction sphere at its own radius len
- InfraCovariantDerivative: InfraCovariantDerivative[g, y, walk] is the discrete covariant derivative of the vector field y along the curve walk: for each step p -> p' the value y[p'] is parallel-tr
- InfraVectorTransportPlot: InfraVectorTransportPlot[g, v, walk] draws InfraVectorTransport[g, v, walk] over a gray copy of g: the walk in blue, the start vector First[walk] -> v in red, the transpo
- InfraCovariantDerivativePlot: InfraCovariantDerivativePlot[g, y, walk] draws InfraCovariantDerivative[g, y, walk] over a gray copy of g: the walk in blue, the field y along the walk in pink, the deriv
- FindZeroSection: finds a zero section of a fibered graph (Sections.wl, no usage message)
- FindCanonicalSection: finds a canonical section of a fibered graph (Sections.wl, no usage message)

#### WolframInstitute/SyntheticInfrageometry

Paclet WolframInstitute/SyntheticInfrageometry 0.13.31, Axiomatic geometry on graphs and hypergraphs, creator Pavel Hajek: what geometric constructions an observer constrained to a discrete substrate (the infra-observer) would develop. All 186 usage messages read from SyntheticInfrageometry/Kernel/Usage.wl; the table groups symbols by name prefix and the list below gives every usage line.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `InfraPoint* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraPoint: InfraPoint FindInfraPoint FindClosestInfraPoint SelectInfraPoint `$InfraPointColor` `$InfraPointSizes` | synthetic geometry, graphs | seen |
| `Other SyntheticInfrageometry symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | remaining symbols (colors, options, small groups): FindInfraMidpoint FindInfraGoldenSection FindInfraReflection CompleteInfraEquilateralTriangle FindInfraCommonPoint InfraReachableQ FindInfraGeodesic InfraGeodesicQ WalkSingularities InfraImmersedQ InfraGenericQ ExtendInfraGeodesic FindInfraParallel FindInfraPerpendicular FindInfraCommonLine InfraParallelQ InfraPerpendicularQ PencilDirections PencilCardinality LineCount FindLineHull LineHullQ UniversalLineQ FindLineStructure ConsistentPathSystemQ FindInfraOsculatingShell FindAdvancingInfraFront SeparatesQ FindBallHull BallHullQ FindInfraCycle InfraPolygon FindInfraPolygon FindInfraRegularPolygon InfraPolygonQ InfraRegularPolygonQ InfraTriangle FindInfraTriangle InfraTriangleQ InfraEllipticShell FindInfraEllipticShell InfraEllipticShellQ FindInfraQuadric InfraEllipse FindInfraEllipse InfraEllipseQ InfraPlane FindInfraBisectingHyperplane InfraPolyline FindInfraPolylineSubdivision InfraPolylineQ InfraRevolution FindInfraRevolution FindInfraCylinder FindInfraCone InfraRevolutionQ InfraScalarProduct FindInfraLinearCombination InfraAngle TurningAngles TotalCurvature TotalAbsoluteCurvature TurningNumber ComparisonTriangle InfraComparisonTriangle CATInequalityQ InfraCurvature EmbeddingClosest FindEmbeddingClosestPath PathSubgraph InfraDeformationSize FindInfraHomotopyRepresentative FindInfraHomotopyRepresentativeHomotopy FindInfraHomotopy MetricInterval MedianVertices FindSegmentHull SegmentHullQ InfraDensity FindInfraEquidistantSet InfraBoundary InfraInterior InfraVolume FindInfraRadarBasis InfraRadarBasisQ OrthogonalCoordinates FindInfraOrthogonalFrame FindInfraSpanningAxes BetweennessQ EquidistanceQ SameDirectionQ CollinearQ ConcurrentQ UniqueCollinearQ UniqueConcurrentQ WhiteheadW1Q WhiteheadW2Q WhiteheadW3Q ProjectivePlaneGraphQ EnumerateGraphs InfraInstance InfraGeometricStep InfraIntersection InfraUnion InfraDistance InfraPlaneQ InfraIntersectQ `$InfraPlaneColor` `$InfraTopologyColor` `$InfraPalette` InfraEqualQ `$InfraAccentPointSize` | synthetic geometry, graphs | seen |
| `InfraSegment* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraSegment: InfraSegment FindInfraSegment ExtendInfraSegment InfraSegmentQ UniqueInfraSegmentQ `$InfraSegmentColor` | synthetic geometry, graphs | seen |
| `InfraWalk* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraWalk: InfraWalkQ InfraWalk FindInfraWalk InfraWalkCrossingQ ExtendInfraWalk ConcatenateInfraWalk SelectInfraWalk `$InfraWalkColor` | synthetic geometry, graphs | seen |
| `InfraLine* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraLine: InfraLine FindInfraLine InfraLineQ InfraLineStructure `$InfraLineColor` | synthetic geometry, graphs | seen |
| `InfraShell* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraShell: InfraShell FindInfraShell FindInfraShellCenter InfraShellQ `$InfraShellColor` | synthetic geometry, graphs | seen |
| `InfraBall* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraBall: InfraBall FindInfraBall InfraBallQ `$InfraBallColor` | synthetic geometry, graphs | seen |
| `InfraCircle* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraCircle: InfraCircle FindInfraCircle InfraCircleQ `$InfraCircleColor` | synthetic geometry, graphs | seen |
| `InfraRay* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraRay: InfraRay FindInfraRay InfraRayQ `$InfraRayColor` | synthetic geometry, graphs | seen |
| `Geodesic* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix Geodesic: GeodesicSprayGraph GeodesicExtensionGraph GeodesicMultiplicity GeodesicMultiplicityMatrix | synthetic geometry, graphs | seen |
| `Homotop* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix Homotop: HomotopicQ NullHomotopicQ HomotopyMoveType HomotopyMoveTypes | synthetic geometry, graphs | seen |
| `Tarski* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix Tarski: TarskiStructure TarskiBetweennessTensor TarskiEquidistanceClasses TarskiCongruenceReflexivityQ TarskiCongruenceTransitivityQ TarskiCongruenceIdentityQ TarskiSegmentConstructionQ TarskiFiveSegmentsQ TarskiBetweennessIdentityQ TarskiInnerPaschQ TarskiLowerDimensionQ TarskiUpperDimensionQ TarskiEuclidAxiomQ TarskiContinuityQ TarskiAxiomQ FindTarskiCounterexample | synthetic geometry, graphs | seen |
| `InfraScene* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix InfraScene: InfraScene FindInfraScene InfraSceneHighlight InfraSceneViewer | synthetic geometry, graphs | seen |
| `Viewer* symbols` | WolframInstitute/SyntheticInfrageometry | https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl | symbols with prefix Viewer: PointViewer SegmentViewer ShellViewer CircleViewer | synthetic geometry, graphs | seen |

Every symbol with its usage line or source description:

- InfraPoint: InfraPoint is the scene-language token for the point search , FindInfraPoint minus the graph. InfraPoint[] draws from the whole v
- FindInfraPoint: FindInfraPoint[graph] draws a vertex from the candidate pool; a trailing n or UpTo[n] or All sets the count and returns a List of ve
- FindInfraMidpoint: FindInfraMidpoint[graph, p1, p2] gives the density < or v -> m, ... or > of the middle vertices of every geodesic from p1 to p2 (one ver
- FindInfraGoldenSection: FindInfraGoldenSection[graph, p1, p2] gives the density < or v -> m, ... or > at the golden-ratio index along every geodesic from p1 to
- FindInfraReflection: FindInfraReflection[graph, x, a] gives the reflections x' of x through a: the vertices with B(x, a, x') and d(a, x) == d(a, x').
- CompleteInfraEquilateralTriangle: CompleteInfraEquilateralTriangle[graph, p1, p2] gives the apexes equidistant from p1 and p2 at distance d(p1, p2) (Euclid I.1).
- FindInfraCommonPoint: FindInfraCommonPoint[graph, lines] gives the points lying on every listed line.
- FindClosestInfraPoint: FindClosestInfraPoint[graph, line, point] gives the vertices of line at minimum graph distance from point.
- SelectInfraPoint: SelectInfraPoint[graph, vertices] draws a vertex from a supplied bundle under graph distance; a trailing n or UpTo[n] or All sets th
- InfraReachableQ: InfraReachableQ[graph, p1, p2] tests whether p1 and p2 have realisations in the same connected component.
- InfraSegment: InfraSegment[p1, p2] inside InfraScene is the geodesic-segment construction; FindInfraSegment is the search. A segment itself is a
- FindInfraSegment: FindInfraSegment[graph, p1, p2] gives one geodesic from p1 to p2 as a directed path graph; a trailing n or UpTo[n] enumerates that
- ExtendInfraSegment: ExtendInfraSegment[graph, seg, kspec] gives the geodesics containing seg extended by at most kspec edges per side, inextensible wi
- InfraWalkQ: InfraWalkQ[graph, walk] tests whether walk is a walk: consecutive vertices adjacent (revisits allowed).
- InfraSegmentQ: InfraSegmentQ[graph, walk] tests whether walk is a geodesic.
- UniqueInfraSegmentQ: UniqueInfraSegmentQ[graph, u, v] tests whether the u-v geodesic is unique; UniqueInfraSegmentQ[graph] tests the geodetic property.
- InfraWalk: InfraWalk[p1, ..., pk] inside InfraScene is the literal walk through p1, ..., pk. A walk itself is a Graph: a directed path on the
- FindInfraWalk: FindInfraWalk[graph, p1, kspec] grows the walks from p1 in the class cut by the Properties rules (default {"Simple"}) until a stop
- FindInfraGeodesic: FindInfraGeodesic[graph, p1, scale, kspec] grows the geodesics at infra-scale scale from p1 , FindInfraWalk at "InfraScale" -> sc
- InfraGeodesicQ: InfraGeodesicQ[graph, walk, scale] tests whether every window of scale consecutive vertices of walk plus the next one is a shortes
- WalkSingularities: WalkSingularities[walk] gives the singularities of a walk (a vertex list or a walk graph; a cycle graph is read on its cyclic core
- InfraImmersedQ: InfraImmersedQ[graph, walk] tests whether walk is an immersed walk: a walk with no cusp (no backtrack).
- InfraGenericQ: InfraGenericQ[graph, walk] tests whether walk is a generic immersed curve: no cusps, no self-tangencies, every self-intersection a
- InfraWalkCrossingQ: InfraWalkCrossingQ[graph, walk, v, r] tests whether the double visit of walk at v is a transverse crossing at scale r: the two pas
- ExtendInfraWalk: ExtendInfraWalk[graph, seed, kspec] continues a seed walk , a vertex list or a walk graph , in the class cut by the Properties r
- ExtendInfraGeodesic: ExtendInfraGeodesic[graph, seed, scale, kspec] continues a seed walk as a geodesic at infra-scale scale , ExtendInfraWalk at "Inf
- ConcatenateInfraWalk: ConcatenateInfraWalk[path1, path2] joins every compatible walk pair, those with Last[walk1] === First[walk2].
- InfraLine: InfraLine[p, q] inside InfraScene is the inextensible-geodesic construction through p and q, InfraLine[path] the lines containing
- FindInfraLine: FindInfraLine[graph, p1, p2] gives the lines through p1 and p2, the inextensible geodesics containing them; FindInfraLine[graph, s
- FindInfraParallel: FindInfraParallel[graph, line, p] gives one parallel to line through p: a geodesic through p inextensible within the level set { v
- FindInfraPerpendicular: FindInfraPerpendicular[graph, line, point] gives the lines through point perpendicular to line. Options Method, "Radius".
- FindInfraCommonLine: FindInfraCommonLine[graph, vertices] gives the canonical lines containing every listed vertex.
- InfraLineQ: InfraLineQ[graph, walk] tests whether walk is a line: a geodesic that no neighbour of either endpoint prolongs.
- InfraParallelQ: InfraParallelQ[graph, l1, l2] tests whether two lines stay at constant distance; a trailing threshold allows that distance to vary
- InfraPerpendicularQ: InfraPerpendicularQ[graph, l1, l2] tests whether two lines meet perpendicularly at every common vertex. Options Method, "Radius".
- PencilDirections: PencilDirections[graph, O] gives the pencil at O: every ray from O, as a list of vertex sequences.
- PencilCardinality: PencilCardinality[graph, O] gives the number of rays from O, counted on the ray pools without enumeration.
- LineCount: LineCount[graph] gives the number of distinct canonical maximal geodesics in graph.
- FindLineHull: FindLineHull[graph, S] gives, as the multiset < or v -> 1, ... or >, the smallest superset of S closed under the line operator. Option "
- LineHullQ: LineHullQ[graph, S] tests whether S is closed under the line operator.
- UniversalLineQ: UniversalLineQ[graph] tests whether some pair spans a line filling a whole connected component (Chen-Chvatal); UniversalLineQ[grap
- InfraLineStructure: InfraLineStructure[{line1, ...}] is a consistent geodesic path system, stored as its maximal lines. Accessors "Lines", "Paths", "I
- FindLineStructure: FindLineStructure[graph] gives a consistent geodesic path system: one shortest path per vertex pair, with every stretch of a chose
- ConsistentPathSystemQ: ConsistentPathSystemQ[graph, obj] tests whether a geodesic path system is subpath-closed (Cizma-Linial consistent).
- InfraShell: InfraShell[center, r] inside InfraScene is the metric shell of radius r about center , a level set of the distance from center; F
- FindInfraShell: FindInfraShell[graph, c, r] gives the metric shell { v : d(c, v) == r }; r may be a band {rmin, rmax}. Options Properties, Method.
- FindInfraOsculatingShell: FindInfraOsculatingShell[graph, path, i, k] gives the shells whose level set contains the k-vertex window of path centred at posit
- FindAdvancingInfraFront: FindAdvancingInfraFront[graph, origin, steps] gives the foliation by a bouncing wavefront as a List of multisets < or v -> 1, ... or >:
- FindInfraShellCenter: FindInfraShellCenter[graph, shell] recovers {center, radii} from a shell. Option Method.
- InfraShellQ: InfraShellQ[graph, vertexSet] tests whether vertexSet is a metric shell { v : d(c, v) == r } for some centre c and radius r.
- SeparatesQ: SeparatesQ[graph, vertexSet, u, v] tests whether deleting vertexSet disconnects u from v.
- InfraBall: InfraBall[center, r] inside InfraScene is the closed metric ball of radius r about center; FindInfraBall is the search. A ball its
- FindInfraBall: FindInfraBall[graph, c, r] gives the closed ball { v : d(c, v) <= r }.
- InfraBallQ: InfraBallQ[graph, vertexSet] tests whether vertexSet is a closed metric ball.
- FindBallHull: FindBallHull[graph, S] gives, as the multiset < or v -> 1, ... or >, the ball hull of S: the intersection of all closed balls containing
- BallHullQ: BallHullQ[graph, S] tests whether S is ball-convex, i.e. an intersection of closed balls.
- InfraCircle: InfraCircle[center, r] inside InfraScene is the metric-circle construction , a shortest cycle in the level surface separating cen
- FindInfraCircle: FindInfraCircle[graph, c, r] gives one circle around c at radius r: a shortest cycle in the level surface separating c from beyond
- FindInfraCycle: FindInfraCycle[graph, n] gives the n shortest simple cycles of graph; FindInfraCycle[graph, {kmin, kmax}, n] restricts their lengt
- InfraCircleQ: InfraCircleQ[graph, cycle] tests whether cycle is a cyclic edge chain whose vertex set is a metric shell.
- InfraPolygon: InfraPolygon[{v1, ..., vn}] inside InfraScene is the closed geodesic chain through the given corners, InfraPolygon[pool, n] the n-
- FindInfraPolygon: FindInfraPolygon[graph, {p1, ..., pn}] gives one polygon with corners p1, ..., pn: a geodesic between each pair of consecutive cor
- FindInfraRegularPolygon: FindInfraRegularPolygon[graph, As, n] gives one closed n-vertex sequence whose k-th diagonal distances all match As[[k]] (each slo
- InfraPolygonQ: InfraPolygonQ[graph, poly] tests whether poly is a closed cyclic chain of geodesic sides.
- InfraRegularPolygonQ: InfraRegularPolygonQ[graph, cycle, As] tests whether cycle is regular with respect to the diagonal-distance tuple As.
- InfraTriangle: InfraTriangle[{a, b, c}] inside InfraScene is the geodesic triangle on three corners, the n = 3 case of InfraPolygon; FindInfraTri
- FindInfraTriangle: FindInfraTriangle[graph, {a, b, c}] gives one triangle with corners a, b, c and a geodesic on each side; a trailing n or UpTo[n] or
- InfraTriangleQ: InfraTriangleQ[graph, poly] tests whether poly is a closed chain of exactly three geodesic sides.
- InfraEllipticShell: InfraEllipticShell names the elliptic-shell construction , a level set of a sum of distances to two foci , and carries no value
- FindInfraEllipticShell: FindInfraEllipticShell[graph, {p1, p2}, c] gives the elliptic shell { v : d(p1, v) + d(p2, v) == c }; c may be a band {cmin, cmax}
- InfraEllipticShellQ: InfraEllipticShellQ[graph, vertexSet] tests whether vertexSet is an elliptic shell for some pair of foci and some constant.
- FindInfraQuadric: FindInfraQuadric[graph, {p1, ..., pk}, c] gives the solid interior { v : Sum_i d(p_i, v) <= c }; a trailing weight list gives the
- InfraEllipse: InfraEllipse names the metric-ellipse construction , a cycle lying on an elliptic shell , and carries no value of its own; FindI
- FindInfraEllipse: FindInfraEllipse[graph, {p1, p2}, c] gives one shortest separating cycle in the level surface { v : d(p1, v) + d(p2, v) == c }; a
- InfraEllipseQ: InfraEllipseQ[graph, cycle] tests whether cycle is a cyclic edge chain whose vertex set is an elliptic shell.
- InfraPlane: InfraPlane[p1, p2] inside InfraScene is the bisecting hyperplane of p1 and p2; FindInfraBisectingHyperplane is the search. A plane
- FindInfraBisectingHyperplane: FindInfraBisectingHyperplane[graph, p1, p2] gives the perpendicular bisector { v : d(p1, v) == d(p2, v) }; a positional {lo, hi} w
- InfraRay: InfraRay[O, v] inside InfraScene is the ray from O through v , a geodesic that cannot be prolonged past its last vertex; FindInfr
- FindInfraRay: FindInfraRay[graph, O, v] gives the rays from O through v: the geodesics from O containing v that cannot be prolonged past their l
- InfraRayQ: InfraRayQ[graph, ray] tests whether ray is a pointed half-line: a geodesic from its own first vertex that cannot be prolonged past
- InfraPolyline: InfraPolyline[{v1, ..., vk}] inside InfraScene is the open geodesic chain through the given knots; FindInfraPolylineSubdivision ch
- FindInfraPolylineSubdivision: FindInfraPolylineSubdivision[graph, path] chunks a walk into the fewest geodesic legs whose knots are walk vertices. Option "MaxLe
- InfraPolylineQ: InfraPolylineQ[graph, poly] tests whether every leg is a geodesic and consecutive legs share an endpoint.
- InfraRevolution: InfraRevolution[axis, profile] is the InfraScene constructor for a solid of revolution.
- FindInfraRevolution: FindInfraRevolution[graph, axis, profile] gives the rotational vertex set around axis with the given radius profile, a constant, l
- FindInfraCylinder: FindInfraCylinder[graph, axis, r] gives the constant-radius solid of revolution around axis, by default the r-neighbourhood of the
- FindInfraCone: FindInfraCone[graph, axis, slope] gives the cone of the given slope with apex at one end of axis. Option "Apex".
- InfraRevolutionQ: InfraRevolutionQ[graph, vs, axis, profile] tests whether vs is the solid of revolution around axis with the given profile. Option
- InfraScalarProduct: InfraScalarProduct[graph, o, u, v] gives the base-point-relative product d(o, u) d(o, v) cos(theta), at curvature 0 the polar form
- FindInfraLinearCombination: FindInfraLinearCombination[graph, o, {{lambda1, u1}, ...}] gives the vertex realisations of Sum_i lambda_i u_i based at o. Options
- InfraAngle: InfraAngle[graph, {q1, p, q2}] gives the angle at p in radians. Option Method ("Arclength", "Alexandrov").
- TurningAngles: TurningAngles[graph, path] gives the exterior angles Pi - InfraAngle at each interior vertex of path; for an InfraPolyline, the an
- TotalCurvature: TotalCurvature[graph, path] gives Total @ TurningAngles[graph, path], the discrete total curvature of path.
- TotalAbsoluteCurvature: TotalAbsoluteCurvature[graph, path] gives Total @ Abs @ TurningAngles[graph, path], the discrete Fenchel integral of or kappa or .
- TurningNumber: TurningNumber[graph, cycle] gives TotalCurvature[graph, cycle] / (2 Pi).
- ComparisonTriangle: ComparisonTriangle[a, b, c] gives the Euclidean Triangle with side lengths a, b, c; ComparisonTriangle[graph, p, q, r] reads the s
- InfraComparisonTriangle: InfraComparisonTriangle[< or ... or >] is the wrapper for comparison triangles of nonzero curvature. Accessors "Sides", "Curvature", "An
- CATInequalityQ: CATInequalityQ[graph, {p, q, r}, k] tests whether the geodesic triangle on p, q, r satisfies the CAT(k) thinness inequality. Optio
- InfraCurvature: InfraCurvature[graph, v] gives the local Alexandrov upper curvature bound at v: the supremum of per-triangle CAT bounds inside a b
- SelectInfraWalk: SelectInfraWalk[graph, walks] draws a walk from a bundle , vertex lists or walk graphs, cycle graphs selecting as closed walks ,
- EmbeddingClosest: EmbeddingClosest[graph, bundle, ref] keeps the bundle elements drawn closest to a Euclidean reference under GraphEmbedding; ref is
- FindEmbeddingClosestPath: FindEmbeddingClosestPath[graph, curve] snaps an embedded curve to a walk graph, mapping sampled points to nearest vertices and joi
- GeodesicSprayGraph: GeodesicSprayGraph[graph, c] gives the BFS DAG rooted at c, whose directed source-to-sink paths are exactly the maximal geodesics
- GeodesicExtensionGraph: GeodesicExtensionGraph[graph, {p1, p2}] gives the DAG of geodesic extensions of the segment p1 -> p2 beyond p2: the vertices e wit
- PathSubgraph: PathSubgraph[graph, u, v] gives the union of all shortest u-v paths; a trailing length cap or All widens it to longer simple paths
- InfraDeformationSize: InfraDeformationSize[ref, walk] gives the number of ref edges that walk replaces , Length[ref] - 1 less the shared prefix and suf
- FindInfraHomotopyRepresentative: FindInfraHomotopyRepresentative[graph, walk] gives the length-shortest walks in the homotopy class of walk , an open walk with it
- FindInfraHomotopyRepresentativeHomotopy: FindInfraHomotopyRepresentativeHomotopy[graph, obj] gives the chain of elementary moves reducing obj to a shortest representative.
- FindInfraHomotopy: FindInfraHomotopy[graph, a, b] gives one chain of elementary moves from a to b as the List of walk graphs it passes through, { } w
- HomotopicQ: HomotopicQ[graph, a, b] tests whether a and b lie in the same homotopy class.
- NullHomotopicQ: NullHomotopicQ[graph, cycle] tests whether a closed walk , a vertex list read cyclically, or a cycle graph , is null-homotopic.
- HomotopyMoveType: HomotopyMoveType[walk1, walk2] classifies an elementary move as "Contract", "Extend", or "Lateral".
- HomotopyMoveTypes: HomotopyMoveTypes[chain] applies HomotopyMoveType to each consecutive pair of a homotopy chain.
- MetricInterval: MetricInterval[graph, u, v] gives { w : d(u, w) + d(w, v) == d(u, v) }, the union of all geodesics from u to v.
- GeodesicMultiplicity: GeodesicMultiplicity[graph, u, v] gives the number of distinct geodesics from u to v.
- GeodesicMultiplicityMatrix: GeodesicMultiplicityMatrix[graph] gives {D, M} with D the distance matrix and M the matrix of geodesic counts.
- MedianVertices: MedianVertices[graph, vs] gives the vertices minimising the sum of distances to vs.
- FindSegmentHull: FindSegmentHull[graph, S] gives, as the multiset < or v -> 1, ... or >, the smallest superset of S closed under MetricInterval , the ge
- SegmentHullQ: SegmentHullQ[graph, S] tests whether S is geodesically convex.
- InfraDensity: InfraDensity[graph, x] gives the marginal of any shape to the vertex set, < or v -> m or >, with respect to the counting measure: a vert
- FindInfraEquidistantSet: FindInfraEquidistantSet[graph, {p1, ..., pn}] gives { v : d(p1, v) == ... == d(pn, v) } as the multiset < or v -> 1, ... or >; a trailin
- InfraBoundary: InfraBoundary[graph, s] gives, as the multiset < or v -> 1, ... or >, the boundary of a vertex set, multiset or Infra* object. Option Me
- InfraInterior: InfraInterior[graph, s] gives, as the multiset < or v -> 1, ... or >, the interior of a vertex set, multiset or Infra* object. Option Me
- InfraVolume: InfraVolume[graph, s] gives the volume of a vertex set, multiset or Infra* object. Options "Measure" ("FullCount", "WithoutBoundar
- FindInfraRadarBasis: FindInfraRadarBasis[graph, n, m] gives resolving sets by ascending size. Deprecated: use FindResolvingSet in the Infrageometry pac
- InfraRadarBasisQ: InfraRadarBasisQ[graph, basis] tests whether basis is a resolving set. Deprecated: use ResolvingSetQ in the Infrageometry paclet.
- OrthogonalCoordinates: OrthogonalCoordinates[graph, c, axes, v] gives the integer displacement of v along each axis through the centre c; without v, the
- FindInfraOrthogonalFrame: FindInfraOrthogonalFrame[graph, c, axisLength] gives frames of mutually perpendicular geodesic axes through the centre c. Options
- FindInfraSpanningAxes: FindInfraSpanningAxes[graph, n] gives n mutually well-separated longest geodesics across graph, with no fixed centre. Options "Axi
- BetweennessQ: BetweennessQ[graph, u, w, v] tests Tarski betweenness B(u, w, v): w lies on a geodesic from u to v.
- EquidistanceQ: EquidistanceQ[graph, a, b, c, d] tests Tarski equidistance d(a, b) == d(c, d).
- TarskiStructure: TarskiStructure[graph] gives a memoized association of the Tarski primitives: vertices, distances, betweenness, equidistance, diam
- TarskiBetweennessTensor: TarskiBetweennessTensor[graph] gives the sparse rank-3 tensor whose nonzero entries are the triples with B(v_i, v_j, v_k).
- TarskiEquidistanceClasses: TarskiEquidistanceClasses[graph] gives the partition of unordered vertex pairs by distance value.
- TarskiCongruenceReflexivityQ: TarskiCongruenceReflexivityQ[graph] tests Tarski axiom A1, ab == ba. Always True on undirected simple graphs.
- TarskiCongruenceTransitivityQ: TarskiCongruenceTransitivityQ[graph] tests Tarski axiom A2, transitivity of congruence. A tautology of equality.
- TarskiCongruenceIdentityQ: TarskiCongruenceIdentityQ[graph] tests Tarski axiom A3, ab == cc implies a == b. Holds on connected simple graphs.
- TarskiSegmentConstructionQ: TarskiSegmentConstructionQ[graph] tests Tarski axiom A4, segment construction. Generally False on finite graphs.
- TarskiFiveSegmentsQ: TarskiFiveSegmentsQ[graph] tests Tarski axiom A5, five segments. Holds on median graphs. Option "MaxTuples" caps the O(n^8) search
- TarskiBetweennessIdentityQ: TarskiBetweennessIdentityQ[graph] tests Tarski axiom A6, B(a, b, a) implies a == b. Always True on connected simple graphs.
- TarskiInnerPaschQ: TarskiInnerPaschQ[graph] tests Tarski axiom A7, inner Pasch. Holds on median graphs; fails on cycles of length >= 5 and on Peterse
- TarskiLowerDimensionQ: TarskiLowerDimensionQ[graph] tests Tarski axiom A8, the existence of three non-collinear points.
- TarskiUpperDimensionQ: TarskiUpperDimensionQ[graph] tests Tarski axiom A9, three points equidistant from two distinct points are collinear. False in effe
- TarskiEuclidAxiomQ: TarskiEuclidAxiomQ[graph] tests Tarski axiom A10, the parallel-axiom variant. Stub: returns Indeterminate.
- TarskiContinuityQ: TarskiContinuityQ[graph] tests Tarski axiom A11, Dedekind continuity. Always False on finite graphs.
- TarskiAxiomQ: TarskiAxiomQ[graph] gives the per-axiom results of all eleven Tarski axiom predicates.
- FindTarskiCounterexample: FindTarskiCounterexample[graph, predQ] gives vertex tuples witnessing the failure of a Tarski axiom predicate.
- SameDirectionQ: SameDirectionQ[graph, O, v, w] tests whether v and w lie in the same direction at O, i.e. whether some ray from O through v contai
- CollinearQ: CollinearQ[graph, vertices] tests whether all listed vertices lie on a common line.
- ConcurrentQ: ConcurrentQ[graph, lines] tests whether all listed lines share a common vertex.
- UniqueCollinearQ: UniqueCollinearQ[graph, vertices] tests whether the listed vertices lie on a unique common line.
- UniqueConcurrentQ: UniqueConcurrentQ[graph, lines] tests whether the listed lines share exactly one common vertex.
- WhiteheadW1Q: WhiteheadW1Q[graph] tests Whitehead axiom W1: every line has at least three vertices.
- WhiteheadW2Q: WhiteheadW2Q[graph] tests Whitehead axiom W2: any two distinct vertices lie on exactly one line.
- WhiteheadW3Q: WhiteheadW3Q[graph] tests Whitehead axiom W3, the intersection property. O( or V or ^4); use on small graphs.
- ProjectivePlaneGraphQ: ProjectivePlaneGraphQ[graph] tests whether graph is a synthetic projective plane: W1, W2, W3 and non-degeneracy.
- EnumerateGraphs: EnumerateGraphs[n, predQ] gives the connected n-vertex graphs from GraphData satisfying predQ. Option "From" supplies a different
- InfraScene: InfraScene[objects, hypotheses] builds a scene descriptor from symbolic objects and construction or assertion hypotheses. Properti
- FindInfraScene: FindInfraScene[scene, graph] solves a scene on a graph and gives the resulting InfraInstance bindings. Option "PruneProbability".
- InfraInstance: InfraInstance[bindings] wraps a solved binding association; InfraInstance[bindings, sym] reads one object out of it.
- InfraGeometricStep: InfraGeometricStep[{hyp1, ...}] groups hypotheses into one construction step of a scene; a second argument labels it.
- InfraIntersection: InfraIntersection[graph, obj1, obj2, ...] gives the vertex-set intersection of shapes on graph , vertex lists, densities, walk gr
- InfraUnion: InfraUnion[graph, obj1, obj2, ...] gives the vertex-set union of shapes on graph as a sorted List. Inside InfraScene it is the tok
- InfraDistance: InfraDistance[graph, p, q] gives the graph distance between two Infra* objects, aggregated over their vertex sets. Option "Aggrega
- InfraPlaneQ: InfraPlaneQ[graph, h, p1, p2] tests whether h lies in the bisector slab of p1, p2 and separates them; a trailing window widens the
- InfraIntersectQ: InfraIntersectQ[s1, s2] asserts inside an InfraScene that two sets intersect; it stays inert until bindings resolve, which is why
- `$InfraPointColor`: Default highlight color for points , the shape classes Point and Density.
- `$InfraSegmentColor`: Default highlight color naming the segment construction. No shape defaults to it , a caller cites it by name.
- `$InfraLineColor`: Default highlight color naming the line construction. No shape defaults to it , a caller cites it by name.
- `$InfraShellColor`: Default highlight color naming the shell construction. No shape defaults to it , a caller cites it by name.
- `$InfraBallColor`: Default highlight color for vertex sets , the shape classes Set and SetFamily.
- `$InfraPlaneColor`: Default highlight color naming the plane construction. No shape defaults to it , a caller cites it by name.
- `$InfraCircleColor`: Default highlight color naming the circle construction. No shape defaults to it , a caller cites it by name.
- `$InfraRayColor`: Default highlight color naming the ray construction. No shape defaults to it , a caller cites it by name.
- `$InfraWalkColor`: Default highlight color for walk graphs , the shape classes Walk, Polyline and PolylineFamily.
- `$InfraTopologyColor`: Default highlight color for topology overlays.
- `$InfraPalette`: `$InfraPalette` is the Dataset of default colors, one row per named color, with columns "Primitive", "Color", "Symbol" and "Shapes"
- InfraSceneHighlight: InfraSceneHighlight[graph, objects] renders shapes , vertices, vertex lists, densities, walk graphs and lists of them , diffusel
- InfraSceneViewer: InfraSceneViewer[scene, graph] is an interactive step-by-step visualisation of an InfraScene on a graph.
- PointViewer: PointViewer[graph] is an interactive viewer for selecting points; PointViewer[graph, sym] stores the selection in sym.
- SegmentViewer: SegmentViewer[graph] is an interactive viewer for exploring geodesic segments.
- ShellViewer: ShellViewer[graph] is an interactive viewer for exploring metric shells.
- CircleViewer: CircleViewer[graph] is an interactive viewer for exploring separating cycles.
- InfraEqualQ: InfraEqualQ[graph, a, b] tests equality of two Infra* objects through their diffusion diagrams. Option Method ("Diffuse", "Overlap
- `$InfraPointSizes`: `$InfraPointSizes` is the association Small -> 4, Medium -> 7, Large -> 10 of absolute vertex-dot sizes. One value per class, indepe
- `$InfraAccentPointSize`: `$InfraAccentPointSize` is the absolute dot size (12) of the accent / centre role, which is not a size class and combines with Haloi

### E. Ruliology tools

#### WolframInstitute/TuringMachine

Paclet WolframInstitute/TuringMachine 1.1.9, Tools for exploring and analyzing Turing machines, powered by a Rust backend. Contexts `` WolframInstitute`TuringMachine` `` and `` WolframInstitute`TuringMachine`InductiveProofs` ``. Usage lines from TuringMachine/docs/Symbols/*.md; the table groups symbols by area and the list below gives every usage line. The README also uses MultiwayTuringMachineSearch, which is not in PacletInfo.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `InductiveProofs (proof rendering, panels, helpers)` | WolframInstitute/TuringMachine | https://github.com/WolframInstitute/TuringMachine/tree/main/TuringMachine/docs/Symbols | FindInductiveProof, tape configuration rendering, proof panels and internal helper symbols: `$InductiveProofColors` CompressToRunLength DecodeTuringMachineRules FindInductiveProof IslandsPanel RenderAxiomGrid RenderConfiguration RenderEquation RenderUniversalGoal RuleSpacePanel RunMachine SettingsPanel ShowTapeConfiguration StatementPanel TokenEventPanel InductiveProofs internal helpers | Turing machines, multiway systems, ruliology | seen |
| `Deterministic Turing machines and rule-space tables` | WolframInstitute/TuringMachine | https://github.com/WolframInstitute/TuringMachine/tree/main/TuringMachine/docs/Symbols | one-sided deterministic machines, rule counts and cases, Rust-backed output, step and width tables and plots: `$PvsNPStyles` NonTerminatingTuringMachineQ OneSidedTuringMachineEvolution OneSidedTuringMachineFind OneSidedTuringMachineFunction OneSidedTuringMachineFunctionPlot OneSidedTuringMachinePlot OneSidedTuringMachineRuntimePlot TuringMachineOutput TuringMachineOutputWithSteps TuringMachineOutputWithStepsFloat TuringMachineOutputWithStepsWidths TuringMachineOutputWithStepsWidthsFloat TuringMachineRuleCases TuringMachineRuleCount TuringMachineSteps TuringMachineStepsWidths TuringMachineWidths TuringMachineWorstCasePlot | Turing machines, multiway systems, ruliology | seen |
| `InductiveProofs multiway graphs` | WolframInstitute/TuringMachine | https://github.com/WolframInstitute/TuringMachine/tree/main/TuringMachine/docs/Symbols | multiway equational-rewrite clouds, geodesic, token-event and rule-space graphs used for inductive proofs: MultiwayBothPanel MultiwayEquationalGraph MultiwayGeodesicGraph MultiwayInductiveProofPanel MultiwayRuleGraph MultiwayTokenEventGraph | Turing machines, multiway systems, ruliology | seen |
| `Multiway Turing machines` | WolframInstitute/TuringMachine | https://github.com/WolframInstitute/TuringMachine/tree/main/TuringMachine/docs/Symbols | nondeterministic (multiway) Turing machines given as lists of rule numbers: MultiwayNonHaltedStatesLeft MultiwayTuringMachineFunction MultiwayTuringMachinePlot MultiwayTuringMachineRules | Turing machines, multiway systems, ruliology | seen |
| MultiwayTuringMachineSearch | WolframInstitute/TuringMachine | https://github.com/WolframInstitute/TuringMachine/blob/main/TuringMachine/Kernel/Functions.wl | MultiwayTuringMachineSearch[rules, input, output, maxSteps] attempts to find a sequence of transitions in a non-deterministic Turing machine defined by a list of integer rules that transforms input into output within maxSteps steps (usage message in Kernel/Functions.wl, exported in the paclet context; also used in the README; not in the PacletInfo symbol list and no docs/Symbols page) | Turing machines, multiway systems, ruliology | seen |

Every symbol with its usage line or source description:

- `$InductiveProofColors`: InductiveProofColors is the association of every color used by the proof-graph and multiway renderers, keyed by role.
- `$PvsNPStyles`: PvsNPStyles is an association of named colors, color rules, and plot options shared by the package's visualization functions.
- CompressToRunLength: CompressToRunLength[expr] compresses a left-nested tape configuration expr by collapsing each maximal run of s0 or s1 cells into a zeros[n] or ones[n] term.
- DecodeTuringMachineRules: DecodeTuringMachineRules[number, s, k] decodes the Turing machine number (with s states and k colors) into a list of symbolic transition rules of the form {state, symbol}
- FindInductiveProof: FindInductiveProof[goal, axioms] proves ForAll[n, goal] by equational induction on n, returning an association describing the proof.
- IslandsPanel: IslandsPanel[ru] renders the multiway equational-rewrite cloud for one case of the Turing machine ru's induction proof.
- MultiwayBothPanel: MultiwayBothPanel[ru] renders side-by-side faded multiway token-event cones for the base and step cases of the Turing machine ru, captioned with the induction rule.
- MultiwayEquationalGraph: MultiwayEquationalGraph[axioms, seeds, steps] evolves a multiway equational-rewrite cloud from seeds for steps generations and renders it as a graph, highlighting the equ
- MultiwayGeodesicGraph: MultiwayGeodesicGraph[axioms, seeds, steps] evolves a multiway rewrite cloud from seeds for steps generations and renders it with the geodesic (shortest) path between the
- MultiwayInductiveProofPanel: MultiwayInductiveProofPanel[ru] draws the grafted inductive proof graph for the Turing machine ru at full opacity, embedded inside the faded multiway term-space cloud of
- MultiwayNonHaltedStatesLeft: MultiwayNonHaltedStatesLeft[rules, input, n] gives the number of non-halted states left in the traversal queue after exploring the multiway machine rules for up to n step
- MultiwayRuleGraph: MultiwayRuleGraph[axioms] builds the superposition (critical-pair) rule-space graph of an equational axiom set: each rule is a vertex, and superposing two rules to derive
- MultiwayTokenEventGraph: MultiwayTokenEventGraph[axioms, seeds, steps] evolves a multiway rewrite cloud from seeds for steps generations in token-event form , state to event to state, with an axi
- MultiwayTuringMachineFunction: MultiwayTuringMachineFunction[rules, input, n] traverses the nondeterministic Turing machine defined by the list of integer rules on input for at most n steps (assuming 2
- MultiwayTuringMachinePlot: MultiwayTuringMachinePlot[rules, maxInput, n] plots the tape values reachable by the multiway Turing machine defined by the integer rules for inputs 1 through maxInput, r
- MultiwayTuringMachineRules: MultiwayTuringMachineRules[rules, s, k] gives an association mapping each {state, symbol} to a list of transition triples {nextState, writeSymbol, direction}.
- NonTerminatingTuringMachineQ: NonTerminatingTuringMachineQ[rules, input, n] gives True if the machine defined by the integer rules enters a cycle within n steps (assuming 2 states, 2 symbols).
- OneSidedTuringMachineEvolution: OneSidedTuringMachineEvolution[{number, s, k}, input, n] returns the step-by-step evolution of a one-sided Turing machine as a list of configurations, one per step, for a
- OneSidedTuringMachineFind: OneSidedTuringMachineFind[rule, maxInput, n, {s, k}] finds all s-state, k-color rules that reproduce the outputs of rule for inputs 1 to maxInput, each within n steps.
- OneSidedTuringMachineFunction: OneSidedTuringMachineFunction[rule, input, n] runs the deterministic one-sided Turing machine rule on input for at most n steps and returns the integer value left on the
- OneSidedTuringMachineFunctionPlot: OneSidedTuringMachineFunctionPlot[{number, s, k}, {min, max}, n] plots the output value of a one-sided Turing machine as a function of its input, over inputs min through
- OneSidedTuringMachinePlot: OneSidedTuringMachinePlot[rule, input, n] generates a visualization of the space-time evolution of the one-sided Turing machine rule run on input for at most n steps.
- OneSidedTuringMachineRuntimePlot: OneSidedTuringMachineRuntimePlot[{number, s, k}, {min, max}, n] plots the running time (number of steps) of a one-sided Turing machine as a function of its input, over in
- RenderAxiomGrid: RenderAxiomGrid[axioms] renders a list of ForAll-quantified axioms as a two-column grid of rendered equations, aligned on the =.
- RenderConfiguration: RenderConfiguration[expr] renders a left-nested tape configuration expr as a row of tape-cell graphics.
- RenderEquation: RenderEquation[eqn] renders an equation between two tape configurations as tape-cell rows either side of an =.
- RenderUniversalGoal: RenderUniversalGoal[var, eqn] renders ForAll[var, eqn] as a universal-quantifier glyph subscripted by var, followed by the rendered equation.
- RuleSpacePanel: RuleSpacePanel[ru] renders the MultiwayRuleGraph (superposition / critical-pair rule space) of the Turing machine ru's axioms plus induction hypothesis.
- RunMachine: RunMachine[rules, inputBits] runs the symbolic Turing machine rules on inputBits and returns the list of left-nested tape configurations visited, one per step.
- SettingsPanel: SettingsPanel[ru] renders the multiway geodesic graph for the full step case of the Turing machine ru , its axioms, induction hypothesis, and all derived-lemma rows toget
- ShowTapeConfiguration: ShowTapeConfiguration[tape, headPos, state] renders tape (a list of cell symbols) with the head state inserted at position headPos, run-length compressed by default.
- StatementPanel: StatementPanel[ru, k] renders the multiway geodesic graph between the base or step seed equations of the Turing machine ru, seeded with the axioms plus the first k derive
- TokenEventPanel: TokenEventPanel[ru, k] renders the multiway token-event graph for the Turing machine ru's base or step case, seeded with the axioms plus the first k derived-lemma rows.
- TuringMachineOutput: TuringMachineOutput[s, k, n, maxInput] gives a nested list of halted outputs for every s-state, k-color rule and every input up to maxInput, running each machine for at m
- TuringMachineOutputWithSteps: TuringMachineOutputWithSteps[s, k, n, maxInput] gives a nested list where each cell is {steps, output} for a halting machine, over every s-state, k-color rule and every
- TuringMachineOutputWithStepsFloat: TuringMachineOutputWithStepsFloat[s, k, n, maxInput] gives a 3D numeric array of {steps, output} for every s-state, k-color rule and every input up to maxInput.
- TuringMachineOutputWithStepsWidths: TuringMachineOutputWithStepsWidths[s, k, n, maxInput] gives a nested list of {steps, output, width} triples for halting machines, over every s-state, k-color rule and e
- TuringMachineOutputWithStepsWidthsFloat: TuringMachineOutputWithStepsWidthsFloat[s, k, n, maxInput] gives a 3D numeric array of shape {rules, inputs, 3} holding {steps, value, width} triples.
- TuringMachineRuleCases: TuringMachineRuleCases[{number, s, k}] gives an association mapping each {state, symbol} to its transition triple {nextState, writeSymbol, direction}.
- TuringMachineRuleCount: TuringMachineRuleCount[s, k] gives the total number of distinct Turing machine rules with s states and k symbols.
- TuringMachineSteps: TuringMachineSteps[s, k, n, maxInput] gives a matrix of step counts for halting machines, over every s-state, k-color rule and every input up to maxInput (running each fo
- TuringMachineStepsWidths: TuringMachineStepsWidths[s, k, n, maxInput] gives a list of {steps, width} pairs for halting s-state, k-color machines over every input up to maxInput.
- TuringMachineWidths: TuringMachineWidths[s, k, n, maxInput] gives a matrix of maximum head widths (the largest absolute head position reached) for halting s-state, k-color machines over every
- TuringMachineWorstCasePlot: TuringMachineWorstCasePlot[{number, s, k}, {min, max}, n] plots the running time of a one-sided Turing machine against its input, together with the worst-case runtime env

#### WolframInstitute/CellularAutomaton

Paclet WolframInstitute/CellularAutomaton 1.0.4, Tools for exploring and analyzing cellular automata with Rust-accelerated search, creator Nik Murzin. Usage messages from CellularAutomaton/Kernel/Functions.wl.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Evolution and tables symbols` | WolframInstitute/CellularAutomaton | https://github.com/WolframInstitute/CellularAutomaton/blob/main/CellularAutomaton/Kernel/Functions.wl | rule counts, outputs, evolutions, output tables, active widths and plots: CellularAutomatonRuleCount CellularAutomatonOutput CellularAutomatonEvolution CellularAutomatonOutputTable CellularAutomatonActiveWidths CellularAutomatonPlot CellularAutomatonStateWidth | cellular automata, ruliology, rule search | seen |
| `Search symbols` | WolframInstitute/CellularAutomaton | https://github.com/WolframInstitute/CellularAutomaton/blob/main/CellularAutomaton/Kernel/Functions.wl | rule-space searches for target patterns, widths and ratios, tests and rule iterators: CellularAutomatonSearch CellularAutomatonBoundedWidthSearch CellularAutomatonWidthRatioSearch CellularAutomatonTest CARuleIterator `$CARuleFixedConstraintsK3R1` | cellular automata, ruliology, rule search | seen |

Every symbol with its usage line or source description:

- CellularAutomatonRuleCount: CellularAutomatonRuleCount[k, r] returns the total number of distinct cellular automaton rules for k colors and radius r.
- CellularAutomatonOutput: CellularAutomatonOutput[{rule, k, r}, init, steps] returns the final state of a 1D cellular automaton. CellularAutomatonOutput[rule, k, r, init, steps] is equivalent. Cel
- CellularAutomatonEvolution: CellularAutomatonEvolution[{rule, k, r}, init, steps] returns the full spacetime evolution as a matrix. CellularAutomatonEvolution[rule, k, r, init, steps] is equivalent.
- CellularAutomatonSearch: CellularAutomatonSearch[{k, r}, init Rule target, steps] finds all rules matching initRuletarget. CellularAutomatonSearch[{k, r}, init Rule targetWidth, steps] finds rule
- CellularAutomatonOutputTable: CellularAutomatonOutputTable[k, r, init, steps] computes the output for all rules in the rule space. CellularAutomatonOutputTable[k, r, init, steps, min ;; max] restricts
- CellularAutomatonBoundedWidthSearch: CellularAutomatonBoundedWidthSearch[init, steps, maxWidth, {k, r}] finds rules where the active region never exceeds maxWidth. CellularAutomatonBoundedWidthSearch[init, s
- CellularAutomatonActiveWidths: CellularAutomatonActiveWidths[k, r, init, steps] returns {maxWidth, finalWidth} for each rule in the rule space. CellularAutomatonActiveWidths[k, r, init, steps, min ;; m
- CellularAutomatonWidthRatioSearch: CellularAutomatonWidthRatioSearch[inits, steps, ratio, {k, r}] finds rules where output width = ratio Times input width for all inits. CellularAutomatonWidthRatioSearch[i
- CellularAutomatonTest: CellularAutomatonTest[{rule, k, r}, init Rule target, steps] returns True if the CA produces target from init. CellularAutomatonTest[{rule, k, r}, {init1 Rule target1, El
- CellularAutomatonPlot: CellularAutomatonPlot[rule, width, steps] plots the spacetime evolution of an elementary CA. CellularAutomatonPlot[rule, init, steps] evolves from an explicit initial con
- CellularAutomatonStateWidth: CellularAutomatonStateWidth[state] returns the active width (extent of nonzero cells) of a 1D CA state.
- CARuleIterator: CARuleIterator[k, r, fixedRules] creates a compiled iterator over CA rule numbers consistent with the given fixed pattern constraints. Use iter["Next"] to yield successiv
- `$CARuleFixedConstraintsK3R1`: `$CARuleFixedConstraintsK3R1` is the list of 7 structural fixed constraints for k=3, r=1 CAs with patterns embedded in 0-background.

#### WolframInstitute/Ruliobiology

Paclet WolframInstitute/Ruliobiology, Simulation, mutation and analysis of computational systems (WL 15). Usage messages from the Kernel files.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Ruliobiology symbols` | WolframInstitute/Ruliobiology | https://github.com/WolframInstitute/Ruliobiology/tree/main/Ruliobiology/Kernel | finite cellular automata, mutation, lifetimes, outlines and plots: FiniteCellularAutomaton MutateCellularAutomaton MutateCellularAutomatonAll CellularAutomatonLifetime CellularAutomatonOutline CellularAutomatonPlot | cellular automata, ruliology, mutation | seen |

Every symbol with its usage line or source description:

- FiniteCellularAutomaton: FiniteCellularAutomaton[rule, init, specification] follows CellularAutomaton time and space specifications, with UpTo[n] stopping when the active region disappears.
- MutateCellularAutomaton: MutateCellularAutomaton[rule, spec] mutates cases of a cellular automaton rule.
- MutateCellularAutomatonAll: MutateCellularAutomatonAll[rule, count] gives all mutations that change count cases.
- CellularAutomatonLifetime: CellularAutomatonLifetime[evolution] gives its lifetime. CellularAutomatonLifetime[rule, init, limit] searches for the rule's lifetime.
- CellularAutomatonOutline: CellularAutomatonOutline[evolution] gives its active boundary cells. CellularAutomatonOutline[evolution, "Interior"] gives its enclosed interior outlines separately.
- CellularAutomatonPlot: CellularAutomatonPlot[rule, init, specification] plots a cellular automaton using CellularAutomaton time and space specifications, with UpTo[n] allowing early stopping.

#### WolframInstitute/IteratedFiniteAutomaton

Paclet WolframInstitute/IteratedFiniteAutomaton: Iterated finite automata and automata groups: evolution, periodicity, state analysis, and conversion between Mealy and wreath recursion formalisms, based on Andrzej Zuk's WSRI26 essay. Usage messages from IteratedFiniteAutomaton/Kernel/Usage.wl; the table groups symbols by name prefix and the list below gives every usage line.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `IteratedFiniteAutomaton* symbols` | WolframInstitute/IteratedFiniteAutomaton | https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl | symbols with prefix IteratedFiniteAutomaton: IteratedFiniteAutomaton IteratedFiniteAutomatonPeriodicStop IteratedFiniteAutomatonStateTransitions IteratedFiniteAutomatonStateGraph IteratedFiniteAutomatonStateSubgraph IteratedFiniteAutomatonStateSubgraphFamily IteratedFiniteAutomatonColors IteratedFiniteAutomatonFromStates IteratedFiniteAutomatonFromWreath IteratedFiniteAutomatonEvolve IteratedFiniteAutomatonSample IteratedFiniteAutomatonInitialConditionSample IteratedFiniteAutomatonsByRule IteratedFiniteAutomatonsByInitialCondition IteratedFiniteAutomatonsMatrix | automata, ruliology | seen |
| `Automaton* symbols` | WolframInstitute/IteratedFiniteAutomaton | https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl | symbols with prefix Automaton: AutomatonRuleFromCode AutomatonCodeFromRule AutomatonAdderCascade AutomatonWindowProgram AutomatonProduct AutomatonLevelPermutations AutomatonWordPermutation AutomatonWordOrders AutomatonWordOrder AutomatonWordBall AutomatonGroupBall AutomatonElementCount AutomatonAbelianQ AutomatonTorsionFreeCandidateQ AutomatonGroupFingerprint AutomatonFromWreathString AutomatonData AutomatonWreathRecursion AutomatonSectionTable AutomatonWordSection AutomatonSection AutomatonNucleus AutomatonWordSectionClosure AutomatonWordIdentityQ AutomatonWordEqualQ AutomatonRuleFromWord AutomatonTreePortrait AutomatonBoundaryGraph | automata, ruliology | seen |
| `Canonical* symbols` | WolframInstitute/IteratedFiniteAutomaton | https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl | symbols with prefix Canonical: CanonicalAutomatonCode | automata, ruliology | seen |
| `Invertible* symbols` | WolframInstitute/IteratedFiniteAutomaton | https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl | symbols with prefix Invertible: InvertibleAutomatonQ InvertibleAutomatonCodes | automata, ruliology | seen |
| `BGKMNSS* symbols` | WolframInstitute/IteratedFiniteAutomaton | https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl | symbols with prefix BGKMNSS: BGKMNSSNumber | automata, ruliology | seen |
| `FindAutomaton* symbols` | WolframInstitute/IteratedFiniteAutomaton | https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl | symbols with prefix FindAutomaton: FindAutomatonRelations FindAutomatonTorsionElements | automata, ruliology | seen |
| `MaxTerms* symbols` | WolframInstitute/IteratedFiniteAutomaton | https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl | symbols with prefix MaxTerms: MaxTerms | automata, ruliology | seen |
| `GroupRing* symbols` | WolframInstitute/IteratedFiniteAutomaton | https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl | symbols with prefix GroupRing: GroupRingLevelProduct GroupRingIdempotentQ GroupRingIdempotentSearch GroupRingIdempotentSurvival GroupRingLeftAnnihilator GroupRingZeroDivisorSurvival | automata, ruliology | seen |

Every symbol with its usage line or source description:

- IteratedFiniteAutomaton: IteratedFiniteAutomaton[rule, init, t] generates the evolution of the iterated finite automaton with the specified rule from initi
- IteratedFiniteAutomatonPeriodicStop: IteratedFiniteAutomatonPeriodicStop[rule, s0, init, t] evolves the iterated finite automaton until a row repeats, up to at most t
- IteratedFiniteAutomatonStateTransitions: IteratedFiniteAutomatonStateTransitions[rule, s0, init, t] evolves the iterated finite automaton recording at each cell the transi
- IteratedFiniteAutomatonStateGraph: IteratedFiniteAutomatonStateGraph[{code, {s, k}}] gives the state transition diagram of the automaton as a Graph with edge tags i
- IteratedFiniteAutomatonStateSubgraph: IteratedFiniteAutomatonStateSubgraph[rule, s0, init, t] gives the sub-digraph of the state transition diagram whose edges the init
- IteratedFiniteAutomatonStateSubgraphFamily: IteratedFiniteAutomatonStateSubgraphFamily[rule, s0, n, t] gives the family of exercised sub-digraphs over all k^n initial conditi
- IteratedFiniteAutomatonColors: IteratedFiniteAutomatonColors[k] gives ColorRules for k symbols: white for 0, black for 1 when k == 2, ColorData[97] otherwise.
- IteratedFiniteAutomatonFromStates: IteratedFiniteAutomatonFromStates[< or state -> {input -> {output, nextState}, ...}, ... or >, s0] converts a Mealy transducer with name
- IteratedFiniteAutomatonFromWreath: IteratedFiniteAutomatonFromWreath[< or state -> {outputs, sections}, ... or >, s0] converts a wreath recursion g = (outputs; sections) o
- IteratedFiniteAutomatonEvolve: IteratedFiniteAutomatonEvolve[conv, init, t] evolves the converted automaton conv = IteratedFiniteAutomatonFromStates[...] or Iter
- AutomatonRuleFromCode: AutomatonRuleFromCode[{code, {s, k}}] gives the Mealy rule {state, input} -> {nextState, output} of the automaton numbered code ov
- AutomatonCodeFromRule: AutomatonCodeFromRule[rule] gives the numeric code {code, {s, k}} of an explicit Mealy rule, inverting AutomatonRuleFromCode.
- CanonicalAutomatonCode: CanonicalAutomatonCode[automaton] gives the least code {code, {s, k}} in the orbit of the automaton under relabelling its states a
- InvertibleAutomatonQ: InvertibleAutomatonQ[automaton] gives True if the outputs at each state permute the symbols, so the automaton acts on the rooted t
- InvertibleAutomatonCodes: InvertibleAutomatonCodes[{s, k}] gives the codes of all invertible automata over s states and k symbols.
- AutomatonAdderCascade: AutomatonAdderCascade[s] gives the rule of the cascade of s - 1 binary odometers in series: state i advances the symbol it reads a
- AutomatonWindowProgram: AutomatonWindowProgram[m, active] gives the rule of the automaton on the 2^m windows of the m symbols last read, advancing the sym
- AutomatonProduct: AutomatonProduct[a, b] gives the rule of the composition automaton on the s_a s_b pairs of states, where state {p, q}, numbered (p
- AutomatonLevelPermutations: AutomatonLevelPermutations[automaton, level] gives an Association sending each state to its action on the k^level vertices at dept
- AutomatonWordPermutation: AutomatonWordPermutation[perms, word] gives the permutation of the level vertices induced by a word in the generators, where perms
- AutomatonWordOrders: AutomatonWordOrders[automaton, word, levels] gives the order of word in Aut(T_L) for each L in levels. The orders are nondecreasin
- AutomatonWordOrder: AutomatonWordOrder[automaton, word, maxOrder] gives the exact order of word in the automaton group when it is at most maxOrder, an
- AutomatonWordBall: AutomatonWordBall[automaton, radius] gives the reduced words of length 1 to radius in the free group on the automaton's states, wi
- AutomatonGroupBall: AutomatonGroupBall[automaton, radius, refLevel] gives one shortest word for each distinct nontrivial element of the level-refLevel
- AutomatonElementCount: AutomatonElementCount[automaton, wordLength, level] gives the number of distinct elements of Aut(T_level) represented by words of
- AutomatonAbelianQ: AutomatonAbelianQ[automaton, level] gives True if the generators commute in the level quotient.
- AutomatonTorsionFreeCandidateQ: AutomatonTorsionFreeCandidateQ[automaton, wordLength, levels] gives True if some word of length at most wordLength acts nontrivial
- AutomatonGroupFingerprint: AutomatonGroupFingerprint[automaton, level] gives < or "Code", "Abelian", "BallGrowth" or > for the level quotient, where "BallGrowth" c
- BGKMNSSNumber: BGKMNSSNumber[automaton] gives the number of a 3-state binary automaton in the classification of Bondarenko, Grigorchuk, Kravchenk
- AutomatonFromWreathString: AutomatonFromWreathString["a = (b, a)(1,2), b = (a, b)"] gives the Mealy rule list of a wreath recursion written in the notation o
- AutomatonData: AutomatonData[] gives the canonical names of the named automata of the literature.
- AutomatonWreathRecursion: AutomatonWreathRecursion[automaton] gives the wreath recursion as < or state -> {outputs, sections}, ... or >, the argument IteratedFini
- AutomatonSectionTable: AutomatonSectionTable[automaton] gives an Association sending {g, x} to {section of g at x, image of x}, for every generator g and
- AutomatonWordSection: AutomatonWordSection[sections, word, x] gives {section of word at the letter x, image of x}, where sections = AutomatonSectionTabl
- AutomatonSection: AutomatonSection[automaton, word, treeWord] gives the section of word at the tree vertex treeWord.
- AutomatonNucleus: AutomatonNucleus[automaton, radius, depth, refLevel] gives, for each d = 0, ..., depth, the sections at depth d of the words of le
- AutomatonWordSectionClosure: AutomatonWordSectionClosure[automaton, word] gives the Moore diagram of word as a tree automorphism: an Association sending each f
- AutomatonWordIdentityQ: AutomatonWordIdentityQ[automaton, word] decides whether word is the identity of the automaton group, not merely of a level quotien
- AutomatonWordEqualQ: AutomatonWordEqualQ[automaton, wordA, wordB] decides whether wordA and wordB are the same element of the automaton group, as trivi
- AutomatonRuleFromWord: AutomatonRuleFromWord[automaton, word] gives word as an automaton in its own right: the states are the section closure words of wo
- FindAutomatonRelations: FindAutomatonRelations[automaton, radius] gives the shortest relators of the automaton group discoverable in the radius ball: all
- FindAutomatonTorsionElements: FindAutomatonTorsionElements[automaton, radius, maxOrder] gives an Association from each torsion element of the radius ball, one s
- MaxTerms: MaxTerms is an option for the group-ring searches specifying the largest number of nonzero terms a candidate element may have. Max
- GroupRingLevelProduct: GroupRingLevelProduct[perms, a, b] gives the product of the group-ring elements a and b in the level quotient, as an Association f
- GroupRingIdempotentQ: GroupRingIdempotentQ[automaton, a, level] gives True if a (a - 1) = 0 in the group ring of the level quotient, so that a is idempo
- GroupRingIdempotentSearch: GroupRingIdempotentSearch[automaton, radius, coefficients, level] gives the idempotents of the group ring of the level quotient su
- GroupRingIdempotentSurvival: GroupRingIdempotentSurvival[automaton, radius, levels] searches over F_p, p = OptionValue[Modulus], for elements supported on the
- GroupRingLeftAnnihilator: GroupRingLeftAnnihilator[automaton, a, support, levels] gives a basis of the coefficient vectors b, in the basis support, with a .
- GroupRingZeroDivisorSurvival: GroupRingZeroDivisorSurvival[automaton, radius, levels] searches over F_p, p = OptionValue[Modulus], for elements A supported on t
- AutomatonTreePortrait: AutomatonTreePortrait[automaton, s0, level] gives the prefix of the rooted tree down to depth level as a Graph, with each vertex c
- AutomatonBoundaryGraph: AutomatonBoundaryGraph[automaton, s0, level] gives the permutation of the k^level vertices at depth level induced by the state s0,
- IteratedFiniteAutomatonSample: IteratedFiniteAutomatonSample[{s, k}, n] gives n + 1 codes spread evenly over the (s k)^(s k) automata on s states and k symbols.
- IteratedFiniteAutomatonInitialConditionSample: IteratedFiniteAutomatonInitialConditionSample[k, length, n] gives n + 1 initial conditions of the given length, spread evenly over
- IteratedFiniteAutomatonsByRule: IteratedFiniteAutomatonsByRule[{s, k}, rules, init] gives one ArrayPlot of the evolution from init for each code in rules.
- IteratedFiniteAutomatonsByInitialCondition: IteratedFiniteAutomatonsByInitialCondition[automaton, inits] gives one ArrayPlot of the evolution of the automaton for each initia
- IteratedFiniteAutomatonsMatrix: IteratedFiniteAutomatonsMatrix[{s, k}, rules, inits] gives the matrix of ArrayPlots with one row per code in rules and one column

#### WolframInstitute/WolframLambda (paclet Wolfram/Lambda)

Paclet Wolfram/Lambda 1.2.4, Tools for the lambda calculus, context `` Wolfram`Lambda` ``. The source has no usage messages (documentation is in notebooks); the multiway and causal functions are listed from Kernel/Multiway.wl and PacletInfo.wl.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `Lambda multiway and causal symbols` | Wolfram/Lambda | https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Multiway.wl | multiway and causal graphs of beta reductions (Kernel/Multiway.wl): LambdaMultiwayGraph LambdaCausalGraph LambdaMultiwayCausalGraph LambdaCausalEvolutionGraph LambdaMultiwayCausalEvolutionGraph | lambda calculus, multiway systems, causal graphs | seen |
| `Wolfram/Lambda other symbols` | Wolfram/Lambda | https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Multiway.wl | BetaReduce BetaReduceList BetaReduceChain BetaReductions BetaPositionReductions BetaReducePositions BetaReduceSizes BetaReduceStepPlot BetaReduceTreeList BetaSubstitute EtaReduce EvalLambda EnumerateLambdas EnumerateLinearLambdas EnumerateSizeLambdas RandomLambda RandomSizeLambda LambdaTree LambdaDiagram LambdaGraph LambdaLoopbackGraph LambdaStringDiagram LambdaCombinator CombinatorLambda FindMinimalLambdaCombinator ChurchNumeral FromChurchNumeral LambdaBLC BLCLambda ParseLambda LambdaString LambdaToHaskell ColorizeLambda TagLambda and others (PacletInfo symbol list) | lambda calculus, multiway systems, causal graphs | seen |

Every symbol with its usage line or source description:

- LambdaMultiwayGraph: LambdaMultiwayGraph[lambda, t, m] multiway graph of beta reductions of a lambda expression (options Simple, HighlightPath, Variables)
- LambdaCausalGraph: causal graph of a lambda reduction (PacletInfo symbol; Kernel/Multiway.wl)
- LambdaMultiwayCausalGraph: LambdaMultiwayCausalGraph[args] multiway causal graph of lambda reductions
- LambdaCausalEvolutionGraph: causal evolution graph of a lambda reduction (PacletInfo symbol)
- LambdaMultiwayCausalEvolutionGraph: LambdaMultiwayCausalEvolutionGraph[args] combined multiway evolution and causal graph

#### maxitg/CombinatorEvolve

Wolfram Language paclet for running combinators (C++ library). README: It defines two functions, CombinatorFinalExpression and CombinatorLeafCounts; the Kernel exports two more.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `CombinatorEvolve symbols` | CombinatorEvolve (GitHub paclet) | https://github.com/maxitg/CombinatorEvolve/blob/master/Kernel/CombinatorLeftmostOutermostLeafCounts.m | final expressions and leaf counts of combinator evaluation: CombinatorFinalExpression CombinatorLeafCounts CombinatorLeftmostOutermostLeafCounts SKCombinatorLeftmostOutermostLeafCounts | combinators, ruliology | seen |

Every symbol with its usage line or source description:

- CombinatorFinalExpression: CombinatorFinalExpression[rules, init, eventCount, eventOrder, maxLeafCount] returns the final expression after a specified number of rewrites
- CombinatorLeafCounts: leaf counts of the combinator expression after each rewrite (one of the two functions the paclet defines)
- CombinatorLeftmostOutermostLeafCounts: leaf counts for leftmost-outermost evaluation (exported in Kernel/CombinatorLeftmostOutermostLeafCounts.m)
- SKCombinatorLeftmostOutermostLeafCounts: leaf counts for leftmost-outermost evaluation of SK combinators (exported)

#### maxitg/PostTagSystem

PostTagSystem implements a tag system introduced by Emil Post in 1921 (C++ with Wolfram Language paclet). Usage strings read from Kernel/*.m SetUsage calls.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `PostTagSystem symbols` | PostTagSystem (GitHub paclet) | https://github.com/maxitg/PostTagSystem/tree/master/Kernel | Post tag system evolution objects, final states and histories: PostTagSystem PostTagSystemEvolution PostTagSystemFinalState GeneratePostTagSystemHistory GenerateTagSystemHistory | tag systems, ruliology | seen |

Every symbol with its usage line or source description:

- PostTagSystem: PostTagSystem[{h, t}] computes the evolution of the Post tag system starting from a state with head h and tape t; PostTagSystem[i] produces an evolution object for multiple inits
- PostTagSystemEvolution: an evolution object generated by PostTagSystem; PostTagSystemEvolution[...]['Property', s] yields the value of a property
- PostTagSystemFinalState: PostTagSystemFinalState[{initPhase, initTape}, maxEventCount] computes the evolution of the Post tag system and returns the final state
- GeneratePostTagSystemHistory: GeneratePostTagSystemHistory[{initPhase, initTape}, maxEventCount] computes the evolution of the Post tag system for at most maxEventCount events, and returns an association
- GenerateTagSystemHistory: GenerateTagSystemHistory[system, {initPhase, initTape}, maxEventCount] computes the evolution of the named tag system

#### asheux/NetworkSystem (paclet WolframInstitute/NetworkSystem)

The New Kind of Science NetworkSystems' implementation, paclet WolframInstitute/NetworkSystem 1.1.5, creator Brian A. Mboya. Found by GitHub code search after the paclet showed up in the local kernel (PacletFind). Kernel usage messages are not defined; names from PacletInfo.wl and Kernel exports.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `NetworkSystem symbols` | WolframInstitute/NetworkSystem | https://github.com/asheux/NetworkSystem/blob/main/PacletInfo.wl | NKS network system rules, evolution lists, plots and displays: NetworkSystemRule NetworkSystemEvolutionList NetworkSystemEvolutionPlot NetworkSystemDisplay CyclicNet GetDepthOneRules | network systems, NKS, ruliology | seen |

Every symbol with its usage line or source description:

- NetworkSystemRule: network system rule (PacletInfo symbol list; docs page NetworkSystemRule.nb)
- NetworkSystemEvolutionList: list of successive network states (Kernel/NetworkSystemEvolution.m export)
- NetworkSystemEvolutionPlot: plot of the evolution of a network system (Kernel export)
- NetworkSystemDisplay: display of a network system state (Kernel export)
- CyclicNet: cyclic network initial condition (Kernel export)
- GetDepthOneRules: symbol present in the installed paclet context (kernel Names), not in PacletInfo

#### maxitg/OrientedGraph (2014)

Utilities for enumerating, evolving and visualizing planar network systems, or oriented graphs (NKS chapter 9 network systems). Single file OrientedGraph.wl with usage messages built by StringJoin; only the names were read.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| `OrientedGraph symbols` | GitHub (maxitg/OrientedGraph) | https://github.com/maxitg/OrientedGraph/blob/master/OrientedGraph.wl | planar network systems as oriented graphs: OrientedGraph OrientedGraphQ OrientedGridGraph WrappedAround OrientedGraphIsomorphism LocalDimensionality VertexPort GraphPort | network systems, NKS | seen |

Every symbol with its usage line or source description:

- OrientedGraph: oriented (planar network system) graph object
- OrientedGraphQ: tests for an OrientedGraph
- OrientedGridGraph: oriented grid graph constructor
- WrappedAround: wrap-around (periodic) specification for OrientedGridGraph
- OrientedGraphIsomorphism: isomorphism between oriented graphs
- LocalDimensionality: local dimensionality of an oriented graph
- VertexPort: port of a vertex in an oriented graph
- GraphPort: port of an oriented graph

#### Other WolframInstitute paclets with tangential symbols

Repositories whose symbols touch the topic only at the edge; listed compactly.

| Name | Source | URL | Description | Topics | Status |
|---|---|---|---|---|---|
| DiagramHypergraph | various | https://github.com/WolframInstitute/DiagrammaticComputation | hypergraph view of a Diagram (Wolfram/DiagrammaticComputation PacletInfo symbol) | ruliology | seen |
| DiagramHypergraphRule | various | https://github.com/WolframInstitute/DiagrammaticComputation | hypergraph rewriting rule from a diagram rule (PacletInfo symbol) | ruliology | seen |
| `Wolfram/DiagrammaticComputation other symbols` | various | https://github.com/WolframInstitute/DiagrammaticComputation | Diagram DiagramComposition DiagramProduct DiagramSum DiagramTensor DiagramNetwork DiagramReplace DiagramRule SpiderDiagram Port ToDiagram FeynmanDiagram and about 80 more (PacletInfo symbol list) | ruliology | seen |
| `WolframInstitute/PiMachine symbols` | various | https://github.com/WolframInstitute/PiMachine | PiTerm PiType PiEval PiEvalTrace PiReduce PiInverse PiState PiMachineDiagram PiCombinator PiFunction PiPlus PiTimes PiMinus PiZero PiOne PiUnit PiHole PiChoice PiContinuation and predicates (PacletInfo symbol list, except PiType, which is declared in Kernel/Types.wl in the paclet context; Universal Reversible Machine) | ruliology | seen |
| `WolframInstitute/ProgramGames symbols` | various | https://github.com/WolframInstitute/ProgramGames | ProgramTournament ProgramIteratedGame TuringMachineTournament CellularAutomatonTournament FiniteStateMachineTournament RuleArrayTournament ComplexityLandscapeSearch GameSpaceSurvey EnumerateGames TuringMachineProgramSearch and 30 more (PacletInfo symbol list) | ruliology | seen |

### F. Repositories examined that define no reusable Wolfram Language functions

| Repository | What it is | Why no rows |
|---|---|---|
| WolframInstitute/SetReplace | fork of maxitg/SetReplace (parent confirmed by the API, last push 2025-01-14) | same symbols as the parent table |
| WolframInstitute/InfraUniverseRegistry | Infrageometry landscape of Wolfram Notable Universes; studies hypergraph states under generational rewriting with the WolframModel resource function; ball volume growth experiments | notebooks and cloud objects only, no Kernel |
| WolframInstitute/InfraFormalization | Lean 4 / Mathlib formalisation of the Wolfram-model hypergraph-rewriting bridge to general relativity and quantum mechanics | Lean, not Wolfram Language |
| WolframInstitute/UniversalityDB | A formally verified knowledge graph of computational universality proofs | Lean |
| WolframInstitute/InfraElements | An infrageometric implementation of Euclid's Elements | Python |
| WolframInstitute/NKS-C2C and NKS-C2C-site | Click-to-Copy code coverage for A New Kind of Science | notebooks, markdown list and a TypeScript site |
| WolframInstitute/ClaudePluginComputationalResearch | Wolfram-centric Claude plugin; scripts/search_wolfram_physics.wls searches wolframphysics.org glossary, archives, technical documents, tools and universe registry | shell script and skills, not a paclet |
| WolframInstitute/DigitalBoards, LivestreamMaterials | whiteboard images and livestream slides | no code |
| WolframInstitute/GeometricAlgebra, WolframBiology, LeanLink, Z3Link, GAPLink, MarkdownToNotebook, MathNotebook, WolframInstituteTools, WolframMediaWiki, Puzzles, SortingNetworks, NeuralLearnability, TreeSearch, Gym, PrimeIntellect, ShinkaEvolve, Rulie-Bot, demo-repository, ClaudePluginMarketplace | tooling, links to external systems, or unrelated domains | outside the topic |
| maxitg/WolframModelViewer | Unity viewer of Wolfram Model states | C#, no WL |
| maxitg/WolframPhysicsGallery | framework for the WolframPhysics universe registry and the visual gallery | README only |
| maxitg/wl-PlanckTime | Wolfram Language package for manipulating Planck Time | Kernel has only build data and usage helpers; no physics functions seen |
| maxitg/alien-worker, PlanckClock, TilingSolver, UsageString and older physics papers | unrelated or non-WL | outside the topic |
| JonathanGorard/LivestreamFiles | Notebook01.nb and Notes01.pdf from Twitch research sessions | notebook only |
| JonathanGorard/Cosmos, PhysicsFoundation, Labyrinth, SirHumphreyApplebot | C and C++ numerical relativity and plasma code, protocol verification | not WL |
| sw1sh/DiagramProcess, WolframClass, WolframPatterns, WolframLazy, WolframParser, Arrays, Algorithms, PAdic, OEIS, TinyGrad, thvm, WolframMCP | general Wolfram Language tooling | outside the topic |
| WolframResearch/QuantumFramework (rest) | quantum computation | only the multiway module is on topic |
| TopologicLogic/My-Own-Little-Universe, PaulSchulz/wolfram-physics, boulderpusher/hypergraphs, pfischer1687/wolfram-physics-project, ddyachkova/Wolfram_Physics_Project, dom1ns00/Stephen-Wolfram-Graphs-with-SetReplace-paclet, rossy-awan/wolfram-physics-notebooks | community notebooks and test files using SetReplace or the WolframModel resource function | notebooks only, no exported functions |


## Gaps

- No GitHub organization named WolframPhysicsProject or WolframPhysics exists, and Xerxes Arsiwalla has no GitHub account under xarsiwalla or any name the user search returns. Nothing from those sources.
- The Wolfram Physics Project archives (working notebooks, bulletins, universe registry) are not hosted on GitHub; the searches "wolframphysics archive" and "physics project archives notebooks wolfram" returned nothing. They live on wolframphysics.org (the ClaudePluginComputationalResearch script search_wolfram_physics.wls scrapes glossary, archives, technical documents, tools and universe registry from that site). maxitg/WolframPhysicsGallery is only a README describing the universe registry framework.
- JonathanGorard/Gravitas and JonathanGorard/Categorica README.md requests returned 404 through the API, so the Gravitas description is quoted from the WolframInstitute mirror and Categorica functions are listed from file names only.
- Wolfram/Lambda, WolframInstitute/NetworkSystem, sw1sh/WolframMetamathematics, JonathanGorard/Gravitas and Categorica define no usage messages in source, so their descriptions are paraphrases of the file or signature, not quotations.
- InfraCausality carries usage messages only for the Bondi k-calculus files; the other 44 exports are described from source comments.
- SetReplace WolframModelEvolutionObject properties (about 60 string properties) are recorded as a list, not as table rows, because they are not callable symbols.
- WolframInstitute/PureMath has about 3900 files; only the rewriting, causal set, curvature and path reconvergence modules were read. Other categories (Geometry, Topology, MathematicalPhysics beyond causal sets) were not swept.
- The resource function MultiEvaluate could not be resolved with ResourceObject in the kernel and is marked unconfirmed (it is a private cloud deployment, see Verification). MultiwayDeterministicTuringMachine was removed in verification because it exists nowhere. MultiwayTuringMachineSearch (TuringMachine README) is not in the paclet's PacletInfo but has a usage message in Kernel/Functions.wl and is marked seen.
- Documentation notebooks (.nb) of Wolfram/Lambda, Wolfram/Multicomputation (beyond the four documented symbols), Ruliobiology and QuantumFramework were not parsed beyond the Usage cells quoted.
- Community repositories from the searches (Python, Rust, TypeScript, Java, MATLAB implementations: sbinabdullah/wolframPy, kovasb/setreplace-py, sjqtentacles/multiway, lguibr/wolfram-physics-explorer, meta-graph/core, pirate/wolfram-gauge-physics, tsondru/irreducible, jerry-wnag/univer_dig_cod, RicardoUMC/HyperSim, Joe-Mruz/hgvisualizer, David-OConnor/graph, davebs/WolframPhysicsInPython, sim-0/wolfphys, rudimk/wolfram-physics-python, MartinDxt/simple-wolfram-physics-graph-theory-in-matlab, calebhskim/potato-physics, TimoDevGerman/WolframPhysics, kofi-bhr/wolfram-physics, alexfacehead/directed-graph-3D, walkthroughwonder/topological-light-propagation, Zaffer/rulial_space, mmtmn/rulial-space) define no Wolfram Language functions and were not opened.
- The kagi MCP server was down; only gh, WebFetch-free API calls and the local kernel were used.

## Verification

Verified on 2026-09-16 by a second agent, adversarially, row by row. The file had 185 rows; it has 184 after the one removal below. Status counts after verification: 183 seen, 1 unconfirmed.

Method:

- GitHub rows: the default-branch tarball of every repository named in a row was downloaded through the GitHub API (`gh api repos/OWNER/REPO/tarball`, account sw1sh) on 2026-09-16: maxitg/SetReplace, WolframInstitute/Hypergraph, HypergraphRewritingEngine, PureMath, Multicomputation, InfraCausality, PersistenceRewriting, Infrageometry, InfraAnalysis, InfraGaugeTheory, SyntheticInfrageometry, TuringMachine, CellularAutomaton, Ruliobiology, IteratedFiniteAutomaton, WolframLambda, DiagrammaticComputation, PiMachine, ProgramGames, sw1sh/WolframMetamathematics, maxitg/CombinatorEvolve, PostTagSystem, OrientedGraph, asheux/NetworkSystem, JonathanGorard/Gravitas, JonathanGorard/Categorica and GetJonWithIt/WolframPhysics; WolframResearch/QuantumFramework/QuantumFramework/Kernel/Multiway.m was fetched raw through the API. Every symbol named in a row was grepped for a definition, a PackageExport line, a usage message or a PacletInfo entry in the file the row's URL names (or in the repository when the row names a directory). The default branch of every repository in a row URL was checked with `gh api repos/OWNER/REPO` (all 28 match), and every URL path was checked to exist in the tarball tree (98 distinct URLs, all present). The Gravitas and Categorica rows list file names; each file defines the symbol of its name.
- The 1023 names in the bullet lists under the tables were grepped the same way over the whole downloaded tree: 1022 are defined; the one miss is the correction below.
- Function Repository rows: a scratch .wls evaluated `ResourceObject[name]["ResourceType"]`, `["Description"]` and `["ContributorInformation"]` for all 19 names (WL 15.0, TimeConstrained 60 seconds each). 17 resolve as Function resources with the descriptions quoted in the rows; MultiEvaluate and MultiwayDeterministicTuringMachine fail. Five rows (RandomWolframModel, TupleFromIndex, SelectSubsets, DiscreteHypersurfaceDecomposition, TraceCausalGraph) were also cross-checked against their WFR page with WebFetch: title, description and contributor match. The WFR URLs of the two failing names redirect to a wolframcloud login page (HTTP 302 to a 401 status), which is how nonexistent resource pages behave, while existing pages render.
- Paclet Repository: `PacletFindRemote["WolframInstitute/*"]` lists only Hypergraph, NetworkSystem, PiMachine, TuringMachine and Z3Link. WolframInstitute/Hypergraph 1.2.3 and WolframInstitute/NetworkSystem 1.1.5 were installed with PacletInstall in a scratch .wls: `` Names["WolframInstitute`Hypergraph`*"] `` gives exactly the 59 names in the Hypergraph rows (58 in PacletInfo plus CanonicalHypergraphGraded, exported from Kernel/HypergraphInsertionBracket.m) and `` Names["WolframInstitute`NetworkSystem`*"] `` exactly the 6 names in the NetworkSystem row. InfraCausality is not on the Paclet Repository (PacletInstall::notavail), so it was checked from source only.
- WL: `` Names["System`RulePlot"] `` is {RulePlot} on WL 15.0, so the RulePlot row is the built-in that SetReplace extends (Kernel/RulePlot.m unprotects it and adds WolframModel definitions). `` Names["System`Hypergraph*"] `` and `` Names["System`Multiway*"] `` are empty, so no paclet name in the tables collides with a built-in.

Corrected:

- `Type system symbols` row (SetReplace): MultisetToWolframModelEvolutionObject was removed from the symbol list and its bullet dropped. It is a kernel file name (Kernel/MultisetToWolframModelEvolutionObject.m defines an unexported type translation named toWolframModelEvolutionObject), not a symbol, and no symbol of that name exists in the source tree.
- MultiEvaluate: re-sourced from WFR to a private cloud resource function referenced by Wolfram/Multicomputation Kernel/WFR.m (nikm DeployedResources); the URL now points at that kernel file. Status stays unconfirmed: the WFR page does not exist, ResourceObject fails, and ResourceFunction on the cloud FunctionLocation did not load in the kernel, although Import of the DefinitionData cloud object returns an Association with UUID 6b979e16-9243-4be2-9c6c-80037b595d64.
- MultiwayTuringMachineSearch: status changed from unconfirmed to seen. It has a usage message in TuringMachine/Kernel/Functions.wl inside `` BeginPackage["WolframInstitute`TuringMachine`"] ``, is used in the README, and the URL now points at that file; it is still absent from the PacletInfo symbol list and docs/Symbols.
- `WolframInstitute/PiMachine symbols` row: PiType is not in the PacletInfo symbol list (PiTypeQ is); it is declared in Kernel/Types.wl in the paclet context as a HoldPattern. The description now says so.

Removed:

- MultiwayDeterministicTuringMachine (WFR row): the WFR URL redirects to a login, ResourceObject fails, and a web search for the exact name returns only MultiwayTuringMachine and MultiwayRegisterMachine. It exists nowhere.

Unconfirmed:

- MultiEvaluate (see above).
