# The 80/20 rule — re-based for Riverside (READ FIRST)

In the Descript editor this file protected the agent's AI credits. **Riverside has no per-edit credit meter** — the plan is metered by recording/upload hours and export limits, not by what Claude does to the timeline. So what are we protecting?

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
4. **Magic Audio** — clean the audio (`set_magic_audio`, mix **0.55** default; **0.80–0.90 for phone / echoey rooms**; never so low it leaves a fishbowl, never 1.0 on a good mic where it thins the voice).
5. **Colour grade** — subtle, natural, flattering (`set_color_correction` — the bare-minimum values in `footage-look.md`). Always.
6. **Captions / on-screen text** — short-form: **karaoke** (big, below the face, active word in the brand accent). Long-form: **no word-by-word karaoke — an emphasis pop-up every ~2–3 min** instead.
7. **9:16** (short-form), face centred (`update_aspect_ratio` → smart layout FullScreen → slot offset if needed).
8. **A bit of energy (mandatory minimum, KEY beats only):** 2–3 gentle **punch-ins** (scale keyframes ~1.06×) on the key lines. A swoosh SFX on each **only if** the agent has a licensed swoosh in their library (`config.sfx.swoosh_media_id`) — Riverside exposes no SFX library. Transitions aren't a tool here; Riverside's straight cuts are clean, and that's fine.
9. **The graphics essentials only:** a hook card, the CTA, and B-roll on the key lines (short-form up to 3; long-form ~1 per 45–60s). Long-form also gets a **lower third** on the agent's first appearance (`add_lower_third`) and **native chapters** (`add_chapter`).

That clean core is the whole job. Everything past it is the agent's 20%.

## The HARD CAPS — never exceed (this is what keeps it clean)

- **B-roll — scale to length.** Short-form (≤ ~2 min): **MAXIMUM 3 clips.** Long-form: **~1 cutaway per ~45–60 seconds — a 10-min video ≈ 10–13 clips, a 15-min ≈ 15–20** (~10–15% of screen time), placed in ONE batched pass. Curated, never wall-to-wall. **If the agent wants more, they add it by hand.**
- **Graphics — keep them purposeful.** Short-form: a hook card + a CTA card (**≤2–3 cards**) — the karaoke captions carry the keyword emphasis. Long-form: hook + CTA + **an emphasis pop-up every ~2–3 min** (~3–5 on a 10-min video). Beyond that, the agent adds more by hand.
- **NO count-up animations** — not a tool here anyway; a number is a static card or lives in the caption.
- **NO heavy AI effects** — `modify_eye_correction` (eye contact), `modify_background` (removal/replace/blur on a talking head), AI-generated B-roll. Warn and skip. (`modify_video_enhancement` is a plain enhancement toggle, not banned, but not part of the recipe either — the grade is.)
- **Punch-ins — 2–3 on key beats, never every scene.**

## Definition of Done — the fixed recipe (so every video is consistent)

| Element | SHORT-FORM reel | 10-MIN LONG-FORM | LISTING reel | LONG LISTING TOUR (16:9) |
|---|---|---|---|---|
| **Cards (total)** | hook card + CTA card (**≤2–3**) | hook card + CTA card | hook/address card + price card + CTA (**≤3**) | address/title card + price card + CTA (**≤3**) |
| **Emphasis layer** | **karaoke captions ON** | **~4 emphasis pop-ups** (every ~2–3 min) — **NO karaoke** | **karaoke captions ON** | info cards + an **occasional** emphasis pop-up — **NO karaoke** |
| **Lower third** | — | **yes**, first appearance, ~5s | — | **yes** |
| **Punch-ins** | **2–3** | a couple on key beats | a couple | a couple |
| **B-roll** | **1–3 clips (max 3)** | **10–13 clips** (~1 per 45–60s) | **property B-roll room-to-room (≤3 on a reel)** | property B-roll room-to-room (exempt from the per-minute scale; **no repeats**) |
| **Music** | **bed ON at -18 dB** | — (offered as the agent's optional 20%) | **bed ON at -18 dB** | — (optional subtle bed) |
| **Magic Audio** | **0.55** (0.85 phone) | **0.55** (0.85 phone) | **0.55** (0.85 phone) | **0.55** (0.85 phone) |
| **Colour grade** | **on** | **on** | **on** | **on** |
| **Chapters** | — | **yes (native + description)** | — | **yes** |
| **Logo** | optional (brand kit) | **yes if the kit has one** (top-right, ~70% opacity) | optional | yes if the kit has one |

This is the recipe the delivery "what's inside" line should restate back to the agent. If they want more than the table says, that's the 20% they add by hand.

## Don't waste passes (the hidden drains)

- **Run THE PASS PLANS** (`${CLAUDE_PLUGIN_ROOT}/shared/riverside-playbooks.md`): short-form ≈ 4 passes, long-form ≤ 6, listing reel ≈ 4. A pass = a small group of related writes, one revision diff to verify.
- **Real expectations (from the Descript live run, translated):** a 15-min YouTube video cut to 12 min took ~60 min wall-clock and 8 passes with Descript. Riverside should take about the same wall-clock (more calls, each fast, no AI wait) with **zero credits**. Quote *time*, not credits: *"about an hour, I'll check in when the review draft is ready."*
- **Frame-QA before delivering** (`${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md`) so you're not re-exporting to fix things you couldn't see.
- **The biggest drain is OVER-CORRECTING** — too-little-B-roll → swing to too-much; tiny-caption → guess again. Follow the safe defaults the FIRST time; don't swing.
- **NEVER blind-retry a write** — check the revision first; the write usually landed.
- **Aspect ratio FIRST.** `update_aspect_ratio` is rejected once an overlay with size keyframes exists. On a reel, set 9:16 before any B-roll, card, or logo — or you'll be deleting and reinserting.

## Tell the agent (the 20% hand-off)

Default silently — just deliver the clean 80%. If they want more, say it plainly: *"I've done the clean core. You can add more B-roll, a transition, extra graphics, or tweak anything yourself in Riverside — want me to show you the 20%?"*
