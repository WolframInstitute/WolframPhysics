(* ::Package:: *)

(* ::Section:: *)
(*Evaluations before loading*)


(* Nothing yet *)


(* ::Section:: *)
(*PackageInitialize*)


PackageInitialize["WolframInstitute`WolframPhysics`",
<|
		"HiddenImports"->{"GeneralUtilities`"},
		"LoadLastFiles"->{"FinalEvaluations.wl"},
		"LoadFirstFiles"->{"InitialEvaluations.wl"},
		"IgnoreFiles"->{}
	|>
]


(* ::Section:: *)
(*Evaluations After loading*)


(* Register the PackageScope subcontext in $Packages so the cross-file-shared
   (PackageScoped) symbols can be imported by short name with
   Needs["WolframInstitute`WolframPhysics`PackageScope`"]. The symbols already live in this
   context (StructuredPackageFormat keeps PackageScoped definitions there); this just
   makes it an importable package, which is what tests and downstream code use instead of
   the full WolframInstitute`WolframPhysics`PackageScope`Sym names. BeginPackage/EndPackage also
   leaves the context on $ContextPath, so we drop it back off: the import stays opt-in
   (a later Needs re-adds it on demand) and a plain load does not expose scoped names. *)
BeginPackage["WolframInstitute`WolframPhysics`PackageScope`"]
EndPackage[]
$ContextPath = DeleteCases[$ContextPath, "WolframInstitute`WolframPhysics`PackageScope`"];
