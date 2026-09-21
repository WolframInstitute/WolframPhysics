---
Template: Guide
Name: GraphsAndNetworks
Title: Graphs and Networks
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/GraphsAndNetworks
Description: Graph construction and representation, vertices and edges, adjacency matrices, connectivity and components, paths and cycles, measures and centralities, communities and cuts, graph operations and subgraphs, tests and isomorphism, named graphs and lattices, and graph layout
Keywords: [graph, network, directed edge, undirected edge, edge tag, vertex, adjacency matrix, connectivity, connected component, path, cycle, traversal, topological sort, centrality, clustering coefficient, community, clique, cut, subgraph, graph operation, transitive reduction, isomorphism, grid graph, lattice, graph layout, layered graph]
RelatedGuides: [WolframPhysics, Visualization, GeodesicsAndDistance, Canonicalization, Hypergraphs]
Links: ["[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)", "[The Wolfram Function Repository](https://resources.wolframcloud.com/FunctionRepository/)", "[IGraphM on GitHub](https://github.com/szhorvat/IGraphM)"]
---

## Abstract

Every structure a Wolfram model produces is a graph: the states, the events,
the causal and branchial relations and the spatial hypergraph all take that
form, and one vocabulary reads them. Graphs are built from their edges and
carry properties on vertices and edges alike; adjacency and matrix
representations; connectivity and components; paths, cycles and traversal;
measures and centralities; communities, cliques and cuts; operations and
subgraphs; tests and isomorphism; named graphs and lattices; and the layouts
that place the vertices for drawing.

## Functions

### Graphs and Their Edges

- `Graph` (WL) a graph from a list of edges, the form every states graph, causal graph and branchial graph takes
- `DirectedEdge` (WL), `UndirectedEdge` (WL) a directed edge from one vertex to another and an undirected edge between two vertices, the edge of a causal graph and the edge of a branchial graph
- `EdgeTaggedGraph` (WL) a graph whose edges carry unique tags, so that parallel edges between the same two states stay distinct
- `UndirectedGraph` (WL) an undirected graph from a directed graph, with the direction of every edge forgotten
- `ReverseGraph` (WL) the reverse of a directed graph, with every edge turned around
- `TaggedNestGraph` (WL) the graph of successive applications of a function, each edge tagged by which successor of the state it is

- `IndexGraph` (WL), `SimpleGraph` (WL), `DirectedGraph` (WL), `AdjacencyGraph` (WL), `WeightedAdjacencyGraph` (WL), `IncidenceGraph` (WL), `RelationGraph` (WL), `NestGraph` (WL), `EdgeRules` (WL), `IndexEdgeTaggedGraph` (WL), `DirectedEdges` (WL), …

### Vertices, Edges and Their Properties

- `VertexList` (WL), `EdgeList` (WL) the vertices and the edges of a graph as lists
- `VertexCount` (WL), `EdgeCount` (WL) the number of vertices and the number of edges in a graph
- `EdgeTags` (WL) the tags of all the edges of a graph
- `VertexDegree` (WL) the number of edges meeting each vertex
- `VertexInDegree` (WL), `VertexOutDegree` (WL) the number of edges entering and leaving each vertex of a directed graph
- `IncidenceList` (WL) the edges incident to a vertex

- `AdjacencyList` (WL), `EdgeWeight` (WL), `VertexWeight` (WL), `AnnotationValue` (WL), `Annotate` (WL), `AnnotationRules` (WL), `VertexIndex` (WL), `EdgeIndex` (WL), `VertexCapacity` (WL), `EdgeCapacity` (WL), …

### Adjacency and Matrix Representations

- `AdjacencyMatrix` (WL) the vertex-vertex adjacency matrix of a graph
- `WeightedAdjacencyMatrix` (WL) the matrix of edge weights between the vertices of a graph
- `KirchhoffMatrix` (WL) the Laplacian matrix of a graph, its degrees less its adjacencies

- `IncidenceMatrix` (WL), `EdgeCycleMatrix` (WL), `DistanceMatrix` (WL), `GraphDistanceMatrix` (WL), …

### Connectivity and Components

- `WeaklyConnectedGraphComponents` (WL) the weakly connected components of a graph, each as a graph of its own
- `ConnectedGraphComponents` (WL) the connected components of a graph, following the direction of every edge
- `VertexOutComponent` (WL), `VertexInComponent` (WL) the vertices reachable from a vertex and the vertices that reach it, the future and the past of an event
- `VertexConnectivity` (WL), `EdgeConnectivity` (WL) the least number of vertices or edges whose removal disconnects a graph
- [`NonIsomorphicComponents`](https://resources.wolframcloud.com/FunctionRepository/resources/NonIsomorphicComponents/) (WFR) the components of a graph that are pairwise non-isomorphic

- `ConnectedComponents` (WL), `WeaklyConnectedComponents` (WL), `VertexComponent` (WL), `ConnectedGraphQ` (WL), `WeaklyConnectedGraphQ` (WL), `VertexOutComponentGraph` (WL), `VertexInComponentGraph` (WL), `KCoreComponents` (WL), `KVertexConnectedComponents` (WL), `KEdgeConnectedComponents` (WL), …

### Paths, Cycles and Traversal

- `FindShortestPath` (WL) the shortest path from one vertex to another, a geodesic in a spatial or causal graph
- `FindPath` (WL) a path between two vertices of a graph, or all the paths of a given length
- `FindCycle` (WL) a cycle in a graph, or all the cycles of a given length
- [`FindLongestPath`](https://resources.wolframcloud.com/FunctionRepository/resources/FindLongestPath/) (WFR) the longest path between two vertices of a directed acyclic graph, the longest chain through a causal graph
- `BreadthFirstScan` (WL), `DepthFirstScan` (WL) a traversal of a graph from a starting vertex, with a function run at each event of the scan
- `TopologicalSort` (WL) the vertices of an acyclic graph in an order consistent with every edge, one sequential updating order
- [`VertexStratify`](https://resources.wolframcloud.com/FunctionRepository/resources/VertexStratify/) (WFR) the vertices of a directed acyclic graph partitioned into time-ordered level sets

- `GraphDistance` (WL), `FindFundamentalCycles` (WL), `FindSpanningTree` (WL), `AcyclicGraphQ` (WL), `ShortestPathFunction` (WL), `FindHamiltonianPath` (WL), `FindEulerianCycle` (WL), `FindVertexIndependentPaths` (WL), `FindEdgeIndependentPaths` (WL), …

### Graph Measures and Centralities

- `VertexEccentricity` (WL) the greatest distance from a vertex to any other vertex of a graph
- `GraphDiameter` (WL) the greatest distance in a graph, the largest eccentricity over its vertices
- `GraphRadius` (WL) the minimum eccentricity over the vertices of a graph
- `MeanGraphDistance` (WL) the mean distance over all pairs of vertices
- [`GraphNeighborhoodVolumes`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphNeighborhoodVolumes/) (WFR) how many vertices lie within each distance of a vertex, the ball profile of a spatial, causal or branchial graph
- [`GraphCoordinationSequence`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphCoordinationSequence/) (WFR) the shell sizes of a symmetric graph, how many vertices sit at each distance from a vertex
- `DegreeCentrality` (WL) the degree of each vertex read as a centrality
- `BetweennessCentrality` (WL) how many shortest paths of a graph run through each vertex
- `ClosenessCentrality` (WL) the reciprocal of the mean distance from a vertex to the rest of the graph
- `EigenvectorCentrality` (WL) the centrality of a vertex weighted by the centrality of its neighbors
- `LocalClusteringCoefficient` (WL), `GlobalClusteringCoefficient` (WL) how often the neighbors of a vertex are adjacent to each other, per vertex and over the whole graph

- `PageRankCentrality` (WL), `KatzCentrality` (WL), `HITSCentrality` (WL), `EdgeBetweennessCentrality` (WL), `EccentricityCentrality` (WL), `RadialityCentrality` (WL), `StatusCentrality` (WL), `LinkRankCentrality` (WL), …
- `GraphDensity` (WL), `GraphCenter` (WL), `MeanClusteringCoefficient` (WL), `MeanNeighborDegree` (WL), `MeanDegreeConnectivity` (WL), `GraphAssortativity` (WL), `GraphReciprocity` (WL), `GraphLinkEfficiency` (WL), `GraphPeriphery` (WL), `GraphHub` (WL), …

### Communities, Cliques and Cuts

- `FindGraphCommunities` (WL) a partition of the vertices into densely connected communities
- `FindGraphPartition` (WL) a partition of the vertices into parts of nearly equal size with few edges between them
- `FindClique` (WL) a largest set of mutually adjacent vertices
- `FindVertexCut` (WL), `FindEdgeCut` (WL) a smallest set of vertices or edges whose removal disconnects two vertices
- `VertexChromaticNumber` (WL) the vertex chromatic number of a graph
- `FindPlanarColoring` (WL) a coloring of the faces of a planar graph with the fewest colors

- `CommunityGraphPlot` (WL), `FindKClique` (WL), `GraphTriangleCount` (WL), `FindIndependentVertexSet` (WL), `FindVertexCover` (WL), `FindIndependentEdgeSet` (WL), `FindEdgeCover` (WL), …

### Graph Operations and Subgraphs

- `Subgraph` (WL) the subgraph of a graph generated by a set of vertices
- [`SubgraphExpand`](https://resources.wolframcloud.com/FunctionRepository/resources/SubgraphExpand/) (WFR) a subgraph expanded inside the space of a graph, the neighborhood grown around a region
- `VertexAdd` (WL), `VertexDelete` (WL), `EdgeAdd` (WL), `EdgeDelete` (WL) a graph with a vertex or an edge added or deleted
- `VertexReplace` (WL) a graph with its vertices replaced according to a list of rules
- `VertexContract` (WL), `EdgeContract` (WL) a graph with a set of vertices or an edge contracted to a single vertex
- `TransitiveReductionGraph` (WL) the transitive reduction of a graph, keeping only the edges no longer path already implies
- `GraphUnion` (WL), `GraphIntersection` (WL), `GraphDifference` (WL) the union, the intersection and the difference of two graphs
- `PlanarFaceList` (WL) the faces of a planar embedding, the two-cells of its drawing
- [`GraphRemoveLooseEnds`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphRemoveLooseEnds/) (WFR) a graph with its low-valence vertices removed, trimming the loose ends of a multiway graph
- [`ToDirectedAcyclicGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/ToDirectedAcyclicGraph/) (WFR) an undirected graph converted to a cycle-free directed graph
- [`DirectedGraphTree`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation) an acyclic directed graph unfolded into a `Tree` from a root
- [`LocalComplement`](https://resources.wolframcloud.com/PacletRepository/resources/Wolfram/QuantumFramework/ref/LocalComplement.html) (Wolfram/QuantumFramework) the local complement of a graph or graph state at a vertex, the transformation a local Clifford operation induces on a graph state

- `NeighborhoodGraph` (WL), `TransitiveClosureGraph` (WL), `GraphProduct` (WL), `GraphComplement` (WL), `LineGraph` (WL), `GraphDisjointUnion` (WL), `GraphPower` (WL), `GraphJoin` (WL), `GraphSum` (WL), `DualPlanarGraph` (WL), …

### Graph Tests and Isomorphism

- `IsomorphicGraphQ` (WL) whether two graphs are the same up to a relabeling of their vertices
- `CanonicalGraph` (WL) a canonical form of a graph, the same for every graph isomorphic to it
- `FindGraphIsomorphism` (WL) an isomorphism that maps one graph to another by renaming vertices
- `FindSubgraphIsomorphism` (WL) a matching of one graph inside another, the mapping of a rule's left side onto a subgraph of a state
- `FindIsomorphicSubgraph` (WL) a subgraph of one graph isomorphic to another graph
- `IsomorphicSubgraphQ` (WL) whether a graph has a subgraph isomorphic to another graph
- `GraphAutomorphismGroup` (WL) the automorphism group of a graph, its symmetries as a permutation group
- `GraphQ` (WL) whether an expression is a valid graph object
- `DirectedGraphQ` (WL) whether every edge of a graph is directed
- `PlanarGraphQ` (WL) whether a graph can be drawn in the plane with no edges crossing
- `TreeGraphQ` (WL) whether a graph is a tree, connected and free of cycles
- [`PartialOrderGraphQ`](https://resources.wolframcloud.com/FunctionRepository/resources/PartialOrderGraphQ/) (WFR) whether a graph is a partial order, reflexive, antisymmetric and transitive
- [`TransitiveGraphQ`](https://resources.wolframcloud.com/FunctionRepository/resources/TransitiveGraphQ/) (WFR) whether the relation defined by the edges of a graph is transitive

- `VertexQ` (WL), `EdgeQ` (WL), `UndirectedGraphQ` (WL), `SimpleGraphQ` (WL), `MultigraphQ` (WL), `LoopFreeGraphQ` (WL), `EdgeTaggedGraphQ` (WL), `MixedGraphQ` (WL), `WeightedGraphQ` (WL), …
- `BipartiteGraphQ` (WL), `CompleteGraphQ` (WL), `PathGraphQ` (WL), `EmptyGraphQ` (WL), `EulerianGraphQ` (WL), `HamiltonianGraphQ` (WL), `VertexTransitiveGraphQ` (WL), `EdgeTransitiveGraphQ` (WL), …

### Named Graphs and Lattices

- `GridGraph` (WL) the graph of a rectangular grid in any number of dimensions, the flat test space of a dimension or curvature estimate
- `HypercubeGraph` (WL) the graph of the hypercube of a given dimension
- `TorusGraph` (WL) a grid graph of any dimension with the topology of a torus, a flat lattice without boundary
- `BuckyballGraph` (WL) the graph of a buckyball of a given order, a finite curved test space
- `RandomGraph` (WL) a pseudorandom graph with a given number of vertices and edges
- `GraphData` (WL) a named graph from the curated collection, with its known properties
- [`PopularNetwork`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl) (WolframInstitute/Infrageometry) a named real-world network dataset as a graph, with its description and source on request
- [`PopularNetworkNames`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/TDA.wl) (WolframInstitute/Infrageometry) the names of the network datasets `PopularNetwork` knows
- `CompleteGraph` (WL) the graph in which every pair of vertices is joined
- [`VertexCompleteGraph`](https://github.com/WolframInstitute/Multicomputation/blob/master/Multicomputation/Kernel/Graph.m) (Wolfram/Multicomputation) the complete graph on a list of vertices, the graph a branchial graph joins sibling states with
- `CycleGraph` (WL) the graph of a single cycle on a given number of vertices
- `CirculantGraph` (WL) a vertex-transitive graph joining each vertex to the ones at fixed cyclic offsets
- `NearestNeighborGraph` (WL) a graph joining each point of a set to its nearest neighbors
- `MeshConnectivityGraph` (WL) the graph of the points of a mesh connected by its lines
- `WattsStrogatzGraphDistribution` (WL) a distribution of small-world graphs, a ring lattice with a fraction of its edges rewired
- `SpatialGraphDistribution` (WL) a distribution of random spatial graphs on points sprinkled into a region

- `PathGraph` (WL), `StarGraph` (WL), `WheelGraph` (WL), `PetersenGraph` (WL), `DeBruijnGraph` (WL), `ButterflyGraph` (WL), `CayleyGraph` (WL), `TreeGraph` (WL), `KaryTree` (WL), `CompleteKaryTree` (WL), `PlanarGraph` (WL), …
- `UniformGraphDistribution` (WL), `DegreeGraphDistribution` (WL), `BarabasiAlbertGraphDistribution` (WL), `PriceGraphDistribution` (WL), `BernoulliGraphDistribution` (WL), `GraphPropertyDistribution` (WL), …

### Layout and Drawing

- `GraphLayout` (WL) the option choosing the layout used to draw a graph
- `GraphEmbedding` (WL) the coordinates of the vertices of a graph under an embedding such as the spring-electrical layout
- `VertexCoordinates` (WL) the option giving the coordinates at which the vertices of a graph are placed
- `VertexStyle` (WL), `EdgeStyle` (WL) the options giving the styles the vertices and the edges of a graph are drawn in
- `VertexSize` (WL) the option giving the size the vertices of a graph are drawn at
- `VertexLabels` (WL), `EdgeLabels` (WL) the options giving the labels drawn at the vertices and on the edges of a graph
- `VertexShapeFunction` (WL) the option giving the function that renders each vertex of a graph
- `LayeredGraphPlot` (WL), `LayeredGraphPlot3D` (WL) a layered plot of a graph in two or three dimensions, the layout of causal, multiway and branchial graphs
- [`DistanceLayeredGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/DistanceLayeredGraph/) (WFR) a graph rendered with its vertices at heights given by their distance from a root
- [`LayeredLayoutGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/LayeredLayoutGraph/) (WFR) a graph rendered with its vertices arranged in specified layers
- `HighlightGraph` (WL) a graph with chosen vertices, edges or subgraphs highlighted
- `GraphValuePlot` (WL) values over the vertices or edges of a graph plotted on it
- [`GraphFunctionPlot`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphFunctionPlot/) (WFR) the values of a function at the vertices of a graph

- `GraphPlot` (WL), `GraphPlot3D` (WL), `LayeredGraph` (WL), `LayeredGraph3D` (WL), `GraphLayers` (WL), `TreePlot` (WL), `TreeLayout` (WL), `Graph3D` (WL), …

### Wolfram Function Repository

- [`GeneralizedGridGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/GeneralizedGridGraph/) a grid graph with a chosen direction along each dimension, a lattice test space for dimension and curvature estimates
- [`HexagonalGridGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/HexagonalGridGraph/) the graph of a hexagonal grid
- [`TriangularGridGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TriangularGridGraph/) the graph of a triangular grid
- [`TriangularLatticeGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/TriangularLatticeGraph/) the graph of a triangular lattice
- [`GeneralizedTriangularGridGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/GeneralizedTriangularGridGraph/) a triangular grid graph of a chosen width and height
- [`HexagonalTorusGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/HexagonalTorusGraph/) a skew graph on a torus with a given number of hexagonal cells
- [`KleinBottleGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/KleinBottleGraph/) a grid graph in the shape of a Klein bottle
- [`GeodesicSphereGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/GeodesicSphereGraph/) the graph of a geodesic sphere of a given order, a space whose edges are of nearly equal length
- [`RegularHyperbolicTilingGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/RegularHyperbolicTilingGraph/) the graph of a regular hyperbolic tiling, a negatively curved test space
- [`HyperbolicTilingGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/HyperbolicTilingGraph/) example graphs of hyperbolic tilings, whose ball volumes grow exponentially
- [`CrossNodeGridGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/CrossNodeGridGraph/) a grid graph whose nodes are cross-linked
- [`GraphAntipodes`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphAntipodes/) a pair of vertices at maximum distance apart on a graph
- [`FoldGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/FoldGraph/) a graph built by folding a function along a list of arguments
- [`MergeTree`](https://resources.wolframcloud.com/FunctionRepository/resources/MergeTree/) a graph obtained by merging the subtrees of a tree
- [`WeightedSimpleGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/WeightedSimpleGraph/) the simple graph underlying a multigraph, with edge and vertex weights kept
- [`BidirectedGraph`](https://resources.wolframcloud.com/FunctionRepository/resources/BidirectedGraph/) a graph with a double edge in place of each edge
- [`EdgeMultiplicity`](https://resources.wolframcloud.com/FunctionRepository/resources/EdgeMultiplicity/) how many times each edge occurs in a multigraph
- [`DirectedGraphTransferMatrix`](https://resources.wolframcloud.com/FunctionRepository/resources/DirectedGraphTransferMatrix/) the partial probabilities of random walks on a directed graph
- [`WeakPathGraphs`](https://resources.wolframcloud.com/FunctionRepository/resources/WeakPathGraphs/) the path graphs between two vertices built without regard to edge direction
- [`GraphMinors`](https://resources.wolframcloud.com/FunctionRepository/resources/GraphMinors/) the graph minors of a graph

### IGraphM

- [IGraphM](https://github.com/szhorvat/IGraphM) a paclet wrapping the igraph library, with the graph invariants, motif counts and isomorphism algorithms the kernel leaves out
- [`IGUndirectedGraph`](https://github.com/szhorvat/IGraphM) a directed graph made undirected by a chosen convention, simple, all edges or mutual edges only
- [`IGMatchingNumber`](https://github.com/szhorvat/IGraphM) the matching number of a graph
- [`IGCliqueSizeCounts`](https://github.com/szhorvat/IGraphM) how many cliques of each size a graph has
- [`IGMaximalCliqueSizeCounts`](https://github.com/szhorvat/IGraphM) how many maximal cliques of each size a graph has
- [`IGMotifsTotalCount`](https://github.com/szhorvat/IGraphM) the number of weakly connected subgraphs of a given size, the motif census of a graph
- [`IGMotifsTotalCountEstimate`](https://github.com/szhorvat/IGraphM) the same motif count estimated from a sample of the vertices
- [`IGVF2IsomorphicQ`](https://github.com/szhorvat/IGraphM) whether two graphs are isomorphic, by the VF2 algorithm
- [`IGVF2FindSubisomorphisms`](https://github.com/szhorvat/IGraphM) the subisomorphisms from one graph into another, by the VF2 algorithm
