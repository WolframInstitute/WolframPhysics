---
Template: Guide
Name: WolframModels
Title: Wolfram Models
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/WolframModels
Description: Running the evolution of a Wolfram model, the evolution object it returns, the states, generations, events and termination a run reports, event ordering and selection, single-way and multiway updating, and the programs and posts that drive a model
Keywords: [wolfram model, evolution, evolution object, state, generation, event, update, event ordering, event selection, termination reason, single-way, multiway, set substitution, multihistory, token event graph, foliation, backtrace, growth, hypergraph rewriting]
RelatedGuides: [HypergraphRewriting, Hypergraphs, RuleSpace, Canonicalization, RewritingEngines, MultiwaySystems, CausalGraphs, Visualization, CategoriesAndFunctors, DiscreteCurvature, HypergraphDimension]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)", "[Guide to Wolfram Physics Project functions](https://www.wolframcloud.com/obj/wolframphysics/Tools/guide-page)", "[Registry of Notable Universes](https://www.wolframphysics.org/universes/)", "[SetReplace on GitHub](https://github.com/maxitg/SetReplace)"]
---

## Abstract

A Wolfram model evolves a hypergraph by applying its rules wherever they match, and the evolution is the object of study: the evolution object a run returns and the properties it answers to; the states and generations it produces, how they grow and the behavior a model shows when it is perturbed or run to exhaustion; the events it records, the order in which competing matches are applied and the reason a run stops; and single-way updating beside the multiway system that keeps every branch.

## Functions

### The Evolution Object and Its Properties

- [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR) the evolution of a Wolfram model with given rules from an initial condition for a number of generations
- [`WolframModelEvolutionObject`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelEvolutionObject/) (WFR) the object such a run returns, giving a generation's state by index and a named property such as `"StatesList"`, `"FinalState"`, `"AllEventsList"`, `"EventsStatesList"`, `"VertexCountList"`, `"EdgeCountList"` or `"TerminationReason"` by name
- [`foliateWolframModelEvolutionObject`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) (Writings) an evolution object with its events reordered according to a foliation given as slices of event indices
- `SubsetCases` (WL) the subsets of a state matching the left side of a rule, the matches one generation of the object records
- [`WolframModelData`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelData/) (WFR) information on a Wolfram model from the Registry of Notable Universe Models
- [`ConnectedWolframModelQ`](https://resources.wolframcloud.com/FunctionRepository/resources/ConnectedWolframModelQ/) (WFR) whether a Wolfram model rule is left-connected

### States, Generations and Behavior

- [`WolframModelPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelPlot/) (WFR) a state drawn with its hyperedges as arrows and polygons, the standard picture of a generation
- [`WolframModelRulePlot`](https://www.wolframcloud.com/obj/wolframphysics/WolframModelRulePlot) (Writings) a Wolfram model rule drawn with its input and output hypergraphs side by side
- [`WolframModelHistoryPlots`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) (Writings) the states of an evolution plotted with the newly created edges highlighted
- `FindSequenceFunction` (WL) a simple function that yields a given sequence, fitted to the vertex or edge counts of successive generations
- `ListLinePlot` (WL) the vertex or edge count of each generation plotted as the growth curve of a state

- [Studying state transition diagrams in finite Wolfram Models](https://community.wolfram.com/t/16360) (Wolfram Community) the transition graph on the states of a finite Wolfram model, with the attractors and transients of its evolution
- [Exploring CPT invariance in Wolfram Models](https://community.wolfram.com/t/16337) (Wolfram Community) reversibility and time invariance of update rules, tested across the registry of notable universes
- [Studying Localization of Perturbations in Hypergraph Evolution](https://community.wolfram.com/t/21391) (Wolfram Community) reversed hyperedges as perturbations, and how many hyperedges each one affects as the evolution proceeds
- [Classify growth rates for Wolfram Models](https://community.wolfram.com/t/16338) (Wolfram Community) the rules of a signature classified by how fast the states they produce grow
- [Multiple transformation rules that give slow growth](https://community.wolfram.com/t/16448) (Wolfram Community) rule sets searched for slow growth of the hypergraph they generate
- [Evolution of (hyper)graph invariants under (hyper)graph rewritings](https://community.wolfram.com/t/16398) (Wolfram Community) hypergraph invariants of complexity, symmetry and robustness followed through a rewriting
- [Colour-decorated hypergraph rewriting: growth to Q102 and the Standard-Model gauge sectors](https://community.wolfram.com/t/27062) (Wolfram Community) a rewriting system on ternary hyperedges whose atoms carry color decorations, read for its gauge sectors
- [Studying behavior of simple network rewriting system](https://community.wolfram.com/t/22397) (Wolfram Community) trivalent networks generated by random Wolfram model rewrites, compared with the planar diagrams of a cubic scalar field theory

- `VertexCount` (WL), `EdgeCount` (WL), `Differences` (WL), `Accumulate` (WL), `ListStepPlot` (WL), `ListLogPlot` (WL), …

### Events, Their Ordering and Termination

- [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR) the order in which competing matches are applied, set by the `"EventOrderingFunction"` option with criteria such as `"LeastRecentEdge"`, `"RuleOrdering"` and `"Random"`
- [`TokenEventGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph/) (WFR) the tokens of an evolution joined to the events that create and destroy them
- [`TwoWayHypergraphTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayHypergraphTokenEventGraph) (Writings) the token-event graph of a hypergraph rewriting system with every rule applied in both directions
- `TimeConstrained` (WL) an evaluation stopped after a number of seconds, for an evolution that may not terminate

- `MemoryConstrained` (WL), `SeedRandom` (WL), `AbsoluteTiming` (WL), `Monitor` (WL), …

### Single-Way and Multiway Updating

- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the multiway system of a Wolfram model rule, every branch of the updating followed at once
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) rules applied to a hypergraph in every possible way on a native parallel engine, with the states and events of the multiway system among its properties
- [`GenerationalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/GenerationalMultiwaySystem/) (WFR) the evolution of a generational multiway system, every event of a generation applied at once
- [`WolframModelGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelGlocalMultiwaySystem/) (WFR) the evolution of a Wolfram model as a glocal multiway system, global events combined with the individual tokens of a local one
- [`ApplyWolframModelRules`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) (Wolfram/Multicomputation) one multiway step of Wolfram model rules on a linked hypergraph, every event kept with its input and output edges, the rule application behind a Wolfram model `Multi`
- [`WolframModelMulti`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) (Wolfram/Multicomputation) a Wolfram model as a Multi object, its rules applied to a linked hypergraph in every possible way
- `ReplaceList` (WL) all the results of transforming an expression by a rule in every possible way, one multiway update step

### SetReplace

- [SetReplace](https://github.com/maxitg/SetReplace) the paclet that implements Wolfram model evolution as set substitution on a compiled engine, with its own evolution object and property catalogue
- [`WolframModel`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/WolframModelAndWolframModelEvolutionObject.md) the evolution on a compiled engine, its `"EventSelectionFunction"` option admitting multiway spacelike updating beside the single-way default
- [`WolframModelEvolutionObject`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/WolframModelAndWolframModelEvolutionObject.md) the evolution object a run returns, answering `"StatesList"`, `"AllEventsList"`, `"EventsStatesList"`, `"ExpressionsEventsGraph"` and `"TerminationReason"` among its properties
- [`SetReplace`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/SetReplace.md) a single replacement of a subset of a set matching a rule's input by its output, the set substitution step an evolution repeats
- [`SetReplaceList`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/SetReplace.md) every intermediate set produced by a given number of replacements
- [`SetReplaceAll`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/SetReplace.md) one sweep of replacements in which no expression is touched twice, the generational update
- [`SetReplaceFixedPoint`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/SetReplace.md) the final set reached when replacements are applied until no further event matches
- [`SetReplaceFixedPointList`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/SetReplace.md) every intermediate set on the way to that fixed point
- [`$SetReplaceMethods`](https://github.com/maxitg/SetReplace/blob/master/Kernel/setSubstitutionSystem.m) the implementations a replacement step can run on, the compiled one and the symbolic one
- [Plots of the states of an evolution](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/Properties/PlotsOfStates.md) the `"FinalStatePlot"` and `"StatesPlotsList"` properties of an evolution object
- [Plots of the events of an evolution](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/Properties/PlotsOfEvents.md) the `"EventsStatesPlotsList"` property, which draws the events beside the states they produce
- [`GenerateMultihistory`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/GenerateMultihistory.md) a multihistory of every history of a system from an initial state, under event-selection and stopping parameters
- [`GenerateSingleHistory`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/GenerateSingleHistory.md) the one history obtained when a single event is chosen at each step
- [`Multihistory`](https://github.com/maxitg/SetReplace) the object holding the evaluation of a possibly nondeterministic system, convertible to a Wolfram model evolution object
- [`MultisetSubstitutionSystem`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Systems/MultisetSubstitutionSystem.md) a system replacing submultisets of tokens matching patterns in any order by the result of an expression
- [`$SetReplaceSystems`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/%24SetReplaceSystems.md) the computational systems a generator can evaluate, the atomic state and multiset substitution systems
- [`$SetReplaceGenerators`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/%24SetReplaceGenerators.md) the generators that evaluate a system, one for every history and one for a single history
- [`MaxGeneration`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/MaxGeneration.md) the generation at which the evolution of a history stops
- [`MaxEvents`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/MaxEvents.md) the number of events after which the evolution of a history stops
- [`MaxDestroyerEvents`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/MaxDestroyerEvents.md) how many events may consume the same token, single-way updating at one and multiway above it
- [`$SetReplaceTypes`](https://github.com/maxitg/SetReplace/blob/master/Documentation/TypeSystem/%24SetReplaceTypes.md) the object types the type system defines, each with its version
- [`$SetReplaceTypeGraph`](https://github.com/maxitg/SetReplace/blob/master/Documentation/TypeSystem/%24SetReplaceTypeGraph.md) the graph of types, properties and the translation paths between them
- [`SetReplaceType`](https://github.com/maxitg/SetReplace/blob/master/Documentation/TypeSystem/SetReplaceType.md) a type of the type system, a name with a version, the form in which the type of an object is reported
- [`SetReplaceProperty`](https://github.com/maxitg/SetReplace/blob/master/Documentation/TypeSystem/SetReplaceProperty.md) a property of the type system, a vertex of the type graph
- [`SetReplaceMethodImplementation`](https://github.com/maxitg/SetReplace/blob/master/Documentation/TypeSystem/SetReplaceMethodImplementation.md) the implementation of a translation or a property, a vertex of the type graph

- [`MaxEventInputs`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/MaxEventInputs.md), [`MinEventInputs`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/MinEventInputs.md), [`SetReplaceSystemParameters`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/SetReplaceSystemParameters.md), [`AtomicStateSystem`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Systems/AtomicStateSystem.md), [`$WolframModelProperties`](https://github.com/maxitg/SetReplace), [`$SetReplaceProperties`](https://github.com/maxitg/SetReplace), [`SetReplaceTypeConvert`](https://github.com/maxitg/SetReplace/blob/master/Documentation/TypeSystem/SetReplaceTypeConvert.md), [`SetReplaceObjectQ`](https://github.com/maxitg/SetReplace/blob/master/Documentation/TypeSystem/SetReplaceObjectQ.md), [`SetReplaceObjectType`](https://github.com/maxitg/SetReplace/blob/master/Documentation/TypeSystem/SetReplaceObjectType.md), …

### wolframphysics.org

- [Hands-On Introduction to the Wolfram Physics Project](https://www.wolframcloud.com/obj/wolframphysics/Tools/hands-on-introduction-to-the-wolfram-physics-project.nb) a computational essay for getting started exploring Wolfram models, from a first universe to the symbolic representation of its evolution
- [`WolframModelTest`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-06/WolframModelTest.wl) a rule run from an automatic initial condition under limits on vertices, edges, events, generations and time
- [`ShowSamples`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-03/RandomRules.wl) a survey of many rules run in parallel, each shown as a small plot of its final state
- [`ShowSamplesAM`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-03/RandomRules.wl) the same survey with each final-state plot paired with the adjacency matrix of its state graph
- [`ElementsBacktrace`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-06/ElementsBacktrace.wl) the ancestry tree of a hyperedge, its edge indices replaced by the hyperedges themselves
- [`FullBacktrace`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-06/ElementsBacktrace.wl) the complete ancestry of a hyperedge, backtrace steps taken until the initial condition is reached
- [`BacktraceStep`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-06/ElementsBacktrace.wl) one step back in the history of a hyperedge, the event that created it together with the edges it consumed
- [`unorderedHypergraphEvolutionStatesPlots`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/AlternativeFormulations.wl) plots of the states of an evolution whose rule is stated in unordered hypergraph form
