---
name: functions-library-ingest
description: "Survey an external source of Wolfram Physics functions (a Wolfram Function Repository keyword or author, a published paclet such as SetReplace or WolframInstitute/Hypergraph, a Wolfram Community post series, a GitHub repository, a paper with code, a section of wolframphysics.org) and turn it into a research report under `docs/research/<Source>.md` plus vetted guide entries: capture the full inventory locally, triage away the plumbing and the too-niche entries, gate every candidate against what the guides already list and against WL built-ins by functionality, and land the survivors on the right guide page as tagged links, `(WL)` chips or proposed WolframPhysics symbols, each traceable to its source. Use whenever the user points at a function list, a repository, a paclet, a post series or a paper and asks what belongs in the guide, asks to ingest or survey a source's functions, or wants a source's coverage compared against what the paclet already indexes."
---

# Ingesting an external source of functions

This skill turns an external source's function inventory into two things: a research
report under `docs/research/<Source>.md`, and guide-page entries. It sits in front of
[wolfram-guide-page](../wolfram-guide-page/SKILL.md) (whose format and survey rules
govern the edits it makes) and hands off to
[implement-wolfram-functions](../implement-wolfram-functions/SKILL.md) when the user
asks for kernel code for a symbol the survey proposes.

This paclet indexes the Wolfram Physics ecosystem before it implements any of it, so
the survey's main product is the map: which function lives where, what it computes,
which of several implementations of the same thing is the one to link, and what the
kernel already provides. A proposed WolframPhysics symbol is the rare output, reserved
for a capability nothing in the ecosystem or the kernel provides well. Budget the
effort accordingly: capture cheaply, gate rigorously, and expect most of a mature
source's core to be already covered by a built-in under another name or by an entry
already on a guide.

The research directory is shared. `docs/research/` is flat, one `.md` per source,
and other processes write there too. Never overwrite a report you did not write:
extend it with a dated section, and say in your summary which report you touched.

## Step 1: capture the inventory locally

Never page a large index through context. Fetch the source once into a file under your
scratch directory, and parse that file with a small script into a structured inventory
of `(name, kind, where, link, description)` tuples, the description one line. Probe the
entry format on a few known functions first. Per source kind:

- Function Repository. From a scratch `.wls` run with `wolframscript -file`,
  `ResourceSearch[{"Name" -> "<Stem>*", "ResourceType" -> "Function"}]` returns a
  `Dataset` of the matching function resources, each row carrying `"Name"`,
  `"Description"`, `"DocumentationLink"` and the `ResourceObject`; a free-text
  `ResourceSearch["<keyword>"]` returns resources of every type, so filter its
  `"ResourceType"`. The link is
  `https://resources.wolframcloud.com/FunctionRepository/resources/<Name>/`, and the
  function's usage is on that page. Sweep the obvious stems (`WolframModel*`,
  `Multiway*`, `Hypergraph*`, `Causal*`, `Branchial*`, `Rulial*`) as well as the
  keyword, since a search by keyword misses functions whose description does not use
  it, and a search by name misses the ones named for something else.
- A published paclet. `PacletFind` / `PacletInstall` it from a scratch `.wls`, then
  read its exported names (`` Names["<Context>`*"] `` after `Needs`) and their usage
  messages; or read its `Kernel/` sources and documentation in the repository. The link
  is the function's page on the Paclet Repository, or under the deployed resource for a
  paclet published as a cloud resource, or the repository page for a paclet with no
  published reference pages. Record the paclet's version and where it is installed
  from.
- A Wolfram Community series or a wolframphysics.org section. Fetch each post or page
  to a file; the inventory is the functions the posts define or use, the notebook or
  repository they point at, and the post URL.
- A GitHub repository. Read its package sources and README; the inventory is its
  exported symbols and the file that defines each.
- A paper. The inventory is the functions or code the paper names and links (a
  supplementary notebook, a repository); the paper itself is a source of definitions
  and of test oracles (a table of counts), not of guide entries.

Two summaries drive everything after: the list of core entries (the functions a reader
of the guide would reach for) and the per-module or per-post counts. A module's size
and name usually classify it faster than reading its members.

## Step 2: triage the entries

Sort each entry into one of four bins, and keep the bins; they are half the final
report:

- Core: the objects, constructions, evolutions, graphs, identities and visualizations
  a working reader reaches for, together with the field's common exploration tools.
  These proceed to the gate.
- Too computer-y (drop, but list): engine knobs and algorithm variants, IO and
  typesetting helpers, caching and session plumbing, teaching and test scaffolding,
  language plumbing. The tell: the entry is about how to compute, not what.
- Too niche for now (drop, but list): real content whose weight or audience does not
  yet justify a guide line: a one-off analysis from a single post, a helper only its
  own notebook uses, where a smaller atom may still be worth listing.
- Belongs elsewhere: a function whose home is another guide's topic (once more than
  one guide exists) or another repository entirely. Flag it in the report rather than
  landing it silently.

## Step 3: the double gate

Gate every surviving candidate twice, the guides first:

1. What the guides already list, and what the paclet exports. Grep every
   `docs/en/Guides/**/*.md` for the name and the link, read the research reports of
   the other sources for the same capability under another name, and grep the
   `PackageExported` lines under `WolframPhysics/Kernel/` (none yet). Match by what the
   entry computes, not what either side calls it. A hit may still leave a gap worth
   noting when the existing entry's scope is narrower; record that instead of adding
   a duplicate line. Where two sources provide the same capability (a resource
   function and a paclet symbol that both evolve a Wolfram model), decide which is
   canonical for the guide's headline entry (the maintained one, the one with
   reference pages, the one the project itself points at) and record the verdict; the
   other may sit in a tail or be cross-listed where its convention differs.
2. WL built-ins by functionality, under any name, in the same kernel the tests run on
   (WL 15.0 here). Probe stems, not just the intended name:
   `` Names["System`*Graph*"] ``-style sweeps plus a direct
   `` Names["System`<Name>"] `` check for each candidate, from a scratch `.wls` run
   with `wolframscript -file`, and record the `$VersionNumber` you verified on. A
   built-in that does the job is a `(WL)` chip on the guide, not a link to the
   external function; a near-match becomes a `(WL)` chip beside the external entry
   with the one-line stated difference in the report.

## Step 4: names and links

An external entry keeps the name its source gives it: the guide links to a real page,
and the link text is that page's own name (`WolframModel`, `HGEvolve`, `Hypergraph`).
The naming rules of [GUIDE.md](../../GUIDE.md) (*Never abbreviate*, *A name must say
what the object is*) apply only when the survey proposes a WolframPhysics symbol; then
name the object, not the source's spelling, and record the source's name as an
`<!-- ALT: ... -->` tag on the guide bullet for the reviewer. Watch for a proposed
name that collides with an established System meaning.

Every link is verified before it is written down: fetch it once (a `curl -sI` status
line, or `URLRead[url]["StatusCode"]` from a scratch `.wls`) and confirm the page it
lands on names the function. A Function Repository URL that redirects to the search
page, a ref page for a symbol the paclet renamed, or a moved Community post is a
mislabeled entry. Record the date the links were checked in the report.

## Step 5: write the report

The report is `docs/research/<source>.md`, named for the source in lowercase with
hyphens, the way the existing reports are (`built-in-wolfram-language.md`,
`paclet-repository-and-paclets.md`; a new one might be
`function-repository-wolfram-models.md`, `setreplace.md`,
`wolfram-community-multiway-posts.md`), in house style (`scripts/lint_docs.wls` covers
`docs/research`). Its shape follows the existing reports, with the ingest's verdict
sections added:

```
# <Source>: functions surveyed

<one paragraph: what was surveyed, its version, the date fetched, the kernel
 ($VersionNumber) the built-in gate ran on, and the date the links were checked>

## Summary of what exists

<the headline findings, a few bullets>

## Method

### <one subsection per tool: kernel evaluations, pages fetched, repository reads>

## Findings

### <one subsection per module, paclet or post series>

| Name | Kind | Source | URL | Description | Verdict |
|---|---|---|---|---|---|
| WolframModel | function | Function Repository | https://… | Generate evolutions of Wolfram model systems | guide: Hypergraph rewriting |

## Landed on the guides

<entry -> guide and section, with the tag and the one-line description used>

## Already covered

<source name -> the existing entry, `(WL)` chip or exported symbol that covers it,
 so the next surveyor does not redo the gate>

## Excluded

<the too-computer-y and too-niche bins, named>

## Belongs elsewhere

<flagged candidates and where they belong>

## Proposed WolframPhysics symbols

<source name -> proposed name, the capability nothing else provides, the gate
 evidence with its $VersionNumber, and the ALT names>

## Gaps

<what the survey could not settle: a page that would not fetch, a symbol known
 only by name, a paclet that would not install>
```

Verdicts are one of: `guide: <Section>` (landed), `covered: <entry>`,
`excluded: computer-y`, `excluded: niche`, `elsewhere: <where>`, `proposed: <Name>`,
`unconfirmed` (seen by name only; never landed). A guide never cites the report; the
report is the reviewer's trail and the next surveyor's starting point.

## Step 6: land the entries on the guides

Place each survivor on the guide of its topic, following the `wolfram-guide-page`
skill's placement and format rules: section order fundamentals-first, the tagged-link
form for an external function with the tag the report records, `(WL)` chips for the
built-ins the survey surfaced, one-line descriptions, chips and links in separate tail
bullets, ALT tags on proposed symbols, and the abstract, `Description` and `Keywords`
updated when a section is new. Cross-list existing entries the new section leans on
rather than re-adding them. Then run, from the repository root,
`wolframscript -file scripts/lint_docs.wls` (it covers `.agent-skills`, `docs/en` and
`docs/research`) and `python3 tools/dev/doc_symbols_check.py`; a clean run of both is
part of done.

## Step 7: report with traceability

The final summary carries the report's lists in short form, each entry traceable to
its source function:

- Landed: source name -> guide and section, with the tag.
- Already covered: source name -> existing entry, so the next surveyor does not redo
  the gate.
- Excluded: the computer-y and too-niche bins, named; the user asked what was left
  out, and the bins are the answer.
- Flagged: candidates parked for another guide or repository.
- Proposed: source name -> proposed WolframPhysics name, with the gate evidence.

If the user then asks to implement a proposed symbol, continue with
`implement-wolfram-functions`; the survey's scope decisions become the usage messages'
supported-cases lines, and the source's documented values (a state count at a step, a
causal graph's edge count from the paper's table) become test oracles.
