---
Template: Guide
Name: LambdaCalculus
Title: Lambda Calculus
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/LambdaCalculus
Description: Lambda terms, their abstraction and application, beta reduction and normal forms, the order in which redexes are chosen and the multiway system that keeps every order, expression evaluation and the causal graph of its events, the enumeration and sampling of terms, de Bruijn indices and other encodings, and the trees and diagrams that draw a term and its reduction
Keywords: [lambda calculus, lambda term, abstraction, application, free variable, bound variable, beta reduction, beta substitution, eta reduction, normal form, normal order, reduction order, redex, multiway system, expression evaluation, evaluation trace, causal graph, Church numeral, de Bruijn index, binary lambda calculus, combinator, busy beaver, interaction net, optimal reduction, Curry-Howard, lambda diagram, Tromp diagram]
RelatedGuides: [ComputationalSystems, Combinators, TuringMachines, CellularAutomataAndSubstitutionSystems, AutomataAndMachines, ProofSystems, StringDiagrams]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)", "[WolframLambda on GitHub](https://github.com/WolframInstitute/WolframLambda)", "[Wolfram/Lambda paclet](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/)"]
---

## Abstract

The lambda calculus builds every computation from two operations, abstracting a variable out of
a term and applying one term to another, and computes by rewriting the term it is given: terms,
their abstraction and application, and the variables an abstraction binds; beta reduction, the
substitution a single step performs and the normal form a term reduces to; the order in which
redexes are chosen and the multiway system that keeps every order at once; the evaluation of an
expression and the causal graph its events and their dependencies form, in which a computation
carries the same structure as a discrete spacetime; the enumeration and random sampling of
terms; the compilation of a term to and from the combinators that compute the same functions;
and the trees and diagrams that draw a term and its reduction.

## Functions

### Lambda Terms, Abstraction and Application

- `Function` (WL) an anonymous function of named parameters or numbered slots, the lambda abstraction the language itself provides
- [`LambdaTerm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaTerm.html) (WolframInstitute/PureMath) the canonical lambda term of an expression, with bare symbols as variables, left-associated application and curried abstraction
- `Application` (WL) the formal application of one term to another, left-associated as a lambda term applies its arguments
- `Curry` (WL) a function of several arguments rewritten as nested functions of one argument, the currying an abstraction assumes
- [`LambdaFreeVariables`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl) (Wolfram/Lambda) the variables of a term that no enclosing abstraction binds

- `Slot` (WL), `SlotSequence` (WL), `Construct` (WL), `Apply` (WL), `Composition` (WL), `RightComposition` (WL), `OperatorApplied` (WL), `Identity` (WL), `HoldPattern` (WL), `Unique` (WL), …

### Beta Reduction and Normal Forms

- [`BetaSubstitute`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaSubstitute.html) (Wolfram/Lambda) one beta substitution performed where the term admits one, the single step of the calculus
- [`BetaReduce`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReduce.html) (Wolfram/Lambda) iterated beta reduction of every reducible subexpression of a lambda term
- [`BetaReductions`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReductions.html) (Wolfram/Lambda) all possible single beta reductions of a lambda expression
- [`EvalLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/EvalLambda.html) (Wolfram/Lambda) the evaluation of a lambda expression, in full or by a bounded number of beta reductions and substitutions
- [`BetaNormalForm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/BetaNormalForm.html) (WolframInstitute/PureMath) the beta normal form of a lambda term by normal-order reduction, within a bounded number of steps
- [`EtaReduce`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/EtaReduce.html) (Wolfram/Lambda) eta reduction, an abstraction whose body applies its own bound variable replaced by the function alone
- [`LambdaSubstitute`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl) (Wolfram/Lambda) capture avoiding substitution of variables in a term, its de Bruijn indices shifted by an offset
- `With` (WL) a value substituted for a name throughout a body, the substitution a beta step performs
- `ReplaceRepeated` (WL) an expression rewritten by rules until it stops changing, the normal form of a rewriting relation
- `FixedPointList` (WL) the successive terms of a reduction carried to the fixed point it reaches
- [`$LambdaInteractionRules`](https://github.com/WolframInstitute/DiagrammaticComputation/blob/main/DiagrammaticComputation/Kernel/Diagram/Rewriting/Rewriting.wl) (Wolfram/DiagrammaticComputation) the interaction net rules of lambda reduction as diagram rewrites, beta reduction as annihilation beside duplication and erasure
- [`$LambdaCroissantBracketRules`](https://github.com/WolframInstitute/DiagrammaticComputation/blob/main/DiagrammaticComputation/Kernel/Diagram/Rewriting/Rewriting.wl) (Wolfram/DiagrammaticComputation) the croissant and bracket rules of optimal lambda reduction as unpolarized diagram rewrites
- [`$LambdaCroissantBracketPolarizedRules`](https://github.com/WolframInstitute/DiagrammaticComputation/blob/main/DiagrammaticComputation/Kernel/Diagram/Rewriting/Rewriting.wl) (Wolfram/DiagrammaticComputation) the polarized croissant and bracket rules together with the beta and duplication rules

- `FixedPoint` (WL), `Nest` (WL), `NestList` (WL), `NestWhile` (WL), `NestWhileList` (WL), `Replace` (WL), `ReplaceAll` (WL), `TimeConstrained` (WL), `$RecursionLimit` (WL), `$IterationLimit` (WL), …

### Reduction Order and the Multiway System of a Term

- [`BetaReducePositions`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReducePositions.html) (Wolfram/Lambda) the positions in a term at which a beta substitution can be made, one for each redex
- [`BetaPositionReductions`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaPositionReductions.html) (Wolfram/Lambda) each redex position paired with the term that reducing it produces
- [`TraversalOrderSelect`](https://resources.wolframcloud.com/FunctionRepository/resources/TraversalOrderSelect/) (WFR) the positions of an expression chosen by a traversal-ordering scheme, leftmost or rightmost and outermost or innermost
- [`EvaluationOrderSort`](https://www.wolframcloud.com/obj/sw-blog/Combinators/Programs.wl) (Writings) the positions of an expression sorted by an evaluation scheme, published on the Function Repository as [`TraversalOrderSelect`](https://resources.wolframcloud.com/FunctionRepository/resources/TraversalOrderSelect/)
- [`LambdaMultiwayGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaMultiwayGraph.html) (Wolfram/Lambda) the states graph of a lambda term under every choice of beta-redex, each branch one reduction order
- `ReplaceList` (WL) every result of applying a rule in every possible way, the single multiway step behind such a graph
- [`MultiwayFunctionSystem`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayFunctionSystem/) (WFR) a multiway system based on the evaluation of a function with multiple results over the integers
- [`LambdaLifetime`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl) (Wolfram/Lambda) the number of beta reductions a term takes to reach its normal form
- [`BetaReduceSizes`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReduceSizes.html) (Wolfram/Lambda) the size of the term after each step of a reduction sequence
- [`TReduce`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TReduce.html) (WolframInstitute/THVMLink) a term reduced on the interaction-net runtime
- [`TRedexes`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TRedexes.html) (WolframInstitute/THVMLink) the redexes a term currently offers, the interactions the runtime may fire next
- [`TMultiwayGraph`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TMultiwayGraph.html) (WolframInstitute/THVMLink) the multiway graph of a term reduction on an interaction-net runtime, one vertex per superposed branch of each step and an edge for each firing between them, with optional branchial edges
- [`TCausalGraph`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/THVMLink/Documentation/ref/TCausalGraph.html) (WolframInstitute/THVMLink) the causal graph of the interactions a reduction performs on an interaction-net runtime, an edge where one firing consumes what another produced

### Expression Evaluation and Its Causal Graph

- `Trace` (WL) the intermediate expressions produced while an expression evaluates, the trace a causal structure is read from
- [`TraceCausalGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TraceCausalGraph/) (WFR) the causal graph of an expression evaluation, built from its evaluation trace, with the evaluation path and its events graph as further properties
- [`MultiEvaluate`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/MultiEvaluate) (Wolfram Cloud) the multiway evaluation of an expression in every possible order of its subexpressions, with `"StatesGraph"`, `"EvolutionGraph"` and `"CausalGraph"` properties
- [`LambdaCausalGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaCausalGraph.html) (Wolfram/Lambda) the causal graph of a single beta reduction sequence of a lambda expression, its events the beta substitutions
- [`LambdaMultiwayCausalGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaMultiwayCausalGraph.html) (Wolfram/Lambda) the multiway causal graph of the beta reductions of a lambda term

- `TraceScan` (WL), `TracePrint` (WL), `Stack` (WL), `Hold` (WL), `HoldForm` (WL), `Unevaluated` (WL), `Evaluate` (WL), `ReleaseHold` (WL), `Inactive` (WL), `Activate` (WL), …

### Enumerating and Sampling Lambda Terms

- [`EnumerateLambdas`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/EnumerateLambdas.html) (Wolfram/Lambda), [`EnumerateSizeLambdas`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/EnumerateSizeLambdas.html) (Wolfram/Lambda) all lambda expressions up to a given depth and length, or with a given number of leaves
- [`EnumerateLinearLambdas`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/EnumerateLinearLambdas.html) (Wolfram/Lambda) the linear lambda terms with a given number of abstractions, each bound variable used exactly once
- [`RandomLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/RandomLambda.html) (Wolfram/Lambda) a random lambda expression with a given maximum depth and length
- [`LambdaSize`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Enumeration.wl) (Wolfram/Lambda) the size of a term under chosen weights for its abstractions, applications and variables
- [`$LambdaBusyBeavers`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl) (Wolfram/Lambda) the busy beaver champions of the lambda calculus, the closed terms of each binary lambda calculus size with the largest normal form, read with de Bruijn indices
- `Groupings` (WL) every way a sequence of terms can be parenthesized, the application shapes a term of a given size can take

### Compiling to and from Combinators

- [`ToCombinator`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ToCombinator.html) (WolframInstitute/PureMath) a lambda term compiled to an equivalent SKI combinator term by bracket abstraction
- [`FromCombinator`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FromCombinator.html) (WolframInstitute/PureMath) an SKI combinator term expanded to its defining lambda term, each of S, K and I replaced by its lambda definition
- [`CombinatorLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/CombinatorLambda.html) (Wolfram/Lambda), [`LambdaCombinator`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaCombinator.html) (Wolfram/Lambda) a lambda term compiled to a combinator term and a combinator term read back as a lambda term, the translation that makes the two calculi interchangeable
- [`SKCombinatorCompile`](https://resources.wolframcloud.com/FunctionRepository/resources/SKCombinatorCompile/) (WFR) an ordinary expression represented in terms of the S and K combinators
- [`$LambdaCombinatorStore`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/%24LambdaCombinatorStore.html) (Wolfram/Lambda) an entity store of the named combinators, S, K, I, B, C, W, Y and their kin, each with its lambda term
- [Decompiling combinators to lambda calculus](https://community.wolfram.com/t/17815) (Wolfram Community) SK combinator expressions decompiled into lambda functions

### Drawing a Lambda Term and Its Reduction

- [`LambdaTree`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaTree.html) (Wolfram/Lambda) a lambda term as a tree
- [`LambdaDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaDiagram.html) (Wolfram/Lambda) a lambda term drawn as Tromp's lambda diagram
- [`BetaReduceStepPlot`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReduceStepPlot.html) (Wolfram/Lambda) the size of a term plotted step by step along its beta reduction
- `ExpressionTree` (WL) an expression as a tree, the application structure of a term made explicit

- `TreeForm` (WL), `Tree` (WL), `ExpressionGraph` (WL), `LeafCount` (WL), `Depth` (WL), `TreeDepth` (WL), `TreeSize` (WL), `TreeLeafCount` (WL), `UnlabeledTree` (WL), `Position` (WL), `Extract` (WL), …

### Wolfram/Lambda

- [Wolfram/Lambda](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/) tools for the lambda calculus, from beta reduction and enumeration to the multiway and causal graphs of a reduction and the diagrams that draw a term
- [`BetaReduceList`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReduceList.html) the terms produced by iterated beta substitution, one for each step taken
- [`BetaReduceListPositions`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl) the successive terms of a reduction together with the positions reduced at each step
- [`BetaReducePath`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl) the redex positions reduced in turn along a beta reduction path
- [`BetaReduceChain`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReduceChain.html) a beta substitution sequence returned as highlighted terms, the redex marked at every step
- [`BetaReduceFixedPointList`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl) the reduction of a term continued to a fixed point, every intermediate term kept
- [`BetaReduceTreeList`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BetaReduceTreeList.html) the tree of the term at each step of a reduction sequence
- [`BetaReduceCompiled`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Compiled.wl) beta reduction run by a compiled evaluator, for terms whose reduction is long
- [`LambdaPathEvents`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl) the events along one beta reduction path of a term, each an edge between successive terms tagged by the position of its redex
- [`LambdaAllPathEvents`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Multiway.wl) the events along every path of the multiway graph of a term
- [`LambdaSingleWayCausalGraph`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/TreeGraphs.wl) the causal graph of one reduction path built from its list of events, with a dependency only method
- [`LambdaCausalEvolutionGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaCausalEvolutionGraph.html) the states of one reduction sequence drawn together with the events that relate them
- [`LambdaMultiwayCausalEvolutionGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaMultiwayCausalEvolutionGraph.html) the states, events and causal edges of every branch of a reduction gathered in one graph
- [`LambdaConvert`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaConvert.html) a lambda term converted into another of the representations the paclet understands
- [`TagLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/TagLambda.html), [`UntagLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/UntagLambda.html) a term whose variables are de Bruijn indices given named bound variables, and the named form returned to indices
- [`LambdaTags`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl) the tags carried by the abstractions of a tagged term
- [`BetaReduceTag`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl) the beta reduction of the redex whose abstraction carries a given tag
- [`LambdaDepthForm`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl) a term written with every variable marked by the depth of the abstraction that binds it
- [`LambdaDepths`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl) the binding depth of every variable of a term
- [`LambdaPositions`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl) the position of each abstraction of a term with the positions of the variables it binds
- [`LambdaForm`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl) a term with its tags removed and its abstractions headed by the lambda symbol
- [`ParseLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/ParseLambda.html), [`LambdaString`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaString.html) a lambda term parsed from its string form, and the string form of a lambda term
- [`LambdaBLC`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaBLC.html), [`BLCLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/BLCLambda.html) a term as the bits of its binary lambda calculus encoding, and the term a list of bits encodes
- [`ChurchNumeral`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/ChurchNumeral.html), [`FromChurchNumeral`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/FromChurchNumeral.html) the Church numeral of a natural number, and the integer a Church numeral stands for
- [`FunctionLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/FunctionLambda.html), [`LambdaFunction`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaFunction.html) nested anonymous functions converted into a lambda term, and a lambda term converted back into a function that can be applied
- [`LambdaGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaGraph.html) a lambda term as a graph
- [`LambdaLoopbackGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaLoopbackGraph.html) the tree of a term with an edge from each variable back to the abstraction that binds it
- [`LambdaStringDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaStringDiagram.html) a lambda term drawn as a string diagram, its wires the variables
- [`ColorizeLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/ColorizeLambda.html) each abstraction and the variables it binds given a color of their own
- [`LambdaArrayPlot`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaArrayPlot.html) a term drawn as an array of the characters of its written form
- [`LambdaDepthArrayPlot`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaDepthArrayPlot.html) an array plot of a term in which each position carries its depth
- [`LambdaToHaskell`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaToHaskell.html) a lambda term written as Haskell source
- [`FindMinimalLambdaCombinator`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/FindMinimalLambdaCombinator.html) the smallest combinator term equivalent to a lambda term, found by exhaustive search

- [`LambdaApplication`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaApplication.html), [`LambdaRightApplication`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaRightApplication.html), [`LambdaBrackets`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaBrackets.html), [`LambdaVariableForm`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaVariableForm.html), [`LambdaSmiles`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaSmiles.html), [`LambdaTreeDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaTreeDiagram.html), [`HighlightLambdaTree`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/HighlightLambdaTree.html), [`LambdaMinimalTree`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/TreeGraphs.wl), [`SmoothLambdaStringDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/SmoothLambdaStringDiagram.html), [`LambdaDepthArrayPlot3D`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaDepthArrayPlot3D.html), [`UncolorizeLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/UncolorizeLambda.html), [`LambdaUntag`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl), …
- [`BetaNormalQ`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl), [`ClosedLambdaQ`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl), [`ChurchNumeralQ`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Lambda.wl), [`LinearLambdaQ`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Enumeration.wl), [`AffineLambdaQ`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Enumeration.wl), [`EnumerateAffineLambdas`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Enumeration.wl), [`RandomSizeLambda`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/RandomSizeLambda.html), [`BetaReduceListCompiled`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Compiled.wl), [`BetaReduceSizesCompiled`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Compiled.wl), [`FindMinimalCombinatorLambda`](https://github.com/WolframInstitute/WolframLambda/blob/main/Kernel/Evaluation.wl), …

### WolframInstitute/PureMath

- [WolframInstitute/PureMath](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/guide/PureMath.html) pure mathematics in the Wolfram Language, whose foundations area covers the lambda calculus, combinatory logic and type theory
- [`LambdaVariable`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaVariable.html), [`LambdaAbstraction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaAbstraction.html), [`LambdaApply`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaApply.html) the variable, the abstraction binding a variable in a body and the application a term is built from
- [`LambdaTermQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaTermQ.html) whether an expression is a well-formed lambda term
- [`LambdaBoundVariables`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaBoundVariables.html) the variables of a term that one of its abstractions binds
- [`SubstituteLambdaTerm`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SubstituteLambdaTerm.html) a term substituted for the free occurrences of a variable, with bound variables renamed so that none is captured
- [`LambdaAlphaEquivalentQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaAlphaEquivalentQ.html) whether two terms are the same up to renaming of their bound variables
- [`BetaNormalFormQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/BetaNormalFormQ.html) whether a term admits no further beta reduction
- [`$ReductionLimit`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/%24ReductionLimit.html) the number of reduction steps taken before a reduction gives up
- [`ChurchSucc`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ChurchSucc.html), [`ChurchPlus`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ChurchPlus.html), [`ChurchMult`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ChurchMult.html) the successor, addition and multiplication terms on Church numerals
- [`CurryHoward`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CurryHoward.html) the simply typed lambda term corresponding to a natural-deduction proof of the implicational fragment, a proof read as a program
- [`PropositionToType`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PropositionToType.html) the type a propositional formula corresponds to under the Curry-Howard correspondence
- [`BracketAbstraction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/BracketAbstraction.html) the SKI combinator term that eliminates a variable from a term, behaving as the lambda abstraction over it
- [`LambdaCombinatorY`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LambdaCombinatorY.html) the fixed-point combinator Y as a lambda term
