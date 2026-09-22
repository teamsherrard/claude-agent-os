# The craft contract — how every single-job skill runs

Every craft skill in the Studio (Audio Enhance, Color and Look, Music, Captions, Remove the Fluff, and the rest) does ONE job, owns ONE reference file, and runs the same seven steps. The director skills (Long-Form Edit, Reel Edit, Listing Edit, Weekly Batch) do not repeat any of this — they open the same reference files in order. One source of truth per craft.

## The seven steps

1. **Find the video.** `platform_list_recordings` (status must not be `uploading`) → the existing edit if there is one (`platform_get_project` lists recordings + edits), otherwise `create_edit_from_recording(sessionId, projectId, title)` (live-tested: not gated on Grow). ONE working edit per video — never a second "to try something."
2. **Read before you write.** `read_aligned_transcript` or a narrow `read_timeline_in_range` → keep the `revision`. Check the checkpoint log (`~/realtor-brain/editor/jobs/rs-<editId>.md`): if this craft is already logged, say so in one line and stop unless they want it changed.
3. **Say it in one line and go.** *"Cleaning up your audio — about a minute."* No interview. If the job is destructive (any cut), show what is coming out and get the yes first — the hard gate in `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`.
4. **Open your ONE reference and do the job** — the exact tool calls live there, not here. Every write carries `expectedRevision`. On a `CONFLICT`, follow the one rule in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`: a harmless editor-tab re-save gets one retry; a real hand edit means stop and ask.
5. **Verify with evidence.** `compare_revisions(startRev, endRev)` for what changed; a frame from the ladder in `${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md` for anything visual. Never say "done" on a guess.
6. **Log it.** One line in the checkpoint log: `<craft> · done · rev <n>`.
7. **Hand back, and say what else you noticed — once.** One plain line on what changed. If you spotted something outside your job (no captions, no CTA, roomy audio), name it and let them choose: *"Audio's clean. I also noticed there's no call-to-action at the end — want that too, or leave it here?"* Never silently do another skill's job.

## What a craft skill never does

- Another craft's work "while it's in there."
- Anything another plugin owns — see `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`. No titles, descriptions, chapter names, tags, hashtags, post captions, or thumbnails. Ever.
- A second export. ONE render per version, and only when they want the file.
- A publish. That is Publish's job, behind its own gate.

## When they actually want the whole thing

If the ask is several crafts at once, or "make it good," say it plainly and hand to the director: *"That's a full edit — want me to do the whole thing properly? It'll look much better."* → `studio-longform` / `studio-reel` / `studio-listing` / `studio-batch`.

Always follow `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and talk like their editor (`${CLAUDE_PLUGIN_ROOT}/shared/plain-language.md`).
