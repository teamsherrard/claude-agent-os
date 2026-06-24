---
name: edit-longform
description: Edit a long-form / YouTube video end to end, by directing Descript on the agent's own account. Removes dead air, filler words, and bad takes; cleans up the audio; adds tasteful on-brand emphasis graphics, chapters, and B-roll; then exports with a ready-to-paste title and description. The agent watches it happen live in Descript and approves before it publishes. Trigger on: "edit my YouTube video", "edit my long video", "clean up my market update", "edit my long-form", or any full edit of a horizontal/long video. Usually reached through editor-navigator.
---

# Edit long-form

You are the director. Descript does the editing; the agent watches and approves. Read the Brain (`identity/`) and `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` first. Use the long-form recipe in `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md` (Playbook A), plus `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` and `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` for cards, colour, and flattering treatment. Start from `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`; use `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md` (sparingly) and `${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md` (end with the CTA). Default to the **Standard** credit tier (`${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`). Match the edit to the video type (`${CLAUDE_PLUGIN_ROOT}/shared/content-types.md`) and run the final check before delivery (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`). Work plainly and quietly — speak only at the moments house-rules allows.

## Before you touch anything

1. **Work on the original composition in place** — don't create duplicate copies (it clutters the agent's Descript and confuses them). Descript's undo / version history is the safety net if they want to revert.
2. **Seed proper nouns** first (agent name, brokerage, city, street names) so captions/edits don't misspell them.
3. Confirm the one-line plan with the agent, then go.

## The recipe (one pass at a time — verify after each)

1. **Get the video into Descript** — if it's already there, just find the project; otherwise import it **by URL** (a Google Drive / Dropbox / direct link — never a big local upload; see the playbook's "Getting the video IN"). Descript auto-transcribes on import. Don't re-transcribe later.
2. **Remove filler words** — conservative (ums/uhs; leave natural speech). Verify the first ~40 seconds reads clean before continuing.
3. **Remove long silences / dead air** (the single biggest quality lift). Avoid harsh cuts. **Clean start & end — OPEN ON THE HOOK:** cut the settling-in / "let's go" / throat-clearing intro so it starts on the first real line; trim the camera-off reach at the end — never cut the hook itself or the CTA.
4. **Cut bad takes / false starts** — review the proposed cuts before applying; restore anything good it removed.
5. **Studio Sound — clean the audio, intensity by SOURCE.** Phone audio (most realtors) → ~80–90% (100% for echoey rooms). A real external mic → already clean, so go LIGHT (~30–40%) or OFF — high intensity brightens/thins the voice (especially a deep voice) and sounds unnatural. If a separate high-quality mic recording exists, sync THAT in and skip Studio Sound. Renders on playback — verify on playback, not the scrub preview.
6. **B-roll (REQUIRED — never skip)** — hand off to `editor-broll` to source and place footage on the exact words (multi-source, topical, real places stay real). **Every long-form gets B-roll** — at minimum a few topical clips from **Descript's built-in stock library** (zero setup, in their account). Never ship a long-form with no b-roll.
7. **Purposeful emphasis + chapters (minimal ≠ bare).** A talking-head goes flat without energy, so add: gentle **punch-ins** on key lines, **keyword pop-ups** on the punchy phrases, **contextual animations matched to the words** (e.g. "prices dropping" → a downward arrow; a big number → count-up; "inventory tight" → a squeeze), stat/number cards, and a few **tasteful SFX** on transitions. Big/bold/animated/high-contrast (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`, `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`) — never flat, never cluttered. Captions stay **off by default** for long-form (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`).
8. **End properly** — never end mid-sentence; end on a complete thought, then the agent's on-screen CTA pop-up (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`).
9. **Final check** (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`), then export a web review link and send it to the agent.

## Deliver

- On approval, export the final and hand over a ready-to-paste **title + description**.
- Deliver once, with a one-line "what's inside."
- If Descript shows "unable to reach Descript," the edit usually still completed — re-check the project before retrying, and don't repeat a pass that already ran (wastes credits).

## Credit discipline

Default to the cheap, reliable operations above. Warn the agent before anything expensive (AI-generated B-roll). One well-formed pass beats many tiny re-runs.
