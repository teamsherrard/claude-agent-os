# Final check — run before handing back any video

Before you tell the agent it's ready, run this quick self-check against everything we've learned. If something fails, fix it. Don't deliver broken work, and don't over-report.

## Audio
- Audio is clean AND natural — Studio Sound matched to the source (light/off on a real mic; it must not brighten/thin the voice). If a separate high-quality mic track was provided, it's synced in and in lip-sync.

## Opening & ending
- Opens ON THE HOOK — no settling-in, "let's go", or silent lead-in.
- Ends on a complete thought (never mid-sentence) + the agent's CTA on screen.

## Captions & graphics
- **GRAPHICS COVERAGE met (COUNT them):** short-form = hook + 3 chips + 1 stat card + 2 keyword popups + CTA; long-form = hook + a chip per point + a stat card on every number + keyword popups throughout + CTA. Sparse/missing graphics = a fail — add them before delivery (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md`).
- **json2video graphics: frame-QA them YOURSELF first** — after compositing, extract a frame at each graphic moment (`ffmpeg -ss <t> -i file -frames:v 1`) and READ it to confirm panel + readable + big + synced + off-face, BEFORE sending the human review link (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md` §6).
- **Captions PRESENT on short-form (never missing)** — big (~90pt+, not the tiny default), readable, high-contrast; active word in the brand accent set explicitly (not a default colour like green).
- **Captions AND cards/graphics sit BELOW the face — never over it (absolute).**
- **Graphics are clean — not cramped, overlapping, or broken** (no tiny multi-box grids / quadrants with colliding text).
- Every text element FITS its box (padding, no overflow).
- Nothing overlaps — captions, pops, cards, and the CTA never collide or stack.

## Framing & footage
- Footage fills the frame — no black bars; zooms are zoom-in only (no exposed edges).
- **His real background is intact — NOT accidentally removed / black** (no green-screen / background-removal on a talking-head).
- **B-roll is actually present** — every long-form has at least some (Descript stock minimum); never a bare talking-head.
- Horizontal b-roll on a vertical reel is split-screen or clean full-bleed — never over-zoomed / floating.
- B-roll matches the words, is unique (**no repeats anywhere — not just back-to-back**), **within the cap (short-form ≤ 5 clips total — count them; long-form curated, never wall-to-wall)**, and never covers the face / hook / CTA.

## Look & feel
- Subtle, natural colour grade (not over-saturated / over-bright); people look flattering.
- Purposeful creativity (minimal ≠ bare) but not cluttered; SFX subtle + low.

## Verify, then deliver
- Each paid step actually landed (job result success), not assumed.
- Hand back once, in plain language, with a one-line "what's inside" + the review link.

**You cannot watch the rendered video play — but you CAN read extracted frames.** For json2video-composited graphics, frame-QA the stills yourself (extract a frame at each graphic moment with `ffmpeg` and Read it) to catch contrast/size/sync/off-face/coverage failures BEFORE involving the agent. What you still CANNOT verify is live playback, audio feel, on-face nuance across motion, and overall flow — and the editor's own position reports are unreliable (it has claimed captions were clear of the face when they weren't). So after your own frame-QA, hand the agent the review link and ask them to eyeball *those specific things*; NEVER claim a visual is confirmed or "perfect" on a frame you haven't actually looked at. **Final visual QA is still a human step** — say so plainly.
