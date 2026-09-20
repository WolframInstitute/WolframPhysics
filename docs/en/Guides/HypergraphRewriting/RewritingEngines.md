---
Template: Guide
Name: RewritingEngines
Title: Rewriting Engines and Sessions
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/RewritingEngines
Description: The implementations that run a hypergraph rewriting evolution: running an evolution and choosing its engine, bounding and monitoring a long run, parallel and remote evaluation, loading engines and resource functions, and proof search and solver links
Keywords: [engine, rewriting engine, session, continuable evolution, frontier, target device, gpu, performance, parallel evaluation, remote batch, time constraint, memory constraint, paclet, resource function, interaction net, automated theorem proving, solver, satisfiability]
RelatedGuides: [HypergraphRewriting, Hypergraphs, WolframModels, RuleSpace, Canonicalization, MultiwaySystems, ProofSystems]
Links: ["[SetReplace on GitHub](https://github.com/maxitg/SetReplace)", "[HypergraphRewritingEngine on GitHub](https://github.com/WolframInstitute/HypergraphRewritingEngine)", "[THVMLink paclet](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink)"]
---

## Abstract

Running a hypergraph rewriting evolution is an implementation question as much
as a mathematical one: the same rule on the same initial state can be evolved by
a symbolic kernel loop, by a compiled engine, or by a runtime that spreads the
work over cores and graphics devices. An evolution needs an engine to run it;
bounds on events, generations, time and memory that keep a long run watched;
parallel kernels and remote batch jobs that spread rules and initial conditions
over many machines; an engine installed and loaded into a session; and the
automated provers and satisfiability solvers reached the same way, where what is
rewritten is a proof.

## Functions

### Running an Evolution

- [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR) the evolution of a Wolfram model with given rules from an initial condition for a number of generations, the implementation a session reaches without installing anything
- [`WolframModel`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/WolframModelAndWolframModelEvolutionObject.md) (SetReplace) the same evolution on a compiled engine, with `"EventSelectionFunction"` admitting multiway spacelike evolution beside the single-way default
- [`SetReplace`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/SetReplace.md) (SetReplace) a single replacement of a subset of a set matching a rule's input by its output, the step an evolution repeats
- [`$SetReplaceMethods`](https://github.com/maxitg/SetReplace) (SetReplace) the implementations a replacement step can run on, the compiled one and the symbolic one
- `SubstitutionSystem` (WL) the kernel's own evolution of a string or array substitution system, the built-in rewriting a Wolfram model generalizes
- `SubsetReplace` (WL) replacement of subsets of elements in a list regardless of where they occur, the update step an evolution repeats
- `NestList` (WL) the successive states reached by applying an update function repeatedly to an initial condition
- `FixedPointList` (WL) the states of a run continued until no further rewrite changes the state
- [Confluent Set Substitution Systems](https://community.wolfram.com/t/14367) (Wolfram Community) set substitution systems made confluent by adding rules that resolve their critical pairs, an early study run on the set replacement engine

- `Nest` (WL), `FixedPoint` (WL), `NestWhileList` (WL), `ReplaceRepeated` (WL), `Compile` (WL), `FunctionCompile` (WL), `Dispatch` (WL), `LibraryFunctionLoad` (WL), …

### Bounding and Monitoring a Long Run

- `TimeConstrained` (WL) an evaluation stopped after a number of seconds, for an evolution or a search that may not halt
- `MemoryConstrained` (WL) an evaluation stopped once it exceeds a byte budget, the other way a runaway evolution ends
- [`MaxEvents`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/MaxEvents.md) (SetReplace) a generator stopped after a given number of events have been applied
- [`MaxGeneration`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/MaxGeneration.md) (SetReplace) a generator stopped once every token has reached a given generation
- [`SetReplaceSystemParameters`](https://github.com/maxitg/SetReplace/blob/master/Documentation/Generators/SetReplaceSystemParameters.md) (SetReplace) the stopping and selection parameters a given system and generator accept
- [`MonitorProgress`](https://resources.wolframcloud.com/FunctionRepository/resources/MonitorProgress/) (WFR) a progress bar over a long iteration, with the elapsed and remaining time estimated as it runs
- `ByteCount` (WL) the memory a state, an evolution object or a graph occupies
- `AbsoluteTiming` (WL) the wall-clock time a step of the evolution took, beside the value it returned
- `SeedRandom` (WL) the random seed that makes a sampled or randomly ordered run reproducible

- `Monitor` (WL), `ProgressReporting` (WL), `MaxMemoryUsed` (WL), `MemoryInUse` (WL), `RepeatedTiming` (WL), `PerformanceGoal` (WL), `Abort` (WL), `CheckAbort` (WL), `AbortProtect` (WL), …

### Parallel and Remote Evaluation

- `ParallelTable` (WL) a table of evolutions or measurements generated in parallel
- [`ParallelMapMonitored`](https://resources.wolframcloud.com/FunctionRepository/resources/ParallelMapMonitored/) (WFR) a parallel map over rules or initial conditions with a progress monitor shown while it runs
- `ParallelMap` (WL) one evolution per rule or per initial condition, spread over the available kernels
- `LaunchKernels` (WL) the parallel kernels a sweep of rule space runs on
- `DistributeDefinitions` (WL) the rules and helper definitions sent to every kernel before a sweep starts
- `RemoteBatchSubmit` (WL) an evolution too long for an interactive session submitted to a remote batch queue
- `RemoteBatchMapSubmit` (WL) one batch job per rule, mapped over a list of rules and collected when they finish

- `ParallelEvaluate` (WL), `ParallelCombine` (WL), `CloseKernels` (WL), `$KernelCount` (WL), `RemoteBatchJobObject` (WL), …

### Installing and Loading an Engine

- `PacletInstall` (WL) an engine paclet installed from the Paclet Repository, a cloud resource or a release asset
- `ResourceFunction` (WL) a Function Repository implementation retrieved and called by name
- `PacletSymbol` (WL) one symbol of an installed paclet used without loading its whole context
- `Needs` (WL) an installed paclet's context loaded into the session
- `PacletFindRemote` (WL) the paclet versions available to install, before a session commits to one
- [`WithDatedResourceFunctions`](https://resources.wolframcloud.com/FunctionRepository/resources/WithDatedResourceFunctions/) (WFR) a block in which resource functions resolve to the versions current on a given date, so a long study stays reproducible
- `ResourceSearch` (WL) the repository searched for a function that already computes what a study needs

- `PacletFind` (WL), `PacletObject` (WL), `PacletDirectoryLoad` (WL), `PacletUninstall` (WL), `ResourceObject` (WL), `ResourceData` (WL), `Get` (WL), …

### Proof Search and Solver Links

- `FindEquationalProof` (WL) an equational proof of a theorem from a set of axioms, the kernel's own automated prover
- `ProofObject` (WL) the proof that prover returns, carrying its proof graph and proof dataset as properties
- [`ImportDOT`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/ImportDOT.html) (Wolfram/LeanLink) a proof graph read in from the DOT output of the Lean proof assistant
- [Thousands of Problems for Theorem Provers](https://www.wolframcloud.com/obj/nikm/DeployedResources/Data/Thousands-of-Problems-for-Theorem-Provers-%28TPTP%29) (Wolfram Cloud) the standard benchmark corpus a prover link is measured against
- `FindInstance` (WL) a witness satisfying a set of constraints, the search a finite-model finder specializes

- `SatisfiableQ` (WL), `SatisfiabilityInstances` (WL), `SatisfiabilityCount` (WL), `Resolve` (WL), `Reduce` (WL), …

### WolframInstitute/HypergraphRewriteEngine

- [WolframInstitute/HypergraphRewriteEngine](https://github.com/WolframInstitute/HypergraphRewritingEngine) a native parallel hypergraph rewriting engine, computing a whole multiway system with its causal and branchial structure outside the kernel, on a processor or a graphics target device
- [`HGEvolve`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) rules applied to a hypergraph in every possible way, giving the multiway system with its causal and branchial graphs as properties
- [`HGSessionOpen`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionOpen.html) a continuable evolution opened for a property and held by an engine worker, returned as a session object
- [`HGSessionStep`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionStep.html) a session's exploration carried a number of steps further from the frontier it stopped at, returning the property the session was opened for
- [`HGSessionQuery`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionQuery.html) the accumulated graph re-read, or a different property of it read off, without exploring any further
- [`HGSessionFrontier`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionFrontier.html) the states a continuation would resume from, a subset of which the next step can be restricted to
- [`HGSessionObject`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionObject.html) a live exploration held by an engine worker, opened, advanced, read and released through the session functions
- [`HGSessionClose`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGSessionClose.html) the engine holding a session released, after which the handle is not reused

### WolframInstitute/THVMLink

- [WolframInstitute/THVMLink](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink) a bridge to an interaction-net runtime that compiles symbolic rewriting to processor and graphics backends, and drives automated theorem provers over the same terms
- [`TReduce`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TReduce.html) a term reduced on the runtime
- [`TRedexes`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TRedexes.html) the redexes a term currently offers, the interactions the runtime may fire next
- [`TStep`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TStep.html) the runtime advanced one interaction step
- [`TInteract`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TInteract.html) the runtime driven forward interactively
- [`TMultiwayGraph`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TMultiwayGraph.html) the multiway graph of the reduction orders a term admits
- [`TCausalGraph`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TCausalGraph.html) the causal graph of the interactions a reduction performs
- [`TMultiTrace`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TMultiTrace.html) the trace of a multiway reduction, with every branch recorded
- [`TFindProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindProof.html) an automated proof of a conjecture from a set of axioms
- [`TFindEquationalProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindEquationalProof.html) an equational proof of a theorem from a set of equations
- [`TFindEquationalPath`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindEquationalPath.html) the rewriting path joining two terms under a set of equations
- [`TFindStringProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindStringProof.html) a proof in a string rewriting system
- [`TFindFiniteModels`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindFiniteModels.html) finite models of a theory, the countermodels that disprove a conjecture
- [`TWaldmeisterProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TWaldmeisterProof.html) an equational proof found by the Waldmeister method
- [`TSmtDecide`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TSmtDecide.html) a formula decided by satisfiability modulo theories

- [`TVampireProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TVampireProof.html), [`TEproverProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TEproverProof.html), [`TTweeProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TTweeProof.html), [`TProofObject`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TProofObject.html), [`TSatEUF`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TSatEUF.html), [`TNf`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TNf.html), [`TJit`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TJit.html), [`TBench`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TBench.html), [`TKernelCount`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TKernelCount.html), …
