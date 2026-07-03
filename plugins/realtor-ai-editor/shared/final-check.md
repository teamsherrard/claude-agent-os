# Final check — run before handing back any video

Before you tell the agent it's ready, run this self-check against everything we've learned. This is a GATE, not a vibe-check: it runs on EVERY version, including every revision. Work the gates IN ORDER — Gate 1 (compliance) and Gate 2 (pass/fail) first; only once both are green do you move on to the polish self-check and the delivery message. If something fails, fix it. Don't deliver broken work, and don't over-report.

---

## GATE 1 — COMPLIANCE (non-negotiable; runs first, every version)

This is ASSISTANCE, not legal advice — you are helping the agent not trip over their own brokerage's rules, not giving a legal opinion. But the items below are hard: a compliance miss can get a real estate agent in real trouble, so a fail here is a BLOCKER (you cannot deliver).

First, read `identity/compliance.md` from the agent's Brain. It can be in THREE states, not two — detect which one before you do anything else:
- **(1) MISSING** — the file doesn't exist.
- **(2) PRESENT + FILLED** — it exists AND has real disclaimer text (an actual brokerage name, a real license #, real disclaimer wording).
- **(3) PRESENT BUT UNFILLED PLACEHOLDER** — it exists but is still the first-run template: any `[bracketed]` token (e.g. `[Brokerage Name]`, `[License #]`, `[disclaimer text]`) or an unreplaced template heading is still sitting there. The Brain scaffolds this as a template on first setup; compliance is a later phase, so a brand-new agent's very first edit will often hit this state. **Detection rule:** if the disclaimer/license fields contain ANY `[` bracket token or an unreplaced template heading, treat it as UNFILLED.

**States (1) MISSING and (3) UNFILLED-PLACEHOLDER are handled IDENTICALLY — and neither one FAILS the gate:** warn the agent ONCE in plain language ("I couldn't find a finished compliance file, so I can't confirm your disclaimer or license rules — I've kept the video free of any claim cards to be safe. Say 'set up my compliance' to lock your brokerage disclaimer + license #."), then **do NOT auto-add any claim-bearing card** (no stat cards, no "best/top/#1" language, no neighbourhood "who it's for" copy) and **NEVER stamp a `[placeholder]` disclaimer onto the video**. Captions of what he actually said are fine; invented or placeholder claim text is not. Deliver the edit safely — do NOT stop or FAIL over a missing/unfilled disclaimer; that would dead-end a first-timer's very first edit.

When `identity/compliance.md` is in state **(2) PRESENT + FILLED**, every card AND every caption must pass ALL of these:
- **No banned / superlative / guarantee claims** anywhere on screen — e.g. "best agent", "#1", "number one", "top agent", "guaranteed to sell", "guaranteed", "the only", "always", "never lose". If the agent literally said it on camera, it can stay in the spoken captions, but do NOT manufacture it into a graphic card.
- **Required brokerage disclaimer + license # present** wherever `identity/compliance.md` requires it (e.g. on the CTA / identity card). Don't invent a disclaimer — use exactly what the file specifies. If a FILLED file says a disclaimer is required but gives no real text, that's a FAIL → stop and ask. (Note: a file that's still an UNFILLED placeholder is NOT this case — it's state (3) above; treat it like MISSING, deliver safely, never stamp the `[placeholder]` text, do NOT FAIL.)
- **Fair-housing-safe language** on any neighbourhood or "who it's for" text — NO steering language: no "great for families", "safe area", "good schools so you know the type", "perfect for young professionals", "quiet/clean neighbourhood" used to signal who belongs. Describe the HOME and the FACTS, never who should or shouldn't live there.

Emit a literal line for each:
- `COMPLIANCE — banned/superlative claims: PASS / FAIL / FIXED`
- `COMPLIANCE — disclaimer + license #: PASS / FAIL / FIXED / N/A (no compliance.md — claim cards withheld) / N/A (compliance.md is an unfilled placeholder — claim cards withheld, nudged once)`
- `COMPLIANCE — fair-housing language: PASS / FAIL / FIXED`

For the disclaimer line, pick the state: **FILLED** → PASS/FAIL/FIXED as normal. **MISSING** → `N/A (no compliance.md — claim cards withheld)`. **UNFILLED PLACEHOLDER** → `N/A (compliance.md is an unfilled placeholder — claim cards withheld, nudged once)`. Both N/A states are a clean pass for the gate — they do NOT block delivery.

Any compliance FAIL you cannot fix in ≤1 pass → STOP. Do not deliver. Tell the agent which item failed and why, in plain language. **A MISSING or UNFILLED-PLACEHOLDER compliance file is NOT a FAIL** — it resolves to N/A; you deliver the edit safely (claim cards withheld) and nudge once. Never dead-end a first edit over an unset disclaimer.

---

## GATE 2 — HARD PASS / FAIL (blockers vs polish; runs on every version)

This is the real gate. Split into BLOCKERS (auto-fail — cannot deliver) and POLISH (fix if you can, but they don't block). For EACH blocker, emit a literal line: `<item>: PASS` / `<item>: FAIL` / `<item>: FIXED`.

**The frame-read rule (because the editor has lied about this before):** every VISUAL blocker's PASS MUST cite the exact frame timestamp you actually extracted and Read — e.g. `no text/cards over the face: PASS (read frame @ 00:07)`. A PASS with no cited, actually-read frame is NOT a pass — treat it as FAIL. You have falsely claimed "off-face" on frames you never looked at; that is banned. Read the frame, or it failed.

**BLOCKERS (auto-fail — cannot deliver):**
1. `Studio Sound confirmed ON (~55%)` — verify it actually applied (not silently off); ~80–90% for phone/echoey. (non-visual)
2. `short-form captions present + below the face` — karaoke captions exist AND sit below the face. (VISUAL — cite frame)
3. `opened on the hook` — no settling-in / silent lead-in. (VISUAL or transcript — cite the open)
4. `ended on a complete thought` — never mid-sentence. (transcript/clip end)
5. `CTA on screen` — the agent's CTA card is present at the end. (VISUAL — cite frame)
6. `colour grade applied` — subtle grade is on; skin not pale/orange/yellow. (VISUAL — cite frame)
7. `NO text/cards over the face` — captions AND cards all clear of the face (or timed over B-roll). (VISUAL — cite frame at each card/caption moment)
8. `no exposed black bars` — footage fills the frame; no exposed edges from zooms. (VISUAL — cite frame)
9. `no accidental background removal` — his real background is intact, NOT black/keyed. (VISUAL — cite frame)
10. `b-roll within the cap + no repeats` — short-form ≤ 3 total; long-form ~1 per 1.5–2 min (~5–7 on 10 min); no repeated clips anywhere. (count them; cite a frame if unsure)
11. `long-form emphasis pop-ups present (every ~2–3 min)` — long-form only; an emphasis pop-up roughly every 2–3 min (~3–5 on a 10-min video). N/A for short-form. (VISUAL — cite a frame at one pop-up)
12. `card typography clean at FULL resolution` — for EVERY card: extract the frame at **full export resolution and CROP to the card region** (a small/low-res montage HIDES these defects — that's how a misaligned card shipped before). Check: all lines centred to the panel AND to each other, single spaces only, panel hugs the text (no oversized empty slab), no drifting stacked layers. (VISUAL — cite the full-res crop per card)

**POLISH (fix if quick — does NOT block delivery):** caption size/contrast fine-tuning, SFX level, transition smoothness, panel rounding, perfect text padding, B-roll word-matching nuance, count-up/heavy-AI restraint confirmations. Note any you couldn't perfect so the agent knows it's part of their free 20%.

**Hard stop rule:** any BLOCKER (or compliance item) that FAILS and is NOT fixable in ≤1 pass → STOP. Tell the agent EXACTLY which item failed, in plain language. Do NOT deliver it as "done." A blocker fail is never shipped silently.

---

## Audio
- Audio is clean AND natural — Studio Sound at the right level: **default ~55%**, **~80–90% for phone / echoey rooms**; NOT so low it leaves a fishbowl/room echo, and NOT so high it brightens/thins the voice. If a separate high-quality mic track was provided, it's synced in and in lip-sync.

## Opening & ending
- Opens ON THE HOOK — no settling-in, "let's go", or silent lead-in.
- Ends on a complete thought (never mid-sentence) + the agent's CTA on screen.

## The basics (NON-NEGOTIABLE — these are the 80%, always done)
- **Colour grade applied** — subtle, bare-minimum, natural, flattering; **never over-saturated / over-bright** (skin never pale, orange, or yellow).
- **Studio Sound applied AND confirmed on** — at the right level (**~55% default; ~80–90% for phone/echoey**); not so low it leaves echo, not so high it thins the voice. Verify it didn't silently stay off.
- **Energy present (mandatory minimum)** — a couple of zoom-in/out punch-ins (each with a swoosh SFX), smooth transitions at scene changes, and a couple of SFX — on KEY beats, not every scene. A flat reel with none is a fail.
- **Captions / on-screen text right for the format** — SHORT-FORM: karaoke captions present, big (~90pt+, not the tiny default), readable, high-contrast, active word in the brand accent set explicitly (not green). LONG-FORM: no word-by-word karaoke — instead an emphasis pop-up every ~2–3 min (key phrase, brand panel, off the face; ~3–5 on a 10-min video).
- **Clean cut** — filler words, dead air, bad takes, and false starts removed.
- **Clean open ON THE HOOK** and **clean ending** on a complete thought (covered below).

## Captions & graphics
- **Graphics are purposeful and Descript-native** — short-form: a hook card + a CTA card (≤2–3 cards), the karaoke captions carry the keyword emphasis (no separate pop cards); long-form: hook + CTA + an emphasis pop-up every ~2–3 min (these ARE the emphasis layer). Don't sparse-panic OR pile on (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`).
- **Cards sit on a rounded brand panel** — never a flat black box, never bare floating text.
- **Captions AND cards/graphics sit BELOW the face — never over it (absolute)** — or a card is timed over a B-roll moment.
- **Graphics are clean — not cramped, overlapping, or broken** (no tiny multi-box grids / quadrants with colliding text).
- Every text element FITS its box (padding, no overflow).
- Nothing overlaps — captions, cards, and the CTA never collide or stack.

## Framing & footage
- Footage fills the frame — no black bars; zooms are zoom-in only (no exposed edges).
- **Text/cards inside the platform safe zones** — nothing in the right ~12% icon rail or the bottom ~15% UI bar; text centre-aligned, never flush-right. (The feed UI isn't in the export — verify by rule + have the agent eyeball it in-app: `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`.)
- **His real background is intact — NOT accidentally removed / black** (no green-screen / background-removal on a talking-head).
- **B-roll is actually present** — every long-form has at least some (Descript stock minimum); never a bare talking-head.
- Horizontal b-roll on a vertical reel is split-screen or clean full-bleed — never over-zoomed / floating.
- B-roll matches the words, is unique (**no repeats anywhere — not just back-to-back**), **within the cap (short-form ≤ 3 clips total — count them; long-form scaled to length ~1 per 1.5–2 min, e.g. ~5–7 on a 10-min video, curated, never wall-to-wall)**, and never covers the face / hook / CTA.

## Look & feel
- Purposeful creativity (minimal ≠ bare) but not cluttered; the mandatory energy (zoom punch-ins + swoosh, smooth transitions, a couple of SFX) is present but on KEY beats only, never every scene; SFX subtle + low.
- No count-up number animations; no heavy AI effects (background removal / green-screen, eye contact, AI generation, AI B-roll).

## Credit discipline held (the 80/20)
- The 80% basics are all done (above); the extras stayed within the caps — B-roll ≤ 3 on short-form, ≤ 2–3 cards, no count-ups, no heavy AI. Anything beyond that is the agent's manual 20% (free), not a paid pass.
- No duplicate copies of their video were created — the **original** was edited in place.
- No blind-retries of a paid pass; each paid step landed.

## Verify, then deliver
- Each paid step actually landed (job result success), not assumed.
- Both gates above are green (every blocker PASS/FIXED, every compliance line PASS/FIXED/N/A) BEFORE you hand anything back.
- Hand back once, in plain language, using the standard delivery message below.

## GATE 3 — DELIVERY MESSAGE (the standard hand-back)

Always frame the export as a **REVIEW DRAFT** — the starting point, NOT the finished post. Never call it "done", "final", or "perfect". The message has four parts, in plain non-techy language:

1. **It's a review draft.** One line: "Here's your review draft — take a look before you post." + the review link.
2. **The spec you hit.** A short, plain "what's inside" — the fixed spec that was actually applied, e.g. "Cleaned up the audio, opened on your hook, karaoke captions, a couple of punch-ins, your CTA card at the end, [N] B-roll clips, colour grade." Keep it to one or two lines.
3. **The 2–3 human-eyeball checks.** Ask the agent to confirm ONLY the specific things you genuinely can't verify yourself — pick the 2–3 that apply:
   - "Does the audio FEEL right to your ear?" (you can't hear playback)
   - "Any text that drifts near your face when you move?" (on-face nuance across motion)
   - "Does the overall flow/energy feel like you?"
   (Don't dump the whole checklist — just the handful only a human can judge.)
4. **The 80/20 hand-off line (ALWAYS include).** Close with: "I've done the heavy 80% for you. The last 20% — small tweaks, swapping a clip, nudging text — is yours to finish by hand in Descript, free, no AI credits." Adjust wording to fit, but the message is non-negotiable: the final 20% is theirs, free, no credits.

**You cannot watch the rendered video play — but you CAN read extracted frames.** Frame-QA the export yourself (extract a frame at each card / caption / B-roll moment with `ffmpeg -ss <t> -i file -frames:v 1` and Read it) to catch contrast/size/sync/off-face failures BEFORE involving the agent. What you still CANNOT verify is live playback, audio feel, on-face nuance across motion, and overall flow — and the editor's own position reports are unreliable (it has claimed captions were clear of the face when they weren't). So after your own frame-QA, hand the agent the review link and ask them to eyeball *those specific things*; NEVER claim a visual is confirmed or "perfect" on a frame you haven't actually looked at. **Final visual QA is still a human step** — say so plainly.
