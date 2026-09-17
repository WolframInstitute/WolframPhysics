#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Archive the paclet: WolframPhysics/ -> dist/WolframInstitute__WolframPhysics-<version>.paclet,
   the installable artifact: what scripts/install_local.wls installs, and what the check job of
   .github/workflows/build_paclet.yml packs and uploads as the run's build artifact. Cloud-free,
   and builds nothing.
   Ported from PureMath's scripts/build_paclet.wls.

   WolframPhysics/ IS the paclet: PacletInfo.wl, Kernel/, Tests/, the documentation notebooks that
   scripts/build_notebooks.wls writes under Documentation/English (build artifacts, not in git; the
   Documentation Center builds them on demand once installed) and ResourceDefinition.nb. So this
   script packs the source directory as it stands, then verifies the archive it wrote. It builds
   nothing, so run ./build_docs.sh first: on a checkout the build has not written, the archive
   would go out with no documentation in it. That is not left to the reader: the same guard
   scripts/docbuild.wls runs, wpRequireBuiltDocs in scripts/deploy_common.wls (Get here for that one
   helper; it loads no package and opens no connection), requires that every source under docs/en,
   and docs/ResourceDefinition.md, has its notebook under Documentation/English and that the build
   manifest beside the notebooks records the current build key for it, before anything is staged.

   Usage:
     wolframscript -file scripts/build_paclet.wls

   Knobs:
     WP_PACLET_OUT=<dir>   where the archive lands (default <repo>/dist, gitignored). Any older
                           .paclet there is deleted first, so a rerun replaces rather than accumulates.

   Prints what it packed (file counts by kind) and one machine-readable line, PACLET=<path>, for
   scripts/install_local.wls (or a CI step) to pick the file up.

   Exit status: 0 when the archive was written and verified; 1 otherwise, which includes a
   documentation tree the build has not written or has not kept up with docs/en, named page by page
   by the guard before anything is staged (run ./build_docs.sh). *)

repoRoot = ParentDirectory[DirectoryName[$InputFileName]]

pacletDir = FileNameJoin[{repoRoot, "WolframPhysics"}]

outDir = With[{e = Environment["WP_PACLET_OUT"]},
    If[StringQ[e] && e =!= "", ExpandFileName[e], FileNameJoin[{repoRoot, "dist"}]]]

If[ ! DirectoryQ[pacletDir],
    Print["build_paclet: no paclet directory at ", pacletDir];
    Exit[1]
]

paclet = PacletObject[File[pacletDir]]
If[ ! MatchQ[paclet, _PacletObject],
    Print["build_paclet: ", pacletDir, " is not a paclet directory (no readable PacletInfo.wl)"];
    Exit[1]
]

(* The documentation notebooks are build output and are not tracked in git, so the tree about to be
   packed is whatever the last ./build_docs.sh on this machine wrote. Require that it is the build's
   and current with the markdown under docs/en before staging anything; the helper names the pages
   and says what to run. *)
Get[FileNameJoin[{repoRoot, "scripts", "deploy_common.wls"}]]
If[ ! wpRequireBuiltDocs[repoRoot, "build_paclet: "],
    Exit[1]
]

(* What ships is every regular file under WolframPhysics/ except transient state that tools leave
   in the tree, which CreatePacletArchive would otherwise pack (it skips .DS_Store alone, and packs
   every other dotfile): dotfiles and dot-directories anywhere (the stamp and manifest a doc build
   leaves under Documentation/English) and the DocumentationBuild index directories (SearchIndex,
   SpellIndex, Index under Documentation/<Language>), which an in-place documentation build writes
   and the Documentation Center regenerates on demand. The paclet is staged into a scratch copy
   without them and the archive is made from that copy. FileNames["*", ...] lists dotfiles too, so
   the filter names both. *)
indexDirs = {"SearchIndex", "SpellIndex", "Index"}

shipQ[item_String, relative_String] := ! Or[
    StringStartsQ[FileNameTake[item], "."],
    DirectoryQ[item] && MatchQ[FileNameSplit[relative], {"Documentation", _, Alternatives @@ indexDirs}]
]

stage[src_String, dst_String, relative_String : ""] := (
    CreateDirectory[dst, CreateIntermediateDirectories -> True];
    Do[
        With[{name = FileNameTake[item]},
            With[{rel = If[relative === "", name, relative <> "/" <> name], to = FileNameJoin[{dst, name}]},
                Which[
                    ! shipQ[item, rel], Null,
                    DirectoryQ[item], stage[item, to, rel],
                    True, CopyFile[item, to]
                ]
            ]
        ],
        {item, FileNames["*", src]}
    ]
)

scratch = CreateDirectory[]
staged = FileNameJoin[{scratch, "WolframPhysics"}]
stage[pacletDir, staged]

(* the paths the archive must hold, relative to the paclet root *)
stagedFiles = Sort[StringDrop[#, StringLength[staged] + 1] & /@ Select[FileNames["*", staged, Infinity], ! DirectoryQ[#] &]]

countOf[pattern_] := Count[stagedFiles, s_ /; StringMatchQ[s, pattern]]
Print["build_paclet: ", paclet["Name"], " ", paclet["Version"], " from ", pacletDir]
Print["  ", countOf["Kernel/" ~~ ___ ~~ ".wl"], " kernel file(s), ",
    countOf["Tests/" ~~ ___ ~~ ".wlt"], " test file(s), ",
    countOf["Documentation/" ~~ ___ ~~ ".nb"], " documentation notebook(s), ",
    Length[stagedFiles], " files in all"]
If[ countOf["Documentation/" ~~ ___ ~~ ".nb"] === 0,
    Print["  WARNING: no documentation notebook under ", FileNameJoin[{pacletDir, "Documentation"}],
        "; run ./build_docs.sh to build them from docs/en before shipping"]
]

If[ ! DirectoryQ[outDir], CreateDirectory[outDir, CreateIntermediateDirectories -> True]]
Scan[DeleteFile, FileNames["*.paclet", outDir]]

archive = CreatePacletArchive[staged, outDir]
Quiet @ DeleteDirectory[scratch, DeleteContents -> True]
If[ ! StringQ[archive] || ! FileExistsQ[archive],
    Print["build_paclet: CreatePacletArchive failed: ", archive];
    Exit[1]
]

(* Verify the archive: it reads back as the same paclet, and its entries (a .paclet is a zip whose
   entries sit under one <Publisher>__<Name>-<version>/ directory) are exactly the staged files. *)
back = Quiet @ PacletObject[File[archive]]
If[ ! MatchQ[back, _PacletObject] || back["Name"] =!= paclet["Name"] || back["Version"] =!= paclet["Version"],
    Print["build_paclet: ", archive, " does not read back as ", paclet["Name"], " ", paclet["Version"], ": ", back];
    Exit[1]
]

entries = Quiet @ Import[archive, {"ZIP", "FileNames"}]
If[ ! MatchQ[entries, {__String}],
    Print["build_paclet: cannot list the entries of ", archive, ": ", entries];
    Exit[1]
]
archived = Sort[Select[FileNameDrop[#, 1] & /@ entries, # =!= "" &]]
If[ archived =!= stagedFiles,
    Print["build_paclet: the archive's entries differ from the staged paclet"];
    Print["  missing from the archive: ", Complement[stagedFiles, archived]];
    Print["  unexpected in the archive: ", Complement[archived, stagedFiles]];
    Exit[1]
]

sizeOf[bytes_] := If[ bytes < 10^6,
    ToString[NumberForm[bytes/1000., {Infinity, 1}]] <> " kB",
    ToString[NumberForm[bytes/10.^6, {Infinity, 1}]] <> " MB"]

Print["build_paclet: ", back["Name"], " ", back["Version"],
    " -> ", FileNameTake[archive], " (", sizeOf[FileByteCount[archive]], ", ",
    Length[archived], " entries verified)"]
Print["PACLET=", archive]
Exit[0]
