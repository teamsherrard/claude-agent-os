# Layouts & b-roll framing (vertical reels)

Descript has a **Layout** feature (Properties → Layout) — use it. The classic mistake is slapping a horizontal b-roll onto a vertical 9:16 frame and either over-zooming it or letting it float with the speaker's head poking out.

## Horizontal b-roll on a vertical reel — pick by what the shot shows

1. **Full-bleed cover-fill** — ONLY if the subject still reads after the sides are cropped (e.g. a centred city skyline). If cover-fill zooms in so far you can't tell what it is (a money close-up becomes just a fingernail), **do not use it.**
2. **Split-screen (preferred for most horizontal b-roll)** — speaker in one band, the b-roll shown **in full** in the other (e.g. speaker bottom ~55% / b-roll top ~45%). The b-roll stays recognisable and the agent stays on screen. Use Descript's Layout.
   - **Reframe the speaker to FIT his band** — don't just crop his full-frame shot into a half-height band (that slices off the top of his head and his chin). Scale + position him to a clean head-and-shoulders shot, centred, with headroom above his head. If his face won't fit cleanly, give the speaker band more height (e.g. 60% speaker / 40% b-roll).
3. **Never:** a floating or letterboxed horizontal clip with the speaker's head poking out top/bottom, or an over-zoomed crop. That looks broken.

## Rule of thumb

- B-roll is vertical, or reads fine full-bleed → **full-bleed**.
- B-roll is horizontal and cropping loses the subject → **split-screen**.
- When in doubt, split-screen keeps it clean *and* keeps the agent present.

## Vertical b-roll on a HORIZONTAL 16:9 video (the mirror problem)

Long-form is 16:9, and a lot of free stock is shot vertical. Dropping a 9:16 clip into a 16:9 frame is the same mistake in reverse.

1. **Full-bleed cover-fill** — fine if the subject survives losing the top and bottom (a person walking, a close-up). Most vertical stock does.
2. **If cover-fill destroys it** (a tall building, a full-body shot), don't force it: **pick a different, natively-horizontal clip instead.** There's plenty of 16:9 stock — swapping the clip is free and always beats a broken frame.
3. **Never** pillarbox it with black bars down the sides, and never float it small in the middle of the frame. Both read as an error.
4. Same recognisability bar as everywhere: if you can't tell what it is in a 4-second glance, it's the wrong clip.

## Other layout uses

Split-screen / picture-in-picture is also good for screen-shares (keep the face in a corner) and side-by-side comparisons. Same rule: the agent should almost always stay visible on a talking-head reel.

## Platform safe zones — VERTICAL 9:16 ONLY (where the feed UI eats the frame)

> **These margins apply to vertical reels only.** A 16:9 YouTube video has **no icon rail and no handle bar** — don't shrink a long-form card to dodge a rail that isn't there. For 16:9 the only margin that matters is the bottom ~10% (YouTube's player controls on hover), and the card zone is the **lower third** — see `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`.

On IG / TikTok / YouTube Shorts the app overlays its own UI **on top of** your vertical video — so keep ALL text, cards, and panels inside a **centre-safe box**:

- **Right ~12% — the icon rail** (like / comment / share / profile). Keep text + panels OUT of it. **Centre-align text; NEVER flush-right.** If a panel runs too wide, **shrink the text — don't extend it into the right rail.**
- **Bottom ~15% — the handle / caption / CTA bar.** Captions sit ABOVE it (≈0.82–0.86 of the frame, below the face); the CTA card sits above it too.
- **Top ~8–10% — platform chrome** (TikTok's top tabs, etc.). Pin the hook card just INSIDE this margin (a small gap from the very top), still above the head.
- **Why this is easy to miss:** Claude frame-QAs the CLEAN export with NO UI overlaid, so it literally cannot see these collisions. Apply the margins by RULE, and have the agent eyeball it in the app before posting. A right-biased CTA or a full-width panel that looks perfect in Descript gets half-buried under the icons in the actual feed.
