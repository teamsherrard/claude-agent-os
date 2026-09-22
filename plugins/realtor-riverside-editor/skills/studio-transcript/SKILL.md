---
name: studio-transcript
description: Transcript Read for the AI Editing Studio: the free first look. Reads every word of a recording before anything changes and reports, in one short paragraph, the length, the repeated takes and dead air it would cut (with the lines quoted), whether the hook already lands, the section map, spelling problems in names, and how long the edit will take. It is the cost-free place to catch a problem and the single yes that gates the whole edit. Also produces the section map (timestamps plus plain notes) that the YouTube System uses to name chapters. Trigger on: "read my video", "what's in this recording", "find the repeated takes", "what would you cut", "how long will this take to edit", "give me the section map", "timestamps for this video", or as the opening step of any full edit. Part of the DIRECT stage; usually reached through studio-navigator or called inside a full edit.
---

# Transcript Read

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/preflight-check.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Confirm the recording is ready (not still uploading) and that a working edit exists.
2. Read the compact transcript rows; zoom to words only where you need exact times.
3. Report in ONE paragraph with numbers: length, what comes out, the hook, the sections, the time to finish.
4. On request, output the section map for the YouTube System. Never name chapters yourself.

## Remember

This skill changes nothing. Every fix it finds here is free; the same fix found after an export costs a re-render.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
