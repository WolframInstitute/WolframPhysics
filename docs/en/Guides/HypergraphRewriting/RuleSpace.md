---
Template: Guide
Name: RuleSpace
Title: Rule Space
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/RuleSpace
Description: Rule signatures, enumeration and sampling of rules, canonical rule forms and rule numbering, and the search through and classification of cellular automaton, Turing machine and Wolfram model rule spaces
Keywords: [rule space, rule enumeration, rule signature, canonical rule, random rule, rule mutation, ruliology, rule search, rule classification, cellular automaton rule space, Turing machine rule space, registry of notable universes]
RelatedGuides: [HypergraphRewriting, Hypergraphs, WolframModels, Canonicalization, RewritingEngines, RulialSpace, MultiwaySystems, CellularAutomataAndSubstitutionSystems, TuringMachines, AxiomSystemsAndEntailment]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[The Wolfram Function Repository](https://resources.wolframcloud.com/FunctionRepository/)", "[Registry of Notable Universes](https://www.wolframphysics.org/universes/)", "[InfraUniverseRegistry on GitHub](https://github.com/WolframInstitute/InfraUniverseRegistry)"]
---

## Abstract

A rule space is the set of all rules sharing a signature, and surveying one means running
every rule it contains: the signature that fixes the shape of a rule; the enumeration of the
canonical rules of a signature; random sampling and mutation of rules; canonical forms and the
numbering that indexes a space; and the search for rules with a given behavior and the
classification of a space by behavior.

## Functions

### Rule Signatures

- [`EnumerateRuleSignatures`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateRuleSignatures/) (WFR) the possible rule signatures for substitution systems and Wolfram models with a given number of elements
- [`WolframModelRuleValue`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/WolframModelRuleValue.md) (SetReplace) a property of a Wolfram model rule that can be determined without running the evolution, such as its signature, connectivity or maximum arity
- [`$WolframModelRuleProperties`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/WolframModelRuleValue.md) (SetReplace) the properties a Wolfram model rule answers, its signature, arities, node counts and connectedness
- [`WolframModelSignatureForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelSignatureForm/) (WFR) the formatted form of a signature specification for a Wolfram model rule or state
- [`RuleSignatureForm`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-03/RandomRules.wl) (wolframphysics.org) a rule signature written as subscripted counts and arities, with a list of signatures in a row, the published [`WolframModelSignatureForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelSignatureForm/) covers it
- `CycleIndexPolynomial` (WL) the cycle index polynomial of a permutation group, for counting rules and initial conditions up to symmetry

### Enumerating Rules

- [`EnumerateWolframModelRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateWolframModelRules/) (WFR), [`EnumerateWolframModelRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateWolframModelRules.html) (WolframInstitute/Hypergraph) the canonical Wolfram model rules with a given signature, by signature in the resource function and by hyperedge counts and arities in the paclet
- [`EnumerateHypergraphRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateHypergraphRules.html) (WolframInstitute/Hypergraph) the canonical hypergraph rewrite rules whose input and output have given numbers of hyperedges of each arity
- [`EnumerateSubstitutionSystemRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateSubstitutionSystemRules/) (WFR) the inequivalent string substitution rules with a given signature
- [`EnumerateCombinators`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateCombinators/) (WFR) all combinator expressions with a given number of symbols
- [`EnumerateLambdas`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/EnumerateLambdas.html) (Wolfram/Lambda), [`EnumerateSizeLambdas`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/EnumerateSizeLambdas.html) (Wolfram/Lambda) all lambda expressions up to a given depth and length, or with a given number of leaves
- [`StringTuples`](https://resources.wolframcloud.com/FunctionRepository/resources/StringTuples/) (WFR) all tuples of characters from a string, enumerating the initial conditions of a string substitution system
- [`EnumerateInits`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) (Writings) all initial conditions of a given length for a tag system, over every phase
- [`DecodeTuringMachineRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/DecodeTuringMachineRules.html) (WolframInstitute/TuringMachine) the explicit transition rules of the machine with a given rule number
- [`TuringMachineRuleCases`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineRuleCases.html) (WolframInstitute/TuringMachine) the transition triple each state and symbol pair of a rule maps to
- [`TuringMachineRuleCount`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineRuleCount.html) (WolframInstitute/TuringMachine) the number of distinct rules with a given number of states and colors, the size of the space being enumerated
- [`NonTerminatingTuringMachineQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/NonTerminatingTuringMachineQ.html) (WolframInstitute/TuringMachine) whether a machine given as integer rules enters a cycle within a bounded number of steps
- [`EnumerateHypergraphs`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateHypergraphs.html) (WolframInstitute/Hypergraph) the simple connected hypergraphs with given numbers of hyperedges of each arity, the initial conditions a rule space is surveyed over
- [`EnumerateOrderedHypergraphs`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/EnumerateOrderedHypergraphs.html) (WolframInstitute/Hypergraph) the same enumeration with the vertices of each hyperedge ordered

- `Tuples` (WL), `Subsets` (WL), `Permutations` (WL), `IntegerPartitions` (WL), `FromDigits` (WL), `IntegerDigits` (WL), …
- [`EnumerateLinearLambdas`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/EnumerateLinearLambdas.html) (Wolfram/Lambda), [`EnumerateAffineLambdas`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Enumeration.wl) (Wolfram/Lambda), [`RandomSizeLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/RandomSizeLambda.html) (Wolfram/Lambda), …

### Sampling and Mutating Rules

- [`RandomWolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomWolframModel/) (WFR) a random canonical Wolfram model rule with a given signature
- [`RandomHypergraphRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/RandomHypergraphRule.html) (WolframInstitute/Hypergraph) a random hypergraph rewrite rule whose input and output have given numbers of hyperedges of each arity
- [`ModRule`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-03/RandomRules-01.wl) (wolframphysics.org) a Wolfram model rule with one vertex label changed at random, a single mutation of the rule
- [`ShowSamples`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-03/RandomRules.wl) (wolframphysics.org) the final states of a list of sampled rules, drawn as a row of hypergraph plots
- [`BuildNeighborPicture`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-03/RandomRules-01.wl) (wolframphysics.org) the final state of one rule beside a grid of the final states of its neighbors in rule space
- [`RandomLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/RandomLambda.html) (Wolfram/Lambda) a random lambda expression with a given maximum depth and length
- [`RandomHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/RandomHypergraph.html) (WolframInstitute/Hypergraph) a pseudorandom hypergraph on a given number of atoms with given numbers of hyperedges of each arity
- [`RandomConnectedHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/RandomConnectedHypergraph.html) (WolframInstitute/Hypergraph) a pseudorandom connected hypergraph on at most a given number of atoms
- [`RandomAllHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/RandomAllHypergraph.html) (WolframInstitute/Hypergraph) a pseudorandom hypergraph with every hyperedge slot drawn independently and uniformly

### Canonical Forms and Rule Numbering

- [`CanonicalWolframModelRule`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalWolframModelRule/) (WFR) a canonical representation of a Wolfram model rule, the form under which rules are enumerated and compared
- [`CanonicalHypergraphRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/CanonicalHypergraphRule.html) (WolframInstitute/Hypergraph) a canonical form of a hypergraph rule, with the vertices of both sides relabeled by consecutive integers
- [`CanonicalRule`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/CanonicalRule.html) (Obando/CAGenetics) the canonical representative of a cellular automaton rule among the rules equivalent to it
- [`EquivalentClass`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/EquivalentClass.html) (Obando/CAGenetics) the rules equivalent to a given one in the rule space with given colors and radius
- [`StandardOrderIndex`](https://resources.wolframcloud.com/FunctionRepository/resources/StandardOrderIndex/) (WFR) the index of a list of integers in standard order, the first-occurrence relabeling that canonical rules use
- [`StandardOrderFromIndex`](https://resources.wolframcloud.com/FunctionRepository/resources/StandardOrderFromIndex/) (WFR) the list of integers in standard order with a given index
- [`TuringMachineFromNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineFromNumber/) (WFR), [`TuringMachineToNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineToNumber/) (WFR) the explicit rules of a numbered Turing machine, and the number of an explicit list of rules
- [`AutomatonCodeFromRule`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) (WolframInstitute/IteratedFiniteAutomaton) the code number of an iterated finite automaton rule
- [`AutomatonRuleFromCode`](https://github.com/WolframInstitute/IteratedFiniteAutomaton/blob/main/IteratedFiniteAutomaton/Kernel/Usage.wl) (WolframInstitute/IteratedFiniteAutomaton) the rule of an iterated finite automaton read off its code number and its numbers of states and symbols
- [`NetworkSystemRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/NetworkSystem/ref/NetworkSystemRule.html) (WolframInstitute/NetworkSystem) the rule of a network system, numbered by index over the transformations up to a given distance
- `RulePlot` (WL) a Turing machine, cellular automaton or substitution system rule and its evolution drawn as icons
- [`WolframModelData`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelData/) (WFR) a Wolfram model looked up by its registry number, the canonical name a notable rule is filed under

### Searching and Classifying a Rule Space

- [`CellularAutomatonSearch`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) all rules of a cellular automaton rule space taking an initial condition to a target or to an exact active width, searched on a Rust-accelerated engine
- [`TuringMachineProgramSearch`](https://github.com/WolframInstitute/ProgramGames) (WolframInstitute/ProgramGames) every halting Turing machine in the rule space of a given number of states and colors
- [`TuringMachineOutput`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineOutput.html) (WolframInstitute/TuringMachine) the halted outputs of every machine of a rule space on every input in a range
- [`OneSidedTuringMachineFind`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/OneSidedTuringMachineFind.html) (WolframInstitute/TuringMachine) every rule of a space giving the same outputs as a chosen machine, the machines an observer of those outputs cannot tell apart
- [`TuringMachineSteps`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineSteps.html) (WolframInstitute/TuringMachine) the step counts of the halting machines of a rule space over every input in a range
- [`TuringMachineWidths`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineWidths.html) (WolframInstitute/TuringMachine) the greatest head excursion of the halting machines of a rule space
- [`AllDeltaTMRules`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/DeltaTM.wl) (wolframphysics.org) all Turing machines with a given number of states and colors that differ from the identity machine in one case, the delta machines of rulial space
- [`DeltaTMRule`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/DeltaTM.wl) (wolframphysics.org) the rules that change one case of the identity machine to every possible outcome
- [`TuringMachineClassify`](https://github.com/WolframInstitute/ProgramGames) (WolframInstitute/ProgramGames), [`CellularAutomatonClassify`](https://github.com/WolframInstitute/ProgramGames) (WolframInstitute/ProgramGames), [`FiniteStateMachineClassify`](https://github.com/WolframInstitute/ProgramGames) (WolframInstitute/ProgramGames) the rules of a space grouped by behavior, with one representative for each class
- [`ComputeWolframClass`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/ComputeWolframClass.html) (Obando/CAGenetics) the Wolfram class computed for a rule with given colors, radius and initial condition
- [`ClassifyCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ClassifyCA.html) (KlausSutner/Automata) whether a cellular automaton is surjective, open or injective

### Wolfram Function Repository

- [`EnumerateHypergraphs`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateHypergraphs/) all possible ordered hypergraphs with a given signature, the initial conditions over which a rule space is surveyed
- [`ComputationalSystemRules`](https://resources.wolframcloud.com/FunctionRepository/resources/ComputationalSystemRules/) explicit sets of rules for a computational system of a given kind
- [`RandomSubstitutionSystemRule`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomSubstitutionSystemRule/) a random string substitution rule
- [`RandomCellularAutomatonRule`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomCellularAutomatonRule/) a rule sampled at random from a cellular automaton rule space
- [`CellularAutomatonFromNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/CellularAutomatonFromNumber/) the explicit list of rules a cellular automaton number stands for
- [`CellularAutomatonNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/CellularAutomatonNumber/) the rule number of an explicitly given list of cellular automaton cases
- [`RandomCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomCombinator/) a pseudorandom combinator expression
- [`WolframModelRuleForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelRuleForm/) a Wolfram model rule written with letters in place of its vertex labels
- [`WolframModelTraditionalForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelTraditionalForm/) a Wolfram model displayed in an analogue of traditional mathematical notation
- [`WolframModelRuleProduct`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelRuleProduct/) the product of Wolfram model rules, used in local symmetry analysis

- [`TupleIndex`](https://resources.wolframcloud.com/FunctionRepository/resources/TupleIndex/), [`TupleFromIndex`](https://resources.wolframcloud.com/FunctionRepository/resources/TupleFromIndex/), [`ArrayPatternToIndex`](https://resources.wolframcloud.com/FunctionRepository/resources/ArrayPatternToIndex/), [`ArrayPatternFromIndex`](https://resources.wolframcloud.com/FunctionRepository/resources/ArrayPatternFromIndex/), [`DepthLeafCountSort`](https://resources.wolframcloud.com/FunctionRepository/resources/DepthLeafCountSort/), [`ConnectedWolframModelQ`](https://resources.wolframcloud.com/FunctionRepository/resources/ConnectedWolframModelQ/), …

### WolframInstitute/CellularAutomaton

- [WolframInstitute/CellularAutomaton](https://github.com/WolframInstitute/CellularAutomaton) a paclet for exploring cellular automaton rule spaces, with a Rust-accelerated search engine
- [`CellularAutomatonRuleCount`](https://github.com/WolframInstitute/CellularAutomaton) the number of distinct rules for a given number of colors and radius
- [`CellularAutomatonOutputTable`](https://github.com/WolframInstitute/CellularAutomaton) the output of every rule of a rule space from one initial condition
- [`CellularAutomatonActiveWidths`](https://github.com/WolframInstitute/CellularAutomaton) the greatest and the final active width reached by each rule of a rule space
- [`CellularAutomatonBoundedWidthSearch`](https://github.com/WolframInstitute/CellularAutomaton) the rules whose active region never exceeds a given width
- [`CellularAutomatonWidthRatioSearch`](https://github.com/WolframInstitute/CellularAutomaton) the rules whose output width is a given multiple of the input width
- [`CARuleIterator`](https://github.com/WolframInstitute/CellularAutomaton) a compiled iterator over the rule numbers consistent with fixed pattern constraints

- [`CellularAutomatonTest`](https://github.com/WolframInstitute/CellularAutomaton), [`CellularAutomatonStateWidth`](https://github.com/WolframInstitute/CellularAutomaton), …

### Wolfram Community

- [Structure-Adaptive Evolutionary Framework for Navigating the Rule-space of Hypergraphs](https://community.wolfram.com/t/27334) an evolutionary search over hypergraph rule space, mutating rules under fitness functions read off their evolution
- [Random Wolfram Model Harvesting with Statistics](https://community.wolfram.com/t/16944) random rules harvested in bulk, with growth statistics collected across the sample
- [Classify growth rates for Wolfram Models](https://community.wolfram.com/t/16338) the rules of a signature classified by how fast the states they produce grow
- [Multiple transformation rules that give slow growth](https://community.wolfram.com/t/16448) rule sets searched for slow growth of the hypergraph they generate
- [The Ruliology of Network Mobile Automata](https://community.wolfram.com/t/22389) the rule space of network mobile automata enumerated in canonical form and surveyed by behavior
- [Enumerating local rewriting rules for two-link network systems](https://community.wolfram.com/t/25285) the local rewriting rules of two-link network systems enumerated
- [Random walks in branchial TM space and quest for simplest universal NDTM](https://community.wolfram.com/t/16383) random walks in the branchial space of nondeterministic Turing machines and a search for the simplest universal one
- [Looking for multiway systems of intermediate growth](https://community.wolfram.com/t/16438) a search through rule space for multiway systems whose growth is intermediate
- [Growth and evolution of multi-way tag systems](https://community.wolfram.com/t/24289) a space of multiway tag systems enumerated and searched for the ones of intermediate growth
- [Turing machines with longer head jumps and complexity](https://community.wolfram.com/t/18538) rule spaces of machines whose head may jump more than one cell, surveyed by the complexity of their behavior
