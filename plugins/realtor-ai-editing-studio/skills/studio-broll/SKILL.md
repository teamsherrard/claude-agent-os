---
name: studio-broll
description: >-
  B-roll for the AI Editing Studio, the footage brain. no engine's stock library or media panel
  decides what goes where, so this skill picks every cutaway moment from the transcript, sources
  footage from several places (the agent's own library first, then the engine's built-in stock,
  then free stock libraries, then real-place imagery), rejects anything that is not recognisable
  at a glance or has already been used, and places each clip on the exact words, scaled to fill
  the frame and never over the hook, a face, or the call-to-action. Real places stay real: no
  AI-generated or faked landmarks. Trigger on: "add b-roll", "add some footage", "just add a bit
  of b-roll", "add the skyline", "show the neighbourhood while I talk". Part of the POLISH stage;
  usually called inside a full edit.
---

# B-roll

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/broll-ladder.md`** (it points at `layouts.md` and `footage-intake.md` where they apply). Respect `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## Engine

Read `default_engine` in `~/realtor-brain/editor/config.json` (saying an engine's name in the request always wins). **`riverside`** (the default): do the work exactly as this skill's reference says. **`edits`** (Instagram Edits for Mac, the optional second engine, driven from the Code tab of the Claude desktop app on the agent's own Mac): the craft rules in this skill's reference still apply, but the moves are the ones in the B-roll and library paragraph of `${CLAUDE_PLUGIN_ROOT}/shared/edits-engine.md`.

## The job

1. Pick EVERY moment from the transcript first (free), to the cap for the format in the reference.
2. Source down the ladder: the library index, then Riverside stock, then keyed libraries, then real-place imagery. Keep a running list so nothing repeats. Bright, daytime clips only: a cutaway is never darker than the speaker's shot.
3. Place them all in one go, then one batch that scales every new overlay CLIP (by `clipId`, never the shared overlay track) to fill the frame.
4. Verify: count the clips on the timeline, diff the revision, and frame-check EVERY cutaway at its midpoint for brightness and recognisability.

## Remember

Property moments need property footage; stock is never passed off as the actual listing. More than the cap is the agent's free 20%.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
