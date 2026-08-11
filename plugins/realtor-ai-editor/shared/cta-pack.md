# Call-to-action pop-ups (the agent's branded CTA pack)

Read the agent's saved CTA from `~/realtor-brain/editor/config.json` (text + details captured at setup); only ask if it's missing.

## Every video ends with their CTA

A realtor video that doesn't tell the viewer what to do next is a wasted video. Always close with the agent's call-to-action — and reinforce it **on screen**, not just spoken. If the agent says "if you want to work with me…", something must appear: their name, number, website, or "DM me."

## The branded CTA pack — decide once, rebuild instantly every time

(To be precise: there's no stored graphic sitting in a library. The **wording and brand values are saved once** in the agent's config, and the card is re-created from them on each video — which is why it's always on-brand and costs almost nothing.)

Realtors reuse the same handful of CTAs on every video:

- Subscribe · Comment below · Send me a DM · Link in bio · Call/text me · Visit my website · Follow on YouTube · Book a call

These should be **clean, branded CTA pop-ups** (the agent's colours, font, logo) that slide/pop in.

The CTA card is done **natively in Descript**, kept minimal and on-brand (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`): a **rounded brand-coloured panel** (never a flat box, never bare text), big and bold, animated in (~0.3s pop/slide), **OFF THE FACE — and the right zone depends on the format** (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` is canonical): on a **vertical reel**, pin it to the extreme top edge above the hairline, inside the top ~8–10% margin; on **16:9 long-form, use the LOWER THIRD (~75–80% down)** — the top is usually blocked by the speaker's head, and pinning high there is what put a card across a real client's eyes. Best of all in either format: **time it over the closing B-roll** (no face on screen). Never over the face or the bottom captions — synced to the exact closing line. Tell Descript exactly that every time; out of the box it makes a small flat centred box right on the face. Set the brand values once and reuse them on every video.

It fills the most common gap (no CTA on screen) and stays cheap because it's one Descript card built from values the agent set once — not a bespoke design each time.

## Keep it simple for the agent

One-time setup question, in plain words: *"Want me to make your CTA pack — subscribe, DM me, link in bio, call me — so they're ready to drop on every video?"* Then it's automatic. If an agent doesn't want the full pack, a clean text CTA in their brand colours still works. Don't overcomplicate it.
