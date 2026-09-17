#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Drive the whole documentation pipeline from one command, one phase after another:

     ./build_docs.sh                     docs/**/*.md -> the authoring notebooks (build output, not in git)
     scripts/docbuild.wls                authoring notebooks -> build/WolframPhysics (built pages + index)
     scripts/publish.wls                 scrape + CloudDeploy build/WolframPhysics as the public Paclet resource
     scripts/build_site.wls site         the single-page docs site shell over the deployed pages

   Ported from PureMath's scripts/build_all.wls. Each phase is its own wolframscript process, run
   in sequence with its output streamed through this one, so every phase script ends in an
   unconditional Exit and reads $ScriptCommandLine (build_site.wls takes its target there). A
   phase that exits nonzero stops the run with that status; the phases after it do not start. The
   notebooks phase goes through ./build_docs.sh rather than the script directly: the wrapper
   initialises the converter submodule and judges the build by its .build_ok sentinel rather than
   by the exit status (wolframscript can exit nonzero on the benign exit-time license message
   after a clean build).

   Every phase inherits this process's environment, so the phase knobs are set on this command:
     WP_BUILD_ONLY=1        stop after docbuild, with the built copy at build/WolframPhysics (a
                            local build, or a pod run that must not deploy)
     WP_PUBLISH_DRY_RUN=1   a rehearsal of the whole run: publish stops after the scrape and prints
                            what it would deploy where, and build_site runs with DRYRUN=1 (its own
                            dry-run knob), so nothing is written to the cloud
     WOLFRAM_CLOUD_USER / WOLFRAM_CLOUD_PASSWORD   read by the deploying phases (environment or
                            the gitignored .env), each of which prints the account it acts as and
                            its target before writing
     WP_UPLOAD_DELTA, WP_SKIP_PERMS, WP_SCRAPE_TOLERANT, WP_SCRAPE_TIMEOUT   publish.wls's knobs
     WP_MTN_SOURCE          build_notebooks.wls's converter override

   Prerequisites: wolframscript on PATH (the phases run with it), bash for the wrapper, a Front End
   for docbuild and publish, and a cloud connection for publish and build_site.

   Usage: wolframscript -file scripts/build_all.wls
          WP_BUILD_ONLY=1 wolframscript -file scripts/build_all.wls
          WP_PUBLISH_DRY_RUN=1 wolframscript -file scripts/build_all.wls
   Exit status: 0 when every phase that ran succeeded; otherwise the first failing phase's status
   (1 when a phase could not be started at all). *)

scriptPath = ExpandFileName[$InputFileName];
repo = FileNameDrop[scriptPath, -2];
buildOnly = Environment["WP_BUILD_ONLY"] === "1";
dryRun = Environment["WP_PUBLISH_DRY_RUN"] === "1";

say[args___] := Print["build_all: ", args];

(* Run one phase as a child process with the working directory at the repository root, streaming
   its output line by line as it arrives (a phase can run for an hour; a log that appears only at
   the end is no log). The command goes through /bin/sh only to merge the child's stderr into its
   stdout, so a message the kernel writes there is seen in order and can never fill an unread pipe;
   the arguments are passed as positional parameters, never re-quoted. Returns the exit status. *)
wpRunPhase[label_String, command : {__String}] := Module[{process, line, status, start},
	say["==> ", label, ": ", StringRiffle[command, " "]];
	start = AbsoluteTime[];
	process = Quiet @ Check[
		StartProcess[{"/bin/sh", "-c", "exec \"$0\" \"$@\" 2>&1", Sequence @@ command}, ProcessDirectory -> repo],
		$Failed];
	If[! MatchQ[process, _ProcessObject],
		say[label, ": could not start ", First[command], " (is it on PATH?)"];
		Return[1, Module]];
	While[(line = ReadLine[process]) =!= EndOfFile, Print[line]];
	While[ProcessStatus[process] === "Running", Pause[0.1]];
	status = Replace[ProcessInformation[process, "ExitCode"], Except[_Integer] -> 1];
	say["<== ", label, " finished with status ", status, " after ", Round[AbsoluteTime[] - start], " s"];
	status
];

(* A failing phase ends the run with its own status; nothing after it starts. *)
wpPhase[label_String, command : {__String}] := With[{status = wpRunPhase[label, command]},
	If[status =!= 0, say["stopping: ", label, " failed"]; Exit[status]]];

say["repository ", repo];
say["plan: notebooks -> docbuild",
	If[buildOnly, " (WP_BUILD_ONLY=1: stop there)", " -> publish -> build_site site"],
	If[dryRun && ! buildOnly, " (WP_PUBLISH_DRY_RUN=1: a rehearsal; nothing is deployed)", ""]];

wpPhase["notebooks", {"bash", FileNameJoin[{repo, "build_docs.sh"}]}];
wpPhase["docbuild", {"wolframscript", "-file", FileNameJoin[{repo, "scripts", "docbuild.wls"}]}];
If[buildOnly,
	say["WP_BUILD_ONLY=1: the built copy is ready under ", FileNameJoin[{repo, "build", "WolframPhysics"}], "; scripts/publish.wls deploys it"];
	Exit[0]];
wpPhase["publish", {"wolframscript", "-file", FileNameJoin[{repo, "scripts", "publish.wls"}]}];
(* build_site.wls has its own dry-run knob; a rehearsal of this run is a rehearsal of that too *)
If[dryRun, SetEnvironment["DRYRUN" -> "1"]; say["DRYRUN=1 set for build_site (WP_PUBLISH_DRY_RUN=1)"]];
wpPhase["build_site", {"wolframscript", "-file", FileNameJoin[{repo, "scripts", "build_site.wls"}], "site"}];
say["done"];
Exit[0]
