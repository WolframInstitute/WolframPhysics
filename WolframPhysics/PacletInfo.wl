(* ::Package:: *)

(* "Categories" here is the paclet's own tag list. The Paclet Repository categories are a fixed
   list the resource system serves ("Graphs & Networks", "Scientific and Medical Data &
   Computation", ...) and are declared in docs/ResourceDefinition.md, which the publish script
   checks against that list. *)
PacletObject[<|
  "Name" -> "WolframInstitute/WolframPhysics",
  "PublisherID" -> "WolframInstitute",
  "Version" -> "0.0.1",
  "WolframVersion" -> "15.0+",
  "Description" -> "An aggregation of Wolfram Physics Project functionality",

  "Creator" -> "Wolfram Institute",
  "License" -> "MIT",
  "Keywords" -> {
    "hypergraph", "multiway", "causal graph", "branchial graph", "rulial",
    "Wolfram physics", "multicomputation"
  },
  "Categories" -> {"Physics", "Graphs & Networks"},
  "PrimaryContext" -> "WolframInstitute`WolframPhysics`",
  "Extensions" -> {
    {
      "Kernel",
      "Root" -> "Kernel",
      "Context" -> {"WolframInstitute`WolframPhysics`"}
    },
    {
      "Documentation",
      "Root" -> "Documentation",
      "Language" -> "English"
    },
    {
      "Test",
      "Root" -> "Tests",
      "Method" -> "Experimental-v1"
    }
  }
|>]
