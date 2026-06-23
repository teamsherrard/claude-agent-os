# Caption style (quality bar)

## When captions are on

- **Short-form: always on.** Positioned in the LOWER portion — **below the speaker's face, above the bottom ~12%** (where the platform UI sits). 2–3 words per line (kept short so they can't grow up into the face), karaoke (active word in the brand accent). **NEVER centered over the face.**
- **Long-form: off by default.** Captioning a whole long video adds a slow render pass and YouTube auto-captions anyway. Only add if the agent asks, as a separate final pass.

## The bar (every caption)

- Brand caption style from `brand.json` (`brand.caption`): font, accent colour, weight, animation.
- Default look: heavy sans, thick black outline, white text, the **active word** in the brand accent (e.g. gold). No colored chips with dark text.
- **Size: big and phone-legible.** Descript's default (~60pt) is too small — set captions large (~90pt+ on a vertical reel), and bump them up if they look small in preview.
- **Set the accent colour explicitly** to the agent's brand accent. If you don't, Descript picks its own (it defaulted to green once) — never ship an off-brand highlight.
- **Contrast is non-negotiable.** The highlight must be clearly readable against the footage — never the same colour family as what's behind it (light-blue on a blue panel disappears). White text always carries the caption; the accent is for the active word only and must pop.
- **NEVER over the face — absolute.** Captions sit below the speaker's face at every moment. If a line would reach the face, move it lower or shorten it; never let captions cover the face.
- **Text must FIT its box.** Any background panel/pill has even padding around the text; the text never overflows or misaligns past the edges. A long phrase → widen the box or wrap cleanly, never let it spill over.
- **No overlapping elements.** Captions, keyword pops, stat cards, and the CTA must NEVER collide or stack on each other — stagger their timing or positions so only one occupies a zone at a time. (A CTA box landing on top of the captions looks broken.)
- **Use a polished caption style**, not a plain text-on-a-black-bar look — pick a clean caption template and brand it. The basic boxy default reads cheap.
- Perfect word-level sync (±1 frame). Zero jitter — only colour/transform animate, never layout.
- Emphasis (a bright pop) reserved for numbers, money, and the punchline — not every word.
- Run a proper-noun corrections pass (name, brokerage, city, streets) so nothing is misspelled.

## Closing the gap vs. dedicated caption apps

Descript's captions are good and fully brandable with the above. If an agent wants the absolute flashiest kinetic look and already pays for a captions tool, that can be an optional add-on later — but it is never required, and one tool stays the default.
