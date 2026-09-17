#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Install the paclet in WolframPhysics/ into this user's paclet repository, replacing whatever
   copy is installed there, and say what was done. The inner loop for "I changed the paclet,
   reinstall it" with no cloud and no documentation build.
   Ported from PureMath's scripts/install_local.wls.

   Steps, each printed as it happens:
     1. archive: run scripts/build_paclet.wls in a subprocess with WP_PACLET_OUT set to a scratch
        directory, so the installed paclet is exactly the verified archive that script defines
        (one definition of what ships), and take the archive path from its PACLET= line;
     2. uninstall: every installed WolframInstitute/WolframPhysics under $UserBasePacletsDirectory,
        whatever its version. A leftover copy at a higher version would keep winning over the one
        installed now, since the PacletManager resolves a name to its highest version (the header
        of scripts/run_tests.wls describes the trap); copies loaded from a directory with
        PacletDirectoryLoad are not installed copies and are left alone;
     3. install: PacletInstall the archive with ForceVersionInstall -> True (a same-version copy
        whose uninstall failed is overwritten rather than kept), then print the name, version and
        location of the result and every copy the PacletManager now knows.

   Usage:
     wolframscript -file scripts/install_local.wls

   Knobs:
     WP_INSTALL_DRY_RUN=1   build and verify the archive in the scratch directory, then print what
                            would be uninstalled and installed without touching the paclet
                            repository.

   Prerequisites: wolframscript on PATH (step 1 runs it), and the documentation notebooks
   (./build_docs.sh). Step 1 builds none: the notebooks are build output and are not tracked in git,
   and scripts/build_paclet.wls refuses a tree where a page is missing or older than its markdown
   rather than installing a paclet with no documentation in it.

   Exit status: 0 when the paclet is installed (or, in a dry run, when the archive built); 1 when the
   archive could not be built (which includes a tree the documentation build has not written) or
   PacletInstall failed. *)

repoRoot = ParentDirectory[DirectoryName[$InputFileName]]

pacletName = "WolframInstitute/WolframPhysics"

dryRun = Environment["WP_INSTALL_DRY_RUN"] === "1"

say[args___] := Print["install_local: ", args]

If[ dryRun, say["WP_INSTALL_DRY_RUN=1: nothing under ", $UserBasePacletsDirectory, " will change"]]

(* 1. archive *)
scratch = CreateDirectory[]
say["archiving WolframPhysics/ into ", scratch]
build = RunProcess[
    {"wolframscript", "-file", FileNameJoin[{repoRoot, "scripts", "build_paclet.wls"}]},
    ProcessEnvironment -> Join[Association @ GetEnvironment[], <|"WP_PACLET_OUT" -> scratch|>]
]
Print[StringTrim[build["StandardOutput"]]]
archive = First[StringCases[build["StandardOutput"], StartOfLine ~~ "PACLET=" ~~ path : (Except["\n"] ..) ~~ EndOfLine :> path], None]
If[ build["ExitCode"] =!= 0 || ! StringQ[archive] || ! FileExistsQ[archive],
    say["build_paclet.wls failed (exit ", build["ExitCode"], ")"];
    If[ build["StandardError"] =!= "", Print[StringTrim[build["StandardError"]]]];
    Quiet @ DeleteDirectory[scratch, DeleteContents -> True];
    Exit[1]
]

(* 2. uninstall *)
repository = ExpandFileName[$UserBasePacletsDirectory]
installed = Select[PacletFind[pacletName], StringStartsQ[ExpandFileName[#["Location"]], repository] &]
If[ installed === {},
    say["no installed copy of ", pacletName, " under ", repository],
    Do[
        If[ dryRun,
            say["would uninstall ", p["Name"], " ", p["Version"], " at ", p["Location"]],
            say["uninstalling ", p["Name"], " ", p["Version"], " at ", p["Location"]];
            If[ PacletUninstall[p] === $Failed,
                say["  WARNING: PacletUninstall failed; ForceVersionInstall will overwrite a same-version copy, a higher version stays and shadows"]
            ]
        ],
        {p, installed}
    ]
]

(* 3. install *)
If[ dryRun,
    say["would install ", FileNameTake[archive], " (", pacletName, " ", PacletObject[File[archive]]["Version"], ") into ", repository];
    Quiet @ DeleteDirectory[scratch, DeleteContents -> True];
    Exit[0]
]

say["installing ", FileNameTake[archive], " into ", repository]
result = PacletInstall[archive, ForceVersionInstall -> True]
Quiet @ DeleteDirectory[scratch, DeleteContents -> True]

If[ ! MatchQ[result, _PacletObject],
    say["PacletInstall failed: ", result];
    Exit[1]
]

say["installed ", result["Name"], " ", result["Version"], " at ", result["Location"]]
say["every copy the PacletManager now knows:"]
Scan[Print["    ", #["Version"], "  ", #["Location"]] &, PacletFind[pacletName]]
Exit[0]
