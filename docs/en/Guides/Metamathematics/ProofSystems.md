---
Template: Guide
Name: ProofSystems
Title: Proof Systems
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/ProofSystems
Description: Proofs as explicit objects: proof objects and the search that finds them, natural deduction and sequent calculus with cut elimination and the Curry-Howard correspondence, proof graphs and proof visualization, and the automated theorem provers, Lean and proof databases the Wolfram Language links to
Keywords: [proof, proof object, proof search, proof path, proof tree, proof graph, token-event proof graph, natural deduction, sequent calculus, cut elimination, inference rule, judgment, Curry-Howard, typed lambda term, automated theorem proving, theorem prover, Knuth-Bendix completion, equational induction, unification, Metamath, Lean, Mathlib, tactic, TPTP]
RelatedGuides: [Metamathematics, AxiomSystemsAndEntailment, LambdaCalculus, TuringMachines, Combinators, RewritingEngines]
---

## Abstract

A proof is an explicit object: a chain of replacements, or a tree of inference steps, that
carries a set of axioms to a theorem and can be checked, drawn and measured. Proof objects and
the search that finds them run from equational proof search and Knuth-Bendix completion to
proofs of equivalence between strings and hypergraphs and proofs by equational induction;
natural deduction and sequent calculus derivations, the cut elimination that removes their
detours, and the Curry-Howard correspondence that reads a proof as a typed program; the proof
graphs, token-event proof graphs and multiway clouds in which a proof is a path, and the layouts
that draw them; and the external theorem provers, Lean environments and tactic proofs, proof
databases and benchmark libraries.

## Functions

### Proof Objects and Proof Search

- `FindEquationalProof` (WL) a proof of a theorem from a set of axioms in equational logic, returned as a proof object
- `ProofObject` (WL) a found proof, carrying its proof graph, token-event proof graph and proof dataset as properties
- [`FindEquationalPath`](https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalPath/) (WFR) a path from one expression to another by a sequence of replacements
- [`FindStringProof`](https://resources.wolframcloud.com/FunctionRepository/resources/FindStringProof/) (WFR) a proof of equivalence between two strings in a given multiway system
- [`FindWolframModelProof`](https://resources.wolframcloud.com/FunctionRepository/resources/FindWolframModelProof/) (WFR) a proof of equivalence between two hypergraphs in a given multiway Wolfram model system
- [`FindInductiveProof`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/FindInductiveProof.html) (WolframInstitute/TuringMachine) a proof of a universally quantified goal by equational induction, the base case and the step case with the goal as induction hypothesis
- [`KnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/KnuthBendixCompletion/) (WFR) the completion rules of a multiway system, the rewrite rules that resolve its branch pairs
- [`UnfailingKnuthBendixCompletion`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/UnfailingKnuthBendixCompletion) (Wolfram Cloud) equational proof search run in completion mode, returning every theorem it finds as a proof object of completion rules
- [`MetamathImport`](https://resources.wolframcloud.com/FunctionRepository/resources/MetamathImport/) (WFR) a Metamath database as an object, with its statements, axioms, theorems, dependency graph, proof trees and token-event graphs as properties
- [`FindListProof`](https://resources.wolframcloud.com/FunctionRepository/resources/FindListProof/) (WFR) a proof of equivalence between two lists in a given multiway system
- [`FindCombinatorProof`](https://resources.wolframcloud.com/FunctionRepository/resources/FindCombinatorProof/) (WFR) a proof of a theorem in combinatory logic under a given combinator calculus
- [`FindReplacePath`](https://resources.wolframcloud.com/FunctionRepository/resources/FindReplacePath/) (WFR) the sequence of replacements that takes one expression to another
- [`FindEquationalCounterexample`](https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalCounterexample/) (WFR) a counterexample to an equational hypothesis in a given system of axioms, the refutation a failed proof leaves open
- [`MostGeneralUnifier`](https://resources.wolframcloud.com/FunctionRepository/resources/MostGeneralUnifier/) (WFR) the most general unifier of expressions containing pattern variables, the matching step of a proof search
- [`ModusPonensToEquational`](https://resources.wolframcloud.com/FunctionRepository/resources/ModusPonensToEquational/) (WFR) an axiom system stated with modus ponens converted to equational form, so an equational prover can attack it
- [Monoids, string-rewriting, confluence, and the Knuth-Bendix Algorithm](https://community.wolfram.com/t/24312) (Wolfram Community) the Knuth-Bendix algorithm for finitely presented monoids, with string rewriting and confluence visualized for word problems

- `ReplaceList` (WL), `StringReplaceList` (WL), `ReplaceRepeated` (WL), `FullSimplify` (WL), …

### Natural Deduction, Sequent Calculus and Curry-Howard

- [`ProofTree`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ProofTree.html) (WolframInstitute/PureMath) a natural-deduction derivation as a tree, each node an inference rule, its conclusion and the subproofs of its premises
- [`NaturalDeductionProof`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/NaturalDeductionProof.html) (WolframInstitute/PureMath) the judgment a derivation establishes, its open assumptions and its conclusion, after every step is validated
- [`SequentProof`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SequentProof.html) (WolframInstitute/PureMath) a sequent-calculus derivation as a tree, each node an inference rule, the sequent it concludes and its premise subproofs
- [`CutEliminate`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CutEliminate.html) (WolframInstitute/PureMath) a cut-free derivation of the same end-sequent, Gentzen's Hauptsatz by terminating invertible-rule proof search
- [`CurryHoward`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CurryHoward.html) (WolframInstitute/PureMath) the simply typed lambda term corresponding to a natural-deduction proof of the implicational fragment, a proof read as a program

- `Tree` (WL), `TreeForm` (WL), `TreeGraph` (WL), `ExpressionTree` (WL), `TreeDepth` (WL), `TreeLeafCount` (WL), …

### Proof Graphs and Proof Visualization

- [`MultiwayEquationalGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayEquationalGraph.html) (WolframInstitute/TuringMachine) a multiway equational-rewrite cloud evolved from seed expressions and drawn with the proof path between the seeds highlighted
- [`MultiwayTokenEventGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTokenEventGraph.html) (WolframInstitute/TuringMachine) the same cloud in token-event form, state to event to state, with an axiom vertex feeding each event and the proof path highlighted
- [`ProofObjectToTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/ProofObjectToTokenEventGraph) (Writings) a proof object redrawn as a token-event graph
- [`FindTokenEventProof`](https://www.wolframcloud.com/obj/wolframphysics/FindTokenEventProof) (Writings) a proof found as a path through a token-event graph, the published [`FindEquationalPath`](https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalPath/) covers it
- `LayeredGraphPlot` (WL) a layered drawing of a proof graph, the axioms at one end and the theorem at the other
- `HighlightGraph` (WL) a proof path marked inside the larger graph of everything the axioms reach
- [A study in proof space Topology](https://community.wolfram.com/t/20338) (Wolfram Community) the topology of the space of proofs, read off the token-event graphs of two-way string rewriting

- `FindShortestPath` (WL), `TopologicalSort` (WL), `TransitiveReductionGraph` (WL), `GraphDistance` (WL), `VertexLabels` (WL), …

### Automated Theorem Provers and Proof Databases

- [`TFindProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindProof.html) (WolframInstitute/THVMLink) a proof of a goal from a set of axioms, found by an external automated theorem prover
- [`TFindEquationalProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindEquationalProof.html) (WolframInstitute/THVMLink) an equational proof found by an external prover and returned in proof-object form
- [`TWaldmeisterProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TWaldmeisterProof.html) (WolframInstitute/THVMLink) a proof found by the Waldmeister unit-equality prover
- [`TVampireProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TVampireProof.html) (WolframInstitute/THVMLink) a proof of a TPTP problem found by the Vampire prover
- [`TEproverProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TEproverProof.html) (WolframInstitute/THVMLink) a proof of a TPTP problem found by the E prover
- [`TTweeProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TTweeProof.html) (WolframInstitute/THVMLink) a proof of a TPTP problem found by the Twee equational prover
- [`TProofObject`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TProofObject.html) (WolframInstitute/THVMLink) the proof object a runtime prover returns, carrying the theorem, the axioms and the DAG of proof steps
- [`TSmtDecide`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TSmtDecide.html) (WolframInstitute/THVMLink) a Boolean combination of equalities decided by satisfiability modulo theories over congruence closure
- [`ProofToLean`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/ProofToLean.html) (Wolfram/LeanLink) a Wolfram proof object transpiled into a checkable Lean environment
- [`LeanTactic`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanTactic.html) (Wolfram/LeanLink) a tactic applied to a proof state, one step of an interactive proof
- [`LeanImport`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanImport.html) (Wolfram/LeanLink) the constants of a compiled Lean module, Mathlib included, imported as a Lean environment
- [`ImportDOT`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/ImportDOT.html) (Wolfram/LeanLink) a DOT-format graph imported into the Wolfram Language, the form in which a Lean proof graph arrives
- [Thousands of Problems for Theorem Provers](https://www.wolframcloud.com/obj/nikm/DeployedResources/Data/Thousands-of-Problems-for-Theorem-Provers-%28TPTP%29) (Wolfram Cloud) the TPTP library of theorem-proving benchmark problems, indexed and parsed on demand
- [Metamath Report](https://www.wolframcloud.com/obj/nikm/DeployedResources/Data/Metamath-Report) (Wolfram Cloud) contributions to the set.mm Metamath database of machine-checked proofs
- [Automated Theorem Proving for Equational Logic](https://community.wolfram.com/t/10788) (Wolfram Community) a summer school project that extended the equational proof search backend
- [The starthere repository](https://github.com/GetJonWithIt/starthere) (GitHub) the code of the extended equational proof search backend
- [Empirical metamathematics: extending the Lean-to-Mathematica bridge](https://community.wolfram.com/t/22357) (Wolfram Community) a bridge carrying theorems and proofs between Lean and the Wolfram Language

- [`TFindStringProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindStringProof.html) (WolframInstitute/THVMLink), [`TFindEquationalPath`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindEquationalPath.html) (WolframInstitute/THVMLink), [`TFindFiniteModels`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindFiniteModels.html) (WolframInstitute/THVMLink), …

### WolframInstitute/PureMath

- [WolframInstitute/PureMath](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/guide/PureMath.html) pure mathematics in the Wolfram Language, whose foundations area carries proof theory, type theory and mathematical logic
- [`ProofCheckQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ProofCheckQ.html) whether a derivation tree is a valid natural-deduction proof of a theorem, its conclusion depending on no open assumption
- [`InferenceRule`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/InferenceRule.html) a single inference rule, the premises it takes and the conclusion it draws
- [`Judgment`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Judgment.html) a judgment, a formula together with the assumptions it rests on
- [`$NaturalDeductionRules`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/%24NaturalDeductionRules.html) the introduction and elimination rules a natural-deduction derivation is built from
- [`Sequent`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Sequent.html) a sequent, a list of antecedents entailing a list of succedents
- [`SequentRule`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SequentRule.html) a single rule of the Gentzen sequent calculus
- [`$SequentCalculusRules`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/%24SequentCalculusRules.html) the classical and intuitionistic sequent-calculus rule sets
- [`CutFreeQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CutFreeQ.html) whether a sequent derivation uses the cut rule anywhere
- [`SimpleType`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SimpleType.html) a simple type built from base types and arrows, the type a proof of an implication carries
- [`InferType`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/InferType.html) the principal type of a term, inferred algorithmically
- [`PropositionToType`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PropositionToType.html) the type a propositional formula corresponds to under the Curry-Howard correspondence

- [`ProofTreeQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ProofTreeQ.html), [`SequentProofQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SequentProofQ.html), [`TypeArrow`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TypeArrow.html), [`TypeContext`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TypeContext.html), [`TypeCheckQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TypeCheckQ.html), [`WellTypedQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/WellTypedQ.html), [`SequentValidQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SequentValidQ.html), …

### WolframInstitute/TuringMachine

- [WolframInstitute/TuringMachine](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/) Turing machines and inductive proofs of their behavior, with the multiway graphs and panels those proofs are read from
- [`MultiwayRuleGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayRuleGraph.html) the critical-pair rule-space graph of an equational axiom set, each rule a vertex and the superposition of two rules an event
- [`MultiwayGeodesicGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayGeodesicGraph.html) a multiway rewrite cloud grown from seed expressions and drawn with the geodesic path between them highlighted
- [`multiwayDistance`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/multiwayDistance.html) the graph distance between two expressions in the multiway cloud grown from them, the length of the shortest proof found
- [`inductionProofGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/inductionProofGraph.html) the token-event proof graph fusing the base case and the step case of an inductive proof
- [`proofGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/proofGraph.html) the induction proof graph of a machine, laid out and styled
- [`multiwaySubProofCones`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/multiwaySubProofCones.html) a bounded rewrite cloud around each sub-proof of an induction proof
- [`multiwayCloudOverlap`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/multiwayCloudOverlap.html) how far the clouds of the separate sub-proofs share terms
- [`multiwaySystemFor`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/multiwaySystemFor.html) the axioms, induction hypothesis, derived lemmas and seed equations of a machine bundled into one association
- [`MultiwayInductiveProofPanel`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayInductiveProofPanel.html) the grafted inductive proof graph drawn at full opacity inside the faded term-space cloud of all its sub-proofs

- [`MultiwayBothPanel`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayBothPanel.html), [`TokenEventPanel`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/TokenEventPanel.html), [`StatementPanel`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/StatementPanel.html), [`RuleSpacePanel`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/RuleSpacePanel.html), [`IslandsPanel`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/IslandsPanel.html), [`SettingsPanel`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/SettingsPanel.html), …

### Wolfram/LeanLink

- [Wolfram/LeanLink](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/) a native link between the Wolfram Language and the Lean 4 theorem prover, loading Mathlib environments, running tactic proofs and transpiling proof objects into checkable Lean
- [`LeanEnvironment`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanEnvironment.html) a collection of named Lean constants, the loaded environment of a Lean module or source string
- [`LeanImportString`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanImportString.html) a Lean 4 source string compiled into a Lean environment
- [`LeanExport`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanExport.html) a Lean environment written back to a Lean source file
- [`LeanTerm`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanTerm.html) one Lean constant with its kind, type, term, source, parameters and expression graph
- [`LeanState`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanState.html) a theorem opened as a proof goal, with its goals, goal count and whether the proof is complete
- [`LeanGoal`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanGoal.html) a single goal of a proof state, with its target and context
- [`LeanExprGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanExprGraph.html) the expression graph of a Lean constant, its proof term drawn as a graph
- [`LeanCallGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanCallGraph.html) the call and dependency graph of a Lean constant, the theorems a proof depends on
- [`LeanListTheorems`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanListTheorems.html) the theorems of a Lean project as a dataset
- [`LeanListConstants`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanListConstants.html) every constant of a Lean module as an association
- [`LeanCompile`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanCompile.html) a Lean term or whole environment compiled to native code through `FunctionCompile`
- [`LeanToFunction`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanToFunction.html) a Lean term converted into a function with typed arguments

- [`LeanExportString`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanExportString.html), [`LeanExpr`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanExpr.html), [`LeanValue`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanValue.html), [`LeanConstantInfo`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanConstantInfo.html), [`LeanLoadEnvironment`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanLoadEnvironment.html), [`LeanFreeEnvironment`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanFreeEnvironment.html), [`LeanCompileTyped`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanCompileTyped.html), [`LeanExprToType`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/LeanLink/ref/LeanExprToType.html), …

### Writings

- [Stephen Wolfram's writings](https://writings.stephenwolfram.com/) the essays and bulletins these programs accompany, each deployed as a cloud function
- [`FindAccumulativeProof`](https://www.wolframcloud.com/obj/wolframphysics/FindAccumulativeProof) accumulative proof search, in which the statements proved are themselves available as rules
- [`ReverseTokenEventProofGraph`](https://www.wolframcloud.com/obj/wolframphysics/ReverseTokenEventProofGraph) a token-event proof graph read in the opposite direction, from the theorem back to the axioms
- [`PatternifyTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/PatternifyTokenEventGraph) the symbols of a token-event graph replaced by patterns
- [`TokenEventToTokenGraph`](https://www.wolframcloud.com/obj/wolframphysics/TokenEventToTokenGraph) a token-event graph projected onto its tokens alone
- [`CountDependencies`](https://www.wolframcloud.com/obj/wolframphysics/CountDependencies) the number of dependencies a proof draws on
- [`VisualizePath`](https://www.wolframcloud.com/obj/sw-writings0/ProofChallenge/VisualizePath) a proof path shown step by step
- [`CanonicalizeSymbols`](https://www.wolframcloud.com/obj/sw-writings0/ProofChallenge/CanonicalizeSymbols) the symbols of a statement renamed canonically, so two proofs can be compared
- [`CanonicalizePatterns`](https://www.wolframcloud.com/obj/sw-writings0/ProofChallenge/CanonicalizePatterns) the pattern variables of a rule renamed canonically

- [`PatternsToSymbols`](https://www.wolframcloud.com/obj/sw-writings0/ProofChallenge/PatternsToSymbols), [`SymbolsToPatterns`](https://www.wolframcloud.com/obj/sw-writings0/ProofChallenge/SymbolsToPatterns), …
