# The 80/20 rule — re-based for Riverside (READ FIRST)

**Riverside has no per-edit credit meter** — the plan is metered by recording/upload hours and export limits, not by what Claude does to the timeline. So what are we protecting?

1. **The agent's time and attention.** Dozens of tool calls happen behind the scenes; every extra pass is another thing that can go wrong and another review round for them.
2. **Their plan limits.** Exports count. A free or entry plan may watermark exports (the connector overwrites the watermark flag from the plan — you don't control it) and cap export quality/hours. **ONE render** is still the rule.
3. **The look.** Doing less, but well, is both simpler AND more premium. The over-edited video and the broken video are the same video.

The #1 rule survives unchanged: **do the high-value basics brilliantly, then STOP.**

## The 80/20 split (the core promise)

- **The editor (Claude in Riverside) does the 80%** — the basics that turn raw footage into a clean, professional, ready-to-post video. These are ALWAYS done, every video.
- **The agent does the last 20% by hand in the Riverside editor** — extra B-roll, extra graphics, fine tweaks, a transition they like. Free, and it's where they add personal flair.
- This is exactly what we tell them in training: *"The editor gets you 80% of the way there — here's the 20% you finish by hand."*

## The 80% — ALWAYS do these (this is the value; never skip one)

1. **Clean cut** — filler words (`remove_fillers` Cut), dead air (`remove_pauses`), duplicate takes / false starts (transcript-resolved cuts).
2. **Clean open — ON THE HOOK** (cut the settling-in / "let's go" / throat-clear with a resolved cut from 0 to the first word of the hook line).
3. **Clean end** — finish on a complete thought, never mid-sentence; trim the camera-off reach.
4. **Magic Audio** — clean the audio (`set_magic_audio`, mix **0.70** default; **0.85 for phone / echoey rooms**; never so low it leaves a fishbowl, never 1.0 on a good mic where it thins the voice).
5. **Colour grade** — subtle, natural, flattering (`set_color_correction` — the visible-but-natural values in `footage-look.md`). Always.
6. **Captions / on-screen text** — short-form: **karaoke** (big, below the face, active word in the brand accent). Long-form: **no word-by-word karaoke — an emphasis pop-up every ~2–3 min** instead.
7. **9:16** (short-form), face centred (`update_aspect_ratio` → smart layout FullScreen → slot offset if needed).
8. **Energy (mandatory minimum):** zooms on the emotional beats at the format's rate (long-form one every 45–75 s, reels one every 12–20 s; sizes 1.06 / 1.10 / 1.14 by strength), a step-back on the biggest reveal, and a size change on every editorial cut (`effects-menu.md`). A swoosh SFX on each **only if** the agent has a licensed swoosh in their library (`config.sfx.swoosh_media_id`) — Riverside exposes no SFX library. Transitions aren't a tool here; Riverside's straight cuts are clean, and that's fine.
9. **The graphics essentials:** the hook banner, the CTA banners (the primary on the closing ask, a pack banner on each other spoken ask), and B-roll on the key lines (short-form up to 3; long-form ~1 per 45–60 s). Long-form also gets a **name strip** on the agent's first appearance and a **section map** handed to the YouTube System (markers on the timeline are navigation only, named by the first spoken words).
10. **Music on every video** — -18 dB on a reel, -22 dB with section stingers on a long-form (`music.md`).

That clean core is the whole job. Everything past it is the agent's 20%.

## The HARD CAPS — never exceed (this is what keeps it clean)

- **B-roll — scale to length.** Short-form (≤ ~2 min): **MAXIMUM 3 clips.** Long-form: **~1 cutaway per ~45–60 seconds — a 10-min video ≈ 10–13 clips, a 15-min ≈ 15–20** (~10–15% of screen time), placed in ONE batched pass. Curated, never wall-to-wall. **If the agent wants more, they add it by hand.**
- **Graphics — keep them purposeful.** Short-form: a hook banner + the CTA banner, plus a pack banner only on an ask the agent actually says (**≤3 pieces**) — the karaoke captions carry the keyword emphasis. Long-form: hook + name strip + **an emphasis pop-up every ~2–3 min** (~3–5 on a 10-min video) + a pack banner per spoken ask (≤1 per 45 s) + the primary CTA. Beyond that, the agent adds more by hand.
- **NO count-up animations** — not a tool here anyway; a number is a static card or lives in the caption.
- **NO heavy AI effects** — `modify_eye_correction` (eye contact), `modify_background` (removal/replace/blur on a talking head), AI-generated B-roll. Warn and skip. (`modify_video_enhancement` is a plain enhancement toggle, not banned, but not part of the recipe either — the grade is.)
- **Zooms — at the format's rate on real beats, never on every sentence.** A 10-minute video: 9–13. A 40-second reel: 3. Never two in a row at the same size.

## Definition of Done — the fixed recipe (so every video is consistent)

| Element | SHORT-FORM reel | 10-MIN LONG-FORM | LISTING reel | LONG LISTING TOUR (16:9) |
|---|---|---|---|---|
| **Banners / cards** | hook banner + CTA banner (+ a pack banner on a spoken ask, **≤3**) | hook banner + name strip + pop-ups + pack banners (≤1 per 45 s) + the primary CTA | hook/address card + price card + CTA (**≤3**) | address/title card + price card + CTA (**≤3**) |
| **Emphasis layer** | **karaoke captions ON** | **~4 emphasis pop-ups** (every ~2–3 min) — **NO karaoke** | **karaoke captions ON** | info cards + an **occasional** emphasis pop-up — **NO karaoke** |
| **Lower third** | — | **yes**, first appearance, ~5s | — | **yes** |
| **Zooms** | **3** (one per 12–20 s) | **9–13** (one per 45–75 s) + cut covers | 3 | one per 45–75 s |
| **B-roll** | **1–3 clips (max 3)** | **10–13 clips** (~1 per 45–60s) | **property B-roll room-to-room (≤3 on a reel)** | property B-roll room-to-room (exempt from the per-minute scale; **no repeats**) |
| **Music** | **bed ON at -18 dB** | **bed ON at -22 dB** + section stingers | **bed ON at -18 dB** | **bed ON at -22 dB** |
| **Magic Audio** | **0.70** (0.85 phone) | **0.70** (0.85 phone) | **0.70** (0.85 phone) | **0.70** (0.85 phone) |
| **Colour grade** | **on** | **on** | **on** | **on** |
| **Section map → YouTube System** | — | **yes** (it names the chapters) | — | **yes** |
| **Logo** | optional (brand kit) | **yes if the kit has one** (top-right, ~70% opacity) | optional | yes if the kit has one |

This is the recipe the delivery "what's inside" line should restate back to the agent. If they want more than the table says, that's the 20% they add by hand.

## Don't waste passes (the hidden drains)

- **Run THE PASS PLANS** (`${CLAUDE_PLUGIN_ROOT}/shared/riverside-playbooks.md`): short-form ≈ 4 passes, long-form ≤ 7, listing reel ≈ 4. A pass = a small group of related writes, one revision diff to verify.
- **Real expectations (live runs, Sept 2026):** a 12-minute long-form takes about an hour wall-clock including the render, a reel about 12 minutes, with **zero credits**. Quote *time*, not credits: *"about an hour, I'll check in when the review draft is ready."*
- **Frame-QA before delivering** (`${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md`) so you're not re-exporting to fix things you couldn't see.
- **The biggest drain is OVER-CORRECTING** — too-little-B-roll → swing to too-much; tiny-caption → guess again. Follow the safe defaults the FIRST time; don't swing.
- **NEVER blind-retry a write** — check the revision first; the write usually landed.
- **Aspect ratio FIRST.** `update_aspect_ratio` is rejected once an overlay with size keyframes exists. On a reel, set 9:16 before any B-roll, card, or logo — or you'll be deleting and reinserting.

## Tell the agent (the 20% hand-off)

Default silently — just deliver the clean 80%. If they want more, say it plainly: *"I've done the clean core. You can add more B-roll, a transition, extra graphics, or tweak anything yourself in Riverside — want me to show you the 20%?"*
