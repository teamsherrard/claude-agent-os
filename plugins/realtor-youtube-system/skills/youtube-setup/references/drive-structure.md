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
No spreadsheets. Two folders. **This workspace lives INSIDE the agent's existing master Drive (the one
their AI Brain / realtor system already uses) — never an orphan folder elsewhere.** Record the top
folder's ID in the YouTube Layer so every skill saves to the same place.

## Naming convention (use these EXACT names — predictable, sortable, never ad-hoc)
- **Top workspace:** `{Agent Name} — YouTube System`
- **Month bucket:** `{YYYY-MM} · {Month}`  →  e.g. `2026-06 · June`
- **Video folder:** `{YYYY-MM-DD} · {Video Title}`  →  e.g. `2026-06-13 · BoC Holds Rates`
  (date = film/created date; Title Case; strip emojis and slashes from the title)
- **Docs inside a video folder — FIXED names:** `Script` · `SEO Package` · `Lead Magnet Map` · `Repurposing Pack`
- **Setup doc:** `YouTube Layer`
- A **monthly market report** is just a normal video (the agent records it): a `{date} · {Month} Market Update`
  video folder with its own `Script` + `SEO Package`.
Dates are ALWAYS `YYYY-MM-DD` so folders sort chronologically. Same name, same spot, every time.

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
- Doc:    create_file with `contentMimeType: text/plain` + `textContent` → lands as a clean native Google
  Doc. (ONLY text/plain converts; `.docx`/HTML uploads stay as raw files and can corrupt. So make it look
  good by STRUCTURING the text per house-rules §3: title + meta line, ALL-CAPS section headers with em-dash
  dividers, blank-line spacing, cues on their own lines, `•`/`—` bullets. Never save an unstructured wall.)
- Create a per-video folder ONLY when that video is being made. Don't pre-create empty folders.

## Saving content — resolve, never duplicate (this is what keeps Drive organized)
The system is stateless, so it RE-FINDS the structure every time instead of remembering it:
1. From the YouTube Layer, get the top-workspace folder ID (the anchor).
2. Find the month bucket inside `Videos/` by name; if missing, create it.
3. Find this video's folder by name inside the month; if missing, create it.
4. Save the doc into that folder under its FIXED name. Before creating, check the folder for a doc of
   that name — if it already exists (a re-run), save the new one as `{Name} — v2` (the connector can't
   overwrite) and tell the agent, so we never silently scatter duplicates.
5. Always confirm the location in plain words: *"Saved in June ▸ BoC Holds Rates ▸ Script."*
Every video's docs live together in that one video folder — nothing loose, nothing orphaned.

> Only CONTENT files are saved to Drive (Script, SEO Package, Lead Magnet Map, Repurposing Pack, YouTube
> Layer, market-report script). Live analysis — research brief, idea list, analytics read — stays in chat
> by design; it's regenerated fresh, never stored. That's the stateless model, not a gap.

## At setup
1. Locate the agent's existing master Drive workspace (their AI Brain / realtor-system folder) and create
   `{Agent Name} — YouTube System` INSIDE it (only fall back to Drive root if no master workspace exists
   yet), then a `Videos/` and a `Setup/` folder. **Record the top-workspace folder ID in the YouTube
   Layer** — it's the anchor every other skill uses to save in the right place.
2. Write the **YouTube Layer** doc into Setup (channel, goal, cadence, pillars derived from the AI
   Brain, voice notes).
3. Do NOT create any tracker spreadsheets.
4. Generate the first set of ranked video ideas (from the AI Brain + a quick city/niche scan) and
   present them to the agent **directly in chat / the first briefing** — not as a stored file.
5. Share the folder link.
