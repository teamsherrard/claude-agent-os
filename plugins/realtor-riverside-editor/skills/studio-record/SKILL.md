---
name: studio-record
description: >-
  Record Coach for the AI Editing Studio. The minute before the agent presses record is the
  cheapest place to win quality, so this skill coaches it: pulls the script or outline from the
  YouTube or Short-Form System, sets up the Riverside session, or the phone shoot on Instagram
  Edits (teleprompter, quality, guest link), runs a 60-second frame, light, sound, and background
  check, and teaches the on-camera habits that make the edit cleaner (open on the hook, pause then
  re-say a flubbed line, end on the call-to-action and hold still). Records nothing itself.
  Trigger on: "I'm about to record", "help me set up my camera and mic", "recording checklist",
  "how should I film this", "set up my recording session", "prep me for a guest recording", "prep
  me to record". Part of the DIRECT stage; usually reached through studio-navigator or called
  inside a full edit.
---

# Record Coach

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/recording.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## Engine

Read `default_engine` in `~/realtor-brain/editor/config.json` (saying an engine's name in the request always wins). **`riverside`** (the default): do the work exactly as this skill's reference says. **`edits`** (Instagram Edits for Mac, driven from Claude Code on the agent's own Mac): the craft rules in this skill's reference still apply, but the moves are the ones in the Record coach paragraph of `${CLAUDE_PLUGIN_ROOT}/shared/edits-engine.md`. On Edits there is no in-app recording: coach the phone shoot (4K, 30 fps, vertical) and have them land the file under `~/Movies`.

## The job

1. Pull the script or outline if one exists; offer the teleprompter.
2. Run the 60-second check as a short checklist, one line each.
3. Give the two or three filming habits that matter for THIS video (reels planned? a guest?).
4. After they stop: tell them to give Riverside a couple of minutes, then say "edit my video."

## Remember

This skill never edits and never writes a script; scripts belong to the YouTube and Short-Form Systems.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
