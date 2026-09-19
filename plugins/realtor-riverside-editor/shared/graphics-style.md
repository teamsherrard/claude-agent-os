# Graphics in Riverside — minimal, clean, off the face

Graphics are placed in Riverside and kept **MINIMAL**. On a **short-form reel** the karaoke captions (brand-accent active word) already carry the keyword emphasis. On **long-form** there's no karaoke — the emphasis lives in **pop-up cards every ~2–3 min** + a lower third. (`${CLAUDE_PLUGIN_ROOT}/shared/cost-discipline.md` for the caps.)

## Two ways to make a card — and which one wins

**1. Video Brand Kit PNGs (preferred — check `config.json → brand.assets` FIRST).** If the agent's kit is registered, the standard cards come from those files, **already uploaded to Riverside's Your Media at setup** (`brand.assets.riverside_media_ids`). Placing one is a single `insert_overlay(assetId, startMs, durationMs)` — full-frame, position centre. This is the ONLY way to get a **brand-coloured panel** in Riverside (see the native limitation below), so a registered kit is the premium path.

- **Hook card** — the format-matched file (`hook_9x16` / `hook_16x9`), full-frame for the hook window (~1.5–2.5 s), plus the episode's hook line as **ONE text object inside the card's reserved zone** (an `insert_text_overlay` with `effect: "shadow"`, no box, positioned into the zone).
- **CTA card** — the CTA file full-frame at the end. It ships COMPLETE — add nothing on top. `cta-pack.md` governs timing.
- **Emphasis pop-ups (long-form)** — the transparent emphasis file + the key phrase as one text object in its zone, ~every 2–3 min.
- **Lower third (long-form)** — the kit's strip for ~5 s on first appearance, OR the native `add_lower_third` (name + role) if the kit has none.
- **Logo** — `apply_brand` (from the studio kit) or `insert_logo`; top-right, ~1/8 width, ~70% opacity; long-form by default, reels optional.
- **LOOK first still applies** — the zones were designed off-face, but check a frame; if the speaker's framing collides, time the card over B-roll.
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

then `read_timeline_in_range` at that time → the new text clip's `uniqueId` → `modify_position` to the format zone (below). **The `boxed` effect IS the panel.** Its colour is Riverside's default (a dark box behind white text) — **there is no panel-colour field on the connector**, so a native card carries the brand in its font and its words, not its panel. That's acceptable (dark panel + white text is exactly the contrast rule), and it's why the kit is preferred for a fully-branded look. `brand.colors.accent` never goes inside a card (single text object = one colour).

## What to add — and ONLY this, by default

- **A hook card** — first ~1.5–2.5 s: the claim or number.
- **A CTA card** — at the end (`cta-pack.md`).
- **(Optional)** ONE stat/number card on a key figure.
- **Long-form also:** an **emphasis pop-up every ~2–3 min** (~3–5 on a 10-min video) + a **lower third** on first appearance.

Short-form: **2, maybe 3 cards total.** Never sparse-panic into piling on.

## Every card must be (the quality bar)

- **On a panel (kit or boxed)** — never bare floating text on busy footage. **OFF THE FACE — absolute.** **Big & bold** (heaviest family variant). **On-brand** (font from the config; the accent lives in the captions). **Animated in** (~0.3 s pop or fade) and out. **Text fits** — ONE short line; multi-line wraps are what overflow. **No collisions** with captions, other cards, the lower third, or the logo.
- **Sizing (live-tested on both formats):** `fontSize` is in **1080p EXPORT pixels** (1920×1080 landscape, 1080×1920 portrait) — NOT canvas pixels, and NOT relative to frame height. So the same number is a different share of the frame per format: **16:9 → `fontSize 64` boxed ≈ 6% of height, one clean line for ~40 characters (confirmed). 9:16 → use `fontSize 72` for a card (3.75% of height; `40` rendered tiny — live miss, fixed), keep the copy ≤ 25 characters so it fits 1080 px wide.** Positions, by contrast, ARE canvas pixels (640×360 landscape / 360×640 portrait). Riverside's TITLE preset default (136) is a full-screen title — never use it for a card. One line; if it wraps or clips the frame edge, shorten the words before you shrink the font. Budget one sizing correction — normal.
- **Typography is DESIGNED, not assembled** — single spaces, one deliberate size, centred (`textAlign` via `modify_text_properties` if the default isn't centred). ONE text object per card — never stacked layers.
- **No cramped multi-box grids** — sequential cards, one at a time.

## Style packs — so 100 agents don't look identical

Read `brand.style_pack`. It shifts *look and energy*, never the safety rules.

| Pack | Cards | Type | Energy |
|---|---|---|---|
| **`bold-kinetic`** *(default)* | hook + CTA, `popIn`/`popOut` | heaviest weight (ExtraBold/Black) | 2–3 punch-ins |
| **`clean-minimal`** | fewest — hook + CTA only, `fadeIn`/`fadeOut` | lighter weight, more air | 1–2 punch-ins |
| **`data-rich`** | favours the optional **stat card**; a touch more long-form pop-ups | heavy, numerals prominent | punch-ins land on the stats |
| **`cinematic`** | sparing, `fadeIn` slow | condensed (Oswald) | fewest punch-ins, slightly richer grade |

Keep an agent's card pack and caption look in the same family (`caption-style.md`).

## OFF THE FACE — how (FORMAT-AWARE; this is the rule that kept getting broken)

**Never assume a zone — LOOK first** (`frame-qa.md`, any rung ≥2) to see where the speaker really sits. Then position with `modify_position` (pixels against the canvas from `settings.canvas`; the text clip's anchor is its centre).

### VERTICAL 9:16 (reels) — canvas 1080×1920
- **Default: pin the card to the extreme TOP edge, above the hairline** — centre at **y ≈ 12–14% of height** (`positionY ≈ 230–270`), `positionX = 540`; just inside the top ~8–10% platform-chrome margin (`layouts.md`). *Tested zone (Descript live).*
- **Or time it over a B-roll moment** — the safest option in any format.
- Captions own the bottom (y≈0.84) — a card must never collide with them.
- **Stay inside the vertical safe zones**: out of the right ~12% icon rail; **centre-align, never flush-right** — shorten the text rather than widen into the rail.

### HORIZONTAL 16:9 (long-form YouTube) — canvas 1920×1080
⚠️ **The top is usually NOT available.** On a 16:9 talking head the speaker's head reaches the top of frame; pinning "above the hairline" is what put a card across a real client's eyes.
- **Default: the LOWER THIRD — centre at y ≈ 75–80% of height** (`positionY ≈ 810–865`, `positionX = 960`). Below the chin, above the bottom ~10% (YouTube's hover controls). *Tested-working zone.*
- **Use the width** — ONE wide line beats two stacked.
- **If the speaker is framed off-centre**, the empty side is an excellent card zone — use it (`positionX` ≈ 25% or 75%).
- **The vertical safe zones do NOT apply** — no icon rail on YouTube; the only margin is the bottom ~10%.
- **Or time it over a B-roll cutaway.**
- The native `add_lower_third` inserts **CENTRED ON THE FACE** (live-tested) — move it with `modify_position` to `positionX:200, positionY:305` (bottom-left) immediately after; and don't stack a card on it at the same time.

### Both formats
- **Never** over the face. **Never** over the captions. **Riverside inserts text CENTRED by default** — an un-moved card is on the face.
- **Frame-QA every card** (`final-check.md` blockers 7, 12, 13) — on a reachable rung, or mark it `UNVERIFIED` and say so.

## Premium & minimal — and that's the point, not a compromise

A couple of strong, clean, on-brand cards + great karaoke captions + good B-roll = a premium-feeling reel. Fancier motion-design isn't a Riverside-connector capability — it's the agent's optional manual 20%, or out of scope.
