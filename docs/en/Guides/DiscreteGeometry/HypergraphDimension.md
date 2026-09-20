---
Template: Guide
Name: HypergraphDimension
Title: Dimension of a Hypergraph
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/HypergraphDimension
Description: Neighborhood volumes and ball growth, the Wolfram-Hausdorff dimension read from volume scaling, fitting a growth exponent, Myrheim-Meyer estimators on causal sets, spectral dimension from the graph Laplacian, the dimension of a simplicial complex, and the test spaces of known dimension an estimator is calibrated against
Keywords: [dimension, hypergraph dimension, dimension estimator, Hausdorff dimension, Wolfram-Hausdorff dimension, ball growth, neighborhood volume, shell area, coordination sequence, volume scaling, log differences, growth exponent, curve fitting, Myrheim-Meyer dimension, ordering fraction, causal set dimension, spectral dimension, graph Laplacian, Weyl law, inductive dimension, simplicial complex, metric dimension, sprinkling, grid graph, hyperbolic tiling]
RelatedGuides: [DiscreteGeometry, DiscreteCurvature, GeodesicsAndDistance, GaugeFieldsOnGraphs, SyntheticGeometry, CausalSets, RelativityAndFoliations, WolframModels, Visualization]
Links: ["[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)", "[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)"]
---

## Abstract

The dimension of a hypergraph is read off the rate at which its balls grow: the number of
vertices within each distance of a vertex, the exponent in that growth, and the fit that
recovers it. Estimators of that exponent on a spatial, causal or branchial graph take several
forms: the Wolfram-Hausdorff dimension from neighborhood volumes; the Myrheim-Meyer dimension
of a causal set from its ordering fraction; the spectral dimension from the graph Laplacian;
and the inductive dimension of the simplicial complex a graph or hypergraph generates. Lattices,
sprinklings into flat and curved manifolds, and hyperbolic tilings are the test spaces of known
dimension against which an estimator is calibrated.

## Functions

### Neighborhood Volumes and Ball Growth

- `NeighborhoodGraph` (WL) the ball of a given radius around a vertex, as a graph
- [`GraphNeighborhoodVolumes`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphNeighborhoodVolumes/) (WFR) the volumes of successively larger neighborhoods around the vertices of a spatial, causal or branchial graph, the growth from which dimension is read
- [`HypergraphNeighborhoodVolumes`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphNeighborhoodVolumes/) (WFR) the volumes of successively larger neighborhoods around the vertices of a hypergraph, ignoring the directedness of its connections
- [`BallVolumes`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the ball volume profile of a vertex, out to its eccentricity
- [`ShellAreas`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the shell profile of a vertex, the radial difference of its ball volumes
- `VertexEccentricity` (WL) the greatest distance from a vertex, the radius at which its ball profile ends

- `GraphDistance` (WL), `GraphDistanceMatrix` (WL), `MeanGraphDistance` (WL), `VertexCount` (WL), `EdgeCount` (WL), `Nearest` (WL), `VertexDegree` (WL), `Subgraph` (WL), …

### Dimension from Volume Scaling

- [`LogDifferences`](https://resources.wolframcloud.com/FunctionRepository/resources/LogDifferences/) (WFR) the logarithmic differences of a list, the dimension estimate at each radius of a neighborhood volume sequence
- [`WolframHausdorffDimension`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframHausdorffDimension/) (WFR) the Wolfram-Hausdorff dimension of a graph and its associated properties
- [`VolumeGrowthObservables`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) dimension and scalar curvature fitted to the ball and sphere growth at a vertex, returned with the profiles, quotients and fit windows
- [`DimensionCurvatureFit`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) dimension and scalar curvature fitted to log-difference quotients by Bishop-Gromov regression

### Fitting a Growth Exponent

- `FindFit` (WL) a power law fitted to a ball volume sequence, whose exponent is the dimension
- `LinearModelFit` (WL) the regression of log volume on log radius, with the standard error of its slope
- `ListLogLogPlot` (WL) volume against radius on logarithmic axes, where a power law is a straight line
- [`RaggedMeanAround`](https://resources.wolframcloud.com/FunctionRepository/resources/RaggedMeanAround/) (WFR) the mean with uncertainty of corresponding elements of volume profiles of different lengths
- `MeanAround` (WL) the mean of the per-vertex dimension estimates with its uncertainty
- `Histogram` (WL) the distribution of dimension estimates over the vertices of a state

- `Fit` (WL), `NonlinearModelFit` (WL), `Around` (WL), `Differences` (WL), `Accumulate` (WL), `Interpolation` (WL), `FindLinearRecurrence` (WL), `ListLinePlot` (WL), `ListLogPlot` (WL), `ListPlot` (WL), `ListStepPlot` (WL), `Median` (WL), `StandardDeviation` (WL), `Quantile` (WL), …

### Myrheim-Meyer and Causal Dimension

- [`MyrheimMeyerDimension`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MyrheimMeyerDimension.html) (WolframInstitute/PureMath) the Myrheim-Meyer dimension estimate of a finite poset, the dimension whose expected sprinkling ordering fraction matches the ordering fraction of the poset
- [`MyrheimMeyerOrderingFraction`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MyrheimMeyerOrderingFraction.html) (WolframInstitute/PureMath) the expected ordering fraction of a Poisson sprinkling into an interval of Minkowski space of a given dimension
- [`CausalDensityDimension`](https://github.com/maxitg/SetReplace/blob/master/Documentation/SymbolsAndFunctions/UtilityFunctions/CausalDensityDimension.md) (SetReplace) the dimension of the region of a causal graph between two vertices, estimated by the Myrheim-Meyer algorithm

- [`SprinklingIntervalAbundance`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SprinklingIntervalAbundance.html) (WolframInstitute/PureMath), [`PosetOrderDimension`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/PosetOrderDimension.html) (WolframInstitute/PureMath), [`TwoDimensionalOrderQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/TwoDimensionalOrderQ.html) (WolframInstitute/PureMath), …

### Spectral Dimension

- `KirchhoffMatrix` (WL) the graph Laplacian whose eigenvalue counting function gives the spectral dimension
- `Eigenvalues` (WL) the Laplacian spectrum from which the heat kernel and the Weyl counting function are formed
- [`LaplacianSpectrum`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/LaplacianSpectrum.html) (WolframInstitute/PureMath) the exact eigenvalues of the Kirchhoff matrix of a simple undirected graph, listed with multiplicity
- [`GraphSpectrum`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GraphSpectrum.html) (WolframInstitute/PureMath) the exact eigenvalues of the adjacency matrix of a simple undirected graph
- [`AlgebraicConnectivity`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AlgebraicConnectivity.html) (WolframInstitute/PureMath) the second smallest Laplacian eigenvalue, the spectral gap that sets the diffusion scale

- `AdjacencyMatrix` (WL), `MatrixExp` (WL), `Eigenvectors` (WL), `SparseArray` (WL), …

### Dimension of a Simplicial Complex

- [`GraphComplex`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the clique complex of a graph up to a given dimension
- [`HypergraphComplex`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the downward-closed simplicial complex generated by the hyperedges of a hypergraph
- [`ComplexInductiveDimension`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry), [`ComplexDimensions`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the inductive dimension of a simplicial complex, the mean of the inductive dimensions of its vertices
- [`AbstractSimplicialComplex`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AbstractSimplicialComplex.html) (WolframInstitute/PureMath) a simplicial complex as an explicit object, the domain of the dimension counts
- [`FVector`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FVector.html) (WolframInstitute/PureMath) the number of simplices of each dimension in a complex
- `MeshCellCount` (WL) the number of mesh cells of each dimension
- `RegionDimension` (WL) the geometric dimension of a region, the continuum value a graph estimate approaches

- `MeshCells` (WL), `MeshRegion` (WL), `RegionEmbeddingDimension` (WL), `FindClique` (WL), …

### Test Spaces of Known Dimension

- `GridGraph` (WL) the grid graph of given side lengths, the flat comparison lattice of integer dimension
- `TorusGraph` (WL) the torus graph of given side lengths, a flat lattice without boundary
- `HypercubeGraph` (WL) the hypercube graph, whose ball growth saturates at its own dimension
- [`FlatManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/FlatManifoldToGraph/) (WFR) a random spatial graph from points sprinkled into a flat Riemannian manifold
- [`IntrinsicCurvedManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/IntrinsicCurvedManifoldToGraph/) (WFR), [`ExtrinsicCurvedManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/ExtrinsicCurvedManifoldToGraph/) (WFR) random spatial graphs from points sprinkled into a Riemannian manifold of given intrinsic or extrinsic curvature
- [`RegularHyperbolicTilingGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/RegularHyperbolicTilingGraph/) (WFR) the graph of a regular hyperbolic tiling, a negatively curved test space
- [`InfraSubstrate`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) a named example substrate graph at a small, medium or large size
- `SpatialGraphDistribution` (WL) a distribution of random spatial graphs on points sprinkled into a region
- `DiscretizeRegion` (WL) a mesh of a region, whose connectivity graph carries the region's dimension
- [`GromovHausdorffDistance`](https://resources.wolframcloud.com/FunctionRepository/resources/GromovHausdorffDistance/) (WFR) how far a test space sits from a graph in the metric sense, the calibration distance between them

- `MeshConnectivityGraph` (WL), `DelaunayMesh` (WL), `NearestNeighborGraph` (WL), `BuckyballGraph` (WL), `CayleyGraph` (WL), `CompleteKaryTree` (WL), `KaryTree` (WL), `RandomGraph` (WL), …

### WolframInstitute/Infrageometry

- [WolframInstitute/Infrageometry](https://github.com/WolframInstitute/Infrageometry) a paclet of discrete differential geometry on graphs, hypergraphs and simplicial complexes, built around ball growth and the observables fitted to it
- [`LogDifferenceQuotients`](https://github.com/WolframInstitute/Infrageometry) the successive log-difference quotients of a growth profile, the local dimension estimate at each radius
- [`CylinderVolumes`](https://github.com/WolframInstitute/Infrageometry), [`TubeVolumes`](https://github.com/WolframInstitute/Infrageometry), [`IntervalVolumes`](https://github.com/WolframInstitute/Infrageometry) the volumes of the cylinders between source and target vertices, of the tubes of growing radius around a vertex set, and of the metric interval between two vertices at increasing slack
- [`ComplexDimension`](https://github.com/WolframInstitute/Infrageometry), [`SimplexDimension`](https://github.com/WolframInstitute/Infrageometry) the maximal simplex dimension of a complex, and the dimension of a simplex, one less than the number of its vertices
- [`MetricDimension`](https://github.com/WolframInstitute/Infrageometry) the metric dimension of a graph, the size of a smallest resolving set
- [`BarycentricRefinement`](https://github.com/WolframInstitute/Infrageometry) each simplex of a complex or a graph refined, halving the scale at which growth is measured
- [`EnumerateComplexes`](https://github.com/WolframInstitute/Infrageometry) every simplicial complex on a vertex set up to a given dimension, the space an estimator is calibrated over
- [`RandomFlagComplex`](https://github.com/WolframInstitute/Infrageometry), [`RandomSimplicialComplex`](https://github.com/WolframInstitute/Infrageometry) the clique complex of an Erdos-Renyi random graph and a Linial-Meshulam random complex, each up to a given dimension
- [`BranchingSequenceTree`](https://github.com/WolframInstitute/Infrageometry) the rooted tree whose offspring count depends only on depth, a growth profile fixed by construction
- [`GraphTopology`](https://github.com/WolframInstitute/Infrageometry), [`BallTopology`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`ContinuousMapQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl) the star neighborhoods of a clique complex, the topology generated by the balls of a graph, and whether a map between two such topologies is continuous
- [`VietorisRipsFiltration`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl), [`CechFiltration`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl) the complexes a point cloud generates as its scale grows, the filtrations a dimension is read across
- [`PersistentHomology`](https://github.com/WolframInstitute/Infrageometry) the homology that survives across such a filtration, the holes a scale sweep leaves standing
- [`BettiTable`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl), [`BettiCurves`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl) the Betti numbers of a filtration at each scale, as a table and as curves against the filtration parameter
- [`PersistenceDiagram`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl) the birth and death scales of the homology classes of a filtration, plotted against each other

- [`SimplexCardinalities`](https://github.com/WolframInstitute/Infrageometry), [`SimplexCardinality`](https://github.com/WolframInstitute/Infrageometry), [`SimplexList`](https://github.com/WolframInstitute/Infrageometry), [`ComplexFacets`](https://github.com/WolframInstitute/Infrageometry), [`ComplexVertexList`](https://github.com/WolframInstitute/Infrageometry), [`SkeletonComplex`](https://github.com/WolframInstitute/Infrageometry), [`SimplexStar`](https://github.com/WolframInstitute/Infrageometry), [`SimplexCore`](https://github.com/WolframInstitute/Infrageometry), [`SimplexBoundary`](https://github.com/WolframInstitute/Infrageometry), [`ComplexClosure`](https://github.com/WolframInstitute/Infrageometry), [`ComplexJoin`](https://github.com/WolframInstitute/Infrageometry), [`GraphSuspension`](https://github.com/WolframInstitute/Infrageometry), [`FaceGraph`](https://github.com/WolframInstitute/Infrageometry), [`ComplexIncidenceMatrix`](https://github.com/WolframInstitute/Infrageometry), [`ComplexEulerCharacteristic`](https://github.com/WolframInstitute/Infrageometry), [`InfraSubstrateCode`](https://github.com/WolframInstitute/Infrageometry), [`SierpinskiGraph`](https://github.com/WolframInstitute/Infrageometry), [`BetheGraph`](https://github.com/WolframInstitute/Infrageometry), [`TessellationGraph`](https://github.com/WolframInstitute/Infrageometry), [`InflateGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/ExampleGraphs.wl), [`InflatedVertex`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/ExampleGraphs.wl), …
- [`IndexComplex`](https://github.com/WolframInstitute/Infrageometry), [`SimplicialComplexQ`](https://github.com/WolframInstitute/Infrageometry), [`ContractibleQ`](https://github.com/WolframInstitute/Infrageometry), [`SimplicialMap`](https://github.com/WolframInstitute/Infrageometry), [`DehnSommervilleQ`](https://github.com/WolframInstitute/Infrageometry), [`TopologicalClosure`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), …
- [`PersistenceIntervals`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl), [`VietorisRipsComplex`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl), [`VietorisRipsThresholdGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl), [`BallIntersectionBifiltration`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), [`BallIntersectionFiltrationValue`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), …
- [`ComplexGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`ComplexHypergraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`ComplexDual`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`ComplexBones`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`ComplexWalls`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`ComplexFrames`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`ComplexSphereQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`SimplexOrbit`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`SimplexMirror`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`SimplexStarSphere`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`SimplexCoreSphere`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`MatrixColumns`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`ComplexPolynomial`](https://github.com/WolframInstitute/Infrageometry), [`ComplexFermiCharacteristic`](https://github.com/WolframInstitute/Infrageometry), [`PoincarePolynomial`](https://github.com/WolframInstitute/Infrageometry), [`SimplexIndex`](https://github.com/WolframInstitute/Infrageometry), [`SimplexSign`](https://github.com/WolframInstitute/Infrageometry), [`SimplexWeight`](https://github.com/WolframInstitute/Infrageometry), [`FaceMatrix`](https://github.com/WolframInstitute/Infrageometry), [`SignMatrix`](https://github.com/WolframInstitute/Infrageometry), [`SimplicialData`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/SimplicialSet.wl), …

### Wolfram Function Repository

- [`HypergraphNeighborhoods`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphNeighborhoods/) all the neighborhoods of a hypergraph up to a given distance
- [`GraphCoordinationSequence`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphCoordinationSequence/) the number of vertices at each distance in a symmetric graph
- [`GeneralizedGridGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/GeneralizedGridGraph/) a grid graph with a chosen direction along each dimension
- [`HexagonalGridGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/HexagonalGridGraph/) the graph of a hexagonal grid, a flat two-dimensional lattice
- [`GeodesicSphereGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/GeodesicSphereGraph/) the graph of a geodesic sphere of a given order
- [`HyperbolicTilingGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/HyperbolicTilingGraph/) example graphs of hyperbolic tilings, whose ball volumes grow exponentially
- [`KleinBottleGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/KleinBottleGraph/) a grid graph in the shape of a Klein bottle
- [`ParametricManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/ParametricManifoldToGraph/) the graph associated with a parametric description of a manifold

- [`HyperbolicTiling`](https://resources.wolframcloud.com/FunctionRepository/resources/HyperbolicTiling/), [`ModularTessellation`](https://resources.wolframcloud.com/FunctionRepository/resources/ModularTessellation/), [`FindLinearRecurrenceEquations`](https://resources.wolframcloud.com/FunctionRepository/resources/FindLinearRecurrenceEquations/), [`FindNestedTransientRepeat`](https://resources.wolframcloud.com/FunctionRepository/resources/FindNestedTransientRepeat/), …

### WolframInstitute/HypergraphRewriteEngine

- [WolframInstitute/HypergraphRewriteEngine](https://github.com/WolframInstitute/HypergraphRewritingEngine) a native rewriting engine paclet, with hypergraph constructors of known topology and dimension analysis of the states an evolution produces
- [`HGHausdorffAnalysis`](https://github.com/WolframInstitute/HypergraphRewritingEngine) the local Hausdorff dimension at each vertex of a graph
- [`HGStateDimensionPlot`](https://github.com/WolframInstitute/HypergraphRewritingEngine) a hypergraph plotted with its vertices colored by local dimension
- [`HGDimensionFilmstrip`](https://github.com/WolframInstitute/HypergraphRewritingEngine) a grid of timestep union graphs colored by dimension, one per step of an evolution
- [`HGTimestepUnionPlot`](https://github.com/WolframInstitute/HypergraphRewritingEngine) the union graph at one timestep, colored by dimension
- [`HGRotationOrbitsPlot`](https://github.com/WolframInstitute/HypergraphRewritingEngine) orbital paths overlaid on a state graph, colored by velocity deviation
- [`HGToGraph`](https://github.com/WolframInstitute/HypergraphRewritingEngine) an initial condition or edge list converted to a graph, on which the estimators run
- [`HGGrid`](https://github.com/WolframInstitute/HypergraphRewritingEngine) a regular grid graph of given width and height
- [`HGSphere`](https://github.com/WolframInstitute/HypergraphRewritingEngine) a graph of spherical topology at a given resolution
- [`HGTorus`](https://github.com/WolframInstitute/HypergraphRewritingEngine) a graph of toroidal topology at a given resolution
- [`HGCylinder`](https://github.com/WolframInstitute/HypergraphRewritingEngine) a graph of cylindrical topology at a given resolution and height
- [`HGKleinBottle`](https://github.com/WolframInstitute/HypergraphRewritingEngine), [`HGMobiusStrip`](https://github.com/WolframInstitute/HypergraphRewritingEngine) graphs of Klein bottle and Mobius strip topology

- [`HGGridWithHoles`](https://github.com/WolframInstitute/HypergraphRewritingEngine), [`HGUniformRandom`](https://github.com/WolframInstitute/HypergraphRewritingEngine), [`HGPoissonDisk`](https://github.com/WolframInstitute/HypergraphRewritingEngine), …

### Wolfram Community

- [Comparing common dimension estimators for hypergraph](https://community.wolfram.com/t/17907) the Myrheim-Meyer, Wolfram-Hausdorff and mean-shortest-path dimension estimators compared on registry models
- [Analyzing Effects of Dimensional Perturbations in Wolfram Models](https://community.wolfram.com/t/17414) Myrheim-Meyer dimension estimates of causal diamonds and of subregions of a Wolfram model
- [Exploring the dimensionality of Wolfram Models](https://community.wolfram.com/t/16362) the dimensionality of a model against the number of steps it has run, from random walks on its graph
- [Weyl's law and The Wolfram Model of physics](https://community.wolfram.com/t/16380) Weyl's law, heat kernels and graph spectra on the graphs underlying a Wolfram model
- [Dimension Algorithm and Dimension Tensor in Wolfram Model](https://community.wolfram.com/t/17406) a dimension estimate from the growth rate of a geodesic tube, and the dimension tensor it defines
- [Local Dimension Measure and Rotation Groups in Wolfram Models](https://community.wolfram.com/t/16330) local and global dimension measures on a hypergraph, and the rotation groups they expose
- [Interpreting the distributions of dimensions in the Wolfram Models](https://community.wolfram.com/t/16355) the distribution of local dimension estimates across the vertices of a model
- [Dimension decay in the early universe](https://community.wolfram.com/t/18453) dimension estimates through the first steps of an evolution, across enumerated rules
- [Geometric constructions in discrete non-integer dimensional spaces](https://community.wolfram.com/t/17409) geometric constructions on graphs whose estimated dimension is not an integer
- [Identifying homogeneity in hypergraphs via approximate isomorphism](https://community.wolfram.com/t/19410) statistical uniformity of a hypergraph read from its lists of dimension estimates
- [Explorations of the hypergraph wm44586](https://community.wolfram.com/t/16424) local dimensionality and curvature measured across one registry model
