---
name: studio-podcast
description: Podcast for the AI Editing Studio. Many agents' long-form interviews are already a podcast they never published. This skill takes the finished edit, exports clean audio (MP3, or WAV for a master) with the cuts and audio enhancement already applied, checks the levels by rule, and walks the agent through the three clicks that publish it to Spotify and Apple through Riverside's hosting. Episode titles and show notes come from the YouTube System or the agent, never from here. Trigger on: "make this a podcast", "export the audio", "give me an MP3 of this", "put this on Spotify", "audio version of this video". NOT for editing the episode itself (that is studio-interview or studio-longform). Part of the REPURPOSE stage; usually reached through studio-navigator or called inside a full edit.
---

# Podcast

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/podcast.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Work from the finished long-form edit so the cuts and audio are already done.
2. Export MP3 (or WAV when they ask for a master) and wait for it to finish.
3. Level check by rule: every speaker enhanced, bed under the voice, clean open and end.
4. Say the three clicks for Riverside's podcast hosting; the connector cannot publish an episode there.

## Remember

Show notes and episode titles are marketing. Supply the section map and the length; the YouTube System or the agent writes the words.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
