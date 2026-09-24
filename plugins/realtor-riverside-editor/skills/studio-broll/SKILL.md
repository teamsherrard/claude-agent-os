---
name: studio-broll
description: B-roll for the AI Editing Studio, the footage brain. Riverside has a stock library and a media panel but will not decide what goes where, so this skill picks every cutaway moment from the transcript, sources footage from several places (the agent's own library first, then Riverside's built-in stock, then free stock libraries, then real-place imagery), rejects anything that is not recognisable at a glance or has already been used, and places each clip on the exact words, scaled to fill the frame and never over the hook, a face, or the call-to-action. Real places stay real: no AI-generated or faked landmarks. Trigger on: "add b-roll", "add some footage", "just add a bit of b-roll", "add the skyline", "show the neighbourhood while I talk". Part of the POLISH stage; usually called inside a full edit.
---

# B-roll

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/broll-ladder.md`** (it points at `layouts.md` and `footage-intake.md` where they apply). Respect `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Pick EVERY moment from the transcript first (free), to the cap for the format in the reference.
2. Source down the ladder: the library index, then Riverside stock, then keyed libraries, then real-place imagery. Keep a running list so nothing repeats. Bright, daytime clips only: a cutaway is never darker than the speaker's shot.
3. Place them all in one go, then one batch that scales every new overlay CLIP (by `clipId`, never the shared overlay track) to fill the frame.
4. Verify: count the clips on the timeline, diff the revision, and frame-check EVERY cutaway at its midpoint for brightness and recognisability.

## Remember

Property moments need property footage; stock is never passed off as the actual listing. More than the cap is the agent's free 20%.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
