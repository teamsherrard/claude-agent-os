# Final check — run before handing back any video

Before you tell the agent it's ready, run this quick self-check against everything we've learned. If something fails, fix it. Don't deliver broken work, and don't over-report.

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
- Hand back once, in plain language, with a one-line "what's inside" + the review link.

**You cannot watch the rendered video play — but you CAN read extracted frames.** Frame-QA the export yourself (extract a frame at each card / caption / B-roll moment with `ffmpeg -ss <t> -i file -frames:v 1` and Read it) to catch contrast/size/sync/off-face failures BEFORE involving the agent. What you still CANNOT verify is live playback, audio feel, on-face nuance across motion, and overall flow — and the editor's own position reports are unreliable (it has claimed captions were clear of the face when they weren't). So after your own frame-QA, hand the agent the review link and ask them to eyeball *those specific things*; NEVER claim a visual is confirmed or "perfect" on a frame you haven't actually looked at. **Final visual QA is still a human step** — say so plainly.
