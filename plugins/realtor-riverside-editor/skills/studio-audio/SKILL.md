---
name: studio-audio
description: Audio Enhance for the AI Editing Studio. Bad sound loses viewers faster than bad picture, so this skill makes the voice clean, present, and natural: studio-quality enhancement on every speaker track at the right strength for the recording (a decent mic, a phone, an echoey room), confirmed as actually applied rather than assumed, with the music bed kept under the voice. Because it cannot hear playback, it always asks the agent the one ear-test question and remembers the answer for next time. Trigger on: "just fix my audio", "clean up the sound", "it sounds echoey", "my audio is bad", "audio enhance", "make me sound better". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Audio Enhance

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/audio.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Read the timeline for every speaker track.
2. Magic Audio on each: 0.70 for a decent mic (audible, still natural), 0.85 for a phone or an echoey room.
3. Re-read the track to confirm it landed; if Riverside is still processing, wait and say so.
4. Ask the ear-test question and save their preferred level to the config.

## Remember

No audio is ever synthesised or voice-cloned on this engine. Removal and enhancement only.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
