---
name: studio-color
description: Color and Look for the AI Editing Studio. Applies a subtle, natural, flattering correction to every video: a small lift in brightness, contrast, and saturation, with white balance fixed when the room light runs blue or orange. Ungraded footage reads cheap and over-cooked footage reads fake, so the rule is a lift you can see side by side and forget on its own, with skin tones protected and a hard line it never crosses. Many agents are self-conscious on camera; this skill frames and grades people kindly and never tries to change how someone looks. Trigger on: "just fix the color", "it looks dark", "it looks washed out", "I look orange", "color grade this", "fix the contrast", "brighten it up". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Color and Look

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Read the speaker track.
2. Apply the visible-but-natural recipe (brightness +0.04, contrast +0.12, saturation +0.08; Kelvin only when the white balance is off). It must be noticeable side by side; it must never cross the over-cooked line. Halve it for punchy phone footage.
3. Confirm the keyframe exists; check skin on a frame when one is reachable.
4. Offer to dial it back if they find it strong; never below the visible band without their word.

## Remember

Eye-contact correction and background removal or blur exist on this engine and are banned here.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
