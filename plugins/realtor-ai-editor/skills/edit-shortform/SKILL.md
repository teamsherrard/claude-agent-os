---
name: edit-shortform
description: Make short-form vertical video by directing Descript on the agent's own account — either recycle one long video into several clips, or edit a standalone reel. Picks the strongest moments, reframes to 9:16, adds a hook, on-brand karaoke captions, punch-ins, and ducked music, then exports. The agent watches it happen live and approves before posting. Trigger on: "make a reel", "make this vertical", "make shorts/clips from this", "repurpose my video", "cut this up into clips", "turn my long video into shorts". Usually reached through editor-navigator.
---

# Edit short-form

You are the director; Descript edits; the agent approves. Read the Brain (`identity/`) and `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` first. Use the short-form recipe in `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md` (Playbook B), the caption bar in `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`, the graphics bar in `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`, and `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` for colour grade + flattering treatment of people. Start from `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md` (the one-page rulebook); use `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md` (what to use, sparingly) and `${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md` (always end with the agent's CTA). Default to the **Standard** credit tier (`${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`).

## Two modes

- **Recycle** — pull the best clips out of an existing long video.
- **Standalone** — edit a single short the agent recorded.

If recycling, read the transcript and choose moments the way a good editor would: a strong hook, a complete idea, and a payoff or CTA. Make a 9:16 composition per clip.

## The recipe

1. **Pick the moment** — must stand alone, start with a hook, end on a payoff/CTA.
2. **Reframe to 9:16**, keep the face centred with headroom.
3. **Cut hard + clean the audio** — zero dead air (cut tighter than long-form), and **always apply Studio Sound (~90%, automatic — agents record on phones)**. **Clean start & end:** open on the hook, trim the camera-off reach / dead air at the end, never end mid-sentence — but never cut the hook or the CTA.
4. **Hook in the first ~1.5s** — 3–5 words, a claim or a number. Make the hook CARD big, bold, and animated (pop-in), never a flat static text box — see `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`.
5. **Captions on, always** — center, karaoke, brand accent on the active word (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`).
6. **B-roll** — `editor-broll`, on the words, never over the hook/face/CTA (3–5 on the key lines — Standard). Horizontal b-roll → split-screen or clean full-bleed, never over-zoomed/floating (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`).
7. **Punch-ins** on a few key beats (subtle ~1.06–1.08 zoom), not every scene. Keep pop-ups to 2–3 max, SFX to 1–2, transitions at major changes only (Standard — `${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`).
8. **Music** ducked under the voice.
9. **End with the CTA** — close on the agent's call-to-action with an on-screen CTA pop-up (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`), not just spoken words.
10. **Export**; on approval, hand back the file(s).

Target 20–60s (ideal 30–45s). Pay off the hook.

## Credit discipline

Reframe + captions + cuts are cheap and reliable — lead with those. Warn before AI-generated B-roll. Make several clips in one batch rather than re-running per clip.
