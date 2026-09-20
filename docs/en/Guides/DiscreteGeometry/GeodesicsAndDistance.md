---
Template: Guide
Name: GeodesicsAndDistance
Title: Geodesics and Distance
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/GeodesicsAndDistance
Description: Graph distance and distance matrices, geodesics and metric intervals, neighborhoods, balls, shells and tubes, and the embeddings and coordinatizations that place a discrete space in a continuous one
Keywords: [distance, graph distance, distance matrix, geodesic, metric interval, geodesic congruence, eccentricity, diameter, radius, graph center, neighborhood, ball, shell, sphere, tube, cone, boundary, volume growth, resistance distance, embedding, coordinatization, resolving set, metric dimension, spatial hypergraph]
RelatedGuides: [DiscreteGeometry, HypergraphDimension, DiscreteCurvature, GaugeFieldsOnGraphs, SyntheticGeometry, GraphsAndNetworks, CausalSets, RelativityAndFoliations]
---

## Abstract

A hypergraph becomes a space as soon as its vertices are counted apart: the
distance along its connections and the diameter, radius and eccentricities that
distance defines; the geodesics that realize it and the intervals, axes and
congruences they form; the neighborhoods, balls, shells and tubes whose volumes
grow with radius; the resistance distance and the eccentricities a graph read as a
network carries; and the embeddings and coordinates that place such a space in
a continuous one.

## Functions

### Graph Distance

- `GraphDistance` (WL), `GraphDistanceMatrix` (WL) the geodesic distance between two vertices, and between every pair of vertices
- `VertexEccentricity` (WL) the greatest distance from a vertex to any other vertex of a graph
- `GraphDiameter` (WL), `GraphRadius` (WL) the largest and the smallest eccentricity over the vertices of a graph
- `MeanGraphDistance` (WL) the mean distance over all pairs of vertices
- `GraphCenter` (WL) the vertices of least eccentricity, the middle of a space in its own metric
- [`GraphWassersteinDistance`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GraphWassersteinDistance.html) (WolframInstitute/PureMath) the transport distance between two probability measures in the graph metric
- [`GromovHausdorffDistance`](https://resources.wolframcloud.com/FunctionRepository/resources/GromovHausdorffDistance/) (WFR) how far two finite metric spaces are from being isometric
- [An investigation on possible notions of physical distance in the WM](https://community.wolfram.com/t/19406) (Wolfram Community) notions of distance between the events of a Wolfram model, compared

- `DistanceMatrix` (WL), `Nearest` (WL), …
- [`HausdorffDistance`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory), [`FrechetDistance`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory), …

### Geodesics

- `FindShortestPath` (WL) a geodesic, the shortest path between two vertices of a graph
- [`GeodesicIntervalGraph`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the metric interval between two vertices, the union of all their geodesics, as a directed acyclic graph
- [`FindInfraGeodesic`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry) the geodesics grown from a point of a graph at a given infra-scale
- [`FindGraphAxes`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) a set of maximally separated long geodesics, the axes of a graph
- [`FindDiametralPaths`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the paths of a graph whose length comes close to its diameter
- [`GeodesicSubgraph`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the geodesics joining given pairs of vertices, with an optional thickness around them
- [`HGGeodesicPlot`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine) geodesic paths drawn over a state of an evolution
- [Geodesic congruence in casual graphs](https://community.wolfram.com/t/25007) (Wolfram Community) congruences of neighboring geodesics in the causal graph of a Wolfram model

### Neighborhoods, Balls and Tubes

- `NeighborhoodGraph` (WL) the geodesic ball around a vertex, every vertex within a given distance of it as a graph
- [`GraphNeighborhoodVolumes`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphNeighborhoodVolumes/) (WFR) how many vertices lie within each distance of a vertex, the ball profile the graph metric produces
- [`HypergraphNeighborhoodVolumes`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphNeighborhoodVolumes/) (WFR) the same ball profile on a hypergraph, whose distance forgets the direction of its hyperedges
- [`BallVolumes`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the ball volume profile of a vertex, out to its eccentricity
- [`ShellAreas`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the area of each shell around a vertex, the radial difference of its ball volumes
- [`TubeVolumes`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the volume of the tube of growing radius around a vertex set or a metric interval
- [`GraphBoundary`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the inner boundary of a vertex set, the vertices an edge escapes from
- [`ConeGraph`](https://github.com/WolframInstitute/InfraAnalysis) (WolframInstitute/InfraAnalysis) a graph with a cone vertex joined to all of its vertices
- [`RadialExpansion`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl) (WolframInstitute/InfraAnalysis) a graph grown by appending concentric rings of vertices outside its sources

### Resistance and Eccentricity

- [`EffectiveResistance`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the resistance distance between two vertices, the graph read as a network of unit resistors
- `KirchhoffMatrix` (WL) the graph Laplacian whose pseudoinverse carries those resistances
- `PseudoInverse` (WL) the pseudoinverse of that Laplacian, from which the resistance between any pair of vertices is read
- [`ResistanceCoordinates`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl) (WolframInstitute/Infrageometry) coordinates for the vertices from a resistance-matching spectral embedding
- [`GraphEccentricities`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl) (WolframInstitute/Infrageometry) the eccentricity of every vertex at once, the profile a radius and a diameter are read from
- [`RelativeEccentricity`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl) (WolframInstitute/Infrageometry) the eccentricity of a vertex measured against a chosen subset rather than the whole graph
- [`DominationNumber`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl) (WolframInstitute/Infrageometry) the size of a smallest dominating set, the fewest unit balls that reach every vertex

### Embedding and Coordinates

- `GraphEmbedding` (WL) the coordinates of the vertices of a graph under an embedding such as the spring-electrical layout
- [`UniformLengthEmbedding`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) an embedding of a graph in which every edge is a unit segment
- [`RadarCoordinates`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the distances from a vertex to a chosen set of landmarks, its coordinates in the graph metric
- [`MetricDimension`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the size of a smallest resolving set, the number of landmarks a coordinate needs
- [`CoordinatizeGraph`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Coordinatization.wl) (WolframInstitute/InfraGaugeTheory) coordinates for the vertices of a directed graph built from its chains

- `NearestNeighborGraph` (WL), `DelaunayMesh` (WL), `MeshConnectivityGraph` (WL), `DiscretizeRegion` (WL), `SpatialGraphDistribution` (WL), …
- [`HGSphere`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine), [`HGTorus`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine), [`HGCylinder`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine), [`HGKleinBottle`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine), [`HGMobiusStrip`](https://github.com/WolframInstitute/HypergraphRewritingEngine) (WolframInstitute/HypergraphRewriteEngine), …

### WolframInstitute/Infrageometry

- [WolframInstitute/Infrageometry](https://github.com/WolframInstitute/Infrageometry) a paclet for the metric geometry of graphs and simplicial complexes, from ball growth to coordinatization
- [`GeodesicOccupation`](https://github.com/WolframInstitute/Infrageometry) the number of geodesics running through each vertex of a geodesic graph
- [`ConnesDistance`](https://github.com/WolframInstitute/Infrageometry) the spectral distance matrix between the vertices of a complex
- [`FindResolvingSet`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl) a smallest set of landmarks whose distances tell every vertex apart
- [`FindBallCover`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl) a smallest set of balls of a given radius covering a graph
- [`InfraSubstrate`](https://github.com/WolframInstitute/Infrageometry) a named example substrate graph at a small, medium or large size

- [`BallHull`](https://github.com/WolframInstitute/Infrageometry), [`GeodesicEdgeOccupation`](https://github.com/WolframInstitute/Infrageometry), [`ComplexGeodesics`](https://github.com/WolframInstitute/Infrageometry), [`ComplexGeodesicFlow`](https://github.com/WolframInstitute/Infrageometry), [`ResistanceQ`](https://github.com/WolframInstitute/Infrageometry), …
- [`ResolvingSetQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl), [`BallCoverQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl), …
- [`TopologicalNeighborhood`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`TopologicalClosure`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`TopologicalInterior`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`TopologicalBoundary`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`TopologyGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), …
- [`GraphInterior`](https://github.com/WolframInstitute/Infrageometry), [`UniformLengthGraph`](https://github.com/WolframInstitute/Infrageometry), [`CenterGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl), [`BoundarylessGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl), [`GraphExteriorBoundary`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl), …
- [`MiniballRadius`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), [`BallIntersectionComplex`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), [`CechComplex`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), [`BallIntersectionFiltration`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), …

### WolframInstitute/SyntheticInfrageometry

- [WolframInstitute/SyntheticInfrageometry](https://github.com/WolframInstitute/SyntheticInfrageometry) a paclet for geometry done on a graph itself, with points, segments, balls and shells realized at an infra-scale
- [`InfraDistance`](https://github.com/WolframInstitute/SyntheticInfrageometry) the distance between two points of a graph, each a vertex or a figure built on it
- [`MetricInterval`](https://github.com/WolframInstitute/SyntheticInfrageometry) the vertices lying on some geodesic between two vertices
- [`PathSubgraph`](https://github.com/WolframInstitute/SyntheticInfrageometry) the union of all the shortest paths between two vertices
- [`GeodesicSprayGraph`](https://github.com/WolframInstitute/SyntheticInfrageometry) the breadth-first directed acyclic graph rooted at a vertex, the spray of geodesics leaving it
- [`GeodesicMultiplicity`](https://github.com/WolframInstitute/SyntheticInfrageometry) the number of distinct geodesics between two vertices
- [`GeodesicMultiplicityMatrix`](https://github.com/WolframInstitute/SyntheticInfrageometry) the distance matrix together with the number of geodesics for every pair
- [`GeodesicExtensionGraph`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the geodesic extensions of a segment beyond its far endpoint
- [`FindInfraBall`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the closed ball of a given radius about a vertex
- [`FindInfraShell`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the metric shell at a given radius or band about a vertex
- [`InfraVolume`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the volume of a vertex set or a figure under a chosen measure
- [`InfraDensity`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the marginal of a figure on the vertices, its occupation counts

- [`InfraBall`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`InfraBallQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`InfraShell`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`FindInfraShellCenter`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), …
- [`InfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`FindInfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`ExtendInfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`ConcatenateInfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`SelectInfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`InfraPathQ`](https://github.com/WolframInstitute/SyntheticInfrageometry), …

### Wolfram Function Repository

- [`HypergraphNeighborhoods`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphNeighborhoods/) the vertices of a hypergraph at each distance from a starting vertex, the balls its metric puts around it
- [`GraphCoordinationSequence`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphCoordinationSequence/) the shell sizes of a symmetric graph, how many vertices sit at each geodesic distance from a vertex
- [`FlatManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/FlatManifoldToGraph/) a random spatial graph sprinkled into a flat Riemannian manifold, whose graph distance approximates the manifold metric
- [`IntrinsicCurvedManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/IntrinsicCurvedManifoldToGraph/), [`ExtrinsicCurvedManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/ExtrinsicCurvedManifoldToGraph/) random spatial graphs from points sprinkled into a Riemannian manifold of given intrinsic or extrinsic curvature
- [`ParametricManifoldToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/ParametricManifoldToGraph/) the graph of a parametrically described manifold, the discrete space its geodesics are measured on
- [`GraphReconstructedSurface`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphReconstructedSurface/) a graph rendered in three dimensions with an approximate surface through it
- [`GraphicsMetricGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphicsMetricGraph/) a mesh representing a metric read off a graphic
- [`GeodesicSphereGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/GeodesicSphereGraph/) the graph of a geodesic sphere of a given order, a space whose edges are of nearly equal length
- [`NonConvexHullMesh`](https://resources.wolframcloud.com/FunctionRepository/resources/NonConvexHullMesh/) a mesh through a set of points that leaves out the exterior concave areas and the holes

### wolframphysics.org

- [`Geodesics`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) a graph drawn with the shortest paths between given vertex pairs highlighted
- [`GeodesicsAll`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-02.wl) the union of all the shortest paths between given vertex pairs, highlighted
- [`ShortestPathsVertices`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-02.wl) all the vertices lying on some shortest path between two vertices
- [`GeodesicsBundle`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-02.wl) a bundle of geodesics drawn between the neighborhoods of two endpoints
- [`RankedGeodesics`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) the antipodal geodesics of a neighborhood ranked by their distance from a reference geodesic
- [`FindShortestPathThoughVertex`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) the shortest path between two vertices constrained to pass through a third
- [`GraphLineDistance`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) the least distance from a vertex to any vertex of a line
- [`AllGeodesics`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) the vertex pairs at maximal distance, the longest geodesics of a graph
- [`GraphAntipodes`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) a pair of pseudo-diameter vertices of a graph
