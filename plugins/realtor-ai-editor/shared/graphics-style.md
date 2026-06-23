# Graphics & hook cards (quality bar)

Descript's default text/graphics look flat and cheap ("Fiverr") unless you direct them hard. So **always** spell out size, weight, animation, depth, and brand colour — it won't do it on its own.

## Every hook card, title card, and number/stat card must be:

- **Big** — fill a large part of the frame (title text ~140px+ on a vertical reel, not 60–70px).
- **Bold** — heaviest weight (800–900).
- **Animated** — a punchy entrance (scale-up / pop-in with a slight overshoot, ~0.3–0.4s) plus a subtle emphasis. Never a static box that just appears.
- **Depth** — a drop shadow or a clean background panel so it pops off the footage.
- **On-brand** — colours/fonts from `brand.json`; never a tool default (it once defaulted to green).
- **Clean & modern** — not a thin centred line on a plain dark bar.
- **High contrast** — text must pop against its panel AND the footage. NEVER the same colour family on the same background (light-blue text on a blue panel vanishes). White-on-navy or navy-on-white — not blue-on-blue.
- **Reveal, don't just appear** — every card/pop-up animates in (slide / pop / swoosh) and out; nothing should blink onto screen.
- **Text fits its box** — even padding around the text; it never overflows the panel (a two-word term must not spill past the edges).
- **No collisions** — no two elements (card, pop-up, caption, CTA) overlap or stack. Stagger their timing or positions.

## Placement

- Hook/title card in the first ~1.5s, over B-roll or a clean frame — never over the face mid-sentence.
- Number/stat cards land on the exact line they refer to.
- **Clean frame:** no black bars, letterboxing, or broken-looking edges — especially in the first second. The opening must look intentional, never glitchy.
- **Horizontal b-roll on a vertical reel → split-screen or clean full-bleed, never over-zoomed or floating** (see `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`).

## Premium & minimal (don't over-edit)

A few strong, clean touches beat a pile of effects — over-editing looks cheap and tacky. Curate by video type (`${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`). And every video ends with the agent's CTA on screen (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`).

## Be explicit with Descript

Out of the box it makes a small static box. Told exactly what to do, it will go big and animated (e.g. ~148px, weight 900, drop shadow, 0.35s ease-out-back pop-in). So put those specifics in the instruction every time.

## The ceiling (when to reach for the graphics engine)

Descript can do big/bold/animated *single* cards, but not true multi-element kinetic motion-design. If the agent wants premium animated graphics beyond that, that's the separate **graphics-engine handoff** (a rendered clip imported as B-roll) — flag it; don't burn credits asking Descript for what it can't do.
