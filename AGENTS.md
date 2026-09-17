# AGENTS.md

Guidance for any AI agent or automated contributor working in this repository.
This file is tool-neutral: it is plain Markdown that any agent (or human) can
read. It is not specific to one vendor's CLI.

## What this repo is

`WolframInstitute/WolframPhysics` is a Wolfram Language paclet, context
`` WolframInstitute`WolframPhysics` ``, that aggregates the functionality of the
Wolfram Physics Project (hypergraph rewriting, Wolfram models, multiway systems,
causal and branchial graphs, rulial space, multicomputation) into one library.
The paclet is `WolframPhysics/` at the repository root: `PacletInfo.wl`, the
kernel under `WolframPhysics/Kernel/` (one StructuredPackageFormat umbrella,
`WolframPhysics.wl`, whose `PackageInitialize` reads every `.wl` file beside and
below it), tests under `WolframPhysics/Tests/`, and, once a build has written them, the
documentation notebooks under `WolframPhysics/Documentation/English/` and the
resource definition `WolframPhysics/ResourceDefinition.nb` (build artifacts, not
in git: see "The documentation layout").

Today the paclet ships no functions. Its only export is
`$WolframInstituteWolframPhysicsVersion`, and its documentation is a single
guide page, `docs/en/Guides/WolframPhysics.md`, that surveys and links every
relevant function that already exists across the ecosystem: the built-in
language, the Wolfram Function Repository, published paclets (SetReplace,
WolframInstitute/Hypergraph, Wolfram/Multicomputation,
WolframInstitute/HypergraphRewriteEngine), the wolframphysics.org site, Wolfram
Community and the Wolfram Institute. The research behind that guide lives in
`docs/research/<source>.md`, one report per source surveyed, named in
lowercase with hyphens (`built-in-wolfram-language.md`,
`paclet-repository-and-paclets.md`). Implementations come later, a topic at a time, and
each one is a kernel file under `WolframPhysics/Kernel/` with a matching test
and a reference page.

Start with [README.md](README.md) for an overview, [CONTRIBUTING.md](CONTRIBUTING.md)
for the layout, the tests, the documentation build and the publishing workflow,
and [GUIDE.md](GUIDE.md) for the Wolfram Language style guide and the
documentation rules.

## The documentation layout

Documentation is authored as literate markdown and built into notebooks. The
markdown is the source of truth; the notebooks are build artifacts, ignored by
git, written by `./build_docs.sh` and rebuilt by every publish (see
[CONTRIBUTING.md](CONTRIBUTING.md), "Building the documentation"). Every agent
uses exactly these names:

```
docs/en/Guides/<Name>.md                     Template: Guide      (WolframPhysics.md, the root guide)
docs/en/Tutorials/<Name>.md                  Template: TechNote
docs/en/ReferencePages/Symbols/<Name>.md     Template: Symbol     (empty until the paclet exports a symbol)
docs/ResourceDefinition.md                   Template: Paclet     (the resource definition)
docs/research/<source>.md                    research reports, one per source surveyed, lowercase with hyphens
docs/notes/                                  authoring notes: doc-arg-naming.md, doc-example-state.md,
                                             doc-math-rendering.md, plus one design note per topic,
                                             docs/notes/<Topic>.md, once a topic is implemented
WolframPhysics/Documentation/English/Guides/<Name>.nb
WolframPhysics/Documentation/English/Tutorials/<Name>.nb               BUILT notebooks, flat by basename,
WolframPhysics/Documentation/English/ReferencePages/Symbols/<Name>.nb  not in git; never hand-edited
WolframPhysics/ResourceDefinition.nb                                   built from docs/ResourceDefinition.md
```

Frontmatter conventions: `Name` equals the file basename equals the URI tail
(CamelCase, no spaces); guides and tutorials also carry a `Title` (words with
spaces; the root guide is `Name: WolframPhysics`, `Title: Wolfram Physics`);
`` Context: WolframInstitute`WolframPhysics` ``;
`Paclet: WolframInstitute/WolframPhysics`;
`URI: WolframInstitute/WolframPhysics/{guide|ref|tutorial}/<Name>`. The build
writes `<Name>.nb` and fails loudly when `Name` and the basename disagree. The
page conventions of the converter itself are in
`tools/MarkdownToNotebook/docs/doc-pages.md` and in `examples.md` beside it.

The scripts that drive this (all under `scripts/`, each with a header comment
that states its usage, its knobs and its exit status):

| Script | Does |
| --- | --- |
| `build_notebooks.wls` | `docs/en/**/*.md` and `docs/ResourceDefinition.md` to the built notebooks, evaluating examples against the paclet in `WolframPhysics/`; tutorials thread state (`"EvaluateSeparator" -> None`); incremental via a manifest; `structure` mode writes input-only cells to `docs/en/.generated/` (gitignored), never to the shipping tree. `./build_docs.sh` at the root wraps it. |
| `lint_docs.wls` | the documentation lint over `docs/en`, `docs/notes`, `docs/research`, `.agent-skills`, `docs/ResourceDefinition.md` and the top-level `*.md` files |
| `run_doc_examples.wls` | evaluates every page's examples under the built page's state-reset semantics (tutorials thread state), loading this paclet |
| `docbuild.wls` | DocumentationBuild of the built notebooks into the publishable copy at `build/WolframPhysics` |
| `publish.wls` | the public cloud deploy of that copy as a Paclet resource; `WP_PUBLISH_DRY_RUN=1` rehearses it |
| `build_site.wls` | the single-page documentation browser, `local` (offline, served by `docs_local.sh`) or `site` (deployed) |
| `run_tests.wls` | the `.wlt` test runner |
| `build_paclet.wls`, `install_local.wls` | the installable `.paclet` archive of `WolframPhysics/` into `dist/`, and a local install of it; both pack the tree as it stands and refuse it when a documentation notebook is missing or older than its markdown, so run `./build_docs.sh` first |
| `build_all.wls`, `prime_ci.sh`, `sync_ci_secrets.sh` | the CI pipeline: one command for build, publish and site (`WP_BUILD_ONLY=1` stops after docbuild); the Prime pod that runs it; the secrets it needs |

## Guide entries for functions that live elsewhere

The root guide follows the ordinary guide conventions (`## Abstract`,
`## Functions` with `### ` topic sections, fundamentals first, `- ` bullets, a
trailing bare list of lesser functions ending in ` …`) with one deliberate
extension: because the paclet has no symbols yet, the bullets list functions
that live elsewhere, and the converter cannot make a chip for those. A bare
backtick chip links to this paclet's own `ref/` page, which does not exist, so:

- A built-in is a real chip with the `(WL)` tag:
  `` - `Graph` (WL) description ``. It links to the System page.
- A Function Repository function is a markdown link, its text a code span,
  with the `(WFR)` tag:
  `` - [`WolframModel`](https://resources.wolframcloud.com/FunctionRepository/resources/WolframModel/) (WFR) description ``.
  The item renders as guide text, the name a code-styled hyperlink, never a
  chip; a plain-text link (`[WolframModel](...)`) converts too, but renders
  the name in text style, so the code-span form is the one to copy.
- A paclet function is a markdown link to its page, the same code-span form,
  with the paclet as the tag:
  `` - [`Hypergraph`](https://resources.wolframcloud.com/PacletRepository/resources/WolframInstitute/Hypergraph/ref/Hypergraph.html) (WolframInstitute/Hypergraph) description ``.
- A paclet published only as a cloud resource, not on the Paclet Repository
  (WolframInstitute/HypergraphRewriteEngine), links its ref page under the
  deployed resource, which is the page that serves anonymously:
  `https://www.wolframcloud.com/obj/<account>/DeployedResources/Paclet/<Publisher>/<Paclet>/Documentation/ref/<Name>.html`;
  the Paclet Repository form of that URL redirects to a login and is dead.
- A GitHub, Community or site resource is a markdown link to the page, with
  the origin in parentheses.
- The provenance tag in parentheses right after the link or chip is mandatory
  on every entry.

The `wolfram-guide-page` skill carries the full format; the
`functions-library-ingest` skill is how an external source is surveyed into
vetted entries.

## Skills (task playbooks)

Reusable, step-by-step workflows for the recurring authoring tasks live in
[`.agent-skills/`](.agent-skills/). Each is a `SKILL.md` with YAML frontmatter
(`name`, `description`) followed by instructions, readable by any agent. They
are the source of truth for how each task is done in this repo; read the
relevant one before starting that kind of work.

| Skill | Folder | Use it to |
| --- | --- | --- |
| `wolfram-guide-page` | [`.agent-skills/wolfram-guide-page/`](.agent-skills/wolfram-guide-page/SKILL.md) | Author or fix the root guide under `docs/en/Guides/`: the documentation home, an abstract plus a content-first index of the functions of the Wolfram Physics Project, wherever they live, with the provenance convention above. |
| `functions-library-ingest` | [`.agent-skills/functions-library-ingest/`](.agent-skills/functions-library-ingest/SKILL.md) | Survey an external source of Wolfram Physics functions (a paclet, the Function Repository, a site, a Community post) into vetted guide entries with source traceability. |
| `implement-wolfram-functions` | [`.agent-skills/implement-wolfram-functions/`](.agent-skills/implement-wolfram-functions/SKILL.md) | Turn a guide's listed symbols into kernel code under `WolframPhysics/Kernel/` plus matching tests, once a topic is implemented here rather than linked. |
| `wolfram-symbol-page` | [`.agent-skills/wolfram-symbol-page/`](.agent-skills/wolfram-symbol-page/SKILL.md) | Author a symbol reference page (`ref/`) under `docs/en/ReferencePages/Symbols/` for a symbol this paclet exports: Usage, Details and Options, Examples, Scope, Possible Issues. |
| `wolfram-tech-note` | [`.agent-skills/wolfram-tech-note/`](.agent-skills/wolfram-tech-note/SKILL.md) | Author a tutorial / tech note under `docs/en/Tutorials/`: free-flowing prose interleaved with runnable, state-threading examples, with this repo's authoring and verification rules. |
| `deploy-wolfram-physics` | [`.agent-skills/deploy-wolfram-physics/`](.agent-skills/deploy-wolfram-physics/SKILL.md) | Run or monitor a deploy of the paclet resource and the documentation site from an agent harness (defers to [CONTRIBUTING.md](CONTRIBUTING.md) "Publishing"). |

## Toolchain the skills assume

The skills are not self-contained text; they drive a Wolfram toolchain. An agent
running them needs:

- `wolframscript` 15 with the repo checked out. Everything evaluates from a
  file (see the recipe below); the lint, the example runner, the notebook build
  and the tests are all `wolframscript -file scripts/<name>.wls`.
- MarkdownToNotebook, from the `tools/MarkdownToNotebook` submodule, whose
  pointer follows the commit deployed as the public resource function at
  `https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/MarkdownToNotebook`:
  the two are the same code, so a build needs no cloud access and the deployed
  resource is fetched only where the checkout is missing (`./build_docs.sh`
  initialises the submodule). The converter is never patched here; a converter
  bug is fixed upstream and the pointer bumped.
- `DocumentationBuild`, which ships with the Wolfram Language: `scripts/docbuild.wls`
  builds the `ref/`, `guide/` and `tutorial/` pages from the authoring notebooks
  before a publish, and `scripts/build_site.wls local` renders them to HTML.
  Both need a Front End; neither needs the cloud.
- A way to evaluate and search Wolfram Language while authoring. The guide,
  ingest and implement skills discover and verify functions as they work, and
  the Wolfram MCP server provides this: `WolframLanguageEvaluator` (evaluate
  WL, `ResourceSearch`, `ResourceObject`, `PacletFind`) and
  `WolframLanguageContext` (search over the Wolfram documentation and the
  Function Repository). A cloud evaluator is a partial fallback, but it has no
  access to the repo on disk, so it cannot run the local tests or the local
  builds. Confirm every claim about a built-in by evaluation.
- A Wolfram Cloud connection only for publishing (`scripts/publish.wls`,
  `scripts/build_site.wls site`), and those scripts print the account and the
  target before writing. Nothing else needs a cloud login: the notebook build
  reaches the network only to install `Wolfram/Parser` and, when the submodule
  checkout is missing, to fetch the deployed converter, and
  `scripts/sync_ci_secrets.sh` logs in only to validate the CI credentials.

### How to evaluate Wolfram Language here

Always from a scratch `.wls` file, never with `wolframscript -code`: a `-code`
string is parsed before `Needs` runs, so every paclet symbol in it lands in
`` Global` `` and nothing works. Write the file under the session's scratch
directory (or anywhere outside the tree) and run it from the repo root:

```wolfram
PacletDirectoryLoad[FileNameJoin[{Directory[], "WolframPhysics"}]];
Needs["WolframInstitute`WolframPhysics`"];
$WolframInstituteWolframPhysicsVersion
```

```
wolframscript -file /path/to/scratch.wls
```

`PacletDirectoryLoad` of `WolframPhysics/` makes the examples run against this
checkout rather than an installed release. Functions the guide links from
elsewhere are evaluated the way a reader would evaluate them:
`ResourceFunction["WolframModel"]` for the Function Repository,
`PacletInstall` then `Needs` for a paclet, and a scratch run records what came
back. Keep local evaluation light: the multiway systems these functions build
grow exponentially, so a probe uses one or two rules, a few initial edges and a
handful of steps.

## Writing WL context names in Markdown: non-negotiable

A Wolfram context name ends in a backtick (`` System` ``, `` Global` ``,
`` WolframInstitute`WolframPhysics` ``). Put one inside a single-backtick code
span and the inner backtick closes the span early; whatever follows is then
parsed as prose, and an angle-bracket placeholder is swallowed as an HTML tag.
This silently corrupts the text:

| Written | What the reader/agent actually receives |
| --- | --- |
| `` `Names["System`<Name>"]` `` | `Names["SystemSpan"]`: context and placeholder both gone |
| `` `WolframInstitute`WolframPhysics` `` | `WolframInstitute` followed by stray prose |

**The rule: any code span whose content contains a backtick MUST use
double-backtick delimiters, with a space inside each end**,
as in ``` `` Names["WolframInstitute`WolframPhysics`<Name>"] `` ```. Prefer a
fenced block for anything longer.

This applies to every Markdown an agent produces, not just the doc sources: that
includes subagent prompts, task descriptions, audit ledgers, commit messages, PR
bodies and issue comments. `scripts/lint_docs.wls` enforces it, but only over
`docs/en`, `docs/notes`, `docs/research`, `.agent-skills`,
`docs/ResourceDefinition.md` and the top-level `*.md` files; everywhere else the
discipline is yours. A corrupted context name in a prompt is the worst case,
because the agent silently receives a different instruction than the one
intended and no linter will ever see it.

The other house rules that apply to everything written here (source, docs,
comments, commit messages) are in [GUIDE.md](GUIDE.md) "Rules the user has
explicitly called out": no em dashes and no `--` as a dash, no box-drawing
characters or decorative arrows in source, no bold for emphasis in doc prose, no
"call"/"invoke"/"routine" vocabulary in user-facing doc prose, and no kernel
source file paths on a user-facing page.

## From research to guide to implementation (the pipeline)

Adding a topic runs as a pipeline; the stages map to the skills above, and
[CONTRIBUTING.md](CONTRIBUTING.md) "Adding a topic" and "Documentation" have
the commands:

0. Research the topic across `docs/research/<source>.md`, one report per
   source surveyed, lowercase with hyphens, extended into with a dated section
   rather than written to a per-topic file: which functions exist for the
   topic and where (built-in, Function Repository, paclet, site, Community),
   what each one takes and gives, what overlaps, what is missing. Probe the
   actual functions with scratch scripts and record what they return; verify by
   evaluation, never from memory. The `functions-library-ingest` skill is the
   survey of one source into its report.
1. Guide page, skill `wolfram-guide-page`: land the topic on the root guide,
   `docs/en/Guides/WolframPhysics.md`, as a `### ` section of provenance-tagged
   entries in the format above. The guide is the contract the next stage
   implements: what this paclet will provide itself, and what it links.
2. Implement, skill `implement-wolfram-functions`: turn the guide's own symbols
   into `WolframPhysics/Kernel/<Category>/<Topic>.wl` with `PackageExported`
   declarations and usage messages, plus the matching
   `WolframPhysics/Tests/<Category>/<Topic>.wlt`. A file is loaded because it is
   under `Kernel/`; nothing else registers it.
3. Document symbols, skill `wolfram-symbol-page`: a `ref/` page under
   `docs/en/ReferencePages/Symbols/` for each exported symbol, after it is well
   debugged. Every documented example is one the research showed.
4. Bump the version: increment `"Version"` in `WolframPhysics/PacletInfo.wl`
   with every addition (a patch bump for symbols or fixes, a minor bump for a
   new topic). The PacletManager keys on version, so a bump lets a fresh load
   prefer this checkout over an installed or cached copy left at the old
   version.

Before committing a documentation change, verify locally:
`wolframscript -file scripts/lint_docs.wls`, then
`wolframscript -file scripts/run_doc_examples.wls [page.md]`, then
`./build_docs.sh structure` to see the page's cell layout without evaluating
anything (it writes to `docs/en/.generated/`, never to the shipping tree), then
the full `./build_docs.sh` to see the page the paclet will ship. Commit the
markdown and the research note, and nothing else
(`git add docs/en docs/research`): the notebooks the build just wrote are
artifacts, ignored by git, and rebuilt by the next publish.
`tools/dev/doc_symbols_check.py` refuses a page for a symbol the paclet does not
export and a dead `ref/` link; `tools/dev/doc_links_check.py` refuses a web link
that does not serve a page (a Wolfram resource address that redirects to a
sign-in page is one that does not exist).

## Using the skills with your tool

The skills are plain Markdown: point your agent at the relevant `SKILL.md` and
follow it. Tool-specific discovery is optional and never the source of truth:

- Claude Code auto-loads [CLAUDE.md](CLAUDE.md), which imports this file, and
  auto-discovers skills under `.claude/skills/`. To get that convenience without
  committing a vendor-specific path, symlink it locally (`.claude/` is
  gitignored): `ln -s ../.agent-skills .claude/skills`. On Windows this needs
  Developer Mode or an elevated shell (`mklink /D`), so it is optional; reading
  the `SKILL.md` directly always works.
- Other agents/tools: read the `SKILL.md` files in `.agent-skills/` directly,
  or wire them into your tool's own convention.
