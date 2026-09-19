# Final check — run before handing back any video

Before you tell the agent it's ready, run this self-check. This is a GATE, not a vibe-check: it runs on EVERY version, including every revision. Work the gates IN ORDER — Gate 1 (compliance) and Gate 2 (pass/fail) first; only once both are green do you move on to the polish self-check and the delivery message. If something fails, fix it. Don't deliver broken work, and don't over-report.

---

## GATE 1 — COMPLIANCE (non-negotiable; runs first, every version)

This is ASSISTANCE, not legal advice — you are helping the agent not trip over their own brokerage's rules. But the items below are hard: a compliance miss can get a real estate agent in real trouble, so a fail here is a BLOCKER.

First, read `identity/compliance.md` from the agent's Brain. It can be in THREE states — detect which one before you do anything else:
- **(1) MISSING** — the file doesn't exist.
- **(2) PRESENT + FILLED** — real disclaimer text (an actual brokerage name, a real license #, real wording).
- **(3) PRESENT BUT UNFILLED PLACEHOLDER** — still the first-run template: any `[bracketed]` token (`[Brokerage Name]`, `[License #]`, `[disclaimer text]`) or an unreplaced template heading. **Detection rule:** any `[` bracket token or unreplaced template heading = UNFILLED.

**States (1) and (3) are handled IDENTICALLY — and neither FAILS the gate:** warn the agent ONCE in plain language ("I couldn't find a finished compliance file, so I've kept the video free of any claim cards to be safe. Say 'set up my compliance' to lock your brokerage disclaimer + license #."), then **do NOT auto-add any claim-bearing card** (no stat cards, no "best/top/#1", no neighbourhood "who it's for" copy) and **NEVER stamp a `[placeholder]` disclaimer onto the video** — or into a publish description. Captions of what they actually said are fine. Deliver safely — do NOT stop or FAIL over a missing/unfilled disclaimer.

When `identity/compliance.md` is **(2) FILLED**, every card, caption, AND publish caption/description must pass ALL of these:
- **No banned / superlative / guarantee claims** anywhere on screen or in the post copy — "best agent", "#1", "top agent", "guaranteed", "the only", "always", "never lose". If they literally said it on camera it can stay in the spoken captions, but never manufacture it into a card or a description.
- **Required brokerage disclaimer + license #** wherever the file requires it (CTA card / description). Use exactly what the file specifies. A FILLED file that requires a disclaimer but gives no real text → FAIL → stop and ask.
- **Fair-housing-safe language** on any neighbourhood or "who it's for" text — no steering ("great for families", "safe area", "good schools so you know the type", "perfect for young professionals"). Describe the HOME and the FACTS, never who should live there.

Emit a literal line for each:
- `COMPLIANCE — banned/superlative claims: PASS / FAIL / FIXED`
- `COMPLIANCE — disclaimer + license #: PASS / FAIL / FIXED / N/A (no compliance.md — claim cards withheld) / N/A (compliance.md is an unfilled placeholder — claim cards withheld, nudged once)`
- `COMPLIANCE — fair-housing language: PASS / FAIL / FIXED`

Any compliance FAIL you cannot fix in ≤1 pass → STOP. Do not deliver. Tell the agent which item failed, in plain language.

---

## GATE 2 — HARD PASS / FAIL (blockers vs polish; runs on every version)

BLOCKERS auto-fail — cannot deliver. POLISH — fix if you can, doesn't block. For EACH blocker, emit a literal line: `<item>: PASS` / `FAIL` / `FIXED` / `UNVERIFIED (rule-placed, agent to eyeball)`.

**The frame-read rule (because the editor has lied about this before):** every VISUAL blocker's PASS MUST cite the exact frame you actually viewed and the rung of `${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md` you used — e.g. `no text/cards over the face: PASS (export frame @ 00:07, rung 1)` or `(editor screenshot @ 00:07, rung 2)`. A PASS with no cited, actually-viewed frame is NOT a pass. If no rung above 4 was reachable, the line is `UNVERIFIED (rule-placed, agent to eyeball)` — an honest state that ships ONLY with the matching sentence in the delivery. **Never write PASS on a frame you did not look at.**

**The diff rule (the Riverside upgrade):** every NON-visual blocker cites the revision diff or timeline read that proves it — e.g. `Magic Audio confirmed ON: PASS (track 3 mixLevel 0.55, rev 9)`.

**BLOCKERS:**
1. `Magic Audio confirmed ON (0.55 / 0.85 phone)` — every speaker track; not silently skipped. (timeline read — cite track + level)
2. `short-form captions present + below the face` — karaoke on, `position.y` 0.82–0.86, `widthRatio ≤ 0.8`. (VISUAL — cite frame)
3. `opened on the hook` — no settling-in / silent lead-in. (transcript row 1 — cite the first words)
4. `ended on a complete thought` — never mid-sentence. (last transcript row — cite)
5. `CTA on screen` — the agent's CTA card is present at the end. (VISUAL — cite frame)
6. `colour grade applied` — a colorCorrection keyframe exists on the speaker track; skin not pale/orange/yellow. (timeline + VISUAL)
7. `NO text/cards over the face` — captions AND cards clear of the face (or timed over B-roll). Zone matches the FORMAT (`graphics-style.md`): vertical → top edge; **16:9 → LOWER THIRD (~75–80% down)**. Remember Riverside inserts text CENTRED by default — if you didn't move it, it's on the face. (VISUAL — cite a frame at each card/caption moment)
8. `no exposed black bars` — footage fills the frame; punch-ins ≥100% and centred; every B-roll overlay scaled to cover. (VISUAL)
9. `no accidental background removal / blur` — no `video.background` keyframe on the speaker track; real room intact. (timeline + VISUAL)
10. `b-roll within the cap + no repeats` — short-form ≤3; long-form ~1 per 45–60 s; no repeated `assetId` / `externalSourceId`; each recognisable in a 4-s glance. Long listing tour: room cutaways exempt from the per-minute scale. (count on the timeline; VISUAL for recognisability)
11. `long-form emphasis pop-ups present (every ~2–3 min)` + `lower third on first appearance` — long-form only; N/A short-form. (timeline + one VISUAL)
12. `text CONTAINED inside its panel` — for EVERY native card/pop-up/CTA: all words inside the boxed panel, nothing cut at the frame edge, one short line. (VISUAL — full-res crop per card)
13. `card typography clean at FULL resolution` — centred to the panel, single spaces, panel hugs the text, no drift. Brand-kit PNGs: crisp, not upscaled soft. (VISUAL — full-res crop)
14. `aspect ratio correct` — reel canvas is portrait (`settings.canvas` from the timeline); long-form 16:9. (timeline read)
15. `every pass in the checkpoint log has a revision that exists` — no pass claimed that the diff can't show. (compare_revisions)

**POLISH (does NOT block):** caption size fine-tuning, bed level, punch-in smoothness, panel rounding, B-roll word-matching nuance. Note any you couldn't perfect so the agent knows it's part of their free 20%.

**Hard stop rule:** any BLOCKER (or compliance item) that FAILS and is NOT fixable in ≤1 pass → STOP. Tell the agent EXACTLY which item failed, in plain language.

---

## Audio
- Magic Audio on every speaker track at the right level; not so low it leaves echo, not 1.0 on a good mic. Music bed (short-form) at ~-18 dB with fades — never over the voice.

## Opening & ending
- Opens ON THE HOOK. Ends on a complete thought + the CTA on screen.

## The basics (NON-NEGOTIABLE — the 80%, always done)
- **Colour grade applied** — subtle, bare-minimum, natural (skin never pale, orange, or yellow).
- **Magic Audio applied AND confirmed on.**
- **Energy present (mandatory minimum)** — 2–3 punch-ins on key beats (swoosh only if available). A flat reel with none is a fail; an effect on every cut is the opposite fail.
- **Music bed (short-form)** present and under the voice. Long-form ships without one — offer it.
- **Captions / on-screen text right for the format** — SHORT-FORM: karaoke, big, outline, active word in the brand accent set explicitly. LONG-FORM: no karaoke — emphasis pop-ups every ~2–3 min + a lower third.
- **Clean cut** — fillers, dead air, duplicate takes, false starts removed.

## Captions & graphics
- Graphics purposeful: short-form hook + CTA (≤2–3); long-form hook + CTA + pop-ups + lower third. Brand-kit PNGs when registered; native boxed text otherwise. Never bare floating text on busy footage.
- **Captions AND cards sit OFF the face — absolute.**
- Every text element FITS its box; nothing overlaps (captions, cards, CTA, lower third, logo).

## Framing & footage
- Footage fills the frame; punch-ins zoom-in only; B-roll overlays scaled to cover.
- **Text/cards inside the vertical safe zones** — out of the right ~12% icon rail and the bottom ~15% bar; centred, never flush-right (the feed UI isn't in the export — verify by rule + the agent's eyeball: `layouts.md`).
- Real background intact.
- **B-roll actually present** on every long-form; unique; within the cap; never over the face/hook/CTA; horizontal-on-vertical handled by split-screen or clean full-bleed.

## Look & feel
- Purposeful creativity, not clutter; no banned AI effects; nothing promised that the tool didn't do (no invisible "transitions").

## Discipline held (the 80/20)
- The 80% basics all done; the extras within the caps. ONE working edit (plus at most one snapshot clone). No blind retries; every pass diff-verified and logged.

## Verify, then deliver
- Both gates green BEFORE you hand anything back.
- **Exported at `1080p`, never lower** — check what you passed to `exports_create_export`; the status is `COMPLETED`.
- Hand back once, in plain language, using the standard delivery message below.

## GATE 3 — DELIVERY MESSAGE (the standard hand-back)

Always frame the export as a **REVIEW DRAFT** — never "done", "final", or "perfect". Four parts, plain language:

1. **It's a review draft.** *"Here's your review draft — take a look before you post."* + where to find it (the edit link from `platform_get_edit.riversideUrl`, and the export in Riverside's Exports).
2. **The spec you hit.** One or two lines: *"Cleaned up the audio, opened on your hook, karaoke captions, a couple of punch-ins, your CTA card, 3 cutaways, colour grade."*
3. **The 2–3 human-eyeball checks** — only what you genuinely couldn't verify:
   - "Does the audio FEEL right to your ear?" (no rung can hear)
   - "Any text that drifts near your face when you move?" (on-face nuance across motion)
   - "Does the flow feel like you?"
   - If any blocker is `UNVERIFIED`, name it here explicitly: *"I placed the hook card by the rules but couldn't look at the frame this time — please check it's clear of your face."*
4. **The 80/20 hand-off line (ALWAYS).** *"I've done the heavy 80%. The last 20% — small tweaks, swapping a clip, a transition if you want one — is yours to finish by hand in Riverside, free."*

Plus, when it applies: **the publish offer** — *"Want me to post it or schedule it? I'll show you exactly what goes out first."* and **the music offer** on long-form.

**You cannot watch the rendered video play — but you CAN read frames when a rung is reachable** (`frame-qa.md`). Do that BEFORE involving the agent. What you still CANNOT verify — live playback, audio feel, on-face nuance across motion, overall flow — is the agent's. Never claim a visual is confirmed on a frame you haven't looked at. **Final visual QA is still a human step — say so plainly.**
