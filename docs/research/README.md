# Research directory

Index of docs/research: the research reports behind the WolframInstitute/WolframPhysics guide page, the inventory built from them, and how to re-run the pipeline. Date: 2026-09-17.

## Research files

One report per source. The row count is the number of records the normalization step extracted from the file's tables.

| File | Scope | Rows |
|---|---|---|
| built-in-wolfram-language.md | System context of Wolfram Language 15.0: the built-in rewriting, graph, geometry, relativity, quantum, group and tree functions the project relies on, each confirmed in the kernel. | 715 |
| cloud-program-files.md | Wolfram Language program files (.wl cloud objects) loaded by the technical introduction, the bulletins, the writings and Community posts, with the definitions each file carries. | 547 |
| function-repository-by-contributor.md | Wolfram Function Repository swept by contributor: the Physics Project function guide pages, the Wolfram Physics Project category and every physics-adjacent contributor. | 353 |
| function-repository-by-keyword.md | Wolfram Function Repository swept by keyword, category page, kernel ResourceSearch and WolframLanguageContext, with obsolete notices recorded. | 529 |
| github-and-source-code.md | GitHub sweep of maxitg/SetReplace, the WolframInstitute organization, WolframResearch and individual authors, with symbols confirmed against source files and the local kernel. | 184 |
| nikm-cloud-deployed-functions.md | Resource functions and paclets deployed under the nikm Wolfram Cloud account, checked with ResourceObject in a cloud-connected kernel. | 115 |
| paclet-repository-and-paclets.md | Wolfram Language Paclet Repository (260 paclets), the paclet server and GitHub paclets: every symbol of the paclets usable for Wolfram Physics work, seen on reference pages or in the kernel. | 859 |
| puremath-paclet-modules.md | WolframInstitute/PureMath kernel modules (GitHub main, installed 0.4.5 and the nikm cloud deployment), one table per relevant module with every exported symbol. | 1108 |
| round-2-named-gaps.md | Critic follow-up round: the functions a critic named as existing but unlisted (ZX-calculus symbols, nikm cloud resources, six PureMath kernel files, IdentityHypermatrix) and further nikm directory entries. | 259 |
| stephen-wolfram-writings-pre-2020.md | writings.stephenwolfram.com posts of 2015 to 2019: the cellular automaton, theorem-proving and axiom-system functions that seed the project. | 180 |
| stephen-wolfram-writings.md | writings.stephenwolfram.com posts of 2020 to 2026, the four Physics Project bulletins and the technical introduction: every function used in evaluated inputs. | 861 |
| summer-school-and-papers.md | Wolfram Summer School and Winter School physics-track projects (2019 to 2026) and the project's technical papers: the functions, paclets and repositories they use or cite. | 259 |
| wolfram-community.md | Wolfram Community posts (Discourse ruliology tag and legacy Physics Project group): functions defined in post code and the repository and paclet functions the posts rely on. | 1532 |
| wolfram-institute.md | Wolfram Institute website, GitHub organization, Paclet Repository publisher, nikm cloud resources, fellows' Function Repository contributions and arXiv papers. | 746 |
| wolframphysics-archives-notebooks.md | Working-material notebooks listed at wolframphysics.org/archives (1198 of 1649 read): every function, paclet symbol, cloud resource and recurring helper seen in them; cut off mid-way through a rate-limited bulk download and unverified. | 610 |
| wolframphysics-org-site.md | wolframphysics.org and the cloud objects it links to (function guide pages, hands-on notebook, Registry of Notable Universe Models), the bulletins via the Wayback Machine and the two Gorard launch papers. | 492 |

## Inventory

function-inventory.md is the master inventory: the 9349 records of the sixteen files merged by (name, source) into 6253 rows, one table per guide section (core first, then secondary, then omit, then by name), a final table of what is not for the guide, and a Sources table with the count each research file contributed.

## Method

1. Finder per source: one agent per source swept it (web fetch, GitHub API, cloud objects, installed paclets, kernel Names and usage messages) and wrote one research file with a Method section listing every URL, query and evaluation it ran, and Findings tables in which every row was seen in a fetched page, file or kernel evaluation.
2. Verifier per file: a second agent re-checked each file's rows by evaluation and fetch, marked what it could not confirm as unconfirmed, and recorded corrections in the file.
3. Critic: one critic round read the set, named gaps and doubtful rows, and follow-up finders wrote round-2-named-gaps.md and the later sweeps (nikm cloud, cloud program files, PureMath modules, pre-2020 writings, archive notebooks).
4. Normalize: every table row of every file was rewritten as a JSON record with the keys name, kind, source, url, description, section, tier, status and note (one JSON array per file, under the session scratchpad's inventory directory).
5. Inventory: scratchpad/build_inventory.py merged the records by (name, source), keeping the longest description, the strongest tier, the most specific section, the status unconfirmed only when every record says so and the union of notes, and wrote function-inventory.md and this README.

The archives report was cut off mid-way through a rate-limited bulk download of the notebooks and stands unverified; every other file went through the verifier.

## Re-running

1. Finder per source: run one finder per source with the same scope line as above; it writes docs/research/STEM.md (STEM names the source) with a dated Method section and Findings tables.
2. Verifier per file: run the verifier on each research file; it evaluates and fetches every row and edits the file's Status and Corrections.
3. Critic: run the critic over docs/research; give each named gap to a follow-up finder.
4. Normalize: rewrite each file's tables as STEM.json under the scratchpad inventory directory with the nine keys.
5. Inventory: python3 scratchpad/build_inventory.py, then wolframscript -file scripts/lint_docs.wls from the repository root, and fix every finding under docs/research.

House rules for every markdown file here, enforced by scripts/lint_docs.wls: a code span whose content contains a backtick uses double-backtick delimiters with a space inside each end and stays on one line; no em dashes and no double hyphens as dashes; no bold for emphasis; no box-drawing characters or decorative arrows; no dollar sign in prose outside a code span; and no invented function, every row traces to a research file.
