# Graphics & hook cards (quality bar)

> **Where graphics are rendered:** the premium graphic OVERLAYS — hook title, section chips, stat/number cards, keyword pop-ups, lower-thirds, framework/list reveals, CTA — are rendered by the **graphics engine** (json2video), NOT Descript. See `${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md` + the copy-ready `${CLAUDE_PLUGIN_ROOT}/shared/graphics-templates.md`. **This file is the VISUAL STANDARD** every one of those overlays must meet. Descript does the edit + captions; it does NOT draw the premium cards (it rendered them flat / on the face / as broken grids).

These cards are NOT drawn in Descript — they render via the **graphics engine** (json2video). This file is the visual STANDARD they must meet: always big, bold, animated, deep, high-contrast, on-brand. The engine's templates (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-templates.md`) already ship every one of these specs — use them.

## Every hook card, title card, and number/stat card must be:

- **Big** — fill a large part of the frame (title text ~140px+ on a vertical reel, not 60–70px).
- **Bold** — heaviest weight (800–900).
- **Animated** — a punchy entrance (scale-up / pop-in with a slight overshoot, ~0.3–0.4s) plus a subtle emphasis. Never a static box that just appears.
- **Depth** — a drop shadow or a clean background panel so it pops off the footage.
- **On-brand** — colours/fonts from `brand.json`; never a tool default (it once defaulted to green).
- **Clean & modern** — not a thin centred line on a plain dark bar.
- **Every text element on a CONTRAST PANEL (rounded, semi-transparent, soft shadow) — NEVER a hard flat black rectangle, and NEVER bare floating text.** Bare text (even with an outline) vanishes on a bright sky or busy footage — that's the recurring contrast complaint. The panel guarantees legibility on any background; make it rounded + brand-tinted/semi-transparent, never a solid black box. (This matches the engine's hard rule #1 — the templates already ship the panel.)
- **High contrast** — text must pop against its panel AND the footage. NEVER the same colour family on the same background (light-blue text on a blue panel vanishes). White-on-navy or navy-on-white — not blue-on-blue.
- **Reveal, don't just appear** — every card/pop-up animates in (slide / pop / swoosh) and out; nothing should blink onto screen.
- **Text fits its box** — even padding around the text; it never overflows the panel (a two-word term must not spill past the edges).
- **No collisions** — no two elements (card, pop-up, caption, CTA) overlap or stack. Stagger their timing or positions.
- **Keep graphics SIMPLE — no cramped multi-box grids.** Descript renders complex multi-element graphics (a 2×2 "quadrant", a packed grid) BROKEN — overlapping boxes, colliding and cut-off text — especially when shrunk small or pushed into a corner. For a multi-part concept (a 4-part framework, a quadrant, a checklist), use clean **sequential cards** (one item at a time, as he says each) or a simple stacked list — NEVER a tiny grid. If a multi-part graphic is truly needed, keep it full-size and clean; never shrink it.

## Placement

- Hook/title card in the first ~1.5s, over B-roll or a clean frame — never over the face mid-sentence.
- **Cards & graphics sit LOW — below the face, like captions — and NEVER cover the face (absolute).** Descript defaults text/cards to CENTRE (right on the face), so pin every card to the lower third explicitly (vertical centre ~0.82–0.9 of the frame, fully below the face) and never trust the default. Claude can't see the render → human-eyeball it before publishing.
- Number/stat cards land on the exact line they refer to.
- **Clean frame:** no black bars, letterboxing, or broken-looking edges — especially in the first second. The opening must look intentional, never glitchy.
- **Horizontal b-roll on a vertical reel → split-screen or clean full-bleed, never over-zoomed or floating** (see `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`).

## Premium & minimal (don't over-edit) — but NEVER sparse

A few strong, clean touches beat a pile of effects — over-editing looks cheap and tacky. Curate by video type (`${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`). **But minimal NEVER means sparse:** every video must still hit the graphics-coverage floor (hook + chips + stat card + keyword pops + CTA — see `${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md`). A flat clip with one lonely title is a FAIL, same as a cluttered one. And every video ends with the agent's CTA on screen (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`).

## Be explicit with the engine (use the templates)

Every overlay must hit these specs: big (title ≥ 80px, often ~140px on a reel), heaviest weight (800–900), a drop shadow / depth, a ~0.35s pop-in, on a contrast panel, on-brand. The json2video templates in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-templates.md` already ship all of this — use the templates; don't hand-build cards and don't ask Descript to draw them.

## The engine renders the premium overlays (the default, not the ceiling)

The premium graphic overlays are rendered by the **graphics engine** (json2video) and composited over the Descript export — see `${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md` + `${CLAUDE_PLUGIN_ROOT}/shared/graphics-templates.md`. This is the DEFAULT path for every hook title, chip, stat card, keyword pop, lower-third, framework reveal, and CTA — not a last resort. Descript does the edit + captions and does NOT draw these cards (it renders them flat / on the face / as broken grids). Don't burn credits asking Descript for premium motion-design it can't do — use the engine's templates.
