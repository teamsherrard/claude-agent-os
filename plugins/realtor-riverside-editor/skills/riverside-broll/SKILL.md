---
name: riverside-broll
description: The B-roll brain for the Realtor AI Editor on Riverside. Riverside has a built-in stock library and a media panel but won't decide what goes where — so this skill sources footage and images from MULTIPLE places (the agent's own footage, Riverside's built-in stock, several free stock libraries, real-place imagery), matches each clip to the exact words, de-duplicates, and places every cutaway on the timeline full-cover (or split-screen on a vertical reel). Real places stay real (no AI-faked landmarks). Trigger on: "add b-roll", "add some footage", "add the skyline", "make it less boring", or whenever an edit needs cutaways. Usually called inside riverside-longform, riverside-shortform, or riverside-listing.
---

# Riverside B-roll brain

Claude finds the footage; Riverside holds the timeline. Follow `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, and read `${CLAUDE_PLUGIN_ROOT}/shared/broll-ladder.md` for the full sourcing rules. Goal: footage that **matches the words** and stays **varied** (never the same clip twice in a video).

## Source ladder (try in order; query the stock sources together for variety)

1. **The agent's own footage** — a Google Drive B-roll folder, files already in Riverside's Your Media (`media_list_media(productionId, search)`), files they upload for this video, and — for property videos — the listing photos as motion stills. Tag each clip and match it to the right moment. `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md` for the has-all / has-some / has-none branches.
2. **Riverside's built-in stock** — `editing_get_stock_media(query, mediaType, count)` → pick → `editing_insert_stock_media(...)`. Zero setup, imports server-side, licensed. **The easy rung.**
3. **Free stock libraries** (whichever keys are set — all optional): Pexels, Pixabay, Coverr, Unsplash. Query in parallel, de-dupe, download the DIRECT asset URL (e.g. Pexels `video_files[].link`, never the web page), then media upload → `insert_overlay`.
4. **Real-place imagery**: the agent's footage → Wikimedia Commons → Google Street View. Download → upload → place.

The ladder ends there. **NO AI-generated B-roll — ever.** If every rung runs dry, fewer, better clips.

## The rules

- **Topical first** — search terms come from the transcript. Stock video results have no alt text; judge by the URL slug and the query. Prefer clips that are obvious in a 4-second glance.
- **Local realism** — real places use real imagery. Never AI or generic foreign stock for a specific local landmark.
- **Variety — no duplicates** — keep a running list of every placed `externalSourceId` / `assetId`; check before placing; take the next result on a repeat.
- **Placement & amount (scale to length)** — 2.5–5 s each, on the exact words; never over the hook, the face, or the CTA. **Reel ≤ ~2 min: MAXIMUM 3 TOTAL.** **Long-form: ~1 per 45–60 s** (a 10-min ≈ 10–13, a 15-min ≈ 15–20; ~10–15% of screen time; the 1-per-1.5–2-min rate tested flat on a real 12-min video). **Pick every moment from the transcript first**, then place them all in one go. More → the agent's free 20%.
- **Full-cover is the default.** After every insert, read the timeline at that time, find the new overlay **track** (`uniqueId`), and `modify_scale` it to the canvas (`scaleW=W, scaleH=H` from `settings.canvas`). An unscaled overlay sits centred at its natural size — the Riverside floating-clip mistake.
- **Framing (vertical reels)** — horizontal b-roll on 9:16 → split-screen or clean full-bleed, never over-zoomed (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`). 16:9 video + vertical clip → pick a native-horizontal clip instead.
- **Licensing** — prefer no-attribution sources. CC-BY → attribution in the description, or skip.
- **The 500 MB cap** — trim a big own-footage clip locally to the seconds you need before uploading.

## Placing (the mechanics)

- **Stock:** `insert_stock_media(editId, externalSourceId, mediaType, startMs, durationMs, expectedRevision)` → timeline read → `modify_scale` to cover.
- **Own / library:** `insert_overlay(editId, assetId, startMs, durationMs, expectedRevision)` → same scale step. For a **still** (listing photo), add Ken-Burns: `modify_scale` at `t` = `1.00×`, at `t+duration` = `1.08×` (both centred).
- **Many at once:** a single `batch` can carry several low-level `insert_overlay` ops (each needs `resolution` from `get_asset_metadata`) plus their `modify_scale` ops — atomic, one revision. Stock media can't go in a batch (it imports first) — do those with the standalone tool, then one batch of scales.
- **Verify:** count the overlay tracks in a timeline read; diff the revision; frame-check one or two cutaways on a reachable rung (`${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md`).

## Handoff back to the edit

Report the count and the moments in plain words to the calling skill; log the pass (`broll · done · rev n`). Never narrate the mechanics to the agent — *"Dropped in some footage where it fits"* is the whole sentence.
