---
name: studio-check
description: Quality Check for the AI Editing Studio: the gate every video passes before the agent sees it. Runs compliance first (brokerage disclaimer, no superlatives, fair-housing language), then a hard pass or fail list with evidence for each line, the measured ones first (audio at an audible level, the grade inside its band, no bloopers after a full re-read, music present, zooms at the rate, B-roll within the caps, every logged pass real), then the visual ones on the export (captions right for the format, the CTA banner on its line, nothing over a face, no exposed edges or dark cutaways, text contained and readable, no collisions). Visual items cite a real frame it looked at, or are marked unverified and named to the agent. Anything that fails is fixed or the video does not ship. Trigger on: "check my video", "is this ready to post", "QA this", "quality check", "did everything work", "look it over before I post". Part of the SHIP stage; usually reached through studio-navigator or called inside a full edit.
---

# Quality Check

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Gate 1, compliance, in its three states.
2. Gate 2, the blockers: each one PASS, FAIL, FIXED, or UNVERIFIED with its evidence (a revision diff, a timeline read, or a frame and which rung of the ladder it came from). The measured ones (1–9) run before the export from the timeline, the transcript, and the diff; the visual ones (10–16) run on the export, and the grade also gets a skin frame.
3. A fail you cannot fix in one pass stops the delivery; say which item and why in plain words.
4. Gate 3, the hand-back: a review draft, the spec it hit, the 2 to 3 things only they can judge, the 80/20 line, and on long-form the section-map line, the reels-or-trailer offer, and the publish offer.

## Remember

The reference says how frames are reached on this engine. Never write PASS on a frame you did not look at.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
