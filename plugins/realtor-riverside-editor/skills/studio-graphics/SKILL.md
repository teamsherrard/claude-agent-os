---
name: studio-graphics
description: Brand Graphics for the AI Editing Studio. Places the agent's designed Video Brand Kit on the video: the hook card, the call-to-action end card, the name strip, emphasis pop-ups on key phrases, icons, and the logo, each animated in and out and positioned by format so nothing ever covers a face (top edge on vertical reels, lower third on YouTube). Designs nothing itself: the assets come from Claude Design, and when no kit is registered it builds clean plain cards and says so. Every word on screen is compliance-checked first. Trigger on: "add my hook card", "just add my CTA", "add a lower third", "add my name on screen", "add a pop-up", "put my logo on it", "use my brand kit", "my card or name strip is covering my face". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Brand Graphics

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Read compliance first (three states; never stamp a placeholder).
2. Kit registered? Place each PNG with one call. No kit? One native text card each, then move it, because text inserts centred on the face.
3. Counts: reel = hook + CTA; long-form = hook + CTA + a pop-up every 2 to 3 minutes + a name strip. Beyond that is their 20%.
4. Check every card on a frame: off the face, inside its panel, readable, no collisions.

## Remember

- Words go inside a kit panel with the centring rule in the reference (the text anchor is its top, so lift it by about a quarter of the font size). Check the first card on a frame before placing the rest.

See cta-pack.md for the closing card and brand-wiring.md for where the brand and the kit's media ids live.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
