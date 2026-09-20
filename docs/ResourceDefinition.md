---
Template: Paclet
ResourceType: Paclet
Name: WolframInstitute/WolframPhysics
Context: WolframInstitute`WolframPhysics`
Paclet: WolframInstitute/WolframPhysics
Description: An aggregation of Wolfram Physics Project functionality
ContributedBy: Wolfram Institute
Keywords: [hypergraph, multiway, causal graph, branchial graph, rulial, Wolfram physics, multicomputation]
MainGuide: Documentation/English/Guides/WolframPhysics.nb
License: MIT
WolframVersion: 15.0+
Categories: [Graphs & Networks, Scientific and Medical Data & Computation]
SourceControlURL: https://github.com/WolframInstitute/WolframPhysics
Links: ["[The Wolfram Physics Project](https://www.wolframphysics.org/)", "[The Wolfram Institute](https://wolframinstitute.org/)"]
---

## Usage

The paclet gathers the functionality of the Wolfram Physics Project into one library: hypergraph rewriting and Wolfram models, multiway systems, causal and branchial graphs, rulial space and multicomputation. That functionality is spread today across the built-in language, the Wolfram Function Repository, published paclets and the project's own site, and this paclet is the one place it is collected.

The current release ships no code of its own. Its documentation is a tree of guide pages: a root over seven area guides, each over the topic pages of its area, which together survey the ecosystem: every relevant function that already exists, where it lives and what it does, each linked to its own page.

## Details & Options

- The tree covers hypergraph rewriting, multicomputation, discrete geometry, discrete spacetime, computational systems, metamathematics, categorical structures, graphs and networks, and visualization. A built-in such as [Graph]() keeps its (WL) marker wherever it appears. An entry in a thematic subsection carries its provenance tag: a Function Repository function such as [WolframModel](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) is marked (WFR), and a paclet function such as [HGEvolve](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/HypergraphRewriteEngine/Documentation/ref/HGEvolve.html) carries the name of its paclet. An entry under a per-source heading (WolframInstitute/Infrageometry, Wolfram Function Repository, …) carries no tag, because the heading names the source.
- No symbol is exported yet. Loading the paclet defines only `$WolframInstituteWolframPhysicsVersion`, an association giving the paclet's version, its Wolfram Language version and its author.
- Install it with <code>[PacletInstall]()[[ResourceObject]()["https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/WolframPhysics"]]</code>, then load it with `` Needs["WolframInstitute`WolframPhysics`"] ``.

## Author Notes

The documentation of this paclet, this definition included, was drafted with Anthropic's Claude and reviewed and edited by Nikolay Murzin at the Wolfram Institute. The guides survey functions that exist elsewhere in the ecosystem; every entry links to its source's own page, named by its tag or by the section it sits in.
