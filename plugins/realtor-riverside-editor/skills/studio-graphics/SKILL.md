---
name: studio-graphics
description: Brand Graphics for the AI Editing Studio. Places the agent's designed Video Brand Kit on the video: the hook banner, the call-to-action banners that pop up while the agent says each ask (subscribe, comment below, free guide, call, book a call, DM, link, follow), the name strip, emphasis pop-ups on key phrases, icons, and the logo, each animated in and out and positioned by format so nothing ever covers a face (top edge on vertical reels, lower third on YouTube). Designs nothing itself: the assets come from Claude Design, and when no kit is registered it builds clean plain cards and says so. Every word on screen is compliance-checked first. Trigger on: "add my hook card", "just add my CTA", "add a lower third", "add my name on screen", "add a pop-up", "put my logo on it", "use my brand kit", "my card or name strip is covering my face". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# Brand Graphics

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Read compliance first (three states; never stamp a placeholder).
2. Kit registered? Each piece is insert → scale to the canvas at time 0 → animate → the words typed into its zone (hook and pop-ups only). No kit? One native text card each, then move it, because text inserts centred on the face.
3. Counts: reel = hook banner + the CTA banner (+ a pack banner on a spoken ask); long-form = hook banner + name strip + a pop-up every 2 to 3 minutes + a pack banner on each spoken ask (at most one every 45 s) + the primary CTA banner to the end. Beyond that is their 20%.
4. Check every card on a frame: off the face, inside its panel, readable, no collisions.

## Remember

- Words go inside a kit panel with the centring rule in the reference (the text anchor is its top, so lift it by about a quarter of the font size). Check the first card on a frame before placing the rest.

The reference points at cta-pack.md (which banner on which spoken ask) and brand-wiring.md (where the kit's media ids live).

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
