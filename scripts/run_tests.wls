#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Run the WolframInstitute`WolframPhysics` .wlt test files and report to stdout.
   Ported from PureMath's scripts/run_tests.wls.

   Usage:
     wolframscript -file scripts/run_tests.wls                              every .wlt under WolframPhysics/Tests
     wolframscript -file scripts/run_tests.wls WolframPhysics/Tests/A.wlt   only the named files; a directory argument
                                                                            selects every .wlt beneath it (paths are
                                                                            relative to the current directory, or absolute)

   Prints one line per file (ok or FAIL with the pass count and the time, then the details of
   every failed test) and an overall summary. No knobs.

   Exit status: 0 when every test passed; 1 when a test failed, a file ran no test at all (a
   syntax error aborts TestReport with an empty report, which must not read as a pass), an
   argument named nothing, or no test file was found.

   The paclet is loaded from WolframPhysics/ and nowhere else. PacletDirectoryLoad on a wider
   directory (the repository root, say) discovers every paclet up to two levels beneath it, and
   Needs then takes the highest version among all copies the PacletManager knows, whether or not
   that is the copy being tested: a stale duplicate (an old worktree, a sibling copy at a bumped
   version, an installed copy newer than the tree) wins silently and a just-edited file fails with
   its new symbols landing in Global`. So this script loads only the paclet directory, makes it the
   working directory so a test file's own PacletDirectoryLoad[Directory[]] resolves to the same
   place, and refuses to run when WolframInstitute/WolframPhysics still resolves elsewhere, naming
   every copy it found so the stale one can be removed (scripts/install_local.wls replaces an
   installed copy) or the version in WolframPhysics/PacletInfo.wl bumped past it. *)

repoRoot = ParentDirectory[DirectoryName[$InputFileName]]

pacletDir = FileNameJoin[{repoRoot, "WolframPhysics"}]

pacletName = "WolframInstitute/WolframPhysics"

testsDir = FileNameJoin[{pacletDir, "Tests"}]

(* symlink-free absolute path, so two spellings of one directory compare equal *)
canonical[path_String] := With[{abs = AbsoluteFileName[path]}, If[StringQ[abs], abs, ExpandFileName[path]]]

(* a file under the paclet directory is reported relative to it (Tests/X.wlt); any other in full *)
label[file_String] := With[{prefix = canonical[pacletDir] <> "/"},
    If[StringStartsQ[file, prefix], StringDrop[file, StringLength[prefix]], file]]

(* Resolve the arguments against the caller's directory BEFORE the paclet directory becomes the
   working directory. *)
expandArg[arg_String] := Which[
    DirectoryQ[arg], canonical /@ FileNames["*.wlt", arg, Infinity],
    FileExistsQ[arg], {canonical[arg]},
    True, Print["run_tests: no such file or directory: ", arg]; Exit[1]
]

testFiles = If[ Length[$ScriptCommandLine] > 1,
    Flatten[expandArg /@ Rest[$ScriptCommandLine]],
    canonical /@ FileNames["*.wlt", testsDir, Infinity]
]

If[ testFiles === {},
    Print["run_tests: no .wlt files found under ", If[Length[$ScriptCommandLine] > 1, "the given paths", testsDir]];
    Exit[1]
]

(* Scope the load to the paclet directory and prove it took: see the header. *)
PacletDirectoryLoad[pacletDir]

resolved = PacletObject[pacletName]

If[ ! MatchQ[resolved, _PacletObject],
    Print["run_tests: ", pacletDir, " does not load as ", pacletName, " (no readable PacletInfo.wl?)"];
    Exit[1]
]

If[ canonical[resolved["Location"]] =!= canonical[pacletDir],
    Print["run_tests: ", pacletName, " resolves to ", resolved["Location"], " (", resolved["Version"], "), not to ", pacletDir];
    Print["  every copy the PacletManager knows:"];
    Scan[Print["    ", #["Version"], "  ", #["Location"]] &, PacletFind[pacletName]];
    Print["  remove the stale copy (scripts/install_local.wls replaces an installed one) or bump the version in WolframPhysics/PacletInfo.wl"];
    Exit[1]
]

SetDirectory[pacletDir]

Print["run_tests: ", pacletName, " ", resolved["Version"], " from ", pacletDir]

(* Each .wlt file is self-contained (it loads the paclet at the top), but all files run on this
   one kernel, so a top-level binding a file leaves in Global` (g = ..., say) would leak into a
   later file and can falsely fail a test that uses the same short name as a free symbol. Clearing
   the test-created Global` symbols before each file isolates them, one-kernel-per-file behavior
   without the cost of a kernel per file. The harness's own Global` symbols (captured once every
   symbol used by runOne exists) are preserved: clearing them would delete runOne itself mid-run.
   runOne returns {file, passed, failed, failure details, seconds}; a file whose report holds no
   test at all, or that yields no report, counts as one failure (see the header). *)
runOne[file_] := Block[{report, pass, fail, failed, seconds},
    Quiet[Clear @@ Complement[Names["Global`*"], $harnessGlobalSymbols]];
    report = TestReport[file];
    If[ ! MatchQ[report, _TestReportObject],
        {file, 0, 1, {{"(TestReport returned " <> ToString[report] <> ")", Null, Null, {}, {}}}, 0.},
        pass = report["TestsSucceededCount"];
        fail = report["TestsFailedCount"];
        seconds = QuantityMagnitude[report["TimeElapsed"], "Seconds"];
        failed = Cases[
            Values[report["TestResults"]],
            result_ /; result["Outcome"] =!= "Success" :>
                result /@ {"TestID", "ActualOutput", "ExpectedOutput", "ActualMessages", "ExpectedMessages"}
        ];
        If[ pass + fail === 0,
            {file, 0, 1, {{"(no test ran; a syntax error in the file?)", Null, Null, {}, {}}}, seconds},
            {file, pass, fail, failed, seconds}
        ]
    ]
]

(* a test result's outputs and messages come wrapped in HoldForm, which InputForm would show *)
shown[HoldForm[x_]] := ToString[Unevaluated[x], InputForm]
shown[x_] := ToString[x, InputForm]

$harnessGlobalSymbols = Names["Global`*"];

results = Map[
    Function[file,
        With[{r = runOne[file]},
            Print[
                If[r[[3]] === 0, "  ok    ", "  FAIL  "],
                label[file], "  (", r[[2]], "/", r[[2]] + r[[3]], ", ", ToString[NumberForm[N[r[[5]]], {Infinity, 2}]], " s)"
            ];
            Scan[
                failure |-> Print[
                    "          failed: ", failure[[1]],
                    "\n          actual: ", shown[failure[[2]]],
                    "\n        expected: ", shown[failure[[3]]],
                    "\n         messages: ", shown[failure[[4]]],
                    "\n expected messages: ", shown[failure[[5]]]
                ],
                r[[4]]
            ];
            r
        ]
    ],
    testFiles
]

{totalPass, totalFail} = {Total[#[[2]] & /@ results], Total[#[[3]] & /@ results]}

Print[""]
Print[
    If[totalFail === 0, "PASS", "FAIL"],
    "  ", totalPass, "/", totalPass + totalFail,
    " tests passed across ", Length[testFiles], " file(s)"
]

Exit[If[totalFail === 0, 0, 1]]
