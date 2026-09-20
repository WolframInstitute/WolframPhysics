---
Template: Guide
Name: CausalSets
Title: Causal Sets
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/CausalSets
Description: Causal sets as finite partial orders, their past and future sets, chains, antichains and intervals, order invariants and the Myrheim-Meyer dimension, sequential growth and transitive percolation, the discrete d'Alembertian and the causal-set action, and the stems and topologies that screen for manifoldlikeness
Keywords: [causal set, poset, partial order, causal order, Hasse diagram, cover relation, chain, antichain, order interval, order ideal, linear extension, ordering fraction, order invariant, order dimension, Myrheim-Meyer dimension, interval abundance, discrete d'Alembertian, Benincasa-Dowker-Glaser action, classical sequential growth, transitive percolation, stem, Kleitman-Rothschild, Alexandrov topology, manifoldlikeness, discrete spacetime]
RelatedGuides: [DiscreteSpacetime, RelativityAndFoliations, CausalGraphs, HypergraphDimension, BranchialGraphs, DiscreteCurvature, GeodesicsAndDistance]
Links: ["[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)"]
---

## Abstract

A causal set is a locally finite partial order whose elements are the events of a discrete
spacetime and whose relations are the causal order among them: the order itself, carried by a
poset object or read off a causal graph as its Hasse diagram; the past and the future of an
event; chains, antichains and the intervals between two events; the invariants the order alone
fixes, among them the ordering fraction; the Myrheim-Meyer dimension those invariants estimate;
the growth of a causal set element by element, by classical sequential growth or by transitive
percolation; the discrete d'Alembertian of a scalar field on a causal set and the
Benincasa-Dowker-Glaser action it gives; and the stems, topologies and abundance screens that
say whether an order could have come from a manifold.

## Functions

### Causal Sets as Partial Orders

- [`Poset`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Poset.html) (WolframInstitute/PureMath) a finite causal set as a poset object, a carrier set with an order relation, with its elements, cover relation and extremal elements as properties
- `RelationGraph` (WL) the graph of a causal relation on a list of events, an edge from each event to every event in its causal future
- `TransitiveReductionGraph` (WL) the Hasse diagram of a causal set, keeping only the links no chain of other relations implies
- [`HasseDiagram`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HasseDiagram.html) (WolframInstitute/PureMath) the Hasse diagram of a poset as a graph, lesser elements laid out below greater ones
- [`CoverRelation`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CoverRelation.html) (WolframInstitute/PureMath) the covering pairs of a causal set, the links with no element strictly between them
- `TransitiveClosureGraph` (WL) the full causal order behind a Hasse diagram, an edge for every pair of events one of which precedes the other
- [`PosetLessEqual`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetLessEqual.html) (WolframInstitute/PureMath) the order primitive itself, whether one element lies below another in an order relation
- [`OrderDual`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderDual.html) (WolframInstitute/PureMath) the causal set with its order reversed, past exchanged for future
- [`PartialOrderGraphQ`](https://resources.wolframcloud.com/FunctionRepository/resources/PartialOrderGraphQ/) (WFR), [`TransitiveGraphQ`](https://resources.wolframcloud.com/FunctionRepository/resources/TransitiveGraphQ/) (WFR) whether a graph is the graph of a partial order on its vertices, and whether its relation is transitive

- `AcyclicGraphQ` (WL), `DirectedGraphQ` (WL), `LayeredGraphPlot` (WL), `GraphLayers` (WL), …

### The Past and the Future of an Event

- `VertexOutComponent` (WL), `VertexInComponent` (WL) the causal future and the causal past of an event, the vertices reachable from it and the vertices that reach it
- [`DownSet`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/DownSet.html) (WolframInstitute/PureMath), [`UpwardClosure`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/UpwardClosure.html) (WolframInstitute/PureMath) the down-closure and the up-closure of a set of events, everything below it and everything above it in the order
- [`OrderIdeals`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderIdeals.html) (WolframInstitute/PureMath) all the down-closed subsets of a causal set, the pasts it admits
- [`ForwardLightCone`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) (WolframInstitute/InfraCausality), [`BackwardLightCone`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) (WolframInstitute/InfraCausality) the forward and backward light cones of a vertex in a finite directed causal graph, out to a given length
- `VertexOutComponentGraph` (WL), `VertexInComponentGraph` (WL) the future and the past of an event as subgraphs of the causal graph

### Chains, Antichains and Intervals

- [`MaximalChains`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MaximalChains.html) (WolframInstitute/PureMath) the chains that cannot be extended, the discrete worldlines running from a minimal to a maximal element
- [`MaximalAntichains`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MaximalAntichains.html) (WolframInstitute/PureMath) the antichains contained in no larger antichain, the discrete spacelike slices of a causal set
- [`OrderInterval`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderInterval.html) (WolframInstitute/PureMath) the closed order interval between two elements, the Alexandrov interval they span
- [`CausalInterval`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/RelativisticMechanics.wl) (WolframInstitute/InfraCausality) the causal interval between two vertices of a causal graph, the future of the first intersected with the past of the second
- [`AcyclicGraphTake`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/AcyclicGraphTake.md) (SetReplace) the intersection of the in-component of one vertex with the out-component of another in an acyclic graph
- [`FindChain`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraCausality.wl) (WolframInstitute/InfraCausality) chains between two vertices of a causal graph, the worldlines of observers
- [`ChainDecomposition`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ChainDecomposition.html) (WolframInstitute/PureMath) a partition of a causal set into the fewest chains, a minimum cover whose size is its width
- [`CausalSetIntervalAbundance`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetIntervalAbundance.html) (WolframInstitute/PureMath) the interval abundance of a finite causal set, how many related pairs have exactly zero, one, two or more elements strictly between them
- `FindClique` (WL), `FindIndependentVertexSet` (WL) the longest chain and the largest antichain, as a maximum clique and a maximum independent set of the comparability graph

### Order Invariants

- [`CausalSetInvariants`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetInvariants.html) (WolframInstitute/PureMath) the exact invariants of a finite causal set as an association, among them its element count, relation count and ordering fraction
- [`PosetHeight`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetHeight.html) (WolframInstitute/PureMath), [`PosetWidth`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetWidth.html) (WolframInstitute/PureMath) the elements in a longest chain and in a largest antichain, the discrete proper time across a causal set and its spatial extent
- [`LinearExtensionCount`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LinearExtensionCount.html) (WolframInstitute/PureMath) the number of linear extensions of a finite causal set, the ways of listing its elements consistently with the order
- [`CausalSetGrowthWeight`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetGrowthWeight.html) (WolframInstitute/PureMath) the number of distinct naturally labeled causal sets order-isomorphic to a given one
- [`PosetOrderDimension`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetOrderDimension.html) (WolframInstitute/PureMath) the order dimension of a finite causal set, the least number of linear extensions whose intersection is the order
- [`OrderAutomorphisms`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderAutomorphisms.html) (WolframInstitute/PureMath) the bijections of the elements preserving the order both ways, the discrete symmetries of a causal set
- `KendallTau` (WL) the rank correlation of two orderings of the same elements, the agreement between two linear extensions of a causal set

- [`YoungTableauToPoset`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-05/YoungTableauToPoset.wl) (wolframphysics.org), [`PosetToYoungTableau`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-05/YoungTableauToPoset.wl) (wolframphysics.org), …

### Dimension from the Order

- [`MyrheimMeyerDimension`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MyrheimMeyerDimension.html) (WolframInstitute/PureMath) the Myrheim-Meyer dimension estimate of a finite poset, the dimension whose expected sprinkling ordering fraction matches the ordering fraction of the poset
- [`MyrheimMeyerOrderingFraction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MyrheimMeyerOrderingFraction.html) (WolframInstitute/PureMath) the expected ordering fraction of a Poisson sprinkling into an interval of Minkowski space of a given dimension
- [`CausalDensityDimension`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/CausalDensityDimension.md) (SetReplace) the dimension of the region of a causal graph between two vertices, estimated by the Myrheim-Meyer algorithm
- [`SprinklingIntervalAbundance`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SprinklingIntervalAbundance.html) (WolframInstitute/PureMath) the expected interval abundance of points sprinkled into an interval of Minkowski space, the continuum figure a causal set's own abundance is read against

### Sequential Growth and Transitive Percolation

- [`TransitivePercolationCausalSet`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TransitivePercolationCausalSet.html) (WolframInstitute/PureMath) a random causal set grown by transitive percolation, each new element linked to each earlier one independently with a given probability
- [`CausalSetBirthProbability`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetBirthProbability.html) (WolframInstitute/PureMath) the classical sequential growth probability of adding one element with a given past to a finite causal set, as an exact function of the Rideout-Sorkin couplings
- [`CausalSetGrowthProbability`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetGrowthProbability.html) (WolframInstitute/PureMath) the net probability of growing a naturally labeled copy of a finite causal set by classical sequential growth
- [`LinearExtension`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LinearExtension.html) (WolframInstitute/PureMath) a natural labeling of a causal set, an order of birth consistent with the causal order
- `TopologicalSort` (WL) the elements of a causal set in an order consistent with every relation, one sequential order in which they can be born
- [`RandomCausalGraph`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraCausality.wl) (WolframInstitute/InfraCausality) a random finite causal graph

### The Discrete d'Alembertian and the Causal-Set Action

- [`CausalSetDAlembertian`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetDAlembertian.html) (WolframInstitute/PureMath) the Benincasa-Dowker-Glaser discrete d'Alembertian of a scalar field on a finite causal set in a given dimension, in discreteness units
- [`CausalSetAction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetAction.html) (WolframInstitute/PureMath) the Benincasa-Dowker-Glaser action of a finite causal set in a given dimension, minus the total of the discrete d'Alembertian on the constant field
- [`CausalSetLayerCoefficients`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetLayerCoefficients.html) (WolframInstitute/PureMath) the layer coefficients of the discrete d'Alembertian in a given dimension, the weights it puts on the nearest order layers of an element's past

### Stems, Topology and Manifoldlikeness

- [`CausalSetStemQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetStemQ.html) (WolframInstitute/PureMath) whether a finite causal set contains a past-closed subposet order-isomorphic to a given stem
- [`KleitmanRothschildQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/KleitmanRothschildQ.html) (WolframInstitute/PureMath) whether a finite poset is a Kleitman-Rothschild order, the three-layer pancake that almost every finite poset is
- [`AlexandrovTopology`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AlexandrovTopology.html) (WolframInstitute/PureMath) the Alexandrov topology of a finite poset, the topological space whose open sets are its up-sets
- [`SpecializationPreorder`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SpecializationPreorder.html) (WolframInstitute/PureMath) the order a finite topological space carries, one point below another when it lies in the closure of that other
- [A topological introduction to causal set theory and Wolfram Physics](https://community.wolfram.com/t/18486) (Wolfram Community) a causal set theory toolkit of finite topologies, Hasse diagrams, Minkowski sprinklings, Gromov-Hausdorff convergence and a causal multiway system

### WolframInstitute/PureMath

- [WolframInstitute/PureMath](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/guide/PureMath.html) a paclet of pure mathematics whose order theory and causal set modules carry the poset vocabulary of this page
- [`PosetQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetQ.html) whether an expression is a well-formed poset object
- [`ChainQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ChainQ.html), [`AntichainQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AntichainQ.html) whether a subset is a chain, every two of its elements comparable, or an antichain, every two incomparable
- [`ComparableQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ComparableQ.html), [`IncomparableQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/IncomparableQ.html) whether two events are causally related, or spacelike to one another
- [`OrderIdealQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderIdealQ.html), [`OrderFilterQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderFilterQ.html) whether a subset is down-closed, a possible past, or up-closed, a possible future
- [`MaximalElements`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MaximalElements.html), [`MinimalElements`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MinimalElements.html) the events with nothing above them and the events with nothing below them
- [`PosetRankFunction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetRankFunction.html), [`GradedPosetQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GradedPosetQ.html) the rank of each element of a graded causal set, and whether the rank rises by one along every cover
- [`ZetaMatrixPoset`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ZetaMatrixPoset.html), [`MoebiusFunctionPoset`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MoebiusFunctionPoset.html) the incidence matrix of a finite poset and the Moebius function that inverts sums over a past
- [`ChainPoset`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ChainPoset.html), [`AntichainPoset`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AntichainPoset.html) the chain and the antichain on a given number of elements, a single worldline and a single slice

- [`GreatestElement`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GreatestElement.html), [`LeastElement`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LeastElement.html), [`UpperBounds`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/UpperBounds.html), [`LowerBounds`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LowerBounds.html), [`PosetSupremum`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetSupremum.html), [`PosetInfimum`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetInfimum.html), [`ProductPoset`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ProductPoset.html), [`MonotoneMapQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MonotoneMapQ.html), [`OrderIsomorphismQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OrderIsomorphismQ.html), [`TwoDimensionalOrderQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TwoDimensionalOrderQ.html), [`MoebiusInversion`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MoebiusInversion.html), …
