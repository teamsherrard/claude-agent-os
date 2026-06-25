# Call-to-action pop-ups (the agent's branded CTA pack)

## Every video ends with their CTA

A realtor video that doesn't tell the viewer what to do next is a wasted video. Always close with the agent's call-to-action — and reinforce it **on screen**, not just spoken. If the agent says "if you want to work with me…", something must appear: their name, number, website, or "DM me."

## The branded CTA pack — build once, reuse forever

Realtors reuse the same handful of CTAs on every video:

- Subscribe · Comment below · Send me a DM · Link in bio · Call/text me · Visit my website · Follow on YouTube · Book a call

These should be **clean, branded CTA pop-ups** (the agent's colours, font, logo) that slide/pop in.

The CTA card is a premium text overlay, so — like every hook / section / stat card — it is rendered by the **json2video graphics engine** (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md`, template 8 in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-templates.md`): on a contrast panel, on-brand, big, animated, composited over the closing footage for ~free, synced to the exact closing line. **Descript does NOT draw the CTA card** (it once rendered flat boxes / cards on the face). Set the brand values once and reuse them on every video.

It fills the most common gap (no CTA on screen) and stays cheap because the graphics engine renders it for ~free and the brand asset is reused.

## Keep it simple for the agent

One-time setup question, in plain words: *"Want me to make your CTA pack — subscribe, DM me, link in bio, call me — so they're ready to drop on every video?"* Then it's automatic. If an agent doesn't want the full pack, a clean text CTA in their brand colours still works. Don't overcomplicate it.
