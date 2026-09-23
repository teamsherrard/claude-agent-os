---
name: studio-music
description: Music for the AI Editing Studio. Picks a mood-matched bed from Riverside's free licensed library (business, lifestyle, educational, and more, at high or low intensity), places it under the whole video at a level that never fights the voice, and fades it in and out. Reels get a bed by default; long-form ships without one and the agent is offered it. Never uses a trending or copyrighted song, because a muted or struck post costs more than any song is worth. Trigger on: "add music", "just add music", "change the music", "the music is too loud", "the music is too quiet", "remove the music", "different vibe for the music". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Music

Long-form gets a quiet bed and section stingers by default now; a video with no sound design reads as unfinished.

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/music.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Match the mood to the content and the brand; a luxury brand never gets a gaming track.
2. Place the bed at -18 dB with a fade in and out, after the cuts so it spans the final length.
3. A library track shorter than the video is placed again where it ends.
4. Too loud against the voice? Lower the bed, never raise the voice.

## Remember

True ducking is not available from the connector; a steady low bed is the safe default and a manual nudge is part of their 20%.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
