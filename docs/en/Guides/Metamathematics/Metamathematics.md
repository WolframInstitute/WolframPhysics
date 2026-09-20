---
Template: Guide
Name: Metamathematics
Title: Metamathematics
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/Metamathematics
Description: Proofs as explicit objects, proof search and proof graphs, and axiom systems, equational logic, entailment cones and the empirical survey of a theory
Keywords: [metamathematics, proof, proof object, proof search, natural deduction, sequent calculus, theorem prover, axiom system, equational logic, term rewriting, critical pair, Knuth-Bendix completion, entailment cone, empirical metamathematics, model theory]
RelatedGuides: [WolframPhysics, ProofSystems, AxiomSystemsAndEntailment]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)"]
---

## Abstract

Metamathematics treats proofs and axiom systems as objects a computation produces and explores. Each area has its own guide.

A proof system makes a proof explicit: proof objects and the search that finds them; natural deduction, sequent calculus and the Curry-Howard correspondence that reads a proof as a typed program; the proof graphs and the layouts that draw them; and the automated theorem provers and proof databases reached from outside.

An axiom system generates the mathematics it entails: axiom systems and axiomatic theories; equational logic and term rewriting; the critical pairs where two rewrites compete and the Knuth-Bendix completion that resolves them; entailment cones and the metamathematical space they fill; the empirical metamathematics of enumerated expressions and theorem networks; the models and structures a theory is satisfied in; and the finite algebras and varieties an equational theory describes.

## Functions

### [Proof Systems](paclet:WolframInstitute/WolframPhysics/guide/ProofSystems)

- `FindEquationalProof` (WL) a proof of a theorem from a set of axioms in equational logic, returned as a proof object
- `ProofObject` (WL) a found proof, carrying its proof graph, token-event proof graph and proof dataset as properties
- [`ProofTree`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ProofTree.html) (WolframInstitute/PureMath) a natural-deduction derivation as a tree, each node an inference rule, its conclusion and the subproofs of its premises
- [`MultiwayEquationalGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayEquationalGraph.html) (WolframInstitute/TuringMachine) a multiway equational-rewrite cloud evolved from seed expressions and drawn with the proof path between the seeds highlighted
- [`TFindProof`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TFindProof.html) (WolframInstitute/THVMLink) a proof of a goal from a set of axioms, found by an external automated theorem prover
- [`MetamathImport`](https://resources.wolframcloud.com/FunctionRepository/resources/MetamathImport/) (WFR) a Metamath database as an object, with its statements, axioms, theorems, dependency graph and proof trees as properties

### [Axiom Systems and Entailment](paclet:WolframInstitute/WolframPhysics/guide/AxiomSystemsAndEntailment)

- `AxiomaticTheory` (WL) an axiomatic representation of a named theory, the axiom system an entailment cone starts from
- `TwoWayRule` (WL) a rule applied in either direction, the form an axiom takes when a theory is run as a rewriting system
- [`KnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/KnuthBendixCompletion/) (WFR) the completion rules of a multiway system, the rewrite rules that resolve its branch pairs
- [`TwoWayRuleTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayRuleTokenEventGraph) (Writings) the token-event graph of two-way rewriting rules, the entailment fabric of an axiom system
- [`FirstOrderStructure`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FirstOrderStructure.html) (WolframInstitute/PureMath) a finite structure over a signature, a domain together with the interpretation of each symbol
- [`MultiwayOperatorSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/) (WFR) the evaluation of a formal operator expression as a multiway system, the axioms of a theory applied in every possible way
