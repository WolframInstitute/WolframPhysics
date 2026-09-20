---
Template: Guide
Name: StringDiagrams
Title: String Diagrams
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/StringDiagrams
Description: String and wiring diagrams and their ports, sequential, parallel and network composition, the diagrammatic algebra of processes, spiders and the ZX calculus, the correspondence between diagrams and expressions, and diagram rendering
Keywords: [string diagram, wiring diagram, diagrammatic computation, process, port, wire, monoidal category, symmetric monoidal category, tensor product, diagram composition, diagram network, diagram rewriting, diagram simplification, spider, ZX calculus, ZX diagram, tensor network, quantum circuit, tensor contraction, Wolfram physics]
RelatedGuides: [CategoricalStructures, CategoriesAndFunctors, BranchialGraphs, Hypergraphs, LambdaCalculus, Visualization]
Links: ["[DiagrammaticComputation on GitHub](https://github.com/WolframInstitute/DiagrammaticComputation)", "[ZX-Calculus and Extended Hypergraph Rewriting Systems I](https://arxiv.org/abs/2010.02752)", "[ZX-Calculus and Extended Wolfram Model Systems II](https://arxiv.org/abs/2103.15820)", "[Fast Automated Reasoning over String Diagrams using Multiway Causal Structure](https://arxiv.org/abs/2105.04057)"]
---

## Abstract

A string diagram draws a process as a box with typed ports and a wire for every value passing
between boxes, so that composing processes is drawing and reasoning about them is rewriting the
picture: diagrams and the ports they expose; sequential, parallel and network composition; the
copy, merge, erase, cap and cup processes of a diagrammatic algebra; spiders and the ZX
calculus of quantum circuits; the correspondence between a diagram and the function, tensor or
expression it denotes; and the drawing of the diagrams themselves.

## Functions

### Diagrams and Ports

- [`Diagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/Diagram.html) (Wolfram/DiagrammaticComputation) a symbolic diagram with input and output ports, a morphism in a symmetric monoidal category
- [`Port`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/Port.html) (Wolfram/DiagrammaticComputation), [`PortDual`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/PortDual.html) (Wolfram/DiagrammaticComputation) a symbolic input or output of a diagram, and the same port with its direction toggled
- [`IdentityDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/IdentityDiagram.html) (Wolfram/DiagrammaticComputation), [`SingletonDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/SingletonDiagram.html) (Wolfram/DiagrammaticComputation), [`EmptyDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/EmptyDiagram.html) (Wolfram/DiagrammaticComputation) the identity diagram on a tuple of ports, a diagram wrapped as one opaque node, and the diagram with no subdiagrams
- [`StringDiagram`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringDiagram.html) (WolframInstitute/PureMath) a morphism of the free structure on a monoidal signature as a typed port graph of boxes and wires
- [`MonoidalSignature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MonoidalSignature.html) (WolframInstitute/PureMath) a presentation of a monoidal category, its generating objects with an involutive dual pairing and its generating processes

- [`StringDiagramQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/StringDiagramQ.html) (WolframInstitute/PureMath), [`MonoidalSignatureQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MonoidalSignatureQ.html) (WolframInstitute/PureMath), [`MonoidalFunctorQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MonoidalFunctorQ.html) (WolframInstitute/PureMath), …

### Composing Diagrams

- [`DiagramComposition`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramComposition.html) (Wolfram/DiagrammaticComputation) the sequential composition of diagrams, the outputs of one feeding the inputs of the next
- [`DiagramProduct`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramProduct.html) (Wolfram/DiagrammaticComputation) the parallel composition of diagrams, two processes side by side under the tensor product
- [`DiagramNetwork`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramNetwork.html) (Wolfram/DiagrammaticComputation) the orderless composition of diagrams, ports of equal name joined into wires
- [`DiagramDecompose`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramDecompose.html) (Wolfram/DiagrammaticComputation) a composite diagram taken apart into the expression tree of its subdiagrams
- `Composition` (WL), `RightComposition` (WL) the sequential composition a diagram composition denotes, written right to left and left to right
- `TensorProduct` (WL) the tensor product a parallel composition denotes

### The Diagrammatic Algebra of Processes

- [`CapDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/CapDiagram.html) (Wolfram/DiagrammaticComputation), [`CupDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/CupDiagram.html) (Wolfram/DiagrammaticComputation) the cap joining two input ports and the cup joining two output ports, the bends that let a wire turn back
- [`CopyDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/CopyDiagram.html) (Wolfram/DiagrammaticComputation), [`MergeDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/MergeDiagram.html) (Wolfram/DiagrammaticComputation), [`EraserDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/EraserDiagram.html) (Wolfram/DiagrammaticComputation) the processes that duplicate a port onto several outputs, merge several inputs into one, and discard a port
- [`PermutationDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/PermutationDiagram.html) (Wolfram/DiagrammaticComputation) the crossing of wires that permutes a tuple of ports, the symmetry of the monoidal product
- [`AbstractStrictMonoidalCategory`](https://resources.wolframcloud.com/FunctionRepository/resources/AbstractStrictMonoidalCategory/) (WFR) a category with a strictly associative and unital tensor product, the setting a string diagram denotes

### Spiders and the ZX Calculus

- [`SpiderDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/SpiderDiagram.html) (Wolfram/DiagrammaticComputation) a spider, one node joining any number of legs, the generator a ZX style calculus is built from
- [`MakeZXDiagram`](https://resources.wolframcloud.com/FunctionRepository/resources/MakeZXDiagram/) (WFR) a linear map drawn as a diagram of the ZX calculus
- [`ZXTensorNetwork`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/ZX.m) (Wolfram/QuantumFramework) the ZX tensor network of a quantum circuit, a graph of Z, X, H and boundary vertices carrying the spider phases
- [`ZXExpression`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/ZX.m) (Wolfram/QuantumFramework) the ZX expression of a quantum circuit, formal Z, X and H tensors composed with their phases
- [`ZXTensorNetworkQuantumCircuit`](https://github.com/WolframResearch/QuantumFramework/blob/main/QuantumFramework/Kernel/ZX.m) (Wolfram/QuantumFramework) the circuit of Z and X spiders and Hadamards that a ZX tensor network stands for

- [`QuantumDiscreteStateToZXDiagram`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteStateToZXDiagram/) (WFR), [`QuantumDiscreteOperatorToZXDiagram`](https://resources.wolframcloud.com/FunctionRepository/resources/QuantumDiscreteOperatorToZXDiagram/) (WFR), [`ZXDiagramToQuantumDiscreteState`](https://resources.wolframcloud.com/FunctionRepository/resources/ZXDiagramToQuantumDiscreteState/) (WFR), [`ZXDiagramToQuantumDiscreteOperator`](https://resources.wolframcloud.com/FunctionRepository/resources/ZXDiagramToQuantumDiscreteOperator/) (WFR), …

### Diagrams and Expressions

- [`ToDiagram`](https://github.com/WolframInstitute/DiagrammaticComputation/blob/main/DiagrammaticComputation/Kernel/Diagram/ToDiagram.wl) (Wolfram/DiagrammaticComputation) a diagram converted from a graph, tree, hypergraph, neural network or system model
- [`DiagramFunction`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramFunction.html) (Wolfram/DiagrammaticComputation) the executable dataflow function a diagram computes
- [`DiagramTensor`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramTensor.html) (Wolfram/DiagrammaticComputation) the symbolic tensor contraction a diagram denotes
- `TensorProduct` (WL), `TensorContract` (WL) the tensor product a parallel composition denotes and the index contraction a wire denotes
- [`LambdaStringDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/LambdaStringDiagram.html) (Wolfram/Lambda), [`SmoothLambdaStringDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/Lambda/ref/SmoothLambdaStringDiagram.html) (Wolfram/Lambda) a lambda expression drawn as a string diagram, in straight and in smoothed form

- `TensorTranspose` (WL), `TensorDimensions` (WL), `KroneckerProduct` (WL), `Composition` (WL), `RightComposition` (WL), …

### Drawing Diagrams

- [`DiagramGraphics`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramGraphics.html) (Wolfram/DiagrammaticComputation) a diagram rendered with each composite drawn as a single node
- [`DiagramGrid`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramGrid.html) (Wolfram/DiagrammaticComputation) a diagram rendered as a two dimensional grid of boxes and wires
- [`DiagramArrange`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramArrange.html) (Wolfram/DiagrammaticComputation) an arbitrary network arranged into a grid by inserting identities, permutations, caps, cups and spiders
- [`DiagramDraw`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramDraw.html) (Wolfram/DiagrammaticComputation) a diagram drawn interactively
- `Graphics` (WL) the graphics expression a rendered diagram is, combinable with any other primitives
- `Graph` (WL) the port graph of a diagram network, drawn with the layouts a graph accepts

### Wolfram/DiagrammaticComputation

- [Wolfram/DiagrammaticComputation](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/) a paclet for diagrams of processes, from typed ports and composition to rewriting, evaluation and rendering
- [`DiagramRightComposition`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramRightComposition.html) sequential composition read left to right
- [`DiagramSum`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramSum.html) the additive composition of diagrams over a direct sum of ports
- [`ToDiagramNetwork`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/ToDiagramNetwork.html) a composite diagram re-expressed as an orderless network
- [`DiagramRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramRule.html) a rewrite rule replacing diagrams matching a source diagram with a target diagram, aligning their ports
- [`DiagramReplace`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramReplace.html), [`DiagramReplaceList`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramReplaceList.html), [`DiagramNestReplace`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramNestReplace.html) the first rewrite of a diagram by a rule, every possible single rewrite, and rules applied repeatedly
- [`SimplifyDiagram`](https://github.com/WolframInstitute/DiagrammaticComputation/blob/main/DiagrammaticComputation/Kernel/Diagram/Diagram.wl) a diagram simplified by absorbing its identity wires
- [`CommutationRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/CommutationRule.html), [`AnnihilationRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/AnnihilationRule.html), [`EraserRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/EraserRule.html) two operations commuting past each other, a pair of processes annihilating, and a process discarded
- [`DiagramHypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramHypergraph.html), [`DiagramHypergraphRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramHypergraphRule.html) the hypergraph representation of a diagram and of a diagram rule, the form in which the rewriting engine matches them
- [`DiagramDual`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramDual.html), [`DiagramFlip`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramFlip.html), [`DiagramReverse`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramReverse.html) every port reversed in direction, the diagram reflected top to bottom, and its ports reversed in order
- [`DiagramPermute`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramPermute.html), [`DiagramSplit`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramSplit.html) the ports of a diagram permuted, and its ports partitioned between inputs and outputs
- [`DiagramSubdiagrams`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramSubdiagrams.html), [`DiagramCases`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramCases.html), [`DiagramPositions`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramPositions.html), [`DiagramPosition`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramPosition.html) the subdiagrams of a composite, those matching a pattern, and the positions of each
- [`DiagramMap`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramMap.html), [`DiagramMapAt`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramMapAt.html), [`DiagramReplacePart`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramReplacePart.html) a function mapped over every subdiagram, applied at given positions, and a subdiagram replaced at a position
- [`DiagramExtract`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramExtract.html), [`DiagramInsert`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramInsert.html), [`DiagramDelete`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramDelete.html) the subdiagram at a position extracted, a subdiagram inserted there, and the one there deleted
- [`DiagramPattern`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramPattern.html), [`DiagramExpressionReplace`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramExpressionReplace.html) a pattern matching diagrams inside a rewrite rule, and replacement at the expression level inside a diagram
- [`PropagationRule`](https://github.com/WolframInstitute/DiagrammaticComputation/blob/main/DiagrammaticComputation/Kernel/Diagram/Rewriting/Rewriting.wl), [`DuplicateAnnihilationRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DuplicateAnnihilationRule.html), [`EraserAnnihilationRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/EraserAnnihilationRule.html), [`DuplicateEraserRule`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DuplicateEraserRule.html) a unit propagated through a process, and the interactions between a copy, an erase and their duals
- [`RemoveDiagramRule`](https://github.com/WolframInstitute/DiagrammaticComputation/blob/main/DiagrammaticComputation/Kernel/Diagram/Rewriting/Rewriting.wl) a wrapper marking a rule for removal during a rewrite
- [`TensorDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/TensorDiagram.html) a diagram built from a symbolic tensor contraction
- [`FeynmanDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/FeynmanDiagram.html) a diagram network built from a topology graph
- [`RowDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/RowDiagram.html), [`ColumnDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/ColumnDiagram.html) diagrams arranged horizontally and vertically

- [`PortProduct`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/PortProduct.html), [`PortSum`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/PortSum.html), [`ZeroDiagram`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/ZeroDiagram.html), [`DiagramsGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramsGraph.html), [`DiagramsNetGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramsNetGraph.html), [`DiagramsPortGraph`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramsPortGraph.html), [`PortQ`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/PortQ.html), [`DiagramQ`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/DiagrammaticComputation/ref/DiagramQ.html), …
