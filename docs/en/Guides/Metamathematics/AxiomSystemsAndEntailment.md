---
Template: Guide
Name: AxiomSystemsAndEntailment
Title: Axiom Systems and Entailment
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/AxiomSystemsAndEntailment
Description: Axiom systems and axiomatic theories, equational logic and term rewriting, critical pairs and Knuth-Bendix completion, entailment cones and the metamathematical space, empirical metamathematics, models and satisfiability, and the finite algebras and varieties an equational theory describes
Keywords: [axiom system, axiomatic theory, two-way rule, equational logic, term rewriting, unification, substitution, cosubstitution, critical pair, confluence, Knuth-Bendix completion, entailment cone, token-event graph, metamathematical space, empirical metamathematics, physicalization of metamathematics, theorem enumeration, model theory, first-order structure, satisfiability, finite algebra, variety]
RelatedGuides: [Metamathematics, ProofSystems, RuleSpace, Combinators, CategoriesAndFunctors, RulialSpace, SyntheticGeometry]
---

## Abstract

An axiom system is a set of rules for transforming expressions, and the mathematics it entails
is the multiway system those rules generate: the axioms and axiomatic theories a derivation
starts from, stated as two-way rules; equational logic and the term rewriting, unification and
substitution that carry it; the critical pairs where two rewrites compete and the Knuth-Bendix
completion that resolves them; the entailment cones and token-event graphs that fill the
metamathematical space a theory reaches; the empirical metamathematics of enumerated
expressions and theorem networks; the models and structures a theory is satisfied in; and the
finite algebras and varieties an equational theory describes.

## Functions

### Axiom Systems and Axiomatic Theories

- `AxiomaticTheory` (WL) an axiomatic representation of a named theory, the axiom system an entailment cone starts from
- `TwoWayRule` (WL) a rule applied in either direction, the form an axiom takes when a theory is run as a rewriting system
- [`AxiomaticTheoryTWP`](https://www.wolframcloud.com/obj/wolframphysics/AxiomaticTheoryTWP) (Writings) the axioms of a named theory as two-way pattern rules
- [`LiteralizeTwoWayRules`](https://www.wolframcloud.com/obj/wolframphysics/LiteralizeTwoWayRules) (Writings) the pattern variables of a set of two-way rules turned into literal symbols
- [`ModusPonensToEquational`](https://resources.wolframcloud.com/FunctionRepository/resources/ModusPonensToEquational/) (WFR) an axiom system converted from modus ponens form to equational form
- [`LogicAxiomSchemas`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LogicAxiomSchemas.html) (WolframInstitute/PureMath) the axiom schemas of a Hilbert-style propositional or first-order logic
- [`FirstOrderSignature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FirstOrderSignature.html) (WolframInstitute/PureMath) the relation, function and constant symbols with their arities that a theory is written over
- [`ZFAxioms`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ZFAxioms.html) (WolframInstitute/PureMath) the axiom lists of Zermelo-Fraenkel set theory and of its extension by choice
- [`ContinuumHypothesis`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ContinuumHypothesis.html) (WolframInstitute/PureMath) the continuum hypothesis as a formal statement, a sentence those axioms neither prove nor refute

- `Implies` (WL), `Equivalent` (WL), `ForAll` (WL), `Exists` (WL), `Nand` (WL), `GeometricScene` (WL), …

### Equational Logic and Term Rewriting

- [`EquationalIdentity`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/EquationalIdentity.html) (WolframInstitute/PureMath) a formal identity between two terms, the equation an axiom of an equational theory states
- [`FormalTermAlgebra`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FormalTermAlgebra.html) (WolframInstitute/PureMath) all formal terms of bounded nesting depth over a signature and variables
- [`MostGeneralUnifier`](https://resources.wolframcloud.com/FunctionRepository/resources/MostGeneralUnifier/) (WFR) the most general unifier of expressions containing pattern variables
- [`MultiReplace`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiReplace/) (WFR) every replacement of an expression under a rule together with the position at which it occurs, one step of equational rewriting
- [`TwoWayMultiReplace`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/Inference.m) (Wolfram/Metamathematics) all single-step two-way replacements in an expression, the rewriting behind the proof-space graphs
- [`FindEquationalPath`](https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalPath/) (WFR) a path from one expression to another by a sequence of replacements

- `ReplaceList` (WL), `NonCommutativeAlgebra` (WL), `NonCommutativeGroebnerBasis` (WL), `FullSimplify` (WL), …

### Critical Pairs and Knuth-Bendix Completion

- [`StringRewritingCriticalPairs`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingCriticalPairs.html) (WolframInstitute/PureMath) the shortest words carrying two overlapping redexes, together with their two one-step reducts
- [`StringRewritingConfluentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringRewritingConfluentQ.html) (WolframInstitute/PureMath) whether a rewriting system is confluent, decided by sound criteria on its critical pairs
- [`KnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/KnuthBendixCompletion/) (WFR) the completion rules of a multiway system, the rewrite rules that resolve its branch pairs
- [`CanonicalKnuthBendixCompletion`](https://resources.wolframcloud.com/FunctionRepository/resources/CanonicalKnuthBendixCompletion/) (WFR) the completion rules of a set of rules, independent of any initial condition
- [`UnfailingKnuthBendixCompletion`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/UnfailingKnuthBendixCompletion) (Wolfram Cloud) equational proof search run in completion mode, every theorem it finds returned with the completion rules that produced it
- [`MultiwayRuleGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayRuleGraph.html) (WolframInstitute/TuringMachine) the critical-pair rule-space graph of an equational axiom set, each rule a vertex and the superposition of two rules an event
- [Monoids, string-rewriting, confluence, and the Knuth-Bendix Algorithm](https://community.wolfram.com/t/24312) (Wolfram Community) the Knuth-Bendix algorithm for finitely presented monoids, with string rewriting and confluence visualized for word problems

### Entailment Cones and the Metamathematical Space

- [`TwoWayRuleNestGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayRuleNestGraph) (Writings) the multiway graph of the expressions reached under two-way rules, an entailment cone
- [`TwoWayRuleTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayRuleTokenEventGraph) (Writings) the token-event graph of two-way rewriting rules, the entailment fabric of an axiom system
- [`MultiwayOperatorSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayOperatorSystem/) (WFR) the evaluation of a formal operator expression as a multiway system, the axioms of a theory applied in every possible way
- [`MultiwayEquationalGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayEquationalGraph.html) (WolframInstitute/TuringMachine) a multiway equational-rewrite cloud evolved from seed expressions, drawn with the path between the seeds highlighted
- [`MultiwayTokenEventGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayTokenEventGraph.html) (WolframInstitute/TuringMachine) the same cloud in token-event form, state to event to state, with an axiom vertex feeding each event
- [`TokenEventGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TokenEventGraph/) (WFR) the token-event graph of a multicomputational evolution, the tokens each event consumes and creates
- [`EntailmentConeTheoremArray`](https://www.wolframcloud.com/obj/wolframphysics/EntailmentConeTheoremArray) (Writings) the theorems an entailment cone reaches, collected as an array
- [`MultiwayGeodesicGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayGeodesicGraph.html) (WolframInstitute/TuringMachine) a multiway cloud rendered with the geodesic path between its seed expressions highlighted
- [`multiwayDistance`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/multiwayDistance.html) (WolframInstitute/TuringMachine) the graph distance between two expressions in a multiway cloud grown for a number of generations
- [A novel multiway isomorphism model of consistency and completeness](https://community.wolfram.com/t/19404) (Wolfram Community) consistency, completeness and decidability of a formal system read off isomorphisms of its multiway systems
- [One Droplet at a Time: How Entailment Graphs Condense](https://community.wolfram.com/t/27309) (Wolfram Community) entailment graphs of words formed from the elements of an algebraic structure, and how they condense
- [A study in proof space Topology](https://community.wolfram.com/t/20338) (Wolfram Community) the topology of the space of proofs, read off the token-event graphs of two-way string rewriting

### Empirical Metamathematics

- [`EnumerateEquationalExpressions`](https://www.wolframcloud.com/obj/wolframphysics/EnumerateEquationalExpressions) (Writings) the equational expressions of a given size enumerated, the raw material of a survey of a theory
- [`EnumerateBooleanTheorems`](https://www.wolframcloud.com/obj/wolframphysics/EnumerateBooleanTheorems) (Writings) the theorems of Boolean algebra enumerated by size
- [Euclid Theorem Network Programs](https://www.wolframcloud.com/obj/sw-blog/EuclidBlog/Programs/Programs-01.wl) (Writings), [And-Or-Not Theorem Programs](https://www.wolframcloud.com/obj/sw-blog/EuclidBlog/Programs/Programs-08.wl) (Writings) program files of the empirical metamathematics essay on Euclid, with the layered theorem-network renderers and the enumeration of and-or-not theorems
- [Empirical metamathematics: extending the Lean-to-Mathematica bridge](https://community.wolfram.com/t/22357) (Wolfram Community) a formalized mathematical library brought into the Wolfram Language across the Lean bridge and studied as data

### Models, Structures and Satisfiability

- [`FirstOrderStructure`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FirstOrderStructure.html) (WolframInstitute/PureMath) a finite structure over a signature, a domain together with the interpretation of each symbol
- [`ModelSatisfiesQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ModelSatisfiesQ.html) (WolframInstitute/PureMath) the satisfaction relation, a formula evaluated in a structure under an assignment
- [`TheoryModelsQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TheoryModelsQ.html) (WolframInstitute/PureMath) whether a structure satisfies every axiom of a theory
- [`TheorySatisfiableQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TheorySatisfiableQ.html) (WolframInstitute/PureMath) whether a theory has a model over a decidable domain
- [`LogicalConsequenceQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LogicalConsequenceQ.html) (WolframInstitute/PureMath) whether a theory entails a sentence, in the cases where that is decidable
- [`FindFiniteModels`](https://resources.wolframcloud.com/FunctionRepository/resources/FindFiniteModels/) (WFR) finite models consistent with a set of relations
- [`FindEquationalCounterexample`](https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalCounterexample/) (WFR) a counterexample to an equational hypothesis in a given system of axioms
- [`ModelTheorem`](https://www.wolframcloud.com/obj/wolframphysics/ModelTheorem) (Writings) a theorem checked in a finite model
- `SatisfiableQ` (WL) whether an assignment of truth values makes a Boolean expression true

- `TautologyQ` (WL), `SatisfiabilityInstances` (WL), `SatisfiabilityCount` (WL), `BooleanConvert` (WL), `BooleanMinimize` (WL), …

### Finite Algebras and Varieties

- [`FiniteAlgebra`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiniteAlgebra.html) (WolframInstitute/PureMath) a finite algebra, a carrier set together with named finitary operations
- [`SatisfiesIdentityQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SatisfiesIdentityQ.html) (WolframInstitute/PureMath) whether a finite algebra satisfies an equational identity for every assignment of its variables
- [`Variety`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Variety.html) (WolframInstitute/PureMath) an equational class, the algebras defined by a list of identities
- [`FreeAlgebra`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FreeAlgebra.html) (WolframInstitute/PureMath) the free algebra of a variety on a generating set
- [`QuotientAlgebra`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/QuotientAlgebra.html) (WolframInstitute/PureMath) the quotient of an algebra by a congruence
- [`MagmaQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MagmaQ.html) (WolframInstitute/PureMath), [`SemigroupQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SemigroupQ.html) (WolframInstitute/PureMath), [`MonoidQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MonoidQ.html) (WolframInstitute/PureMath) whether a carrier set with one binary operation is closed under it, associative, and has an identity
- [`GroupStructureQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GroupStructureQ.html) (WolframInstitute/PureMath), [`AbelianGroupStructureQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AbelianGroupStructureQ.html) (WolframInstitute/PureMath), [`QuasigroupQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/QuasigroupQ.html) (WolframInstitute/PureMath), [`LoopQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LoopQ.html) (WolframInstitute/PureMath) whether such an algebra is a group, an abelian group, a quasigroup or a loop
- [`SemilatticeQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SemilatticeQ.html) (WolframInstitute/PureMath), [`RingStructureQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/RingStructureQ.html) (WolframInstitute/PureMath) whether it is a semilattice under its operation, and whether two operations make it a ring
- `FiniteGroupData` (WL) named finite groups with their orders, generators and multiplication tables
- `CayleyGraph` (WL) the Cayley graph of a group with respect to a generating set

### WolframInstitute/PureMath

- [WolframInstitute/PureMath](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/guide/PureMath.html) pure mathematics in the Wolfram Language, whose foundations area covers mathematical logic, model theory, universal algebra and axiomatic set theory
- [`WellFormedFormulaQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/WellFormedFormulaQ.html) whether an expression is a well-formed formula over a signature
- [`FreeVariables`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FreeVariables.html) the variables of a formula that no quantifier binds
- [`SubstituteFree`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SubstituteFree.html) a term substituted for the free occurrences of a variable
- [`PrenexNormalForm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PrenexNormalForm.html) a formula with its quantifiers pulled out in front of a quantifier-free matrix
- [`SkolemNormalForm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SkolemNormalForm.html) an equisatisfiable universal formula, its existential quantifiers replaced by Skolem functions
- [`ClausalFirstOrderForm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ClausalFirstOrderForm.html) a formula as a set of clauses, conjunctive normal form over literals
- [`TseitinTransform`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TseitinTransform.html) an equisatisfiable conjunctive normal form of size linear in the input
- [`ValidFormulaQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ValidFormulaQ.html) whether a formula holds under every interpretation of its signature
- [`LogicalConsequences`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LogicalConsequences.html) the sentences that follow from a set of premises
- [`GodelNumber`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GodelNumber.html) the integer that encodes a formula, the arithmetization of syntax
- [`QuantifierEliminate`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/QuantifierEliminate.html) a quantifier-free formula equivalent to the input over a decidable domain
- [`Ultraproduct`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Ultraproduct.html) the ultraproduct of finitely many structures over an ultrafilter on the index set
- [`FiniteModelQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiniteModelQ.html) whether a theory has a model with a finite domain
- [`ElementarySubstructureQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ElementarySubstructureQ.html) whether one structure sits inside another agreeing on every first-order formula
- [`DefinableSetQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/DefinableSetQ.html) whether a subset of the domain of a structure is cut out by a first-order formula
- [`FromGodelNumber`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FromGodelNumber.html) the formula an integer encodes, the inverse of the arithmetization of syntax
- [`FormalTerm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FormalTerm.html) a formal term in a signature over variables, the object an equational rule rewrites
- [`CayleyTable`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CayleyTable.html) the Cayley table of a binary operation
- [`CongruenceLattice`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CongruenceLattice.html) the lattice of the congruences of an algebra
- [`FirstOrderSignatureQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FirstOrderSignatureQ.html) whether an expression is a well-formed first-order signature, a relation, function and constant list with arities
- [`FiniteAlgebraQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiniteAlgebraQ.html) whether an expression is a well-formed finite algebra, a carrier set with operations closed on it
- [`ZFAxiom`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ZFAxiom.html) one named axiom of Zermelo-Fraenkel set theory, stated as a formal sentence

- [`BoundVariables`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/BoundVariables.html), [`SentenceQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SentenceQ.html), [`HornFormulaQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HornFormulaQ.html), [`UniversalClosure`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/UniversalClosure.html), [`ExistentialClosure`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ExistentialClosure.html), [`ExistsUnique`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ExistsUnique.html), [`FormulaLiterals`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FormulaLiterals.html), [`FunctionallyCompleteQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FunctionallyCompleteQ.html), …
- [`FirstOrderStructureQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FirstOrderStructureQ.html), [`StructureDomain`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StructureDomain.html), [`StructureInterpretation`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StructureInterpretation.html), [`ReductStructure`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ReductStructure.html), [`StructureHomomorphismQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StructureHomomorphismQ.html), [`FindStructureHomomorphism`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FindStructureHomomorphism.html), [`StructureEmbeddingQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StructureEmbeddingQ.html), [`SubstructureQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SubstructureQ.html), [`DefiningFormula`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/DefiningFormula.html), [`FirstOrderType`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FirstOrderType.html), [`TypeRealizableQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TypeRealizableQ.html), [`DecidableTheoryQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/DecidableTheoryQ.html), [`CategoricalTheoryQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CategoricalTheoryQ.html), …
- [`AlgebraSignature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AlgebraSignature.html), [`AlgebraCarrier`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AlgebraCarrier.html), [`AlgebraOperations`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AlgebraOperations.html), [`OperationArity`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OperationArity.html), [`OperationTable`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OperationTable.html), [`IdentityElement`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/IdentityElement.html), [`InverseOperation`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/InverseOperation.html), [`AssociativeOperationQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AssociativeOperationQ.html), [`CommutativeOperationQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CommutativeOperationQ.html), [`IdempotentOperationQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/IdempotentOperationQ.html), [`ClosedUnderOperationQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ClosedUnderOperationQ.html), [`SubalgebraQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SubalgebraQ.html), [`GeneratedSubalgebra`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GeneratedSubalgebra.html), [`AlgebraHomomorphismQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AlgebraHomomorphismQ.html), [`KernelCongruence`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/KernelCongruence.html), [`CongruenceQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CongruenceQ.html), [`DirectProductAlgebra`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/DirectProductAlgebra.html), [`FormalTermEvaluate`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FormalTermEvaluate.html), …
- [`AxiomOfChoice`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AxiomOfChoice.html), [`SeparationInstance`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SeparationInstance.html), [`ReplacementInstance`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ReplacementInstance.html), …

### Writings

- [Stephen Wolfram's writings](https://writings.stephenwolfram.com/) the essays and bulletins these programs accompany, each deployed as a cloud function
- [`TwoWayStringReplaceList`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayStringReplaceList) all single-step two-way string replacements
- [`TwoWayStringTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayStringTokenEventGraph) the token-event graph of two-way string rules
- [`TwoWayRuleStringNestGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayRuleStringNestGraph) the multiway graph of the strings reached under two-way string rules
- [`TwoWayHypergraphTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/TwoWayHypergraphTokenEventGraph) the token-event graph of two-way hypergraph rules
- [`TokenEventToTokenGraph`](https://www.wolframcloud.com/obj/wolframphysics/TokenEventToTokenGraph) a token-event graph projected onto its tokens
- [`PatternifyTokenEventGraph`](https://www.wolframcloud.com/obj/wolframphysics/PatternifyTokenEventGraph) the symbols of a token-event graph replaced by patterns
- [`EnumerateBooleanExpressions`](https://www.wolframcloud.com/obj/wolframphysics/EnumerateBooleanExpressions) the Boolean expressions of a given size enumerated
- [`FindBooleanAlternatives`](https://www.wolframcloud.com/obj/wolframphysics/FindBooleanAlternatives) alternative Boolean forms of an expression
- [`ApplyFiniteModel`](https://www.wolframcloud.com/obj/wolframphysics/ApplyFiniteModel) a finite model applied to an expression

- [`PlotTheoremArray`](https://www.wolframcloud.com/obj/wolframphysics/PlotTheoremArray), [`CountDependencies`](https://www.wolframcloud.com/obj/wolframphysics/CountDependencies), [`MetamathematicsStyleData`](https://www.wolframcloud.com/obj/wolframphysics/MetamathematicsStyleData), …

### Wolfram Function Repository

- [`FindReplacePath`](https://resources.wolframcloud.com/FunctionRepository/resources/FindReplacePath/) the sequence of replacements that takes one expression to another
- [`RuleReverse`](https://resources.wolframcloud.com/FunctionRepository/resources/RuleReverse/) a rule with its two sides exchanged
- [`UnformalizeSymbols`](https://resources.wolframcloud.com/FunctionRepository/resources/UnformalizeSymbols/) the formal symbols of an expression converted into ordinary ones
- [`FindHeadArities`](https://resources.wolframcloud.com/FunctionRepository/resources/FindHeadArities/) the distinct heads occurring in an expression together with their arities
- [`BinaryCompositions`](https://resources.wolframcloud.com/FunctionRepository/resources/BinaryCompositions/) all the binary compositions of a chosen set of symbols
- [`UpToBinaryCompositions`](https://resources.wolframcloud.com/FunctionRepository/resources/UpToBinaryCompositions/) all the unary and binary combinations of a chosen set of functions and symbols
- [`IrreducibleBinaryCompositions`](https://resources.wolframcloud.com/FunctionRepository/resources/IrreducibleBinaryCompositions/) the binary compositions a chosen simplification rule leaves irreducible
- [`FindBooleanAlternative`](https://resources.wolframcloud.com/FunctionRepository/resources/FindBooleanAlternative/) alternative Boolean expressions over a given set of operators
- [`FindEquationalModels`](https://resources.wolframcloud.com/FunctionRepository/resources/FindEquationalModels/) instances of a binary operator that satisfy a set of equational constraints
- [`MultiplicationTable`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiplicationTable/) the multiplication table of a range of integers, optionally modular

### Wolfram/Metamathematics

- [Wolfram/Metamathematics](https://github.com/sw1sh/WolframMetamathematics) multiway, bidirectional and two-way replacement and unification over symbolic expressions
- [`MultiBiReplace`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/MultiBiReplace.m) every bisubstitution replacement of an expression under a rule, at every subexpression position
- [`MultiBiUnify`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/MultiBiReplace.m) the bisubstitution unifications of an expression with a pattern, position by position
- [`MultiCoReplace`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/MultiCoReplace.m) every cosubstitution replacement of an expression under a rule
- [`MultiCoUnify`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/MultiCoReplace.m) the cosubstitution unifications of an expression with a pattern
- [`unify`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/Rewriting.m) two expressions unified, the substitution that makes them the same term
- [`unifier`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/Rewriting.m) the most general unifier of a list of terms

- [`TwoWayRuleMultiReplace`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/TwoWayRule.m), [`TwoWayRuleMultiReplaceList`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/TwoWayRule.m), [`TwoWayRuleMultiReplaceGraphList`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/TwoWayRule.m), [`unifyAt`](https://github.com/sw1sh/WolframMetamathematics/blob/master/Metamathematics/Kernel/MultiBiReplace.m), …
