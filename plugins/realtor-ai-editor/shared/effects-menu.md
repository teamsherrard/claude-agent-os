# Effects menu — what's available, and when to use it (sparingly)

Descript has far more than cuts and captions. The skill is knowing what NOT to use. **Premium = restraint.** A clean, minimal, professional look beats a busy one every time. Pick a few touches that fit the video type — never the kitchen sink.

**But minimal ≠ bare.** A flat, static talking-head with nothing happening is *also* a bad edit — it loses the viewer. The enemy is RANDOM clutter, not creativity. The win is **purposeful, contextual creativity — match the effect to the words:** "prices are dropping" → a downward arrow that drifts down; a big number → a stat card (rendered in the graphics engine, never a Descript count-up); "inventory is tight" → a squeeze. Those reinforce the message and feel premium. So be generous with *purposeful* touches, ruthless with *random* ones.

**Scope — what this menu is:** these are DESCRIPT's own effects (grade, punch-ins, transitions, contextual motion like arrows/squeeze, SFX, annotations, progress bar). The premium **TEXT graphics** — hook title, section chips, stat/number cards, keyword pops, lower-thirds, framework reveals, CTA — are NOT Descript effects; they render via the **graphics engine** (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md` + `${CLAUDE_PLUGIN_ROOT}/shared/graphics-templates.md`), composited over the export. Where this file says "card" or "pop", that means an engine overlay, not a Descript element.

## What's available (Properties + Elements)

- **Colour adjustments** — Neutral / Warm / Cool. Use a *subtle* one (see `footage-look.md`).
- **Transitions** — soft cuts, short dissolves, whip-pans. Short (~0.3s) between scenes; never flashy.
- **Effects** — gentle zoom/punch-ins, blur.
- **Shapes & lines** — accent bars/underlines behind text for clean cards.
- **Dynamic text** — timer / marker / simple labels only. (Speaker-name lower-thirds, titles, and cards are premium overlays → the graphics engine, not Descript.)
- **Progress bar / spinner / pie** — a thin progress bar along the top of a reel can lift retention. Subtle only.
- **Annotations** — hand-drawn arrow, circle, underline. Great for pointing at ONE thing (a stat, a feature). One at a time.
- **Overlays** — light leaks, bokeh, film grain, snow/rain. Use almost never; a *whisper* of film grain or a light leak on a transition can feel cinematic. Snow/rain only if literally relevant.
- **Frames** — camcorder / 8mm / glowing border. Niche; only for a deliberate retro moment.

## When to use what (by video type)

- **Talking-head (reels AND long-form YouTube):** this format goes flat without energy — give it gentle punch-ins on the key lines, contextual animations matched to the words (price drop → down arrow, "tight" → squeeze), a few **subtle, low-volume** SFX on transitions (never loud or jarring), and a subtle grade — PLUS the engine's text overlays (hook title, chips, stat cards, keyword pops, CTA — see the scope note). Purposeful, not constant. (A bare talking-head is the most common under-edit.)
- **Listing / property tour:** smooth room-to-room transitions, clean lower-thirds (address/price), the agent's own footage. No gimmicky overlays.
- **Market update / data:** a **stat card on every figure** (engine overlay), punch-ins on the key stats, a contextual animation where it fits (price drop → down arrow, in Descript), maybe a thin progress bar. Restrained but not bare.
- **Hype / promo:** a touch more energy is OK — a light leak on a transition, slightly punchier — but still tasteful.

## The hard rule

If you're unsure whether an effect helps, leave it out. Over-editing looks cheap and amateur. When in doubt: clean, big, readable, on-brand, minimal.
