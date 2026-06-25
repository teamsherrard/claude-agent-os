# Call-to-action pop-ups (the agent's branded CTA pack)

## Every video ends with their CTA

A realtor video that doesn't tell the viewer what to do next is a wasted video. Always close with the agent's call-to-action — and reinforce it **on screen**, not just spoken. If the agent says "if you want to work with me…", something must appear: their name, number, website, or "DM me."

## The branded CTA pack — build once, reuse forever

Realtors reuse the same handful of CTAs on every video:

- Subscribe · Comment below · Send me a DM · Link in bio · Call/text me · Visit my website · Follow on YouTube · Book a call

These should be **clean, branded CTA pop-ups** (the agent's colours, font, logo) that slide/pop in. Two ways to do it:

- **Today (default):** have Descript place a **clean, branded, single CTA card** on the closing line — the agent's colours/font with a tasteful pop-in (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`). Descript does a single animated card well.
- **Premium (the graphics engine — now BUILT):** the CTA card is rendered by the **json2video graphics engine** (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md`) — on a contrast panel, on-brand, composited over the closing footage for ~free. Same engine that renders the hook / section / stat cards. Every text element on a contrast panel, big, synced to the exact closing line.

The design anticipates this clean split for premium assets: a graphics engine makes branded assets once; Descript places them. Either way, it fills the most common gap (no CTA on screen) and stays cheap because the asset is recycled.

## Keep it simple for the agent

One-time setup question, in plain words: *"Want me to make your CTA pack — subscribe, DM me, link in bio, call me — so they're ready to drop on every video?"* Then it's automatic. If an agent doesn't want the full pack, a clean text CTA in their brand colours still works. Don't overcomplicate it.
