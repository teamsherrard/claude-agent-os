# Final check — run before handing back any video

Before you tell the agent it's ready, run this self-check. This is a GATE, not a vibe-check: it runs on EVERY version, including every revision. Work the gates IN ORDER — Gate 1 (compliance) and Gate 2 (pass/fail) first; only once both are green do you move on to the polish self-check and the delivery message. If something fails, fix it. Don't deliver broken work, and don't over-report.

**When it runs relative to the ONE render:** blockers 1–9 are measured from the timeline, the transcript, and the revision diff — run them BEFORE `exports_create_export`, so a miss costs a write, not a render. Blockers 10–16 are visual: run them on the export (rung 1) or the editor preview (rung 2) after the render. A second render happens only when a visual blocker fails.

---

## GATE 1 — COMPLIANCE (non-negotiable; runs first, every version)

This is ASSISTANCE, not legal advice — you are helping the agent not trip over their own brokerage's rules. But the items below are hard: a compliance miss can get a real estate agent in real trouble, so a fail here is a BLOCKER.

First, read `identity/compliance.md` from the agent's Brain. It can be in THREE states — detect which one before you do anything else:
- **(1) MISSING** — the file doesn't exist.
- **(2) PRESENT + FILLED** — real disclaimer text (an actual brokerage name, a real license #, real wording).
- **(3) PRESENT BUT UNFILLED PLACEHOLDER** — still the first-run template: any `[bracketed]` token (`[Brokerage Name]`, `[License #]`, `[disclaimer text]`) or an unreplaced template heading. **Detection rule:** any `[` bracket token or unreplaced template heading = UNFILLED.

**States (1) and (3) are handled IDENTICALLY — and neither FAILS the gate:** warn the agent ONCE in plain language ("I couldn't find a finished compliance file, so I've kept the video free of any claim cards to be safe. Say 'set up my compliance' to lock your brokerage disclaimer + license #."), then **do NOT auto-add any claim-bearing card** (no stat cards, no "best/top/#1", no neighbourhood "who it's for" copy) and **NEVER stamp a `[placeholder]` disclaimer onto the video** — or into a publish description. Captions of what they actually said are fine. Deliver safely — do NOT stop or FAIL over a missing/unfilled disclaimer.

When `identity/compliance.md` is **(2) FILLED**, every card, banner, and on-video caption must pass ALL of these. Post copy (title, description, reel caption) is CHECKED against the same list but never edited here: a miss in the owner's copy is a stop, sent back to the plugin that wrote it (`boundaries.md`):
- **No banned / superlative / guarantee claims** anywhere on screen or in the post copy — "best agent", "#1", "top agent", "guaranteed", "the only", "always", "never lose". If they literally said it on camera it can stay in the spoken captions, but never manufacture it into a card or a description.
- **Required brokerage disclaimer + license #** wherever the file requires it (the primary CTA banner / end card / description). Use exactly what the file specifies. A FILLED file that requires a disclaimer but gives no real text → FAIL → stop and ask.
- **Fair-housing-safe language** on any neighbourhood or "who it's for" text — no steering ("great for families", "safe area", "good schools so you know the type", "perfect for young professionals"). Describe the HOME and the FACTS, never who should live there.

Emit a literal line for each:
- `COMPLIANCE — banned/superlative claims: PASS / FAIL / FIXED`
- `COMPLIANCE — disclaimer + license #: PASS / FAIL / FIXED / N/A (no compliance.md — claim cards withheld) / N/A (compliance.md is an unfilled placeholder — claim cards withheld, nudged once)`
- `COMPLIANCE — fair-housing language: PASS / FAIL / FIXED`

Any compliance FAIL you cannot fix in ≤1 pass → STOP. Do not deliver. Tell the agent which item failed, in plain language.

---

## GATE 2 — HARD PASS / FAIL (blockers vs polish; runs on every version)

BLOCKERS auto-fail — cannot deliver. POLISH — fix if you can, doesn't block. For EACH blocker, emit a literal line: `<item>: PASS` / `FAIL` / `FIXED` / `N/A (<why>)` / `UNVERIFIED (rule-placed, agent to eyeball)`.

**The measured rule (the Riverside upgrade):** every NON-visual blocker cites the timeline read, transcript read, or revision diff that proves it — e.g. `1. audio at an audible level: PASS (track 1 enhancedAudioMix enabled, mixLevel 0.70, rev 9)`. A number you did not read back is not a PASS.

**The frame-read rule (because the editor has lied about this before):** every VISUAL blocker's PASS MUST cite the exact frame you actually viewed and the rung of `${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md` you used — e.g. `13. no text over the face: PASS (export frame @ 00:07, rung 1)` or `(editor screenshot @ 00:07, rung 2)`. A PASS with no cited, actually-viewed frame is NOT a pass. If no frame rung was reachable (only rung 4, rule-based), the line is `UNVERIFIED (rule-placed, agent to eyeball)` — an honest state that ships ONLY with the matching sentence in the delivery. **Never write PASS on a frame you did not look at.**

**BLOCKERS — measured from the timeline, transcript, and diff (run BEFORE the export):**
1. `audio at an audible level` — every speaker track carries an `audio.enhancedAudioMix` keyframe with `enabled:true` and `mixLevel` ≥ 0.70 (0.85 phone / echoey room), or a logged pro-mic reason (0.45 or off). Not silently skipped. (timeline read — cite track + level)
2. `grade inside the visible band` — the speaker track's `colorCorrection` keyframe carries the values for the pack and footage in use (`footage-look.md`: default contrast 0.10–0.20 and saturation 0.06–0.12; cinematic and halved-phone values are their own band), or a logged reason. Never past the over-cooked line. A frame shows natural skin with shadow detail. (timeline + VISUAL)
3. `clean cut, proven` — the whole transcript re-read after the cut: no restart phrase, no six-word sentence twice, every Riverside AI retake flag (`comments[]` on the recording clip) cut or logged with a reason; fillers and pauses toggled on in the diff (`clean-cut.md`). (transcript read + diff — cite the re-read)
4. `opened on the hook` — no settling-in / silent lead-in. (transcript row 1 — cite the first words)
5. `ended on a complete thought` — never mid-sentence. (last transcript row — cite)
6. `music present` — a bed under the voice on every format (-18 dB reel, -22 dB long-form), spanning the final length; on long-form also a section stinger at each section change — unless the agent said no or the topic is serious (logged). (timeline read — cite the audio clips)
7. `energy at the rate` — zoomed scenes (`positioning.scale` on the scene, 1.06 / 1.10 / 1.14) at the format's rate: long-form one per 45–75 s with no 90-second stretch without one, reels at least 3 (one per 12–20 s); every editorial cut (`syncedCuts` with `source:"user"`) covered by a size change. (scenes read — cite the count and the sizes)
8. `b-roll present, within the cap, no repeats` — at least one cutaway on every long-form; short-form ≤3; long-form ~1 per 45–60 s; no repeated `assetId` / `externalSourceId`. Long listing tour: room cutaways exempt from the per-minute scale. (count on the timeline)
9. `aspect ratio correct + every logged pass real` — a reel's `settings.canvas` is portrait, long-form 16:9; every pass in the checkpoint log has a revision the diff can show. (timeline read + compare_revisions)

**BLOCKERS — visual (run on the export or the editor preview, after the render):**
10. `captions right for the format` — SHORT-FORM: karaoke on, `position.y` 0.82–0.86, `widthRatio ≤ 0.8`, below the face. LONG-FORM: captions OFF (`settings.captions.show:false` — a Riverside-made edit arrives with them on). (timeline + VISUAL — cite frame)
11. `CTA on screen` — the primary CTA banner appears on the first word of the CTA line and holds to the last frame (or the end card closes the video); every mid-video `cta_pack` banner sits on the line where that ask is spoken; never two banners at once. (VISUAL — cite frame)
12. `long-form emphasis pop-ups present (every ~2–3 min)` + `name strip on first appearance` — long-form only; N/A short-form. (timeline + one VISUAL)
13. `NO text/banners over the face` — captions AND every kit piece or card clear of the face (or timed over B-roll). Zone matches the FORMAT (`graphics-style.md`): vertical → top zone; **16:9 → LOWER THIRD**. Remember Riverside inserts native text CENTRED by default — if you didn't move it, it's on the face. (VISUAL — cite a frame at each card/caption moment)
14. `no exposed black bars, no dark cutaways, no accidental background removal` — footage fills the frame; zoomed scenes ≥ 1.0 and centred; every B-roll overlay scaled to cover, **as bright as the speaker's shot** (no dusk, night, or moody-dark clips over a lit talking head; no fade through black), and recognisable in a 4-s glance; no `video.background` keyframe on the speaker track. (VISUAL at each cutaway's midpoint + timeline)
15. `text CONTAINED and clean at FULL resolution` — for EVERY typed line and native card: all words inside the panel or zone, nothing cut at the frame edge, one short line, centred to the zone, single spaces. Brand-kit PNGs crisp, not upscaled soft. (VISUAL — full-res crop per card)
16. `no collisions` — captions, banners, pop-ups, the name strip, and the logo never overlap each other. (VISUAL)

**POLISH (does NOT block):** caption size fine-tuning, the bed a few dB either way inside its window, a zoom cut that lands a beat early or late, panel rounding, B-roll word-matching nuance. Note any you couldn't perfect so the agent knows it's part of their free 20%.

**Hard stop rule:** any BLOCKER (or compliance item) that FAILS and is NOT fixable in ≤1 pass → STOP. Tell the agent EXACTLY which item failed, in plain language.

---

## The basics (NON-NEGOTIABLE — the 80%, always done; each one is a blocker above)
- **Audio enhanced at an audible level** — 0.70 (0.85 phone), on every speaker track, read back (blocker 1).
- **Colour grade applied and VISIBLE** — inside the band in `footage-look.md`, skin natural, shadows with detail (blocker 2).
- **Clean cut, proven** — fillers, dead air, duplicate takes, false starts, restart phrases removed, and the post-cut re-read done (blocker 3).
- **Opens on the hook, ends on a complete thought** (blockers 4–5).
- **Music bed present on every format** (-18 dB reel, -22 dB long-form) and section stingers on long-form, unless the agent said no or the topic is serious (blocker 6).
- **Energy present** — zooms at the format's rate on real beats, every editorial cut covered (blocker 7). A flat video is a fail; a zoom on every sentence is the opposite fail.
- **B-roll actually present** on every long-form; unique; within the cap; bright (blockers 8, 14).
- **Captions / on-screen text right for the format** — SHORT-FORM: karaoke, big, outline, active word in the brand accent set explicitly. LONG-FORM: captions off — emphasis pop-ups every ~2–3 min + a name strip (blockers 10, 12).
- **The CTA on screen**, on the line it is spoken, to the end (blocker 11).

## Captions & graphics
- Graphics purposeful: short-form hook banner + CTA banner (+ a pack banner on a spoken ask); long-form hook + name strip + pop-ups + pack banners + the primary CTA. Brand-kit PNGs when registered; native boxed text otherwise. Never bare floating text on busy footage.
- **Captions AND every piece sit OFF the face — absolute.**
- Every text element FITS its zone; nothing overlaps (captions, banners, pop-ups, name strip, logo).

## Framing & footage
- Footage fills the frame; zooms stay ≥ 1.0 and centred (the step-back move cuts OUT to 1.0, never below); B-roll overlays scaled to cover.
- **Text/cards inside the vertical safe zones** — out of the right ~12% icon rail and the bottom ~15% bar; centred, never flush-right (the feed UI isn't in the export — verify by rule + the agent's eyeball: `layouts.md`).
- Real background intact.

## Look & feel
- Purposeful creativity, not clutter; no banned AI effects; nothing promised that the tool didn't do (no invisible "transitions").

## Discipline held (the 80/20)
- The 80% basics all done; the extras within the caps. ONE working edit (plus the snapshot clone and the cut-only master when the line calls for them). No blind retries; every pass diff-verified and logged.

## Verify, then deliver
- Both gates green BEFORE you hand anything back.
- **Exported at `1080p`, never lower** — check what you passed to `exports_create_export`; the status is `COMPLETED`.
- Hand back once, in plain language, using the standard delivery message below.

## GATE 3 — DELIVERY MESSAGE (the standard hand-back)

Always frame the export as a **REVIEW DRAFT** — never "done", "final", or "perfect". Four parts, plain language:

1. **It's a review draft.** *"Here's your review draft — take a look before you post."* + where to find it (the edit link from `platform_get_edit.riversideUrl`, and the export in Riverside's Exports).
2. **The spec you hit.** One or two lines that restate the recipe: *"Cleaned up the audio and the repeated takes, opened on your hook, a natural colour lift, eleven zooms on your key lines, a quiet music bed, 12 cutaways, your name strip, your pop-ups, and your CTA banner on the closing ask."* (A reel: *"9:16, karaoke captions, 3 zooms, 2 cutaways, music, hook banner and CTA banner."*)
3. **The 2–3 human-eyeball checks** — only what you genuinely couldn't verify:
   - "Does the audio FEEL right to your ear, and does the music sit low enough under your voice?" (no rung can hear)
   - "Any text that drifts near your face when you move?" (on-face nuance across motion)
   - "Does the flow feel like you?"
   - If any blocker is `UNVERIFIED`, name it here explicitly: *"I placed the hook banner by the rules but couldn't look at the frame this time — please check it's clear of your face."*
4. **The 80/20 hand-off line (ALWAYS).** *"I've done the heavy 80%. The last 20% — small tweaks, swapping a clip, a transition if you want one — is yours to finish by hand in Riverside, free."*

Then, one line each, when they apply: **long-form:** *"Your section map is ready — say 'SEO for this' and your title, description, and chapters get written properly."* · *"Want reels cut from it, or a 20-second trailer for the day before?"* · **every format:** *"Want me to post it or schedule it? I'll show you exactly what goes out first."*

**You cannot watch the rendered video play — but you CAN read frames when a rung is reachable** (`frame-qa.md`). Do that BEFORE involving the agent. What you still CANNOT verify — live playback, audio feel, on-face nuance across motion, overall flow — is the agent's. Never claim a visual is confirmed on a frame you haven't looked at. **Final visual QA is still a human step — say so plainly.**
