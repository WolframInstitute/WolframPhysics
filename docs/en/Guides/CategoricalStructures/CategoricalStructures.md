---
Template: Guide
Name: CategoricalStructures
Title: Categorical Structures
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/CategoricalStructures
Description: Categories, functors and universal constructions, the category of hypergraph states and double pushout rewriting, presheaves and topoi, and the string diagrams that draw processes as wires and boxes
Keywords: [category, functor, natural transformation, limit, colimit, pushout, hypergraph morphism, double pushout rewriting, presheaf, topos, string diagram, wiring diagram, monoidal category, spider, ZX calculus]
RelatedGuides: [WolframPhysics, CategoriesAndFunctors, StringDiagrams]
Links: ["[Categorica on GitHub](https://github.com/JonathanGorard/Categorica)", "[DiagrammaticComputation on GitHub](https://github.com/WolframInstitute/DiagrammaticComputation)"]
---

## Abstract

Categorical structures state rewriting and composition abstractly, so that a rule becomes a span and an evolution a diagram. Each area has its own guide.

Categories and functors carry the algebra: categories and the quivers that present them; functors and natural transformations; limits, colimits and the other universal constructions; the category of hypergraph states, with the presheaves and topos it forms; double pushout rewriting, where a rule is a span of monomorphisms and an event a pair of pushout squares; and the reading of a multiway system as a category.

String diagrams carry the picture: diagrams and the ports they expose; sequential, parallel and network composition; the copy, merge, erase, cap and cup processes of a diagrammatic algebra; spiders and the ZX calculus; the correspondence between a diagram and the function, tensor or expression it denotes; and the drawing of the diagrams themselves.

## Functions

### [Categories and Functors](paclet:WolframInstitute/WolframPhysics/guide/CategoriesAndFunctors)

- [`AbstractCategory`](https://resources.wolframcloud.com/FunctionRepository/resources/AbstractCategory/) (WFR) a collection of objects and morphisms obeying the associativity and identity axioms
- [`AbstractFunctor`](https://resources.wolframcloud.com/FunctionRepository/resources/AbstractFunctor/) (WFR) a homomorphism between abstract categories, an object map and an arrow map extended over composites and identities
- [`HypergraphCategory`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphCategory.html) (WolframInstitute/PureMath) the category of hypergraph states and their morphisms, with composition and identities
- [`HypergraphRewritingRule`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphRewritingRule.html) (WolframInstitute/PureMath) a rule as a span of two monomorphisms out of a shared interface, a Wolfram model rule in categorical form
- [`FinitePresheaf`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FinitePresheaf.html) (WolframInstitute/PureMath) a set at every object and a map for every morphism, validated as a contravariant functor on a finite index category
- [`HypergraphDoublePushout`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HypergraphDoublePushout.html) (WolframInstitute/PureMath) the double-pushout rewrite step of a rule at a match, the categorical form of an event

### [String Diagrams](paclet:WolframInstitute/WolframPhysics/guide/StringDiagrams)

- [`Diagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/Diagram.html) (Wolfram/DiagrammaticComputation) a symbolic diagram with input and output ports, a morphism in a symmetric monoidal category
- [`DiagramComposition`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramComposition.html) (Wolfram/DiagrammaticComputation) the sequential composition of diagrams, the outputs of one feeding the inputs of the next
- [`DiagramRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramRule.html) (Wolfram/DiagrammaticComputation) a rewrite rule replacing diagrams matching a source diagram with a target diagram, aligning their ports
- [`SpiderDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/SpiderDiagram.html) (Wolfram/DiagrammaticComputation) a spider, one node joining any number of legs, the generator a ZX style calculus is built from
- [`DiagramGraphics`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramGraphics.html) (Wolfram/DiagrammaticComputation) a diagram rendered with each composite drawn as a single node
- [`DiagramProduct`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramProduct.html) (Wolfram/DiagrammaticComputation) the parallel composition of diagrams, two processes side by side under the tensor product
