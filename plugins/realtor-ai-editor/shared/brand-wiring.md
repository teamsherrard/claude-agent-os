# Brand wiring

Brand is **per agent, never hardcoded.** The structure is universal; the colours/fonts always come from the current agent's brand.

## Resolution order

Read brand in this exact order — first hit wins:

1. **`~/realtor-brain/editor/config.json`'s `brand` block** — the single source of truth. There is **NO separate `brand.json` file**; brand lives as a `brand` block *inside* `config.json`.
2. The Realtor AI Brain: `identity/brand-visual.md` (+ `identity/voice.md`, `identity/compliance.md`).
3. Tasteful defaults — never placeholders.
4. Ask one friendly question (main colour + font feel) only if there's nothing in 1–3.

**Home that setup writes to:** Editor Setup captures the agent's colour/font and writes it into `config.json`'s `brand` block (synced from the Brain). The example/starter `config.json` ships with an **empty** `brand` block. All readers (caption-style, navigator, and every other skill) read `config.json`'s `brand` block, then fall back to the Brain's `identity/brand-visual.md`, then defaults — never a standalone `brand.json`.

## Schema (brand block)

```json
{
  "agent_name": "",
  "brokerage": "",
  "brand_name": "",
  "tagline": "",
  "city": "",
  "website": "",
  "cta_url": "",
  "cta": { "text": "", "details": "" },
  "colors": { "primary": "", "accent": "", "text": "#FFFFFF", "bg": "" },
  "fonts": { "heading": "", "body": "" },
  "logo": "",
  "caption": { "font": "", "accent": "", "weight": "900", "anim": "karaoke" },
  "style_pack": "bold-kinetic",
  "assets": {
    "dir": "", "spec": "",
    "hook_16x9": "", "hook_9x16": "", "cta_16x9": "", "cta_9x16": "",
    "lower_third": "", "emphasis_16x9": "", "emphasis_9x16": "",
    "end_screen": "", "logo_sting": ""
  }
}
```

- `style_pack` (look/energy/typography) × the colour skin = the agent's signature, so 100 agents don't look identical. Starter packs: `data-rich`, `clean-minimal`, `bold-kinetic` (default), `cinematic`. **Who reads it:** `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` (card density + type weight) and `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md` (energy level) — each pack is defined there as concrete deltas. It shifts look and energy only; it never overrides a safety rule (off-face, contrast, containment, the caps).
- **`colors` → what each field is actually FOR:** `bg` or `primary` (whichever is dark) is the **card panel**; `text` (default `#FFFFFF`) is the card text; `accent` is the **karaoke active word**, never inside a card (a single text object can't do per-word colour). If every brand colour is light, the panel falls back to `#1F2A37` — see "Panel colour" in `graphics-style.md` for the dark test.
- `caption.accent` drives the active-word colour.
- `cta` holds the CTA wording captured at setup (`text` e.g. "DM me COST", `details` e.g. the phone number or link) — `cta-pack.md` reads it for the closing card; `cta_url` stays the link-only field.
- **`assets` — the Video Brand Kit** (designed once in the agent's Claude Design suite, stored in the
  workspace Drive at `02 · Brand/Video Brand Kit/` under canonical names: `hook-16x9.png`,
  `hook-9x16.png`, `cta-16x9.png`, `cta-9x16.png`, `lower-third-16x9.png`, `emphasis-16x9.png`,
  `emphasis-9x16.png`, `end-screen.png`, optional `logo-sting.mp4`, plus the `video-brand-spec` doc).
  Editor Setup registers the paths here and transcribes the spec into this brand block — the spec WINS
  over inferred values (the agent approved it in design). When `assets` is populated, cards are
  **PLACED from these files, not built natively** — see "Video Brand Kit" in `graphics-style.md`. An
  empty `assets` block changes nothing: native cards as always.
- Compliance: read `identity/compliance.md` before any public-facing export (brokerage disclaimer, license display, claims to avoid).
