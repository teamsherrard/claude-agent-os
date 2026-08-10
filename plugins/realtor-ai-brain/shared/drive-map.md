# The Drive Map — the agent's whole workspace (Social Agent OS)

The single source of truth for how the agent's Google Drive is organized, and the rule **every plugin** follows:

> **The agent's `Social Agent OS` folder is their whole workspace — read across ALL of it, not just the AI Brain
> files.** Anything in there — the Brain the system builds, brand assets, past content, a marketing PDF they
> uploaded, footage — is fair game for the system to read and use. The "brain" is the *whole* folder, not one file.

## The one guardrail — the WORKSPACE, not the whole Drive account
"Read the whole Drive" means the agent's **workspace folder** — **NOT** their entire Google Drive
(which holds tax docs, personal files, unrelated stuff). **Scope every read to inside the workspace folder.** Never
crawl the agent's full Drive account — that's noisy and a privacy problem.

## Locating the workspace — RENAME-PROOF (the agent will rename it)
Agents will want to name this folder after their business — "Realty Group OS", "The Jenkins Group Hub", whatever.
**That's encouraged — it's their branded home base.** So the system must **NEVER depend on the folder being called
"Social Agent OS."** `Social Agent OS` is only the *default label*, never an identifier. Locate it robustly:
- **Google Drive folder IDs never change on rename.** At setup, capture the folder's **ID + shareable link** and
  store them in `config.md` (and inject at session start). Do all reads/writes **by folder ID** — a rename changes
  the display name, not the ID, so nothing breaks.
- **Marker fallback.** The system drops a hidden marker file in the workspace (`_workspace.md` — it records the
  chosen name, folder ID, and link). If the ID ever fails (moved, new device, cleared cache), **search the agent's
  Drive for that marker file and use its parent folder** — whatever the folder is now named — then re-cache the ID.
- **At setup, let them name it** (default "Social Agent OS", or their own business name). Record name + ID + link.
- **Never string-match "Social Agent OS"** anywhere in a skill. Find the workspace by ID, then marker — never by name.

## The structure (the plugin builds this automatically, once)
```
Social Agent OS/                 ← the master workspace folder (created + named by the system)
├── 01 · AI Brain/               ← what the AI knows about the agent + their key documents
│   ├── Your AI Brain.docx        ← the polished, readable master document (the agent opens THIS)
│   ├── Your Business Plan.docx   ← the 90-day plan (agent opens this)
│   └── _engine/                  ← the raw brain files that run everything (agent never opens these)
│       └── identity/  memory/  brain.md  config.md
├── 02 · Brand/                  ← logo, headshot, colours, fonts, brand kit
├── 03 · Content/                ← scripts, videos, posts + market updates, guides, lead magnets
│   └── To Film/   Published/
└── 04 · Drop Zone/              ← the agent drops ANYTHING here for the AI to use
```

## How plugins use it
- **Read across the whole workspace, by relevance — not just `_engine`.** A content skill can pull a past
  marketing file from `03 · Content` or something dropped in `04 · Drop Zone`; the editor reads footage from
  `03 · Content`; graphics read the logo from `02 · Brand`. The Brain's `_engine` is the structured *core*, but
  it is not the only thing the system can see.
- **The engine stays the working truth.** Skills still read/write the structured brain files (identity, memory)
  exactly as before — locally in `~/realtor-brain/`, synced to `01 · AI Brain/_engine/`. That behaviour does not change.
- **Where deliverables save:**
  - Master **AI Brain doc** + **Business Plan** → `01 · AI Brain/` (top level, visible).
  - **Content deliverables** (market updates, guides, lead magnets, scripts, listing content) → `03 · Content/`.
  - **Brand assets** → `02 · Brand/`. **Raw material the agent hands over** → `04 · Drop Zone/`.
- **Hand the agent the link.** At the end of setup, give them the **direct link** to their `Social Agent OS`
  folder and tell them to **bookmark it** — that's their home base.

## Presentation rules (never make the agent feel technical)
- **Agent-friendly names only** on anything they see — never `identity / memory / exports` in front of them.
- **Polished docs visible, engine hidden** — the agent opens `01 · AI Brain` and sees *their documents*, not `.md` files.
- **One drop zone** (the forever-rule): anything new lands in `04 · Drop Zone`; the system reads it, uses it, files it.
