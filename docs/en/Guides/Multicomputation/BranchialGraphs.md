---
Template: Guide
Name: BranchialGraphs
Title: Branchial Graphs and Quantum Observers
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/BranchialGraphs
Description: Branchial graphs and branchial distance, entanglement and branchial entropy, quantum states, operators and measurement, and the correspondence between quantum circuits and multiway evolution
Keywords: [branchial graph, branchial space, branchial distance, branch pair, common ancestry, multiway system, quantum observer, entanglement, entanglement entropy, quantum state, quantum operator, quantum circuit, quantum measurement, ZX-calculus, tensor network, matrix product state, quantum cellular automaton, Wolfram physics]
RelatedGuides: [Multicomputation, MultiwaySystems, CausalGraphs, RulialSpace, StringDiagrams, CausalSets, Visualization]
---

## Abstract

A branchial graph records which states of a multiway system are separated only by branching:
two states reached from a common ancestor by different rule applications, the branch pairs of a
step, joined by an edge; branchial distance and the geometry of the branchial space those edges
carry; entanglement between subsystems and the entropy of a branchial slice; the quantum states,
operators and measurements a quantum observer of that space works with; and the correspondence
between quantum circuits and multiway evolution.

## Functions

### Branchial Graphs

- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the branchial graph of a multiway system as its `"BranchialGraph"` property, the graph of branch pair ancestry at a given step
- [`MultiwaySystem`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/MultiwaySystem.html) (Wolfram/Multicomputation) a multiway system whose `"BranchialGraph"` connects concurrent states and whose `"CausalBranchialGraph"` combines causal and branchial edges
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) the `"BranchialGraph"` of a native multiway hypergraph rewriting, state vertices joined by undirected branchial edges, with `"EvolutionBranchialGraph"` adding the events
- [`Multi`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/Multi.html) (Wolfram/Multicomputation) an expression rewritten every possible way at once, with `"BranchialGraph"`, `"Branches"` and `"FoliationSlices"` among its properties
- [`BranchialGraphs`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchialGraphs/) (WFR) time-indexed branchial graphs of any directed acyclic graph, joining the vertices a chosen foliation makes simultaneous
- [`BranchialGraph`](https://www.wolframcloud.com/obj/wolframphysics/BranchialGraph) (Writings) the branchial graph of a multiway system, the cloud resource function the writings call
- [`BranchialHypergraph`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchialHypergraph/) (WFR) the branchial hypergraph of a graph, its ordered hyperedges encoding the degree of common ancestry between an initial vertex and the others
- [`WolframModelGlocalBranchialGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelGlocalBranchialGraph/) (WFR) the branch pair ancestry of a Wolfram model glocal multiway system, global and local rewriting combined
- [`StringRewritingBranchPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingBranchPairs.html) (WolframInstitute/PureMath) the branch pairs of a string under a string rewriting system, one for each pair of distinct redexes with their two successors and whether the redexes overlap

- [`BranchialGraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation), [`EvolutionBranchialGraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation), [`CausalBranchialGraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation), …

### Branchial Distance and Branchial Space

- `GraphDistance` (WL) the branchial distance between two states, the shortest path joining them in the branchial graph
- `GraphDistanceMatrix` (WL) every branchial distance at once, the metric carried by a branchial slice
- `NeighborhoodGraph` (WL) the branchial neighborhood of a state, the states within a given branchial distance of it
- `MeanGraphDistance` (WL) the mean separation of states in branchial space, one measure of how spread a branchial slice is
- `FindGraphCommunities` (WL) clusters of branchially nearby states, the regions an observer conflates
- [`WeightedSimpleGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/WeightedSimpleGraph/) (WFR) a simple graph with edge and vertex weights, the edge weights counting multiplicities, as a weighted branchial graph
- [`QuantumDistance`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumDistance.html) (Wolfram/QuantumFramework) the Hilbert space distance between two quantum states, the quantum counterpart of branchial distance
- `GraphEmbedding` (WL) coordinates for the states of a branchial graph, branchial space laid out in the plane or in three dimensions
- [`TMAppliesMultispace`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) (Writings) the multiway states graph of a nondeterministic Turing machine drawn in three dimensions with head position as the extra coordinate, on branchlike, spacelike and timelike axes, the published [`MultispacePlot3D`](https://resources.wolframcloud.com/FunctionRepository/resources/MultispacePlot3D/) covers it

- `GraphDiameter` (WL), `GraphRadius` (WL), `GraphCenter` (WL), `VertexDegree` (WL), `BetweennessCentrality` (WL), `MeanClusteringCoefficient` (WL), `FindGraphPartition` (WL), `CommunityGraphPlot` (WL), `GraphPlot3D` (WL), …

### Entanglement and Branchial Entropy

- [`QuantumEntangledQ`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumEntangledQ.html) (Wolfram/QuantumFramework) whether the subsystems of a quantum state are entangled at a given bipartition
- [`QuantumEntanglementMonotone`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumEntanglementMonotone.html) (Wolfram/QuantumFramework) the degree of entanglement between two subsystems of a quantum state
- [`QuantumPartialTrace`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumPartialTrace.html) (Wolfram/QuantumFramework) the reduced state of a subsystem, the chosen qubits traced out of a basis, state or operator
- [`QuantumPartialTranspose`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/QuantumPartialTranspose.m) (Wolfram/QuantumFramework) the partial transpose of a quantum state or operator over chosen subsystems, the Peres criterion for entanglement
- `Eigenvalues` (WL) the spectrum of a reduced density matrix, the numbers an entanglement entropy is computed from
- `Entropy` (WL) the entropy of a distribution of states, applied to the states of a branchial slice
- [`MPSSchmidtValues`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/MPSSchmidtValues.html) (Wolfram/TensorNetworks) the Schmidt values of a matrix product state across a bond, the entanglement spectrum of that cut
- [`MPSEntanglementEntropy`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/MPSEntanglementEntropy.html) (Wolfram/TensorNetworks) the von Neumann entanglement entropy of a matrix product state across a bond
- [`CausalGraphEntanglementEntropyGeneralized`](https://resources.wolframcloud.com/FunctionRepository/resources/CausalGraphEntanglementEntropyGeneralized/) (WFR) the entanglement entropy of a subgraph of a causal graph or a subset of a causal set, by the generalized approach
- [`CausalGraphEntanglementEntropyNaive`](https://resources.wolframcloud.com/FunctionRepository/resources/CausalGraphEntanglementEntropyNaive/) (WFR) the same entanglement entropy by the naive approach

- `Tr` (WL), `MatrixLog` (WL), `PositiveSemidefiniteMatrixQ` (WL), `Normalize` (WL), …

### Quantum States, Operators and Measurement

- [`QuantumState`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumState.html) (Wolfram/QuantumFramework) a pure or mixed quantum state expressed in a quantum basis
- `Ket` (WL) a ket in Dirac notation, a basis state of a quantum system
- [`QuantumOperator`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumOperator.html) (Wolfram/QuantumFramework) a linear operator acting on chosen subsystems of a quantum state
- `PauliMatrix` (WL) the Pauli matrices, the operators of a single qubit
- `KroneckerProduct` (WL) the tensor product of operator matrices, one subsystem composed with another
- `MatrixExp` (WL) the unitary an operator generates, the exponential of a Hamiltonian
- [`QuantumMeasurementOperator`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumMeasurementOperator.html) (Wolfram/QuantumFramework) a measurement operator acting at chosen qubits in a quantum basis
- [`QuantumMeasurement`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumMeasurement.html) (Wolfram/QuantumFramework) the measurement such an operator yields, with its outcomes and their probabilities

- `Bra` (WL), `BraKet` (WL), `ConjugateTranspose` (WL), `UnitaryMatrixQ` (WL), `HermitianMatrixQ` (WL), `Eigensystem` (WL), `CliffordAlgebra` (WL), `NonCommutativeMultiply` (WL), …

### Quantum Circuits and Multiway Evolution

- [`QuantumCircuitOperator`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumCircuitOperator.html) (Wolfram/QuantumFramework) a quantum circuit built from a list of quantum operators
- [`QuantumCircuitMultiwayGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumCircuitMultiwayGraph.html) (Wolfram/QuantumFramework) the multiway graph of a quantum circuit
- [`FeynmanBacktracking`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) (Wolfram/QuantumFramework) the amplitude of a computational basis outcome of a circuit summed by backtracking through its operators, a path sum over the histories of the circuit
- [`QuantumBeamSearch`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) (Wolfram/QuantumFramework) a beam search over the branches of a circuit's multiway evolution, only the most probable decomposed states kept at each gate
- [`DecomposedQuantumStateProbabilities`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) (Wolfram/QuantumFramework) the outcome probabilities of a state given as a sum of tensor products of subsystem states, the branches of a decomposition recombined
- [`QuantumToMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumToMultiwaySystem/) (WFR) a quantum evolution simulated as a multiway system, the operator and basis compiled to rules and the state vector to an initial condition
- [`QuantumTensorAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumTensorAutomaton/) (WFR) a quantum cellular automaton evolving the tensor product of a collection of qubits under compositions of unitary operators
- [`SuzukiTrotterProduct`](https://resources.wolframcloud.com/FunctionRepository/resources/SuzukiTrotterProduct/) (WFR) Suzuki-Trotter products of an evolution, with their scaling and leading commutators
- [`MakeZXDiagram`](https://resources.wolframcloud.com/FunctionRepository/resources/MakeZXDiagram/) (WFR) a diagrammatic representation of a linear map in the ZX-calculus
- [`ZXTensorNetwork`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/ZX.m) (Wolfram/QuantumFramework) the ZX tensor network of a quantum circuit, Z, X, H and boundary vertices carrying spider phases
- [`ZXExpression`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/ZX.m) (Wolfram/QuantumFramework) a quantum circuit as a formal ZX expression, Z, X and H tensors composed with their spider phases
- [`ZXTensorNetworkQuantumCircuit`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/ZX.m) (Wolfram/QuantumFramework) the quantum circuit a ZX tensor network stands for, its Z and X spiders and Hadamards read back as gates
- [Quantum mechanics foliation programs](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-08/QM-foliations-01.wl) (wolframphysics.org) the technical introduction program file that draws foliation lines across the graphs of the quantum mechanics section
- [Straight foliation programs](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-08/QM-straightfoliations-01.wl) (wolframphysics.org) the program file that draws straight foliation lines at chosen densities and slopes

### Wolfram/QuantumFramework

- [Wolfram/QuantumFramework](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/) a paclet for symbolic and numeric quantum computation, from bases and states to operators, circuits, channels and measurement
- [`QuantumEvolve`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumEvolve.html) a quantum state evolved under a Hamiltonian
- [`QuantumTensorProduct`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumTensorProduct.html) the tensor product of quantum bases, states or operators
- [`QuantumBasis`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumBasis.html) the basis a quantum state or operator is expressed in
- [`QuditBasis`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuditBasis.html) a qudit basis, the several-level generalization of a qubit basis
- [`QuantumChannel`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumChannel.html) a channel acting on a quantum state, the open system counterpart of a unitary
- [`QuantumMeasurementSimulation`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumMeasurementSimulation.html) one or many simulated measurement results for a quantum state
- [`GraphState`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/GraphState.html) the graph state a graph specifies, a stabilizer state of its qubits
- [`PauliStabilizer`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/PauliStabilizer.html) a state given by its Pauli stabilizer generators
- [`LocalComplement`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/LocalComplement.html) the local complement of a graph or graph state at a vertex, the transformation a local Clifford operation induces on a graph state
- [`StabilizerFrame`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/StabilizerFrame.html) a superposition of stabilizer states with coefficients, a frame of branches beyond the single stabilizer state
- [`QuantumTensorNetworkGraph`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/QuantumCircuitOperator/TensorNetwork.m) the tensor network graph of a quantum circuit, vertices carrying the gate tensors and edges the contracted wire indices, the `"TensorNetworkGraph"` property of a circuit
- [`TensorNetworkQuantumCircuit`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/QuantumCircuitOperator/TensorNetwork.m) the quantum circuit a tensor network graph stands for, one operator per tensor vertex with the wire indices as its order
- [`QuantumCircuitHypergraph`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/QuantumCircuitOperator/TensorNetwork.m) a quantum circuit as a hypergraph, one hyperedge per gate tensor over its wire indices, the `"Hypergraph"` property of a circuit
- [`QuantumDiagramProcess`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) a quantum circuit as a string diagram process, its tensor network graph turned into a diagram of labeled boxes and free wires
- [`QuantumMPS`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumMPS.html) a matrix product representation of a state or an operator
- [`QuantumMPO`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) the matrix product operator of a quantum operator, its matrix product state bent back into an operator chain with a bond dimension cutoff
- [`QuantumMPSApply`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) a one or two qudit operator applied to a matrix product state in place, the state kept in matrix product form
- [`QuantumWignerTransform`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumWignerTransform.html) a quantum object transformed into its Wigner phase space representation
- [`QuantumWeylTransform`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/QuantumWignerTransform.m) the inverse of the Wigner transform, a phase space basis, state, operator, channel or circuit taken back to the Schrodinger picture
- [`QuantumPositiveTransform`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/QuantumPhaseSpaceTransform.m) a quasi-probability state or operator split into positive and negative sectors, so a Wigner function reads as probabilities
- [`QuantumWignerMICTransform`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumWignerMICTransform.html) a quantum object transformed into a minimal informationally complete basis, a discrete phase space representation beside the Wigner transform
- [`QuantumStateEstimate`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumStateEstimate.html) a quantum state estimated from measurement results

- [`CliffordChannel`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/CliffordChannel.html), [`StabilizerStateQ`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/StabilizerStateQ.html), [`QuantumPhaseSpaceTransform`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumPhaseSpaceTransform.html), [`QuantumSimilarity`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumSimilarity.html), …
- [`QuantumCircuitMultiwayCausalGraph`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Multiway.m), [`QuantumCircuitPathGraph`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Multiway.m), [`QuantumCircuitTokenEventGraph`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Multiway.m), …

### Wolfram/TensorNetworks

- [Wolfram/TensorNetworks](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/) a paclet of tensor networks, their contraction paths and execution, matrix product states and Young symmetrizers, the substrate behind the tensor network graph of a quantum circuit
- [`TensorNetwork`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/TensorNetwork.html) a tensor network, a list of tensors bundled with their hyperedge index lists, a string diagram read as a computation
- [`RandomTensorNetwork`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/RandomTensorNetwork.html) a random tensor network on a graph or a named topology, matrix product states and operators, tensor trains, projected entangled pairs, tree tensor networks and MERA
- [`TensorNetworkContract`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/TensorNetworkContract.html) a tensor network contracted to a single tensor along a given or computed path
- [`MPSCanonicalForm`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/MPSCanonicalForm.html) a matrix product state in left, right or mixed canonical form

- [`MPSOverlap`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/MPSOverlap.html), [`MPSTruncate`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/MPSTruncate.html), [`MPSNorm`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/TensorNetworks/ref/MPSNorm.html), …

### Wolfram Function Repository

- [`QuantumDiscreteState`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteState/) a discrete quantum state as a symbolic object
- [`QuantumDiscreteOperator`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteOperator/) a discrete quantum operator acting on chosen qubits
- [`QuantumDiscreteStateToZXDiagram`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteStateToZXDiagram/) a pure discrete quantum state converted into a ZX-diagram
- [`ZXDiagramToQuantumDiscreteState`](https://resources.wolframcloud.com/FunctionRepository/resources/ZXDiagramToQuantumDiscreteState/) the discrete quantum state a ZX-diagram represents
- [`StringGlocalBranchialGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/StringGlocalBranchialGraph/) the branch pair ancestry of a string substitution glocal multiway system
- [`TuringMachineGlocalBranchialGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineGlocalBranchialGraph/) the branch pair ancestry of a nondeterministic Turing machine glocal multiway system
- [`BranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairs/) the branch pairs of a multiway system after a number of steps, the pairs of states reached from a common state by two different rule applications
- [`BranchPairResolutions`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairResolutions/) the branch pairs of a multiway system after a number of steps sorted into resolved and unresolved, the pairs of branches that reconverge and the pairs that do not
- [`CanonicalBranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalBranchPairs/) the canonical branch pairs of a set of rules, independent of the initial condition
- [`GraphNeighborhoodVolumes`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphNeighborhoodVolumes/) how many vertices lie within each distance of a vertex, the ball profile of a spatial, causal or branchial graph

- [`ListGlocalBranchialGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/ListGlocalBranchialGraph/), [`CombinatorGlocalBranchialGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorGlocalBranchialGraph/), [`QuantumDiscreteOperatorToZXDiagram`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteOperatorToZXDiagram/), [`ZXDiagramToQuantumDiscreteOperator`](https://resources.wolframcloud.com/FunctionRepository/resources/ZXDiagramToQuantumDiscreteOperator/), [`MultispacePlot3D`](https://resources.wolframcloud.com/FunctionRepository/resources/MultispacePlot3D/), …

### Wolfram Community

- [Entanglement spreading in quantum circuits, multiway graphs, and branchial graphs](https://community.wolfram.com/t/25006) entanglement spreading compared across quantum circuits, multiway graphs and branchial graphs
- [Quantum operators from Wolfram Model multiway systems](https://community.wolfram.com/t/26284) quantum operators read off the multiway system of a Wolfram model
- [Identification of the quantum Zeno effect in the Wolfram Model](https://community.wolfram.com/t/19420) the quantum Zeno effect identified in the multiway evolution of a Wolfram model
- [Investigating quantum interference effects in Wolfram Models](https://community.wolfram.com/t/16341) interference between the branches of a multiway evolution
- [Perturbation Effects in Branchial Graphs](https://community.wolfram.com/t/21413) how a perturbation of a state propagates through a weighted branchial graph
- [Establishing maximal entanglement speed via branchial lightcones](https://community.wolfram.com/t/20336) a bound on the speed of entanglement from light cones in branchial space
- [Branchial graph density diffusion in dynamic multiway systems](https://community.wolfram.com/t/20339) the diffusion of branchial graph density through a dynamic multiway system
- [Modeling spin network interactions via branchial graphs](https://community.wolfram.com/t/19422) spin network interactions modeled on branchial graphs
- [Translating holographic entanglement entropy to rewriting model](https://community.wolfram.com/t/19425) holographic entanglement entropy carried over to a rewriting model
- [Black hole entanglement entropy from causal graphs](https://community.wolfram.com/t/22392) entanglement entropy across a region of a causal graph, and how it tracks the entropy of a branchial graph
- [Comparing Wolfram Model and causal set entanglement entropies](https://community.wolfram.com/t/18460) the spacetime entanglement entropy of causal set theory set against the entropy of a Wolfram model
- [Random walks in branchial TM space and quest for simplest universal NDTM](https://community.wolfram.com/t/16383) random walks in the branchial space of nondeterministic Turing machines and a search for the simplest universal one

- [Branchial wormholes](https://community.wolfram.com/t/20377), [Branchial graph stability](https://community.wolfram.com/t/26344), [On charge-spin networks from multiway systems and branchial graphs](https://community.wolfram.com/t/18429), [Multiway quantum many-body system](https://community.wolfram.com/t/18474), [Quantum gravity in (2+1) dimensions and multiway systems](https://community.wolfram.com/t/18465), [Quantum teleportation in string substitution systems](https://community.wolfram.com/t/16348), [A suggestive quantum theory for cyclic character strings](https://community.wolfram.com/t/25003), …
