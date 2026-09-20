---
Template: Guide
Name: WolframPhysics
Title: Wolfram Physics
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/WolframPhysics
Description: Hypergraph rewriting, multicomputation, discrete geometry, discrete spacetime, computational systems, metamathematics, categorical structures, graphs and networks, and visualization
Keywords: [hypergraph, hypergraph rewriting, rule, wolfram model, evolution, multiway, multihistory, multicomputation, causal graph, causal invariance, branchial graph, rulial space, ruliad, observer, discrete geometry, dimension, curvature, geodesic, gauge field, discrete spacetime, causal set, relativity, foliation, combinator, lambda calculus, turing machine, cellular automaton, substitution system, metamathematics, proof, entailment, category, string diagram, graph, network, visualization, wolfram physics]
RelatedGuides: [HypergraphRewriting, Multicomputation, DiscreteGeometry, DiscreteSpacetime, ComputationalSystems, Metamathematics, CategoricalStructures, GraphsAndNetworks, Visualization]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)", "[The Wolfram Institute](https://wolframinstitute.org/)", "[SetReplace on GitHub](https://github.com/maxitg/SetReplace)", "[HypergraphRewritingEngine on GitHub](https://github.com/WolframInstitute/HypergraphRewritingEngine)", "[Categorica on GitHub](https://github.com/JonathanGorard/Categorica)", "[The Wolfram Function Repository](https://resources.wolframcloud.com/FunctionRepository/)", "[The Wolfram Paclet Repository](https://resources.wolframcloud.com/PacletRepository/)", "[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)", "[Guide to Wolfram Physics Project functions](https://www.wolframcloud.com/obj/wolframphysics/Tools/guide-page)", "[Registry of Notable Universes](https://www.wolframphysics.org/universes/)", "[InfraUniverseRegistry on GitHub](https://github.com/WolframInstitute/InfraUniverseRegistry)", "[WolframInstitute/Hypergraph paclet](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/)", "[Wolfram/Multicomputation paclet](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/)", "[WolframInstitute/TuringMachine paclet](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/)", "[Infrageometry on GitHub](https://github.com/WolframInstitute/Infrageometry)", "[InfraCausality on GitHub](https://github.com/WolframInstitute/InfraCausality)"]
---

## Abstract

The Wolfram Physics Project models the universe as a hypergraph rewritten by simple rules, with space, time and matter emerging from the structure of the rewriting. This documentation indexes what the ecosystem provides for that programme: hypergraph rewriting; multicomputation; discrete geometry; discrete spacetime; the other computational systems that behave the same way; metamathematics; categorical structures; graphs and networks; and visualization. Each area has its own guide, listing the functions built into the Wolfram Language, published on the Wolfram Function Repository, shipped in a paclet or posted alongside an essay.

## Functions

### [Hypergraph Rewriting](paclet:WolframInstitute/WolframPhysics/guide/HypergraphRewriting)

- [`Hypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/Hypergraph.html) (WolframInstitute/Hypergraph) a hypergraph with the given hyperedges as a symbolic object, each hyperedge a list of vertices carrying its own edge symmetry
- `Rule` (WL) a rule that transforms its left side into its right side, the form of a hypergraph rewrite rule with a list of hyperedges on each side and each hyperedge a list of vertices
- [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR) the evolution of a Wolfram model with given rules from an initial condition for a number of generations
- [`WolframModelEvolutionObject`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelEvolutionObject/) (WFR) the result of an evolution, giving a generation's state by index and a named property such as `"StatesList"`, `"FinalState"` or `"TerminationReason"`
- [`EnumerateWolframModelRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateWolframModelRules/) (WFR) the canonical Wolfram model rules with a given signature
- [`CanonicalHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalHypergraph/) (WFR) a canonical version of a directed hypergraph, the form under which states are identified

### [Multicomputation](paclet:WolframInstitute/WolframPhysics/guide/Multicomputation)

- `ReplaceList` (WL) all the results of transforming an expression by a rule or list of rules in every possible way, one multiway step of an expression rewriting system
- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the multiway system of a string, list, cellular automaton or Wolfram model rule, with `"StatesGraph"`, `"EvolutionGraph"`, `"CausalGraph"` and `"BranchialGraph"` among its properties
- `TransitiveReductionGraph` (WL) the transitive reduction of a causal graph, keeping only the causal edges no longer path already implies
- [`CausalInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/CausalInvariantQ/) (WFR) whether a multiway system is causal invariant after a number of steps from an initial condition, every branch of its evolution yielding an isomorphic causal graph
- `GraphDistance` (WL) the branchial distance between two states, the shortest path joining them in the branchial graph
- [`SpatialReconstruction`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the spatial relation graph reconstructed from a slice of a causal graph after a number of steps, the space an observer on that slice sees

### [Discrete Geometry](paclet:WolframInstitute/WolframPhysics/guide/DiscreteGeometry)

- [`GraphNeighborhoodVolumes`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphNeighborhoodVolumes/) (WFR) the volumes of successively larger neighborhoods around the vertices of a spatial, causal or branchial graph, the growth from which dimension is read
- [`WolframHausdorffDimension`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframHausdorffDimension/) (WFR) the Wolfram-Hausdorff dimension of a graph and its associated properties
- [`OllivierRicciCurvature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OllivierRicciCurvature.html) (WolframInstitute/PureMath) Ollivier's coarse Ricci curvature of two vertices, one minus the transport cost between their random walks over the graph distance
- `FindShortestPath` (WL) a geodesic, the shortest path between two vertices of a graph
- [`InfraHolonomy`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the holonomy of a closed walk, the self-map it induces on the direction sphere over its base point
- [`TarskiStructure`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) (WolframInstitute/SyntheticInfrageometry) a graph read as a model of Tarski's elementary geometry, with its distance, betweenness and equidistance primitives

### [Discrete Spacetime](paclet:WolframInstitute/WolframPhysics/guide/DiscreteSpacetime)

- [`Poset`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Poset.html) (WolframInstitute/PureMath) a finite causal set as a poset object, a carrier set with an order relation, with its elements, cover relation and extremal elements as properties
- [`CausalSetInvariants`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetInvariants.html) (WolframInstitute/PureMath) the exact invariants of a finite causal set as an association, among them its element count, relation count and ordering fraction
- [`CausalSetAction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetAction.html) (WolframInstitute/PureMath) the Benincasa-Dowker-Glaser action of a finite causal set in a given dimension, minus the total of the discrete d'Alembertian on the constant field
- [`FlatSpacetimeSprinkling`](https://resources.wolframcloud.com/FunctionRepository/resources/FlatSpacetimeSprinkling/) (WFR) random causal graphs from sprinkling points into flat Minkowski spacetime
- [`GraphFoliations`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphFoliations/) (WFR) the possible foliations of a causal graph into successive slices, the frames an observer can lay on it

### [Computational Systems](paclet:WolframInstitute/WolframPhysics/guide/ComputationalSystems)

- `CombinatorS` (WL), `CombinatorK` (WL) the Schönfinkel basic combinators, the basis in which every combinator expression can be written
- [`BetaReduce`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReduce.html) (Wolfram/Lambda) iterated beta reduction of every reducible subexpression of a lambda term
- `TuringMachine` (WL) the evolution of a Turing machine with a given rule from an initial condition for a number of steps
- `CellularAutomaton` (WL) the evolution of a cellular automaton with a given rule from an initial condition, in any number of dimensions
- `SubstitutionSystem` (WL) the evolution of a string or list substitution system with a given rule from an initial condition
- [`FiniteAutomaton`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiniteAutomaton.html) (WolframInstitute/PureMath) a finite automaton as a first-class object

### [Metamathematics](paclet:WolframInstitute/WolframPhysics/guide/Metamathematics)

- `FindEquationalProof` (WL) a proof of a theorem from a set of axioms in equational logic, returned as a proof object
- `ProofObject` (WL) a found proof, carrying its proof graph, token-event proof graph and proof dataset as properties
- `AxiomaticTheory` (WL) an axiomatic representation of a named theory, the axiom system an entailment cone starts from
- `TwoWayRule` (WL) a rule applied in either direction, the form an axiom takes when a theory is run as a rewriting system
- [`KnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/KnuthBendixCompletion/) (WFR) the completion rules of a multiway system, the rewrite rules that resolve its branch pairs
- [`TwoWayRuleTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayRuleTokenEventGraph) (Writings) the token-event graph of two-way rewriting rules, the entailment fabric of an axiom system

### [Categorical Structures](paclet:WolframInstitute/WolframPhysics/guide/CategoricalStructures)

- [`AbstractCategory`](https://resources.wolframcloud.com/FunctionRepository/resources/AbstractCategory/) (WFR) a collection of objects and morphisms obeying the associativity and identity axioms
- [`AbstractFunctor`](https://resources.wolframcloud.com/FunctionRepository/resources/AbstractFunctor/) (WFR) a homomorphism between abstract categories, an object map and an arrow map extended over composites and identities
- [`HypergraphCategory`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphCategory.html) (WolframInstitute/PureMath) the category of hypergraph states and their morphisms, with composition and identities
- [`Diagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/Diagram.html) (Wolfram/DiagrammaticComputation) a symbolic diagram with input and output ports, a morphism in a symmetric monoidal category
- [`DiagramComposition`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramComposition.html) (Wolfram/DiagrammaticComputation) the sequential composition of diagrams, the outputs of one feeding the inputs of the next
- [`SpiderDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/SpiderDiagram.html) (Wolfram/DiagrammaticComputation) a spider, one node joining any number of legs, the generator a ZX style calculus is built from

### [Graphs and Networks](paclet:WolframInstitute/WolframPhysics/guide/GraphsAndNetworks)

- `Graph` (WL) a graph from a list of edges, the form every states graph, causal graph and branchial graph takes
- `VertexList` (WL), `EdgeList` (WL) the vertices and the edges of a graph as lists
- `AdjacencyMatrix` (WL) the vertex-vertex adjacency matrix of a graph
- `WeaklyConnectedGraphComponents` (WL) the weakly connected components of a graph, each as a graph of its own
- `BetweennessCentrality` (WL) how many shortest paths of a graph run through each vertex
- `IsomorphicGraphQ` (WL) whether two graphs are the same up to a relabeling of their vertices

### [Visualization](paclet:WolframInstitute/WolframPhysics/guide/Visualization)

- [`WolframModelPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelPlot/) (WFR) a visual display of a hypergraph, its hyperedges drawn as arrows and polygons through their vertices, the standard picture of a Wolfram model state
- `ArrayPlot` (WL) the values of an array shown as a discrete array of squares, the picture of a cellular automaton or substitution system evolution
- `LayeredGraphPlot` (WL), `LayeredGraphPlot3D` (WL) a layered plot of a graph in two or three dimensions, the layout of causal, multiway and branchial graphs
- [`VisualizeFoliatedCausalGraph`](https://github.com/WolframInstitute/InfraCausality) (WolframInstitute/InfraCausality) a foliation of a causal graph rendered as colored slices, with its chains
- [`WolframPhysicsProjectStyleData`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframPhysicsProjectStyleData/) (WFR) the styles of the branchial, causal, states, spatial and rulial graphs used in the Wolfram Physics Project
