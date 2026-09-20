---
Template: Guide
Name: TuringMachines
Title: Turing Machines
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/TuringMachines
Description: Turing machine rules and evolution, tape and head pictures, nondeterministic and multiway machines, causal graphs of a run, the rulial space of machines, enumeration and busy beaver searches, and encodings of a machine in other computational systems
Keywords: [turing machine, tape, head, state, color, rule number, one-sided turing machine, nondeterministic turing machine, multiway turing machine, branchial space, causal graph, rulial space, delta machine, rule enumeration, busy beaver, halting, universality, tag system, hypergraph encoding]
RelatedGuides: [ComputationalSystems, Combinators, LambdaCalculus, CellularAutomataAndSubstitutionSystems, AutomataAndMachines, RulialSpace, RuleSpace, ProofSystems]
---

## Abstract

A Turing machine moves a head along a tape, reading and writing colors and changing its internal
state by a rule that depends only on the state and the color under the head: the rule, the
initial tape and the evolution they produce, drawn as rule icons and as arrays of cells;
nondeterministic machines whose alternative transitions branch into a multiway system, and the
causal graph of the updating events of a run; the rulial space of all machines with a given
number of states and colors, and the delta machines that differ from the identity machine in one
case; the enumeration of that space by rule number and the busy beaver searches for the
longest-running machines it holds; and the encodings that turn a machine into a hypergraph
rewriting system, a tag system or a machine on a graph.

## Functions

### Machines, Rules and Evolution

- `TuringMachine` (WL) the evolution of a Turing machine with a given rule from an initial condition for a number of steps
- `RulePlot` (WL) the rule of a Turing machine and its evolution drawn as icons
- `ArrayPlot` (WL) the successive tapes of a run shown as a discrete array of squares
- [`TuringMachineImport`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineImport/) (WFR) a machine read from one of the standard Turing machine description formats
- `FindTransientRepeat` (WL) the transient and the repeating part of a finite-state evolution, the cycle a machine falls into

- `NestList` (WL), `NestWhileList` (WL), `FindRepeat` (WL), `CenterArray` (WL), …

### Multiway Machines and Causal Graphs

- [`MultiwayTuringMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayTuringMachine/) (WFR) a Turing machine with several rules for one state and color, every choice followed as a branch of the evolution
- [`TuringMachineCausalGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineCausalGraph/) (WFR) the causal graph of the updating events of a Turing machine evolution
- [`TuringMachineGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineGlocalMultiwaySystem/) (WFR) a nondeterministic machine evolved as a glocal multiway system, global states and individual tokens combined
- [`MultiwayTuringMachineFunction`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTuringMachineFunction.html) (WolframInstitute/TuringMachine) all distinct tape values at the halted states of a nondeterministic machine given as a list of rule numbers
- [`MultiwayTuringMachinePlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTuringMachinePlot.html) (WolframInstitute/TuringMachine) the tape values a multiway machine reaches for each input in a range
- [Random walks in branchial TM space and quest for simplest universal NDTM](https://community.wolfram.com/t/16383) (Wolfram Community) random walks in the branchial space of nondeterministic Turing machines and a search for the simplest universal one

### The Rulial Space of Machines

- [`AllDeltaTMRules`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/DeltaTM.wl) (wolframphysics.org) all Turing machines with a given number of states and colors that differ from the identity machine in one case, the delta machines of rulial space
- [`IdentityTuringMachine`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/DeltaTM.wl) (wolframphysics.org) the machine whose rules leave every state and color unchanged with no head motion
- [`DeltaTMRule`](https://www.wolframcloud.com/obj/wolframphysics/Bulletin/DeltaTM.wl) (wolframphysics.org) the rules that change one case of the identity machine to every possible outcome
- [`TuringMachineRuleCount`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineRuleCount.html) (WolframInstitute/TuringMachine) the number of distinct rules with a given number of states and colors, the size of the space
- [`TuringMachineOutput`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineOutput.html) (WolframInstitute/TuringMachine) the halted outputs of every machine of a rule space on every input in a range
- [`TuringMachineSteps`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineSteps.html) (WolframInstitute/TuringMachine) the step counts of the halting machines of a rule space over every input in a range
- [`TuringMachineWidths`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineWidths.html) (WolframInstitute/TuringMachine) the greatest head excursion of the halting machines of a rule space
- [`OneSidedTuringMachineFind`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/OneSidedTuringMachineFind.html) (WolframInstitute/TuringMachine) every rule of a space giving the same outputs as a chosen machine, the machines an observer of those outputs cannot tell apart

### Enumerating Machines and Busy Beaver Searches

- [`TuringMachineFromNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineFromNumber/) (WFR), [`TuringMachineToNumber`](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineToNumber/) (WFR) the explicit rules of a numbered Turing machine, and the number of an explicit list of rules
- [`TuringMachineProgramSearch`](https://github.com/WolframInstitute/ProgramGames) (WolframInstitute/ProgramGames) every halting machine in the space of rules with a given number of states and colors
- [`TuringMachineClassify`](https://github.com/WolframInstitute/ProgramGames) (WolframInstitute/ProgramGames) the halting machines of a rule space grouped by behavior, with one representative per group
- [`AdaptiveTuringMachine`](https://resources.wolframcloud.com/FunctionRepository/resources/AdaptiveTuringMachine/) (WFR) an adaptive search through Turing machines, mutating a rule toward machines that take longer to halt
- [The Busy Beaver Competition](https://www.wolframcloud.com/obj/nikm/DeployedResources/Data/The-Busy-Beaver-Competition) (Wolfram Cloud) the current busy beaver records, the winning machines and the references for them
- [Turing machines with longer head jumps and complexity](https://community.wolfram.com/t/18538) (Wolfram Community) rule spaces of machines whose head may jump more than one cell, surveyed by the complexity of their behavior

### Machines Encoded in Other Systems

- [`encodeTMRule`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/tmRule.wl) (wolframphysics.org), [`encodeTMState`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/tmRule.wl) (wolframphysics.org) Wolfram model rules emulating a Turing machine with a given background, and a Turing machine state and tape encoded as a hypergraph
- [Compiling different models of computation into hypergraph rewriting](https://community.wolfram.com/t/20343) (Wolfram Community) finite automata, Turing machines and register machines compiled into Wolfram model rules
- [Compiling from a Turing machine to a cyclic tag system](https://community.wolfram.com/t/24633) (Wolfram Community) a Turing machine compiled step by step into a cyclic tag system
- [Turing machines on graphs](https://community.wolfram.com/t/22384) (Wolfram Community) machines whose tape is the vertex set of a graph, the head moving along edges

- [`tmRule`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/tmRule.wl) (wolframphysics.org), [`tmRules`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/tmRule.wl) (wolframphysics.org), [`decodeTMEvolution`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/tmRule.wl) (wolframphysics.org), …

### WolframInstitute/TuringMachine

- [WolframInstitute/TuringMachine](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/) a paclet for running and surveying Turing machines, one-sided and multiway, on a compiled engine
- [`OneSidedTuringMachineFunction`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/OneSidedTuringMachineFunction.html) the integer left on the tape by a deterministic one-sided Turing machine run on an input for a bounded number of steps
- [`OneSidedTuringMachineEvolution`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/OneSidedTuringMachineEvolution.html) the step-by-step evolution of a one-sided machine as a list of configurations
- [`OneSidedTuringMachinePlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/OneSidedTuringMachinePlot.html) the space-time evolution of a one-sided Turing machine run on an input
- [`DecodeTuringMachineRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/DecodeTuringMachineRules.html) the explicit transition rules of the machine with a given rule number
- [`TuringMachineRuleCases`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineRuleCases.html) the transition triple each state and symbol pair of a rule maps to
- [`RunMachine`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/RunMachine.html) a decoded symbolic machine run on a list of input bits
- [`ShowTapeConfiguration`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/ShowTapeConfiguration.html) a tape drawn with the head state at its position and runs of equal cells compressed
- [`OneSidedTuringMachineMultiwayGraph`](https://github.com/WolframInstitute/TuringMachine/blob/main/TuringMachine/Kernel/Multiway.wl) the multiway graph of a one-sided Turing machine
- [`MultiwayTuringMachineSearch`](https://github.com/WolframInstitute/TuringMachine/blob/main/TuringMachine/Kernel/Functions.wl) a sequence of transitions of a nondeterministic machine carrying an input to an output within a bounded number of steps
- [`NonTerminatingTuringMachineQ`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/NonTerminatingTuringMachineQ.html) whether a machine given as integer rules enters a cycle within a bounded number of steps

- [`MultiwayTuringMachineRules`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTuringMachineRules.html), [`MultiwayNonHaltedStatesLeft`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayNonHaltedStatesLeft.html), [`MultiwayTuringMachineFoldList`](https://github.com/WolframInstitute/TuringMachine/blob/main/TuringMachine/Kernel/Multiway.wl), [`TagPathToEdgePath`](https://github.com/WolframInstitute/TuringMachine/blob/main/TuringMachine/Kernel/Multiway.wl), [`TuringMachineStepsWidths`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineStepsWidths.html), [`TuringMachineOutputWithSteps`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineOutputWithSteps.html), [`TuringMachineOutputWithStepsWidths`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineOutputWithStepsWidths.html), [`TuringMachineOutputWithStepsFloat`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineOutputWithStepsFloat.html), [`TuringMachineOutputWithStepsWidthsFloat`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineOutputWithStepsWidthsFloat.html), …
- [`OneSidedTuringMachineFunctionPlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/OneSidedTuringMachineFunctionPlot.html), [`OneSidedTuringMachineRuntimePlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/OneSidedTuringMachineRuntimePlot.html), [`TuringMachineWorstCasePlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TuringMachineWorstCasePlot.html), [`CompressToRunLength`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/CompressToRunLength.html), [`RenderConfiguration`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/RenderConfiguration.html), [`RenderEquation`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/RenderEquation.html), [`RenderUniversalGoal`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/RenderUniversalGoal.html), [`RenderAxiomGrid`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/RenderAxiomGrid.html), …

### Writings

- [Multiway Turing Machines program file](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) the package accompanying the multiway Turing machines bulletin, holding the functions below
- [`TuringMachinePlot`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) a Turing machine rule, an evolution or a coarse-grained multiway evolution drawn for a given number of states and colors
- [`TMStatePlot`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) a single machine state drawn as a row of tape cells with the head marked
- [`NDTMEvolution`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) the states of a nondeterministic machine step by step, the leaves of the multiway states graph
- [`TracedTMEvolution`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) the multiway evolution with the cumulative head displacement of each branch recorded
- [`TMAppliesGraph`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) the multiway states graph of a nondeterministic rule with the states where no rule applies highlighted
- [`TMAppliesMultispace`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) the same states graph drawn in three dimensions with head position as the extra coordinate, on branchlike, spacelike and timelike axes
- [`CyclicTMSTG`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) the state transition graph of a nondeterministic machine on a cyclic tape
- [`CyclicTMCausalInvariantQ`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) whether a multiway machine on a cyclic tape is causally invariant, branch pairs whose out-components overlap counted as resolved
- [`TMSummary`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl) a row holding the rule plot, the coarse-grained multiway evolution with head traces and the applies graph of a rule

- [`TMAppliesStatesGraph`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`TMRuleCases`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`TMAllStates`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`TMTapes`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`TMTapeGraphic`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`TMAppliesQ`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`HeadTraceGraphics2`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`TestDeterministic`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`ValidNDTMRulesQ`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), [`CyclicTMStep`](https://www.wolframcloud.com/obj/sw-blog/MultiwayTuringMachines/Programs-01.wl), …
