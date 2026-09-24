---
name: studio-music
description: Music for the AI Editing Studio. Every video gets a bed under the voice from Riverside's free licensed library (business, lifestyle, educational, and more, at high or low intensity), mood-matched to the content and placed at the right level: -18 dB on a reel, a quieter -22 dB on a long-form, faded at both ends and placed again if the track is shorter than the video. Long-form also gets a short section stinger at each section change, cut from the same collection, so the video feels edited and not just trimmed. A swoosh on the zooms comes only from a sound the agent has uploaded; there is no sound-effect library on this engine. Never a copyrighted song. Trigger on: "add music", "add a music bed", "music's too loud", "music's too quiet", "different music", "make it feel more produced", "add some sound to the section changes". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Music

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/music.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Pick the collection from the content and the brief (the mood table in the reference), Low intensity for an underscore.
2. Place the bed after the cut is locked so it spans the final length: -18 dB on a reel, -22 dB on a long-form, faded in and out, placed again at its own end if it is shorter than the video.
3. Long-form: one 1.8-second stinger from the same collection's transition tracks at each section change (the section map's times), never over a spoken number or the CTA line, never closer than 30 seconds to the last one.
4. Read the audio clips back on the timeline and confirm the bed covers the whole video; log the level and the stinger count.

## Remember

Off only if the agent says so or the topic is serious (a legal or difficult subject) — say which. The agent's ear judges the level; if they say it fights the voice, lower the bed, never raise the voice.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
