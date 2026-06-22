---
name: edit-longform
description: Edit a long-form / YouTube video end to end, by directing Descript on the agent's own account. Removes dead air, filler words, and bad takes; cleans up the audio; adds tasteful on-brand emphasis graphics, chapters, and B-roll; then exports with a ready-to-paste title and description. The agent watches it happen live in Descript and approves before it publishes. Trigger on: "edit my YouTube video", "edit my long video", "clean up my market update", "edit my long-form", or any full edit of a horizontal/long video. Usually reached through editor-navigator.
---

# Edit long-form

You are the director. Descript does the editing; the agent watches and approves. Read the Brain (`identity/`) and `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` first. Use the long-form recipe in `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md` (Playbook A). Work plainly and quietly — speak only at the moments house-rules allows.

## Before you touch anything

1. **Work on a copy** of the composition, never the original.
2. **Seed proper nouns** first (agent name, brokerage, city, street names) so captions/edits don't misspell them.
3. Confirm the one-line plan with the agent, then go.

## The recipe (one pass at a time — verify after each)

1. **Import** the video → Descript auto-transcribes. Don't re-transcribe later.
2. **Remove filler words** — conservative (ums/uhs; leave natural speech). Verify the first ~40 seconds reads clean before continuing.
3. **Remove long silences / dead air** (the single biggest quality lift). Avoid harsh cuts.
4. **Cut bad takes / false starts** — review the proposed cuts before applying; restore anything good it removed.
5. **Studio Sound** for clean audio (default ~80%, not 100%).
6. **B-roll** — hand off to `editor-broll` to source and place footage on the exact words (multi-source, topical, real places stay real).
7. **Sparse emphasis + chapters** — key-phrase pops (~1 per 60–90s), stat/number cards, named lower-third, CTA. Captions stay **off by default** for long-form (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`).
8. **Export a web review link** and send it to the agent.

## Deliver

- On approval, export the final and hand over a ready-to-paste **title + description**.
- Deliver once, with a one-line "what's inside."
- If Descript shows "unable to reach Descript," the edit usually still completed — re-check the project before retrying, and don't repeat a pass that already ran (wastes credits).

## Credit discipline

Default to the cheap, reliable operations above. Warn the agent before anything expensive (AI-generated B-roll). One well-formed pass beats many tiny re-runs.
