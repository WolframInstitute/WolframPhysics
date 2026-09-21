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
- [`HGGeodesicFilmstrip`](https://github.com/WolframInstitute/HypergraphRewritingEngine/blob/v0.0.1-alpha.6/paclet/Kernel/HypergraphRewriting.wl) (WolframInstitute/HypergraphRewriteEngine) the geodesic plots of an evolution, one list of plots per timestep
- [`DiscreteHypersurfaceGeodesic`](https://github.com/WolframInstitute/Gravitas/blob/main/Gravitas/Kernel/DiscreteHypersurfaceGeodesic.wl) (WolframInstitute/Gravitas) the geodesics of a discrete hypersurface, the paths a free particle follows on it
- [`FindLongestGeodesicsThrough`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/GraphAxes.wl) (WolframInstitute/InfraGaugeTheory) the longest geodesics passing through a given vertex
- [`MultiwayGeodesicGraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/TuringMachine/ref/MultiwayGeodesicGraph.html) (WolframInstitute/TuringMachine) the geodesic through a multiway equational graph, the shortest proof path between two expressions
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
- `EccentricityCentrality` (WL) the reciprocal of the eccentricity of each vertex, the centrality read from its greatest distance
- `ClosenessCentrality` (WL) the reciprocal of the mean distance from a vertex to the rest of the graph
- [`DominationNumber`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl) (WolframInstitute/Infrageometry) the size of a smallest dominating set, the fewest unit balls that reach every vertex

### Embedding and Coordinates

- `GraphEmbedding` (WL) the coordinates of the vertices of a graph under an embedding such as the spring-electrical layout
- `VertexCoordinates` (WL) the option giving the coordinates at which the vertices of a graph are placed
- [`HypergraphEmbedding`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/HypergraphEmbedding.html) (WolframInstitute/Hypergraph) coordinates for the vertices of a hypergraph, the embedding its plot is drawn from
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
- [`IntervalVolumes`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/VolumeGrowth.wl) the volume profile of the metric interval between two vertices at increasing slack
- [`CoordinatizeCausalGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Chains.wl) a time and a space coordinate for each event of a causal graph, read off the proper times of two observer chains
- [`ComplexEmbedding`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Mesh.wl) a numerical embedding of a simplicial complex in two or three dimensions by energy minimization

- [`BallHull`](https://github.com/WolframInstitute/Infrageometry), [`GeodesicEdgeOccupation`](https://github.com/WolframInstitute/Infrageometry), [`ComplexGeodesics`](https://github.com/WolframInstitute/Infrageometry), [`ComplexGeodesicFlow`](https://github.com/WolframInstitute/Infrageometry), [`ResistanceQ`](https://github.com/WolframInstitute/Infrageometry), …
- [`ResolvingSetQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl), [`BallCoverQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Coordinatization.wl), …
- [`TopologicalNeighborhood`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`TopologicalClosure`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`TopologicalInterior`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`TopologicalBoundary`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), [`TopologyGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Topology.wl), …
- [`GraphInterior`](https://github.com/WolframInstitute/Infrageometry), [`UniformLengthGraph`](https://github.com/WolframInstitute/Infrageometry), [`CenterGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl), [`BoundarylessGraph`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl), [`GraphExteriorBoundary`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Boundary.wl), …
- [`MiniballRadius`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), [`BallIntersectionComplex`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), [`CechComplex`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), [`BallIntersectionFiltration`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/BallIntersectionComplex.wl), …

### WolframInstitute/SyntheticInfrageometry

- [WolframInstitute/SyntheticInfrageometry](https://github.com/WolframInstitute/SyntheticInfrageometry) a paclet for geometry done on a graph itself, with points, segments, balls and shells realized at an infra-scale
- [`InfraDistance`](https://github.com/WolframInstitute/SyntheticInfrageometry) the distance between two points of a graph, each a vertex or a figure built on it
- [`FindClosestInfraPoint`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the vertices of a line at minimum graph distance from a point
- [`MetricInterval`](https://github.com/WolframInstitute/SyntheticInfrageometry) the vertices lying on some geodesic between two vertices
- [`PathSubgraph`](https://github.com/WolframInstitute/SyntheticInfrageometry) the union of all the shortest paths between two vertices
- [`GeodesicSprayGraph`](https://github.com/WolframInstitute/SyntheticInfrageometry) the breadth-first directed acyclic graph rooted at a vertex, the spray of geodesics leaving it
- [`GeodesicMultiplicity`](https://github.com/WolframInstitute/SyntheticInfrageometry) the number of distinct geodesics between two vertices
- [`GeodesicMultiplicityMatrix`](https://github.com/WolframInstitute/SyntheticInfrageometry) the distance matrix together with the number of geodesics for every pair
- [`GeodesicExtensionGraph`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the geodesic extensions of a segment beyond its far endpoint
- [`InfraSegment`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) a segment, the geodesic path between two points
- [`InfraLine`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) a line, the inextensible geodesic through two points
- [`InfraRay`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) a ray from a point through another, a geodesic that cannot be prolonged
- [`InfraLineStructure`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) a consistent system of geodesics, one line for each pair of points
- [`UniqueInfraSegmentQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) whether the geodesic between two vertices is unique, or whether the whole graph is geodetic
- [`LineCount`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the number of distinct canonical maximal geodesics of a graph
- [`InfraGeodesicQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) whether every window of a walk at a given scale is a shortest path
- [`ExtendInfraGeodesic`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) a seed walk continued as a geodesic at a chosen infra scale
- [`FindInfraPolylineSubdivision`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) a walk cut into the fewest geodesic legs whose knots are its vertices
- [`FindInfraCycle`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the shortest simple cycles of a graph, optionally within a length range
- [`WalkSingularities`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the self intersections, self tangencies and cusps of a walk
- [`FindInfraBall`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the closed ball of a given radius about a vertex
- [`FindInfraShell`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the metric shell at a given radius or band about a vertex
- [`InfraVolume`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the volume of a vertex set or a figure under a chosen measure
- [`InfraDensity`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the marginal of a figure on the vertices, its occupation counts
- [`FindBallHull`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the ball hull of a vertex set, the intersection of all closed balls containing it
- [`FindSegmentHull`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the geodesic convex hull of a vertex set, its closure under taking metric intervals
- [`MedianVertices`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the vertices minimizing the total distance to a given set
- [`BetweennessQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) whether a vertex lies on a geodesic between two others
- [`EquidistanceQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) whether two pairs of vertices are congruent, at equal distance
- [`FindInfraOsculatingShell`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the shells whose level set contains a window of a path, one per osculating center
- [`FindAdvancingInfraFront`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the foliation of a graph by a bouncing wavefront from an origin, stepping outward and reflecting where it cannot
- [`FindInfraOrthogonalFrame`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) frames of mutually perpendicular geodesic axes through a center
- [`OrthogonalCoordinates`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the integer displacement of a vertex along each axis of a frame through a center
- [`FindInfraSpanningAxes`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) mutually well separated longest geodesics across a graph with no fixed center
- [`EmbeddingClosest`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the elements of a bundle drawn closest to a Euclidean reference under the graph embedding
- [`FindEmbeddingClosestPath`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) an embedded curve snapped to a walk, sampled points mapped to nearest vertices and joined by geodesics
- [`FindInfraHomotopyRepresentative`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the shortest walks in the homotopy class of a walk or loop
- [`FindInfraHomotopyRepresentativeHomotopy`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the chain of elementary moves reducing a walk to a shortest representative
- [`InfraDeformationSize`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) the number of edges of a reference walk that a deformed walk replaces

- [`InfraBall`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`InfraBallQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`InfraShell`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`FindInfraShellCenter`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`InfraShellQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`BallHullQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`SegmentHullQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), …
- [`InfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`FindInfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`ExtendInfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`ConcatenateInfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`SelectInfraPath`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`InfraPathQ`](https://github.com/WolframInstitute/SyntheticInfrageometry), [`InfraImmersedQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`InfraGenericQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`InfraWalkCrossingQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), [`InfraReachableQ`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl), …

### Wolfram Function Repository

- [`HypergraphNeighborhoods`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphNeighborhoods/) the vertices of a hypergraph at each distance from a starting vertex, the balls its metric puts around it
- [`SubgraphExpand`](https://resources.wolframcloud.com/FunctionRepository/resources/SubgraphExpand/) a subgraph expanded inside the space of a graph, the neighborhood grown around a region
- [`GraphCoordinationSequence`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphCoordinationSequence/) the shell sizes of a symmetric graph, how many vertices sit at each geodesic distance from a vertex
- [`GraphRandomWalk`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphRandomWalk/) a discrete or continuous time random walk on a graph, the return probabilities a spectral dimension is read from
- [`HypergraphToGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/HypergraphToGraph/) an ordinary graph with the same distance matrix as a hypergraph, each hyperedge turned into a subgraph
- [`DistanceLayeredGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/DistanceLayeredGraph/) a graph rendered with its vertices at heights given by their distance from a root
- [`PairwiseMultidimensionalScaling`](https://resources.wolframcloud.com/FunctionRepository/resources/PairwiseMultidimensionalScaling/) pairwise distances embedded into a Cartesian space by multidimensional scaling
- [`SimpleCausalGraphCoordinates`](https://resources.wolframcloud.com/FunctionRepository/resources/SimpleCausalGraphCoordinates/) Cartesian-like coordinates for a simple two-dimensional causal graph
- [`MinSumPermutation`](https://resources.wolframcloud.com/FunctionRepository/resources/MinSumPermutation/) a permutation of rows to columns minimizing the sum of a distance matrix, used to pair geodesic endpoints between two neighborhoods
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
- [`MinSumPermutation`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-02.wl) the assignment helper that pairs the endpoint neighborhoods of a geodesic bundle
- [`RankedGeodesics`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) the antipodal geodesics of a neighborhood ranked by their distance from a reference geodesic
- [`FindShortestPathThoughVertex`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) the shortest path between two vertices constrained to pass through a third
- [`GraphLineDistance`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) the least distance from a vertex to any vertex of a line
- [`AllGeodesics`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) the vertex pairs at maximal distance, the longest geodesics of a graph
- [`GraphAntipodes`](https://www.wolframcloud.com/obj/wolframphysics/TechPaper-Programs/Section-04/Geodesics-01.wl) a pair of pseudo-diameter vertices of a graph, published on the Function Repository as [`GraphAntipodes`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphAntipodes/)
