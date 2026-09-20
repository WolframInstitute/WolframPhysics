---
Template: Guide
Name: ComputationalSystems
Title: Computational Systems
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/ComputationalSystems
Description: Combinators and their reduction, lambda calculus and expression evaluation, Turing machines, cellular automata, substitution and tag systems, and the finite automata, register machines, Petri nets and network systems beside them
Keywords: [computational system, combinator, combinatory logic, lambda calculus, beta reduction, turing machine, cellular automaton, substitution system, tag system, finite automaton, register machine, Petri net, network system, ruliology, universality]
RelatedGuides: [WolframPhysics, Combinators, LambdaCalculus, TuringMachines, CellularAutomataAndSubstitutionSystems, AutomataAndMachines]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)"]
---

## Abstract

Simple computational systems produce the same range of behavior hypergraph rewriting does, and are studied with the same constructions: combinator expressions and their reduction to normal form; lambda terms, beta reduction and the causal graph of an expression evaluation; Turing machines, their rules, rule spaces and busy beaver searches; cellular automata, substitution and tag systems; and the finite automata, register machines, Petri nets and network systems beside them. Each area has its own guide.

## Functions

### [Combinators](paclet:WolframInstitute/WolframPhysics/guide/Combinators)

- `CombinatorS` (WL), `CombinatorK` (WL) the Schönfinkel basic combinators, the basis in which every combinator expression can be written
- [`CombinatorReduce`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CombinatorReduce.html) (WolframInstitute/PureMath) one contraction of the leftmost-outermost redex of an SKI combinator term
- [`CombinatorEvolve`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolve/) (WFR) the evolution of a combinator expression for a number of steps under given rules and an evaluation scheme
- [`MultiwayCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayCombinator/) (WFR) the states graph of a combinator expression under every choice of redex, the evaluation orders of the expression as branches
- [`BracketAbstraction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/BracketAbstraction.html) (WolframInstitute/PureMath) the SKI combinator term that eliminates a variable from a term, behaving as the lambda abstraction over it

### [Lambda Calculus](paclet:WolframInstitute/WolframPhysics/guide/LambdaCalculus)

- `Function` (WL) an anonymous function of named parameters or numbered slots, the lambda abstraction the language itself provides
- [`LambdaTerm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaTerm.html) (WolframInstitute/PureMath) the canonical lambda term of an expression, with bare symbols as variables, left-associated application and curried abstraction
- [`BetaReduce`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReduce.html) (Wolfram/Lambda) iterated beta reduction of every reducible subexpression of a lambda term
- [`TraceCausalGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TraceCausalGraph/) (WFR) the causal graph of an expression evaluation, built from its evaluation trace, with the evaluation path and its events graph as further properties
- [`LambdaDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaDiagram.html) (Wolfram/Lambda) a lambda term drawn as Tromp's lambda diagram

### [Turing Machines](paclet:WolframInstitute/WolframPhysics/guide/TuringMachines)

- `TuringMachine` (WL) the evolution of a Turing machine with a given rule from an initial condition for a number of steps
- `RulePlot` (WL) the rule of a Turing machine and its evolution drawn as icons
- [`MultiwayTuringMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/) (WFR) a Turing machine with several rules for one state and color, every choice followed as a branch of the evolution
- [`TuringMachineCausalGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineCausalGraph/) (WFR) the causal graph of the updating events of a Turing machine evolution
- [`TuringMachineFromNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineFromNumber/) (WFR), [`TuringMachineToNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineToNumber/) (WFR) the explicit rules of a numbered Turing machine, and the number of an explicit list of rules

### [Cellular Automata and Substitution Systems](paclet:WolframInstitute/WolframPhysics/guide/CellularAutomataAndSubstitutionSystems)

- `CellularAutomaton` (WL) the evolution of a cellular automaton with a given rule from an initial condition, in any number of dimensions
- [`CellularAutomatonFromNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/CellularAutomatonFromNumber/) (WFR) the explicit list of rules a cellular automaton number stands for
- `SubstitutionSystem` (WL) the evolution of a string or list substitution system with a given rule from an initial condition
- [`TagSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/TagSystem/) (WFR) the evolution of a tag system, a fixed number of elements deleted from the front and a block appended at the back
- [`SubstitutionSystemCausalGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalGraph/) (WFR) the causal graph of a string substitution system, its events the individual replacements

### [Automata and Other Machines](paclet:WolframInstitute/WolframPhysics/guide/AutomataAndMachines)

- [`FiniteAutomaton`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiniteAutomaton.html) (WolframInstitute/PureMath) a finite automaton as a first-class object
- [`EpsilonMachine`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/EpsilonMachine.html) (WolframInstitute/PureMath) the minimal unifilar predictor of a stationary process, its causal states and transitions
- [`MultiwayRegisterMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayRegisterMachine/) (WFR) a nondeterministic register machine evolved as a multiway system
- [`MakePetriNet`](https://resources.wolframcloud.com/FunctionRepository/resources/MakePetriNet/) (WFR) an abstract representation of a Petri net configuration, its places, transitions and tokens
- [`NetworkSystemRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/NetworkSystem/ref/NetworkSystemRule.html) (WolframInstitute/NetworkSystem) the rule of a network system, numbered by index over the transformations up to a given distance
