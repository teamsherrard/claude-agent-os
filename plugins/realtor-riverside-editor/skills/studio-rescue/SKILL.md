---
name: studio-rescue
description: Rescue Cut for the AI Editing Studio, for the recording that went badly. When an agent made the same points three times, restarted sentences, wandered off topic, and lost the thread, a normal clean-up only tightens the ramble. This skill lists the distinct points they were making, finds the best complete pass of each, and tells them honestly whether a tight video is in there, whether one line needs a thirty-second patch, or whether they should re-record using the point list as their outline. Cuts only on their yes, after saving a copy of the original. Trigger on: "this recording is a mess", "I rambled", "can you save this", "I said everything three times", "rescue this", "is this usable", "salvage my video", "I lost my train of thought in this one". Part of the CUT stage; usually reached through studio-navigator.
---

# Rescue Cut

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/rescue.md`** (it leans on `${CLAUDE_PLUGIN_ROOT}/shared/clean-cut.md` for the tool calls). Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Decide from the transcript whether it is a rescue, and say so warmly; finding out is free.
2. List the distinct points and every pass at each, with the keeper marked and why.
3. Make the honest call: rescue works, rescue with a short patch, or re-record with this outline.
4. On their yes: save a copy, cut everything that is not a keeper, then fillers and pauses at 1500 ms, a cutaway over any hard join.
5. Re-read the whole remaining transcript once: every point exactly once, every sentence complete.

## Remember

Nothing can be reordered on this engine, so the points stay in recorded order. Never stitch half sentences into a new one, and never make them feel bad about the take.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
