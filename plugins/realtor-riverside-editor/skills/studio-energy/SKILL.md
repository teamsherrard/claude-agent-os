---
name: studio-energy
description: Energy for the AI Editing Studio. A flat, static talking head loses viewers; an effect on every cut looks cheap. This skill adds the purposeful middle: two or three gentle punch-ins on the lines that matter most, animated entrances on cards and cutaways, and a swoosh on each punch-in when the agent has a licensed one in their library. Tuned to the agent's style pack, always zoom-in only so no frame edge shows, and never a tight push on anyone's face. Trigger on: "make it punchier", "add some zooms", "it feels flat", "add some energy", "make it more dynamic". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Energy

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Pick the 2 to 3 strongest lines from the brief or the transcript.
2. A punch-in is a short zoomed scene: split the scene at the first word of the key line and at the first word after it, then set that scene's slot scale to about 1.08. It is a hard-cut zoom, so it lands on phrase boundaries and holds for the whole line. Scale keyframes on the speaker's track do nothing on this connector, so never use them. Read the scene back before you log it.
3. Animate card and cutaway entrances to match the style pack (pop for bold, fade for calm).
4. Check one punch-in on a frame: no exposed edge, face comfortably framed.

## Remember

Transitions, a sound-effect library, and motion graphics are not available from the connector. Do not promise them; they are part of the agent's manual 20%.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
