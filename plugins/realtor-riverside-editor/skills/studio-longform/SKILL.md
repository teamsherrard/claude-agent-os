---
name: studio-longform
description: Long-Form Edit for the AI Editing Studio — the full line for a 16:9 YouTube video, run from one sentence. Directs the five stages in order by opening each craft's reference (creative direction, transcript read, remove the fluff, hook, audio enhance, color, B-roll, energy, brand graphics, quality check), verifies every pass against the timeline, saves one 1080p file, and hands back a review draft plus the section map the YouTube System needs to name chapters. Never writes titles, descriptions, chapter names, or tags — the YouTube System owns those. Trigger on "edit my YouTube video", "edit my long video", "edit my long-form", "clean up my market update", "full edit on this". Resuming a stopped edit ("finish my video") is entered from studio-navigator, which finds the log and hands back here in resume mode. For a guest or two-person recording, hand to studio-interview. Usually reached through studio-navigator.
---

# Long-Form Edit — the director

You run the line; the crafts do the work. **Read up front (only these):** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`, and the pass plan in `${CLAUDE_PLUGIN_ROOT}/shared/riverside-playbooks.md` (Playbook A — tool shapes, time axes, the ≤6-pass plan). **Open each craft's reference at the step that uses it, not before.** Compliance is read before any on-screen word (the three-state rule in `${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`: missing or an unfilled placeholder → no claim cards, never a stamped placeholder, deliver safely, nudge once).

## The line (each step = one craft reference; verify with a revision diff, log, then move on)

| # | Stage | Do | Reference |
|---|---|---|---|
| 0 | — | Find the recording (ready, not uploading), ONE working edit, check the checkpoint log (resume if it exists) | `craft-contract.md` |
| 1 | DIRECT | The edit brief, five lines | `creative-direction.md` |
| 2 | DIRECT | Transcript read → ONE paragraph with numbers → **the single yes that gates the edit** | `preflight-check.md` |
| 3 | CUT | Open on the hook | `hook.md` |
| 4 | CUT | Remove the fluff: editorial cuts, fillers, pauses at 1500 ms | `clean-cut.md` |
| 5 | POLISH | Audio enhance, every speaker track | `audio.md` |
| 6 | POLISH | Color and look | `footage-look.md` |
| 7 | POLISH | **Captions OFF** (long-form rule; an edit made in Riverside can arrive with them on) | `caption-style.md` |
| 8 | POLISH | B-roll, about one per 45–60 seconds, own footage first, all full-cover | `broll-ladder.md` (+ `footage-intake.md`) |
| 9 | POLISH | Energy: 2–3 punch-ins on the brief's featured moments | `effects-menu.md` |
| 10 | POLISH | Brand graphics: hook card, then the name strip once the hook card has cleared (same zone, never both at once), a pop-up every 2–3 minutes, the CTA — all in the LOWER THIRD on 16:9 | `graphics-style.md`, `cta-pack.md` |
| 11 | SHIP | ONE export at 1080p, then the quality check on it | `final-check.md`, `frame-qa.md` |

Music is not in the long-form line. Offer it at delivery (`music.md`).

## Sections, chapters, and SEO — the boundary

After the cut is locked, write the **section map**: each section's start time on the FINAL cut in `00:00` form with a plain note of what is said there (first at `00:00`, at least 3, at least 10 seconds apart). Hand it to the YouTube System: *"Say 'SEO for this' and your title, description, and chapters get written properly."* When the SEO Package exists, write ITS chapter titles onto the timeline as native markers (`add_chapter`; a Riverside-made edit may already hold AI chapters — move or replace them so there is one set). **You never name a chapter, and you never draft a title, description, tags, or hashtags** (`boundaries.md`).

## Deliver (the review-draft hand-back, `final-check.md` Gate 3)

One message: it is a review draft + the edit link; the spec it hit in one or two lines; the 2–3 things only they can judge (audio feel, flow, anything near the face in motion); the 80/20 line. Then, one line each: the section map is ready for the YouTube System · want a quiet music bed? · want it posted or scheduled (`studio-publish`)? · want reels cut from it (`studio-repurpose`)?

## Resume

`~/realtor-brain/editor/jobs/rs-<editId>.md`, one line per landed step: `<step> · done · rev <n>`. At the start: log exists → one plain line, run only what is missing. Log missing → `compare_revisions("1", head)` plus a timeline read tell the truth; state it, one-word confirm, rebuild the log. On a `CONFLICT`, follow the one rule in `house-rules.md`. "Still processing" → wait and say so.

## Discipline

Every step is a craft with one owner file; if you catch yourself writing craft detail here, it belongs there. At most 6 passes of writes, each diff-verified; `expectedRevision` on every write; ONE export. The caps hold (`cost-discipline.md`). No eye-contact correction, no background tricks, no AI-generated footage.
