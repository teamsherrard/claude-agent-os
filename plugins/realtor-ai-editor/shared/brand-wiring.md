# Brand wiring

Brand is **per agent, never hardcoded.** The structure is universal; the colours/fonts always come from the current agent's brand.

## Resolution order

1. Existing `~/realtor-brain/editor/config.json` brand block.
2. The Realtor AI Brain: `identity/brand-visual.md` (+ `identity/voice.md`, `identity/compliance.md`).
3. Ask one friendly question (main colour + font feel) only if the Brain has nothing.
4. Tasteful defaults — never placeholders.

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
  "colors": { "primary": "", "accent": "", "text": "#FFFFFF", "bg": "" },
  "fonts": { "heading": "", "body": "" },
  "logo": "",
  "caption": { "font": "", "accent": "", "weight": "900", "anim": "karaoke" },
  "style_pack": "bold-kinetic"
}
```

- `style_pack` (look/energy/typography) × the colour skin = the agent's signature, so 100 agents don't look identical. Starter packs: `data-rich`, `clean-minimal`, `bold-kinetic`, `cinematic`.
- `caption.accent` drives the active-word colour.
- Compliance: read `identity/compliance.md` before any public-facing export (brokerage disclaimer, license display, claims to avoid).
