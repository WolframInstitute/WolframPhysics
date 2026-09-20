---
Template: Guide
Name: Canonicalization
Title: Canonicalization and Isomorphism
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/Canonicalization
Description: Canonical forms and hashes of graphs, hypergraphs and rules, isomorphism tests, isomorphism and subgraph matching search, automorphism groups and symmetry, and the deduplication of states and events
Keywords: [canonicalization, canonical form, canonical hypergraph, isomorphism, graph isomorphism, hypergraph isomorphism, subgraph isomorphism, matching, automorphism group, symmetry, permutation group, orbit, hash, deduplication, state identity, relabeling]
RelatedGuides: [HypergraphRewriting, Hypergraphs, WolframModels, RuleSpace, RewritingEngines, GraphsAndNetworks, CategoriesAndFunctors]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)"]
---

## Abstract

Two states of a rewriting system are the same state when a relabeling of their
vertices carries one onto the other, and deciding that question is what lets an
evolution merge the states it reaches: canonical forms of graphs, hypergraphs and
rules, and the hashes that index them; tests of isomorphism for graphs, hypergraphs
and the other structures these models use; the search for an isomorphism itself and
for the matchings of a rule's left side inside a state; automorphism groups and the
symmetries they record; and the deduplication of states and events an evolution
performs as it runs.

## Functions

### Canonical Forms

- `CanonicalGraph` (WL) a canonical form of a graph, the same for every graph isomorphic to it
- [`CanonicalHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalHypergraph/) (WFR) a canonical version of a directed hypergraph, the form under which states are identified
- [`CanonicalHypergraphRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/CanonicalHypergraphRule.html) (WolframInstitute/Hypergraph) a canonical form of a hypergraph rule, with the vertices of both sides relabeled by consecutive integers
- [`CanonicalWolframModelRule`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalWolframModelRule/) (WFR) a canonical representation of a Wolfram model rule, the form under which rules are enumerated and compared
- [`CanonicalLinkedHypergraph`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) (Wolfram/Multicomputation) a canonical form of a linked hypergraph, the form a multicomputational evolution identifies its states by
- `IndexGraph` (WL) a graph with each vertex replaced by its integer index, the relabeling a canonical form ends in
- [`IndexHypergraph`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/IndexHypergraph.md) (SetReplace) a hypergraph with its vertices replaced by their vertex indices
- `Hash` (WL) a hash code of an expression, the key a canonicalized state is stored under
- [Ordered Hypergraph Canonicalization](https://www.wolframcloud.com/obj/wolframphysics/Documents/OrderedHypergraphCanonicalization.nb) (wolframphysics.org) the canonicalization of ordered hypergraphs, worked through as an algorithm

- `Sort` (WL), `SortBy` (WL), `Ordering` (WL), `OrderedQ` (WL), `Order` (WL), `KeySort` (WL), …
- [`CanonicalizeSymbols`](https://www.wolframcloud.com/obj/sw-writings0/ProofChallenge/CanonicalizeSymbols) (Writings), [`CanonicalizePatterns`](https://www.wolframcloud.com/obj/sw-writings0/ProofChallenge/CanonicalizePatterns) (Writings), …

### Isomorphism Tests

- `IsomorphicGraphQ` (WL) whether two graphs are isomorphic, two states the same up to a relabeling of their vertices
- [`IsomorphicHypergraphQ`](https://resources.wolframcloud.com/FunctionRepository/resources/IsomorphicHypergraphQ/) (WFR), [`IsomorphicHypergraphQ`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/IsomorphicHypergraphQ.md) (SetReplace) whether two orderless hypergraphs are isomorphic, as a resource function and as the paclet symbol of the same name
- [`IsomorphicOrderedHypergraphQ`](https://resources.wolframcloud.com/FunctionRepository/resources/IsomorphicOrderedHypergraphQ/) (WFR) whether two ordered hypergraphs are isomorphic, the test a Wolfram model state calls for
- [`HypergraphIsomorphismQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphIsomorphismQ.html) (WolframInstitute/PureMath) whether a hypergraph morphism is an isomorphism, bijective on vertices and on edge tokens
- `IsomorphicSubgraphQ` (WL) whether a graph has a subgraph isomorphic to another graph
- [`IGVF2IsomorphicQ`](https://github.com/szhorvat/IGraphM) (IGraphM) an isomorphism test for two graphs by the VF2 algorithm

- [`DisplacementIsomorphismQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl) (WolframInstitute/Infrageometry), [`IsomorphicFibersQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl) (WolframInstitute/InfraGaugeTheory), …

### Finding Isomorphisms and Matchings

- `FindGraphIsomorphism` (WL) an isomorphism that maps one graph to another by renaming vertices
- [`FindHypergraphIsomorphism`](https://resources.wolframcloud.com/FunctionRepository/resources/FindHypergraphIsomorphism/) (WFR) the isomorphisms between two orderless hypergraphs
- `FindSubgraphIsomorphism` (WL) a subgraph isomorphism mapping one graph onto a subgraph of another, the matching of a rule's left side inside a state
- `FindIsomorphicSubgraph` (WL) a subgraph of one graph isomorphic to another graph
- [`IGVF2FindSubisomorphisms`](https://github.com/szhorvat/IGraphM) (IGraphM) all the subgraph isomorphisms between two graphs by the VF2 algorithm
- `FindPermutation` (WL) a permutation that rearranges one list into another
- `Permute` (WL) an expression with its elements permuted according to a permutation

- `PermutationList` (WL), `PermutationCycles` (WL), `PermutationReplace` (WL), `InversePermutation` (WL), `PermutationProduct` (WL), `PermutationPower` (WL), `RandomPermutation` (WL), `Cycles` (WL), …

### Automorphisms and Symmetry

- `GraphAutomorphismGroup` (WL) the automorphism group of a graph, its symmetries as a permutation group
- [`HypergraphAutomorphismGroup`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/HypergraphAutomorphismGroup.md) (SetReplace) the automorphism group of a hypergraph given as a list of hyperedges
- [`RandomGraphAutomorphism`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) a sampled automorphism of a graph, for a symmetry group too large to list
- `PermutationGroup` (WL) the group generated by a set of permutations
- `GroupOrbits` (WL) the orbits of points under the action of a group, the vertices a symmetry identifies
- `GroupStabilizer` (WL) the subgroup fixing a given point, the symmetries that leave a vertex in place
- `VertexTransitiveGraphQ` (WL) whether the automorphism group of a graph acts transitively on its vertices, every vertex looking like every other
- `CycleIndexPolynomial` (WL) the cycle index polynomial of a permutation group, for counting states and rules up to symmetry
- [Local symmetries programs of the technical introduction](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-06/LocalSymmetries-01.wl) (wolframphysics.org) the vertex permutations that leave a Wolfram model rule unchanged, and the automorphism groups of the hypergraphs of a signature
- [What should space look like in the Wolfram Model?](https://community.wolfram.com/t/21398) (Wolfram Community) the rotation groups of balls in a Wolfram model state, read off the automorphisms of their subhypergraphs

- `GroupOrder` (WL), `GroupElements` (WL), `GroupGenerators` (WL), `GroupCentralizer` (WL), `GroupSetwiseStabilizer` (WL), `GroupElementToWord` (WL), `GroupElementFromWord` (WL), `SymmetricGroup` (WL), `CyclicGroup` (WL), `EdgeTransitiveGraphQ` (WL), …

### Identifying States and Events

- [`WolframModel`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/WolframModelAndWolframModelEvolutionObject.md) (SetReplace) an evolution whose `"EventDeduplication"` option merges events that take the same inputs to isomorphic outputs
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) rules applied in every possible way on a native engine, its `"StatesGraph"` holding one vertex for the states that different event orders reach alike
- [`TokenEventGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph/) (WFR) the token-event graph of a multicomputational evolution, with token, state and event deduplication options
- `DeleteDuplicatesBy` (WL) the elements of a list left distinct under a canonical form, the deduplication a states graph rests on
- `GatherBy` (WL) states gathered into classes by their canonical form
- [Coarse-graining state networks with approximate graph isomorphism](https://community.wolfram.com/t/18488) (Wolfram Community) coarse-graining of finite state networks by an approximate graph isomorphism, with hierarchical contraction of merging events

- `DeleteDuplicates` (WL), `Union` (WL), `Gather` (WL), `Tally` (WL), `Counts` (WL), …

### Wolfram Function Repository

- [`FindOrderedHypergraphIsomorphism`](https://resources.wolframcloud.com/FunctionRepository/resources/FindOrderedHypergraphIsomorphism/) the isomorphisms between two ordered hypergraphs
- [`FindCanonicalHypergraphIsomorphism`](https://resources.wolframcloud.com/FunctionRepository/resources/FindCanonicalHypergraphIsomorphism/) a canonical isomorphism between two hypergraphs
- [`EnumerateWolframModelRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateWolframModelRules/) the canonical Wolfram model rules with a given signature, one per class of rules alike under relabeling
- [`CanonicalBranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalBranchPairs/) the canonical branch pairs of a set of rules, independent of the initial condition
- [`NonIsomorphicComponents`](https://resources.wolframcloud.com/FunctionRepository/resources/NonIsomorphicComponents/) the components of a graph that are pairwise non-isomorphic
- [`FindGroupIsomorphism`](https://resources.wolframcloud.com/FunctionRepository/resources/FindGroupIsomorphism/) up to a given number of isomorphisms between two permutation groups
- [`CanonicalListRotation`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalListRotation/) a canonical rotation of a list of values, the representative cyclic orderings are compared by

- [`FindCanonicalHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/FindCanonicalHypergraph/), [`FindCanonicalWolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/FindCanonicalWolframModel/), [`EnumerateHypergraphs`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateHypergraphs/), …

### WolframInstitute/Hypergraph

- [WolframInstitute/Hypergraph](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/) a paclet of symbolic hypergraphs, hypergraph rules and their rewriting
- [`CanonicalHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/CanonicalHypergraph.html) a canonical form of a hypergraph, with its vertices relabeled by consecutive integers
- [`IsomorphicHypergraphQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/IsomorphicHypergraphQ.html) whether two hypergraph objects are isomorphic
- [`EnumerateHypergraphRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateHypergraphRules.html) the canonical hypergraph rewrite rules whose input and output have given numbers of hyperedges of each arity
- [`EdgeSymmetry`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EdgeSymmetry.html) the vertex permutations each hyperedge of a hypergraph is symmetric under
- [`ToOrderedHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/ToOrderedHypergraph.html) a hypergraph with ordered edge symmetry, every hyperedge expanded over its full symmetry group
- [`SimpleHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/SimpleHypergraph.html) a hypergraph with repeated-vertex hyperedges dropped and hyperedges agreeing up to their edge symmetry merged

- [`EnumerateHypergraphs`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateHypergraphs.html), [`EnumerateOrderedHypergraphs`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateOrderedHypergraphs.html), [`EnumerateWolframModelRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateWolframModelRules.html), [`CanonicalHypergraphGraded`](https://github.com/WolframInstitute/Hypergraph/blob/main/Kernel/HypergraphInsertionBracket.m), …

### WolframInstitute/PureMath

- [WolframInstitute/PureMath](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/guide/PureMath.html) a paclet extending the Wolfram Language across pure mathematics, carrying the order, structure and algebra isomorphisms of this topic
- [`OrderIsomorphismQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderIsomorphismQ.html) whether a bijection between two posets is an order isomorphism, preserving the order in both directions
- [`OrderAutomorphisms`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderAutomorphisms.html) the order automorphisms of a finite poset, the symmetries of a causal set
- [`StructureIsomorphismQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StructureIsomorphismQ.html) whether two finite structures over a common signature are isomorphic
- [`FindStructureIsomorphism`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FindStructureIsomorphism.html) an isomorphism between two finite structures, as an association from element to image
- [`ElementarilyEquivalentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ElementarilyEquivalentQ.html) whether two finite structures agree on every first-order sentence
- [`AlphaEquivalentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AlphaEquivalentQ.html) whether two first-order formulas are equal up to renaming of their bound variables
- [`LambdaAlphaEquivalentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaAlphaEquivalentQ.html) whether two lambda terms are equal up to renaming of their bound variables
- [`AlgebraIsomorphicQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AlgebraIsomorphicQ.html) whether two finite algebras are isomorphic under a signature-preserving bijection of their carriers
- [`QuotientAlgebra`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/QuotientAlgebra.html) the quotient of an algebra by a congruence, its carrier the congruence classes
