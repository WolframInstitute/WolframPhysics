---
Template: Guide
Name: HypergraphRewriting
Title: Hypergraph Rewriting
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/HypergraphRewriting
Description: Hypergraphs and the rules that rewrite them, the evolution of a Wolfram model, the enumeration and sampling of rule space, canonical forms and isomorphism, and the engines and sessions that run an evolution
Keywords: [hypergraph, hyperedge, rewriting, rule, wolfram model, evolution, event, rule space, rule enumeration, canonicalization, isomorphism, engine, session]
RelatedGuides: [WolframPhysics, Hypergraphs, WolframModels, RuleSpace, Canonicalization, RewritingEngines]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)"]
---

## Abstract

Hypergraph rewriting applies a set of rules to a hypergraph wherever they match, producing the states reached and the events that relate them: hypergraphs and the forms a rule takes; the evolution of a Wolfram model and what it returns; the enumeration, sampling and numbering of rule space; canonical forms and the identity of states up to isomorphism; and the engines and sessions that carry a long evolution. Each area has its own guide.

## Functions

### [Hypergraphs](paclet:WolframInstitute/WolframPhysics/guide/Hypergraphs)

- [`Hypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/Hypergraph.html) (WolframInstitute/Hypergraph) a hypergraph with the given hyperedges as a symbolic object, each hyperedge a list of vertices carrying its own edge symmetry
- `Rule` (WL) a rule that transforms its left side into its right side, the form of a hypergraph rewrite rule with a list of hyperedges on each side and each hyperedge a list of vertices
- [`HypergraphRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphRule.html) (WolframInstitute/Hypergraph) a hypergraph rewriting rule that replaces the hypergraph input with the hypergraph output
- `SubsetReplace` (WL) replacement of subsets of elements in a list regardless of where they occur, the low-level update behind hypergraph rewriting
- [`RandomHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomHypergraph/) (WFR) a random hypergraph with a given number of vertices and a given signature of hyperedge counts and arities

### [Wolfram Models](paclet:WolframInstitute/WolframPhysics/guide/WolframModels)

- [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR) the evolution of a Wolfram model with given rules from an initial condition for a number of generations
- [`WolframModelEvolutionObject`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelEvolutionObject/) (WFR) the result of an evolution, giving a generation's state by index and a named property such as `"StatesList"`, `"FinalState"` or `"TerminationReason"`
- [`WolframModelPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelPlot/) (WFR) a state drawn with its hyperedges as arrows and polygons, the standard picture of a generation
- [`TokenEventGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph/) (WFR) the tokens of an evolution joined to the events that create and destroy them
- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the multiway system of a Wolfram model rule, every branch of the updating followed at once

### [Rule Space](paclet:WolframInstitute/WolframPhysics/guide/RuleSpace)

- [`EnumerateWolframModelRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateWolframModelRules/) (WFR) the canonical Wolfram model rules with a given signature
- [`EnumerateHypergraphRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateHypergraphRules.html) (WolframInstitute/Hypergraph) the canonical hypergraph rewrite rules whose input and output have given numbers of hyperedges of each arity
- [`RandomWolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomWolframModel/) (WFR) a random canonical Wolfram model rule with a given signature
- [`CanonicalWolframModelRule`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalWolframModelRule/) (WFR) a canonical representation of a Wolfram model rule, the form under which rules are enumerated and compared
- [`WolframModelData`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelData/) (WFR) information on a Wolfram model from the Registry of Notable Universe Models

### [Canonicalization and Isomorphism](paclet:WolframInstitute/WolframPhysics/guide/Canonicalization)

- `CanonicalGraph` (WL) a canonical form of a graph, the same for every graph isomorphic to it
- [`CanonicalHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalHypergraph/) (WFR) a canonical version of a directed hypergraph, the form under which states are identified
- `IsomorphicGraphQ` (WL) whether two graphs are isomorphic, two states the same up to a relabeling of their vertices
- [`IsomorphicOrderedHypergraphQ`](https://resources.wolframcloud.com/FunctionRepository/resources/IsomorphicOrderedHypergraphQ/) (WFR) whether two ordered hypergraphs are isomorphic, the test a Wolfram model state calls for
- `FindSubgraphIsomorphism` (WL) a subgraph isomorphism mapping one graph onto a subgraph of another, the matching of a rule's left side inside a state
- `GraphAutomorphismGroup` (WL) the automorphism group of a graph, its symmetries as a permutation group

### [Rewriting Engines and Sessions](paclet:WolframInstitute/WolframPhysics/guide/RewritingEngines)

- [`WolframModel`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/WolframModelAndWolframModelEvolutionObject.md) (SetReplace) a Wolfram model evolution on a compiled engine, with `"EventSelectionFunction"` admitting multiway spacelike evolution beside the single-way default
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) rules applied to a hypergraph in every possible way on a native parallel engine, on a processor or a graphics target device
- `TimeConstrained` (WL) an evaluation stopped after a number of seconds, for an evolution or a search that may not halt
- `ParallelTable` (WL) a table of evolutions or measurements generated in parallel
- `PacletInstall` (WL) an engine paclet installed from the Paclet Repository, a cloud resource or a release asset
