# Review and revise — "something feels off"

Most revision notes are vague, and a vague note answered with a fresh re-edit fixes the wrong thing. This craft turns a feeling into one precise change.

## The loop

1. **Empathy first, then three concrete guesses.** *"Totally fine. Is it the pacing, the captions, or the footage that feels off?"* If they pointed at a moment, skip the guessing.
2. **Diagnose before touching anything.** Read the timeline around the moment; `compare_revisions` from the last delivery to now (they may have edited by hand); look at a frame (`frame-qa.md`). A vague note usually has one concrete cause.
3. **Fork: defect or taste.**
   - **Defect** (text on the face, a cut that clips a word, audio that never applied, a caption in the icon rail, an exposed edge) → fix that ONE thing with the narrowest write. Everything else stays.
   - **Taste** (different music, more B-roll than the cap, a different hook angle) → it is their free 20% in the Riverside editor, OR one bounded change you describe before doing it.
4. **Undo is cheap here.** `restore_audio_cleanup` reverses fillers, pauses, or smart mutes in one call. A cut can be restored by range. A card or clip is deleted by id. Say *"I can roll that back"* and mean it.
5. **Re-save once**, quality-check the changed part, deliver as the next version.
6. **Learn it.** A preference that will recur (caption size, punch-in strength, music on or off, how starts and ends should feel) is saved to `~/realtor-brain/editor/config.json` (and the Brain is pushed) so the next video starts that way.
7. **Cap at two rounds per video.** After two, walk them through the manual tweak in Riverside. It protects their time and the relationship.

## Words that help

- "What's the first moment it felt off? Even a rough timestamp helps."
- "I can make that change. Here's what it will and won't affect."
- "That one's a taste call — here's how to nudge it yourself in 20 seconds, or I can do it."
