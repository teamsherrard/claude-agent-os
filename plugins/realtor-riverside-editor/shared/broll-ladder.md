# B-roll ladder & sources

The point of going multi-source: stop recycling the same five clips. Query several free libraries together, de-duplicate, and prefer variety.

**B-ROLL IS NOT OPTIONAL — every long-form / YouTube video ALWAYS gets at least some B-roll.** Even with no agent footage and no stock keys, use **Riverside's built-in stock** (`editing_get_stock_media` — Pexels, zero setup, imports server-side) for topical cutaways. Never deliver a long-form as a bare talking-head.

## Sources

| Source | Gives you | Key needed | How it gets onto the timeline | Commercial use | Attribution |
|---|---|---|---|---|---|
| Own footage — uploaded for this video | the exact rooms / property | no | media upload (≤500 MB/file) → `insert_overlay` | yes | no |
| Own footage — Google Drive library | reusable clips they keep | no (Drive connector) | media upload where a shell exists; otherwise the agent drops it into Riverside's media panel → `insert_overlay` | yes | no |
| Own footage — already in Riverside's Your Media | clips they dropped in the editor | no | `media_list_media(search)` → `insert_overlay` | yes | no |
| Listing photos — as motion stills | the actual property | no | media upload (JPG/PNG) → `insert_overlay`, scaled to cover at time 0, entrance animation only (no mid-clip keyframes) | yes | no |
| **Riverside built-in stock (Pexels)** | photos + video | no | `get_stock_media` → `insert_stock_media` (one step) | yes | no |
| **Pexels** (direct) / **Pixabay** / **Coverr** / **Unsplash** | more variety | free key each | download → media upload → `insert_overlay` (needs a shell; in Cowork this rung is skipped) | yes | no |
| Wikimedia Commons | real-place photos | no | download → media upload | varies | sometimes (CC-BY) |
| Google Street View / Maps | the exact real location | free tier | download → media upload | per Google terms | — |

**The built-in stock is the easy rung** — no download, no upload, no 500 MB question. Reach for the keyed libraries only when it repeats or misses.

## Own footage first (and the has / has-none branch)

Always prefer the agent's own footage — from a Drive library, per-video uploads, files already in Your Media, or (for listings) the listing photos. See `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`. **Property-specific moments need property-specific footage/photos; generic moments can use stock.** Never imply stock footage is the actual listing.

## The rules

1. **Try the ladder in order:** own footage → Riverside stock → keyed free libraries (de-duped) → real-place imagery. **NO AI-generated B-roll — banned** (`${CLAUDE_PLUGIN_ROOT}/shared/cost-discipline.md`); if the ladder runs dry, fewer, better clips.
2. **Topical first** — search terms come from the transcript so footage matches the words. For stock video, `description` is null — judge by the `url` slug and the query; for images, read the alt text.
3. **Local realism** — real places use real imagery. Never AI-fake or use generic foreign stock for a specific local landmark.
4. **Variety — no duplicates anywhere** — keep a running list of every `externalSourceId` / `assetId` placed; check each new one BEFORE placing; if a source returns one already used, take the next result.
5. **Placement & amount (HARD CAP)** — 2.5–5 s each, on the exact words; **full-cover is the DEFAULT** (after insert, one batch `modify_scale {clipId:<the new overlay clip's uniqueId from the insert result or a timeline read>, time:{n:0,d:1}, scaleW:640, scaleH:360, canvasWidth:640, canvasHeight:360}` on 16:9 — 360×640 on a reel; live-tested: overlays land at 90% of the canvas with a border, so an unscaled one shows the speaker around its edges); never over the hook, face, or CTA. Short-form (≤ ~2 min): **MAXIMUM 3.** Long-form: **~1 per 45–60 s** (a 10-min ≈ 10–13, a 15-min ≈ 15–20; ~10–15% of screen time) — the old 1-per-1.5–2-min rate tested flat on a real 12-min video. Place them all in ONE pass. **More than that is the agent's free 20%.**
6. **Recognisable in a 4-second glance, and BRIGHT** — reject dark blurs and abstract macros; swap, don't ship. **Brightness is a hard rule (from a live run, 2026-09-23: dusk-neighbourhood clips over a well-lit talking head read as a mistake):** a cutaway must be at least as bright as the speaker's shot. Put `daytime`, `sunny`, or `bright` in every stock query and never `night`, `dusk`, `evening`, `moody`, `cinematic`, `dark`; skip any result whose `url` slug or alt text says otherwise. The only exception is a line that is literally about night. After placement, frame-check every cutaway at its midpoint (`frame-qa.md`): darker than the talking head → swap it. Entrances are a hard cut (or, on the calm packs, `set_overlay_clip_animations {clipId, inAnimation:{animationType:"fadeIn", duration:{n:3,d:20}}}`); never a fade through black, never a dark grade on a cutaway.
7. **Vertical reel + horizontal clip** → split-screen or clean full-bleed, never over-zoomed (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`). 16:9 video + vertical clip → pick a native-horizontal clip instead.
8. **Licensing** — prefer no-attribution sources. Skip CC-BY items, or hand the attribution line to the YouTube System to place in the description (the Studio never writes a description).
9. **The 500 MB rule** — the media upload rejects bigger files. A 4K drone clip over the cap: trim it first — with ffmpeg where a shell exists (`ffmpeg -ss … -t 6 -c copy`), otherwise the agent trims it in Riverside's media panel or on their phone — you only need 3–5 s of it anyway.

## Adding more later

All stock keys are optional and free. The agent can add Pexels/Pixabay/Unsplash/Coverr anytime in `studio-setup`; more sources = more variety, never required to start.
