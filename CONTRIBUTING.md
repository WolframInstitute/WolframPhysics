# Contributing to WolframPhysics

WolframPhysics is a Wolfram Language paclet (`WolframInstitute/WolframPhysics`)
that aggregates the functionality of the Wolfram Physics Project. This document
covers how the repository is structured, how a topic is added, how the tests
run, and how the documentation is built, checked, read and published. Coding
conventions and the documentation rules live in [GUIDE.md](GUIDE.md); read it
before writing code or a page. [AGENTS.md](AGENTS.md) is the entry point for
AI agents and automated contributors. The scripts and the conventions here are
ported from the WolframInstitute/PureMath and HypergraphRewritingEngine
repositories, whose scripts carry the same headers.

## Repository layout

```
  README.md
  GUIDE.md                   Wolfram Language style guide and documentation rules
  CONTRIBUTING.md            this file
  AGENTS.md  CLAUDE.md       agent guidance (CLAUDE.md imports AGENTS.md)
  LICENSE.md                 MIT
  build_docs.sh              markdown -> notebooks wrapper (finds wolframscript, initialises the submodule)
  scripts/
    build_notebooks.wls      docs/en and docs/ResourceDefinition.md -> the documentation notebooks
    lint_docs.wls            the documentation lint
    run_doc_examples.wls     every page's examples, evaluated as the built page evaluates them
    docbuild.wls             DocumentationBuild the notebooks into the publishable copy at build/WolframPhysics
    deploy_common.wls        the shared cloud-deploy machinery, every fix explained where it is defined
    publish.wls              deploy the built copy as a public Paclet resource
    build_site.wls           the documentation browser: local (offline) or site (deployed)
    docs_local.sh            build the local site and serve it
    run_tests.wls            test runner (stdout report, CI exit code)
    build_paclet.wls         WolframPhysics/ -> the installable .paclet archive in dist/
    install_local.wls        archive and install the paclet locally
    build_all.wls            build_notebooks -> docbuild -> publish -> build_site site, one command
    prime_ci.sh              the Prime Intellect CPU pod that runs build_all on the Wolfram image
    sync_ci_secrets.sh       validate the CI credentials and push them to the repo secrets
  .github/workflows/
    build_paclet.yml         gates + lint + tests + doc examples + the packed archive on every push; the pod publish on main
  tools/
    MarkdownToNotebook/      the converter, a git submodule (never patched here)
    dev/
      doc_symbols_check.py   no page for a symbol the paclet does not export; no dead ref link
      precommit_gates.sh     the gates above plus the lint, as a pre-commit hook
      commit_msg_gate.sh     the commit-message hook: a subject line, no em dash, no box drawing, no double hyphen as a dash
  docs/
    en/                      documentation markdown sources (built to .nb)
      Guides/WolframPhysics.md          the root guide, the documentation home
      Tutorials/<Name>.md
      ReferencePages/Symbols/<Name>.md  empty until the paclet exports a symbol
    ResourceDefinition.md    the paclet resource's definition (Template Paclet)
    research/<source>.md     research reports, one per source surveyed, lowercase with hyphens
    notes/                   authoring notes: doc-arg-naming.md, doc-example-state.md, doc-math-rendering.md,
                             plus one design note per topic, docs/notes/<Topic>.md, once a topic is implemented
    web/                     the site shell: docs_site.html, docs_site.css, docs_site.js, docs_page.html
  .agent-skills/             task playbooks: wolfram-guide-page, wolfram-symbol-page, wolfram-tech-note,
                             implement-wolfram-functions, functions-library-ingest, deploy-wolfram-physics
  WolframPhysics/            the paclet
    PacletInfo.wl            metadata and context
    Kernel/
      WolframPhysics.wl      umbrella: the paclet's single PackageInitialize
      InitialEvaluations.wl  loaded first (LoadFirstFiles)
      FinalEvaluations.wl    loaded last (LoadLastFiles)
      GeneralParameters.wl   paclet-wide symbols ($WolframInstituteWolframPhysicsVersion)
    Tests/
      GeneralParameters.wlt  the paclet loads, the context exists, the version matches PacletInfo.wl
    Documentation/English/   BUILT notebooks (Guides/, Tutorials/, ReferencePages/Symbols/), not in git
    ResourceDefinition.nb    BUILT from docs/ResourceDefinition.md, not in git
```

The documentation notebooks are build output and are gitignored with the rest of
it: `WolframPhysics/Documentation/` (the whole built tree: the notebooks, the
manifest, the build stamp and the Documentation Center's search and spell
indexes) and `WolframPhysics/ResourceDefinition.nb`, `build/` (the publishable
copy, the local site and its cache), `dist/` (the archives),
`docs/en/.generated/` (structure builds), `.env`, `.mathpass` and `.claude/`.
See "Building the documentation".

## Architecture: one umbrella context, one directory per category

WolframPhysics uses the StructuredPackageFormat (new in Wolfram Language 15.0,
which is why the paclet declares WolframVersion 15.0+), with a single umbrella context,
`` WolframInstitute`WolframPhysics` ``, for the whole paclet. Code is to be
organized as one directory per category under `Kernel/` (hypergraph rewriting,
multiway systems, causal and branchial structure, rulial space, and so on, once
each has an implementation), but that is purely for human organization: a
file's category folder has no effect on any symbol's context.

- [Kernel/WolframPhysics.wl](WolframPhysics/Kernel/WolframPhysics.wl) holds the
  paclet's only `PackageInitialize`, which defines the context and reads every
  `.wl` file under `Kernel/` (with `InitialEvaluations.wl` first and
  `FinalEvaluations.wl` last, and `` GeneralUtilities` `` as a hidden import).
  There are no per-category loader files: a file is picked up simply by living
  under `Kernel/`.
- Consequently `` Needs["WolframInstitute`WolframPhysics`"] `` loads the entire
  paclet; there is no supported way to load one category on its own.
- Each feature file declares its public symbols with `PackageExported` and its
  cross-file internals with `PackageScoped`. Scoped symbols are reachable by
  short name via `` Needs["WolframInstitute`WolframPhysics`PackageScope`"] ``,
  which `Kernel/WolframPhysics.wl` registers as an importable package after
  loading.
- [Kernel/GeneralParameters.wl](WolframPhysics/Kernel/GeneralParameters.wl)
  exports `$WolframInstituteWolframPhysicsVersion`, an association of the
  version, the Wolfram version and the creator read from the paclet object.
  When categories exist, the list of them is derived from the `Kernel/`
  subdirectories and pinned against the guides tree by a test, never
  hand-maintained.

The same names index the four trees as they fill in: `WolframPhysics/Kernel/`,
`WolframPhysics/Tests/`, `docs/en/Guides/` and `docs/en/ReferencePages/Symbols/`.
A kernel file belongs in the category of the guide that chips its exported
symbols.

## Usage

```wolfram
PacletDirectoryLoad["/path/to/WolframPhysics/WolframPhysics"];

Needs["WolframInstitute`WolframPhysics`"];           (* loads the whole paclet *)

$WolframInstituteWolframPhysicsVersion
(* <|"Version" -> "0.0.1", "WolframVersion" -> "15.0+", "Author" -> "Wolfram Institute"|> *)
```

The functions the guide surveys are used where they live: a built-in directly,
a Function Repository function through `ResourceFunction["WolframModel"]`, a
paclet function after `PacletInstall` and `Needs` of that paclet. The guide's
provenance tags say which is which.

## Adding a topic

Adding a topic runs as a pipeline. Each stage has a skill (in `.agent-skills/`,
a tool-neutral location any agent or contributor can read) that encodes that
stage's conventions; see [GUIDE.md](GUIDE.md) "Documentation". Invoke the skill
by name, or follow the steps by hand.

> Using an AI coding tool? [AGENTS.md](AGENTS.md) is the tool-neutral entry
> point: it indexes the skills, the Wolfram toolchain they assume, and this
> pipeline. Point your tool at it once: most read `AGENTS.md` (or a project
> instructions file) automatically, and its "Using the skills with your tool"
> section gives the per-tool setup (Claude Code reads `CLAUDE.md`, which
> imports `AGENTS.md`, and auto-discovers skills through a
> `.claude/skills -> ../.agent-skills` symlink). Skills stay the source of
> truth in `.agent-skills/`.

0. Research the topic across `docs/research/<source>.md`, one report per
   source surveyed (the built-in language, the Function Repository, the Paclet
   Repository, GitHub, the Wolfram Institute), named in lowercase with hyphens
   and extended with a dated section rather than overwritten: which functions
   exist for the topic and where, what each takes and gives, what overlaps,
   what is missing. Stages 1 and 2 read the reports first. Probe the actual
   functions with scratch scripts and record what they return; verify by
   evaluation, never from memory. The `functions-library-ingest` skill is how
   a source is surveyed into a report and vetted entries.

1. Guide page, skill `wolfram-guide-page`. Land the topic on the root guide,
   `docs/en/Guides/WolframPhysics.md`, as a `### ` section of entries in the
   provenance-tagged format [AGENTS.md](AGENTS.md) "Guide entries for
   functions that live elsewhere" describes: a built-in is a chip with `(WL)`,
   everything else is a markdown link with its origin in parentheses. The
   `functions-library-ingest` skill is how an external source is surveyed into
   vetted entries. This page is the contract the next stage implements,
   including which category the code lands in, since a kernel file follows the
   guide that chips its symbols.

2. Implement, skill `implement-wolfram-functions`. Turn the guide's own symbols
   into `WolframPhysics/Kernel/<Category>/<Topic>.wl`: `PackageExported` and
   `PackageScoped` declarations and a usage message per public and per scoped
   symbol, plus a matching `WolframPhysics/Tests/<Category>/<Topic>.wlt`.
   Nothing else needs updating: the new file is loaded because it is under
   `Kernel/`. A new category means creating the directory in the kernel, test
   and guide trees alike.

3. Document symbols, skill `wolfram-symbol-page`. Write a `ref/` reference page
   under `docs/en/ReferencePages/Symbols/` for each exported symbol, after it
   is well debugged.

4. Bump the version. Increment `"Version"` in
   [WolframPhysics/PacletInfo.wl](WolframPhysics/PacletInfo.wl) with every
   addition: a patch bump for symbols or fixes, a minor bump for a new topic.
   This is not just bookkeeping: the PacletManager keys on version, so a bump
   lets a fresh load prefer your updated paclet over an installed or cached
   copy left at the old version (reinstall or re-cache after bumping).

   > Caveat: a version bump does not by itself resolve every duplicate-copy
   > problem. If two directories holding a `WolframInstitute/WolframPhysics`
   > paclet are both on the paclet search path (a sibling checkout, a leftover
   > worktree from another session), `PacletDirectoryLoad` discovers them all
   > and `Needs` can still load the wrong, older one, even after a bump.
   > Symptom: `run_tests.wls` from the repo root fails a just-edited file with
   > its new symbols landing in the `` Global` `` context, while a load scoped
   > to `WolframPhysics/` passes. Keep the tree free of stale duplicate paclet
   > copies, or run tests scoped to the paclet directory.

## Running the tests

Run the whole suite from the shell with the `.wls` runner. It prints a per-file
and overall summary to stdout and exits non-zero if anything fails (so it drops
straight into CI):

```
wolframscript -file scripts/run_tests.wls
```

Pass paths to run a subset:

```
wolframscript -file scripts/run_tests.wls WolframPhysics/Tests/GeneralParameters.wlt
```

You can also run a single file directly; each test file starts by registering
the paclet directory (`Directory[]` when it holds `PacletInfo.wl`, else
`Directory[]/WolframPhysics`, through the `Scan[PacletDirectoryLoad, Select[...]]`
head in `Tests/GeneralParameters.wlt`) and then
`` Needs["WolframInstitute`WolframPhysics`"] ``, so it works standalone as long
as you run from the repo root or the paclet folder:

```wolfram
TestReport["/path/to/WolframPhysics/WolframPhysics/Tests/GeneralParameters.wlt"]
```

## Building the documentation

Documentation is authored as literate markdown under `docs/en/` (the guide,
tutorials and symbol reference pages) plus `docs/ResourceDefinition.md` for the
paclet definition, and built into notebooks with MarkdownToNotebook from the
`tools/MarkdownToNotebook` submodule, whose pointer follows the commit deployed
as the public resource function at
`https://www.wolframcloud.com/obj/nikm/DeployedResources/Function/MarkdownToNotebook`;
the deployed resource is fetched only where the checkout is missing.

The markdown is the source of truth, and a notebook is never edited by hand. The
built notebooks under `WolframPhysics/Documentation/English/` and
`WolframPhysics/ResourceDefinition.nb` are build artifacts: they are not in git,
they are gitignored, and a fresh clone has none of them. `./build_docs.sh`
writes them, and every publish rebuilds them, so a contributor changes the
markdown and runs the build before publishing; nothing is committed but the
markdown. The resource and the installable archive therefore always carry pages
built from the markdown beside them, which `scripts/docbuild.wls` enforces: a
notebook that is missing, or built from markdown newer than itself, fails the
build rather than shipping a page the sources no longer say. The page-writing
rules (what a symbol page, the guide and a tutorial contain;
typography; how example cells keep state) are in [GUIDE.md](GUIDE.md)
"Documentation"; [AGENTS.md](AGENTS.md) indexes the authoring skills, the
toolchain and the pipeline. Read the three notes under `docs/notes/` for the
rules that came out of probing the converter.

```
./build_docs.sh                       # docs/en and docs/ResourceDefinition.md -> the notebooks, evaluating every example
./build_docs.sh structure             # input-only cells into docs/en/.generated/ (gitignored): the layout, nothing evaluated
./build_docs.sh only=WolframPhysics   # only the sources whose basename matches the regex
```

The wrapper initialises the submodule when it is absent, finds `wolframscript`
and runs `scripts/build_notebooks.wls`, which can also be run directly:
`wolframscript -file scripts/build_notebooks.wls [structure] [only=<regex>]`.
`WP_MTN_SOURCE=<path>` names an explicit `MarkdownToNotebook.wl` (or the
directory holding one) to convert with instead of the submodule checkout; a
path that does not exist is reported and the search falls back to the checkout.
No cloud access is involved when the submodule is present; the converter is
never patched here, a converter bug is fixed upstream and the submodule pointer
bumped.

Output is flat by basename, regardless of how deeply the source is nested: the
documentation system resolves guide, tutorial and symbol URIs in a flat
namespace, and the sidebar hierarchy comes from the guide-to-guide link graph,
not the directory layout. So any category directories under `docs/en/` organize
the sources, not the built tree:

```
docs/en/Guides/**/<Name>.md                  -> WolframPhysics/Documentation/English/Guides/<Name>.nb
docs/en/Tutorials/**/<Name>.md               -> WolframPhysics/Documentation/English/Tutorials/<Name>.nb
docs/en/ReferencePages/Symbols/**/<Name>.md  -> WolframPhysics/Documentation/English/ReferencePages/Symbols/<Name>.nb
docs/ResourceDefinition.md                   -> WolframPhysics/ResourceDefinition.nb
```

A page's frontmatter carries `Name` (equal to the file basename and to the URI
tail: CamelCase, no spaces), a `Title` on guides and tutorials (words with
spaces), `` Context: WolframInstitute`WolframPhysics` ``,
`Paclet: WolframInstitute/WolframPhysics` and
`URI: WolframInstitute/WolframPhysics/{ref|guide|tutorial}/<Name>`. The build
writes `<Name>.nb` and fails loudly when `Name` and the basename disagree. Only
a symbol the paclet exports gets a reference page; a page for anything else
fails `tools/dev/doc_symbols_check.py`.

Full evaluation runs the examples against the paclet in `WolframPhysics/`, so
the page's `Context` frontmatter loads it before the first cell evaluates, and
no cell of its own carries a `Needs`. Structure mode needs only `wolframscript`
and the converter, and writes outside the shipping tree, so an input-only
notebook never sits where the paclet would ship it. The build is incremental: a
manifest beside the notebooks records each page's build key (markdown hash,
build mode, tutorial semantics, the converter and the build script), so an
unchanged page is skipped. A stale-notebook sweep runs
on every build, `only=` included: a notebook under the three output roots that
no current source maps to is deleted, so a renamed page leaves no orphan.
Tutorials convert with `"EvaluateSeparator" -> None`, so their cells thread
state from first to last; every other page resets state at headings and `---`
(see `docs/notes/doc-example-state.md`).

Every documented example is verified by evaluation against this checkout's
paclet, or against the resource it links, never written from memory; the
research behind a page goes under `docs/research/`.

## The documentation site

The built notebooks are read the way a reader will read them, through a
single-page documentation browser: the guide, its tutorials and its symbol
pages as a tree on the left, one page in a frame beside it, and every link
inside a page to another page of that tree routed back through it instead of
escaping into the chrome around it (a link to anything else, Wolfram's own
documentation and the resources the guide surveys above all, keeps its own
navigation and opens in a new tab). `scripts/build_site.wls` assembles that
shell for either of two targets, `local` and `site`. (`./build_docs.sh` in this
repository means markdown to notebooks; this is the separate step that puts
those notebooks in front of a reader.)

```
scripts/docs_local.sh                                        # build the local site, serve it on :8000
PORT=9000 scripts/docs_local.sh                              # another port
WP_LOCAL_ONLY=WolframPhysics scripts/docs_local.sh           # render that page again; the rest from the cache
WP_HTML_CACHE=0 scripts/docs_local.sh                        # ignore the cache and render every page
wolframscript -file scripts/build_site.wls local             # build it without serving it
DRYRUN=1 wolframscript -file scripts/build_site.wls local    # print the navigation and stop
wolframscript -file scripts/build_site.wls help              # the usage (wolframscript keeps -h and --help for itself)
```

The local target has no cloud connection in it, and no network at all: even
the fonts of the shell come from the bundle the render ships beside the pages.
It renders every notebook under `WolframPhysics/Documentation/English` to
static HTML with a headless front end
(`` DocumentationBuild`DocumentationBuildHTML ``), writes the site to
`build/local-docs` and serves it with `python3 -m http.server`;
`scripts/docs_local.sh --help` prints its own usage. A render is keyed by a
hash of its source notebook, and the page and its images are kept together
under `build/local-docs-cache`, so a rebuild with nothing changed takes
seconds. `WP_HTML_CACHE=0` ignores the cache and renders everything again;
`WP_LOCAL_ONLY` renders one page again whether or not it is cached, still
renders whatever the cache does not hold, and stops the run when its value
names no page. The site is built in a staging directory and judged there: every page in the
navigation must be present with every image it references and every shared
asset bundle it names, and only then is it swapped into `build/local-docs`, so
a server running on the previous site never serves a half-written one and a
failed build leaves the previous site as it was. Everything the documentation
build itself prints goes to `build/local-docs-render.log`. Two repairs are
applied to what the render ships, each explained where it is made in the
script: the pages reference `language-assets-v2` while the bundle is named
`language-assets`, so it is duplicated under both names, and the jQuery in the
bundle carries two lines of a dependency-check log after its code, which the
build cuts off, since otherwise no collapsed section of a symbol page can be
opened. All of it is under `build/`, which `.gitignore` covers.

The site target deploys the same shell to the Wolfram Cloud, and is the last
step of the publishing sequence below.

```
DRYRUN=1 wolframscript -file scripts/build_site.wls site    # rehearsal: print the navigation tree and stop before connecting; the account is only resolved by the real run
wolframscript -file scripts/build_site.wls site             # deploy the shell
```

It writes one cloud directory, `<account>/WolframPhysics`, whose `index.html`
is the shell (the directory's own URL serves it, so the site is
`https://www.wolframcloud.com/obj/<account>/WolframPhysics`) and `page.html`
the notebook host beside it; it changes nothing else: the resource
`scripts/publish.wls` deployed keeps its own pages, and the shell frames them
live from `<account>/DeployedResources/Paclet/WolframInstitute/WolframPhysics`.
The shell exists because the stock paclet shingle deploys each documentation
page as a delayed embed that fetches the page's static render with a one second
budget: a heavy page comes back empty, and a link inside a page leaves the
reader in the resource chrome with no navigation. Credentials are
`WOLFRAM_CLOUD_USER` and `WOLFRAM_CLOUD_PASSWORD`, and the account they name,
or the one the kernel already holds, is where the shell lands, so read the
account the script prints before letting a deploy continue.

The navigation is read from the markdown sources, never from a list inside the
script: the guide is the root, its `RelatedTutorials` give the Tutorials group
in the order the guide names them, the symbols the guide introduces give the
Reference group in the order it introduces them (empty while the paclet exports
none), and each page's `Title` and `Keywords` come from its own frontmatter (the
filter box in the header matches both). A page added under `docs/en` appears in
the tree with no edit to the script, and `DRYRUN=1` prints that tree and stops,
which is how to check that a new page landed where it should before rendering
or deploying anything. A hash that names no page shows the guide with a note
saying so, rather than a server error inside the frame.

The markup of the shell is `docs/web/docs_site.html`, `docs/web/docs_site.css`
and `docs/web/docs_site.js`, plus `docs/web/docs_page.html`, the notebook host
that the cloud target frames; the script fills their slots and inlines the
result into one `index.html`.

## The gates

Run these before committing a documentation change; CI runs all of them. They
read the markdown and the Kernel sources, so none of them needs a documentation
build first.

```
wolframscript -file scripts/lint_docs.wls          # typography, backtick and math rules over docs/en, docs/notes,
                                                   #   docs/research, .agent-skills, docs/ResourceDefinition.md and the top-level *.md files
wolframscript -file scripts/run_doc_examples.wls [page.md]
                                                   # every page's examples, under the built page's state-reset semantics
python3 tools/dev/doc_symbols_check.py             # no page for a symbol the paclet does not export; no dead ref/ link
python3 tools/dev/doc_links_check.py [page.md]     # every web link in docs/en and docs/ResourceDefinition.md serves a page
tools/dev/precommit_gates.sh                       # the Python gates plus the lint, as the pre-commit hook runs them
```

`doc_links_check.py` fetches every distinct http(s) link the sources carry, in
parallel with a browser User-Agent, and fails on anything but a 200; the Wolfram
resource sites answer a request for a resource that does not exist with a chain
of redirects to a sign-in page rather than a 404, so a chain ending on
`account.wolfram.com` is reported as a missing resource. It exists because the
root guide is an index of links into pages this repository does not build.
`WP_LINKS_JOBS=<n>` and `WP_LINKS_TIMEOUT=<s>` size the requests;
`WP_SKIP_LINKS=1` skips it on a machine without network (CI still runs it).

`run_doc_examples.wls` loads this paclet and evaluates the pages in a parallel
kernel pool; `WP_DOC_EXAMPLES_KERNELS=<n>` caps it on a shared machine. It
reads every `Sym::tag` a hint names and requires exactly those messages of the
cell, compares each cell's output with the hint recorded under it, and fails a
cell that reads a binding the built page has already thrown away. It takes a
kernel and minutes, so the pre-commit hook leaves it and the test suite to CI,
which runs both in the Wolfram container.

No gate compares a notebook with its markdown, because no notebook is in git to
compare a commit against: a build leaves them in the working tree, but nothing
a hook can read says which commit they belong to. Staleness is the build's
problem, and `scripts/docbuild.wls` fails a deploy whose notebooks are missing
or older than their markdown.

Install the hooks on a clone so a push never goes red on something a second
of checking would have caught:

```
ln -sf ../../tools/dev/precommit_gates.sh .git/hooks/pre-commit
ln -sf ../../tools/dev/commit_msg_gate.sh .git/hooks/commit-msg
```

`WP_SKIP_LINT=1` makes the pre-commit hook skip `scripts/lint_docs.wls` on a
machine without `wolframscript` (CI still runs it); without it a missing
`wolframscript` fails the hook. `WP_SKIP_LINKS=1` does the same for the link
check on a machine without network.

## Publishing

The paclet is published as a public Wolfram Cloud paclet resource that carries
its documentation. From a tree with the markdown in place, run these from the
repository root in this order; the dry run is the rehearsal that goes before
the deploy.

```
./build_docs.sh                                      # the notebooks: docs/en -> WolframPhysics/Documentation/English,
                                                     #   docs/ResourceDefinition.md -> WolframPhysics/ResourceDefinition.nb
wolframscript -file scripts/docbuild.wls             # DocumentationBuild them into build/WolframPhysics (gitignored): the paclet skeleton,
                                                     #   the built pages, the search index and the declared symbols
WP_PUBLISH_DRY_RUN=1 wolframscript -file scripts/publish.wls   # rehearsal: connect, scrape, print what would be deployed where
wolframscript -file scripts/publish.wls              # the deploy
wolframscript -file scripts/build_site.wls site      # the documentation browser over the deployed resource
```

`scripts/build_all.wls` drives the four from one command, each phase its own
`wolframscript` process run in sequence with its output streamed through:
`./build_docs.sh`, docbuild, publish, then `build_site site`; a phase that
exits non-zero stops the run with that status. `WP_BUILD_ONLY=1` stops it
after docbuild, with the built copy at `build/WolframPhysics`, which is how a
machine builds the publishable copy without deploying anything;
`WP_PUBLISH_DRY_RUN=1` rehearses the whole run, with
publish stopping after the scrape and `build_site` running under `DRYRUN=1`,
so nothing is written to the cloud. Every phase inherits the environment, so
the same knobs, credentials and printed account apply as when the scripts run
one by one.

The definition notebook. `docs/ResourceDefinition.md` (Template `Paclet`) is
the resource's definition: the metadata and the landing-page prose (Usage,
Details & Options, Author Notes); an Examples section and a Hero Image section
are optional, and today there is neither: the build drops the empty Examples
group and the resource deploys without a hero. Its `SourceControlURL` is the
repository's intended home and must resolve before the first deploy: until the
repository is pushed there, the resource's Source Control link is dead and the
definition check may report it at the first scrape, so push before the first
`WP_PUBLISH_DRY_RUN=1` run. `scripts/build_notebooks.wls` converts it with
the pages to
`WolframPhysics/ResourceDefinition.nb`, which is build output like the pages
and is not in git: it ships in the deployed resource, so a deploy runs the
build first, and `scripts/docbuild.wls` exits 1 naming it when it is not there
or when the markdown beside it is newer. Its
`Description` must equal the `"Description"` in `WolframPhysics/PacletInfo.wl`,
its `MainGuide` is the relative notebook path of the guide, and its
`Categories` are Paclet Repository category names; the category checkboxes are
filled again at publish time, which repairs the empty grid a build machine with
no cloud login converts (the item list comes from the resource system) and
names any category the resource system does not offer.

`scripts/docbuild.wls` needs a Front End and no cloud connection. On a Linux
box with neither `QT_QPA_PLATFORM` nor `DISPLAY` set it sets
`QT_QPA_PLATFORM=offscreen`, without which the headless front end cannot start
and DocumentationBuild builds nothing. It copies `WolframPhysics/` minus the
authoring `Documentation` to `build/WolframPhysics`, fills the Kernel
extension's `"Symbols"` list in the copy's `PacletInfo.wl` from the
`PackageExported` declarations under `Kernel/**/*.wl` (the click-to-copy on
the resource pages wraps documented code in `PacletSymbol` for exactly the
symbols declared there; the tracked `PacletInfo.wl` stays clean), and runs
`DocumentationBuild` over the tree with the paclet's link base, serially,
which also writes the search index. Every run is a full rebuild; it exits
non-zero naming any page that did not build.

`scripts/publish.wls` deploys that copy. Credentials are `WOLFRAM_CLOUD_USER`
and `WOLFRAM_CLOUD_PASSWORD`, from the environment or from the gitignored
`.env` (only those two keys are read from it), and they are optional: a kernel
that already holds a cloud login uses it. The account decides where the
resource lands, so every deploying script prints the account and the target it
will write to before writing, and the developer machine's cached login is
`nikm`, which is why the live resource is
`https://www.wolframcloud.com/obj/nikm/DeployedResources/Paclet/WolframInstitute/WolframPhysics`
and the site `https://www.wolframcloud.com/obj/nikm/WolframPhysics`. The
account is resolved at deploy time from `$CloudRootDirectory`, never hardcoded.
When the credentials are set and name a different account, the script
disconnects the kernel's login and connects as the configured account, and
says so. With `WP_PUBLISH_DRY_RUN=1` it connects, fills the categories,
rasterizes the hero image when the definition has a Hero Image section and
checks it against the resource system's size limits, scrapes the resource from
the definition notebook, lists the definition check's findings by level and prints
the resource and the location a deploy would write, then stops: nothing is
deployed. Without it, the scraped resource is deployed with
`Permissions -> "Public"` to
`<account>/DeployedResources/Paclet/WolframInstitute/WolframPhysics`, the
location the notebook's own Deploy button computes, and the script prints the
public URL. The deploy replaces whatever resource is live at that location, so
run the dry run first and read what it prints.

The scrape and the `CloudDeploy` run under a time limit, `WP_SCRAPE_TIMEOUT`
in seconds (default 3600), so a cloud call that never returns ends the run
with `$TimedOut` and a message instead of holding a CI pod open indefinitely;
a full deploy that legitimately runs longer raises it. Documentation files
upload as a delta against a private manifest in the account, so an unchanged
page is not re-uploaded, and the merge is in place, with no purge: the stock
deploy deletes the target directory before copying, which 404s every page for
the whole redeploy. `WP_UPLOAD_DELTA=0` re-uploads every documentation file
(the fix for a stale page or cloud-side drift), `WP_SKIP_PERMS=1` skips the
permissions pass, and `WP_SCRAPE_TOLERANT=1` lets the scrape through
Error-level definition-notebook findings; all three are read by
`scripts/deploy_common.wls`, which `publish.wls` loads. The deploy fixes
themselves live in
`scripts/deploy_common.wls`, each explained where it is defined and each
stating what breaks without it: `PacletTools` is loaded explicitly because a
headless `Needs` sequence never autoloads it and the file enumeration then
cascades into a run of messages; `StringTake::take` is switched off for the
run because DocumentationBuild's hyperlink rewrite takes the last character of
a possibly empty segment inside a Module-local no scoped `Quiet` can reach; the
categories grid is refilled from the resource system as above.

Publishing from a local checkout, in addition to the above:

- A display for the headless Front End. `docbuild.wls`, `publish.wls` and
  `scripts/build_site.wls local` drive DocumentationBuild through the Front
  End, which can crash on a desktop X display partway into the build. Use a
  virtual display (`Xvfb :99`, `DISPLAY=:99`) or `QT_QPA_PLATFORM=offscreen`,
  which is what CI uses and what the three scripts set on a Linux box with
  neither it nor `DISPLAY` set (`wpOffscreenFrontEnd` in
  `scripts/deploy_common.wls`).
- The right cloud account. `wolframscript` restores any cached personal cloud
  login. Without `WOLFRAM_CLOUD_USER` / `WOLFRAM_CLOUD_PASSWORD` the deploy goes
  to that account, which on the developer machine is the intended `nikm`; with
  them, the scripts act as the configured account. Put them in `.env`, which is
  gitignored, and load them with `set -a; . ./.env; set +a` (the file is plain
  `KEY=VALUE` lines, so without `set -a` the variables never reach the
  wolframscript child process). The `publish: connected as ...` and
  `publish: target ...` lines name the account and the upload target; check
  them before letting the run continue.

The installable archive is a separate path from the resource:
`scripts/build_paclet.wls` archives `WolframPhysics/` as it stands into
`dist/` (the built notebooks ship in it, and the Documentation Center builds
them on demand once installed), so run `./build_docs.sh` first: on a tree the
build has not written it packs nothing and stops. It prints
`PACLET=<path>` for `scripts/install_local.wls` (or a CI step) to pick up, and
`scripts/install_local.wls` builds that archive into a scratch directory,
uninstalls every installed copy of the paclet whatever its version, and
installs the archive, the inner loop for "I changed the paclet, reinstall it".
`WP_PACLET_OUT=<dir>` moves the archive (default `dist/`; older `.paclet`
files there are deleted first), and `WP_INSTALL_DRY_RUN=1` makes
`install_local.wls` build and verify the archive, print what it would
uninstall and install, and change nothing. Neither script needs the cloud or a
Front End, and neither runs a documentation build: `build_paclet.wls` packs the
notebooks the tree already holds, and refuses the tree, page by page and before
staging anything, when one is missing or older than its markdown (the
`wpRequireBuiltDocs` guard `docbuild.wls` also runs), so no archive can go out
with stale or absent documentation in it. `install_local.wls` builds through
`build_paclet.wls`, so the same guard applies to it. The CI check job builds the
notebooks, then packs the archive the same way and uploads it as the run's
artifact.

## Deploying from CI

Merges to `main` deploy automatically: the `Build Paclet` workflow
(`.github/workflows/build_paclet.yml`) runs a `check` job on every push to
`main` and every pull request against it, then the pod job on a push to `main`
(or a manual run).

The `check` job runs on the hosted runner, in order: the two Python gates
(`tools/dev/doc_symbols_check.py` and `tools/dev/doc_links_check.py`), then
`scripts/lint_docs.wls`, `scripts/run_tests.wls` and
`scripts/run_doc_examples.wls` in the Wolfram container
`wolframinstitute/wolfram:15.0`, then `./build_docs.sh` in the same container,
and finally `scripts/build_paclet.wls`, whose `.paclet` archive is uploaded as
the run's artifact. The notebook build is there because the notebooks are not
in git: without it the archive would carry no documentation, and a pull request
would never exercise the documentation build at all. Its checkout takes the
submodule for the converter, and it can be shallow. No pod, no publish.

The publish job runs `scripts/prime_ci.sh`, which provisions a Prime Intellect
CPU pod, runs `scripts/build_all.wls` on it in the same Wolfram image
(build_notebooks, docbuild, publish, `build_site site`), prints the deployed
URLs, and always tears the pod down: every exit path terminates the pod and
verifies with the Prime CLI that it is gone, because a pod that outlives its
run bills by the hour in silence, and the script exits non-zero when it
cannot verify that. The workflow's final step terminates the pod by name as
the backstop for a killed job. Hosted runners cap at a few vCPUs; the pod is
where the Wolfram work happens, and the runner stays a thin orchestrator. The
script is runnable from a checkout with the same environment, and its header
lists the pod knobs (`WP_VCPUS`, `WP_DISK`, `WP_IMAGE`, `WP_KEEP_POD`,
`WP_TEAM_ID`; `WP_POD_ATTEMPT` is the script's own retry counter, set when it
re-execs itself on a fresh pod, never set by hand); `WP_BUILD_ONLY` and
`WP_PUBLISH_DRY_RUN` are forwarded into the build container when set, so the
pod can be exercised without deploying (`DRYRUN` on its own is not forwarded:
`publish.wls` does not read it, so a `DRYRUN`-only run would deploy the
resource for real).

The workflow needs these repo secrets:

| Secret | Is |
| --- | --- |
| `PRIME_API_KEY` | the Prime Intellect API key (pod provisioning) |
| `PRIME_SSH_KEY` | the private SSH key registered with the Prime account |
| `WP_MATHPASS_B64` | the Wolfram licence, base64 of the `.mathpass` line; the containers run under it offline |
| `WOLFRAMSCRIPT_ENTITLEMENTID` | the on-demand entitlement, used as-is only when the mathpass secret is absent |
| `WOLFRAM_CLOUD_USER`, `WOLFRAM_CLOUD_PASSWORD` | the account the resource and the site are deployed under |

`WP_TEAM_ID` is a repository variable (not a secret): the Prime team whose
wallet funds the pod, set once with `gh variable set WP_TEAM_ID`; unset, the
Prime CLI bills the API key's personal account, and an unfunded one answers
every pod create with "Payment required". The mathpass is registered to one
MathID, the machine identity PureMath's CI mathpass carries (the `pmci`
hostname and machine-id the workflow and `scripts/prime_ci.sh` pin), so
`WP_MATHPASS_B64` must be that same mathpass and a new pin needs a new
mathpass.

Run `scripts/sync_ci_secrets.sh` to validate each of those (the Prime key and
the cloud login against the live services, the SSH key, mathpass and
entitlement locally) and push the valid ones from your local `.env`,
`.mathpass` and SSH key; `--check` validates without pushing, and `WP_REPO`
and `WP_SSH_KEY_FILE`
point it at another repository or key. Do this whenever a run fails on
credentials, and note why the script exists: an expired Prime key does not
announce itself. The `prime` CLI can exit 0 while printing an authorization
error where its JSON belongs, so a stale key reads as "no capacity" until
something checks the credential itself, and a mathpass past its date silently
degrades every container to on-demand licensing. The script checks each
credential first and keeps the secrets from drifting from the working local
copies.

## Caveats

When post-processing or debugging the built notebooks, do not round-trip
`ResourceDefinition.nb` through a bare kernel's `Get`/`Put`: `Get` returns the
expression with `$Failed` in embedded blobs, and `Put` writes that corruption
back. A cascade of `BaseDecode`/`BinaryDeserialize`/`TimeZoneConvert` messages
on `Get` is the signature of exactly this. Open the notebook through the Front
End instead (`NotebookOpen`/`NotebookGet`, edit, `NotebookPut`, under
`UsingFrontEnd`). Do not unit-test the resource scraper's internals in a bare
kernel either: CellID resolution needs a real notebook context, and the results
are garbage without one; the trustworthy check is a time-boxed run of the real
`` DefinitionNotebookClient`ScrapeResource `` on the Front-End-edited notebook,
which is what the dry run does. When a scrape misbehaves, read the scraper
source first (`ResourceSystemClient/Kernel/DefinitionNotebook/Scraping.m` and
`ResourceSystemClient/Kernel/Notebooks.m` in the Wolfram layout): one deduced
cell form plus one time-boxed verification beats trial and error.

Judge a deploy by the live artifacts, not the scripts' exit status: fetch the
docs site, the resource home page, and a documentation page, and confirm the
change that motivated the deploy. Agents deploying from a coding harness should
also read the
[`deploy-wolfram-physics`](.agent-skills/deploy-wolfram-physics/SKILL.md) skill.
