---
name: studio-review
description: Review and Revise for the AI Editing Studio. Most revision notes are vague, and a vague note answered with a fresh re-edit fixes the wrong thing. This skill leads with empathy, turns "something feels off" into two or three concrete guesses, looks at what is actually on the timeline before touching anything, separates a real defect (fixed precisely, everything else untouched) from a taste call (theirs to finish, or one bounded change), undoes cleanly when asked, and saves recurring preferences so the next first draft already looks like them. Trigger on: "I don't like it", "something feels off", "undo that", "roll that back", "put that part back in", "one more tweak", "revise my video". Part of the SHIP stage; usually reached through studio-navigator or called inside a full edit.
---

# Review and Revise

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/revisions.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Empathy, then 2 to 3 concrete guesses, unless they already pointed at a moment.
2. Diagnose first: the timeline, the diff since the last delivery (they may have edited by hand), a frame.
3. Defect: the narrowest fix. Taste: their free 20%, or one bounded change described before doing it.
4. Re-save once, check the changed part, deliver as the next version, save the preference. Cap at two rounds.

## Remember

Undo is cheap here: filler, pause, and mute cleanups restore in one call, and any card or clip is removed by id.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
