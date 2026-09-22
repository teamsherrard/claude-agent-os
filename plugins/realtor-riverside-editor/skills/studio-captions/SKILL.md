---
name: studio-captions
description: Captions for the AI Editing Studio. On reels, turns on word-by-word captions in the agent's brand look: big and phone-legible, white with an outline, the word being spoken lighting up in the brand accent, pinned below the face and inside the platform safe zones. On long-form YouTube it switches captions off, because YouTube supplies its own and emphasis pop-ups carry the on-screen words instead. Checks the spelling of the agent's name, brokerage, and city in the transcript first. Trigger on: "just add captions", "add subtitles", "make the captions bigger", "change the caption color", "move the captions", "turn the captions off", "the captions cover my face". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Captions

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Check the transcript's spelling of names; if wrong, the agent fixes the word in Riverside's transcript panel first (one minute).
2. ONE settings call: karaoke, the brand font and accent, the size, position, and width from the reference (big, below the chin, inside the icon rail).
3. Long-form: captions OFF as a deliberate step (an edit made in Riverside can arrive with them on).
4. Check a frame: below the chin, out of the right-hand icon rail, readable.

## Remember

Font sizes on this engine are 1080p export pixels, so vertical needs bigger numbers than landscape.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
