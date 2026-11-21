# Grade strategy on the Edits engine — the Adjust panel, decided from measurements

Edits exposes the whole Adjust panel through `applyAdjust(id, adjust, value)` in the panel's own −100…100 units: exposure, clarity, highlights, shadows, contrast, brightness, whites, blacks, saturation, vibrance, plus `setColorWheel`, `setCurve`, `setHSL`, `applyFilter`, `applyLUT`. `getColor(id)` reads the grade back. Never `setColorGrade` with guessed numbers: its raw units over-cook the image (contrast is an offset, saturation a multiplier).

The house look (footage-look.md) is unchanged: a lift you can see side by side and forget on its own; skin natural; never over-cooked; never change how someone looks. This file says how to get there from numbers.

## 1. Measure before you touch anything
`captureFrame(times="<hook>,<mid>,<cta>", maxWidth 540)` → `scripts/edits/frame_stats <frame.jpg> [x0,y0,x1,y1]` (the face box from `detectSubjects` or `trackObject(id, prompt "face")`, normalised). Read, per frame:
- `meanLuma` — exposure (0.42–0.55 is the comfortable band for a talking head; the face box 0.45–0.60)
- `contrastSd` — flatness (< 0.16 reads flat, > 0.26 reads harsh)
- `shadowClipPct` / `highlightClipPct` — crushed blacks / blown window (> 1.5 % either side means the window or the wall is gone)
- `castRB` — colour cast (> +0.06 orange/warm, < −0.06 blue/cool), `castGmid` (> +0.04 green, < −0.04 magenta)
- `saturation` — 0.18–0.30 is natural on skin-and-room footage

## 2. Decide in the panel's order (one pass, caps included)
| Reading | Move | Cap |
|---|---|---|
| cast R−B beyond ±0.06 | `temperature` toward neutral: −8 for warm, +8 for cool (±14 max) | ±14 |
| cast G−mid beyond ±0.04 | `tint` opposite the cast | ±10 |
| meanLuma < 0.42 | `exposure` +6 (dim) to +12 (very dim) | +15 |
| meanLuma > 0.56 | `exposure` −4 to −8 | −10 |
| highlightClipPct > 1.5 % | `highlights` −15 to −30; `whites` −10 | −40 / −20 |
| shadowClipPct > 1.5 % or face dark on a bright background (backlit) | `shadows` +15 to +30; `blacks` +6 | +40 / +12 |
| contrastSd < 0.16 | `contrast` +12 (default lift) to +18 | +20 |
| contrastSd > 0.26 | `contrast` +4 only; lift `shadows` instead | — |
| saturation < 0.18 | `saturation` +8, `vibrance` +6 | +12 / +10 |
| saturation > 0.30 or skin reads orange | `saturation` 0, `vibrance` +4 | — |
| soft phone footage | `clarity` +6 | +10 |
Always: `brightness` +4 (the house lift) unless exposure was raised; never both exposure +12 and brightness +8.

## 3. Footage types (what the numbers usually say)
- **Bright room, white walls (Mike's house):** luma 0.55–0.62, highlights clip on the window → highlights −20, exposure −3, contrast +12, saturation +8. Face already fine.
- **Dim webcam / evening room:** luma 0.30–0.40, flat → exposure +10, shadows +15, contrast +15, clarity +6, saturation +8.
- **Backlit window behind the speaker:** face box luma < 0.40 while the frame > 0.55 → shadows +30, highlights −25, exposure +4; never brighten the whole frame.
- **Warm tungsten:** castRB > +0.08 → temperature −10, tint 0; saturation 0 (warm light already saturates).
- **Phone footage with its own look:** halve every move.

## 4. Verify, then stop
`captureFrame` the same times again → `frame_stats` again: the face box luma must land in 0.45–0.60, cast within ±0.04, clipping under 1 %. Look at one frame with your own eyes for skin and the window. If a second pass is needed, change ONE slider. Log: `grade · done · exposure +6 highlights −20 contrast +12 saturation +8 · face luma 0.51`.

## 5. Style packs
bold-kinetic: the table as is. clean-minimal: contrast +8, saturation +4. cinematic: `applyFilter("soft_light", intensity 0.4)` or a `lut_spark*` at 0.3 after the correction, never instead of it. data-rich: as bold-kinetic. Auto: Edits' Auto button is not exposed through the server; the table replaces it.
