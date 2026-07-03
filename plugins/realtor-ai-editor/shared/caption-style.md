# Caption style (quality bar)

## When captions are on

- **Short-form: always on.** Positioned in the LOWER portion — **below the speaker's face, above the bottom ~15%** (where the platform UI sits — `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md` is canonical for the safe-zone numbers). 2–3 words per line (kept short so they can't grow up into the face), karaoke (active word in the brand accent). **NEVER centered over the face.**
- **Long-form: NO word-by-word karaoke captions** (too long, and YouTube auto-captions cover accessibility). Instead, an **emphasis pop-up every ~2–3 minutes** — a short, punchy text callout of a key phrase from the transcript, on a rounded brand panel, **OFF the face**, animated in/out (a ~10-min video ≈ 3–5 pop-ups). These do the emphasis job that karaoke does on a reel. Full word-by-word captioning only if the agent explicitly asks (a separate, slow render pass).

## The bar (every caption)

- Brand caption style from `config.json`'s brand block (`brand.caption`, synced from the Brain at setup): font, accent colour, weight, animation. There is NO standalone `brand.json` — resolution order is `~/realtor-brain/editor/config.json` brand block → the Brain's `identity/brand-visual.md` → defaults (see `${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md`).
- Default look: heavy sans, thick black outline, white text, the **active word** in the brand accent (e.g. gold). No colored chips with dark text.
- **The active-word highlight must be the WORD itself recoloured (text colour) — NOT a filled colour BOX/background behind the word.** Descript's karaoke "classic" can render a solid accent box that *covers and hides* the word (seen live on Daniel's reel). Pick the karaoke style where the active word's TEXT changes colour, and verify on a frame that the word is still readable, not boxed-over.
- **Size: big and phone-legible.** Descript's default (~60pt) is too small — set captions large (~90pt+ on a vertical reel), and bump them up if they look small in preview.
- **Set the accent colour explicitly** to the agent's brand accent. If you don't, Descript picks its own (it defaulted to green once) — never ship an off-brand highlight.
- **Contrast is non-negotiable.** The highlight must be clearly readable against the footage — never the same colour family as what's behind it (light-blue on a blue panel disappears). White text always carries the caption; the accent is for the active word only and must pop.
- **NEVER over the face — absolute.** Captions sit below the speaker's face at every moment. If a line would reach the face, move it lower or shorten it; never let captions cover the face. **Descript defaults added captions to dead-centre (vertical position ≈ 0.50) — right on the face — so ALWAYS set the vertical position low yourself (≈ 0.82–0.86 of the frame: below the chin, above the bottom ~15% UI bar — the numbers in `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`) and never trust the default.** In a split-screen the speaker sits in the lower band, so push captions to the bottom of that band — still below his face.
- **Text must FIT its box.** Any background panel/pill has even padding around the text; the text never overflows or misaligns past the edges. A long phrase → widen the box or wrap cleanly, never let it spill over.
- **No overlapping elements.** Captions, the hook card, and the CTA card must NEVER collide or stack on each other — stagger their timing or positions so only one occupies a zone at a time. (A CTA card landing on top of the captions looks broken.)
- **Stay inside the platform safe zones.** Keep captions out of the right ~12% icon rail and above the bottom ~15% UI bar; **centre-align, never flush-right** (the feed UI isn't in the export, so apply by rule — see `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`).
- **Use a polished caption style**, not a plain text-on-a-black-bar look — pick a clean caption template and brand it. The basic boxy default reads cheap.
- Perfect word-level sync (±1 frame). Zero jitter — only colour/transform animate, never layout.
- Emphasis (a bright pop) reserved for numbers, money, and the punchline — not every word.
- Run a proper-noun corrections pass (name, brokerage, city, streets) so nothing is misspelled.

## Sample looks to show at setup (the 2–3 the agent points at)

`editor-setup` Step 3 shows the agent these NAMED looks — describe each in the one plain line below and let them point at one. Whichever they pick, write its exact values into `config.json` (the top-level `caption_style` label + the `brand.caption` block + `style_pack`) so the choice reproduces identically on every later video. All three keep the non-negotiables above (big ~90pt+, below the face, karaoke active word in the brand accent, high contrast).

1. **Bold Karaoke** (the default — the look described in "The bar" above): *"Big, heavy white words with a strong outline — the word you're saying pops in your brand colour."* Writes: `caption_style: "bold-karaoke"` · `brand.caption: { "font": <heading font>, "accent": <brand accent>, "weight": "900", "anim": "karaoke" }` · `style_pack: "bold-kinetic"`.
2. **Clean Minimal**: *"Lighter, modern white text with a soft shadow — calmer, the active word still turns your brand colour."* Writes: `caption_style: "clean-minimal"` · `brand.caption: { "font": <body font>, "accent": <brand accent>, "weight": "700", "anim": "karaoke" }` · `style_pack: "clean-minimal"`.
3. **Cinematic**: *"Elegant condensed type on a subtle dark backing — the luxury-listing feel, with an understated brand-colour highlight."* Writes: `caption_style: "cinematic"` · `brand.caption: { "font": <heading font>, "accent": <brand accent>, "weight": "800", "anim": "karaoke" }` · `style_pack: "cinematic"`.

(Every stored `caption_style` label maps to one of these looks — don't invent new labels per agent.)

## Captions are done in DESCRIPT
Captions are done in **Descript** — its caption sizing is reliable and big, and it's fully brandable with the bar above. Captions and the minimal Descript cards (hook + CTA, see `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`) all live in Descript; there's no separate render step.

## Closing the gap vs. dedicated caption apps

Descript's captions are good and fully brandable with the above. If an agent wants the absolute flashiest kinetic look and already pays for a captions tool, that can be an optional add-on later — but it is never required, and one tool stays the default.
