---
Template: Guide
Name: RulialSpace
Title: Rulial Space
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/RulialSpace
Description: Rulial multiway systems, rule spaces, rulial coordinates and distance, observers and computational boundedness, and the causal states and epsilon machines of a bounded observer
Keywords: [rulial space, ruliad, rule space, rulial multiway system, rulial coordinates, rulial distance, observer, observer theory, computational boundedness, foliation, reference frame, causal invariance, causal states, epsilon machine, statistical complexity, computational mechanics, Turing machine rule space]
RelatedGuides: [Multicomputation, MultiwaySystems, CausalGraphs, BranchialGraphs, RuleSpace, TuringMachines, AxiomSystemsAndEntailment]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[The Wolfram Institute](https://wolframinstitute.org/)"]
---

## Abstract

Rulial space is the space of all rules, entered by applying not one rule but every rule of a
space at once: the rulial multiway system a whole rule space generates; the rule spaces
themselves, enumerated by signature; the coordinates and distances a foliation and a pair of
observer chains put on the result; and what an observer inside it can see, bounded by what it
can compute.

## Functions

### Rulial Multiway Systems

- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the multiway system of a list of rules applied together, the rulial multiway system when the list holds every rule of a signature
- [`MultiwaySystem`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/MultiwaySystem.html) (Wolfram/Multicomputation) a multiway system built on a `Multi` object from a list of rules and an initial condition, evolving a whole rule space at once
- `NestGraph` (WL) the graph of the states reached by applying a successor repeatedly, the rulial graph when that successor applies every rule of a space
- `TaggedNestGraph` (WL) the same graph with each edge tagged by the position of the result it came from, which names the rule that fired
- [`NestGraphTagged`](https://resources.wolframcloud.com/FunctionRepository/resources/NestGraphTagged/) (WFR) a nest graph whose edges are tagged and styled by which output, and so which rule, produced the state
- [`MultiwayTuringMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/) (WFR) a nondeterministic Turing machine evolved as a multiway system, with every rule of a rule space applied at once giving the rulial multiway system of Turing machines

- [`MultiwayCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayCombinator/) (WFR), [`MultiwayOperatorSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/) (WFR), [`MultiwayFunctionSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayFunctionSystem/) (WFR), [`GenerationalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/GenerationalMultiwaySystem/) (WFR), [`Multi`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/Multi.html) (Wolfram/Multicomputation), …

### Rule Spaces

- [`EnumerateRuleSignatures`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateRuleSignatures/) (WFR) the rule signatures open to substitution systems and Wolfram models with a given number of elements, the addresses of the rule spaces themselves
- [`EnumerateSubstitutionSystemRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateSubstitutionSystemRules/) (WFR) every inequivalent string substitution rule with a given signature, the rule set a rulial multiway system applies at once
- [`EnumerateWolframModelRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateWolframModelRules/) (WFR) the canonical Wolfram model rules with a given signature, the rule space a rulial hypergraph evolution runs over
- [`RandomWolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomWolframModel/) (WFR) a random canonical Wolfram model rule with a given signature, one sample drawn from a rule space
- [`AllDeltaTMRules`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/DeltaTM.wl) (wolframphysics.org) all Turing machines with a given number of states and colors that differ from the identity machine in one case, the delta machines of rulial space
- [`CellularAutomatonSearch`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) all rules of a cellular automaton rule space taking an initial condition to a target or to an exact active width, searched on a Rust-accelerated engine
- [`CellularAutomatonOutputTable`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) the output of every rule of a rule space from one initial condition
- [`TuringMachineOutput`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineOutput.html) (WolframInstitute/TuringMachine) the halted outputs of every machine of a rule space on every input in a range
- `TuringMachine` (WL) the evolution of a single Turing machine of a rule space from an initial tape for a number of steps
- `RulePlot` (WL) the rule of a Turing machine or cellular automaton drawn as a picture
- [`MultiwayTuringMachineFunction`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTuringMachineFunction.html) (WolframInstitute/TuringMachine) all distinct tape values at the halted states of a nondeterministic Turing machine given as a list of rule numbers, the rulial machines run together
- [`MultiwayTuringMachinePlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTuringMachinePlot.html) (WolframInstitute/TuringMachine) the tape values a multiway Turing machine reaches for each input in a range
- [`TuringMachineRuleCount`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineRuleCount.html) (WolframInstitute/TuringMachine) the number of distinct Turing machine rules with a given number of states and colors, the size of the rule space

- `Tuples` (WL), `Subsets` (WL), `Permutations` (WL), `IntegerDigits` (WL), `FromDigits` (WL), `CycleIndexPolynomial` (WL), …
- [`DeltaTMRule`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/DeltaTM.wl) (wolframphysics.org), [`IdentityTuringMachine`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/DeltaTM.wl) (wolframphysics.org), [`ComputationalSystemRules`](https://resources.wolframcloud.com/FunctionRepository/resources/ComputationalSystemRules/) (WFR), [`RandomSubstitutionSystemRule`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomSubstitutionSystemRule/) (WFR), [`RandomCellularAutomatonRule`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomCellularAutomatonRule/) (WFR), [`StringTuples`](https://resources.wolframcloud.com/FunctionRepository/resources/StringTuples/) (WFR), [`WolframModelData`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelData/) (WFR), …

### Rulial Coordinates and Distance

- [`GraphFoliations`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphFoliations/) (WFR) the foliations of a rulial multiway graph into successive slices, each a choice of what a rulial observer takes as simultaneous
- [`Coordinatize`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/Coordinatize) (Wolfram Cloud) the coordinates of the events of a causal graph in the frame of one observer, the chain of events that observer passes through
- [`CoordinatizeCausalGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Chains.wl) (WolframInstitute/Infrageometry) two-dimensional coordinates for the events of a causal graph from a pair of observer chains, two observers taken as the axes
- [`CoordinatizedCausalGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Chains.wl) (WolframInstitute/Infrageometry) the reduced causal graph drawn at those coordinates, with the two observer chains highlighted
- [`CausalGraphSimpleChains`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the families of source-to-sink paths of a causal graph, the chains an observer can be taken to follow
- [`FindChain`](https://github.com/WolframInstitute/InfraCausality/blob/main/InfraCausality/Kernel/InfraCausality.wl) (WolframInstitute/InfraCausality) chains between two vertices of a causal graph, the worldlines of observers
- `GraphDistance` (WL) the length of a shortest path between two states of a rulial multiway graph, the rulial distance between them

- `GraphDistanceMatrix` (WL), `FindPath` (WL), `LayeredGraph` (WL), `GraphLayers` (WL), …
- [`FoliationClass`](https://resources.wolframcloud.com/FunctionRepository/resources/FoliationClass/) (WFR), [`VertexStratify`](https://resources.wolframcloud.com/FunctionRepository/resources/VertexStratify/) (WFR), [`MultispacePlot3D`](https://resources.wolframcloud.com/FunctionRepository/resources/MultispacePlot3D/) (WFR), …

### Observers and Computational Boundedness

- [`CausalInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/CausalInvariantQ/) (WFR) whether a multiway system is causal invariant after a number of steps from an initial condition, the condition under which observers on different branches agree on the causal graph
- [`TotalCausalInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/TotalCausalInvariantQ/) (WFR) whether a multiway system is total causal invariant after a number of steps, decided from its rules alone
- [`SpatialReconstruction`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the spatial relation graph reconstructed from a slice of a causal graph after a number of steps, the space an observer on that slice sees
- [`OneSidedTuringMachineFind`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/OneSidedTuringMachineFind.html) (WolframInstitute/TuringMachine) every rule of a space giving the same outputs as a chosen machine, the machines an observer of those outputs cannot tell apart
- `TopologicalSort` (WL) the events of a causal graph in an order consistent with every causal edge, one sequential history an observer could record
- [Multi-way tag systems in coordinatized rulial space](https://community.wolfram.com/t/20348) (Wolfram Community) tag systems of a rule space run together and placed in rulial coordinates
- [RuliadTrotter: meta-modeling metamathematical observers](https://community.wolfram.com/t/20354) (Wolfram Community) metamathematical observers modeled inside the rulial structure they observe
- [The Ruliad concept: some ideas and observations](https://community.wolfram.com/t/26601) (Wolfram Community) the entangled limit of all rules, and what a bounded observer samples of it

### WolframInstitute/PureMath

- [WolframInstitute/PureMath](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/guide/PureMath.html) a paclet extending the Wolfram Language across pure mathematics, carrying the computational mechanics of an observer watching a stationary process
- [`CausalStatePartition`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalStatePartition.html) the causal states of a stationary process, the classes of pasts up to a history length that predict the same conditional future
- [`CausalStateCount`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalStateCount.html) the number of causal states of a stationary process, its recurrent classes of pasts with identical conditional futures
- [`EpsilonMachine`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/EpsilonMachine.html) the epsilon-machine of a stationary process, the minimal unifilar predictor built from its causal states
- [`StatisticalComplexity`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StatisticalComplexity.html) the statistical complexity of a stationary process in bits, the Shannon entropy of the stationary distribution over its causal states
- [`BlockEntropy`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/BlockEntropy.html) the block entropy of a stationary process in bits, the Shannon entropy of its distribution over words of a given length
- [`ExcessEntropy`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ExcessEntropy.html) the excess entropy of a stationary process in bits, the block entropy beyond what its entropy rate accounts for
- [`HiddenMarkovPresentation`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HiddenMarkovPresentation.html) the edge-emitting presentation of the process seen by an observer who watches only which block of a partition a Markov chain occupies
- [`HiddenMarkovPresentationQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HiddenMarkovPresentationQ.html) whether an association of symbol-labeled matrices is an edge-emitting hidden Markov presentation
