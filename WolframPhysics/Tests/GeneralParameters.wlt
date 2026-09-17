(* ::Package:: *)

(* Tests for GeneralParameters.wl (the paclet-level parameters): the paclet loads, its context
   exists, and the version association agrees with PacletInfo.wl.
   Run with: TestReport["Tests/GeneralParameters.wlt"] from WolframPhysics/, or
   wolframscript -file scripts/run_tests.wls from the repository root. *)

(* The file is self-contained: it registers the paclet from whichever directory it is run in,
   the paclet directory itself or the repository root above it. Registering a directory twice
   is harmless, so the runner's own PacletDirectoryLoad does not conflict with this one. *)
Scan[
	PacletDirectoryLoad,
	Select[
		{Directory[], FileNameJoin[{Directory[], "WolframPhysics"}]},
		FileExistsQ[FileNameJoin[{#, "PacletInfo.wl"}]] &
	]
]

Needs["WolframInstitute`WolframPhysics`"]

VerificationTest[
	MemberQ[$Packages, "WolframInstitute`WolframPhysics`"],
	True,
	TestID -> "Paclet-loads-and-context-exists"
]

VerificationTest[
	MatchQ[PacletObject["WolframInstitute/WolframPhysics"], _PacletObject],
	True,
	TestID -> "Paclet-is-registered"
]

VerificationTest[
	MatchQ[$WolframInstituteWolframPhysicsVersion, KeyValuePattern[{"Version" -> _String, "WolframVersion" -> _String, "Author" -> _String}]],
	True,
	TestID -> "Version-is-an-association"
]

(* the association reads PacletInfo.wl at load; the two must agree *)
VerificationTest[
	With[{p = PacletObject["WolframInstitute/WolframPhysics"]},
		$WolframInstituteWolframPhysicsVersion === <|
			"Version" -> p["Version"],
			"WolframVersion" -> p["WolframVersion"],
			"Author" -> p["Creator"]
		|>
	],
	True,
	TestID -> "Version-matches-PacletInfo"
]
