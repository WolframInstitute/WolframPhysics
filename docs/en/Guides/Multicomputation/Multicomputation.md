---
Template: Guide
Name: Multicomputation
Title: Multicomputation
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/Multicomputation
Description: Multiway systems and multihistories, causal graphs and causal invariance, branchial graphs and quantum observers, and rulial space and the observers that coordinatize it
Keywords: [multiway system, multihistory, multicomputation, branching, causal graph, causal invariance, branchial graph, branchial distance, quantum observer, entanglement, rulial space, ruliad, observer, foliation]
RelatedGuides: [WolframPhysics, MultiwaySystems, CausalGraphs, BranchialGraphs, RulialSpace]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)"]
---

## Abstract

Multicomputation follows every branch of a nondeterministic rewriting at once and reads the structure of the whole set of histories: multiway systems and the multihistories they generate; the causal graph of events and the invariance of the causal order across branches; the branchial graph, branchial distance and the quantum observers that live on it; and rulial space, where a whole rule space is applied together and an observer takes its own coordinates. Each area has its own guide.

## Functions

### [Multiway Systems](paclet:WolframInstitute/WolframPhysics/guide/MultiwaySystems)

- `ReplaceList` (WL) all the results of transforming an expression by a rule or list of rules in every possible way, one multiway step of an expression rewriting system
- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the multiway system of a string, list, cellular automaton or Wolfram model rule, with `"StatesGraph"`, `"EvolutionGraph"`, `"CausalGraph"` and `"BranchialGraph"` among its properties
- [`Multi`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/Multi.html) (Wolfram/Multicomputation) an object that acts as several expressions at once, the lazy nondeterministic rewriting system of an expression under rules
- `NestGraph` (WL) the graph of the states reached by applying a function repeatedly, the multiway graph of any successor function
- [`BranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairs/) (WFR) the branch pairs of a multiway system after a number of steps, the pairs of states reached from a common state by two different rule applications

### [Causal Graphs](paclet:WolframInstitute/WolframPhysics/guide/CausalGraphs)

- [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR) the causal graph of a Wolfram model evolution as its `"CausalGraph"` property, events as vertices and an edge for each hyperedge one event creates and another destroys
- `TransitiveReductionGraph` (WL) the transitive reduction of a causal graph, keeping only the causal edges no longer path already implies
- `VertexOutComponent` (WL), `VertexInComponent` (WL) the future and past light cones of an event, the events with a directed path from it and the events with a directed path to it, within an optional path length
- [`CausalInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/CausalInvariantQ/) (WFR) whether a multiway system is causal invariant after a number of steps from an initial condition, every branch of its evolution yielding an isomorphic causal graph
- [`GraphFoliations`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphFoliations/) (WFR) the possible foliations of a directed acyclic graph into successive slices, the reference frames an observer can put on a causal graph

### [Branchial Graphs and Quantum Observers](paclet:WolframInstitute/WolframPhysics/guide/BranchialGraphs)

- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) the `"BranchialGraph"` of a native multiway hypergraph rewriting, state vertices joined by undirected branchial edges
- [`BranchialGraphs`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchialGraphs/) (WFR) time-indexed branchial graphs of any directed acyclic graph, joining the vertices a chosen foliation makes simultaneous
- `GraphDistance` (WL) the branchial distance between two states, the shortest path joining them in the branchial graph
- [`QuantumState`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumState.html) (Wolfram/QuantumFramework) a pure or mixed quantum state expressed in a quantum basis
- [`QuantumToMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumToMultiwaySystem/) (WFR) a quantum evolution simulated as a multiway system, the operator and basis compiled to rules and the state vector to an initial condition

### [Rulial Space](paclet:WolframInstitute/WolframPhysics/guide/RulialSpace)

- [`EnumerateWolframModelRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateWolframModelRules/) (WFR) the canonical Wolfram model rules with a given signature, the rule space a rulial hypergraph evolution runs over
- [`EnumerateRuleSignatures`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateRuleSignatures/) (WFR) the rule signatures open to substitution systems and Wolfram models with a given number of elements, the addresses of the rule spaces themselves
- [`CoordinatizeCausalGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Chains.wl) (WolframInstitute/Infrageometry) two-dimensional coordinates for the events of a causal graph from a pair of observer chains, two observers taken as the axes
- [`SpatialReconstruction`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the spatial relation graph reconstructed from a slice of a causal graph after a number of steps, the space an observer on that slice sees
