---
name: studio-check
description: Quality Check for the AI Editing Studio: the gate every video passes before the agent sees it. Runs compliance first (brokerage disclaimer, no superlatives, fair-housing language), then a hard pass or fail list with evidence for each line: audio actually applied, opens on the hook, ends on a complete thought, the call-to-action on screen, nothing over a face, no exposed edges, footage within the caps and never repeated, text contained and readable. Visual items cite a real frame it looked at, or are marked unverified and named to the agent. Anything that fails is fixed or the video does not ship. Trigger on: "check my video", "is this ready to post", "QA this", "quality check", "did everything work", "look it over before I post". Part of the SHIP stage; usually reached through studio-navigator or called inside a full edit.
---

# Quality Check

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Gate 1, compliance, in its three states.
2. Gate 2, the blockers: each one PASS, FAIL, FIXED, or UNVERIFIED with its evidence (a revision diff, a timeline read, or a frame and which rung of the ladder it came from).
3. A fail you cannot fix in one pass stops the delivery; say which item and why in plain words.
4. Gate 3, the hand-back: a review draft, the spec it hit, the 2 to 3 things only they can judge, and the 80/20 line.

## Remember

See frame-qa.md for how frames are actually reached on this engine. Never write PASS on a frame you did not look at.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
