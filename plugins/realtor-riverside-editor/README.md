# The AI Editing Studio — Riverside engine (Plugin 10)

A full-time video editor inside the agent's Claude. They record, say "edit my video," and a **25-skill editing team** takes it from raw footage to a published post — directed, cut, polished, repurposed, and shipped — on the agent's own Riverside account, with no per-edit AI credits.

**Claude edits · Riverside renders · the agent approves.**

## The five stages, 25 skills

| Stage | Skill | What it does |
|---|---|---|
| **1. DIRECT** | `studio-direction` — Creative Direction | The five-line edit brief before anything changes |
| | `studio-record` — Record Coach | Script loaded, session set up, the 60-second frame / light / sound check |
| | `studio-transcript` — Transcript Read | The free first look: repeated takes, dead air, the hook, the section map, the time quote |
| **2. CUT** | `studio-fluff` — Remove the Fluff | Fillers, pauses, false starts, repeated takes — shown first, then cut |
| | `studio-hook` — Hook Finder | Finds the strongest opening line and opens on it |
| | `studio-interview` — Interview Edit | Speaker-aware layouts, muted crosstalk, a name strip per person |
| **3. POLISH** | `studio-audio` — Audio Enhance | Studio-quality voice at the right strength, confirmed applied |
| | `studio-color` — Color and Look | Subtle, flattering correction; natural skin |
| | `studio-captions` — Captions | Word-by-word brand captions on reels; off on long-form |
| | `studio-music` — Music | A licensed, mood-matched bed under the voice |
| | `studio-broll` — B-roll | Footage on the exact words, own footage first |
| | `studio-library` — B-roll Library | The agent's footage tagged once, reused forever |
| | `studio-graphics` — Brand Graphics | Places the designed Video Brand Kit, off the face |
| | `studio-energy` — Energy | Gentle punch-ins and animated entrances |
| **4. REPURPOSE** | `studio-repurpose` — Short-Form Repurpose | Scores every moment, cuts the best into distinct reels |
| | `studio-batch` — Weekly Batch | One recording in, a long-form plus reels out |
| | `studio-podcast` — Podcast | Clean audio for Spotify and Apple |
| **5. SHIP** | `studio-check` — Quality Check | Pass / fail with frame evidence before the agent sees it |
| | `studio-review` — Review and Revise | Finds the one real cause, fixes only that, remembers the preference |
| | `studio-publish` — Publish | Posts or schedules on the agent's yes, using the owning plugins' copy |
| **FRONT DOORS** | `studio-setup` · `studio-navigator` · `studio-longform` · `studio-reel` · `studio-listing` | Onboarding, the plain-English translator and resume, and the three full recipes |

## How it is built — two layers, one source of truth per craft

- **Craft skills** do ONE job. Each is a thin front door over exactly one reference file in `shared/` and runs the same seven steps (`shared/craft-contract.md`): find the video, read before writing, say it in a line, do the job, verify with evidence, log it, hand back and mention what else it noticed.
- **Director skills** (Long-Form Edit, Reel Edit, Listing Edit, Weekly Batch) contain no craft instructions. They open the craft references in order.

So a big skill list does not mean duplicated rules or skills that fight each other: every rule lives in one file.

## One owner per output (`shared/boundaries.md`)

The Studio edits video. It does **not** write marketing. Titles, descriptions, chapter names, tags, and hashtags belong to the **YouTube System**; reel captions and the posting calendar to the **Short-Form System**; designed cards, icons, and thumbnails to **Claude Design**; listing facts to **Listing Launch**; market numbers to the **Market System**. The Studio hands them what they need (the section map, hook lines, still frames), places what they hand back, and enforces one posting route per post so nothing is double-posted.

## What it runs on

**Riverside Grow or higher** (the Riverside connection to Claude is not available on Free or Pro). Editing, AI cleanup, captions, and exports are not metered per edit. Best in Code mode in the Claude desktop app. Google Drive is optional (own-footage library, Brain sync, the Video Brand Kit folder). Settings live in `~/realtor-brain/editor/config.json`, shared with the Descript editor (Plugin 6) so brand and CTA are set once.

## What it cannot do (and says so)

- Transitions, a sound-effect library, and motion graphics are not reachable from the connector. Energy is hard-cut punch-ins (zoomed scenes) and animated card entrances; richer motion is the agent's manual 20% or a designed animated card from Claude Design.
- A native text card cannot take a brand-coloured panel; the Video Brand Kit PNGs are the premium path.
- The main recording must be recorded in or uploaded to Riverside (no import by link). Media uploads through the connector are for B-roll, music, and kit assets, 500 MB each.
- It cannot watch playback. It verifies with timeline reads, revision diffs, and frames (`shared/frame-qa.md`); audio feel and flow are the agent's call.
- It cannot unpublish. Publishing is gated behind a plain summary and an explicit yes.

## Status

**v0.2.2 — branded kit cards proven on a real edit (PNG panels, icon, animated entrances, words centred inside the panels) and punch-ins rebuilt as zoomed scenes after the keyframe route was found to be a silent no-op.** Earlier, v0.2.1: restructured into the two-layer Studio (25 skills), independently audited (40+ fixes), and the graphics route proven:** transparent PNGs keep their alpha, the connector's in and out animations work on them, transparent video does not survive the transcode, and hand-written mid-clip keyframes on an overlay hang the editor (now banned). Live-tested on three real edits (a 12-minute long-form, a raw 70-second intro as long-form, and the same intro as a 46-second 9:16 reel): cuts, audio, colour, captions, B-roll, music, cards, lower third, punch-ins, frame checks in Chrome, and 1080p exports all verified; `create_edit_from_recording` confirmed not gated. Not yet run live: Setup, the brand-kit registration, Publish (no channels connected on the test account), Interview, Podcast and the Library index. Build spec: `docs/riverside-studio-spec.md` in the repository (not shipped inside the installed plugin).
