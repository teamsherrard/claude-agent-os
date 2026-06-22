# Caption style (quality bar)

## When captions are on

- **Short-form: always on.** Center position (not lower-third — the platform UI lives at the bottom), 2–3 words per line, karaoke (the active word pops to the brand accent).
- **Long-form: off by default.** Captioning a whole long video adds a slow render pass and YouTube auto-captions anyway. Only add if the agent asks, as a separate final pass.

## The bar (every caption)

- Brand caption style from `brand.json` (`brand.caption`): font, accent colour, weight, animation.
- Default look: heavy sans, thick black outline, white text, the **active word** in the brand accent (e.g. gold). No colored chips with dark text.
- Perfect word-level sync (±1 frame). Zero jitter — only colour/transform animate, never layout.
- Emphasis (a bright pop) reserved for numbers, money, and the punchline — not every word.
- Run a proper-noun corrections pass (name, brokerage, city, streets) so nothing is misspelled.

## Closing the gap vs. dedicated caption apps

Descript's captions are good and fully brandable with the above. If an agent wants the absolute flashiest kinetic look and already pays for a captions tool, that can be an optional add-on later — but it is never required, and one tool stays the default.
