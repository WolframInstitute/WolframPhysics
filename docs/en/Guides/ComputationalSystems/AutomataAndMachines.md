---
Template: Guide
Name: AutomataAndMachines
Title: Automata and Other Machines
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/AutomataAndMachines
Description: Machines other than Turing machines and cellular automata: finite automata and regular languages, machines inferred from behavior, register, counter and shift machines, Petri nets, network systems, string and sequence rewriting machines, iterated finite automata and automata groups, and the reversible pi machine
Keywords: [finite automaton, deterministic finite automaton, nondeterministic finite automaton, regular language, regular expression, context-free grammar, pushdown automaton, transducer, iterated finite automaton, automata group, wreath recursion, epsilon machine, causal state, register machine, counter machine, generalized shift, FRACTRAN, recursive function, Petri net, token firing, network system, cyclic net, mobile automaton, aggregation system, pi machine, reversible computation, sorting network, string rewriting, state transition graph]
RelatedGuides: [ComputationalSystems, TuringMachines, CellularAutomataAndSubstitutionSystems, Combinators, LambdaCalculus]
---

## Abstract

A machine is a state together with a rule that steps it, and its behavior is the sequence of
states it passes through: halting, settling into a cycle, or running forever, with the
transitions it can make forming a graph. Finite automata read one symbol at a time and accept
the regular languages, with a grammar and a stack reaching further, and with the minimal
machine behind a process recovered from its behavior; register, counter and shift machines
compute on numbers rather than symbols, as do the recursive functions; Petri nets fire
transitions on tokens spread over places; network systems rewrite a network of pointers; and
string and sequence machines rewrite a word in place, which is also how a machine is compiled
into hypergraph rewriting.

## Functions

### Running a Machine

- `NestList` (WL) the successive states of a machine stepped from an initial configuration
- `NestWhileList` (WL) the states of a machine run while a condition on the state holds
- `FixedPointList` (WL) the states of a machine run until its configuration stops changing
- `FindTransientRepeat` (WL) the transient and the repeating part of a finite-state evolution
- `NestGraph` (WL) the state transition graph of a successor function
- `TaggedNestGraph` (WL) that graph with each transition tagged by which successor of the state it is
- [`FiniteStateIndicatorIcon`](https://resources.wolframcloud.com/FunctionRepository/resources/FiniteStateIndicatorIcon/) (WFR) an icon for the state of a finite-state system such as the head of a Turing machine
- [`HardSphereSimulation`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/HardSphereSimulation) (Wolfram Cloud) hard spheres moving in a box of a given number of dimensions, stepped from an initial configuration

- `Nest` (WL), `NestWhile` (WL), `FixedPoint` (WL), `FindRepeat` (WL), `Fold` (WL), `FoldList` (WL), `NestTree` (WL), `Trace` (WL), `ArrayPlot` (WL), `Graph` (WL), …

### Finite Automata and Regular Languages

- [`FiniteAutomaton`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiniteAutomaton.html) (WolframInstitute/PureMath) a finite automaton as a first-class object
- [`DFA`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/DFA.html) (WolframInstitute/PureMath) a deterministic finite automaton, one transition for each state and symbol
- [`NFA`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/NFA.html) (WolframInstitute/PureMath) a nondeterministic finite automaton, several transitions allowed on a symbol
- [`NFAToDFA`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/NFAToDFA.html) (WolframInstitute/PureMath) the subset-construction determinization of an NFA
- [`AutomatonMinimize`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AutomatonMinimize.html) (WolframInstitute/PureMath) the minimal automaton equivalent to a given one
- [`RegularExpressionToAutomaton`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RegularExpressionToAutomaton.html) (WolframInstitute/PureMath) the automaton accepting a regular expression's language
- `RegularExpression` (WL) a regular language written as a pattern and matched against strings
- [`NFASimulation`](https://resources.wolframcloud.com/FunctionRepository/resources/NFASimulation/) (WFR) the behavior of a nondeterministic finite automaton on an input
- [`NFAPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/NFAPlot/) (WFR) a nondeterministic finite automaton drawn as its transition diagram
- [`ContextFreeGrammar`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ContextFreeGrammar.html) (WolframInstitute/PureMath) a context-free grammar as a first-class object
- [`PushdownAutomaton`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PushdownAutomaton.html) (WolframInstitute/PureMath) a pushdown automaton with acceptance testing, a finite automaton with a stack
- [`IteratedFiniteAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/IteratedFiniteAutomaton/) (WFR) a transducer finite automaton applied iteratively, its output read back as input
- [`CATransducerGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CATransducerGraph/) (WFR) the annotated state transition graph of a cellular automaton rule read as a transducer

- `StringMatchQ` (WL), `StringCases` (WL), `StringContainsQ` (WL), `StringExpression` (WL), …

### Machines Inferred from Behavior

- [`EpsilonMachine`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/EpsilonMachine.html) (WolframInstitute/PureMath) the minimal unifilar predictor of a stationary process, its causal states and transitions
- [`CausalStatePartition`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalStatePartition.html) (WolframInstitute/PureMath) the classes of pasts under identical conditional futures, the states of that machine
- [`CausalStateCount`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CausalStateCount.html) (WolframInstitute/PureMath) how many causal states a process has at a stated history length
- [`FiniteStateMachineClassify`](https://github.com/WolframInstitute/ProgramGames) (WolframInstitute/ProgramGames) finite-state machines grouped by behavioral equivalence, one representative for each class

### Register, Counter and Shift Machines

- [`MultiwayRegisterMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayRegisterMachine/) (WFR) a nondeterministic register machine evolved as a multiway system
- [`GeneralizedShift`](https://resources.wolframcloud.com/FunctionRepository/resources/GeneralizedShift/) (WFR) the evolution of Moore's generalized shift, a machine written as a map on a digit sequence
- [`MultiwayGeneralizedShiftGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayGeneralizedShiftGraph/) (WFR) the multiway state graph of a nondeterministic generalized shift
- [`Fractran`](https://resources.wolframcloud.com/FunctionRepository/resources/Fractran/) (WFR) the FRACTRAN language interpreted, a register machine written as a list of fractions
- `ShiftRegisterSequence` (WL) the maximum-length sequence of a linear-feedback shift register
- [`RecursiveFunction`](https://resources.wolframcloud.com/FunctionRepository/resources/RecursiveFunction/) (WFR) the values of an arbitrary recursive function
- [`AckermannFunction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AckermannFunction.html) (WolframInstitute/PureMath) the Ackermann function, total but not primitive recursive
- [`PrimitiveRecursiveQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PrimitiveRecursiveQ.html) (WolframInstitute/PureMath) whether a function is primitive recursive

- [`AdaptiveRegisterMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/AdaptiveRegisterMachine/) (WFR), [`RecursiveFunctionCallGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/RecursiveFunctionCallGraph/) (WFR), …

### Petri Nets and Token Firing

- [`MakePetriNet`](https://resources.wolframcloud.com/FunctionRepository/resources/MakePetriNet/) (WFR) an abstract representation of a Petri net configuration, its places, transitions and tokens
- [`PetriNetNondeterministicEvolution`](https://resources.wolframcloud.com/FunctionRepository/resources/PetriNetNondeterministicEvolution/) (WFR) a Petri net evolved by firing one randomly chosen transition at each step
- [`PetriNetMultiwayEvolution`](https://resources.wolframcloud.com/FunctionRepository/resources/PetriNetMultiwayEvolution/) (WFR) a Petri net evolved by applying all possible transition firings
- [`MultiwayPetriNet`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayPetriNet/) (WFR) the evolution of a Petri net configuration as a multiway system
- [Petri category sequencer for Peano axioms' rewriting system](https://community.wolfram.com/t/26058) (Wolfram Community) a Petri net read as a category and used to sequence a rewriting system for the Peano axioms

### Network Systems

- [`NetworkSystemRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/NetworkSystem/ref/NetworkSystemRule.html) (WolframInstitute/NetworkSystem) the rule of a network system, numbered by index over the transformations up to a given distance
- [`NetworkSystemEvolutionList`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/NetworkSystem/ref/NetworkSystemEvolutionList.html) (WolframInstitute/NetworkSystem) the history of a network system evolved from an initial network for a number of steps
- [`NetworkSystemEvolutionPlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/NetworkSystem/ref/NetworkSystemEvolutionPlot.html) (WolframInstitute/NetworkSystem) the evolution of a two-link neighbor-dependent network system drawn step by step
- [`NetworkSystemDisplay`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/NetworkSystem/ref/NetworkSystemDisplay.html) (WolframInstitute/NetworkSystem) a network state drawn as a graphic
- [`CyclicNet`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/NetworkSystem/ref/CyclicNet.html) (WolframInstitute/NetworkSystem) a cyclic network of a given node count, the standard initial condition
- [`OrderedGraphModelPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/OrderedGraphModelPlot/) (WFR) an ordered trivalent graph drawn
- [Enumerating local rewriting rules for two-link network systems](https://community.wolfram.com/t/25285) (Wolfram Community) the local rewriting rules of two-link network systems enumerated and surveyed

### String and Sequence Rewriting Machines

- `StringReplaceList` (WL) every string one rewrite produces, one per occurrence of a rule
- `SequenceReplace` (WL) a matching subsequence of a list replaced by the result of a rule
- [`SequentialSubstitutionSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/SequentialSubstitutionSystem/) (WFR) a string rewritten by scanning for the first applicable rule at each step
- [Compiling different models of computation into hypergraph rewriting](https://community.wolfram.com/t/20343) (Wolfram Community) finite automata, Turing machines and register machines compiled into Wolfram model rules

- `SubstitutionSystem` (WL), `StringReplace` (WL), `StringPosition` (WL), `SequenceCases` (WL), `SequencePosition` (WL), `ReplaceList` (WL), …

### KlausSutner/Automata

- [KlausSutner/Automata](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/) an automata theory package: finite state machines, transition systems, regular languages, semigroups and string rewriting
- [`FA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/FA.html) a finite state machine, a transition system together with its traits
- [`DFAQ`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/DFAQ.html) whether a machine is deterministic
- [`DeterminizeFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/DeterminizeFA.html) the Rabin-Scott determinization of a machine, with epsilon elimination where needed
- [`MinimizeFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/MinimizeFA.html) the minimal machine accepting the same language
- [`RegexToFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/RegexToFA.html) a regular expression converted to a machine over an alphabet
- [`LanguageFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/LanguageFA.html) the words of a given length in the language of a machine
- [`EquivalentQFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/EquivalentQFA.html) whether two machines accept the same language
- [`RewriteString`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/RewriteString.html) a string reduced by a system of directed rewrite rules
- [`RewriteToIrreducible`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/RewriteToIrreducible.html) the irreducible words over an alphabet under a system of directed rewrite rules

- [`TransitionSystem`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/TransitionSystem.html), [`TransitionSystemGraph`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/TransitionSystemGraph.html), [`EpsilonEliminationFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/EpsilonEliminationFA.html), [`TrimFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/TrimFA.html), [`MinimizeDFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/MinimizeDFA.html), [`IsomorphicQDFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/IsomorphicQDFA.html), [`NNFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/NNFA.html), [`RewriteRulesSimplify`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/RewriteRulesSimplify.html), …
- [`ProductFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ProductFA.html), [`IntersectionFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/IntersectionFA.html), [`UnionFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/UnionFA.html), [`ComplementFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ComplementFA.html), [`ConcatenateFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ConcatenateFA.html), [`KleeneStarFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/KleeneStarFA.html), [`ReverseFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ReverseFA.html), [`SemigroupGenerate`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/SemigroupGenerate.html), [`ComputationFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ComputationFA.html), [`GrowthFunctionDFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/GrowthFunctionDFA.html), [`PlotFA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/PlotFA.html), …

### WolframInstitute/IteratedFiniteAutomaton

- [WolframInstitute/IteratedFiniteAutomaton](https://github.com/WolframInstitute/IteratedFiniteAutomaton) iterated finite automata and the automata groups they generate, with conversion between the Mealy and wreath recursion forms
- [`IteratedFiniteAutomaton`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) the evolution of the iterated finite automaton with a given rule from an initial condition for a number of steps
- [`IteratedFiniteAutomatonEvolve`](https://github.com/WolframInstitute/IteratedFiniteAutomaton) the evolution of a converted automaton from an initial condition
- [`IteratedFiniteAutomatonStateGraph`](https://github.com/WolframInstitute/IteratedFiniteAutomaton) the state transition diagram of an automaton, its edges tagged from input to output
- [`IteratedFiniteAutomatonStateTransitions`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) the evolution recording the transition taken at each cell
- [`IteratedFiniteAutomatonFromStates`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) a Mealy transducer given by named states converted to a rule
- [`IteratedFiniteAutomatonFromWreath`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) a wreath recursion converted to a rule
- [`AutomatonWreathRecursion`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) the wreath recursion of an automaton, each state as its outputs and sections
- [`AutomatonGroupBall`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) one shortest word for each nontrivial element of a level quotient of the automaton group
- [`FindAutomatonRelations`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) the shortest relators of the automaton group discoverable in a ball of a given radius

- [`IteratedFiniteAutomatonPeriodicStop`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`IteratedFiniteAutomatonStateSubgraph`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`IteratedFiniteAutomatonStateSubgraphFamily`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`IteratedFiniteAutomatonSample`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`IteratedFiniteAutomatonInitialConditionSample`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`IteratedFiniteAutomatonsByRule`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`IteratedFiniteAutomatonsByInitialCondition`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`IteratedFiniteAutomatonsMatrix`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`IteratedFiniteAutomatonColors`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), …
- [`AutomatonProduct`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonAdderCascade`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWindowProgram`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonFromWreathString`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonData`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonRuleFromWord`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonBoundaryGraph`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), …
- [`AutomatonSection`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonSectionTable`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWordSection`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWordSectionClosure`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonNucleus`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonLevelPermutations`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWordPermutation`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWordBall`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWordOrder`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWordOrders`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWordIdentityQ`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonWordEqualQ`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonElementCount`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonAbelianQ`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonTorsionFreeCandidateQ`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonGroupFingerprint`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`FindAutomatonTorsionElements`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonRuleFromCode`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonCodeFromRule`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`CanonicalAutomatonCode`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`InvertibleAutomatonQ`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), [`AutomatonTreePortrait`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl), …

### WolframInstitute/PiMachine

- [WolframInstitute/PiMachine](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/) a universal reversible machine, reversible computation built on the Pi calculus and compact closed categories
- [`PiTerm`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiTerm.html) a term of the machine, with its type and an optional label
- [`PiState`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiState.html) the state of a reduction: a combinator, a term, a continuation, a kind and a direction
- [`PiReduce`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiReduce.html) a state reduced by one step under the reduction rules
- [`PiEval`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiEval.html) a state evaluated until it terminates
- [`PiEvalTrace`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiEvalTrace.html) the intermediate states of that evaluation
- [`PiInverse`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiInverse.html) the inverse type annihilating a given term, the reverse direction of a computation
- [`PiCombinator`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiCombinator.html) the basic combinator terms the machine composes
- [`PiFunction`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiFunction.html) the function type from one type to another
- [`PiMachineDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiMachineDiagram.html) a term drawn as a machine diagram

- [`PiPlus`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiPlus.html), [`PiTimes`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiTimes.html), [`PiMinus`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiMinus.html), [`PiZero`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiZero.html), [`PiOne`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiOne.html), [`PiUnit`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiUnit.html), [`PiHole`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiHole.html), [`PiMachinePort`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiMachinePort.html), [`PiStateQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiStateQ.html), [`PiTermQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiTermQ.html), [`PiTypeQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiTypeQ.html), [`PiContinuation`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiContinuation.html), [`PiChoice`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/PiMachine/ref/PiChoice.html), …

### wolframphysics.org

- [`BatcherSort`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/SortingNetworks.wl) the Batcher odd-even merge sorting network for a number of elements
- [`OptimalSort`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/SortingNetworks.wl) the known optimal sorting networks for up to sixteen elements
- [`OddEvenTranspositionSort`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/SortingNetworks.wl) the odd-even transposition sorting network
- [`PairwiseSort`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/SortingNetworks.wl) the pairwise sorting network for a number of elements that is a power of two
- [`InsertionSort`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/SortingNetworks.wl) the insertion sorting network for a number of elements that is a power of two
- [`ApplySorting`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/SortingNetworks.wl) a whole sorting network applied to a list
- [`ApplySortingList`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/SortingNetworks.wl) the intermediate lists after each layer of a sorting network
- [`StringRuleToWMRule`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/StringToWMSet.wl) string substitution rules converted to Wolfram model hypergraph rules
- [`StringToWMSet`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/StringToWMSet.wl) a string encoded as a hypergraph with one hyperedge per character
