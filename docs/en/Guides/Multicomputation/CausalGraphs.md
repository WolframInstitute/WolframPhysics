---
Template: Guide
Name: CausalGraphs
Title: Causal Graphs
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/CausalGraphs
Description: Causal graphs of events, causal order and transitive reduction, light cones and causal connection, causal invariance and branch pairs, and the foliations and observer frames a causal graph admits
Keywords: [causal graph, event, causal edge, causal order, transitive reduction, transitive closure, topological sort, light cone, causal interval, causal connection, causal invariance, total causal invariance, branch pair, critical pair, confluence, Knuth-Bendix completion, unification, foliation, reference frame, observer chain, coordinatization, directed acyclic graph]
RelatedGuides: [Multicomputation, MultiwaySystems, BranchialGraphs, RulialSpace, CausalSets, RelativityAndFoliations, WolframModels]
Links: ["[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)"]
---

## Abstract

A causal graph records which events of a rewriting depend on which: the events of an evolution
and the edges by which one event uses what another produced; the causal order those edges
generate, its transitive reduction and the sequential orderings consistent with it; the future
and past light cones of an event and the causal connection between regions; causal invariance,
where every branch of a multiway system yields the same causal graph, and the branch pairs that
decide it; and the foliations that slice a causal graph into successive moments for an observer.

## Functions

### Causal Graphs of Events

- `Graph` (WL) a directed graph of events and the causal edges between them, the form a causal graph takes
- [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR), [`WolframModel`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/Properties/CausalGraphs.md) (SetReplace) the causal graph of a Wolfram model evolution as its `"CausalGraph"` property, events as vertices and an edge for each hyperedge one event creates and another destroys
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) the causal graph of a native multiway hypergraph rewriting as its `"CausalGraph"` property, event vertices joined by directed edges for the causal relation
- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the causal graph across all branches of a multiway system as its `"CausalGraph"` property, with `"EvolutionCausalGraph"` joining it to the states
- [`CausalGraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation) the causal graph of a multicomputational evolution, its events the rewriting steps of a `Multi` object
- [`LambdaCausalGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaCausalGraph.html) (Wolfram/Lambda) the causal graph of a single beta reduction sequence of a lambda expression, its events the beta substitutions

- `DirectedEdge` (WL), `VertexList` (WL), `EdgeList` (WL), `Subgraph` (WL), `ReverseGraph` (WL), …
- [`EvolutionCausalGraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation), [`CausalStatesGraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation), [`CausalBranchialGraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation), [`LambdaCausalEvolutionGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaCausalEvolutionGraph.html) (Wolfram/Lambda), [`LambdaMultiwayCausalEvolutionGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaMultiwayCausalEvolutionGraph.html) (Wolfram/Lambda), …

### Causal Order and Transitive Reduction

- `TransitiveReductionGraph` (WL) the transitive reduction of a causal graph, keeping only the causal edges no longer path already implies
- `TransitiveClosureGraph` (WL) the transitive closure of a causal graph, an edge for every pair of events one of which causally precedes the other
- `TopologicalSort` (WL) the events of a causal graph in an order consistent with every causal edge, one sequential updating order
- `LayeredGraph` (WL) a causal graph rebuilt as a graph whose vertices sit in the layers a layered plot gives them
- [`FindLongestPath`](https://resources.wolframcloud.com/FunctionRepository/resources/FindLongestPath/) (WFR) the longest path between two vertices of a directed acyclic graph, the longest chain of events through a causal graph

- `AcyclicGraphQ` (WL), `VertexInDegree` (WL), `VertexOutDegree` (WL), `GraphLayers` (WL), `LayeredGraph3D` (WL), …

### Light Cones and Causal Connection

- `VertexOutComponent` (WL), `VertexInComponent` (WL) the future and past light cones of an event, the events with a directed path from it and the events with a directed path to it, within an optional path length
- `VertexOutComponentGraph` (WL), `VertexInComponentGraph` (WL) the future and past light cones of an event as subgraphs of the causal graph
- [`AcyclicGraphTake`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/AcyclicGraphTake.md) (SetReplace) the intersection of the in-component of one vertex with the out-component of another in an acyclic graph, the causal interval between two events
- [`CausalConnectionGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CausalConnectionGraph/) (WFR) the relations between regions of causally equivalent events in a causal graph, a directed edge where one future light cone contains another and an undirected edge where two overlap
- [Hunting for black holes](https://community.wolfram.com/t/16372) (Wolfram Community) black hole detection in Wolfram models from the causal connection graph

### Causal Invariance and Branch Pairs

- [`CausalInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/CausalInvariantQ/) (WFR) whether a multiway system is causal invariant after a number of steps from an initial condition, every branch of its evolution yielding an isomorphic causal graph
- [`TotalCausalInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/TotalCausalInvariantQ/) (WFR) whether a multiway system is total causal invariant after a number of steps, from its rules alone
- [`BranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairs/) (WFR) the branch pairs of a multiway system after a number of steps, the pairs of states reached from a common state by two different rule applications
- [`CanonicalBranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalBranchPairs/) (WFR) the canonical branch pairs of a set of rules, independent of the initial condition, sorted into resolved and unresolved after a number of steps
- [`KnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/KnuthBendixCompletion/) (WFR) the Knuth-Bendix completion rules of a multiway system after a number of steps, the rewrite rules that would resolve its branch pairs
- [`MultiwaySystem`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/MultiwaySystem.html) (Wolfram/Multicomputation) a multiway system whose `"BranchPairsList"`, `"CanonicalBranchPairsList"` and `"CausalInvariantQ"` properties report its branch pairs and whether they resolve
- [`HypergraphUnifications`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/HypergraphUnifications.md) (SetReplace) all the hypergraphs that contain subgraphs matching both of two hypergraphs, the overlaps of rule inputs that decide causal invariance
- [`HypergraphUnificationsPlot`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/HypergraphUnifications.md) (SetReplace) the unifications of two hypergraphs drawn as plots, the shared subgraph highlighted in each
- [`HypergraphCriticalPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphCriticalPairs.html) (WolframInstitute/PureMath) the critical pairs of two double-pushout hypergraph rewriting rules, the parallel-dependent pairs of steps out of the overlaps of their left-hand sides
- [`HypergraphParallelIndependentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphParallelIndependentQ.html) (WolframInstitute/PureMath) whether two double-pushout rewrite steps out of the same hypergraph state are parallel independent, applicable in either order with the same result
- [`HypergraphSequentialIndependentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphSequentialIndependentQ.html) (WolframInstitute/PureMath) whether a two-step double-pushout derivation is sequentially independent, its second step not depending on the first
- [`StringRewritingCriticalPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingCriticalPairs.html) (WolframInstitute/PureMath) the critical pairs of a string rewriting system, the shortest words carrying two overlapping redexes together with their two one-step reducts
- [`StringRewritingConfluentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingConfluentQ.html) (WolframInstitute/PureMath) whether a string rewriting system is confluent, decided by sound criteria on its critical pairs
- [Confluent Set Substitution Systems](https://community.wolfram.com/t/14367) (Wolfram Community) set substitution systems made confluent by adding rules that resolve their critical pairs

### Foliations and Reference Frames

- [`GraphFoliations`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphFoliations/) (WFR) the possible foliations of a directed acyclic graph into successive slices, the reference frames an observer can put on a causal graph
- [`Coordinatize`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/Coordinatize) (Wolfram Cloud) the coordinates of the events of a causal graph with respect to an observer chain, with an optional foliation
- [`CoordinatizeCausalGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Chains.wl) (WolframInstitute/Infrageometry) two-dimensional coordinates for the events of a causal graph from a pair of observer chains, two observers taken as the axes
- [Foliation lines programs](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-05/FoliationLines.wl) (wolframphysics.org) the technical introduction program file that draws foliation lines between the slices of a causal graph
- [Causal foliations programs](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-05/CausalFoliations-01.wl) (wolframphysics.org) the technical introduction program file with regular diamond-shaped causal graphs, straight foliation lines and the Lorentz boost of a spacetime point
- [Relativistic mass transformations from simple causal graph](https://community.wolfram.com/t/17402) (Wolfram Community) Lorentz boosts of the foliation of a causal graph, built on the foliation programs of the technical introduction
- [The equivalence principle, hyperbolic geometry and gyrogeometry](https://community.wolfram.com/t/24196) (Wolfram Community) Lorentz and Rindler coordinates on causal graph foliations, for accelerated frames
- [On motion and special relativity in Wolfram Models](https://community.wolfram.com/t/24206) (Wolfram Community) relativistically coherent Wolfram models, the ones that transform from one reference frame to another

### Wolfram Function Repository

- [`SubstitutionSystemCausalGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalGraph/) the causal graph of a string substitution system evolved with the standard updating order, plain or layered
- [`SubstitutionSystemCausalEvolution`](https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalEvolution/) the evolution of a substitution system together with its causal structure, under a forward, backward, first or random updating scheme
- [`TraceCausalGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TraceCausalGraph/) the causal graph of an expression evaluation, built from its evaluation trace, with the evaluation path and its events graph as further properties
- [`LowestCommonAncestors`](https://resources.wolframcloud.com/FunctionRepository/resources/LowestCommonAncestors/) the lowest common ancestors of vertices in a directed acyclic graph, the latest events in the common past of several events

- [`CausallyInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/CausallyInvariantQ/), [`BranchPairResolutions`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairResolutions/), [`CanonicalKnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalKnuthBendixCompletion/), [`StringOverlaps`](https://resources.wolframcloud.com/FunctionRepository/resources/StringOverlaps/), [`StringOverlapsQ`](https://resources.wolframcloud.com/FunctionRepository/resources/StringOverlapsQ/), [`OverlapFreeStringTuples`](https://resources.wolframcloud.com/FunctionRepository/resources/OverlapFreeStringTuples/), [`SubstitutionSystemCausalPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalPlot/), [`FoliationClass`](https://resources.wolframcloud.com/FunctionRepository/resources/FoliationClass/), [`VertexStratify`](https://resources.wolframcloud.com/FunctionRepository/resources/VertexStratify/), [`TraceGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TraceGraph/), [`TraceTree`](https://resources.wolframcloud.com/FunctionRepository/resources/TraceTree/), [`ToDirectedAcyclicGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/ToDirectedAcyclicGraph/), …

### WolframInstitute/InfraCausality

- [WolframInstitute/InfraCausality](https://github.com/WolframInstitute/InfraCausality) a paclet for the causal structure of finite causal graphs, their light cones, light rays, chains and relativistic kinematics
- [`ForwardLightCone`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl), [`BackwardLightCone`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) the forward and backward light cones of a vertex in a finite directed causal graph, out to a given length
- [`CausalInterval`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) the causal interval between two vertices, the future of the first intersected with the past of the second
- [`ChainCausalInterval`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) the causal closure of a chain, the events both reachable from it and able to reach it
- [`FindChain`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraCausality.wl) chains between two vertices of a causal graph, the worldlines of observers
- [`UniversalFoliation`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl), [`UniversalTime`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) the universal foliation of a causal graph and the universal time it assigns to each event
- [`OutgoingLightRays`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl), [`IncomingLightRays`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) the events lying on the outgoing and the incoming null geodesics of an event
- [`MaximalEmitter`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl), [`MaximalAbsorber`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) the events of each slice whose forward and whose backward light cone is the largest
- [`GetSources`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/Tools.wl), [`GetSinks`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/Tools.wl) the events of a causal graph with no cause and the events with no effect
- [`InfraEvent`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl), [`InfraChain`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl) an event and a chain of a causal graph, each holding several realizations at once
- [`InfraLightRay`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl), [`InfraLightCone`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl), [`InfraCausalInterval`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl) a light ray, a light cone and a causal interval, each holding several realizations at once

- [`InfraEventQ`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl), [`InfraChainQ`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl), [`InfraLightRayQ`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl), [`InfraLightConeQ`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl), [`InfraCausalIntervalQ`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraObjects.wl), …
