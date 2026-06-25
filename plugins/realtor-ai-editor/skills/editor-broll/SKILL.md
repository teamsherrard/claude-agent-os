---
name: editor-broll
description: The B-roll brain for the Realtor AI Editor. Descript can host B-roll but won't go find it — so this skill sources footage and images from MULTIPLE places (the agent's own footage, Descript's built-in stock, and several free stock libraries) so the B-roll matches what's being said and never recycles the same clips. It then imports the chosen media into Descript via the connector and places it on the exact words. Real places stay real (no AI-faked landmarks). Trigger on: "add b-roll", "add some footage", "add the skyline", "make it less boring", or whenever an edit needs cutaways. Usually called inside edit-longform or edit-shortform.
---

# Editor B-roll brain

Claude finds the footage; Descript holds the timeline. Follow `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, and read `${CLAUDE_PLUGIN_ROOT}/shared/broll-ladder.md` for the full sourcing rules. Goal: footage that **matches the words** and stays **varied** (never the same clip twice in a video).

## Source ladder (try in order; query the stock sources together for variety)

1. **The agent's own footage** (always preferred — authentic, free, accurate). It can come from three places: a **Google Drive B-roll folder** they keep, **files they upload for this video** (e.g. a listing's kitchen, backyard, drone), and — for property videos — the **listing photos** as motion stills. Tag each clip and match it to the right moment. See `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md` for gathering it and the has-all / has-some / has-none branches.
2. **Descript's built-in stock** — zero setup, already in their account.
3. **Free stock libraries** (whichever keys are set — all optional). Query them **in parallel and de-duplicate** so you get variety instead of Pexels' same five clips:
   - **Pexels** — photos + video
   - **Pixabay** — photos + video (different library → big variety boost)
   - **Coverr** — video
   - **Unsplash** — high-quality photos (for Ken-Burns stills)
4. **Real-place imagery** (for actual neighbourhoods/landmarks): the agent's footage → **Wikimedia Commons** real photos → **Google Street View / map** of the exact spot. See the local-realism rule below.
5. **AI-generated** — last resort only, capped at 1–2 per video, and never for a real place. Warn about the credit cost first.

## The rules

- **Topical first** — derive search terms from the transcript so the footage matches what's actually being said (a kitchen line gets a kitchen, not a generic skyline).
- **Local realism** — agents talk about real places their audience knows. Use real imagery (own footage / Wikimedia / Street View). **Never** use AI or generic foreign stock to fake a specific local landmark — it erodes trust and is a compliance risk.
- **Variety — no duplicates** — every cutaway is unique; **NEVER reuse the same clip at all, and never twice in a row** (a repeat looks broken and wastes credits). Track every clip already placed and check each new one against it; if a source returns a used clip, pull the next.
- **Placement & amount (hard cap)** — 2.5–5s each, on the exact words; **full-cover, never a partial clip floating over the face**; never cover the hook, the face, or the CTA. **A short-form reel gets 3–5 cutaways TOTAL — never more** (over-b-roll drains credits, clutters, and buries the agent's face); long-form gets more but curated, never wall-to-wall. **About to exceed 5 on a reel? STOP and cut the weakest instead of adding.**
- **Framing (vertical reels)** — horizontal b-roll on a 9:16 reel → **split-screen or clean full-bleed, never over-zoomed or floating** (an over-cropped clip becomes an unreadable close-up). See `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`.
- **Licensing** — prefer the no-attribution, commercial-OK sources (Pexels, Pixabay, Coverr, Unsplash). If a source needs attribution (some Wikimedia/CC items), either add it to the description automatically or skip the item. Default to the agent's own footage when in doubt.

## Handoff to Descript

Import the chosen media into the Descript project via the connector (import-media), then instruct Descript to place each clip at its transcript moment. The agent sees it appear live. Verify nothing covers the face before moving on.
