# Graphics in Riverside — minimal, clean, off the face

Graphics are placed in Riverside and kept **MINIMAL**. On a **short-form reel** the karaoke captions (brand-accent active word) already carry the keyword emphasis. On **long-form** there's no karaoke — the emphasis lives in **pop-up cards every ~2–3 min** + a lower third. (`${CLAUDE_PLUGIN_ROOT}/shared/cost-discipline.md` for the caps.)

## Two ways to make a card — and which one wins

**1. Video Brand Kit PNGs (preferred — check `config.json → brand.assets` FIRST).** If the agent's kit is registered, the pieces come from those files, **already in Riverside's Your Media** (`brand.assets.riverside_media_ids`). **Every kit piece is a full-canvas transparent OVERLAY with the element drawn in its zone** (kit v3): placing one is `insert_overlay(assetId, startMs, durationMs)` + `modify_scale` to the canvas at time 0, position centre, and the file's own geometry is the placement. The speaker stays visible around every piece; nothing in the kit is a full-screen slate except the optional end card. This is the ONLY way to get a **brand-coloured panel** in Riverside (see the native limitation below), so a registered kit is the premium path.

- **Hook banner** — the format-matched file (`hook_9x16` / `hook_16x9`): a wide bar in the lower third (16:9) or the top zone (9:16), on screen for the hook window (~2–2.5 s), `slideLeftIn` / `fadeOut`, plus the episode's hook line as **ONE text object inside the banner's empty zone** (an `insert_text_overlay` with `effect: "shadow"`, no box, centred in the zone with the rule below).
- **CTA banners** — the primary `cta_*` file on the closing ask, and the `cta_pack` variant on every other ask the agent makes on camera (`cta-pack.md` has the transcript-to-banner table). The words are baked, so add nothing on top. It pops up on the first word of the agent's CTA line and holds to the last frame (`cta-pack.md`). The optional **end card** (`end_card_*`) is the one opaque full-frame piece: the last 3–5 s of a long-form video, never on a reel.
- **Emphasis pop-ups (long-form)** — the transparent emphasis file + the key phrase as one text object in its zone, ~every 2–3 min.
- **Name strip / lower third (long-form)** — the kit's `lower_third` for ~5 s on first appearance (`slideLeftIn`), OR the native `add_lower_third` (name + role) if the kit has none.
- **Logo** — `apply_brand` (from the studio kit) or `insert_logo`; top-right, ~1/8 width, ~70% opacity; long-form by default, reels optional.
- **LOOK first still applies** — the zones were designed off-face, but check a frame; if the speaker's framing collides, time the card over B-roll.
- **Icon pack (`brand.assets.icons_dir`)** — transparent PNG icons in the brand colours (arrow, check, pin, dollar, house, calendar…). Place one beside a key word as a small pop-up: `insert_overlay` with `position` as canvas fractions, then `modify_scale` at time 0 to about 36 canvas px on 16:9 (a 100 px badge at 1080p, live-tested) or 50 canvas px on 9:16 (150 px on the phone), in the format zone beside the panel's text, `popIn` / `fadeOut`, 1.5–3 seconds. At most one on screen at a time, and no more than the emphasis count for the format. Emoji are icons too: a rendered PNG is reliable, an emoji typed into a text card is a font gamble. The kit's canonical set (Video Brand Kit v3, `icons/` folder): `icon-arrow-up` (rising, growth) · `icon-arrow-down` (price drop, falling rates) · `icon-check` (a tip, a done item) · `icon-pin` (a place, a neighbourhood) · `icon-dollar` (price, cost, savings) · `icon-house` (a home, a listing) · `icon-key` (closing, move-in) · `icon-calendar` (a date, a deadline) · `icon-phone` (call or text) · `icon-chart` (market data) · `icon-star` (a highlight, a review) · `icon-alert` (a warning, a mistake to avoid). Match the icon to the spoken word; if nothing fits, place none.
- **Animated end card (`brand.assets.animated.end_card_*`)** — a full-frame MP4 from the Animated Content Kit. Full-frame needs no transparency, so it works today as a closing scene (`insert_media_as_scene`, whose `startMs` is PLAYABLE time and must not exceed the video's playable end; it extends the video by its length). Only the end card is ever animated as a file; banners, strips, pop-ups, and icons are PNGs animated by the timeline.
- **Transparency: PNG yes, video no (LIVE-TESTED 2026-09-19).** A transparent PNG keeps its alpha on the Riverside timeline: the speaker shows through every clear pixel, so cards, name strips, and icons can be any shape. A transparent WEBM (VP9 with an alpha channel) does NOT: Riverside's transcode flattens it and the clear area renders as solid black. So a moving lower third or pop-up cannot be a pre-rendered video. Motion on transparent pieces comes from the timeline instead: the overlay's in and out animations (`set_overlay_clip_animations`) and nothing else (see the HAZARD below). Full-frame animated end cards (no transparency needed) remain fine as MP4.
- **Animating a placed PNG — the recipe that works (LIVE-TESTED).** One `batch` op per overlay clip: `{"type":"set_overlay_clip_animations","params":{"clipId":<id>,"inAnimation":{"animationType":"slideLeftIn","duration":{"n":1,"d":2}},"outAnimation":{"animationType":"fadeOut","duration":{"n":3,"d":10}}}}`. `animationType` is required and `duration` is an `{n,d}` fraction of seconds (a plain number is rejected). Types: `fadeIn/Out`, `slideLeftIn/Out`, `slideRightIn/Out`, `slideTopIn/Out`, `slideBottomIn/Out`, `zoomIn/Out`, `dropIn/Out`, `popIn/Out`. Riverside writes the eased position and opacity keyframes itself. House defaults: name strip `slideLeftIn` 0.5 s / `fadeOut` 0.3 s; icons and pop-ups `popIn` 0.3 s / `fadeOut` 0.3 s; `clean-minimal` and `cinematic` packs use fades only.
- **HAZARD — never hand-write a keyframe at a time greater than 0 on an overlay clip (LIVE-TESTED).** A `modify_position` / `modify_scale` keyframe placed partway through an image overlay made the Riverside editor hang on load for that whole edit until the clip was deleted. Keyframes at time 0 (the static size and position you set right after inserting) are safe and are what every recipe here uses. All motion on overlays goes through `set_overlay_clip_animations`. Punch-ins are not keyframes at all on this connector: they are zoomed scenes (`update_scene_slot_settings`, recipe in `riverside-playbooks.md`). Scale keyframes on the recording track or clip are silently discarded.
- **Putting words inside a kit panel — the centring rule (LIVE-TESTED 2026-09-21).** A text clip's anchor is its TOP-centre (`anchor {x:0.5, y:0}`), so `positionY` is roughly the top of the line, not its middle. To centre ONE line of `fontSize` F (1080p pixels) in a panel whose centre is canvas-Y `Yc`: `positionY = Yc − round(F × 0.27)` on the 640×360 canvas (F 56 → 15 px up: a panel centred at 281 takes text at 266). Horizontally, centre the text in the panel's FREE zone, not the panel: subtract the monogram or icon at the right end first. Size the line to the zone: about 0.55 × F px per character at 1080p must fit the zone's width, so a 1,280 px zone holds about 36 characters at F 64 and a 800 px zone on 9:16 about 20 at F 72. Shorten the words before shrinking the type; the kit's spec lists each zone's rectangle.
- **Proven end to end (2026-09-21):** hook banner + name strip + emphasis panel + one icon, all transparent PNGs with slide or pop in and fade out, words as shadow text centred in the panels, on a real 64-second edit; every frame checked in the editor and exported at 1080p.
- **Any asset missing → fall back to the native build for that piece.** Never block an edit on the kit; say in one line which piece fell back.
- **Upload once, reuse the id** across every edit.

**2. Native text card (the fallback).** ONE `batch` op `insert_text_overlay`:

```
{ "type": "insert_text_overlay", "params": {
    "desiredInsertionTime": {"n": <ms>, "d": 1000}, "duration": {"n": 2200, "d": 1000},
    "name": "hook-card", "trackZIndex": 10,
    "text": "<one short line>", "role": "TITLE",
    "fontFamily": "<brand heading font as Riverside names it, e.g. Poppins ExtraBold>",
    "fontSize": <see sizing>, "color": "#FFFFFF", "effect": "boxed",
    "animation": [{"name":"popIn","type":"in","duration":0.3,"offset":0},
                  {"name":"popOut","type":"out","duration":0.25,"offset":0}] } }
```

then take the new clip's id from the op result (`data.clipId`) → `modify_position` to the format zone (below). **The `boxed` effect IS the panel.** Its colour is Riverside's default (a dark box behind white text) — **there is no panel-colour field on the connector**, so a native card carries the brand in its font and its words, not its panel. That's acceptable (dark panel + white text is exactly the contrast rule), and it's why the kit is preferred for a fully-branded look. `brand.colors.accent` never goes inside a card (single text object = one colour).

## What to add — and ONLY this, by default

- **A hook card** — first ~1.5–2.5 s: the claim or number.
- **The CTA banner** — on the CTA line, to the end (`cta-pack.md`).
- **(Optional)** ONE stat/number card on a key figure.
- **Long-form also:** an **emphasis pop-up every ~2–3 min** (~3–5 on a 10-min video) + a **lower third** on first appearance.

Short-form: **2, maybe 3 cards total.** Never sparse-panic into piling on.

## Every card must be (the quality bar)

- **On a panel (kit or boxed)** — never bare floating text on busy footage. **OFF THE FACE — absolute.** **Big & bold** (heaviest family variant). **On-brand** (font from the config; the accent lives in the captions). **Animated in** (~0.3 s pop or fade) and out. **Text fits** — ONE short line; multi-line wraps are what overflow. **No collisions** with captions, other cards, the lower third, or the logo.
- **Sizing (live-tested on both formats):** `fontSize` is in **1080p EXPORT pixels** (1920×1080 landscape, 1080×1920 portrait) — NOT canvas pixels, and NOT relative to frame height. So the same number is a different share of the frame per format: **16:9 → `fontSize 64` boxed ≈ 6% of height, one clean line for ~40 characters (confirmed). 9:16 → use `fontSize 72` for a card (3.75% of height; `40` rendered tiny — live miss, fixed), keep the copy ≤ 25 characters so it fits 1080 px wide.** Positions, by contrast, ARE canvas pixels (640×360 landscape / 360×640 portrait). Riverside's TITLE preset default (136) is a full-screen title — never use it for a card. One line; if it wraps or clips the frame edge, shorten the words before you shrink the font. Budget one sizing correction — normal.
- **Typography is DESIGNED, not assembled** — single spaces, one deliberate size, centred (`textAlign` via `modify_text_properties`, which needs every field with `null` for the ones to keep). ONE text object per card — never stacked layers.
- **No cramped multi-box grids** — sequential cards, one at a time.

## Style packs — so 100 agents don't look identical

Read `brand.style_pack`. It shifts *look and energy*, never the safety rules.

| Pack | Cards | Type | Energy |
|---|---|---|---|
| **`bold-kinetic`** *(default)* | hook + CTA banners, `popIn`/`popOut` | heaviest weight (ExtraBold/Black) | the high end of the zoom rate, sizes up to 1.14 |
| **`clean-minimal`** | fewest — hook + CTA only, `fadeIn`/`fadeOut` | lighter weight, more air | the low end of the rate, 1.06 (1.10 once) |
| **`data-rich`** | favours the optional **stat card**; a touch more long-form pop-ups | heavy, numerals prominent | zooms land on the numbers |
| **`cinematic`** | sparing, `fadeIn` slow | condensed (Oswald) | the low end of the rate, slightly richer grade |

Keep an agent's card pack and caption look in the same family (`caption-style.md`).

## OFF THE FACE — how (FORMAT-AWARE; this is the rule that kept getting broken)

**Never assume a zone — LOOK first** (`frame-qa.md`, any rung ≥2) to see where the speaker really sits. Then position with `modify_position` (pixels against the canvas from `settings.canvas`; the text clip's anchor is its TOP-centre — the centring rule above).

### VERTICAL 9:16 (reels) — reference canvas 360×640 (exports 1080×1920)
- **Default: pin the card to the extreme TOP edge, above the hairline** — centre at **y ≈ 12–14% of height** (on the 360×640 reference canvas: `positionY ≈ 77–90`, `positionX = 180`; live-tested at 83); just inside the top ~8–10% platform-chrome margin (`layouts.md`). *Live-tested zone.*
- **Or time it over a B-roll moment** — the safest option in any format.
- Captions own the bottom (y≈0.84) — a card must never collide with them.
- **Stay inside the vertical safe zones**: out of the right ~12% icon rail; **centre-align, never flush-right** — shorten the text rather than widen into the rail.

### HORIZONTAL 16:9 (long-form YouTube) — reference canvas 640×360 (exports 1920×1080)
⚠️ **The top is usually NOT available.** On a 16:9 talking head the speaker's head reaches the top of frame; pinning "above the hairline" is what put a card across a real client's eyes.
- **Default: the LOWER THIRD — centre at y ≈ 75–80% of height** (on the 640×360 reference canvas: `positionY ≈ 270–288`, `positionX = 320`; live-tested at 281). Below the chin, above the bottom ~10% (YouTube's hover controls). *Tested-working zone.*
- **Use the width** — ONE wide line beats two stacked.
- **If the speaker is framed off-centre**, the empty side is an excellent card zone — use it (`positionX` ≈ 160 or 480 on the 640-wide canvas).
- **The vertical safe zones do NOT apply** — no icon rail on YouTube; the only margin is the bottom ~10%.
- **Or time it over a B-roll cutaway.**
- The native `add_lower_third` inserts **CENTRED ON THE FACE** (live-tested) — move it with `modify_position` to `positionX:200, positionY:305` (bottom-left) immediately after; and don't stack a card on it at the same time.

### Both formats
- **Never** over the face. **Never** over the captions. **Riverside inserts text CENTRED by default** — an un-moved card is on the face.
- **Frame-QA every card** (`final-check.md` blockers 13, 15, 16) — on a reachable rung, or mark it `UNVERIFIED` and say so.

## Premium & minimal — and that's the point, not a compromise

A couple of strong, clean, on-brand cards + great karaoke captions + good B-roll = a premium-feeling reel. Fancier motion-design isn't a Riverside-connector capability — it's the agent's optional manual 20%, or out of scope.
