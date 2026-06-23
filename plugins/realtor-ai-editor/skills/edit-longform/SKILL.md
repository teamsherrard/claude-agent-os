---
name: edit-longform
description: Edit a long-form / YouTube video end to end, by directing Descript on the agent's own account. Removes dead air, filler words, and bad takes; cleans up the audio; adds tasteful on-brand emphasis graphics, chapters, and B-roll; then exports with a ready-to-paste title and description. The agent watches it happen live in Descript and approves before it publishes. Trigger on: "edit my YouTube video", "edit my long video", "clean up my market update", "edit my long-form", or any full edit of a horizontal/long video. Usually reached through editor-navigator.
---

# Edit long-form

You are the director. Descript does the editing; the agent watches and approves. Read the Brain (`identity/`) and `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` first. Use the long-form recipe in `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md` (Playbook A), plus `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` and `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` for cards, colour, and flattering treatment. Start from `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`; use `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md` (sparingly) and `${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md` (end with the CTA). Default to the **Standard** credit tier (`${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`). Work plainly and quietly — speak only at the moments house-rules allows.

## Before you touch anything

1. **Work on the original composition in place** — don't create duplicate copies (it clutters the agent's Descript and confuses them). Descript's undo / version history is the safety net if they want to revert.
2. **Seed proper nouns** first (agent name, brokerage, city, street names) so captions/edits don't misspell them.
3. Confirm the one-line plan with the agent, then go.

## The recipe (one pass at a time — verify after each)

1. **Get the video into Descript** — if it's already there, just find the project; otherwise import it **by URL** (a Google Drive / Dropbox / direct link — never a big local upload; see the playbook's "Getting the video IN"). Descript auto-transcribes on import. Don't re-transcribe later.
2. **Remove filler words** — conservative (ums/uhs; leave natural speech). Verify the first ~40 seconds reads clean before continuing.
3. **Remove long silences / dead air** (the single biggest quality lift). Avoid harsh cuts. **Clean start & end:** trim the camera-on fumble at the start and the camera-off reach at the end — never cut the hook or the CTA.
4. **Cut bad takes / false starts** — review the proposed cuts before applying; restore anything good it removed.
5. **Studio Sound** for clean audio (default ~80%, not 100%).
6. **B-roll** — hand off to `editor-broll` to source and place footage on the exact words (multi-source, topical, real places stay real).
7. **Sparse emphasis + chapters** — key-phrase pops (~1 per 60–90s), stat/number cards, named lower-third, CTA. Make any cards big/bold/animated and on-brand (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`), not flat text. Captions stay **off by default** for long-form (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`).
8. **End with the CTA** — close on the agent's call-to-action with an on-screen CTA pop-up (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`).
9. **Export a web review link** and send it to the agent.

## Deliver

- On approval, export the final and hand over a ready-to-paste **title + description**.
- Deliver once, with a one-line "what's inside."
- If Descript shows "unable to reach Descript," the edit usually still completed — re-check the project before retrying, and don't repeat a pass that already ran (wastes credits).

## Credit discipline

Default to the cheap, reliable operations above. Warn the agent before anything expensive (AI-generated B-roll). One well-formed pass beats many tiny re-runs.
