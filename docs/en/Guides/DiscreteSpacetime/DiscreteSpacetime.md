---
Template: Guide
Name: DiscreteSpacetime
Title: Discrete Spacetime
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/DiscreteSpacetime
Description: Causal sets as finite partial orders, their invariants, growth and action, and the relativity a discrete spacetime supports: sprinklings, boosts, foliations, observer frames and field theory on a causal set
Keywords: [discrete spacetime, causal set, poset, partial order, causal order, chain, antichain, order invariant, sequential growth, causal-set action, relativity, Lorentz transformation, sprinkling, foliation, reference frame, Cauchy surface]
RelatedGuides: [WolframPhysics, CausalSets, RelativityAndFoliations]
Links: ["[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)"]
---

## Abstract

A discrete spacetime is a finite set of events ordered by causation, from which the geometry of relativity is recovered. Each area has its own guide.

Causal sets are partial orders: the order itself and the Hasse diagram that presents it; the past and the future of an event; chains, antichains and the intervals between two events; the order invariants that measure a set; the dimension its ordering fraction gives; sequential growth and transitive percolation; the discrete d'Alembertian and the causal-set action; and the stems, topology and manifoldlikeness that decide whether a set approximates a continuum.

Relativity on such a set starts from sprinklings and triangulations of a spacetime region, and runs through Lorentz transformations and boosts; foliations and the reference frames they define; coordinates read off a pair of observer chains; discrete Cauchy surfaces; field theory on a causal set; and gravity in a discrete spacetime.

## Functions

### [Causal Sets](paclet:WolframInstitute/WolframPhysics/guide/CausalSets)

- [`Poset`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Poset.html) (WolframInstitute/PureMath) a finite causal set as a poset object, a carrier set with an order relation, with its elements, cover relation and extremal elements as properties
- `TransitiveReductionGraph` (WL) the Hasse diagram of a causal set, keeping only the links no chain of other relations implies
- [`MaximalAntichains`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MaximalAntichains.html) (WolframInstitute/PureMath) the antichains contained in no larger antichain, the discrete spacelike slices of a causal set
- [`CausalSetInvariants`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetInvariants.html) (WolframInstitute/PureMath) the exact invariants of a finite causal set as an association, among them its element count, relation count and ordering fraction
- [`TransitivePercolationCausalSet`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TransitivePercolationCausalSet.html) (WolframInstitute/PureMath) a random causal set grown by transitive percolation, each new element linked to each earlier one independently with a given probability
- [`CausalSetAction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetAction.html) (WolframInstitute/PureMath) the Benincasa-Dowker-Glaser action of a finite causal set in a given dimension, minus the total of the discrete d'Alembertian on the constant field

### [Relativity and Foliations](paclet:WolframInstitute/WolframPhysics/guide/RelativityAndFoliations)

- [`FlatSpacetimeSprinkling`](https://resources.wolframcloud.com/FunctionRepository/resources/FlatSpacetimeSprinkling/) (WFR) random causal graphs from sprinkling points into flat Minkowski spacetime
- [`LorentzCoordinate2D`](https://resources.wolframcloud.com/FunctionRepository/resources/LorentzCoordinate2D/) (WFR) the spatial and temporal coordinates of a Lorentz-boosted causal graph
- [`GraphFoliations`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphFoliations/) (WFR) the possible foliations of a causal graph into successive slices, the frames an observer can lay on it
- [`CoordinatizeCausalGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Chains.wl) (WolframInstitute/Infrageometry) a time and a space coordinate for each event of a causal graph, read off the proper times of two observer chains
- [`CausalSetRetardedGreenFunction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalSetRetardedGreenFunction.html) (WolframInstitute/PureMath) the massless retarded Green function of a finite causal set in two dimensions, an exact matrix indexed by its elements
- [`WolframModelLorentzFactor`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelLorentzFactor/) (WFR) the Lorentz factor of a Lorentz-transformed causal graph of a Wolfram model
