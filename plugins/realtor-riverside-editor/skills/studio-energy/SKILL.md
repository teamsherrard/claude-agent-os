---
name: studio-energy
description: Energy for the AI Editing Studio. A flat video is one where the picture never reacts to what is being said, so this skill edits to the emotion: it reads Riverside's emotion data and the transcript for the beats (a laugh, a number, a reveal, a serious turn, the CTA), puts a hard-cut zoom on each at the format's rate (about one every minute on long-form, one every 15 seconds on a reel), sizes each zoom to the strength of the beat, steps back out for reveals, and covers every jump cut with a size change so the edit reads as deliberate. Animated entrances on cards and cutaways, and a swoosh on each zoom when the agent has a licensed one in their library. Never a tight push on anyone's face. Trigger on: "make it punchier", "add some zooms", "it feels flat", "it looks boring", "add some energy", "make it more dynamic", "edit to the emotion", "zoom in when I say something important". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Energy

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`** (the section "Emotion-driven energy"). Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Find the beats, free: the brief's featured moments, Riverside's emotion events (`includeParalinguistics:true`), and the transcript cues (numbers, reveals, questions, contrast turns, the CTA).
2. Plan the zooms at the format's rate and size each to its beat: 1.06 normal, 1.10 strong, 1.14 for the one line of the video. Add a step-back on the biggest reveal and a size change on every editorial cut.
3. Say the plan in one line ("eleven zooms on your key lines and six cut covers, about three minutes") and go. Every zoom is a split scene with a slot scale; scale keyframes on the speaker track do nothing on this connector.
4. Entrances belong to the crafts that place things (graphics for cards, B-roll for cutaways); energy owns the zooms, the cut covers, and the swoosh.
5. Read every zoomed scene back, check one frame per size used, and log the count and sizes.

## Remember

Transitions and a sound-effect library are not on the connector; the free "transition" music tracks are stingers, not swooshes. Motion lives in the zooms, the cut covers, and the card entrances.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
