---
Template: Guide
Name: CellularAutomataAndSubstitutionSystems
Title: Cellular Automata and Substitution Systems
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/CellularAutomataAndSubstitutionSystems
Description: Cellular automaton rules and evolution, rule numbering, enumeration and classification, substitution systems and L-systems, tag and cyclic tag systems, the multiway and causal versions of these systems, and the encodings that turn them into hypergraph rewriting
Keywords: [cellular automaton, elementary cellular automaton, rule icon, rule number, rule space, rule enumeration, wolfram class, reversible cellular automaton, block cellular automaton, probabilistic cellular automaton, mobile automaton, substitution system, sequential substitution system, l-system, tag system, cyclic tag system, post tag system, multiway system, causal graph, aggregation system, growth, tiling, ruliology, encoding, hypergraph rewriting]
RelatedGuides: [ComputationalSystems, Combinators, LambdaCalculus, TuringMachines, AutomataAndMachines, RuleSpace, Visualization]
Links: ["[WolframInstitute/CellularAutomaton on GitHub](https://github.com/WolframInstitute/CellularAutomaton)", "[maxitg/PostTagSystem on GitHub](https://github.com/maxitg/PostTagSystem)", "[Obando/CAGenetics paclet](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/)", "[KlausSutner/Automata paclet](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/)"]
---

## Abstract

A cellular automaton updates every cell of an array at once from the colors in its neighborhood,
a substitution system replaces each element by a block, and a tag system deletes elements from
the front of a string and appends a block at the back: the rules of these families and the
evolutions they produce, drawn as rule icons and as arrays of colored cells; the numbering,
enumeration, sampling and classification that organize a whole family of rules; substitution
systems and the L-systems whose strings are read as turtle paths; tag and cyclic tag systems;
the multiway versions in which every applicable replacement is followed at once, and the causal
graphs of the replacement events; and the encodings that carry any of these systems into
hypergraph rewriting or into a finite-state machine.

## Functions

### Cellular Automata

- `CellularAutomaton` (WL) the evolution of a cellular automaton with a given rule from an initial condition, in any number of dimensions
- `CenterArray` (WL) a single colored cell in a background of zeros, the standard initial condition of a one-dimensional automaton
- `RulePlot` (WL) a cellular automaton, substitution system or Turing machine rule and its evolution drawn as icons
- `ArrayPlot` (WL) the values of an array shown as a discrete array of squares, the picture of a cellular automaton evolution
- [`BlockCellularAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/BlockCellularAutomaton/) (WFR) the evolution of a cellular automaton whose rule updates fixed blocks of cells that shift between steps
- [`ReversibleCellularAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/ReversibleCellularAutomaton/) (WFR) the evolution of a reversible cellular automaton, each step determined by the two that precede it
- [`ProbabilisticCellularAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/ProbabilisticCellularAutomaton/) (WFR) the evolution of a cellular automaton whose cases fire with given probabilities
- [`MobileAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomaton/) (WFR) the evolution of a mobile automaton, a single active cell moving along the line
- [`CellularAutomatonEvolution`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) the whole spacetime evolution of a rule with given colors and radius, computed on a Rust-accelerated engine
- [`CellularAutomatonOutput`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) the final state such a rule reaches from an initial condition
- [`CellularAutomatonPlot`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) the evolution of a one-dimensional rule drawn as an array of colored cells

- `ArrayPlot3D` (WL), `MatrixPlot` (WL), `FindRepeat` (WL), `ShiftRegisterSequence` (WL), …

### Rule Numbers, Enumeration and Classification

- [`CellularAutomatonFromNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/CellularAutomatonFromNumber/) (WFR) the explicit list of rules a cellular automaton number stands for
- [`CellularAutomatonNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/CellularAutomatonNumber/) (WFR) the rule number of an explicitly given list of cellular automaton cases
- [`RandomCellularAutomatonRule`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomCellularAutomatonRule/) (WFR) a rule sampled at random from a cellular automaton rule space
- [`EnumerateSubstitutionSystemRules`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateSubstitutionSystemRules/) (WFR) the inequivalent string substitution rules with a given signature
- [`RandomSubstitutionSystemRule`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomSubstitutionSystemRule/) (WFR) a random string substitution rule
- [`ComputationalSystemRules`](https://resources.wolframcloud.com/FunctionRepository/resources/ComputationalSystemRules/) (WFR) explicit sets of rules for a computational system of a given kind
- `FindTransientRepeat` (WL) the transient and the repeating part of a finite-state evolution
- [`CellularAutomatonClassify`](https://github.com/WolframInstitute/ProgramGames) (WolframInstitute/ProgramGames) the behavior class a cellular automaton rule falls into
- [`AutomatonParticleDetect`](https://resources.wolframcloud.com/FunctionRepository/resources/AutomatonParticleDetect/) (WFR) the periodic structures moving through the evolution of a one-dimensional cellular automaton
- [`CellularAutomatonRuleCount`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) the number of distinct rules for a given number of colors and radius
- [`CellularAutomatonSearch`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) every rule of a space taking an initial condition to a target or to an exact active width
- [`CellularAutomatonTest`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) whether a rule carries an initial condition to a target state within a number of steps
- [`CellularAutomatonStateWidth`](https://github.com/WolframInstitute/CellularAutomaton) (WolframInstitute/CellularAutomaton) the active width of a state, the extent of its nonzero cells

- `Tuples` (WL), `Subsets` (WL), `Permutations` (WL), `IntegerDigits` (WL), `FromDigits` (WL), …

### Substitution Systems and L-Systems

- `SubstitutionSystem` (WL) the evolution of a string or list substitution system with a given rule from an initial condition
- [`SequentialSubstitutionSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/SequentialSubstitutionSystem/) (WFR) the evolution of a sequential substitution system, one replacement made per step at the first place a rule applies
- [`PrioritizedSubstitutionSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/PrioritizedSubstitutionSystem/) (WFR) the evolution of a substitution system whose replacements are taken in a given priority order
- [`SymbolicSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/SymbolicSystem/) (WFR) the evolution of a symbolic system, rules applied to a symbolic expression rather than a string
- [`LSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/LSystem/) (WFR) the string an L-system produces, its characters read as turtle instructions
- `AnglePath` (WL) the path traced by a sequence of turns, the turtle reading of an L-system string

- `ThueMorse` (WL), `RudinShapiro` (WL), `Nest` (WL), `NestList` (WL), …

### Tag Systems

- [`TagSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/TagSystem/) (WFR) the evolution of a tag system, a fixed number of elements deleted from the front and a block appended at the back
- [`TagSystemEvolveList`](https://resources.wolframcloud.com/FunctionRepository/resources/TagSystemEvolveList/) (WFR) the successive states of a tag system evolution
- [`TagSystemRulePlot`](https://resources.wolframcloud.com/FunctionRepository/resources/TagSystemRulePlot/) (WFR) the rule icon of a tag system
- [`CyclicTagSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/CyclicTagSystem/) (WFR) the evolution of a cyclic tag system, whose rules are used in rotation
- [`CyclicTagSystemEvolveList`](https://resources.wolframcloud.com/FunctionRepository/resources/CyclicTagSystemEvolveList/) (WFR) the successive states of a cyclic tag system evolution
- [`PostTagSystem`](https://github.com/maxitg/PostTagSystem) (maxitg/PostTagSystem) the evolution of Post's tag system from a state given as a head and a tape, as an evolution object
- [`PostTagSystemEvolution`](https://github.com/maxitg/PostTagSystem) (maxitg/PostTagSystem) that evolution object, queried by property for what the run produced
- [`PostTagSystemFinalState`](https://github.com/maxitg/PostTagSystem) (maxitg/PostTagSystem) the state reached within a bounded number of events, or the short state reached first
- [`GeneratePostTagSystemHistory`](https://github.com/maxitg/PostTagSystem) (maxitg/PostTagSystem) an association recording the evolution from an initial state, stopping at a bound or at a checkpoint state
- [`GenerateTagSystemHistory`](https://github.com/maxitg/PostTagSystem) (maxitg/PostTagSystem) the same history for a named tag system other than Post's

- [`ToPackedTagSystemState`](https://github.com/maxitg/PostTagSystem) (maxitg/PostTagSystem), [`FromPackedTagSystemState`](https://github.com/maxitg/PostTagSystem) (maxitg/PostTagSystem), …

### Multiway and Causal Versions

- [`MultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwaySystem/) (WFR) the multiway system of a string substitution or cellular automaton rule, every applicable replacement followed as its own branch
- `NestGraph` (WL) the graph of the states reached by iterating a step function, the multiway graph of any successor function
- [`SubstitutionSystemCausalGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalGraph/) (WFR) the causal graph of a string substitution system, its events the individual replacements

### Encoding One System as Another

- [`encodeCARule`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/encodeCA.wl) (wolframphysics.org), [`encodeCAState`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/encodeCA.wl) (wolframphysics.org) Wolfram model rules emulating an elementary cellular automaton with a given background, and a list of cell colors encoded as a hypergraph
- [`StringRuleToWMRule`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/StringToWMSet.wl) (wolframphysics.org), [`StringToWMSet`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/StringToWMSet.wl) (wolframphysics.org) string substitution rules converted to Wolfram model hypergraph rules, and a string encoded as a hypergraph with one hyperedge per character
- [`CATransducerGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CATransducerGraph/) (WFR) a cellular automaton rule as an annotated state transition graph, the automaton read as a transducer

- [`caRules`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/encodeCA.wl) (wolframphysics.org), [`decodeCAEvolution`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/encodeCA.wl) (wolframphysics.org), [`caCausalGraph`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/CausalGraph-Foliation.wl) (wolframphysics.org), …

### Wolfram Function Repository

- [`SubstitutionSystemPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemPlot/) the evolution of a one-dimensional neighbor-independent substitution system drawn as nested cells
- [`SubstitutionSystemRulePlot`](https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemRulePlot/) the rule icon of a one-dimensional neighbor-independent substitution system
- [`SequentialSubstitutionSystemPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/SequentialSubstitutionSystemPlot/) the evolution of a sequential substitution system drawn step by step
- [`LSystemPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/LSystemPlot/) an L-system drawn as the path its turtle instructions trace
- [`TagSystemEvolve`](https://resources.wolframcloud.com/FunctionRepository/resources/TagSystemEvolve/) the final outcome of a tag system evolution
- [`SequentialCellularAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/SequentialCellularAutomaton/) a cellular automaton whose cells are updated one at a time in a specified order
- [`MobileAutomatonPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomatonPlot/) the evolution of a mobile automaton drawn with the active cell marked
- [`MobileAutomatonRulePlot`](https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomatonRulePlot/) the rule icon of a mobile automaton
- [`AggregationSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/AggregationSystem/) a two-dimensional array grown by adding cells at random wherever the neighborhood matches
- [`GenerateTiling`](https://resources.wolframcloud.com/FunctionRepository/resources/GenerateTiling/) a tiling pattern grown from a set of local template constraints

- [`FindMinimalTilings`](https://resources.wolframcloud.com/FunctionRepository/resources/FindMinimalTilings/), [`CanonicalTilingMask`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalTilingMask/), [`TilingPatternPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/TilingPatternPlot/), [`GenerateHexagonalWangTiling`](https://resources.wolframcloud.com/FunctionRepository/resources/GenerateHexagonalWangTiling/), [`AlgebraicSubstitutionTiling`](https://resources.wolframcloud.com/FunctionRepository/resources/AlgebraicSubstitutionTiling/), [`PeriodicPatternGenerator`](https://resources.wolframcloud.com/FunctionRepository/resources/PeriodicPatternGenerator/), [`DynamicCellularAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/DynamicCellularAutomaton/), [`DynamicCASelector`](https://resources.wolframcloud.com/FunctionRepository/resources/DynamicCASelector/), [`RandomCA`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomCA/), [`SequentialSubstitutionSystemRulePlot`](https://resources.wolframcloud.com/FunctionRepository/resources/SequentialSubstitutionSystemRulePlot/), [`TagSystemConvert`](https://resources.wolframcloud.com/FunctionRepository/resources/TagSystemConvert/), [`PerturbedCellularAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/PerturbedCellularAutomaton/), [`AdaptiveCellularAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/AdaptiveCellularAutomaton/), [`IsingModelCA`](https://resources.wolframcloud.com/FunctionRepository/resources/IsingModelCA/), [`BusyBoxesAutomaton`](https://resources.wolframcloud.com/FunctionRepository/resources/BusyBoxesAutomaton/), [`MobileAutomatonNonlocal`](https://resources.wolframcloud.com/FunctionRepository/resources/MobileAutomatonNonlocal/), [`MultiwayAggregationSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayAggregationSystem/), [`GenerateWangTiling`](https://resources.wolframcloud.com/FunctionRepository/resources/GenerateWangTiling/), …

### Writings

- [Post tag system program file](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) the package accompanying the Post tag system bulletin, holding the functions below
- [`TSEvolveList`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) the successive states of an n-tag system evolution under given replacement rules
- [`TSGenerationEvolveList`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) the states of the Post tag system by generations, one generation processing the whole current state
- [`FindPostTagFate`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) whether an initial condition halts, falls into a cycle or grows
- [`FindPostTagDetails`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) the event count and the cycle details of a Post tag evolution
- [`PhaseStepBackwards`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) all predecessors of a state in phase form, the system run backwards
- [`TagSystemCausalGraph`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) the causal graph of a tag system evolution, read off its list of states
- [`CTEvolve`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`CTEvolveList`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) the final state and the successive states of a cyclic tag system
- [`CTHalting`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) the halting time of a cyclic tag system, or infinity when it never halts
- [`GCSSEvolve`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl) the evolution of a generalized cyclic sequential substitution system

- [`TSStep`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`CTStep`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`TSQueueEvolve`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`TagLengthFunction`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`ToPhaseForm`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`FromPhaseForm`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`AllInits`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`EnumerateInits`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), [`DistinctInits`](https://www.wolframcloud.com/obj/sw-blog/PostTagSystem/Programs-01.wl), …

### Obando/CAGenetics

- [Obando/CAGenetics](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/) a paclet that treats the cases of a cellular automaton rule as genes, for classifying rules and transforming them into one another
- [`GetWolframClass`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/GetWolframClass.html) the Wolfram class of an elementary cellular automaton rule
- [`ComputeWolframClass`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/ComputeWolframClass.html) the Wolfram class computed for a rule with given colors, radius and initial condition
- [`ComputeEntropy`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/ComputeEntropy.html) the entropy of the evolution of a rule from a given initial condition
- [`EquivalentClass`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/EquivalentClass.html) the rules equivalent to a given one in the rule space with given colors and radius
- [`CanonicalRule`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/CanonicalRule.html) the canonical representative of a rule
- [`ReflectRule`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/ReflectRule.html) the rule obtained by reflecting a rule left to right
- [`NegateRule`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/NegateRule.html) the rule obtained by exchanging the colors of a rule
- [`InverseRule`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/InverseRule.html) the inverse rule for a given number of colors and radius
- [`CAPlot`](https://resources.wolframcloud.com/PacletRepository/resources/Obando/CAGenetics/ref/CAPlot.html) the evolution of a rule drawn for given colors, radius and initial condition

### KlausSutner/Automata

- [KlausSutner/Automata](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/) an automata theory paclet whose cellular automaton functions treat a rule as a map on configurations
- [`CA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/CA.html) a cellular automaton of a given width, alphabet size and rule number
- [`ECA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ECA.html) the elementary cellular automaton with a given rule number
- [`OrbitCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/OrbitCA.html) the orbit of a configuration under a cellular automaton for a number of steps
- [`GlobalMapCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/GlobalMapCA.html) the global map of a cellular automaton, assigned to a symbol ready to iterate on a configuration
- [`LocalMapCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/LocalMapCA.html) the local map of a cellular automaton, assigned to a symbol
- [`ConvertToCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ConvertToCA.html) the cellular automaton defined by a local map on a given width and alphabet
- [`ClassifyCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ClassifyCA.html) whether a cellular automaton is surjective, open or injective
- [`BalancedQCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/BalancedQCA.html) whether a cellular automaton is balanced
- [`InverseCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/InverseCA.html) the inverse of a reversible cellular automaton

- [`ComposeCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/ComposeCA.html), [`RuleCA`](https://resources.wolframcloud.com/PacletRepository/resources/KlausSutner/Automata/ref/RuleCA.html), …

### Wolfram Community

- [Unraveling Complexity: A Deep Dive into Multi-Way Tag Systems](https://community.wolfram.com/t/22199) Post's tag system explored as a multiway system
- [Growth and evolution of multi-way tag systems](https://community.wolfram.com/t/24289) a space of multiway tag systems enumerated and searched for the ones of intermediate growth
- [Confluence in multiway cellular automata](https://community.wolfram.com/t/18457) cellular automata evolved as multiway systems and tested for confluence
- [Study backtracking in cellular automata as a multiway system](https://community.wolfram.com/t/18439) the predecessors of a cellular automaton state explored as a multiway system
- [Non-possible blocks of a cellular automaton](https://community.wolfram.com/t/24224) the blocks a cellular automaton can never produce, characterized as a regular language
- [Exploration and characterization of mobile automata](https://community.wolfram.com/t/22416) mobile automata characterized through the graphs their head motion traces
- [Reversibility in mobile automata](https://community.wolfram.com/t/24236) a characterization of which mobile automata are reversible
- [Mobile automata with non-local rules](https://community.wolfram.com/t/24263) mobile automata whose active cell jumps to a distant position
- [Aggregation Systems: A stochastic approach to CA](https://community.wolfram.com/t/14354) aggregation systems run as cellular automata with a random component in a totalistic rule
- [Efficient discovery of halting paths in aggregation system multiway graphs](https://community.wolfram.com/t/22401) halting paths found in the multiway graph of a totalistic aggregation system

- [On chaos in aggregation systems](https://community.wolfram.com/t/24279), [Building blocks' aggregation systems](https://community.wolfram.com/t/24222), [Analyzing terminating behaviors of triangular aggregations using multiway systems](https://community.wolfram.com/t/25745), [Multi-way tag systems with symbolic rewriting, voxel transitions, and non-deterministic state graphs](https://community.wolfram.com/t/25373), [Analysis of multiway sequential cellular automata: class evolution and quad flex case](https://community.wolfram.com/t/25067), [Cyclic string substitution and multiway systems](https://community.wolfram.com/t/16412), [Multi-way Tiling Systems](https://community.wolfram.com/t/18427), [Multiway sandpile models with applications to LCFTs](https://community.wolfram.com/t/20387), [On the density and multiway spectral theory of aggregation systems](https://community.wolfram.com/t/25762), [Exploring neighbor dependent substitution systems using cluster size entropy and MSD](https://community.wolfram.com/t/22388), …
