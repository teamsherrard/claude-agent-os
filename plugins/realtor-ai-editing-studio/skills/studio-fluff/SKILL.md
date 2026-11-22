---
name: studio-fluff
description: >-
  Remove the Fluff for the AI Editing Studio: the clean cut, the single biggest quality lift in
  any edit. Finds and removes filler words, dead air, false starts, repeated takes, and off-topic
  tangents by reading the transcript, shows the agent exactly what is coming out, and cuts only on
  their yes. Every cut lands on a word boundary, protects question-and-answer pairs and setups
  with their payoffs, and is listed back with the before and after length. Fully undoable. Trigger
  on: "remove the fluff", "just take out the ums", "cut the dead air", "tighten this up", "remove
  the bad takes", "I said that part twice", "just trim the end", "make it shorter". Part of the
  CUT stage; usually reached through studio-navigator or called inside a full edit.
---

# Remove the Fluff

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/clean-cut.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## Engine

Read `default_engine` in `~/realtor-brain/editor/config.json` (saying an engine's name in the request always wins). **`riverside`** (the default): do the work exactly as this skill's reference says. **`edits`** (Instagram Edits for Mac, the optional second engine, driven from the Code tab of the Claude desktop app on the agent's own Mac): the craft rules in this skill's reference still apply, but the moves are the ones in the Remove the fluff paragraph of `${CLAUDE_PLUGIN_ROOT}/shared/edits-engine.md`.

## The job

1. Find it free: repeated takes (quote the first and last words), false starts, gaps, tangents, housekeeping.
2. Show the list with the length before and after. One yes covers the list.
3. Editorial cuts through the resolver first, then filler words, then pauses (1500 ms long-form, 1000 ms reels).
4. The second pass: Riverside's own retake flags (the recording clip's AI comments), the restart-phrase hunt, then the cut; verify with the revision diff and re-read the WHOLE transcript once (no sentence twice, no restart phrase left), plus the first 40 seconds and the last line.

## Remember

This is the only destructive craft. If the recording exists only in Riverside, save one snapshot copy first and say so.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
