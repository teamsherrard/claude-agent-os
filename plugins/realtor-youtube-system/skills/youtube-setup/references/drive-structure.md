# Drive Provisioning — Spec (minimal, briefing-driven)

The realtor's Drive is just a clean **content library** — NO tracker spreadsheets. The system is
driven by the weekly briefing + on-demand chat, and reads state live. It does NOT maintain an Idea
Bank, Content Map, Content Calendar, Keyword Map, or Performance Log. (Agents found them useless and
they're redundant with data the system can read live.)

---

## Folder structure (this is the whole thing)
```
[Agent Name] — YouTube System/
├── Videos/                              (by MONTH → one folder per VIDEO)
│     └── 2026-06 · June/                (month folder, created as needed)
│           └── [YYYY-MM-DD · Video Title]/   (created when the video is actually made)
│                 ├── Script             (Doc — Script Studio)
│                 ├── SEO Package        (Doc — SEO Engine)
│                 ├── Lead Magnet Map    (Doc — Lead Engine)
│                 └── Repurposing Pack   (Doc — Repurposing Engine)
└── Setup/
      └── YouTube Layer                  (Doc — channel, goal, cadence, pillars, voice; references AI Brain)
```
No spreadsheets. Two folders.

## Where state lives (the system is essentially stateless)
Never ask the realtor to maintain a tracker. Derive everything live:
- "What's been made / published?"  → the Videos folders + the agent's YouTube channel
- "What performed?"                → her YouTube Studio export (V1) / live API later
- "What to film next?"             → generated fresh each week from the AI Brain + research + analytics
- Content pillars                  → stored in the YouTube Layer (Setup); keep ideas strategic, invisibly
- Scheduling (film/post dates)     → real Google Calendar events, NOT a spreadsheet

## The interface is chat, not a spreadsheet
The realtor experiences the system through on-demand chat ("what should I film?", "make this video",
"how did my last video do?") — one chat per video — plus an optional Monday Kickoff email if they want one.
Finished content lands in the Videos folders. There is nothing to maintain.

---

## How to create folders/docs (connector notes)
- Folder: create_file with `mimeType: application/vnd.google-apps.folder`; capture the `id` for `parentId`.
- Doc:    create_file with `contentMimeType: text/plain` + `textContent`.
- Create a per-video folder ONLY when that video is being made. Don't pre-create empty folders.

## At setup
1. Create the top folder, a `Videos/` folder, and a `Setup/` folder.
2. Write the **YouTube Layer** doc into Setup (channel, goal, cadence, pillars derived from the AI
   Brain, voice notes).
3. Do NOT create any tracker spreadsheets.
4. Generate the first set of ranked video ideas (from the AI Brain + a quick city/niche scan) and
   present them to the agent **directly in chat / the first briefing** — not as a stored file.
5. Share the folder link.
