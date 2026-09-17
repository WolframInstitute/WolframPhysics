(* ::Package:: *)

(* ::Section::Closed:: *)
(*PackageExported*)


PackageExported[
	{
		$WolframInstituteWolframPhysicsVersion
	}
]


(* ::Section:: *)
(*PackageScoped*)


(* ::Section::Closed:: *)
(*UsageMessages*)


$WolframInstituteWolframPhysicsVersion::usage =
	"$WolframInstituteWolframPhysicsVersion is an association giving the version, the Wolfram Language version and the author of the loaded WolframInstitute/WolframPhysics paclet."


(* ::Section::Closed:: *)
(*Function Definitions*)


(* ::Subsection::Closed:: *)
(*$WolframInstituteWolframPhysicsVersion*)


$WolframInstituteWolframPhysicsVersion =
	<|
		"Version"->PacletObject["WolframInstitute/WolframPhysics"]["Version"],
		"WolframVersion"->PacletObject["WolframInstitute/WolframPhysics"]["WolframVersion"],
		"Author"->PacletObject["WolframInstitute/WolframPhysics"]["Creator"]
	|>
