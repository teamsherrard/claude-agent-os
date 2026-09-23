---
name: studio-sections
description: Section Map for the AI Editing Studio. After the cut is locked, finds where every section of the video starts on the final cut and writes the timestamped map (first at 00:00, at least three, at least ten seconds apart, each with a plain note of what is said) that the YouTube System needs to write the chapters, and drops navigation markers onto the Riverside timeline named by the first spoken words so the agent can jump around their own edit. Never names a chapter and never writes a title, description, or tag; those belong to the YouTube System. Trigger on: "give me the timestamps", "section map", "where do the sections start", "add chapter markers", "mark the sections", "timestamps for the description", or as a step inside a full long-form edit. Part of the DIRECT stage; usually reached through studio-navigator or called inside a full edit.
---

# Section Map

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/sections.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Run after the cut is locked; if it is not, say the times are on the current cut and will be redone.
2. Find the section starts from the transcript rows (playable time), with the hook and the CTA marked too.
3. Write the map in 00:00 form with a plain ten-word note per section, into the log and the delivery.
4. Move any existing markers onto the section starts and add the missing ones, named by the first spoken words, in source time; read the timeline back to confirm.
5. Hand the map to the YouTube System with the one line that starts the SEO Package.

## Remember

Markers can be added and moved, not renamed or deleted. Their text is spoken words in quotes, never a title you wrote. The chapter names the viewer sees come from the SEO Package's description, not from these markers.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
