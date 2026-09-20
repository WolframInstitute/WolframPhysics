---
Template: Guide
Name: DiscreteCurvature
Title: Discrete Curvature
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/DiscreteCurvature
Description: Curvature on graphs and hypergraphs: Ollivier and Forman Ricci curvature of edges and vertices, scalar curvature fitted to ball and sphere growth, sectional curvature and Alexandrov comparison bounds, combinatorial curvature and Gauss-Bonnet on simplicial complexes, the curvature tensors and Einstein equations of the continuum, and the flat and curved spaces a curvature estimate is calibrated against
Keywords: [curvature, discrete curvature, Ricci curvature, Ollivier-Ricci curvature, Forman-Ricci curvature, scalar curvature, sectional curvature, curvature tensor, Einstein tensor, Einstein equations, Gauss-Bonnet, combinatorial curvature, index expectation curvature, volume growth, ball volume, shell area, Bishop-Gromov, comparison triangle, Alexandrov curvature bound, optimal transport, Wasserstein distance, hypergraph, spatial graph, simplicial complex, hyperbolic tiling]
RelatedGuides: [DiscreteGeometry, HypergraphDimension, GeodesicsAndDistance, GaugeFieldsOnGraphs, SyntheticGeometry, CausalSets, RelativityAndFoliations, WolframModels]
Links: ["[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)", "[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)"]
---

## Abstract

Curvature on a discrete space is read from the ways its neighborhoods depart from flat growth:
the Ricci curvature of an edge or a vertex, obtained by transporting the random walks at its
ends; the scalar curvature fitted to the growth of balls and spheres; sectional curvature and
the Alexandrov bounds that comparison triangles give; the combinatorial curvature of a
simplicial complex, whose total over the vertices is the Euler characteristic by Gauss-Bonnet;
the curvature tensors and Einstein equations of the continuum that these estimates approach;
and the flat, spherical and hyperbolic spaces an estimate is calibrated against.

## Functions

### Ricci Curvature of Edges and Vertices

- [`OllivierRicciCurvature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OllivierRicciCurvature.html) (WolframInstitute/PureMath) Ollivier's coarse Ricci curvature of two vertices, one minus the transport cost between their random walks over the graph distance
- [`FormanRicciCurvature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FormanRicciCurvature.html) (WolframInstitute/PureMath) Forman's Ricci curvature of the edge joining two vertices, an exact integer read off degrees and incidences
- [`VertexRicciCurvature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/VertexRicciCurvature.html) (WolframInstitute/PureMath) the discrete Ricci curvature at a vertex, the total of the Ollivier-Ricci curvatures of the edges at it
- [`GraphLazyRandomWalkMeasure`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GraphLazyRandomWalkMeasure.html) (WolframInstitute/PureMath) the one-step random walk measure at a vertex, the mass Ollivier curvature transports
- [`GraphWassersteinDistance`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GraphWassersteinDistance.html) (WolframInstitute/PureMath) the 1-Wasserstein distance between two measures in the graph metric, the transport cost curvature weighs against the distance
- [`WolframRicciCurvatureScalar`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureScalar/) (WFR) the Wolfram-Ricci scalar curvature of a graph and its associated properties
- `GraphDistance` (WL) the geodesic distance the transport cost is measured against
- `VertexDegree` (WL) the degree of a vertex, the count the combinatorial curvatures are built from

- `AdjacencyMatrix` (WL), `WeightedAdjacencyMatrix` (WL), `KirchhoffMatrix` (WL), `VertexCount` (WL), `EdgeCount` (WL), …

### Curvature from Ball and Sphere Growth

- [`LogDifferences`](https://resources.wolframcloud.com/FunctionRepository/resources/LogDifferences/) (WFR) the logarithmic differences of a volume sequence, the local growth exponent whose drift away from a constant is curvature
- [`LogDifferenceQuotients`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the quotients of successive log differences of a growth profile, where the curvature correction to pure power growth shows
- [`DimensionCurvatureFit`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) dimension and scalar curvature fitted to log-difference quotients by Bishop-Gromov regression
- [`VolumeGrowthObservables`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) dimension and scalar curvature fitted to the ball and sphere growth at a vertex, returned with the profiles, quotients and fit windows
- [`RaggedMeanAround`](https://resources.wolframcloud.com/FunctionRepository/resources/RaggedMeanAround/) (WFR) the mean with uncertainty of per-vertex curvature estimates whose profiles run to different lengths
- `LinearModelFit` (WL) the regression of the log-difference quotients on the radius, whose coefficients carry the curvature
- The ball and sphere volume profiles these fits run on are catalogued under the dimension of a hypergraph, where volume growth is the subject

- `FindFit` (WL), `Fit` (WL), `ListLogLogPlot` (WL), `ListLogPlot` (WL), `ListLinePlot` (WL), `Histogram` (WL), …

### Sectional Curvature and Comparison Bounds

- [`SectionalCurvatures`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) discrete sectional curvatures estimated over the edge neighborhoods of a graph
- [`InfraCurvature`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry) the local Alexandrov upper-curvature bound at a vertex, from the comparison triangles inside a ball around it
- [`TotalCurvature`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry) the total turning along a path in a graph, the discrete integral of its curvature
- [`TotalAbsoluteCurvature`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry) the total absolute turning along a path, the discrete Fenchel integral
- `GraphDiameter` (WL) the greatest distance in a graph, the default scale a local curvature bound is taken at
- `VertexEccentricity` (WL) the greatest distance from a vertex, the radius out to which its comparisons run

- [`ComparisonTriangle`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) (WolframInstitute/SyntheticInfrageometry), [`CATInequalityQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) (WolframInstitute/SyntheticInfrageometry), [`InfraAngle`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry), …

### Combinatorial Curvature and Gauss-Bonnet

- [`IndexExpectationCurvature`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the index-expectation curvature of a complex, whose total over the vertices is the Euler characteristic
- [`TessellationCurvature`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the combinatorial Gaussian curvature at a vertex of a regular or uniform tessellation, whose sign fixes the geometry
- [`ComplexCurvature`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the curvature of a simplicial complex, obtained by integrating its f-polynomial
- [`ComplexEulerCharacteristic`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the alternating sum of the simplex counts of a complex, the Gauss-Bonnet total of its curvature
- [`EulerCharacteristicComplex`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/EulerCharacteristicComplex.html) (WolframInstitute/PureMath) the Euler characteristic of an abstract simplicial complex
- [`AbstractSimplicialComplex`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AbstractSimplicialComplex.html) (WolframInstitute/PureMath) a simplicial complex as an explicit object, the domain a combinatorial curvature is summed over
- [`HypergraphComplex`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the downward-closed simplicial complex generated by the hyperedges of a hypergraph
- [`GraphComplex`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the clique complex of a graph up to a given dimension

- `PlanarFaceList` (WL), `MeshCells` (WL), `MeshRegion` (WL), …
- [`FVector`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FVector.html) (WolframInstitute/PureMath), [`SimplexLink`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SimplexLink.html) (WolframInstitute/PureMath), [`NerveComplex`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/NerveComplex.html) (WolframInstitute/PureMath), [`BettiNumbers`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/BettiNumbers.html) (WolframInstitute/PureMath), …

### Curvature Tensors and Einstein Equations

- [`WolframRicciCurvatureTensor`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureTensor/) (WFR) projections of the Wolfram-Ricci curvature tensor of a graph and its associated properties
- [`InfraConnectionCurvature`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the holonomy angle around a face at a given scale, the discrete curvature 2-form
- [`EinsteinTensor`](https://resources.wolframcloud.com/FunctionRepository/resources/EinsteinTensor/) (WFR) the Einstein curvature tensor of a manifold, the combination the field equations set against the stress-energy
- [`SolveEinsteinEquations`](https://resources.wolframcloud.com/FunctionRepository/resources/SolveEinsteinEquations/) (WFR) whether a stress-energy tensor field solves the Einstein field equations
- [`HGLensingPlot`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine) deflection angle against impact parameter in an evolution, with the general relativistic prediction overlaid
- [`HGRotationCurvePlot`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine) orbital velocity against radius in an evolution, with the Keplerian prediction overlaid

### Flat and Curved Comparison Spaces

- [`FlatManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/FlatManifoldToGraph/) (WFR) a random spatial graph sprinkled into a flat Riemannian manifold, the zero-curvature baseline an estimator is checked against
- [`IntrinsicCurvedManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/IntrinsicCurvedManifoldToGraph/) (WFR), [`ExtrinsicCurvedManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/ExtrinsicCurvedManifoldToGraph/) (WFR) random spatial graphs from a Riemannian manifold of given intrinsic or extrinsic curvature, the calibration spaces of known sign
- `RegionGaussianCurvature` (WL), `RegionMeanCurvature` (WL) the Gaussian and mean curvature of a continuum region, the values a discrete estimate should approach

### WolframInstitute/Infrageometry

- [WolframInstitute/Infrageometry](https://github.com/WolframInstitute/Infrageometry) a paclet of discrete differential geometry on graphs, hypergraphs and simplicial complexes, built around the growth and curvature observables of a substrate
- [`OllivierRicciCurvature`](https://github.com/WolframInstitute/Infrageometry) the Ollivier-Ricci curvature of every edge of a graph at once
- [`FormanRicciCurvature`](https://github.com/WolframInstitute/Infrageometry) the Forman-Ricci curvature of every edge of a graph at once
- [`ComplexCurvatures`](https://github.com/WolframInstitute/Infrageometry) the combinatorial curvature at every vertex of a complex, taken over its unit spheres
- [`LefschetzCurvature`](https://github.com/WolframInstitute/Infrageometry) the expectation of the fixed-point index at a vertex over the automorphism group of a complex
- [`SimplexUnitSphere`](https://github.com/WolframInstitute/Infrageometry) the unit sphere around a simplex, the link its curvature is computed from
- [`DiracHodgeMatrix`](https://github.com/WolframInstitute/Infrageometry) the Dirac operator of a simplicial complex
- [`HodgeLaplacianMatrix`](https://github.com/WolframInstitute/Infrageometry) the square of the Dirac operator, the Hodge Laplacian of the complex
- [`BettiVector`](https://github.com/WolframInstitute/Infrageometry) the number of holes of the complex in each dimension

- [`IndexMatrix`](https://github.com/WolframInstitute/Infrageometry), [`LefschetzNumber`](https://github.com/WolframInstitute/Infrageometry), [`WuCharacteristic`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl), [`HodgeMatrix`](https://github.com/WolframInstitute/Infrageometry), [`ComplexManifoldQ`](https://github.com/WolframInstitute/Infrageometry), …
