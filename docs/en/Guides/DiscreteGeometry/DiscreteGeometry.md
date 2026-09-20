---
Template: Guide
Name: DiscreteGeometry
Title: Discrete Geometry
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/DiscreteGeometry
Description: Dimension estimated from neighborhood growth, curvature on graphs and complexes, distance, geodesics and embeddings, gauge fields carried on a graph, and the synthetic axioms of a discrete geometry
Keywords: [discrete geometry, dimension, dimension estimator, volume growth, curvature, Ricci curvature, scalar curvature, distance, geodesic, ball, embedding, gauge field, connection, holonomy, synthetic geometry, incidence, simplicial complex]
RelatedGuides: [WolframPhysics, HypergraphDimension, DiscreteCurvature, GeodesicsAndDistance, GaugeFieldsOnGraphs, SyntheticGeometry]
Links: ["[The technical introduction to the Wolfram Physics Project](https://www.wolframphysics.org/technical-introduction/)", "[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)"]
---

## Abstract

Discrete geometry reads geometric structure off a graph or hypergraph, with no continuous space underneath it: the dimension estimated from how neighborhood volumes grow; the curvature of edges, vertices and complexes; distance, geodesics, balls and the embeddings that place a discrete space in a continuous one; connections, parallel transport and the gauge fields a graph carries; and the incidence, betweenness and axiomatic constructions of a synthetic geometry. Each area has its own guide.

## Functions

### [Dimension of a Hypergraph](paclet:WolframInstitute/WolframPhysics/guide/HypergraphDimension)

- [`GraphNeighborhoodVolumes`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphNeighborhoodVolumes/) (WFR) the volumes of successively larger neighborhoods around the vertices of a spatial, causal or branchial graph, the growth from which dimension is read
- [`WolframHausdorffDimension`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframHausdorffDimension/) (WFR) the Wolfram-Hausdorff dimension of a graph and its associated properties
- `FindFit` (WL) a power law fitted to a ball volume sequence, whose exponent is the dimension
- [`MyrheimMeyerDimension`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/MyrheimMeyerDimension.html) (WolframInstitute/PureMath) the Myrheim-Meyer dimension estimate of a finite poset, the dimension whose expected sprinkling ordering fraction matches the ordering fraction of the poset
- `KirchhoffMatrix` (WL) the graph Laplacian whose eigenvalue counting function gives the spectral dimension

### [Discrete Curvature](paclet:WolframInstitute/WolframPhysics/guide/DiscreteCurvature)

- [`OllivierRicciCurvature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/OllivierRicciCurvature.html) (WolframInstitute/PureMath) Ollivier's coarse Ricci curvature of two vertices, one minus the transport cost between their random walks over the graph distance
- [`FormanRicciCurvature`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FormanRicciCurvature.html) (WolframInstitute/PureMath) Forman's Ricci curvature of the edge joining two vertices, an exact integer read off degrees and incidences
- [`SectionalCurvatures`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) discrete sectional curvatures estimated over the edge neighborhoods of a graph
- [`IndexExpectationCurvature`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the index-expectation curvature of a complex, whose total over the vertices is the Euler characteristic
- [`WolframRicciCurvatureTensor`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframRicciCurvatureTensor/) (WFR) projections of the Wolfram-Ricci curvature tensor of a graph and its associated properties

### [Geodesics and Distance](paclet:WolframInstitute/WolframPhysics/guide/GeodesicsAndDistance)

- `GraphDistance` (WL), `GraphDistanceMatrix` (WL) the geodesic distance between two vertices, and between every pair of vertices
- `FindShortestPath` (WL) a geodesic, the shortest path between two vertices of a graph
- [`GeodesicIntervalGraph`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the metric interval between two vertices, the union of all their geodesics, as a directed acyclic graph
- `NeighborhoodGraph` (WL) the ball of a given radius around a vertex, as a graph
- `GraphEmbedding` (WL) the coordinates of the vertices of a graph under an embedding such as the spring-electrical layout

### [Gauge Fields on Graphs](paclet:WolframInstitute/WolframPhysics/guide/GaugeFieldsOnGraphs)

- [`GraphTangentBundle`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the tangent graph of a graph as a fibered graph, the fibre over a vertex holding the directions at it
- [`ParallelTransport`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Connections.wl) (WolframInstitute/InfraGaugeTheory) transport of a fibre point along a path in the base, following the horizontal lift
- [`InfraHolonomy`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the holonomy of a closed walk, the self-map it induces on the direction sphere over its base point
- [`InfraConnectionCurvature`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the holonomy angle around the boundary cycle of a face, the discrete curvature two-form
- [`FormDifferential`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) (WolframInstitute/Infrageometry) the exterior derivative of a discrete differential form

### [Synthetic Geometry](paclet:WolframInstitute/WolframPhysics/guide/SyntheticGeometry)

- `IncidenceMatrix` (WL) the vertex-edge incidence matrix of a graph, its points against its lines
- [`MetricInterval`](https://github.com/WolframInstitute/SyntheticInfrageometry) (WolframInstitute/SyntheticInfrageometry) the vertices lying between two others, the union of all their geodesics
- [`TarskiStructure`](https://github.com/WolframInstitute/SyntheticInfrageometry/blob/main/SyntheticInfrageometry/Kernel/Usage.wl) (WolframInstitute/SyntheticInfrageometry) a graph read as a model of Tarski's elementary geometry, with its distance, betweenness and equidistance primitives
- `GeometricScene` (WL) a scene of symbolic points, lines and circles together with the hypotheses relating them
- [`AbstractSimplicialComplex`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/AbstractSimplicialComplex.html) (WolframInstitute/PureMath) a downward-closed family of finite sets, a complex given by its maximal faces
