# Footage look & treating people well

How the footage — and the people in it — should look. Subtle and flattering always beats "punchy."

## Colour grade — ALWAYS applied, subtle and natural only

- **A grade is REQUIRED on every video** — ungraded raw footage reads cheap. The mistake to avoid is BOTH directions — none, AND over-cooked.
- **The bare-minimum recipe** (`set_color_correction` on the speaker track, ranges are -1..1):
  - `brightness: +0.03` · `contrast: +0.06` · `saturation: +0.04` — the default lift.
  - Cool/blue-ish room light → add `colorTemperatureKelvin: 5600`; warm/orange light → `6200`. Omit it when the white balance already looks right.
  - `cinematic` style pack: `contrast: +0.08`, `saturation: +0.02`.
  - Phone footage that's already punchy: halve everything.
- **Hard guardrails:** never over-saturate, never over-brighten, never crush the blacks. Skin stays natural — never orange, never washed out. When in doubt, do less — and offer to dial it back.
- **Verify** on a frame where a rung is reachable (`frame-qa.md`); otherwise say it's the bare-minimum lift and let them judge.

## Treat people flatteringly (this matters)

Many agents — **especially women in the cohort** — are self-conscious on camera. Default to making them look their best:

- **Gentle punch-ins only: 1.05–1.08×. NEVER a tight push-in on someone's face.**
- Keep the face well-framed with headroom; don't crop in close. On a 9:16 reframe, the smart layout centres the tile — check the head has room; nudge with a small `update_scene_slot_settings` offset if not.
- Natural, flattering skin; never harsh brightness or contrast on a face.
- Never comment on or try to "fix" someone's appearance — just frame and grade them kindly. `modify_eye_correction` exists in the batch surface; it is banned here.

## Punch-ins & framing — never expose the edge

- Every clip must FILL the frame (cover, not fit) — no black bars anywhere, especially the first second.
- Punch-ins are **zoom-IN only**: a short scene whose slot scale is `1.05`–`1.08` (`update_scene_slot_settings`, recipe in `riverside-playbooks.md`), cutting in on the first word of the key line and back out on the first word after it. Stay ≥ 1.0. Never scale below fill; keep the offset at 0,0 unless a frame shows the head crowding the top edge.
- **A position offset must stay small relative to the zoom.** At 1.06× you have ~3% headroom each side — a bigger shift exposes an edge (a 7.5% offset at 1.05–1.08× exposed the top edge in the Descript live test). Keep it centred unless there's a reason.
- **B-roll overlays insert at 90% of the canvas with a border, centred (live-tested)** — always scale them to the canvas for a full-cover cutaway, or deliberately to a band for a split-screen. An unscaled overlay is the Riverside version of the floating-clip mistake.
- After any zoom or reframe, verify **zero canvas gaps** on a frame before calling it done.
