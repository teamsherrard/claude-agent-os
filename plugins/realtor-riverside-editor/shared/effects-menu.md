# Effects menu — what's available in Riverside, and when to use it (sparingly)

Riverside gives you few effects. That is mostly good news: **premium = restraint**, and the connector can't tempt you into clutter. The skill is using what IS there with purpose.

**But minimal ≠ bare.** A flat, static talking-head with nothing happening is *also* a bad edit. The enemy is RANDOM clutter, not creativity.

**Mandatory energy minimum — EVERY video:** zooms on the emotional and important beats at the rate below (a 10-minute video gets about ten, a 40-second reel gets three), a size change on every jump cut, the hook banner and the CTA banner, a name strip on long-form. Transitions are not a connector operation — Riverside's straight cuts are clean, and a jump between two takes is hidden by a zoom change or a cutaway, not a dissolve.

## Emotion-driven energy — the plan (LIVE-TESTED tool, 2026-09-23 rules)

A flat video is one where the picture never reacts to what is being said. The fix is not more effects; it is putting the ONE effect this engine does well (a hard-cut zoom) on the moments that carry feeling, so the picture moves when the agent does. This is what "editing to the emotion" means here.

**1. Find the beats (free, before any write).** Three sources, in this order:
- **The brief's featured moments** (`creative-direction.md`): the 3 to 5 lines the video is about.
- **Riverside's emotion data.** `read_aligned_transcript(includeParalinguistics:true)` returns `paralinguistics[]`: `emotion` events (happiness, surprise, and others) with a `score`, and `affect` events (valence, arousal, dominance, marked + or −). A `emotion` event scoring 0.8 or higher, an `arousal+` or `dominance+` event, and laughter are beats. `valence−` on a serious line ("here's the con") is a beat too; the picture should lean in when the agent gets serious.
- **Transcript cues** on the compact rows: a number or a dollar figure; a superlative; a reveal phrase ("here's the thing", "nobody tells you", "the truth is", "listen", "what's the truth"); a direct question to the viewer; a contrast turn ("but", "actually", "the problem is"); the payoff line after a setup; the CTA line.

**2. Set the rate by format.** Long-form 16:9: one zoom every 45 to 75 seconds, so a 10-minute video carries 9 to 13, never fewer than one per 90 seconds anywhere in the video. Reels: one every 12 to 20 seconds, so a 40-second reel carries 3, a 60-second reel 4. Style pack shifts the rate one step: `clean-minimal` and `cinematic` take the low end, `bold-kinetic` the high end, `data-rich` lands its zooms on the numbers.

**3. Size to the beat.** `1.06` for a normal beat · `1.10` for a strong one (a number, a reveal, a laugh) · `1.14` for THE line of the video, once. Never above `1.14`, never a tight push on a face (`footage-look.md`). Hold for the line: 2.5 to 6 seconds, cut in on the first word, out on the first word after.

**4. Three moves, not one.**
- **Zoom in** (the default): scene at 1.0 → beat scene at 1.06 to 1.14 → back to 1.0.
- **Step back for a reveal:** hold the SETUP at 1.10 and cut OUT to 1.0 on the payoff word. Use it once or twice on a long-form for the biggest contrast ("everyone says X … here's what actually happens").
- **Jump-cut cover:** every editorial cut in a talking head (a removed take, a trimmed tangent) gets a size change on one side, 1.0 ↔ 1.06, so the jump reads as a deliberate cut, not a glitch. Read `syncedCuts[]` with `source:"user"`, split a scene at each cut's source-time start, alternate. This is the single biggest "a real editor did this" signal and it is free.
- Never two zoomed scenes back to back at the same size; return to 1.0 (or step) between beats. Two beats inside 8 seconds: keep the stronger. For the jump-cut cover, the scene AFTER the cut changes size (1.0 → 1.06, or 1.06 → 1.0 if the scene before it was already zoomed) and holds until the next phrase boundary or the next beat, whichever comes first; a cut that lands inside a beat zoom needs nothing extra.
- **Time axis:** emotion events and the compact rows are PLAYABLE time; every scene split is SOURCE time. Take each beat's first word from `read_aligned_transcript(detail:"words")` and split at its `assetStart`. Batch all splits first, read once, then batch all slot settings (`riverside-playbooks.md`).

**5. Sound.** A swoosh on a zoom only from the agent's own uploaded SFX (`config.sfx.swoosh_media_id`, `insert_audio` at the cut). Riverside's free library has "transition" tracks, but they are 7 to 19-second music stingers, not hits; do not use them as swooshes. Say once, warmly, that a licensed swoosh dropped into their Riverside media makes every zoom land.

**6. Cutaway entrances.** B-roll cuts in hard (no fade) on `bold-kinetic` and `data-rich`; a 0.15 s fade on `clean-minimal` and `cinematic`. Never a fade through black, never a dark grade on a cutaway (`broll-ladder.md`).

**7. Verify.** Read the scenes back (every zoomed scene shows `positioning.scale`), then one frame at each size used: no exposed edge, comfortable headroom. Log the count and the sizes: `energy · done · rev <n> · 11 zooms (1.06 ×7, 1.10 ×3, 1.14 ×1), 6 jump covers`.

**Match the energy to their STYLE PACK** (`${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md`): **`bold-kinetic`** (default) the high end of the rate, hard cutaway cuts, pop-in cards · **`clean-minimal`** the low end, fades, 1.06 by default (1.10 at most once) · **`data-rich`** zooms land on the numbers, favour the stat card · **`cinematic`** the low end, slow fades, slightly richer grade. Full definitions in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`.

## What's available (and the operation behind it)

- **Colour correction** — `set_color_correction` (brightness / contrast / saturation / Kelvin). A *subtle* one (`footage-look.md`).
- **Zooms (punch-ins, step-backs, jump-cut covers)** — a split scene with a slot scale (`update_scene_slot_settings … positioning:{scale, offset}`; recipe in `riverside-playbooks.md`; `modify_scale` on the speaker track is a silent no-op). Always a hard cut on a phrase boundary; sizes and rate in the plan above.
- **Card and overlay animations** — text cards take an `animation` list at insert; placed PNGs and clips take `set_overlay_clip_animations` with `animationType` + an `{n,d}` duration (`graphics-style.md` has the exact shape and the live-tested hazard: never hand-write mid-clip keyframes on an overlay). Pop for bold-kinetic; fade for clean-minimal and cinematic.
- **Opacity / corner radius / rotation** on any overlay — `modify_opacity`, `modify_corner_radius`, `modify_rotate`. A PiP b-roll with rounded corners at 0.95 opacity is a clean look; use rarely.
- **Layouts** — `apply_smart_layout` (Smart / FullScreen / PiP / SplitScreen / Grid) and `change_layout` to a named preset. Multi-speaker gold; on a solo talking head, FullScreen.
- **Logo** — `insert_logo` / `apply_brand`: top-right, ~1/8 canvas width, ~70% opacity, long-form only by default.
- **Section markers** — `add_chapter` / `move_chapter`: navigation markers named by the first spoken words (`sections.md`). The Studio never names a chapter; the names live in the YouTube System's description.
- **Music bed + section stingers** — the free library (`get_stock_music`): -18 dB on a reel, -22 dB on a long-form, faded; a 1.8 s transition slice at each long-form section change (`music.md`).
- **Smart mutes** — `apply_smart_mutes` on multi-speaker recordings only.

## What is NOT available (don't promise it)

Transitions/dissolves, an SFX library, count-ups, annotations (arrows/circles), progress bars, film grain / light leaks, frames. If the agent wants one of these, it's their manual 20% in the Riverside editor (some exist there) — say so warmly.

## Banned even though the operation exists

`modify_eye_correction` (eye contact) · `modify_background` (remove/replace/blur behind a talking head) · any AI-generated B-roll. Warn and skip.

## When to use what (by video type)

- **Talking-head (reels AND long-form):** zooms on the emotional beats at the format's rate, jump-cut covers, the cards, a subtle grade — PLUS on long-form a lower third and the emphasis pop-ups. Purposeful, not constant.
- **Listing / property tour:** the agent's own footage room to room, stills with a gentle animated entrance, an address/price card, no gimmicks.
- **Market update / data:** zooms on the key stats, an optional single stat card, chapters. Restrained but not bare.
- **Interview / guest:** Smart layout + smart mutes + lower thirds. This is where Riverside shines.

## The hard rule

If you're unsure whether an effect helps, leave it out. When in doubt: clean, big, readable, on-brand, minimal.
