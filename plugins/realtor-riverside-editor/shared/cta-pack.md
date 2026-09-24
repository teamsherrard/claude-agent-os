# Call-to-action cards (the agent's branded CTA)

Read the agent's saved CTA from `~/realtor-brain/editor/config.json` (`brand.cta.text` + `brand.cta.details`, captured at setup); only ask if it's missing.

## Every video ends with their CTA

A realtor video that doesn't tell the viewer what to do next is a wasted video. Always close with the agent's call-to-action — and reinforce it **on screen**, not just spoken.

## The CTA in Riverside — a banner that pops up while they say it, decided once, placed every time

Two ways, in order of preference:

1. **Brand-kit CTA banner (`brand.assets.cta_9x16` / `cta_16x9`)** — a transparent full-canvas overlay with the CTA line, the link/handle pill, and the compliance line baked; the speaker stays on screen behind it. Registered at setup with its Riverside media id → `insert_overlay(assetId, startMs:<first word of the CTA line, source time>, durationMs:<to the last frame>)` → `modify_scale` to the canvas at time 0 → `popIn` / `fadeOut` (`graphics-style.md`). Add nothing on top.
2. **Native** — ONE `insert_text_overlay` (role TITLE, effect `boxed`, brand font, one short line: *"DM me COST"* / *"Book a call — link in bio"*), pop-in animation, then `modify_position` to the format zone (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`): vertical → top edge above the hairline (or over the closing B-roll); 16:9 → the LOWER THIRD (~75–80% down). Never over the face or the captions; synced to the closing line.

Timing: the banner appears on the first word of the CTA line (`popIn` 0.3 s) and holds to the last frame (usually 4–8 s). **Optional end card (`brand.assets.end_card_*`, long-form only):** if the kit has one, it can close the video as an opaque full-frame scene for the last 3–5 s after the banner; never on a reel. **End-screen space (16:9 long-form):** YouTube lays its end-screen elements over the last 5–20 seconds, top and right of frame; keep the CTA card in the lower third and nothing important in the upper right during the closing line, so the agent can add end-screen cards in YouTube Studio without covering anything. If the video ends on B-roll, that's the best place for it (no face on screen).

## The CTA pack — pop up the ask the agent is actually saying (kit v3)

Realtors make more than one ask per video: subscribe at the start, "comment GUIDE" in the middle, "book a call" at the end. The kit v3 ships eight banner variants under `brand.assets.cta_pack` (`subscribe`, `comment`, `guide`, `call`, `book`, `dm`, `link`, `follow`). Match them to the transcript, never invent an ask:

| The agent says (transcript) | Banner | Holds |
|---|---|---|
| "subscribe", "hit subscribe", "hit the bell" | `subscribe` | 4 s |
| "comment below", "comment [word]", "let me know in the comments" | `comment` | 4–5 s |
| "free guide", "download my", "grab my [guide]" | `guide` | 5 s |
| "give me a call", "call me", "my number" | `call` | 5 s |
| "book a call", "strategy call", "book a time", "my calendar" | `book` | 5 s to the end if it is the closing ask |
| "DM me", "send me a message" | `dm` | 4 s |
| "link below", "link in the description", "link in bio" | `link` | 4 s |
| "follow", "follow along" | `follow` | 4 s |

Rules: one banner per spoken ask, on its first word, `popIn` 0.3 s / `fadeOut` 0.3 s; the closing ask uses the PRIMARY `cta_*` banner (it carries the compliance line) and holds to the last frame; never two banners at once, never more than one every 45 s, and never a banner on an ask the agent did not make. The variant's words are baked, so add no text on top. No pack registered → the primary banner on the closing ask only, and the quick asks are covered by the spoken captions on a reel.

## Keep it simple for the agent

One-time setup question, in plain words: *"What should people do at the end of your videos — DM you, book a call, visit your site? And the details (the word to DM, the number, the link)?"* Then it's automatic. If the Video Brand Kit exists, the CTA banners are already designed — just place them.
