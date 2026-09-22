---
name: studio-hook
description: Hook Finder for the AI Editing Studio. Viewers decide in three seconds, so this skill scores the candidate opening lines in the first minute (a claim or a number, curiosity, speaks to the viewer, short, true to the video), then makes the video start on the strongest one by cutting the settling-in before it. If the best line is buried later, it says so and suggests a five-second re-record instead of faking it. Also supplies the short on-screen hook line for the hook card, taken from the agent's own words. Trigger on: "find my hook", "fix my opening", "open on the hook", "the start is slow", "the intro drags", "what's my best opening line", "just trim the start". Part of the CUT stage; usually reached through studio-navigator or called inside a full edit.
---

# Hook Finder

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/hook.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Score the opening candidates from the transcript (free).
2. Show the line you would open on and what comes out before it. Get the yes (it is a cut).
3. Cut to the hook's first word; check the next sentence still makes sense.
4. Offer the on-screen hook line for Brand Graphics to place: 3 to 6 words on a reel, up to 8 on long-form.

## Remember

The hook line on screen is not the video's title. Titles belong to the YouTube System.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
