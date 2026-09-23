# Call-to-action cards (the agent's branded CTA)

Read the agent's saved CTA from `~/realtor-brain/editor/config.json` (`brand.cta.text` + `brand.cta.details`, captured at setup); only ask if it's missing.

## Every video ends with their CTA

A realtor video that doesn't tell the viewer what to do next is a wasted video. Always close with the agent's call-to-action — and reinforce it **on screen**, not just spoken.

## The CTA card in Riverside — decide once, place every time

Two ways, in order of preference:

1. **Brand-kit CTA (`brand.assets.cta_9x16` / `cta_16x9`)** — the designed card, complete (CTA, contact, headshot, logo, compliance line). Registered at setup with its Riverside media id → ONE `insert_overlay(assetId, startMs:<last ~4 s>, durationMs:4000)` full-frame. Add nothing on top.
2. **Native** — ONE `insert_text_overlay` (role TITLE, effect `boxed`, brand font, one short line: *"DM me COST"* / *"Book a call — link in bio"*), pop-in animation, then `modify_position` to the format zone (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`): vertical → top edge above the hairline (or over the closing B-roll); 16:9 → the LOWER THIRD (~75–80% down). Never over the face or the captions; synced to the closing line.

Timing: appears on the first word of the closing line, holds to the last frame (~3–5 s). **End-screen space (16:9 long-form):** YouTube lays its end-screen elements over the last 5–20 seconds, top and right of frame; keep the CTA card in the lower third and nothing important in the upper right during the closing line, so the agent can add end-screen cards in YouTube Studio without covering anything. If the video ends on B-roll, that's the best place for it (no face on screen).

## Keep it simple for the agent

One-time setup question, in plain words: *"What should people do at the end of your videos — DM you, book a call, visit your site? And the details (the word to DM, the number, the link)?"* Then it's automatic. If the Video Brand Kit exists, the CTA card is already designed — just place it.
