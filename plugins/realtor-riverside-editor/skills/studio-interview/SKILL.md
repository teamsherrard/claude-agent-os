---
name: studio-interview
description: Interview Edit for the AI Editing Studio: the multi-person recipe, and the format Riverside is best at because every person is recorded on their own track. Applies speaker-aware layouts that follow whoever is talking, mutes each person's mic while they listen, cleans every speaker's audio at the right strength, matches the two looks, adds a name strip for each person, and hands the topic-by-topic section map to the YouTube System. Protects question-and-answer pairs and real laughter. Trigger on: "edit my interview", "edit my podcast episode", "I had a guest on", "two-person video", "fix the layout", "switch between the cameras", "it keeps showing the wrong person". Part of the CUT stage; usually reached through studio-navigator or called inside a full edit.
---

# Interview Edit

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/interview.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Transcript read per speaker; never split a question from its answer.
2. Clean cut with crosstalk muted, not cut.
3. Smart mutes, then Magic Audio on EVERY speaker track (guests usually need more).
4. Smart layout, colour matched between speakers, one name strip per person moved off the face.
5. Section map to the YouTube System; the guest's best 30 to 45 seconds flagged for a reel.

## Remember

Get the guest's okay before publishing anything that features them, and spell their name exactly as they wrote it.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
