# Footage look & treating people well

How the footage — and the people in it — should look. Subtle and flattering always beats "punchy."

## Colour grade — ALWAYS applied, subtle and natural only

- **A grade is REQUIRED on every video** — ungraded raw footage reads cheap. The mistake to avoid is BOTH directions — none, AND over-cooked.
- **The visible-but-natural recipe** (`set_color_correction` on the speaker track, ranges are -1..1). Raised on 2026-09-23: the old +0.03 / +0.06 / +0.04 "bare minimum" was invisible on a real edit, and an invisible grade is the same as no grade.
  - `brightness: +0.04` · `contrast: +0.12` · `saturation: +0.08` — the default lift. It should be noticeable side by side and forgettable on its own.
  - Cool/blue-ish room light → add `colorTemperatureKelvin: 5600`; warm/orange light → `6200`. Omit it when the white balance already looks right.
  - `cinematic` style pack: `contrast: +0.14`, `saturation: +0.05`. `bold-kinetic`: `saturation: +0.10`.
  - Phone footage that's already punchy: halve everything. A dim, flat webcam room: `brightness +0.06`, `contrast +0.15`.
  - **The over-cooked line, never crossed:** contrast above `0.20`, saturation above `0.12`, brightness above `0.08`. Past those, skin goes orange and blacks crush.
- **Hard guardrails:** never over-saturate, never over-brighten, never crush the blacks. Skin stays natural — never orange, never washed out. When in doubt, do less — and offer to dial it back.
- **Verify** on a frame where a rung is reachable (`frame-qa.md`); and look at skin and the darkest area of the frame: skin natural, shadows with detail. Otherwise say it's the standard lift and let them judge.

## Treat people flatteringly (this matters)

Many agents — **especially women in the cohort** — are self-conscious on camera. Default to making them look their best:

- **Zooms stay gentle: 1.06 normal, 1.10 strong, 1.14 once for the line of the video, never more. NEVER a tight push-in on someone's face.**
- Keep the face well-framed with headroom; don't crop in close. On a 9:16 reframe, the smart layout centres the tile — check the head has room; nudge with a small `update_scene_slot_settings` offset if not.
- Natural, flattering skin; never harsh brightness or contrast on a face.
- Never comment on or try to "fix" someone's appearance — just frame and grade them kindly. `modify_eye_correction` exists in the batch surface; it is banned here.

## Punch-ins & framing — never expose the edge

- Every clip must FILL the frame (cover, not fit) — no black bars anywhere, especially the first second.
- Zooms never go below the frame: a short scene whose slot scale is `1.06`, `1.10`, or (once) `1.14` (`update_scene_slot_settings`, recipe in `riverside-playbooks.md`), cutting in on the first word of the key line and back out on the first word after it. Stay ≥ 1.0. Never scale below fill; keep the offset at 0,0 unless a frame shows the head crowding the top edge.
- **A position offset must stay small relative to the zoom.** At 1.06× you have about 3% of the frame each side before an edge shows; keep the slot offset at 0,0 unless a frame shows the head crowding the top edge, and then move it by a few canvas pixels only.
- **B-roll overlays insert at 90% of the canvas with a border, centred (live-tested)** — always scale them to the canvas for a full-cover cutaway, or deliberately to a band for a split-screen. An unscaled overlay is the Riverside version of the floating-clip mistake.
- After any zoom or reframe, verify **zero canvas gaps** on a frame before calling it done.
