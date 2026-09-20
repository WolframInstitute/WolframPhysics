---
Template: Guide
Name: GaugeFieldsOnGraphs
Title: Gauge Fields on Graphs
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
URI: WolframInstitute/WolframPhysics/guide/GaugeFieldsOnGraphs
Description: Gauge structure on a graph: fibered graphs, their sections and the bundles they present, connections and horizontal lifts, parallel transport of points, directions and vectors, holonomy around a closed walk and the Wilson loop of its trace, the curvature two-form of a connection, discrete differential forms and cochains, vector fields and graph calculus, gauge groups and gauge transformations, and the smooth bundles and connections these constructions discretize
Keywords: [gauge theory, gauge field, gauge group, gauge transformation, connection, horizontal lift, parallel transport, holonomy, Wilson loop, fiber bundle, fibered graph, section, curvature two-form, flat connection, covariant derivative, differential form, cochain, coboundary, exterior derivative, vector field, displacement, frame, Levi-Civita connection, discrete gauge theory]
RelatedGuides: [DiscreteGeometry, DiscreteCurvature, GeodesicsAndDistance, HypergraphDimension, SyntheticGeometry]
Links: ["[InfraGaugeTheory on GitHub](https://github.com/WolframInstitute/InfraGaugeTheory)", "[Infrageometry on GitHub](https://github.com/WolframInstitute/Infrageometry)", "[InfraAnalysis on GitHub](https://github.com/WolframInstitute/InfraAnalysis)", "[The Wolfram Institute](https://wolframinstitute.org/)", "[Graphs & Networks guide](https://reference.wolfram.com/language/guide/GraphsAndNetworks.html)"]
---

## Abstract

A gauge field on a graph attaches a fibre to every vertex and a rule for carrying its
points along every edge, so that what is transported depends on the path taken: fibered
graphs, their sections and the bundles they present; connections, horizontal lifts and
the parallel transport of points, directions and vectors; the holonomy of a closed walk,
the Wilson loop its trace defines and the curvature two-form a connection assigns to
each face, which is the curvature of the connection rather than of the space; discrete
differential forms and cochains; vector fields and the calculus of differences and
integrals along a graph; and the groups whose elements a connection takes as values,
with the gauge transformations that change nothing observable.

## Functions

### Fibre Bundles and Sections

- [`GraphTangentBundle`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the tangent graph of a graph as a fibered graph, the fibre over a vertex holding the directions at it
- [`FiberBundleQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl) (WolframInstitute/InfraGaugeTheory) whether a total graph and its projection present the base as a fibre bundle
- `GraphProduct` (WL) the product of a base and a fibre, the total graph of a trivial bundle
- [`GraphCotangentBundle`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/CotangentBundle.wl) (WolframInstitute/InfraGaugeTheory) the cotangent graph of a graph, the dual fibration that carries its one-forms
- [`RandomSection`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Sections.wl) (WolframInstitute/InfraGaugeTheory) a section of a fibered graph, one fibre point chosen over each vertex of the base
- [`FiberBundle`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiberBundle.html) (WolframInstitute/PureMath) a fibre bundle over a smooth manifold, the object a fibered graph discretizes

### Connections and Parallel Transport

- [`ConnectionQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Connections.wl) (WolframInstitute/InfraGaugeTheory) whether an assignment of edge lifts is a connection on a fibered graph
- [`FindHorizontalLift`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Connections.wl) (WolframInstitute/InfraGaugeTheory) the horizontal lift of a path in the base to a path in the total graph
- [`ParallelTransport`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Connections.wl) (WolframInstitute/InfraGaugeTheory) transport of a fibre point along a path in the base, following the horizontal lift
- [`InfraParallelTransport`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the metric Levi-Civita transport of directions between two vertices at a given scale
- [`FindInfraLeviCivitaConnection`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the metric Levi-Civita connection on the direction-sphere fibration of a given radius
- `FindSpanningTree` (WL) a spanning tree of the base, the gauge in which transport along every tree edge is trivial
- [`ChristoffelSymbols`](https://resources.wolframcloud.com/FunctionRepository/resources/ChristoffelSymbols/) (WFR) the coefficients of the Levi-Civita connection of a Riemannian or pseudo-Riemannian metric

### Holonomy, Wilson Loops and Curvature

- [`InfraHolonomy`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the holonomy of a closed walk, the self-map it induces on the direction sphere over its base point
- [`HolonomyMatrix`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the holonomy of a loop as a permutation matrix
- `Tr` (WL) the trace of a holonomy matrix, the Wilson loop of the closed walk it came from
- `FindFundamentalCycles` (WL) a cycle basis of the base, the independent loops whose holonomies determine every other
- `FindCycle` (WL) a closed walk in the base to transport around
- [`FlatConnectionQ`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) whether a connection has trivial holonomy around every loop at every base point
- [`InfraConnectionCurvature`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the holonomy angle around the boundary cycle of a face, the discrete curvature two-form
- [`InfraHolonomyAngle`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the angle by which the holonomy of a closed walk rotates the directions it carries
- [`Coboundary`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) (WolframInstitute/Infrageometry) the coboundary of a cochain, the discrete exterior derivative whose square vanishes
- [`ConnectionMatrix`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the connection matrix of a simplicial complex
- [`DiracConnectionMatrix`](https://github.com/WolframInstitute/Infrageometry) (WolframInstitute/Infrageometry) the Dirac matrix of a connection on a simplicial complex
- `PlanarFaceList` (WL) the faces of a planar embedding, the two-cells on which a curvature two-form is evaluated

### Discrete Differential Forms and Cochains

- [`CochainValue`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) (WolframInstitute/Infrageometry) the value a cochain takes on an oriented simplex
- [`FormDifferential`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) (WolframInstitute/Infrageometry) the exterior derivative of a discrete differential form
- [`FormWedge`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) (WolframInstitute/Infrageometry) the wedge product of two discrete differential forms
- [`IntegrationMap`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) (WolframInstitute/Infrageometry) integration of a form over the simplices of a complex, the map from forms to cochains
- `IncidenceMatrix` (WL) the vertex-edge incidence matrix, the coboundary taking a function on vertices to its differences along edges
- `KirchhoffMatrix` (WL) the graph Laplacian, the Hodge Laplacian on functions of the trivial connection

- `TensorWedge` (WL), `HodgeDual` (WL), `LeviCivitaTensor` (WL), `Grad` (WL), `Curl` (WL), `Div` (WL), `Laplacian` (WL), …

### Vector Fields and Graph Calculus

- [`GraphVectorFields`](https://github.com/WolframInstitute/InfraAnalysis) (WolframInstitute/InfraAnalysis) every vector field on a graph
- [`GraphDerivative`](https://github.com/WolframInstitute/InfraAnalysis) (WolframInstitute/InfraAnalysis) a graph annotated with the derivative of a function on it
- [`GraphIntegrate`](https://github.com/WolframInstitute/InfraAnalysis) (WolframInstitute/InfraAnalysis) a graph annotated with the integral of a function on it
- [`InfraVectorTransport`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) transport of a tangent vector from one vertex to another along a connection
- [`InfraCovariantDerivative`](https://github.com/WolframInstitute/InfraGaugeTheory) (WolframInstitute/InfraGaugeTheory) the covariant derivative of a vector field, comparing its value at a vertex with what transport brings there
- [`DisplacementCommutator`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl) (WolframInstitute/Infrageometry) the commutator of two discrete vector fields
- [`FindKillingDisplacement`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl) (WolframInstitute/Infrageometry) a displacement acting as a discrete Killing field, moving the graph without changing its metric

### Gauge Groups and Gauge Transformations

- `PermutationGroup` (WL) a group of permutations of a fibre, the structure group of a discrete bundle
- `SymmetricGroup` (WL) the full permutation group of a finite fibre
- `GroupElements` (WL) the elements of a structure group, the values a connection may assign to an edge
- `MatrixExp` (WL) the group element obtained by exponentiating a Lie-algebra-valued potential
- `RotationMatrix` (WL) the rotation realizing the transport of a direction in an embedded frame
- `GraphAutomorphismGroup` (WL) the automorphisms of a graph, the relabelings every construction here must be invariant under

- `PermutationProduct` (WL), `PermutationCycles` (WL), `PermutationMatrix` (WL), `GroupOrbits` (WL), `GroupStabilizer` (WL), `GroupMultiplicationTable` (WL), `CayleyGraph` (WL), `FiniteGroupData` (WL), …

### WolframInstitute/InfraGaugeTheory

- [WolframInstitute/InfraGaugeTheory](https://github.com/WolframInstitute/InfraGaugeTheory) combinatorial gauge theory on graphs: fibered graphs, sections, connections, transport, holonomy and curvature
- [`RandomFiberedGraph`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl) a random total graph over a base, with fibres of a given size
- [`ReconstructBaseGraph`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl) the base graph recovered from a total graph and its projection
- [`LocallyTrivialQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl) whether a fibration is locally trivial around every vertex of the base
- [`TangentFiberedGraph`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/TangentBundle.wl) the tangent graph presented as a fibered graph over its base
- [`FindZeroSection`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Sections.wl) the zero section of a fibered graph
- [`FindCanonicalSection`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Sections.wl) the canonical section of a fibered graph
- [`RandomConnection`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Connections.wl) a random connection on a fibered graph
- [`FindHorizontalLeaf`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Connections.wl) the horizontal leaf through a point of the total graph
- [`HolonomyMatrices`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Connections.wl) the holonomy matrices of a family of loops
- [`VisualizeFiberedGraph`](https://github.com/WolframInstitute/InfraGaugeTheory) a fibered graph drawn with its fibres standing over the base
- [`FiberedGraphViewer`](https://github.com/WolframInstitute/InfraGaugeTheory) an interactive view of a fibered graph with its sections and connections

- [`InfraTautologicalSection`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/CotangentBundle.wl), [`InfraTautologicalOneForm`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/CotangentBundle.wl), [`SmoothSectionExtension`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Sections.wl), [`InfraCanonicalOneForm`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/LeviCivita.wl), [`CoordinatizeGraph`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Coordinatization.wl), [`FindInfraParallelFrame`](https://github.com/WolframInstitute/InfraGaugeTheory), [`InfraVectorTransportPlot`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/VectorTransport.wl), [`InfraCovariantDerivativePlot`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/VectorTransport.wl), [`IsomorphicFibersQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl), [`EdgeLiftingPropertyQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl), [`AtMostOneEdgeLiftQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/FiberedGraph.wl), [`SmoothSectionQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Sections.wl), [`CotangentFlip`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/CotangentBundle.wl), [`CotangentFlipQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/CotangentBundle.wl), [`InfraLeviCivitaDefect`](https://github.com/WolframInstitute/InfraGaugeTheory), [`RandomFiberedGraphViewer`](https://github.com/WolframInstitute/InfraGaugeTheory), …
- [`FindGraphAxes`](https://github.com/WolframInstitute/InfraGaugeTheory), [`FindGraphAxesThrough`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/GraphAxes.wl), [`FindDiametralPaths`](https://github.com/WolframInstitute/InfraGaugeTheory), [`FindLongestGeodesicsThrough`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/GraphAxes.wl), [`GeodesicSubgraph`](https://github.com/WolframInstitute/InfraGaugeTheory), [`FindSeparatingNet`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/NeighborhoodTiling.wl), [`SeparatingNetQ`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/NeighborhoodTiling.wl), [`FindNeighborhoodTiling`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/NeighborhoodTiling.wl), [`HausdorffDistance`](https://github.com/WolframInstitute/InfraGaugeTheory), [`FrechetDistance`](https://github.com/WolframInstitute/InfraGaugeTheory), [`MeanFrechetDistance`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Tools.wl), [`Separation`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Tools.wl), [`SymmetricRelationGraph`](https://github.com/WolframInstitute/InfraGaugeTheory/blob/main/InfraGaugeTheory/Kernel/Tools.wl), …

### WolframInstitute/Infrageometry

- [WolframInstitute/Infrageometry](https://github.com/WolframInstitute/Infrageometry) the geometry of graphs and simplicial complexes, from volume growth and curvature to complexes, forms and discrete vector fields
- [`FormValue`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) the value a differential form takes on a tangent fibre
- [`ZeroForm`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) the zero-form carrying a function on the vertices
- [`FormDegree`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) the degree of a discrete differential form
- [`CochainCup`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) the cup product of two cochains on a complex
- [`RestrictionMap`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl) the map carrying a cochain on the clique complex to a form on the tangent fibres
- [`DisplacementCompose`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl) the composition of two displacements
- [`DisplacementBracket`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl) the bracket of two displacements
- [`GradientDisplacement`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl) the displacement field of the gradient of a function on a graph
- [`DisplacementPlot`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl) a displacement drawn on the graph it moves

- [`OrderedCochainValue`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl), [`CochainDegree`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl), [`NaiveDifferential`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl), [`OrderedCochainCup`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl), [`CochainCupOne`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl), [`AntisymmetrizedCup`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/DifferentialForms.wl), …
- [`DisplacementMagnitude`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`RandomDisplacement`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`DisplacementScale`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`DisplacementNegative`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`DisplacementInverse`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`DisplacementSum`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`DisplacementReduce`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`DisplacementSingleValuedQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`DisplacementBijectionQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`DisplacementIsomorphismQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`ContinuousDisplacementQ`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`KillingDisplacementMagnitude`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`PolarDisplacements`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), [`TranslationDisplacement`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Displacements.wl), …
- [`DiracBlockMatrix`](https://github.com/WolframInstitute/Infrageometry), [`DiracColumns`](https://github.com/WolframInstitute/Infrageometry), [`DiracDualBlockMatrix`](https://github.com/WolframInstitute/Infrageometry), [`DiracDualColumns`](https://github.com/WolframInstitute/Infrageometry), [`DiracWalk`](https://github.com/WolframInstitute/Infrageometry), [`DiracMass`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl), [`DiracZetaFunction`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl), [`ConnectionZetaFunction`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl), [`LefschetzZetaFunction`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl), [`AnalyticTorsion`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl), [`IsospectralDeformation`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl), [`HodgeBlock`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`HodgePropagatorMatrix`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`GreenFunctionMatrix`](https://github.com/WolframInstitute/Infrageometry), [`GreenOperatorMatrix`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Infrageometry.wl), [`VertexAmplitudes`](https://github.com/WolframInstitute/Infrageometry), [`WaveEquationSolution`](https://github.com/WolframInstitute/Infrageometry), [`DiscreteWaveStep`](https://github.com/WolframInstitute/Infrageometry), [`WavePropagator`](https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/QuantumCalculus.wl), …

### WolframInstitute/InfraAnalysis

- [WolframInstitute/InfraAnalysis](https://github.com/WolframInstitute/InfraAnalysis) analysis on directed graphs: derivatives and integrals of functions on a graph, vector fields, and coordinatization
- [`GraphIntegral`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl) the integral of a function over a graph
- [`GraphFiniteDifference`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl) the finite difference of a function across an edge
- [`GraphDirectionalDifference`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl) the difference of a function along a direction
- [`GraphWeightedDerivation`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl) a weighted derivation on a graph, a difference operator obeying a Leibniz rule
- [`GraphVectorFieldEndomorphism`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl) the endomorphism a vector field induces on functions of the graph

- [`GraphVectorFieldQ`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl), [`GraphWeightedLeibnizQ`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl), [`GraphTwistedProduct`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl), [`DirectedPath`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl), [`LaminarDecomposition`](https://github.com/WolframInstitute/InfraAnalysis), [`RadialExpansion`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl), [`GraphBlowUp`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl), [`GraphContract`](https://github.com/WolframInstitute/InfraAnalysis/blob/main/InfraAnalysis/Kernel/Usage.wl), …

### WolframInstitute/PureMath

- [WolframInstitute/PureMath](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/guide/PureMath.html) a pure mathematics paclet whose geometry layer carries the smooth bundles, connections and exterior calculus that the graph constructions above discretize
- [`Connection`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Connection.html) the Levi-Civita connection of a metric manifold
- [`FiberBundleSection`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiberBundleSection.html) a section of a smooth fibre bundle
- [`GaugeConnection`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GaugeConnection.html) a gauge connection on a manifold, given by a Lie-algebra-valued potential one-form
- [`FieldStrength`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FieldStrength.html) the curvature two-form of a connection, the smooth counterpart of the holonomy angle around a face
- [`Holonomy`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/Holonomy.html) the holonomy of a connection around a closed loop
- [`CovariantDerivative`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/CovariantDerivative.html) the covariant derivative of a section with respect to a connection
- [`ExteriorCovariantDerivative`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ExteriorCovariantDerivative.html) the exterior covariant derivative of a bundle-valued differential form
- [`ElectromagneticConnection`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ElectromagneticConnection.html) the electromagnetic potential as an abelian gauge connection
- [`ExteriorDerivative`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ExteriorDerivative.html) the exterior derivative of a differential form

- [`VectorBundleQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/VectorBundleQ.html), [`FiberBundleSectionQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/FiberBundleSectionQ.html), [`GaugeConnectionQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/GaugeConnectionQ.html), [`SpinConnection`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SpinConnection.html), [`SpinConnectionQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/SpinConnectionQ.html), [`DifferentialFormQ`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/DifferentialFormQ.html), [`HodgeStar`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/HodgeStar.html), [`ElectromagneticTensor`](https://www.wolframcloud.com/obj/wolframinstitute/DeployedResources/Paclet/WolframInstitute/PureMath/Documentation/ref/ElectromagneticTensor.html), …
