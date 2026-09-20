---
Template: Guide
Name: MultiwaySystems
Title: Multiway Systems
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/MultiwaySystems
Description: Applying every rule in every possible way: one multiway step, multiway systems and multihistories over strings, lists, hypergraphs and other systems, the states, evolution and token-event graphs, branch pairs, critical pairs and confluence, and the sampling and pruning of a growing exploration
Keywords: [multiway system, multihistory, nondeterministic rewriting, branching, states graph, evolution graph, token-event graph, glocal multiway system, branch pair, critical pair, confluence, normal form, Knuth-Bendix completion, parallel independence, string rewriting, multiset substitution system, multiway Turing machine, multiway combinator, substitution, cosubstitution, bisubstitution, exploration, pruning]
RelatedGuides: [Multicomputation, CausalGraphs, BranchialGraphs, RulialSpace, WolframModels, RewritingEngines, Hypergraphs, RuleSpace]
---

## Abstract

A multiway system applies every rule to a state in every possible way and keeps every result
instead of choosing one: the single step that produces all the successors of a state; the
multiway systems and multihistories that collect the states reached and the events that reach
them, over strings, lists, hypergraphs and multisets of tokens; the states, evolution and
token-event graphs that relate states, events and the tokens events consume and create; the
branch pairs and critical pairs where two rewrites compete, and the completion and confluence
that resolve them; the multiway systems of Turing machines, combinators, operator systems and
lambda expressions; and the sampling and pruning that keep a growing exploration finite.

## Functions

### Applying a Rule in Every Possible Way

- `ReplaceList` (WL) all the results of transforming an expression by a rule or list of rules in every possible way, one multiway step of an expression rewriting system
- `StringReplaceList` (WL) the strings obtained by replacing each single occurrence of a substring, one multiway step of a string substitution system
- [`MultiReplace`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiReplace/) (WFR) every replacement of an expression under rules together with the position at which it occurs, by substitution, cosubstitution or bisubstitution

- `StringReplace` (WL), `SequenceReplace` (WL), `SequenceCases` (WL), `SequencePosition` (WL), `StringCases` (WL), `StringPosition` (WL), `StringReplacePart` (WL), `StringExpression` (WL), `ReplaceAt` (WL), `ReplacePart` (WL), `NestTree` (WL), `Trace` (WL), …

### Multiway Systems and Multihistories

- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the multiway system of a string, list, cellular automaton or Wolfram model rule, with `"StatesGraph"`, `"EvolutionGraph"`, `"CausalGraph"` and `"BranchialGraph"` among its properties
- [`Multi`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Multicomputation/ref/Multi.html) (Wolfram/Multicomputation) an object that acts as several expressions at once, the lazy nondeterministic rewriting system of an expression under rules
- [`GenerateMultihistory`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/GenerateMultihistory.md) (SetReplace) every history of a system from an initial state, under event-selection and stopping parameters
- [`Multihistory`](https://github.com/maxitg/SetReplace) (SetReplace) the object holding the evaluation of a possibly nondeterministic computational system, convertible to a Wolfram model evolution object
- [`MultisetSubstitutionSystem`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Systems/MultisetSubstitutionSystem.md) (SetReplace) a rewriting system that replaces submultisets of tokens matching patterns in any order by the result of an expression, the system a multihistory generator evaluates
- [`WolframModel`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/WolframModelAndWolframModelEvolutionObject.md) (SetReplace) the multiway evolution of a Wolfram model, selected by its `"EventSelectionFunction"` option in place of the single-way default
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) (WolframInstitute/HypergraphRewriteEngine) multiway hypergraph rewriting on a native engine, its states, events and causal and branchial structure computed outside the kernel
- [`GenerationalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/GenerationalMultiwaySystem/) (WFR) the evolution of a generational multiway system, every event of a generation applied at once, with its states graph and associated properties

### The States, Evolution and Token-Event Graphs

- `NestGraph` (WL) the graph of the states reached by applying a function repeatedly, the multiway graph of any successor function
- `TaggedNestGraph` (WL) the same graph with each edge tagged by the position of the successor among the results the function returns
- [`NestGraphTagged`](https://resources.wolframcloud.com/FunctionRepository/resources/NestGraphTagged/) (WFR) a nest graph whose edges are tagged differently for the different outputs of the function, with labeled states and styled rules
- [`TokenEventGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph/) (WFR) the token-event graph of a multicomputational evolution according to particular rules, with token, state and event deduplication options
- [`MultiEvaluate`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/MultiEvaluate) (Wolfram Cloud) the multiway evaluation of an expression in every possible order of its subexpressions, with `"StatesGraph"`, `"EvolutionGraph"` and `"CausalGraph"` properties
- [`WolframModelGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelGlocalMultiwaySystem/) (WFR) the evolution of a Wolfram model as a glocal multiway system, the global events and causal structure of an ordinary multiway system combined with the individual tokens of a local one
- [`MultiwayEvolutionPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayEvolutionPlot/) (WFR) a plot of the evolution of a string multiway system

- [`AccumulativeTokenEventGraph`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/AccumulativeTokenEventGraph) (Wolfram Cloud), [`MergeTree`](https://resources.wolframcloud.com/FunctionRepository/resources/MergeTree/) (WFR), [`FoldGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/FoldGraph/) (WFR), …

### Branch Pairs, Critical Pairs and Confluence

- [`BranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/BranchPairs/) (WFR) the branch pairs of a multiway system after a number of steps, the pairs of states reached from a common state by two different rule applications
- [`StringRewritingBranchPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingBranchPairs.html) (WolframInstitute/PureMath) the branch pairs of a string under a string rewriting system, one for each pair of distinct redexes with their two successors and whether the redexes overlap
- [`CanonicalBranchPairs`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalBranchPairs/) (WFR) the canonical branch pairs of a set of rules, independent of the initial condition, sorted into resolved and unresolved after a number of steps
- [`StringRewritingCriticalPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingCriticalPairs.html) (WolframInstitute/PureMath) the critical pairs of a string rewriting system, the shortest words carrying two overlapping redexes together with their two one-step reducts
- [`HypergraphCriticalPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphCriticalPairs.html) (WolframInstitute/PureMath) the critical pairs of two double-pushout hypergraph rewriting rules, the parallel-dependent pairs of steps out of the overlaps of their left-hand sides
- [`HypergraphUnifications`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/HypergraphUnifications.md) (SetReplace) all the hypergraphs that contain subgraphs matching both of two hypergraphs, the overlaps of rule inputs a critical pair comes out of
- [`StringRewritingConfluentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingConfluentQ.html) (WolframInstitute/PureMath) whether a string rewriting system is confluent, decided by sound criteria on its critical pairs
- [`KnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/KnuthBendixCompletion/) (WFR) the Knuth-Bendix completion rules of a multiway system after a number of steps, the rewrite rules that would resolve its branch pairs
- [`StringRewritingNormalForms`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingNormalForms.html) (WolframInstitute/PureMath) the normal forms reachable from a string under a string rewriting system, the irreducible strings found by breadth-first search over the one-step relation

### Multiway Systems of Other Computational Systems

- [`MultiwayTuringMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/) (WFR) the evolution of a nondeterministic Turing machine as a multiway system, with its states, causal and branchial graphs
- [`MultiwayCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayCombinator/) (WFR) the evaluation of a combinator expression as a multiway system
- [`MultiwayOperatorSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/) (WFR) the evaluation of a formal operator expression as a multiway system based on transformations of patterns, as with the axioms of a theory
- [`MultiwayFunctionSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayFunctionSystem/) (WFR) a multiway system based on the evaluation of a function with multiple results over the integers
- [`LambdaMultiwayGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaMultiwayGraph.html) (Wolfram/Lambda) the multiway graph of the beta reductions of a lambda expression

- [`WeylMultiwayFinite`](https://github.com/SamWhittington/WeylMultiwaySystem/blob/main/WeylMultiwayFinite.m) (GitHub), [`WeylMultiwayAffine`](https://github.com/SamWhittington/WeylMultiwaySystem/blob/main/WeylMultiwayAffine.m) (GitHub), [Multiway Turing Machines program file](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) (Writings), …

### Sampling and Pruning a Growing Exploration

- [`HGSessionOpen`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionOpen.html) (WolframInstitute/HypergraphRewriteEngine) a continuable exploration opened for a property and held by an engine worker, returned as a session object
- [`HGSessionStep`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionStep.html) (WolframInstitute/HypergraphRewriteEngine) a session's exploration carried a number of steps further from the frontier it stopped at
- [`DepthFirstSearch`](https://resources.wolframcloud.com/FunctionRepository/resources/DepthFirstSearch/) (WFR) a search through a multiway space for its special termination points
- [`TreeSearch`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/TreeSearch) (Wolfram Cloud) a state-space search over a problem given by callbacks, uninformed, informed, adversarial or Monte Carlo
- `TimeConstrained` (WL) an exploration stopped after a number of seconds, for a multiway system that may never terminate

### Wolfram Function Repository

- [`MultiwayGroup`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayGroup/) an arbitrary group simulated as a multiway system
- [`MultiwayMonoid`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayMonoid/) an arbitrary monoid simulated as a multiway system
- [`MultiwaySemigroup`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySemigroup/) an arbitrary semigroup simulated as a multiway system
- [`CayleyNestGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CayleyNestGraph/) a generalized Cayley graph built from generators and relations
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
- [`MultiStringReplace`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) every way of applying a string rule at non-overlapping positions, as an association
- [`ApplyStringRules`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) string rules applied to a linked hypergraph
- [`EvolutionGraph`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) the evolution graph of a multiway system over a number of steps
- [`MultiTokenEventGraph`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel) the token-event graph of a multiway system over a number of steps

- [`StringMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`HypergraphMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`WolframModelMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`CAMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`WIHypergraphMulti`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`MultiwaySystemQ`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`LinkedHypergraphQ`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), [`MultiwayType`](https://github.com/WolframInstitute/Multicomputation/tree/master/Multicomputation/Kernel), …

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

- [A simple multiway example: radioactive decay](https://community.wolfram.com/t/19202), [Multiway circular-string rewrite systems](https://community.wolfram.com/t/16379), [Exploring statistical mechanics in string substitution systems](https://community.wolfram.com/t/16368), [On the mergers of numerical multiway systems](https://community.wolfram.com/t/22476), [Multi-way tag systems with symbolic rewriting](https://community.wolfram.com/t/25373), …
