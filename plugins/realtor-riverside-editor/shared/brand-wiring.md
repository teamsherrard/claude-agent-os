# Brand wiring

Brand is **per agent, never hardcoded.** The structure is universal; the colours/fonts always come from the current agent's brand. **This plugin shares the config file with the Descript editor (Plugin 6)** — one brand block serves both engines.

## Resolution order

Read brand in this exact order — first hit wins:

1. **`~/realtor-brain/editor/config.json`'s `brand` block** — the single source of truth. There is **NO separate `brand.json` file**.
2. The Realtor AI Brain: `identity/brand-visual.md` (+ `identity/voice.md`, `identity/compliance.md`).
3. Tasteful defaults — never placeholders.
4. Ask one friendly question (main colour + font feel) only if there's nothing in 1–3.

**Home that setup writes to:** `studio-setup` captures the agent's colour/font and writes it into `config.json`'s `brand` block (synced from the Brain). It ALSO writes the brand into the **Riverside studio brand kit** once (`editing_set_brand`: colours, background, logo) so `editing_apply_brand` can place the logo/design on every edit — and records `riverside.brand_kit_written: true`. If `set_brand` is feature-gated, the brand still works: every card and caption is styled from the config block directly.

## Schema (brand block)

```json
{
  "agent_name": "", "brokerage": "", "brand_name": "", "tagline": "", "city": "",
  "website": "", "cta_url": "",
  "cta": { "text": "", "details": "" },
  "colors": { "primary": "", "accent": "", "text": "#FFFFFF", "bg": "" },
  "fonts": { "heading": "", "body": "" },
  "logo": "", "logo_media_id": "",
  "caption": { "font": "", "accent": "", "weight": "900", "anim": "karaoke" },
  "style_pack": "bold-kinetic",
  "assets": {
    "dir": "", "spec": "",
    "hook_16x9": "", "hook_9x16": "", "cta_16x9": "", "cta_9x16": "",
    "lower_third": "", "lower_third_9x16": "", "emphasis_16x9": "", "emphasis_9x16": "",
    "end_card_16x9": "", "end_card_9x16": "", "end_screen": "", "logo_sting": "",
    "icons_dir": "", "animated": {"end_card_16x9": "", "end_card_9x16": ""},
    "zones": {"hook_16x9": "x 320-1600 y 770-920 · 64px · 35 chars", "emphasis_16x9": "x 400-1520 · 64px · 30 chars", "hook_9x16": "x 140-940 y 160-340 · 72px · 20 chars"},
    "members": {},
    "cta_pack": {"subscribe_16x9": "", "subscribe_9x16": "", "comment_16x9": "", "comment_9x16": "", "guide_16x9": "", "guide_9x16": "", "call_16x9": "", "call_9x16": "", "book_16x9": "", "book_9x16": "", "dm_16x9": "", "dm_9x16": "", "link_16x9": "", "link_9x16": "", "follow_16x9": "", "follow_9x16": ""},
    "riverside_media_ids": {}
  }
}
```

- `style_pack` × the colour skin = the agent's signature. Starter packs: `data-rich`, `clean-minimal`, `bold-kinetic` (default), `cinematic` — defined as concrete deltas in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` and `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`. It shifts look and energy only; never a safety rule.
- **`colors` → what each field is FOR:** `accent` is the **karaoke active word** (`set_captions.style.secondaryColor`); `text` is card/caption text; `bg`/`primary` (whichever is dark) is the card panel — **on a brand-kit PNG.** A native Riverside `boxed` text overlay can't take a panel colour from the connector, so on native cards the panel is Riverside's default dark box and the brand shows in the font + the kit; see `graphics-style.md`.
- `logo_media_id` — the logo PNG once uploaded to Riverside's Your Media (`media_create_media_upload` → finalize). Setup fills it; `insert_logo` / `set_brand` use it.
- `caption.font` must be a family Riverside serves, named **with its weight variant** (`"Poppins ExtraBold"`, `"Inter Bold"`, `"Sora SemiBold"`, `"Montserrat"` ExtraBold at 800). Setup maps the Brain's heading font to the nearest available family and stores THAT.
- `cta` holds the CTA wording captured at setup — `cta-pack.md` reads it for the closing card.
- **`assets` — the Video Brand Kit v3** (designed once in the agent's Claude Design suite, stored in the workspace Drive at `02 · Brand/Video Brand Kit/` or uploaded straight into Riverside's media panel, under canonical names). **Every piece is a full-canvas TRANSPARENT overlay drawn in its zone, not a full-screen slate:** `hook_*` is a wide banner with an EMPTY headline zone, `cta_*` is a CTA banner with the words baked (it pops up on the CTA line), `lower_third*` is the name strip, `emphasis_*` is the pop-up panel with an empty zone. `end_card_*` is the only opaque full-frame piece (optional, long-form close). `cta_pack` holds the eight quick-ask banners (`cta-<variant>-16x9.png` etc.), each popped up on the line where the agent says that ask (`cta-pack.md`). `preview-*.png` files in the folder are review sheets: never register or place them. Setup registers the Drive paths (when Drive is on) AND gets each PNG into Riverside's Your Media — by uploading it, or by finding a file the agent dragged into the media panel themselves (`media_list_media`, matched on the canonical file name) — recording the media ids in `assets.riverside_media_ids`, keyed by the asset key (`{"hook_9x16":"<24-hex>", "cta_pack.book_16x9":"<24-hex>", "icons.icon-dollar":"<24-hex>", …}`) — so an edit places a card with ONE `insert_overlay` call and no re-upload. The spec WINS over inferred values. When `assets` is populated, cards are **PLACED from these files, not built natively**. Empty `assets` → native cards.
- Compliance: read `identity/compliance.md` before any public-facing export or post (brokerage disclaimer, license display, claims to avoid).
- `caption.weight` is shared with the Descript engine. On Riverside the weight is whatever the chosen family carries (`Poppins ExtraBold` = 800, `Inter Bold` = 700), so pass the family's own weight when the two differ.
- `default_engine` (top level of the config, `"riverside"` or `"descript"`) decides which video editor owns a plain "edit my video" when both are installed.
