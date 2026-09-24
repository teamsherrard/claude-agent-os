# Interview edit — two or more people (Riverside's home turf)

Riverside records each person on their own track. That makes multi-person edits cleaner here than anywhere else: the layout can follow whoever is speaking, and one person's mic never bleeds over the other.

## The recipe

1. **Transcript read** — per speaker. Note who asks and who answers; never cut a question from its answer.
2. **Clean cut** — `clean-cut.md`, with `includeNonSpeakers: false`. Crosstalk is muted, never cut, so nobody's sentence gets clipped.
3. **Smart mutes** — `apply_smart_mutes(editId)`: silences each track while that person is not talking (keyboard noise, breathing, the "mm-hm"s). Undo with `restore_audio_cleanup(cleanup:"smart_mutes")` if reactions matter to the feel — laughter is protected material.
4. **Audio** — `set_magic_audio` on EVERY speaker track (guests are usually on worse mics: 0.85 for them, 0.70 for the host on a good mic).
5. **Layout** — `apply_smart_layout(style:"Smart")`: active speaker full screen, automatic side-by-side when both talk, a camera switch if one person holds the floor past ~20 seconds. Leave the advanced timing alone unless asked. Alternatives: `SplitScreen` (both always visible), `PictureInPicture` (host large, guest inset), `Grid` (static).
6. **Colour** — `set_color_correction` per speaker track with the visible-but-natural values (`footage-look.md`); match the two looks toward each other rather than grading each to taste.
7. **Name strips** — one `add_lower_third` per person at their first appearance (then moved off the face — it inserts centred). The kit's per-member lower thirds when registered.
8. **Sections** — the section map and markers (`sections.md`).
8b. **Then the rest of the long-form line** — captions OFF, B-roll (bright, on the words), energy (zooms sized to the beats on whoever is speaking), the -22 dB bed with section stingers, graphics, the quality check, ONE export (`studio-longform` steps 7–11).
9. **Reels from it** — the guest's best 30 to 45 seconds is usually the strongest clip; `repurpose.md`. On 9:16 use the portrait layouts (`list_layouts(aspectRatio:"9:16", participantCount:2)`): stacked top and bottom reads best on a phone.

## Guest courtesy

Send the guest their clips. Get their okay before publishing anything that features them. Spell their name and company exactly as they wrote it.
