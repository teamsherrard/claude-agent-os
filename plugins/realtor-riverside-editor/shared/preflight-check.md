# The pre-flight check — read the video BEFORE you change anything

**This runs first on EVERY edit, and it changes nothing.** Reading the transcript is free and safe; cutting is not. On a real 15-minute client video (the Descript live run) this step found **three duplicate takes and ~2 minutes of dead air** before a single change was made — it cut 3:21 off the runtime and made the plan accurate. Same step, same payoff here.

It does three jobs at once: it makes the edit **better** (you plan instead of react), **faster** (you get it right the first time instead of over-correcting), and it **removes the agent's #1 anxiety** — not knowing what's about to happen to their video, or how long it'll take.

## What to do (all read-only)

1. **Find the recording and confirm it's ready** — `platform_list_recordings`: its `status` must not be `uploading` / processing. If it is, say *"still uploading — give it a few minutes"* and stop here.
2. **Create (or find) the working edit** — `create_edit_from_recording` (or, if gated, the edit the agent made) — and `read_aligned_transcript(editId)`. Keep the `revision`.
3. **Read the whole thing** — the compact rows (speaker, text, playable start/end, filler/pause counts, mid-sentence flags). For the plan you only need the rows; zoom to words later, when cutting.
4. **Find the problems and the plan:**
   - **Duplicate takes** — the same point delivered twice. Very common; agents re-record a section and keep rolling. Note which take is the keeper (usually the later, more complete one) and quote the distinguishing line of each — those quotes become the `boundary_range` anchors.
   - **Dead air / long gaps** — `pauseCount` on the rows, and gaps between `playableEndMs` → next `playableStartMs`.
   - **The hook** — is the first real line already a hook, or is there settling-in to cut? Name the exact line you'll open on.
   - **Section changes** — chapters (long-form), the emphasis pop-up spots, and where the B-roll goes.
   - **Spelling** — the agent's name, brokerage, city (and for listings the address + community) as they appear in the transcript. Captions render from this transcript, and there's no correction tool on the connector: if something's misspelled, the agent fixes it in the Riverside transcript panel before captions (a one-minute job) — flag it now.
   - **Compliance** — read `identity/compliance.md` now, before any on-screen text is planned (the three-state rule in `final-check.md`).
   - **Readiness** — if the aligned transcript comes back `FAILED_PRECONDITION` / `transcript_load_failed`, the upload is still processing → wait, don't retry in a loop.
5. **Estimate the time.** No credits to quote. Say roughly how long: a reel ~15–20 min; a 10–20 min long-form ~45–60 min including the render. If they're short on time, offer the essentials-only version (clean cut + audio + grade + captions, skipping B-roll and cards).

## Then say it in ONE short paragraph and get the go-ahead

Plain language, no jargon, numbers included. The shape:

> *"Okay — it's 15:22. I found 3 spots where you recorded the same section twice, plus about 2 minutes of dead air, so I'd cut it to around 12 minutes. Your hook is already strong right at the start, nothing to trim there. I count 9 natural chapters. Full edit is about an hour including the save. Want me to go?"*

**That single yes is the gate for the whole edit** — it covers the destructive cuts listed, and everything after it runs without stopping to re-ask.

## Rules

- **Never skip it to "save time."** It costs nothing and it is the cheapest possible place to catch a problem.
- **Always give a number** — minutes cut, minutes to finish. Vague makes agents anxious; specific makes them relaxed.
- **If the video has a real problem, say so now** — audio a grade can't fix, a hook that never lands, only 2 usable clips when they asked for 3.
- **Snapshot rule:** if the recording exists ONLY in Riverside (recorded there, never downloaded) — `clone_edit` once before pass 1 and say *"I saved a copy of your original first."* If it was uploaded from a file they still have, skip the clone (the file is the backup).
