# Effects menu — what's available in Riverside, and when to use it (sparingly)

Riverside gives you fewer effects than Descript. That is mostly good news: **premium = restraint**, and the connector can't tempt you into clutter. The skill is using what IS there with purpose.

**But minimal ≠ bare.** A flat, static talking-head with nothing happening is *also* a bad edit. The enemy is RANDOM clutter, not creativity.

**Mandatory energy minimum — EVERY video (on KEY beats, never every scene):** 2–3 gentle **punch-ins** (a zoomed scene at about 1.08× held for the key line) on the key lines; a **swoosh** on each ONLY if `config.sfx.swoosh_media_id` exists; the hook card and the CTA; a lower third on long-form. Transitions are not a connector operation — Riverside's straight cuts are clean, and a jump between two talking-head takes is best hidden by a punch-in or a B-roll cutaway, not a dissolve.

**Match the energy to their STYLE PACK** (`${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md`): **`bold-kinetic`** (default) 2–3 punch-ins, snappy pop-in cards · **`clean-minimal`** 1–2 punch-ins, fade-in cards · **`data-rich`** punch-ins land on the stats, favour the stat card · **`cinematic`** fewest punch-ins, slow fades, slightly richer grade. Full definitions in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`.

## What's available (and the operation behind it)

- **Colour correction** — `set_color_correction` (brightness / contrast / saturation / Kelvin). A *subtle* one (`footage-look.md`).
- **Punch-ins** — a split scene with slot scale about 1.08 (`update_scene_slot_settings`; `modify_scale` on the speaker track is a silent no-op). A hard-cut zoom on a phrase boundary. Zoom IN only.
- **Card and overlay animations** — text cards take an `animation` list at insert; placed PNGs and clips take `set_overlay_clip_animations` with `animationType` + an `{n,d}` duration (`graphics-style.md` has the exact shape and the live-tested hazard: never hand-write mid-clip keyframes on an overlay). Pop for bold-kinetic; fade for clean-minimal and cinematic.
- **Opacity / corner radius / rotation** on any overlay — `modify_opacity`, `modify_corner_radius`, `modify_rotate`. A PiP b-roll with rounded corners at 0.95 opacity is a clean look; use rarely.
- **Layouts** — `apply_smart_layout` (Smart / FullScreen / PiP / SplitScreen / Grid) and `change_layout` to a named preset. Multi-speaker gold; on a solo talking head, FullScreen.
- **Logo** — `insert_logo` / `apply_brand`: top-right, ~1/8 canvas width, ~70% opacity, long-form only by default.
- **Chapters** — `add_chapter`: native markers on long-form, carrying the YouTube System's chapter titles once its SEO Package exists. The Studio never names one.
- **Music bed** — the free library (`get_stock_music`), -18 dB, faded.
- **Smart mutes** — `apply_smart_mutes` on multi-speaker recordings only.

## What is NOT available (don't promise it)

Transitions/dissolves, an SFX library, count-ups, annotations (arrows/circles), progress bars, film grain / light leaks, frames. If the agent wants one of these, it's their manual 20% in the Riverside editor (some exist there) — say so warmly.

## Banned even though the operation exists

`modify_eye_correction` (eye contact) · `modify_background` (remove/replace/blur behind a talking head) · any AI-generated B-roll. Warn and skip.

## When to use what (by video type)

- **Talking-head (reels AND long-form):** gentle punch-ins on the key lines, the cards, a subtle grade — PLUS on long-form a lower third and the emphasis pop-ups. Purposeful, not constant.
- **Listing / property tour:** the agent's own footage room to room, stills with a gentle animated entrance, an address/price card, no gimmicks.
- **Market update / data:** punch-ins on the key stats, an optional single stat card, chapters. Restrained but not bare.
- **Interview / guest:** Smart layout + smart mutes + lower thirds. This is where Riverside shines.

## The hard rule

If you're unsure whether an effect helps, leave it out. When in doubt: clean, big, readable, on-brand, minimal.
