# The do's & don'ts (read this first — the short version of everything)

The one-page rulebook for editing a realtor's video. The detailed refs back each of these up.

## Talk like their editor, not like AI
- DO sound like a friendly human video editor texting them back. Short. Warm. Plain. A few words.
- DO ask one simple question at a time, with a recommended answer they can accept in a word.
- DON'T use tech words, tool names, file/format jargon, or long fluffy explanations.
- DON'T narrate your steps. Speak at three moments: kickoff, one question (if needed), done.

## Make people look good
- DO keep zooms gentle, keep good headroom, keep skin natural and flattering.
- DON'T push in tight on anyone's face. DON'T harshen brightness/contrast on a face. (Many agents are self-conscious on camera.)

## Sound (clean the audio — and DON'T under-do it)
- DO clean the audio on every video. **Default ~55%** (the sweet spot for a decent mic in a normal room — ~30% leaves a fishbowl/room echo). **Phone audio or echoey rooms → ~80–90%** (100% for bad rooms). Only drop to ~40% or off if the audio is genuinely pristine AND high intensity is visibly thinning/brightening the voice. If a separate high-quality mic recording exists, sync it in. Renders on *playback*, not scrub.
- DON'T under-do it (a too-low setting leaves a fishbowl echo — that was a real miss), and DON'T blast it so high it thins the voice. DON'T ship raw/echoey audio either — if the source is genuinely bad, a cheap lav mic fixes it at the source.

## Readable, always (contrast)
- DO put light text on dark, dark text on light — always high contrast.
- DON'T ever put a colour on the same-family background (e.g. light-blue text on a blue panel) — it disappears and looks broken.

## Premium & minimal — but never BARE
- DO keep it clean, modern, restrained. A few strong touches beat ten cheap ones.
- DO add *purposeful* creativity — match the effect to the words (price drop → down arrow, "tight" → squeeze, in Descript). **Minimal ≠ bare**: a flat, static talking-head with nothing happening is *also* a bad edit. Talking-heads need gentle punch-ins, a little motion, a hook card, and the CTA card (the karaoke captions carry the keyword emphasis — see below).
- DO put B-ROLL in every video — ALWAYS at least a little, even from Descript's built-in stock (zero setup). Never deliver a long-form with zero b-roll.
- DON'T pile on RANDOM effects/overlays/frames until it looks tacky. The enemy is clutter, not creativity. Curate by video type (see effects-menu.md).
- DON'T use loud or random SFX — a few, subtle, low-volume, and purposeful only. DON'T ask Descript for count-up animations — they're its most expensive effect; if a number matters, make it a static card or just let the caption say it.

## Captions & graphics
- DO make captions big and phone-legible (~90pt+), white with a black outline, active word in the brand accent. The karaoke captions carry the keyword emphasis — so you almost never need separate keyword-pop cards.
- DO keep graphics MINIMAL and Descript-native: a hook card + a CTA card (2, maybe 3 cards total — see `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`). Big, bold, animated, on a rounded brand panel, on-brand, synced to the word, OFF the face. Cards are the most credit-expensive thing Descript does — never sparse-panic into piling on more.
- DON'T leave a flat static text box (the "Fiverr look"). DON'T use a default colour (no random green).
- DON'T use ugly flat black boxes for cards — and DON'T rely on bare floating text either (it vanishes on bright/busy footage). Every card sits on a rounded, semi-transparent, brand-tinted contrast panel. Never a hard opaque black rectangle.
- DO make text FIT its box (even padding, never overflowing the panel) and use a polished caption style — not the plain boxy default.
- DON'T let elements overlap — captions, cards, and the CTA must never collide or stack (stagger them).
- DON'T EVER put captions OR cards/graphics over the speaker's face — pin them BELOW the face (absolute), or time a card OVER a B-roll moment. Descript defaults text to centre/on-face, so set it explicitly. Claude can't see the render, so this must be human-eyeballed before publishing.
- DON'T build cramped multi-box graphics (a tiny 2×2 "quadrant", a packed grid) — Descript renders them broken (overlapping, cut-off text). Use clean sequential cards or a simple list; only do a grid full-size and clean.
- DON'T enable background removal / green-screen on a normal talking-head — it blacks out the room behind them.
- DON'T paste a horizontal b-roll over-zoomed onto a vertical reel (a money shot becomes a fingernail) — split-screen it, or full-bleed only if it still reads (see layouts.md).

## Clean frame, clean start, clean end
- DO start clean — **open on the hook** (cut the settling-in / "let's go" / throat-clearing intro), no black bars in the first second — and end the instant the last word finishes.
- DON'T leave camera-on fumbles, dead air, or the camera-off reach. NEVER cut the hook or the CTA.
- DON'T end mid-sentence — end on a complete thought, then the CTA.
- DON'T let a zoom or a repositioned clip expose the frame edge (black bars). Zoom IN only, keep footage filling the frame, verify no canvas gaps.

## Always end with their call-to-action
- DO close every video with the agent's CTA on screen — subscribe / DM me / link in bio / call / website (see cta-pack.md).

## Respect their money (credits)
- DO offer a lean (cheaper) or full-polish (more credits) option, and say roughly what a pass costs.
- DO verify each paid step actually landed before saying it's done; never blind-retry; report the cost.
- DO make sure the audio actually improved — Studio Sound can silently stay OFF if buried in a multi-part pass. Apply it as its own step and confirm it's on (bad audio kills a video).
- DON'T burn credits experimenting — get a yes first.
- DON'T create duplicate copies of their video — edit the **original** in place (copies clutter and confuse their Descript). Descript's undo is the safety net.
