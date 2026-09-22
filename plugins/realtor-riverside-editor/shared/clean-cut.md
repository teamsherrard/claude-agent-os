# The clean cut — remove the fluff (the single biggest quality lift)

Filler words, dead air, false starts, repeated takes, tangents. This is the only destructive craft, so it is the only one with a hard review gate.

## Find it (free, read-only)

From `read_aligned_transcript` compact rows:
- **Repeated takes** — the same point delivered twice. Agents re-record a section and keep rolling. The keeper is usually the later, complete one. Quote the first and last words of the take to REMOVE; those quotes become the resolver anchors.
- **False starts** — a sentence begun, abandoned, restarted. Riverside's transcript labels many as disfluency even when the row's filler count says zero (live-tested: a 2.1-second false start before the hook was caught this way).
- **Dead air** — gaps between a row's end and the next row's start; `pauseCount` on the rows.
- **Tangents** — a passage that does not serve the brief's takeaway. Propose, never assume: tangents are often the personality.
- **Housekeeping** — "two quick things before we start," link reminders, sponsor reads. Stays in a YouTube video; comes out of a reel.

## Show it, get one yes (the hard gate)

> *"I'd take out 3 spots where you said the same section twice, the 2 seconds before your first line, and about 90 seconds of dead air. That takes it from 15:22 to about 12 minutes. Go?"*

One yes covers the list. Anything not on the list needs its own yes.

## Do it (in this order)

1. **Editorial cuts first** — `resolve_transcript_selection(intent:"remove", selections:[{type:"boundary_range", start:{type:"text", text:"<first words>"}, end:{type:"text", text:"<last words>"}}], revision)`. Require `readyToApply: true`; a warning means disambiguate (add `occurrence`), never guess timestamps. Execute the returned `cut_time_ranges` payload; if the revision moved since the resolve, pass the current `expectedRevision` and leave the ranges untouched.
2. **Filler words** — `remove_fillers(method:"Cut")`. If a fast talker reads choppy afterwards, `restore_audio_cleanup(cleanup:"fillers")` and re-run with `"Smart"`. No audio is ever synthesised on this engine.
3. **Pauses** — `remove_pauses(thresholdMs)`: **1500** for long-form (avoid harsh cuts), **1000** for a reel. This also trims the silent lead-in and tail.
4. **Verify** — `compare_revisions`: each cut is listed with the feature that made it; `durationBeforeMs → durationAfterMs` should match what you quoted. Re-read the first 40 seconds and the last row: opens on the first real line, ends on a complete thought.

## Calibration

On a clean, scripted take expect 3 to 8% to come out. On a rambling one, 15 to 25%. If the cut set feels choppy, thin the shortest and most marginal cuts first. Err toward fewer cuts when quality is uncertain. Never cut into the hook or the call-to-action. Protect question-and-answer pairs, setup-and-payoff, and any caveat that makes a claim accurate.

## Safety

If the recording exists only in Riverside (recorded there, never downloaded), `clone_edit` once before the first destructive write and say *"I saved a copy of your original first."* The raw recording itself is never modified by any edit.
