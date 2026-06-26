---
name: edit-longform
description: Edit a long-form / YouTube video end to end, by directing Descript on the agent's own account. Removes dead air, filler words, and bad takes; cleans up the audio; adds tasteful on-brand energy (gentle punch-ins, transitions, SFX), a hook card + CTA, chapters, and B-roll; then exports with a ready-to-paste title and description. The agent watches it happen live in Descript and approves before it publishes. Trigger on: "edit my YouTube video", "edit my long video", "clean up my market update", "edit my long-form", or any full edit of a horizontal/long video. Usually reached through editor-navigator.
---

# Edit long-form

You are the director. Descript does the editing; the agent watches and approves. Read the Brain (`identity/`) and `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` first. Use the long-form recipe in `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md` (Playbook A), the minimal native graphics guide `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` for the on-brand cards and their visual standard, and `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` for the always-on colour grade + flattering treatment. Start from `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`; use `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md` (sparingly) and `${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md` (end with the CTA). Follow the 80/20 credit discipline (`${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`) — do the basics brilliantly, then stop. Match the edit to the video type (`${CLAUDE_PLUGIN_ROOT}/shared/content-types.md`) and run the final check before delivery (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`). Work plainly and quietly — speak only at the moments house-rules allows.

## The always-done core (the 80% — never skip)

Every long-form ALWAYS gets, every time: a **clean cut** (filler/dead-air/bad-takes removed), **open ON THE HOOK**, a **clean ending** (never mid-sentence), **Studio Sound (~55% default, higher for phone/echoey)**, a **colour grade (bare-minimum, never over-saturated)**, **B-roll** on the key lines, and **energy on key beats — a couple of zoom-in/out punch-ins (each with a swoosh SFX), smooth transitions, and a couple of SFX**. Plus a **hook card**, the **CTA**, and **emphasis pop-ups every ~2–3 min** (long-form has no word-by-word karaoke — these short key-phrase callouts carry the emphasis). That clean core is the whole job. Anything beyond it (more B-roll, more graphics, tweaks) is the agent's manual 20% — they add it by hand in Descript for free (no AI credits).

## Before you touch anything

1. **Work on the original composition in place** — don't create duplicate copies (it clutters the agent's Descript and confuses them). Descript's undo / version history is the safety net if they want to revert.
2. **Seed proper nouns** first (agent name, brokerage, city, street names) so captions/edits don't misspell them.
3. Confirm the one-line plan with the agent, then go.

## The recipe (one pass at a time — verify after each)

1. **Get the video into Descript** — if it's already there, just find the project; otherwise import it **by URL** (a Google Drive / Dropbox / direct link — never a big local upload; see the playbook's "Getting the video IN"). Descript auto-transcribes on import. Don't re-transcribe later.
2. **Remove filler words** — conservative (ums/uhs; leave natural speech). Verify the first ~40 seconds reads clean before continuing.
3. **Remove long silences / dead air** (the single biggest quality lift). Avoid harsh cuts. **Clean start & end — OPEN ON THE HOOK:** cut the settling-in / "let's go" / throat-clearing intro so it starts on the first real line; trim the camera-off reach at the end — never cut the hook itself or the CTA.
4. **Cut bad takes / false starts** — review the proposed cuts before applying; restore anything good it removed.
5. **Studio Sound — clean the audio, and DON'T under-do it.** Default **~55%** (the sweet spot for a decent mic in a normal room — ~30% leaves a fishbowl echo). **Phone audio / echoey rooms → ~80–90%** (100% for bad rooms). Only drop to ~40% or off if the audio is genuinely pristine AND high intensity is visibly thinning/brightening the voice. If a separate high-quality mic recording exists, sync THAT in. Renders on playback — verify on playback, not the scrub preview.
6. **B-roll (REQUIRED — never skip)** — hand off to `editor-broll` to source and place footage on the exact words (multi-source, topical, real places stay real). **Every long-form gets B-roll**, scaled to length: **roughly 1 cutaway per ~1.5–2 min of finished video — a ~10-min video ≈ 5–7 clips** (on the key lines + section changes), curated, never wall-to-wall. Even with no agent footage and no stock keys, use a few topical clips from **Descript's built-in stock library** (zero setup, in their account). Never ship a long-form with no b-roll; if the agent wants more than the scaled amount, that's their manual 20%.
7. **Colour grade (ALWAYS) + purposeful emphasis (minimal ≠ bare).** First, apply a subtle, flattering **colour grade** to the footage (`${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md`) — never ship raw, ungraded footage. Then add energy so the talking-head doesn't go flat (**mandatory minimum, on KEY beats — not every scene**): a couple of **zoom-in/out punch-ins** on key lines (each with a **swoosh SFX**), **smooth transitions** at scene changes, **at least a couple of SFX**, and **contextual animations matched to the words** (e.g. "prices dropping" → a downward arrow; "inventory tight" → a squeeze) (`${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`) — never flat, never cluttered.
   - **Graphics & on-screen text — native Descript, OFF the face:** a **hook card** (start) + the **CTA card** (end) on a rounded brand panel, big, animated. **Long-form has NO word-by-word karaoke captions** (too long; YouTube auto-captions cover accessibility) — instead add an **emphasis pop-up every ~2–3 min**: a short, punchy callout of a key phrase from the transcript, on a brand panel, off the face (so a ~10-min video carries ~3–5 emphasis moments). Optionally ONE stat card on a key figure. These pop-ups ARE the long-form emphasis layer — keep them on-brand and to the ~2–3-min cadence (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`, `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`).
   - Full word-by-word captioning only if the agent explicitly asks (a separate, slow pass).
8. **End properly** — never end mid-sentence; end on a complete thought, then the agent's on-screen CTA pop-up (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`).
9. **Final check** (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`), then export a web review link and send it to the agent.

## Deliver

- On approval, export the final and hand over a ready-to-paste **title + description**.
- Deliver once, with a one-line "what's inside."
- If Descript shows "unable to reach Descript," the edit usually still completed — re-check the project before retrying, and don't repeat a pass that already ran (wastes credits).

## Credit discipline

Default to the cheap, reliable operations above. The basics (cut, open-on-hook, clean end, Studio Sound, grade, B-roll) are ALWAYS done and non-negotiable; so are the hook card, the CTA, and the long-form **emphasis pop-ups every ~2–3 min** (~3–5 on a 10-min video) — those carry the long-form emphasis layer (there's no karaoke). Everything past those is the agent's manual 20%. NO count-up number animations; no heavy AI effects. Warn the agent before anything expensive (AI-generated B-roll) and skip it by default. One well-formed pass beats many tiny re-runs. See the full 80/20 rule in `${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`.
