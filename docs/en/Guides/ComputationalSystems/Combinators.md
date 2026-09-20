---
Template: Guide
Name: Combinators
Title: Combinators
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/Combinators
Description: Combinator expressions and how they compute: the S, K and other primitive combinators and the terms built from them by application, reduction under an evaluation scheme and the normal form it reaches, the multiway and causal graphs of a combinator evolution, bracket abstraction and the translations to and from lambda terms, the enumeration of combinator expressions, and the Boolean, arithmetic and group computations combinators encode
Keywords: [combinator, combinatory logic, S combinator, K combinator, SKI basis, application, combinator expression, redex, contraction, reduction, normal form, fixed point, evaluation scheme, leftmost outermost, traversal order, multiway combinator, combinator causal graph, glocal multiway system, bracket abstraction, lambda term, church numeral, combinator enumeration, leaf count, boolean logic in combinators]
RelatedGuides: [ComputationalSystems, LambdaCalculus, TuringMachines, CellularAutomataAndSubstitutionSystems, AutomataAndMachines, ProofSystems, AxiomSystemsAndEntailment]
Links: ["[Combinatory Logic guide](https://reference.wolfram.com/language/guide/CombinatoryLogic.html)"]
---

## Abstract

A combinator expression is built from a few primitive combinators by application alone, and
computes by contracting the redexes it contains until none is left: the S, K and other primitive
combinators and the terms built from them; the contraction of a single redex, the evolution that
iterates it under an evaluation scheme, and the normal form it reaches; the multiway graph of
every choice of redex and the causal graph of the events of an evolution; bracket abstraction
and the translations between combinator terms and lambda terms; the enumeration, sampling and
encoding of combinator expressions; and the Boolean, arithmetic and group operations combinator
expressions encode.

## Functions

### Combinator Expressions

- `CombinatorS` (WL), `CombinatorK` (WL) the Schönfinkel basic combinators, the basis in which every combinator expression can be written
- `Application` (WL) the formal application of one combinator expression to another
- [`Combinator`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Combinator.html) (WolframInstitute/PureMath) an SKI combinator term, with the S, K and I basis combinators, bare symbols as variables and left-associated application
- `Construct` (WL) an application assembled explicitly from a head and its argument
- `ExpressionTree` (WL) a combinator expression as a tree, the shape its brackets describe
- `LeafCount` (WL) the number of symbols in a combinator expression, the size that grows or shrinks as it evolves

- `CombinatorI` (WL), `CombinatorB` (WL), `CombinatorC` (WL), `CombinatorW` (WL), `CombinatorY` (WL), `Function` (WL), `Depth` (WL), `Tree` (WL), `TreeForm` (WL), `TreeExpression` (WL), `TreeLeafCount` (WL), `TreeSize` (WL), `TreeDepth` (WL), `UnlabeledTree` (WL), `GraphTree` (WL), `ExpressionGraph` (WL), …

### Reduction and Normal Forms

- [`CombinatorReduce`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CombinatorReduce.html) (WolframInstitute/PureMath) one contraction of the leftmost-outermost redex of an SKI combinator term
- [`CombinatorNormalForm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CombinatorNormalForm.html) (WolframInstitute/PureMath) the normal form of an SKI combinator term, reached within a bounded number of reduction steps
- [`CombinatorEvolve`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolve/) (WFR) the evolution of a combinator expression for a number of steps under given rules and an evaluation scheme
- [`CombinatorFixedPoint`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorFixedPoint/) (WFR) the evolution of a combinator expression to its fixed point under given rules and an evaluation scheme
- [`CombinatorFinalExpression`](https://github.com/maxitg/CombinatorEvolve) (CombinatorEvolve) the final expression after a number of rewrites of a combinator expression, computed by a native combinator evaluator
- [`CombinatorLeafCounts`](https://github.com/maxitg/CombinatorEvolve) (CombinatorEvolve) the leaf count of the state after each rewrite, the growth of an evolution step by step
- [`SCombinatorHaltsQ`](https://resources.wolframcloud.com/FunctionRepository/resources/SCombinatorHaltsQ/) (WFR) whether the evolution of an S combinator expression halts

- `FixedPoint` (WL), `FixedPointList` (WL), `Nest` (WL), `NestList` (WL), `NestWhile` (WL), `NestWhileList` (WL), `ReplaceRepeated` (WL), `FindRepeat` (WL), …

### Multiway Combinators and Causal Graphs

- [`MultiwayCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayCombinator/) (WFR) the states graph of a combinator expression under every choice of redex, the evaluation orders of the expression as branches
- [`MWCombinatorGraph`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) (Writings) the multiway states graph of a combinator expression with the leftmost-outermost or a chosen evaluation path highlighted
- [`CombinatorCausalGraph`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) (Writings) the causal graph of a combinator evolution under a given evaluation scheme
- [`CombinatorGlocalMultiwaySystem`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorGlocalMultiwaySystem/) (WFR) a combinator expression evaluated as a glocal multiway system, global events over the individual tokens of a local one
- [`CombinatorGlocalBranchialGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorGlocalBranchialGraph/) (WFR) the branch pair ancestry of a glocal combinator evaluation as a branchial graph

### Bracket Abstraction and Lambda Terms

- [`BracketAbstraction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/BracketAbstraction.html) (WolframInstitute/PureMath) the SKI combinator term that eliminates a variable from a term, behaving as the lambda abstraction over it
- [`ToCombinator`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ToCombinator.html) (WolframInstitute/PureMath) a lambda term compiled to an equivalent SKI combinator term by bracket abstraction
- [`FromCombinator`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FromCombinator.html) (WolframInstitute/PureMath) an SKI combinator term expanded to its defining lambda term, each of S, K and I replaced by its lambda definition
- [`SKCombinatorCompile`](https://resources.wolframcloud.com/FunctionRepository/resources/SKCombinatorCompile/) (WFR) an ordinary expression represented in terms of the S and K combinators
- [`CombinatorLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/CombinatorLambda.html) (Wolfram/Lambda), [`LambdaCombinator`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaCombinator.html) (Wolfram/Lambda) a combinator term turned into a lambda term, and a lambda term converted to a combinator
- [`LambdaTerm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaTerm.html) (WolframInstitute/PureMath) the canonical lambda term of an expression, the form bracket abstraction compiles away

- [`FindMinimalLambdaCombinator`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/FindMinimalLambdaCombinator.html) (Wolfram/Lambda), [`FindMinimalCombinatorLambda`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl) (Wolfram/Lambda), [`LambdaCombinatorY`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaCombinatorY.html) (WolframInstitute/PureMath), …

### Enumerating Combinator Expressions

- [`EnumerateCombinators`](https://resources.wolframcloud.com/FunctionRepository/resources/EnumerateCombinators/) (WFR) all combinator expressions with a given number of symbols
- `Groupings` (WL) every way of bracketing a sequence of symbols, the application structures a combinator expression can take
- [`RandomCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/RandomCombinator/) (WFR) a pseudorandom combinator expression
- [`CombinatorEncode`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEncode/) (WFR) an SK combinator expression encoded as a list of 0s and 1s

### Computing with Combinators

- [`ChurchCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/ChurchCombinator/) (WFR) the combinator expression for a Church numeral or for an arithmetic operation on Church numerals
- [`BinaryCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/BinaryCombinator/) (WFR) bitwise operations performed through SK combinators
- [`CombinatorBooleanFormula`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/CombinatorBooleanFormula) (Wolfram Cloud) a Boolean formula rewritten into SK combinator form
- [`GroupToCombinator`](https://resources.wolframcloud.com/FunctionRepository/resources/GroupToCombinator/) (WFR) combinator expressions for the elements of a group and for its operation
- [`FindCombinatorProof`](https://resources.wolframcloud.com/FunctionRepository/resources/FindCombinatorProof/) (WFR) a proof of a theorem of combinatory logic in a given combinatory calculus

- `BooleanFunction` (WL), `BooleanTable` (WL), …

### Wolfram Function Repository

- [`CombinatorStep`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorStep/) one update of a combinator expression under given rules and a traversal scheme
- [`CombinatorEvolveList`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolveList/) every intermediate expression of an evolution for a number of steps
- [`CombinatorFixedPointList`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorFixedPointList/) every intermediate expression on the way to a fixed point
- [`CombinatorMatches`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorMatches/) the positions where rules match a combinator expression, ordered by traversal scheme
- [`TraversalOrderSelect`](https://resources.wolframcloud.com/FunctionRepository/resources/TraversalOrderSelect/) the positions of an expression chosen by a traversal-ordering criterion
- [`SKCombinatorLeftmostOutermostFinalExpression`](https://resources.wolframcloud.com/FunctionRepository/resources/SKCombinatorLeftmostOutermostFinalExpression/) the final state of the leftmost-outermost evolution of an SK combinator expression
- [`SKCombinatorLeftmostOutermostLeafCounts`](https://resources.wolframcloud.com/FunctionRepository/resources/SKCombinatorLeftmostOutermostLeafCounts/) the successive leaf counts of a leftmost-outermost evolution
- [`CombinatorEvolutionGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolutionGraph/) the state transformations and the causal structure of a combinator evolution in one graph
- [`CombinatorExpressionGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorExpressionGraph/) the expression graph of a combinator expression
- [`CombinatorToDAG`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorToDAG/) a combinator expression as a directed acyclic graph, its repeated subexpressions shared
- [`CombinatorPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorPlot/) a static combinator expression drawn
- [`CombinatorEvolutionPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorEvolutionPlot/) the evolution of a combinator expression drawn step by step
- [`CombinatorBracketsPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorBracketsPlot/) a combinator expression shown through its matched brackets

- [`CombinatorTraditionalForm`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorTraditionalForm/), [`CombinatorConvert`](https://resources.wolframcloud.com/FunctionRepository/resources/CombinatorConvert/), [`ProperLeafCount`](https://resources.wolframcloud.com/FunctionRepository/resources/ProperLeafCount/), …

### Writings

- [Combinators program file](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) the package accompanying the combinators bulletin, holding the functions below
- [`CombinatorFromString`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) a combinator expression parsed from a string such as `"s[k][s]"`
- [`FunctionToApplication`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) nested function applications rewritten in terms of `Application`
- [`EvaluationOrderSort`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) the positions of an expression sorted by an evaluation scheme, leftmost or rightmost, outermost or innermost
- [`CombinatorTerminatedQ`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) whether a combinator expression has no match left to contract
- [`MWCombinatorGraphMinimal`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) the multiway combinator graph in a minimal style, node sizes and a highlighted evaluation path
- [`SKDAGList`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) the DAGs of the successive states of an evolution, joined by evolution edges
- [`EquivalenceGroups`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) the S combinator expressions of a given size grouped by the fixed point they reach
- [`SCombinatorAutomatonTreeGeneral`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) the expression graph of an S combinator expression evaluated by a table automaton from the leaves
- [`MatchedBracketsPlot`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) the bracket structure of a combinator expression drawn as a mountain, vee, bush or binary tree picture

- [`MountainGraphic`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl), [`VeeGraphic`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl), [`BushGraphic`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl), [`BinaryTreeGraphic`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl), [`SCombinatorAutomatonTree`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl), …

### Wolfram Community

- [Analyzing and computing with combinators](https://community.wolfram.com/t/16420) combinator reduction, enumeration and the completeness of combinatory logic worked through step by step
- [Boolean logic in SK combinators](https://community.wolfram.com/t/20421) truth tables, enumeration and multiway graph structures of Boolean functions written as SK combinators
- [Constructing combinators for arithmetic and arbitrary-length bitwise operations](https://community.wolfram.com/t/24304) SK combinators built for arithmetic on Church numerals and for bitwise operations on arbitrary-length inputs
- [Sub-axiomatic foundations of group theory in SK combinators](https://community.wolfram.com/t/21507) group elements, the group operation and inverses represented as combinator expressions
- [Decompiling combinators to lambda calculus](https://community.wolfram.com/t/17815) SK combinator expressions decompiled into lambda functions
- [Another way to make graphs out of combinator expressions](https://community.wolfram.com/t/17100) further graph representations of combinator expressions
- [Evaluating combinators with StringReplace](https://community.wolfram.com/t/15767) SK combinator evaluation carried out almost entirely by string replacements
