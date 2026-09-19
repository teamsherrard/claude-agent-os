---
name: riverside-quick
description: One small fix on a video in Riverside, done in a call or two — not a full edit. For when the agent wants just ONE thing: "just add captions", "just clean up the audio", "just make this vertical", "just trim the start", "just add my CTA", "add chapters", "add captions to this and that's it". Runs the single Riverside operation the job needs, verifies it landed, frame-checks it where possible, and hands it back. If they actually want the whole thing polished, it says so and routes to the full edit skill. Trigger on any request that names ONE specific fix, or that contains "just", "only", "quick", or "that's it" alongside a video task. Usually reached through riverside-navigator.
---

# Quick fix — one job, one or two calls

The agent asked for **one thing**. Do that one thing well and get out. Running a full edit for it would spend their time on work they didn't ask for.

Read `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`. Open the one reference the job needs — not the whole library. Tool shapes: `${CLAUDE_PLUGIN_ROOT}/shared/riverside-playbooks.md`.

## First: is this actually a quick fix?

**Yes → stay here** if they named ONE thing: captions, audio, vertical, a trim, the CTA, the grade, one card, chapters, the logo, music.

**No → hand off** if they want several things, or "make it good", or a full polish: *"That's more of a full edit — want me to do the whole thing properly? It'll look much better."* → `riverside-shortform` / `riverside-longform` / `riverside-listing`.

**Mid-way through a stopped edit** ("finish my video") → the resume path in `riverside-navigator`, not this skill.

## The jobs (one operation each, plus the read before it)

| They say | You do | Time |
|---|---|---|
| "just add captions" | `set_captions` karaoke per `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md` — big, y≈0.84, brand accent, widthRatio 0.8. Spelling check on the transcript first. | ~2 min |
| "just clean up the audio" | `set_magic_audio` on every speaker track, 0.55 (0.85 phone). Confirm it applied (not skipped). | ~1 min |
| "just make it vertical" | `update_aspect_ratio 9:16` (batch) → `apply_smart_layout FullScreen` → check headroom. **Only possible before any overlay exists** — if cards/B-roll are already on it, say so and offer to redo them. | ~2 min |
| "just trim the start/end" | Resolve the range with `resolve_transcript_selection(intent:"remove")` → **show the cut and get a yes** → `cut_time_ranges`. | ~2 min |
| "just take out the ums" | `remove_fillers Cut` (+ `remove_pauses 1500` if they also say dead air). One yes first. | ~1 min |
| "just add my CTA" | The CTA card from config (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`) — kit PNG via `insert_overlay`, or native boxed text moved to the format zone. | ~3 min |
| "just colour it / fix how it looks" | `set_color_correction` bare-minimum (`${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md`). | ~1 min |
| "just add a bit of b-roll" | Up to 3 cutaways via `riverside-broll`. | ~5 min |
| "just add chapters" | Walk the transcript (free) → `add_chapter` ops + the `00:00` list for the description. | ~3 min |
| "just put my logo on" | `apply_brand` (studio kit) or `insert_logo` top-right ~70%. | ~1 min |
| "just add music" | `get_stock_music` → `insert_audio` at -18 dB with fades (`${CLAUDE_PLUGIN_ROOT}/shared/music.md`). | ~2 min |

## How to run it

1. **Find the video.** `platform_list_recordings` (ready, not uploading) → the existing edit if there is one (`platform_get_project`), else `create_edit_from_recording` (or the gated fallback). Read the aligned transcript or a timeline window → `revision`.
2. **Quote it in one line and go.** *"Adding captions — two minutes."* No interview. If it's destructive (a trim / fillers), show what's coming out and get the yes.
3. **The operation**, with `expectedRevision`. Don't drift into fixing other things you notice — mention them at the end.
4. **Verify** — `compare_revisions` or a timeline read; frame-check the thing you changed on a reachable rung (`${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md`); the blockers in `${CLAUDE_PLUGIN_ROOT}/shared/final-check.md` that apply to *this* job, not the whole gate.
5. **Export once at 1080p** if they want the file; otherwise leave it saved in Riverside (many quick fixes are "fix it and I'll keep working in the editor").
6. **Hand back as a review draft** with the one-line what-changed and the 80/20 note.

## The rules that still apply

Even on a one-call job: **never over the face** · captions big and below the face · cards in the format zone, text contained · read before write, `expectedRevision` always · publish only on their yes · never blind-retry.

## Say what you noticed — don't silently fix it

If you spot something else worth doing (no captions, flat audio, no CTA), **say it once at the end and let them choose**:

> *"Done — captions are on. I also noticed there's no call-to-action at the end and the audio's a bit roomy. Want me to sort either of those, or leave it here?"*

That's how a quick fix turns into a full edit **when the agent wants it** — never by surprise.
