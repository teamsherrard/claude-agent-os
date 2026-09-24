# Rescue cut — the recording that went badly

Some recordings are not a clean take with a few fillers. They are forty minutes of an agent circling the same five points, restarting, apologising to the camera, losing the thread and finding it again. A normal clean cut makes those worse: a tight version of a ramble is still a ramble. This craft finds the usable video inside the bad one, or says honestly that it is not there.

It is the clean cut (`clean-cut.md`) with a harder brief and a different first step, so read that file too: every tool call, the resolver, the order of operations and the safety snapshot are the same.

## Step 1 — decide if it is a rescue (free)

From the compact transcript, count the symptoms: the same point made 3+ times · false starts on more than a fifth of the rows · long tangents (over 45 s off the subject) · the agent talking to themselves ("wait, let me start that again", "where was I") · a hook that never arrives in the first two minutes. Two or more, and it is a rescue. Say so, warmly and plainly, before anything else:

> *"This one's a rebuild rather than a trim. You make five points in here and you make each of them two or three times. I can pull the best pass of each and build a tight 6-minute video out of it, or you re-record with these five points as your outline. Want me to try the rescue first? It's free to find out."*

Never make them feel bad about the take. Everyone has these.

## Step 2 — the point list (free)

List the distinct points the agent was trying to make, in the order that makes sense to a viewer (which may not be the order they were said). Under each point, every pass at it with its time range and one line on why it is the keeper or not: *complete*, *clearest*, *has the number*, *ends on a full thought*, *no apology in it*. The keeper is the pass that is complete and clearest, usually the LAST one. Cap the list at 8 points; more than that and it is two videos.

## Step 3 — the honest call

Judge the keepers together, then say one of three things:

- **Rescue works** — every point has a complete, clear pass, and they connect. Quote the new length: *"6 minutes from 38, every point kept once."*
- **Rescue with a patch** — one or two points have no clean pass. Offer the patch: *"Point 3 never lands cleanly. Record just that one line, 30 seconds, and I'll drop it in."* The patch is a new take the agent records; it comes in one of two ways: they drop the clip into Riverside's media panel and it goes in as a scene (`insert_media_as_scene`, which takes a Your Media asset id and a PLAYABLE `startMs`), or they place it themselves in the editor at the marker you leave. Do not stitch half sentences together to fake it.
- **Re-record** — most points have no clean pass, or the thread is not recoverable. Say it kindly and give them the outline: the point list from step 2 is their script for the retake, and the Record Coach (`studio-record`) sets them up in a minute. This is the most useful thing the skill can say, and it costs nothing.

Nothing is cut until they choose. This is the hard gate, same as every destructive cut.

## Step 4 — the cut (only on their yes)

1. Snapshot first, always: `clone_edit` of the working edit, titled `<title> — original before rescue`. The raw recording is never modified, but the agent should hear that a copy exists.
2. The Studio does not rearrange speech (the clip-move ops exist, but a re-ordered talking head needs a human ear on every join), so keep the points in their recorded order unless a point's keeper is the only pass and it sits in the wrong place; then say so and keep it where it is. A slightly odd order beats a broken cut.
3. Build the cut list as the complement of the keepers: everything between the end of one keeper and the start of the next comes out. Resolve each removal with `resolve_transcript_selection(intent:"remove", boundary_range …)` anchored on the exact first and last words; require `readyToApply`. Apply in one `cut_time_ranges`.
4. Then the normal clean cut on what remains: `remove_fillers`, `remove_pauses 1500` (a rescued take is choppier than a clean one, so never go below 1500 on long-form).
5. Bridges: where two keepers meet mid-thought, the join will feel abrupt. Two tools fix it without new words: a B-roll cutaway over the join (`broll-ladder.md`, full-cover, 3 to 4 s) hides the jump, and a chapter-style pause (leave up to 0.8 s of the natural gap) lets the ear reset. Never fabricate a sentence to bridge.
6. Verify with `compare_revisions`: every removal is listed, the length matches your quote. Re-read the whole remaining transcript once, top to bottom, and check that each point is stated exactly once and every sentence is complete. If a point now appears twice, one more resolved cut; if a sentence is broken, widen the keeper by a phrase rather than trimming into it.

## Then hand back

Say what survived: *"Kept the best pass of all five points, 6:10 from 38:00, one cutaway over the join at 2:40 where you'd switched topics mid-sentence. The original is saved as a copy."* Then the usual offer: the rest of the edit (audio, colour, graphics) through `studio-longform`, which now runs on the rescued cut and skips the fluff step because it is logged.

Log: `rescue · done · rev <n> · <points> points, <before> → <after>` and, if they chose to re-record, `rescue · re-record advised · outline delivered`.
