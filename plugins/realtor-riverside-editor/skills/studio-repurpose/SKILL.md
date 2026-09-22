---
name: studio-repurpose
description: Short-Form Repurpose for the AI Editing Studio. Turns one long video into several distinct vertical reels by reading the transcript and scoring every 20 to 60 second moment on five criteria (stands alone, strong hook, high value or emotion, clean payoff, right length), picking the best without overlap or repeated topics, and building each to completion as its own edit: 9:16, tight cut, captions, footage, music, hook and call-to-action. Cuts the video only: the posts' captions, hashtags, and calendar belong to the Short-Form System, and written repurposing belongs to the YouTube System. Trigger on: "cut reels from this", "make clips from my video", "pull 3 shorts out of this recording", "cut my video into reels", "turn my long video into shorts", "finish my clips". Part of the REPURPOSE stage; usually reached through studio-navigator or called inside a full edit.
---

# Short-Form Repurpose

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/repurpose.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Lock N (default 3, cap 5) with one yes.
2. Score moments from the transcript (free); use the YouTube System's Repurposing Pack hooks if one exists.
3. Show the picks as hook line plus length; say so honestly if there are fewer than N strong ones.
4. Each reel is its own edit, built fully before the next, logged as it lands.
5. Deliver all at once, labelled by hook line; hand the hook lines to the Short-Form System.

## Remember

If a stop happens mid-batch, finished reels stay finished; "finish my clips" rebuilds only what never landed.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
