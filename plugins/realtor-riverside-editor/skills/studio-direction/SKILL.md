---
name: studio-direction
description: Creative Direction for the AI Editing Studio. Before anything on a video changes, builds a five-line edit brief the way a human editor would: who the video is for, the shape and target length, exactly what comes out, the three to five moments that get featured, and the feel (style pack and music call). Reads the transcript, the AI Brain, the script, and saved preferences so it asks almost nothing. Changes nothing on the video. Trigger on: "plan my edit", "how should we edit this", "give me an edit brief", "direct this video", "what would you do with this video", "creative direction", or as the first step of any full edit. Part of the DIRECT stage; usually reached through studio-navigator or called inside a full edit.
---

# Creative Direction

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/creative-direction.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Build the brief from the transcript, the Brain, the script, the config, and any on-the-go edit notes. One question at most.
2. Say it back as five plain lines: who and why, shape, what comes out, what gets featured, feel.
3. Get one yes. Save the brief as the first lines of the checkpoint log so every later pass reads the same direction.

## Remember

This skill never edits. It hands the brief to whichever skill runs next.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
