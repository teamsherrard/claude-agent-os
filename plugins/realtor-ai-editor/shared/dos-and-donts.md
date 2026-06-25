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

## Sound (clean the audio — match the source)
- DO clean the audio on every video — but match Studio Sound intensity to the SOURCE: phone audio (most realtors) ~80–90%; a real external mic is already clean, so go LIGHT (~30–40%) or OFF (high intensity brightens/thins the voice — especially a deep voice — and sounds artificial). If a separate high-quality mic recording exists, sync it in and skip Studio Sound. Renders on *playback*, not scrub.
- DON'T blast ~90% Studio Sound onto good mic audio. DON'T ship raw/echoey audio either — if the source is genuinely bad, a cheap lav mic fixes it at the source.

## Readable, always (contrast)
- DO put light text on dark, dark text on light — always high contrast.
- DON'T ever put a colour on the same-family background (e.g. light-blue text on a blue panel) — it disappears and looks broken.

## Premium & minimal — but never BARE
- DO keep it clean, modern, restrained. A few strong touches beat ten cheap ones.
- DO add *purposeful* creativity — match the effect to the words (price drop → down arrow, "tight" → squeeze, in Descript). **Minimal ≠ bare**: a flat, static talking-head with nothing happening is *also* a bad edit. Talking-heads need gentle punch-ins, a little motion, AND the engine's text overlays (hook title, chips, stat cards, keyword pops, CTA — see below).
- DO put B-ROLL in every video — ALWAYS at least a little, even from Descript's built-in stock (zero setup). Never deliver a long-form with zero b-roll.
- DON'T pile on RANDOM effects/overlays/frames until it looks tacky. The enemy is clutter, not creativity. Curate by video type (see effects-menu.md).
- DON'T use loud or random SFX — a few, subtle, low-volume, and purposeful only. DON'T ask Descript for count-up animations — they're its most expensive effect; numbers become **stat cards in the graphics engine** (json2video, cheap) instead.

## Captions & graphics
- DO make captions big and phone-legible (~90pt+), white with a black outline, active word in the brand accent.
- DO render hook/section/number cards, keyword pops, lower-thirds, and the CTA through the **graphics engine** (json2video — `${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md` + `${CLAUDE_PLUGIN_ROOT}/shared/graphics-templates.md`), NOT Descript: big, bold, animated, on a contrast panel, on-brand, synced to the word, off the face. Every video must hit the graphics-coverage floor (hook + chips + stat card + keyword pops + CTA).
- DON'T leave a flat static text box (the "Fiverr look"). DON'T use a default colour (no random green).
- DON'T use ugly flat black boxes for keyword pops — and DON'T rely on bare floating text either (it vanishes on bright/busy footage). Every pop sits on a rounded, semi-transparent, brand-tinted contrast panel (the engine templates already do this). Never a hard opaque black rectangle.
- DO make text FIT its box (even padding, never overflowing the panel) and use a polished caption style — not the plain boxy default.
- DON'T let elements overlap — captions, pops, cards, and the CTA must never collide or stack (stagger them).
- DON'T EVER put captions OR cards/graphics over the speaker's face — pin them BELOW the face (absolute). Descript defaults text to centre/on-face, so set it low explicitly. Claude can't see the render, so this must be human-eyeballed before publishing.
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
