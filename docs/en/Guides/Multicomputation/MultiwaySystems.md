---
Template: Guide
Name: MultiwaySystems
Title: Multiway Systems
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/MultiwaySystems
Description: Applying every rule in every possible way: one multiway step, multiway systems and multihistories over strings, lists, hypergraphs and other systems, the states, evolution and token-event graphs, branch pairs, critical pairs and confluence, quantum circuits as multiway systems, and the sampling and pruning of a growing exploration
Keywords: [multiway system, multihistory, nondeterministic rewriting, branching, states graph, evolution graph, token-event graph, glocal multiway system, branch pair, critical pair, confluence, normal form, Knuth-Bendix completion, parallel independence, string rewriting, multiset substitution system, multiway Turing machine, multiway combinator, Petri net, register machine, quantum circuit, path sum, beam search, linked hypergraph, substitution, cosubstitution, bisubstitution, exploration, pruning]
RelatedGuides: [Multicomputation, CausalGraphs, BranchialGraphs, RulialSpace, WolframModels, RewritingEngines, Hypergraphs, RuleSpace]
---

## Abstract

A multiway system applies every rule to a state in every possible way and keeps every result
instead of choosing one: the single step that produces all the successors of a state; the
multiway systems and multihistories that collect the states reached and the events that reach
them, over strings, lists, hypergraphs and multisets of tokens; the states, evolution and
token-event graphs that relate states, events and the tokens events consume and create; the
branch pairs and critical pairs where two rewrites compete, and the completion and confluence
that resolve them; the multiway systems of Turing machines, combinators, operator systems, lambda
expressions, Petri nets and register machines; the quantum circuit read as a multiway system, with
its path sum over histories and the beam search over its branches; and the sampling and pruning
that keep a growing exploration finite.

## Functions

### Applying a Rule in Every Possible Way

- `ReplaceList` (WL) all the results of transforming an expression by a rule or list of rules in every possible way, one multiway step of an expression rewriting system
- `StringReplaceList` (WL) the strings obtained by replacing each single occurrence of a substring, one multiway step of a string substitution system
- [`MultiReplace`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiReplace/) (WFR) every replacement of an expression under rules together with the position at which it occurs, by substitution, cosubstitution or bisubstitution
- [`MultiBiReplace`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/MultiBiReplace.m) (Wolfram/Metamathematics) every bisubstitution replacement of an expression under a rule at every subexpression position, one multiway step by bisubstitution
- [`MultiCoReplace`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/MultiCoReplace.m) (Wolfram/Metamathematics) every cosubstitution replacement of an expression under a rule, one multiway step by cosubstitution
- [`BetaReductions`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReductions.html) (Wolfram/Lambda) all possible single beta reductions of a lambda expression, one multiway step of a lambda term

- `StringReplace` (WL), `SequenceReplace` (WL), `SequenceCases` (WL), `SequencePosition` (WL), `StringCases` (WL), `StringPosition` (WL), `StringReplacePart` (WL), `StringExpression` (WL), `ReplaceAt` (WL), `ReplacePart` (WL), `NestTree` (WL), `Trace` (WL), …

### Multiway Systems and Multihistories

- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the multiway system of a string, list, cellular automaton or Wolfram model rule, with `"StatesGraph"`, `"EvolutionGraph"`, `"CausalGraph"` and `"BranchialGraph"` among its properties
- [`Multi`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/Multi.html) (Wolfram/Multicomputation) an object that acts as several expressions at once, the lazy nondeterministic rewriting system of an expression under rules
- [`GenerateMultihistory`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/GenerateMultihistory.md) (SetReplace) every history of a system from an initial state, under event-selection and stopping parameters
- [`Multihistory`](https://github.com/maxitg/SetReplace) (SetReplace) the object holding the evaluation of a possibly nondeterministic computational system, convertible to a Wolfram model evolution object
- [`MultisetSubstitutionSystem`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Systems/MultisetSubstitutionSystem.md) (SetReplace) a rewriting system that replaces submultisets of tokens matching patterns in any order by the result of an expression, the system a multihistory generator evaluates
- [`$SetReplaceSystems`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/%24SetReplaceSystems.md) (SetReplace) the computational systems a multihistory generator accepts, the multiset substitution system and the atomic state system
- [`$SetReplaceGenerators`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/%24SetReplaceGenerators.md) (SetReplace) the generators that evaluate a computational system, one for every history and one for a single history
- [`WolframModel`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/WolframModelAndWolframModelEvolutionObject.md) (SetReplace) the multiway evolution of a Wolfram model, selected by its `"EventSelectionFunction"` option in place of the single-way default
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) multiway hypergraph rewriting on a native engine, its states, events and causal and branchial structure computed outside the kernel
- [`GenerationalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/GenerationalMultiwaySystem/) (WFR) the evolution of a generational multiway system, every event of a generation applied at once, with its states graph and associated properties

### The States, Evolution and Token-Event Graphs

- `NestGraph` (WL) the graph of the states reached by applying a function repeatedly, the multiway graph of any successor function
- `TaggedNestGraph` (WL) the same graph with each edge tagged by the position of the successor among the results the function returns
- [`NestGraphTagged`](https://resources.wolframcloud.com/FunctionRepository/resources/NestGraphTagged/) (WFR) a nest graph whose edges are tagged differently for the different outputs of the function, with labeled states and styled rules
- [`TokenEventGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph/) (WFR) the token-event graph of a multicomputational evolution according to particular rules, with token, state and event deduplication options
- [`MultiwayTokenEventGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTokenEventGraph.html) (WolframInstitute/TuringMachine) the token-event graph of a multiway equational rewriting, expressions as tokens and rewrites as events
- [`TwoWayRuleTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayRuleTokenEventGraph) (Writings) the token-event graph of two-way rule application, every rule used in both directions
- [`TwoWayStringTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayStringTokenEventGraph) (Writings) the token-event graph of a string rewriting system with every rule applied in both directions
- [`TwoWayHypergraphTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayHypergraphTokenEventGraph) (Writings) the token-event graph of a hypergraph rewriting system with every rule applied in both directions
- [`TwoWayRuleNestGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayRuleNestGraph) (Writings) the multiway graph of the expressions reached under two-way rules, an entailment cone
- [`TwoWayRuleStringNestGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayRuleStringNestGraph) (Writings) the multiway graph of the strings reached under two-way string rules
- [`TokenEventToTokenGraph`](https://www.wolframcloud.com/obj/wolframphysics/TokenEventToTokenGraph) (Writings) a token-event graph reduced to the graph of its tokens, events contracted away
- [`PatternifyTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/PatternifyTokenEventGraph) (Writings) the symbols of a token-event graph replaced by patterns
- [`ProofObjectToTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/ProofObjectToTokenEventGraph) (Writings) a proof object converted into a token-event graph, the proof as a multicomputation
- [`MultiEvaluate`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/MultiEvaluate) (Wolfram Cloud) the multiway evaluation of an expression in every possible order of its subexpressions, with `"StatesGraph"`, `"EvolutionGraph"` and `"CausalGraph"` properties
- [`WolframModelGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelGlocalMultiwaySystem/) (WFR) the evolution of a Wolfram model as a glocal multiway system, the global events and causal structure of an ordinary multiway system combined with the individual tokens of a local one
- [`MultiwayEvolutionPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayEvolutionPlot/) (WFR) a plot of the evolution of a string multiway system
- `LayeredGraphPlot3D` (WL) a layered plot of a graph in three dimensions, a states or evolution graph drawn with each step on its own layer

- [`AccumulativeTokenEventGraph`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/AccumulativeTokenEventGraph) (Wolfram Cloud), [`MergeTree`](https://resources.wolframcloud.com/FunctionRepository/resources/MergeTree/) (WFR), [`FoldGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/FoldGraph/) (WFR), …

### Branch Pairs, Critical Pairs and Confluence

- [`BranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairs/) (WFR) the branch pairs of a multiway system after a number of steps, the pairs of states reached from a common state by two different rule applications
- [`StringRewritingBranchPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingBranchPairs.html) (WolframInstitute/PureMath) the branch pairs of a string under a string rewriting system, one for each pair of distinct redexes with their two successors and whether the redexes overlap
- [`CanonicalBranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalBranchPairs/) (WFR) the canonical branch pairs of a set of rules, independent of the initial condition, sorted into resolved and unresolved after a number of steps
- [`BranchPairResolutions`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairResolutions/) (WFR) the branch pairs of a multiway system after a number of steps sorted into resolved and unresolved, the pairs of branches that reconverge and the pairs that do not
- [`CausalInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/CausalInvariantQ/) (WFR) whether a multiway system is causal invariant after a number of steps from an initial condition, every branch of its evolution yielding an isomorphic causal graph
- [`TotalCausalInvariantQ`](https://resources.wolframcloud.com/FunctionRepository/resources/TotalCausalInvariantQ/) (WFR) whether a multiway system is total causal invariant after a number of steps, decided from its rules alone
- [`StringRewritingCriticalPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingCriticalPairs.html) (WolframInstitute/PureMath) the critical pairs of a string rewriting system, the shortest words carrying two overlapping redexes together with their two one-step reducts
- [`HypergraphCriticalPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphCriticalPairs.html) (WolframInstitute/PureMath) the critical pairs of two double-pushout hypergraph rewriting rules, the parallel-dependent pairs of steps out of the overlaps of their left-hand sides
- [`HypergraphUnifications`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/HypergraphUnifications.md) (SetReplace) all the hypergraphs that contain subgraphs matching both of two hypergraphs, the overlaps of rule inputs a critical pair comes out of
- [`StringRewritingConfluentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingConfluentQ.html) (WolframInstitute/PureMath) whether a string rewriting system is confluent, decided by sound criteria on its critical pairs
- [`KnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/KnuthBendixCompletion/) (WFR) the Knuth-Bendix completion rules of a multiway system after a number of steps, the rewrite rules that would resolve its branch pairs
- [`UnfailingKnuthBendixCompletion`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/UnfailingKnuthBendixCompletion) (Wolfram Cloud) equational proof search run in completion mode, every theorem it finds returned with the completion rules that produced it
- [`MultiwayRuleGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayRuleGraph.html) (WolframInstitute/TuringMachine) the critical-pair rule-space graph of an equational axiom set, each rule a vertex and the superposition of two rules an event
- [`TwoWayRuleMultiReplace`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/TwoWayRule.m) (Wolfram/Metamathematics) the lemmas obtained by applying every pair of two-way rules to each other by substitution, cosubstitution or bisubstitution, one multiway step of rules acting on rules
- [`TwoWayRuleMultiReplaceList`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/TwoWayRule.m) (Wolfram/Metamathematics) the successive generations of lemmas obtained by repeatedly combining two-way rules with each other
- [`multiwayDistance`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/multiwayDistance.html) (WolframInstitute/TuringMachine) the graph distance between two expressions in the multiway cloud grown from them for a number of generations
- [`StringRewritingNormalForms`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingNormalForms.html) (WolframInstitute/PureMath) the normal forms reachable from a string under a string rewriting system, the irreducible strings found by breadth-first search over the one-step relation

### Multiway Systems of Other Computational Systems

- [`MultiwayTuringMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/) (WFR) the evolution of a nondeterministic Turing machine as a multiway system, with its states, causal and branchial graphs
- [`MultiwayTuringMachineFunction`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTuringMachineFunction.html) (WolframInstitute/TuringMachine) all distinct tape values at the halted states of a nondeterministic Turing machine given as a list of rule numbers
- [`OneSidedTuringMachineMultiwayGraph`](https://github.com/WolframInstitute/TuringMachine/blob/main/TuringMachine/Kernel/Multiway.wl) (WolframInstitute/TuringMachine) the multiway graph of a one-sided Turing machine
- [`MultiwayTuringMachineRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTuringMachineRules.html) (WolframInstitute/TuringMachine) the rules of a multiway Turing machine as an association from each state and symbol pair to its list of transition triples
- [`MultiwayTuringMachineFoldList`](https://github.com/WolframInstitute/TuringMachine/blob/main/TuringMachine/Kernel/Multiway.wl) (WolframInstitute/TuringMachine) the successive states reached when the rules of a multiway Turing machine are applied one after another to an input
- [`MultiwayTuringMachinePlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTuringMachinePlot.html) (WolframInstitute/TuringMachine) the tape values a multiway Turing machine reaches for each input in a range
- [`MultiwayTuringMachineSearch`](https://github.com/WolframInstitute/TuringMachine/blob/main/TuringMachine/Kernel/Functions.wl) (WolframInstitute/TuringMachine) a sequence of transitions of a nondeterministic Turing machine carrying an input to an output within a bounded number of steps, a path search through its multiway graph
- [`MultiwayNonHaltedStatesLeft`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayNonHaltedStatesLeft.html) (WolframInstitute/TuringMachine) how many non-halted states of a multiway Turing machine remain in the traversal queue after a bounded number of steps
- [`NDTMEvolution`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) (Writings) the states of a nondeterministic Turing machine step by step, the leaves of the multiway states graph, the published [`MultiwayTuringMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/) covers it
- [`TMAppliesGraph`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) (Writings) the multiway states graph of a nondeterministic Turing machine rule with the states where no rule applies highlighted
- [`TMAppliesMultispace`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) (Writings) the multiway states graph of a nondeterministic Turing machine drawn in three dimensions with head position as the extra coordinate, on branchlike, spacelike and timelike axes, the published [`MultispacePlot3D`](https://resources.wolframcloud.com/FunctionRepository/resources/MultispacePlot3D/) covers it
- [`TracedTMEvolution`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) (Writings) the multiway evolution of a nondeterministic Turing machine with the cumulative head displacement of each branch recorded
- [`CyclicTMSTG`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) (Writings) the state transition graph of a nondeterministic Turing machine on a cyclic tape
- [`MultiwayCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayCombinator/) (WFR) the evaluation of a combinator expression as a multiway system
- [`MWCombinatorGraph`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) (Writings) the multiway states graph of a combinator expression with the leftmost-outermost or a chosen evaluation path highlighted, published on the Function Repository as [`CombinatorEvolutionGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolutionGraph/)
- [`MWCombinatorGraphMinimal`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) (Writings) the multiway combinator graph in a minimal style, node sizes and a highlighted evaluation path, published on the Function Repository as [`CombinatorEvolutionGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolutionGraph/)
- [`MultiwayOperatorSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/) (WFR) the evaluation of a formal operator expression as a multiway system based on transformations of patterns, as with the axioms of a theory
- [`MultiwayEquationalGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayEquationalGraph.html) (WolframInstitute/TuringMachine) the multiway graph of equational rewriting from a set of axioms, the cloud of expressions an inductive proof searches
- [`MultiwayGeodesicGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayGeodesicGraph.html) (WolframInstitute/TuringMachine) the geodesic through a multiway equational graph, the shortest proof path between two expressions
- [`TMultiwayGraph`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TMultiwayGraph.html) (WolframInstitute/THVMLink) the multiway graph of a term rewriting run on the THVM engine
- [`TMultiTrace`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TMultiTrace.html) (WolframInstitute/THVMLink) the trace of a multiway reduction on an interaction-net runtime, the term, its events and its superposition slices recorded step by step
- [`MultiwayFunctionSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayFunctionSystem/) (WFR) a multiway system based on the evaluation of a function with multiple results over the integers
- [`LambdaMultiwayGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaMultiwayGraph.html) (Wolfram/Lambda) the multiway graph of the beta reductions of a lambda expression
- [`LambdaAllPathEvents`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Multiway.wl) (Wolfram/Lambda) the events along every path of the multiway graph of a lambda term
- [`MultiwayPetriNet`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayPetriNet/) (WFR) a Petri net run as a multiway system, every enabled transition fired in every possible order
- [`PetriNetMultiwayEvolution`](https://resources.wolframcloud.com/FunctionRepository/resources/PetriNetMultiwayEvolution/) (WFR) the multiway evolution of a Petri net from a marking
- [`MultiwayRegisterMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayRegisterMachine/) (WFR) a nondeterministic register machine evolved as a multiway system

- [`WeylMultiwayFinite`](https://github.com/SamWhittington/WeylMultiwaySystem/blob/main/WeylMultiwayFinite.m) (GitHub), [`WeylMultiwayAffine`](https://github.com/SamWhittington/WeylMultiwaySystem/blob/main/WeylMultiwayAffine.m) (GitHub), [Multiway Turing Machines program file](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) (Writings), …

### Quantum Circuits as Multiway Systems

- [`QuantumCircuitMultiwayGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/QuantumCircuitMultiwayGraph.html) (Wolfram/QuantumFramework) the multiway graph of a quantum circuit, each gate applied to every branch of the decomposed state, the edges tagged with amplitude, probability and tree position
- [`QuantumCircuitTokenEventGraph`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Multiway.m) (Wolfram/QuantumFramework) the token-event graph of a quantum circuit, qubit basis tokens joined through the gate events that consume and create them, each event carrying its amplitude
- [`QuantumCircuitPathGraph`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Multiway.m) (Wolfram/QuantumFramework) the path graph of a quantum circuit, every computational basis path through the gates as a layered graph whose edges carry the amplitudes, the sum over histories of a circuit
- [`QuantumCircuitMultiwayCausalGraph`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Multiway.m) (Wolfram/QuantumFramework) the causal graph of the operator applications of a quantum circuit across its multiway evolution
- [`QuantumToMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumToMultiwaySystem/) (WFR) a quantum evolution compiled into the rules and initial condition of a multiway system, evolved with the states, causal and branchial graphs of any other
- [`FeynmanBacktracking`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) (Wolfram/QuantumFramework) the amplitude of a final basis state of a circuit summed over every path backwards through its gates, a Feynman sum over histories with memoized subpaths
- [`QuantumBeamSearch`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) (Wolfram/QuantumFramework) a beam search over the branches of a circuit's multiway evolution, keeping the most probable decomposed states at each gate

### Sampling and Pruning a Growing Exploration

- [`HGSessionOpen`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionOpen.html) (WolframInstitute/HypergraphRewriteEngine) a continuable exploration opened for a property and held by an engine worker, returned as a session object
- [`HGSessionStep`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionStep.html) (WolframInstitute/HypergraphRewriteEngine) a session's exploration carried a number of steps further from the frontier it stopped at
- [`DepthFirstSearch`](https://resources.wolframcloud.com/FunctionRepository/resources/DepthFirstSearch/) (WFR) a search through a multiway space for its special termination points
- [`TreeSearch`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/TreeSearch) (Wolfram Cloud) a state-space search over a problem given by callbacks, uninformed, informed, adversarial or Monte Carlo
- [`QuantumBeamSearch`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/Experimental.m) (Wolfram/QuantumFramework) the outcome probabilities of a circuit found by beam search, only the most probable branches kept at each operator, a pruned multiway exploration of the circuit
- `TimeConstrained` (WL) an exploration stopped after a number of seconds, for a multiway system that may never terminate

### Wolfram Function Repository

- [`MultiwayGroup`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayGroup/) an arbitrary group simulated as a multiway system
- [`MultiwayMonoid`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayMonoid/) an arbitrary monoid simulated as a multiway system
- [`MultiwaySemigroup`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySemigroup/) an arbitrary semigroup simulated as a multiway system
- [`CayleyNestGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CayleyNestGraph/) a generalized Cayley graph built from generators and relations
- [`FindStringProof`](https://resources.wolframcloud.com/FunctionRepository/resources/FindStringProof/) a proof of equivalence between two strings in a given multiway system, a path between them through its states graph
- [`FindListProof`](https://resources.wolframcloud.com/FunctionRepository/resources/FindListProof/) a proof of equivalence between two lists in a given multiway system
- [`FindWolframModelProof`](https://resources.wolframcloud.com/FunctionRepository/resources/FindWolframModelProof/) a proof of equivalence between two hypergraphs in a given multiway Wolfram model system
- [`CanonicalKnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalKnuthBendixCompletion/) the canonical Knuth-Bendix completion rules of a set of rules, independent of any initial condition
- [`GraphRemoveLooseEnds`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphRemoveLooseEnds/) a graph with its low-valence vertices removed, trimming the loose ends of a multiway graph so its loops stand out
- [`MultiwayAggregationSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayAggregationSystem/) an aggregation system evolved as a multiway system, every site a new cell can attach to explored at once
- [`MultiwayGeneralizedShiftGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayGeneralizedShiftGraph/) the multiway graph of a generalized shift map
- [`StringGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/StringGlocalMultiwaySystem/) a string substitution system evolved as a glocal multiway system, global events over the individual tokens of a local one
- [`ListGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/ListGlocalMultiwaySystem/) a list substitution system evolved as a glocal multiway system
- [`CombinatorGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorGlocalMultiwaySystem/) a combinator expression evaluated as a glocal multiway system
- [`TuringMachineGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineGlocalMultiwaySystem/) a nondeterministic Turing machine evolved as a glocal multiway system
- [`MultiwayDeletionsGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayDeletionsGraph/) graph traversals explored while the visited components are deleted
- [`FixedPointGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/FixedPointGraph/) the graph of an iterative computation carried to a fixed point
- [`NestWhileGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/NestWhileGraph/) a graph built by iterating a function until a termination condition holds

- [`HofstadterMURiddle`](https://resources.wolframcloud.com/FunctionRepository/resources/HofstadterMURiddle/), [`SubexpressionPositions`](https://resources.wolframcloud.com/FunctionRepository/resources/SubexpressionPositions/), [`AlphaBetaSearch`](https://resources.wolframcloud.com/FunctionRepository/resources/AlphaBetaSearch/), [`NestedBranching`](https://resources.wolframcloud.com/FunctionRepository/resources/NestedBranching/), …

### Wolfram/Multicomputation

- [Wolfram/Multicomputation](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/) multicomputational objects and their graphs, over strings, expressions, hypergraphs, Wolfram models and cellular automata
- [`MultiwaySystem`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/MultiwaySystem.html) a multiway system built from a list of rules and an initial condition, with its states, branchial graph, branch pairs and causal invariance among its properties
- [`ToLinkedHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/ToLinkedHypergraph.html) a string encoded as a linked hypergraph, with explicit link vertices and character payload vertices
- [`FromLinkedHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/FromLinkedHypergraph.html) a linked hypergraph decoded back into the expression it encodes
- [`LinkedHypergraphToIndexedTree`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) a linked hypergraph decoded into an indexed tree, each node keeping its link vertex
- [`IndexedTreeToLinkedHypergraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) an indexed tree encoded as a linked hypergraph
- [`LinkedHypergraphToRootTree`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) the tree of a linked hypergraph grown from a chosen root
- [`MultiStringReplace`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) every way of applying a string rule at non-overlapping positions, as an association
- [`ApplyStringRules`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) string rules applied to a linked hypergraph
- [`ApplyHypergraphRules`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) hypergraph rules applied to a linked hypergraph in every possible way, with match processing and event selection options
- [`ApplyWolframModelRules`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) one multiway step of Wolfram model rules on a hypergraph state, each event with its input and output edges
- [`ApplyCARules`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) cellular automaton rules applied to the linked hypergraph encoding of a cell array, one event per updated cell
- [`LinkedHypergraphRuleToPatternRule`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) a rule between linked hypergraphs turned into an explicit pattern rule with fresh link variables
- [`PatternRuleToMultiReplaceRule`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m) a pattern rule whose right side is a `Module` rewritten as a rule `MultiReplace` accepts
- [`EvolutionGraph`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) the evolution graph of a multiway system over a number of steps
- [`MultiTokenEventGraph`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) the token-event graph of a multiway system over a number of steps
- [`DirectedGraphTree`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) an acyclic directed graph unfolded into a `Tree` from a root, a multiway graph read as the tree of its histories

- [`StringMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`HypergraphMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`WolframModelMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`CAMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`WIHypergraphMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`MultiwaySystemQ`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`LinkedHypergraphQ`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`MultiwayType`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`LinkedHypergraphRoot`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m), [`UniquifyIndexedTree`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/LinkedHypergraph.m), [`AddInitState`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m), …

### WolframInstitute/PureMath

- [WolframInstitute/PureMath](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/guide/PureMath.html) pure mathematics in the Wolfram Language, whose foundations and discrete mathematics areas cover string and hypergraph rewriting
- [`HypergraphParallelIndependentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphParallelIndependentQ.html) whether two double-pushout rewrite steps out of the same hypergraph state are parallel independent, applicable in either order with the same result
- [`HypergraphSequentialIndependentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphSequentialIndependentQ.html) whether a two-step double-pushout derivation is sequentially independent, its second step not depending on the first
- [`StringRewritingLocallyConfluentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingLocallyConfluentQ.html) whether every critical pair of a string rewriting system is joinable
- [`StringRewritingJoinableQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingJoinableQ.html) whether two strings have a common reduct under a string rewriting system
- [`StringRewritingConfluenceReport`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingConfluenceReport.html) the whole confluence analysis of a string rewriting system, recorded as one association
- [`PathReconvergenceRank`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PathReconvergenceRank.html) the reconvergence rank of a states graph, the dimension spanned by the differences of pairs of directed paths sharing both endpoints together with its directed cycles
- [`GradedPathReconvergenceRank`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GradedPathReconvergenceRank.html) the graded reconvergence rank, counting only pairs of equal-length paths sharing both endpoints and no cycles

- [`ArcFirstBettiNumber`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ArcFirstBettiNumber.html), [`SimpleGraphFirstBettiNumber`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SimpleGraphFirstBettiNumber.html), [`RootedDigraphQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RootedDigraphQ.html), [`DigraphRootList`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/DigraphRootList.html), …

### Wolfram Community

- [On the optimal move problem for multiway systems](https://community.wolfram.com/t/23917) the optimal and pessimal moves of a string multiway system measured by vertex count, with causal invariance and Knuth-Bendix completion
- [Looking for multiway systems of intermediate growth](https://community.wolfram.com/t/16438) a search for string multiway systems whose state counts grow faster than any polynomial and slower than any exponential
- [Finding holes in multiway systems](https://community.wolfram.com/t/22452) holes in a multiway graph, tested by asking whether a final state is reachable from an initial one under a rule and how large the gap is
- [Multiway Systems as Cayley Graphs](https://community.wolfram.com/t/17413) the limiting structure of multiway systems built from algebraic relations, read as Cayley graphs
- [The Multiway Systems of Dynkin Diagrams](https://community.wolfram.com/t/17412) multiway systems built from the relations of Weyl groups and their Dynkin diagrams
- [String rewriting trace graphs](https://community.wolfram.com/t/23967) trace graphs of string rewriting derivations, following the term graph rewriting literature
- [Terminations and completions in string multiway systems](https://community.wolfram.com/t/16370) which string multiway systems terminate, and the completions that make the rest confluent
- [Confluent Set Substitution Systems](https://community.wolfram.com/t/14367) set substitution systems made confluent by adding rules that resolve their critical pairs
- [Confluence in multiway cellular automata](https://community.wolfram.com/t/18457) cellular automata evolved as multiway systems and tested for confluence
- [Cyclic string substitution and multiway systems](https://community.wolfram.com/t/16412) string substitution systems with rules applied on a cyclic string, evolved as multiway systems
- [Growth and evolution of multi-way tag systems](https://community.wolfram.com/t/24289) a space of multiway tag systems enumerated and searched for the ones of intermediate growth
- [Monoids, string-rewriting, confluence, and the Knuth-Bendix Algorithm](https://community.wolfram.com/t/24312) the Knuth-Bendix algorithm for finitely presented monoids, with string rewriting and confluence visualized for word problems
- [Unraveling Complexity: A Deep Dive into Multi-Way Tag Systems](https://community.wolfram.com/t/22199) Post's tag system explored as a multiway system
- [Study backtracking in cellular automata as a multiway system](https://community.wolfram.com/t/18439) the predecessors of a cellular automaton state explored as a multiway system
- [Multiway sandpile models with applications to LCFTs](https://community.wolfram.com/t/20387) sandpile cellular automata evolved as multiway systems, with an eye to logarithmic conformal field theories
- [A study in proof space Topology](https://community.wolfram.com/t/20338) the topology of the space of proofs, read off the token-event graphs of two-way string rewriting
- [A novel multiway isomorphism model of consistency and completeness](https://community.wolfram.com/t/19404) consistency, completeness and decidability of a formal system read off isomorphisms of its multiway systems
- [Analysis of multiway sequential cellular automata: class evolution and quad flex case](https://community.wolfram.com/t/25067) multiway sequential cellular automata, the evolution of their behavior classes and the quad flex case
- [Efficient discovery of halting paths in aggregation system multiway graphs](https://community.wolfram.com/t/22401) halting paths found in the multiway graph of a totalistic aggregation system

- [A simple multiway example: radioactive decay](https://community.wolfram.com/t/19202), [Multiway circular-string rewrite systems](https://community.wolfram.com/t/16379), [Exploring statistical mechanics in string substitution systems](https://community.wolfram.com/t/16368), [On the mergers of numerical multiway systems](https://community.wolfram.com/t/22476), [Multi-way tag systems with symbolic rewriting](https://community.wolfram.com/t/25373), …
