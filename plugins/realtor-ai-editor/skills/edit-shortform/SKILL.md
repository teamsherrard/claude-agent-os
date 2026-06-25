---
name: edit-shortform
description: Make short-form vertical video by directing Descript on the agent's own account — either recycle one long video into several clips, or edit a standalone reel. Picks the strongest moments, reframes to 9:16, adds a hook, on-brand karaoke captions, punch-ins, and ducked music, then exports. The agent watches it happen live and approves before posting. Trigger on: "make a reel", "make this vertical", "make shorts/clips from this", "repurpose my video", "cut this up into clips", "turn my long video into shorts". Usually reached through editor-navigator.
---

# Edit short-form

You are the director; Descript edits; the agent approves. Read the Brain (`identity/`) and `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` first. Use the short-form recipe in `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md` (Playbook B), the caption bar in `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`, the graphics bar in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`, and `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` for colour grade + flattering treatment of people. Start from `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md` (the one-page rulebook); use `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md` (what to use, sparingly) and `${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md` (always end with the agent's CTA). Default to the **Standard** credit tier (`${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`). Match the edit to the video type (`${CLAUDE_PLUGIN_ROOT}/shared/content-types.md`), use a ducked music bed (`${CLAUDE_PLUGIN_ROOT}/shared/music.md`), and run the final check before delivery (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`).

## Two modes

- **Recycle** — pull the best clips out of an existing long video.
- **Standalone** — edit a single short the agent recorded.

If recycling, read the transcript and choose moments the way a good editor would: a strong hook, a complete idea, and a payoff or CTA. Make a 9:16 composition per clip.

## The recipe

1. **Pick the moment** — must stand alone, start with a hook, end on a payoff/CTA.
2. **Reframe to 9:16**, keep the face centred with headroom.
3. **Cut hard + clean the audio** — zero dead air (cut tighter than long-form), and **always apply Studio Sound (~90%, automatic — agents record on phones)**. **Clean start & end:** open on the hook, trim the camera-off reach / dead air at the end, never end mid-sentence — but never cut the hook or the CTA.
4. **Hook in the first ~1.5s** — 3–5 words, a claim or a number. The hook CARD is a premium overlay → render it via the **graphics engine** (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md`, template 1): big, bold, animated, on a contrast panel, on-brand — never a flat static Descript text box (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` is the visual standard).
5. **Captions on, always — NO exceptions** — a short-form reel without captions is an automatic FAIL. Pinned in the LOWER portion (vertical position ≈ 0.84–0.88), **below the speaker's face (never centered, never over the face)**, **BIG and phone-legible (~90pt+, never Descript's ~60pt default)**, karaoke, brand accent set EXPLICITLY on the active word (never a tool default like green), high contrast against the footage (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`).
6. **B-roll** — `editor-broll`, on the words, **full-cover, never over the hook/face/CTA, and NEVER the same clip twice in a row** (3–5 TOTAL on the key lines — not more; over-b-roll drains credits and clutters). Horizontal b-roll → split-screen or clean full-bleed, never over-zoomed/floating (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`).
   - **Premium graphics (hook/section/stat/CTA cards) → the graphics engine** (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md` + the copy-ready templates in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-templates.md`): json2video renders them on-brand, on a contrast panel, synced to the exact spoken word, OFF the face, for ~free; **captions stay in Descript.**
   - **GRAPHICS COVERAGE FLOOR (mandatory — count before delivery):** every reel MUST have at minimum a **hook title + 3 lower-thirds/section chips + 1 stat card + 2 keyword popups + a CTA card**. Sparse graphics = a failed edit; add them, never deliver under-built (see the GRAPHICS COVERAGE section in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md`).
7. **Punch-ins** on a few key beats (subtle ~1.06–1.08 zoom), not every scene. Keep pop-ups to 2–3 max, SFX to 1–2, transitions at major changes only (Standard — `${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`).
8. **Music** ducked under the voice.
9. **End with the CTA** — close on the agent's call-to-action with an on-screen CTA pop-up (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`), not just spoken words.
10. **Final check** (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`) — verify audio, opening/ending, captions/overlaps, and framing — then export; on approval, hand back the file(s).

Target 20–60s (ideal 30–45s). Pay off the hook.

## Credit discipline

Reframe + captions + cuts are cheap and reliable — lead with those. Warn before AI-generated B-roll. Make several clips in one batch rather than re-running per clip.
