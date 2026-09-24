# Layouts & b-roll framing (vertical reels)

Riverside has named **layouts** (`editing_list_layouts`) and **smart layouts** (`editing_apply_smart_layout`). The classic mistake is slapping a horizontal b-roll onto a vertical 9:16 frame and either over-zooming it or letting it float.

## First: get the canvas right (reels)

`batch` op `update_aspect_ratio {ratio:"9:16"}` **before any overlay exists** (the change is rejected once an overlay has size keyframes) → `apply_smart_layout(style:"FullScreen")` → a solo speaker lands on `solo-fullscreen-1-tile-portrait` (face-centred crop of the 16:9 source). Read the timeline; confirm `settings.canvas` is portrait and the head has headroom (nudge with `update_scene_slot_settings` if not).

## Horizontal b-roll on a vertical reel — pick by what the shot shows

1. **Full-bleed cover-fill** — ONLY if the subject still reads after the sides are cropped (a centred skyline). Insert the overlay, then `modify_scale {clipId, time:{n:0,d:1}, scaleW:360, scaleH:640, canvasWidth:360, canvasHeight:640}` on that overlay CLIP at time 0 (`clipId`, never the shared overlay track; the engine covers and crops the sides). If cover-fill zooms so far you can't tell what it is, **don't**.
2. **Split-screen (preferred for most horizontal b-roll)** — speaker in one band, the b-roll shown **in full** in the other. Two steps:
   - the scene(s) under the cutaway → `batch` op `change_layout {layoutId:"solo-half-vertical-side-1-tile-portrait", sceneIds:[…]}` (speaker tile = top ~50%; the layout can `canVflip` if you'd rather have the speaker at the bottom). Split the scene first at the cutaway's in/out (`split_scene_at_time`) so only that window changes.
   - the b-roll overlay → `insert_overlay` at `position {x:1/2, y:3/4}` then `modify_scale` to the band (`scaleW=360, scaleH=320` on the 360×640 reference canvas for a 16:9 clip shown ~full width; the engine letterboxes inside the band cleanly).
   - **Reframe the speaker to FIT the band** — the layout does a head-and-shoulders crop; check headroom on a frame. If the face won't fit cleanly, use `solo-two-third-side-1-tile-portrait` (speaker top 67%) and a smaller b-roll band.
   - Captions in that layout sit middle-centre by default — re-pin them to the bottom of the speaker band for those scenes (`update_scene_caption_settings`, `position.y ≈ 0.47`), still below the face.
3. **Never:** a floating or letterboxed horizontal clip with the speaker's head poking out, or an over-zoomed crop.

## Rule of thumb
- B-roll is vertical, or reads fine full-bleed → **full-bleed**.
- B-roll is horizontal and cropping loses the subject → **split-screen**.
- When in doubt, split-screen keeps it clean *and* keeps the agent present.

## Vertical b-roll on a HORIZONTAL 16:9 video (the mirror problem)
1. **Full-bleed cover-fill** — fine if the subject survives losing top and bottom.
2. **If cover-fill destroys it**, pick a different, natively-horizontal clip (swapping is free).
3. **Never** pillarbox with black bars, never float it small in the middle.
4. Same 4-second recognisability bar.

## Other layout uses
`apply_smart_layout` Smart / PictureInPicture / SplitScreen shine on **multi-speaker** recordings (guest, lender, client) — active-speaker switching, grid shots. On a solo talking head: FullScreen, always. PiP (`solo-pip-1-tile-*`) is also right for a screen-share with the agent in a corner.

## Platform safe zones — VERTICAL 9:16 ONLY (where the feed UI eats the frame)

> **These margins apply to vertical reels only.** A 16:9 YouTube video has **no icon rail and no handle bar** — the only margin there is the bottom ~10% (player controls on hover), and the card zone is the **lower third** (`graphics-style.md`).

On IG / TikTok / YouTube Shorts the app overlays its own UI **on top of** your vertical video — keep ALL text, cards, and panels inside a **centre-safe box**:
- **Right ~12% — the icon rail.** Keep text + panels OUT of it: captions `widthRatio ≤ 0.8`, centred; cards centred; **never flush-right**.
- **Bottom ~15% — the handle / caption bar.** Captions sit ABOVE it (`position.y ≈ 0.82–0.86`); banners never go near it — the hook, pop-ups, and CTA banners live in the TOP zone on a reel.
- **Top ~8–10% — platform chrome.** The hook card sits just INSIDE this margin (centre ≈ 12–14% down), still above the head.
- **Why this is easy to miss:** the export has NO UI overlaid, so a frame read can't show these collisions. Apply the margins by RULE, and have the agent eyeball it in the app before posting.
