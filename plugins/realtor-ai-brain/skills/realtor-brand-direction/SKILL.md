---
name: realtor-brand-direction
description: >
  Phase 3 of the Realtor AI Brain — captures the agent's BRAND DIRECTION: the colours they love, the
  vibe/feel they want, font direction, logo direction, and tagline ideas. It does NOT design anything —
  no logo, no brand guide, no graphics, no files. It writes identity/brand-visual.md, which the agent
  then plugs into Claude Design (claude.ai/design) to build the actual visuals, and which the AI Video
  Editor reads for colours and fonts.

  Trigger on: "set my brand direction", "my brand colours", "what should my brand look like", "build my
  brand" (direction), "I don't know my brand colours", "lock my brand direction", "phase 3", or any
  request to DECIDE the agent's visual direction (not to design it).
---

# Realtor Brand Direction (Brain Phase 3)

Captures the agent's visual brand **direction** — not a design. Quick: ~5–10 minutes. The output is a
clear written direction the agent takes into **Claude Design (claude.ai/design)** to actually build
their logo, brand kit, and templates.

**This skill never designs, renders, or produces any visual or file. Direction only.**

*Follow `${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md` — propose 2–3 directions when the agent's
unsure (this skill already does), and honour "skip" / "use defaults" with a safe, on-brand default.*

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, plus `identity/voice.md`, `identity/avatars.md`, `identity/profile.md`.
Their voice (calm vs bold), avatars, and niche should shape the directions you propose. Note the
brokerage from `profile.md` — if eXp / RE/MAX / KW, tell them to keep their personal direction *distinct*
from the brokerage's brand colours (e.g. eXp blue). If `~/realtor-brain/` doesn't exist, run **Setup** first.

## The capture (conversational — and guide them, because most realtors don't know)
1. **Colours** — "Any colours you love or hate?" If they're unsure, **propose 2–3 complete colour
   directions** built from their vibe + niche and let them react. Capture ~4–5 colours, each with a hex
   and a role (dominant / primary / accent / neutral-text).
2. **Feel / vibe** — 3 words for how the brand should feel (e.g. calm, premium, modern); tie it to their voice.
3. **Font direction** — modern vs classic, serif vs sans, clean vs bold. Suggest a pairing to react to (names only).
4. **Logo direction** — do they have one, or want one? What style — monogram, wordmark, a simple mark?
   **Direction only — do not design it.**
5. **Tagline ideas** — offer 2–3 drawn from their offer + voice; let them pick one or park it.

When they're unsure, **propose and let them react** — never hand them a blank. (Same move as the offer phase.)

## Write + push to Drive + hand off

> **Push to Drive after writing** — run `realtor-brain-sync` (PUSH). The local copy is wiped when the
> session ends; an unsynced write is a lost write.
Write everything to `~/realtor-brain/identity/brand-visual.md` as **direction** — colours (with hex),
fonts, vibe, logo direction, tagline. Then tell them plainly:

> Your brand **direction** is saved. To turn it into actual visuals — logo, brand kit, templates — take
> this into **Claude Design (claude.ai/design)**; it builds them from this direction. Once you have a
> logo or headshot, drop them into `~/realtor-brain/assets/` so your other tools and the AI Video Editor
> can use them.

If run as **Phase 3 of Setup**, hand control back to Setup. *(Reminder: direction only — Claude Design
does the building.)*
