# Caption style (quality bar)

## When captions are on

- **Short-form: always on.** Positioned LOW — **below the speaker's face, above the bottom ~15%** platform UI (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md` is canonical for the numbers). One line at a time (`contentPerSegment: "lines_1"` — short segments can't grow up into the face), karaoke (active word in the brand accent). **NEVER centred over the face.**
- **Long-form: NO word-by-word karaoke** (`set_captions show:false`). Instead an **emphasis pop-up every ~2–3 minutes** — a short key-phrase callout on a card, OFF the face (~3–5 on a 10-min video). Full captioning only if the agent explicitly asks.

## The recipe — ONE `set_captions` call

```
set_captions(editId, expectedRevision,
  show: true,
  position: { x: 0.5, y: 0.84 },          // below the chin, above the bottom UI bar; 0.82–0.86 range
  style: {
    animation: { effect: "karaoke" },     // the WORD recolours — not a box over it
    contentPerSegment: "lines_1",
    effect: "outline",                    // thick dark outline = readable on any footage
    fontFamily: "<brand.caption.font>",   // e.g. "Poppins ExtraBold" — weight lives in the family name
    fontWeight: 800,                      // must match the family variant (800 ExtraBold / 700 Bold / 900 Black)
    fontSize: 84,                         // 9:16 reel; sizes are 1080p EXPORT pixels - see sizing below
    primaryColor: "#FFFFFF",
    secondaryColor: "<brand.caption.accent>",   // the active-word colour — set it EXPLICITLY
    textAlign: "Center",
    textTransform: "None",                // UpperCase only for the bold-kinetic pack if the agent likes it
    widthRatio: 0.8                       // keeps lines out of the right ~12% icon rail
  })
```

**Sizing (live-tested).** `fontSize` is in **1080p export pixels** — on a 1080×1920 reel, `52` rendered at 2.7% of frame height, far too small for a phone (live miss). Our bar is "big and phone-legible": **`84` on 9:16** (bold-karaoke; 4.4% of height, 2–3 words per line at `widthRatio 0.8`; the first live reel shipped at 0.9 and looked fine in the export, but the feed's icon rail is not in the export, so 0.8 is the rule), `76` clean-minimal, `80` cinematic. Riverside chunks the transcript into short segments for `lines_1`, so a big size does not wrap badly. Verify on a frame; never ship the preset default.

**Presets.** `get_captions_presets(studioId)` lists the studio's brand captions (`brandCaptionsList`, if the kit has any) and the built-in catalog (`CP22`… — Poppins ExtraBold Highlight, Sora SemiBold Karaoke, Montserrat Reveal, etc.). You may pass a `presetId` + `studioId` as the base and override only `secondaryColor` / `fontSize` / `position` — explicit style fields win over the preset. Note the preset's animation accent colour is NOT applied by the tool; the edit keeps its own — so **always set `secondaryColor` yourself**.

## The bar (every caption)

- Brand caption style from `config.json`'s brand block (`brand.caption`): font (a Riverside family, named with its weight), accent, weight, animation. No standalone `brand.json` (`${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md`).
- Default look: heavy sans, thick outline, white text, the **active word** recoloured in the brand accent. No coloured chips with dark text.
- **The active-word highlight must be the WORD recoloured — NOT a filled box behind it.** `karaoke` recolours; `karaokeBoxed` / `boxed` / `boxedInverted` put a panel behind the word (a live-test failure where the box hid the word). Use `karaoke`. Verify on a frame that the word is readable.
- **Set the accent explicitly** — never a tool default (one preset ships a green `#60FF44`; another a purple).
- **Contrast is non-negotiable.** White text + outline always carries the caption; the accent is for the active word only.
- **NEVER over the face — absolute.** Always set `position.y` yourself (≈0.82–0.86). In a split-screen scene (speaker in the top half) push captions to the bottom of the speaker band or use `update_scene_caption_settings` for those scenes.
- **No overlapping elements.** Captions, the hook card, and the CTA card never collide — stagger timing (the hook, the pop-ups, and the CTA banners all live in the top zone on a reel; captions own the bottom).
- **Stay inside the safe zones** — `widthRatio ≤ 0.8`, centred, never flush-right.
- **Spelling.** Captions render from the Riverside transcript. There is no correction tool on the connector: check the aligned transcript for the name / brokerage / city / address; if wrong, the agent fixes it in the Riverside transcript panel before pass 2 (one minute), then you re-read. Never ship a misspelled name on their own reel.
- Emphasis (the accent pop) is the active word — reserve extra weight for numbers, money, and the punchline via the cards, not by shouting every caption.

## Sample looks to show at setup (the 2–3 the agent points at)

`studio-setup` shows these NAMED looks in one plain line each; whichever they pick, write its exact values into `config.json` (`caption_style` + `brand.caption` + `style_pack`) so it reproduces on every video:

1. **Bold Karaoke** (default): *"Big, heavy white words with a strong outline — the word you're saying pops in your brand colour."* → `caption_style: "bold-karaoke"` · `brand.caption: { "font": "Poppins ExtraBold", "accent": <brand accent>, "weight": "800", "anim": "karaoke" }` · `style_pack: "bold-kinetic"` · fontSize 84.
2. **Clean Minimal**: *"Lighter, modern white text with a soft shadow — calmer, the active word still turns your brand colour."* → `caption_style: "clean-minimal"` · `brand.caption: { "font": "Inter Bold", "accent": <brand accent>, "weight": "700", "anim": "karaoke" }` · `style_pack: "clean-minimal"` · effect `shadow` · fontSize 76.
3. **Cinematic**: *"Elegant condensed type with a subtle shadow — the luxury-listing feel, understated brand-colour highlight."* → `caption_style: "cinematic"` · `brand.caption: { "font": "Oswald", "accent": <brand accent>, "weight": "400", "anim": "karaoke" }` · `style_pack: "cinematic"` · textTransform `UpperCase` · fontSize 80.

(Every stored `caption_style` label maps to one of these — don't invent new labels per agent. Fonts named here are in Riverside's built-in preset catalog, so they're known to render.)

## Captions are done in RIVERSIDE

Riverside's captions are word-timed from its own transcript, big, and fully brandable with the bar above. No separate caption tool is ever required.
