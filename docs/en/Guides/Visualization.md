---
Template: Guide
Name: Visualization
Title: Visualization
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/Visualization
Description: Hypergraph states and rules drawn as pictures, evolutions shown as arrays, filmstrips and animations, the layouts of the states, causal, multiway and branchial graphs, foliations and light cones drawn over a causal graph, the project style and color data, and embeddings and interactive views
Keywords: [visualization, hypergraph plot, rule plot, state plot, array plot, filmstrip, animation, causal graph, branchial graph, multiway graph, layered layout, graph layout, vertex coordinates, vertex shape function, highlighting, foliation, light cone, style data, color scheme, plot theme, embedding, three-dimensional layout, interactive viewer]
RelatedGuides: [WolframPhysics, GraphsAndNetworks, Hypergraphs, WolframModels, BranchialGraphs, HypergraphDimension, RelativityAndFoliations, CellularAutomataAndSubstitutionSystems, StringDiagrams]
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[Guide to Wolfram Physics Project functions](https://www.wolframcloud.com/obj/wolframphysics/Tools/guide-page)", "[Graph Visualization guide](https://reference.wolfram.com/language/guide/GraphVisualization.html)", "[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)"]
---

## Abstract

Every object a Wolfram model produces is read as a picture: the hypergraph state and the rule
that rewrites it; an evolution laid out as an array of cells, a filmstrip of states or an
animation; the states, causal, multiway and branchial graphs, with the layered layouts that show
their generations; the foliations and light cones drawn over a causal graph; the styles and
colors these objects are rendered in; and the embeddings and interactive views that carry them
into three dimensions.

## Functions

### Hypergraph States and Rules

- [`WolframModelPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelPlot/) (WFR) a visual display of a hypergraph, its hyperedges drawn as arrows and polygons through their vertices, the standard picture of a Wolfram model state
- [`SimpleHypergraphPlot`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/SimpleHypergraphPlot.html) (WolframInstitute/Hypergraph), [`SimpleHypergraphPlot3D`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/SimpleHypergraphPlot3D.html) (WolframInstitute/Hypergraph) a plot of a hypergraph object in the plane or in three dimensions
- [`HypergraphPlot`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/HypergraphPlot.md) (SetReplace) a plot of an ordered hypergraph represented as a list of vertex lists
- [`Hypergraph3D`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/Hypergraph3D.html) (WolframInstitute/Hypergraph) a hypergraph with its hyperedges laid out in three dimensions
- [`HypergraphEmbedding`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphEmbedding.html) (WolframInstitute/Hypergraph) the coordinates at which the vertices of a hypergraph are drawn, in a two or three dimensional layout
- `RulePlot` (WL) a plot representing the rule of a computational system, a cellular automaton, Turing machine or substitution system
- [`HighlightRule`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HighlightRule.html) (WolframInstitute/Hypergraph) graphics highlighting every way a rule matches a hypergraph, together with the result of each rewrite
- [`HypergraphDraw`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphDraw.html) (WolframInstitute/Hypergraph) an interactive canvas for drawing a hypergraph by hand
- [`HypergraphRuleDraw`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphRuleDraw.html) (WolframInstitute/Hypergraph) two side-by-side canvases for drawing the input and the output of a rule

### Evolutions as Arrays, Filmstrips and Animations

- `ArrayPlot` (WL) the values of an array shown as a discrete array of squares, the picture of a cellular automaton or substitution system evolution
- [`WolframModelHistoryPlots`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) (Writings) the states of a Wolfram model evolution plotted with the newly created edges highlighted
- [`HGDimensionFilmstrip`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine) a grid of the timestep union graphs of an evolution, colored by dimension
- [`HGGeodesicFilmstrip`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine) the geodesic plots of an evolution, one list of plots per timestep
- `GraphicsRow` (WL), `GraphicsGrid` (WL) a row or a grid of plots, the filmstrip form of a sequence of states
- `ListAnimate` (WL) a list of plots played as an animation, the frames of an evolution shown in order
- `Manipulate` (WL) a picture placed under a control, a generation of an evolution chosen with a slider

- `ArrayPlot3D` (WL), `PixelConstrained` (WL), `Animate` (WL), …
- [`unorderedHypergraphEvolutionStatesPlots`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/AlternativeFormulations.wl) (wolframphysics.org), [`SerratedBricksArrayPlot`](https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/SerratedBricksArrayPlot) (Wolfram Cloud), …

### States, Causal, Multiway and Branchial Graphs

- `LayeredGraphPlot` (WL), `LayeredGraphPlot3D` (WL) a layered plot of a graph in two or three dimensions, the layout of causal, multiway and branchial graphs
- `GraphLayout` (WL) the option choosing the layout used to draw a graph
- `VertexCoordinates` (WL) the option giving the coordinates at which the vertices of a graph are placed
- `HighlightGraph` (WL) a graph with chosen vertices, edges or subgraphs highlighted, a geodesic or a light cone marked on a spatial or causal graph
- [`wolframModelShapeFunction`](https://www.wolframcloud.com/obj/wolframphysics/BlogHelpers) (Writings) a vertex shape function rendering a hypergraph vertex with `WolframModelPlot` in a framed inset, for a multiway graph whose states are hypergraphs
- `GraphValuePlot` (WL) values over the vertices or edges of a graph plotted on it

- `GraphPlot` (WL), `GraphPlot3D` (WL), `Graph3D` (WL), `TreePlot` (WL), `TreeLayout` (WL), `TreeElementLabel` (WL), `TreeElementStyle` (WL), …

### Foliations and Light Cones on a Causal Graph

- [`VisualizeFoliatedCausalGraph`](https://github.com/WolframInstitute/InfraCausality) (WolframInstitute/InfraCausality) a foliation of a causal graph rendered as colored slices, with its chains
- [`FoliationDiagram`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) (Writings) a graph laid out and colored by a foliation, with contour lines between the slices
- [`drawFoliation`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-05/FoliationLines.wl) (wolframphysics.org) a graph shown with foliation lines drawn between successive vertex lists
- [`VisualizeLightRays`](https://github.com/WolframInstitute/InfraCausality) (WolframInstitute/InfraCausality) a causal graph in which clicking any vertex highlights its outgoing and incoming light rays
- [`VisualizeMessageFunction`](https://github.com/WolframInstitute/InfraCausality) (WolframInstitute/InfraCausality) two observer paths drawn on a causal graph, a clicked vertex of one showing its message images on the other
- [`VisualizeEchoFunction`](https://github.com/WolframInstitute/InfraCausality) (WolframInstitute/InfraCausality) two observer paths drawn on a causal graph with the echo function from one to the other overlaid

### Styles and Color Schemes

- [`WolframPhysicsProjectStyleData`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframPhysicsProjectStyleData/) (WFR) the styles of the branchial, causal, states, spatial and rulial graphs used in the Wolfram Physics Project
- `VertexStyle` (WL), `EdgeStyle` (WL) the styles used for the vertices and edges of a graph
- `VertexSize` (WL), `VertexShapeFunction` (WL), `VertexLabels` (WL) the size, the rendering function and the labels of the vertices of a graph
- [`CausalGraphStyle`](https://github.com/WolframInstitute/InfraCausality) (WolframInstitute/InfraCausality) graph style options for a causal graph, the orange causal look and the faint and neutral backdrops among them
- [`$CausalColors`](https://github.com/WolframInstitute/InfraCausality) (WolframInstitute/InfraCausality) the causal color palette every color of the causal, observer and light ray pictures derives from

- `GraphStyle` (WL), `GraphHighlight` (WL), `GraphHighlightStyle` (WL), `GraphLayerStyle` (WL), `VertexShape` (WL), `EdgeLabels` (WL), `EdgeShapeFunction` (WL), `TaggedEdgeStyle` (WL), `MultiedgeStyle` (WL), `SelfLoopStyle` (WL), `Arrowheads` (WL), `Style` (WL), `Labeled` (WL), `Placed` (WL), `Tooltip` (WL), …

### Embeddings and Interactive Views

- [`MultiPerspectiveEmbedding`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiPerspectiveEmbedding/) (WFR), [`MultiPerspectiveEmbeddingViewer`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiPerspectiveEmbeddingViewer/) (WFR) a 3D embedding of several graphs preserving all their pairwise distances simultaneously along various 2D projections, and its interactive viewer
- [`ComplexEmbedding`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) a numerical embedding of a simplicial complex in two or three dimensions by energy minimization
- [`UniformLengthEmbedding`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) an embedding of a graph in which every edge is a unit segment

- [`VisualizeFiberedGraph`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory), [`FiberedGraphViewer`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory), [`RandomFiberedGraphViewer`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory), [`PointViewer`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry), [`SegmentViewer`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry), [`ShellViewer`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry), [`CircleViewer`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry), …

### Wolfram Function Repository

- [`HypergraphPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphPlot/) a hypergraph plotted from a list of hyperedges
- [`SimpleHypergraphPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/SimpleHypergraphPlot/) a hypergraph plotted from its hyperedges and its isolated vertices
- [`LayeredLayoutGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/LayeredLayoutGraph/) a graph rendered with its vertices arranged in specified layers, a foliation drawn as a layout
- [`DistanceLayeredGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/DistanceLayeredGraph/) a graph rendered with its vertices at heights given by their distance from a root
- [`GraphFunctionPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphFunctionPlot/) the values of a function at the vertices of a graph
- [`MultiwayEvolutionPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/MultiwayEvolutionPlot/) a plot of the evolution of a string multiway system
- [`SubstitutionSystemCausalPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/SubstitutionSystemCausalPlot/) a plot of the causal features of a substitution system evolution
- [`MultispacePlot3D`](https://resources.wolframcloud.com/FunctionRepository/resources/MultispacePlot3D/) multispace plotted in three dimensions
- [`DragGraphVertices`](https://resources.wolframcloud.com/FunctionRepository/resources/DragGraphVertices/) the vertices of a graph dragged around dynamically
- [`PairwiseMultidimensionalScaling`](https://resources.wolframcloud.com/FunctionRepository/resources/PairwiseMultidimensionalScaling/) pairwise distances embedded into a Cartesian space by multidimensional scaling
- [`TensorDiagram`](https://resources.wolframcloud.com/FunctionRepository/resources/TensorDiagram/) a symbolic tensor expression displayed as a diagram
- [`InteractiveListSelector`](https://resources.wolframcloud.com/FunctionRepository/resources/InteractiveListSelector/) an interactive selection over a list of plots, final state plots mapped to the rules that made them

- [`WolframModelRuleForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelRuleForm/), [`WolframModelSignatureForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelSignatureForm/), [`WolframModelTraditionalForm`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModelTraditionalForm/), …

### SetReplace

- [SetReplace](https://github.com/maxitg/SetReplace) a paclet for set and hypergraph substitution systems, carrying the plotting and style functions below
- [`RulePlot`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/RulePlotOfWolframModel.md) a hypergraph substitution rule drawn as its left and right hypergraphs, the elements shared by both sides placed at the same positions and highlighted
- [`SetReplaceStyleData`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/SetReplaceStyleData.md) an association describing the default styles used in SetReplace
- [`WolframPhysicsProjectStyleData`](https://github.com/maxitg/SetReplace) the project styles as the paclet defines them, the expressions-events graph and its expression and event vertices among them
- [`$SetReplacePlotThemes`](https://github.com/maxitg/SetReplace) the plot themes the paclet's pictures can be drawn in
- [`HypergraphUnificationsPlot`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/HypergraphUnifications.md) plots of all the hypergraphs containing two given hypergraphs as rule input matches
- [Plots of the states of an evolution](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/Properties/PlotsOfStates.md) the `"FinalStatePlot"` and `"StatesPlotsList"` properties of an evolution object
- [Plots of the events of an evolution](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/WolframModelAndWolframModelEvolutionObject/Properties/PlotsOfEvents.md) the `"EventsStatesPlotsList"` property, which draws the events beside the states they produce
- [`WolframModelPlot`](https://github.com/maxitg/SetReplace) the earlier name of the paclet's hypergraph plot, taking the same arguments

### Writings

- [Wolfram Physics Project blog helpers](https://www.wolframcloud.com/obj/wolframphysics/BlogHelpers) the packages accompanying the project's writings, holding the layout and plotting helpers below
- [`FoliatedGraph`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) a graph with its vertices colored and sized by foliation slice
- [`GraphFoliationLayout`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) a graph laid out with its vertices arranged by foliation slice
- [`fixMultiwayVertices`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) the vertex shapes and sizes of a multiway graph whose vertices are framed graphics
- [`hypergraphVertexCoordinates`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) the vertex coordinates of a hypergraph, taken from its graph form
- [`scaleGraph`](https://www.wolframcloud.com/obj/wolframphysics/Blogs/FourthParadigm/HelperFunctions) the vertex sizes of a graph whose vertices are graphics, rescaled to keep their aspect ratios
- [`treeLayout`](https://www.wolframcloud.com/obj/wolframphysics/BlogHelpers) a graph laid out by the embedding of its tree form
- [`WolframModelRulePlot`](https://www.wolframcloud.com/obj/wolframphysics/WolframModelRulePlot) a Wolfram model rule plotted as an icon

- [`MetamathematicsStyleData`](https://www.wolframcloud.com/obj/wolframphysics/MetamathematicsStyleData), [`makePrettyEquations`](https://www.wolframcloud.com/obj/wolframphysics/BlogHelpers), …

### wolframphysics.org

- [`straightFoliationLines`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-05/FoliationLines.wl) graphics primitives for a grid of straight foliation lines with given densities and slopes
- [`foliationLines`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-08/regularCausalGraphPlot.wl) graphics primitives for straight foliation lines, with separate styles for the two families
- [`foliationGraphics`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-08/QM-foliations-01.wl) foliation line graphics for a graph and its vertex lists, with optional gaps between the slices
- [`arrayPlotFoliationLine`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-05/FoliationLines.wl) the polyline of a foliation line at a given layer through the array plot of a substitution system evolution
- [`caFoliationLines`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/CausalGraph-Foliation.wl) foliation lines of the light cone shape, for the causal graph of a cellular automaton
- [`regularCausalGraphPlot`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-08/regularCausalGraphPlot.wl) a regular grid-like causal graph of a given number of layers, drawn with straight foliation lines
- [`unorderedHypergraphPlot`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-07/AlternativeFormulations.wl) an unordered hypergraph drawn with transparent hyperedge arrows and shaded polygons
- [`newgraph`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-06/newgraph.wl) the vertex sizes of a graph whose vertices are graphics, rescaled to match their rasterized aspect ratios

### Wolfram Community

- [HyperPlot: on the generation of temporally coherent hypergraphs](https://community.wolfram.com/t/24285) a temporally coherent force-directed layout for animating hypergraph growth on top of SetReplace
- [Temporally coherent animations of the evolution of Wolfram Models](https://community.wolfram.com/t/20366) a method for plotting and animating the evolutions of spatial hypergraphs in three dimensions
- [Plotting the evolution of a Wolfram Model in 3-dimensions](https://community.wolfram.com/t/18490) a three-dimensional rendering of the states of a Wolfram model evolution
- [Multi perspectives, 3D graph embeddings and multispace](https://community.wolfram.com/t/16320) several graphs embedded together in three dimensions, their pairwise distances kept across projections
- [A PAOH hypergraph rendering for Wolfram Models in fundamental physics](https://community.wolfram.com/t/16118) hypergraph states drawn in the parallel aggregated ordered hypergraph style, vertices as rows and hyperedges as columns
- [Animating Wolfram Model evolutions in 3D](https://community.wolfram.com/t/22383) the states of an evolution animated in three dimensions, one frame per generation
- [Exploring 3D camera motions and multiway graph animation](https://community.wolfram.com/t/20310) camera paths through a three-dimensional scene, and multiway graphs animated along them
- [Visualisations of a multiway graph](https://community.wolfram.com/t/16434) layouts and renderings of a multiway graph, compared side by side
