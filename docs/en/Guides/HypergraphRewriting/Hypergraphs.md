---
Template: Guide
Name: Hypergraphs
Title: Hypergraphs
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/Hypergraphs
Description: Hypergraphs and hyperedges, the forms a rewriting rule takes, how a rule matches and is applied, the conservation laws of a rule, hypergraphs read as graphs with their adjacency and incidence structure, and random and enumerated hypergraphs
Keywords: [hypergraph, hyperedge, edge symmetry, ordered hypergraph, subhypergraph, hypergraph rule, pattern rule, rule signature, rewriting, matching, subset replacement, conservation law, effect vector, 2-section, line graph, incidence matrix, adjacency tensor, hypermatrix, random hypergraph, hypergraph enumeration, hypergraph predicate]
RelatedGuides: [HypergraphRewriting, WolframModels, RuleSpace, Canonicalization, RewritingEngines, MultiwaySystems, GraphsAndNetworks, Visualization, CategoriesAndFunctors, StringDiagrams, SyntheticGeometry]
Links: ["[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)", "[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)"]
---

## Abstract

A hypergraph is a collection of hyperedges, each a list of vertices, and a rewriting rule replaces part of one hypergraph by another wherever it matches: hypergraphs and the hyperedges they are built from; the forms a rule takes, from plain pattern rules to hypergraph rule objects and rule signatures; how a rule matches a state and what applying it does; the conservation laws that hold under every application; hypergraphs read as graphs, through their 2-sections and their adjacency and incidence structure; and hypergraphs drawn at random or enumerated by signature.

## Functions

### Hypergraphs and Hyperedges

- [`Hypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/Hypergraph.html) (WolframInstitute/Hypergraph) a hypergraph with the given hyperedges as a symbolic object, each hyperedge a list of vertices carrying its own edge symmetry
- [`Hyperedge`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/Hyperedge.html) (WolframInstitute/Hypergraph) one hyperedge on a list of vertices, for use inside a hypergraph edge specification
- [`EdgeSymmetry`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EdgeSymmetry.html) (WolframInstitute/Hypergraph) the vertex permutations each hyperedge of a hypergraph is symmetric under
- [`ToOrderedHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/ToOrderedHypergraph.html) (WolframInstitute/Hypergraph) a hypergraph with ordered hyperedges, every hyperedge expanded over its edge symmetry group
- [`SimpleHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/SimpleHypergraph.html) (WolframInstitute/Hypergraph) a hypergraph with repeated-vertex hyperedges dropped and hyperedges agreeing up to symmetry merged
- [`Subhypergraph`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/Subhypergraph.md) (SetReplace) the hyperedges of a hypergraph that are subsets of a given list of vertices
- [`WeakSubhypergraph`](https://github.com/maxitg/SetReplace) (SetReplace) the hyperedges of a hypergraph with any vertex in a given list
- [`IndexHypergraph`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/IndexHypergraph.md) (SetReplace) a hypergraph with its vertices replaced by their vertex indices

### Rules and Rule Forms

- `Rule` (WL) a rule that transforms its left side into its right side, the form of a hypergraph rewrite rule with a list of hyperedges on each side and each hyperedge a list of vertices
- `RuleDelayed` (WL) a rule whose right side is evaluated only after the rule is used, the form a pattern rule takes when its right side creates new vertices
- [`HypergraphRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphRule.html) (WolframInstitute/Hypergraph) a hypergraph rewriting rule that replaces the hypergraph input with the hypergraph output
- [`ToPatternRules`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/ToPatternRules.md) (SetReplace) the explicit pattern rules of a set substitution system equivalent to a list of hypergraph rules
- [`WolframModelRuleValue`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/WolframModelRuleValue.md) (SetReplace) a property of a rule readable without running it, its signature, connectivity or maximum arity among them

### Matching and Applying a Rule

- `SubsetReplace` (WL) replacement of subsets of elements in a list regardless of where they occur, the low-level update behind hypergraph rewriting
- `SubsetCases` (WL) the subsets of a list matching a pattern, the matches a rule's left side has in a state
- `SubsetPosition` (WL) the positions at which the subsets matching a pattern occur
- `ReplaceAll` (WL) a rule or list of rules applied to transform each subpart of an expression, the rewriting the language itself performs
- [`HighlightRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HighlightRule.html) (WolframInstitute/Hypergraph) graphics highlighting every way a rule matches a hypergraph, together with the result of each rewrite

- `Pattern` (WL), `Blank` (WL), `BlankSequence` (WL), `BlankNullSequence` (WL), `PatternSequence` (WL), `OrderlessPatternSequence` (WL), `Condition` (WL), `PatternTest` (WL), `Alternatives` (WL), `Except` (WL), `HoldPattern` (WL), `Verbatim` (WL), `Repeated` (WL), `RepeatedNull` (WL), `Longest` (WL), `Shortest` (WL), `Orderless` (WL), `Flat` (WL), `Cyclic` (WL), …
- `Replace` (WL), `MatchQ` (WL), `Cases` (WL), `Position` (WL), …

### Conservation Laws under Rewriting

- [`RewritingEffectVector`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RewritingEffectVector.html) (WolframInstitute/PureMath) the net effect of one application of a rule on the counts of each letter or edge type of a state, the Parikh abstraction that forgets all attachment structure
- [`RewritingConservationLaws`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RewritingConservationLaws.html) (WolframInstitute/PureMath) a basis of the integer conservation laws of a list of rules, the linear functionals on type counts that every rule application preserves exactly
- `Counts` (WL) how often each element occurs in a list, the type-count vector such a functional is evaluated on
- `NullSpace` (WL) the null space of the effect matrix, where a basis of conservation laws is found

- [`RewritingEffectMatrix`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RewritingEffectMatrix.html) (WolframInstitute/PureMath), [`RewritingCycleVectors`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RewritingCycleVectors.html) (WolframInstitute/PureMath), [`RewritingBalancedQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RewritingBalancedQ.html) (WolframInstitute/PureMath), [`RewritingReachabilityObstructionQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RewritingReachabilityObstructionQ.html) (WolframInstitute/PureMath), …

### Hypergraphs as Graphs

- [`HypergraphToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphToGraph/) (WFR) an ordinary graph with the same distance matrix as a hypergraph, each hyperedge turned into a subgraph
- `IncidenceMatrix` (WL) the vertex-edge incidence matrix of a graph
- `IncidenceGraph` (WL) the graph with a given incidence matrix, the graph side of a bipartite encoding of hyperedges
- `AdjacencyMatrix` (WL) the vertex-vertex adjacency matrix of a graph
- [Alternative formulations programs of the technical introduction](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/AlternativeFormulations.wl) (wolframphysics.org) conversions between trivalent networks, ordered and unordered hypergraphs, colored network specifications and their rules

- `IncidenceList` (WL), `BipartiteGraphQ` (WL), `LineGraph` (WL), `AdjacencyGraph` (WL), `IndexGraph` (WL), …

### Random and Enumerated Hypergraphs

- [`RandomHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomHypergraph/) (WFR) a random hypergraph with a given number of vertices and a given signature of hyperedge counts and arities
- [`EnumerateHypergraphs`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateHypergraphs/) (WFR) all possible ordered hypergraphs with a given signature
- `RandomGraph` (WL) a random graph on a given number of vertices and edges, an initial condition where a binary relation is enough

### WolframInstitute/Hypergraph

- [WolframInstitute/Hypergraph](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/) a paclet treating hypergraphs as symbolic mathematical objects, with their edges, matrices, rewriting rules and drawing tools
- [`Hyperedges`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/Hyperedges.html) a collection of hyperedges, each given in the form an edge of a hypergraph takes
- [`HyperedgeList`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HyperedgeList.html) the hyperedges of a hypergraph as a list of hyperedge objects, each carrying its own edge symmetry
- [`EdgeListTagged`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EdgeListTagged.html) the hyperedges of a hypergraph, a tagged hyperedge given as the edge pointing to its tag
- [`EdgeMultiplicity`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EdgeMultiplicity.html) each distinct hyperedge of a hypergraph with the number of times it occurs
- [`HypergraphUnion`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphUnion.html) the hypergraph on the union of the vertices, carrying the hyperedges of every argument
- [`HypergraphHadamardProduct`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphHadamardProduct.html) the hypergraph carrying the hyperedges common to all its arguments, with multiplicities multiplied
- [`HypergraphArityReduce`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphArityReduce.html) every hyperedge replaced by all of its vertex subsets of a given size
- [`ToPatternRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/ToPatternRules.html) the pattern rule equivalent to a hypergraph rule, in the module form set substitution engines use
- [`ToLabeledPatternEdges`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/ToLabeledPatternEdges.html) the hyperedges of a hypergraph in pattern form, ready to be matched against a state
- [`HypergraphIncidence`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphIncidence.html) each vertex of a hypergraph with the list of hyperedges it belongs to
- [`HypergraphIncidenceMatrix`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphIncidenceMatrix.html) the incidence matrix of a hypergraph
- [`IncidenceHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/IncidenceHypergraph.html) the hypergraph whose incidence matrix is a given matrix
- [`Hypermatrix`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/Hypermatrix.html) the hypermatrix of a hypergraph, one adjacency array per group of hyperedges of the same arity
- [`HypermatrixGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypermatrixGraph.html) the hypergraph corresponding to a hypermatrix
- [`HypergraphTransitionMatrix`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphTransitionMatrix.html) the transition matrix of a random walk on the vertices of a hypergraph
- [`HypergraphToGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphToGraph.html) a directed graph on the vertices of a hypergraph, with an edge for every pair adjacent in some symmetric ordering of a hyperedge
- [`OrderedHypergraphToGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/OrderedHypergraphToGraph.html) a graph encoding that keeps the hyperedges distinct and preserves the vertex order within each
- [`HypergraphInsertion`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphInsertion.html) one hypergraph inserted into another at every allowed vertex, each way of doing so carrying its sign
- [`HypergraphInsertionBracket`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphInsertionBracket.html) the graded antisymmetric bracket of hypergraphs under insertion
- [`RandomHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/RandomHypergraph.html) a pseudorandom hypergraph on a given number of atoms with given numbers of hyperedges of each arity
- [`EnumerateHypergraphs`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateHypergraphs.html) the simple connected hypergraphs with given numbers of hyperedges of each arity
- [`HypergraphDraw`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphDraw.html) an interactive canvas for drawing a hypergraph
- [`HypergraphRuleDraw`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphRuleDraw.html) two side-by-side canvases for drawing the input and the output of a rule

- [`CyclicEdge`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/CyclicEdge.html), [`LinkedHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/LinkedHypergraph.html), [`ToLabeledEdges`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/ToLabeledEdges.html), [`HypergraphInsertionBracketDegree`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphInsertionBracketDegree.html), [`RandomAllHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/RandomAllHypergraph.html), [`RandomConnectedHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/RandomConnectedHypergraph.html), [`EnumerateOrderedHypergraphs`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateOrderedHypergraphs.html), …
- [`HypergraphQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphQ.html), [`HypergraphRuleQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphRuleQ.html), [`HyperedgesQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HyperedgesQ.html), [`HypermatrixQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypermatrixQ.html), [`SimpleHypergraphQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/SimpleHypergraphQ.html), [`ConnectedHypergraphQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/ConnectedHypergraphQ.html), …

### Wolfram Function Repository

- [`WolframModelPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelPlot/) a hypergraph drawn with its hyperedges as polygons, whether a state or a side of a rule
- [`WolframModelRuleForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelRuleForm/) a Wolfram model rule written in letter form
- [`WolframModelSignatureForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelSignatureForm/) the formatted form of a signature specification for a rule or a state
- [`WolframModelTraditionalForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelTraditionalForm/) a Wolfram model displayed in an analogue of traditional mathematical notation
- [`AdjacencyTensor`](https://resources.wolframcloud.com/FunctionRepository/resources/AdjacencyTensor/) the adjacency tensor of an arbitrary hypergraph
- [`AdjacencyHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/AdjacencyHypergraph/) the hypergraph with a specified adjacency tensor
- [`HypergraphAdjacencyMatrix`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphAdjacencyMatrix/) the adjacency matrix for the vertices of a hypergraph
- [`KirchhoffTensor`](https://resources.wolframcloud.com/FunctionRepository/resources/KirchhoffTensor/) the Kirchhoff tensor, the Laplacian of an arbitrary hypergraph
- [`KirchhoffHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/KirchhoffHypergraph/) the hypergraph with a specified Kirchhoff tensor
- [`IdentityHypermatrix`](https://resources.wolframcloud.com/FunctionRepository/resources/IdentityHypermatrix/) the identity hypermatrix of a given dimension and rank
- [`TransversalHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TransversalHypergraph/) the transversal hypergraph of a hypergraph given by its hyperedges and isolated vertices
- [`ConnectedHypergraphQ`](https://resources.wolframcloud.com/FunctionRepository/resources/ConnectedHypergraphQ/) whether a hypergraph is connected

### WolframInstitute/Infrageometry

- [WolframInstitute/Infrageometry](https://github.com/WolframInstitute/Infrageometry) a paclet of discrete geometry on graphs and hypergraphs, carrying the hypergraph structure utilities below
- [`HypergraphDegree`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl) each vertex with the number of hyperedges it is incident to
- [`Hypergraph2Section`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl) the 2-section graph, joining the vertices that co-occur in a hyperedge
- [`Weighted2SectionGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl) the 2-section graph with each edge weighted by how many hyperedges hold both its vertices
- [`HypergraphLineGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl) the intersection graph of the hyperedges, one vertex per hyperedge
- [`HypergraphMaximalEdges`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl) the inclusion-maximal hyperedges, those contained in no other
- [`HypergraphComplex`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl) the downward-closed simplicial complex generated by the hyperedges
- [`HypergraphSummary`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl) the counts, hyperedge size statistics, average degree and degree distribution of a hypergraph

- [`HyperedgeCount`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl), [`HyperedgeSizes`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl), [`HyperedgeSizeDistribution`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl), …

### Wolfram Community

- [Square Grid Universe: programming one as a hypergraph rewriting ruleset](https://community.wolfram.com/t/23106) a rule-construction toolkit for a hypergraph rewriting ruleset that grows a square grid
- [Studying behavior of simple network rewriting system](https://community.wolfram.com/t/22397) simple network rewriting systems stated as hypergraph rules and run on random networks
- [Exploring the space of interaction nets](https://community.wolfram.com/t/25866) interaction nets as a graph rewriting language, explored as Wolfram models
- [Morphology of hypergraphs: a study of hyperedge evolution](https://community.wolfram.com/t/24244) morphing the hyperedge sets of hypergraphs along the symmetries among their hyperedges
- [Colour-decorated hypergraph rewriting: growth to Q102 and the Standard-Model gauge sectors](https://community.wolfram.com/t/27062) a rewriting system on ternary hyperedges whose atoms carry color decorations
- [Lie brackets on hypergraphs](https://community.wolfram.com/t/25009) canonical Lie brackets on hypergraphs, toward a Hamiltonian formalism for rewriting
- [Finding hypermatrix products via hypergraph classification](https://community.wolfram.com/t/25005) finite directed uniform hypergraphs classified in search of hypermatrix algebras of higher arity
- [Evolution of (hyper)graph invariants under (hyper)graph rewritings](https://community.wolfram.com/t/16398) hypergraph invariants of complexity, symmetry and robustness followed through a rewriting
