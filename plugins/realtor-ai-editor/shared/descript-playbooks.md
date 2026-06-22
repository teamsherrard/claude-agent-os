# Descript playbooks (tested recipes)

Descript does the editing; Claude issues these instructions and verifies. General habits apply to every playbook.

## General habits (always)

- **Work on a copy** of the composition, never the original.
- **Seed proper nouns first** (name, brokerage, city, streets) or captions misspell them.
- **One instruction at a time, verify after each** — it's more reliable than one mega-instruction, and lets you catch overreach (e.g. it deleting an intro you wanted to keep).
- **Transcribe once.** Import auto-transcribes; never re-transcribe a cut.
- **Publish is gated.** Never publish without explicit approval (leave the connector's Publish permission on "needs approval").
- **"Unable to reach Descript" usually still completed** — re-check the project before retrying so you don't run a paid pass twice.

## Playbook A — long-form cleanup

1. Import → auto-transcribe.
2. Remove filler words (conservative). Spot-check first 40s.
3. Remove silences > ~1.5s (avoid harsh cuts).
4. Cut false starts / bad takes — review before applying; restore good bits.
5. Studio Sound (~80%).
6. B-roll (via `editor-broll`), then sparse emphasis + chapters. No captions by default.
7. Export web review link → on approval, export final + title/description.

## Playbook B — pull shorts from a long video

1. Read transcript; pick stand-alone moments (hook → idea → payoff/CTA).
2. Make a 9:16 composition per moment.
3. Reframe (face centred), cut hard, hook in first ~1.5s.
4. Karaoke captions on (brand style).
5. B-roll on the words; punch-ins; ducked music.
6. Export the set.

## Playbook C — build from a prompt (optional)

Underlord can assemble a project from a script (with AI voice + stock). Use sparingly; label AI-voiced drafts and encourage the agent to re-record in their own voice. Not a default path for v1.
