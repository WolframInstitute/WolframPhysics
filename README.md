# WolframPhysics

A Wolfram Language paclet that aggregates the functionality of the Wolfram
Physics Project into a single library: hypergraph rewriting, Wolfram models,
multiway systems, causal and branchial graphs, rulial space and
multicomputation. Each area is to ship with a reference implementation and
documentation that links back to the source material.

> Status: a guide, no code yet. The paclet loads and reports its version, and
> its documentation is one guide page that surveys and links every relevant
> function that already exists across the ecosystem: the built-in Wolfram
> Language, the Wolfram Function Repository, published paclets (SetReplace,
> WolframInstitute/Hypergraph, Wolfram/Multicomputation,
> WolframInstitute/HypergraphRewriteEngine), the wolframphysics.org site,
> Wolfram Community and the Wolfram Institute. Implementations are added a
> topic at a time from the research behind that guide.

## Install

A development build is published as a public resource in the Wolfram Cloud:
[WolframInstitute/WolframPhysics](https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/WolframPhysics).

```wolfram
PacletInstall[ResourceObject["https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/WolframPhysics"], ForceVersionInstall -> True]
Needs["WolframInstitute`WolframPhysics`"]
```

The documentation is read through the site at
[https://www.wolframcloud.com/obj/nikm/WolframPhysics](https://www.wolframcloud.com/obj/nikm/WolframPhysics),
a single-page browser over the deployed resource's pages, and it opens in the
Documentation Center after `Needs`.

## Goals

- Aggregate the functionality of the Wolfram Physics Project "from the wild"
  (the built-in language, the Function Repository, published paclets, the
  wolframphysics.org technical introduction and bulletins, Community posts,
  Institute research) into one place, under one context.
- Implement each concept in idiomatic Wolfram Language, mirroring the
  definition the Physics Project gives it.
- Document every public symbol thoroughly, with examples and references back
  to the source material.

## What's here

- `WolframPhysics/`: the paclet (context `` WolframInstitute`WolframPhysics` ``),
  with the umbrella loader in `WolframPhysics/Kernel/WolframPhysics.wl`, the
  paclet-wide parameters in `Kernel/GeneralParameters.wl`, tests under
  `WolframPhysics/Tests/`, and, once they are built, the documentation
  notebooks under `WolframPhysics/Documentation/English/`. Those notebooks are
  build artifacts and are not in git: `./build_docs.sh` writes them from the
  markdown, and every publish rebuilds them, so a fresh clone has none until
  you run the build (see [CONTRIBUTING.md](CONTRIBUTING.md), "Building the
  documentation").
- `docs/en/`: the documentation sources, the source of truth (Markdown built
  to notebooks): `Guides/WolframPhysics.md`, the root guide and the
  documentation home; `Tutorials/`; `ReferencePages/Symbols/` (empty until the
  paclet exports a symbol). `docs/ResourceDefinition.md` is the paclet
  resource's definition.
- `docs/research/`: the research reports the guide is written from, one
  `<source>.md` per source surveyed (the Function Repository, the Paclet
  Repository, GitHub, the Wolfram Institute, the built-in language).
- `docs/notes/`: the authoring notes that came out of probing the converter
  (argument naming, example state, math rendering), plus one design note per
  topic, `docs/notes/<Topic>.md`, once a topic is implemented.
- [GUIDE.md](GUIDE.md): the Wolfram Language style guide for the project and
  the documentation rules.
- [CONTRIBUTING.md](CONTRIBUTING.md): architecture, how to add a topic, how
  to run the tests, and how to build, check and publish the documentation.
- [AGENTS.md](AGENTS.md): guidance for AI agents and automated contributors,
  and the task-playbook skills in [`.agent-skills/`](.agent-skills/).

## License

MIT, see [LICENSE.md](LICENSE.md). The paclet declares the same in its
`PacletInfo.wl`.
