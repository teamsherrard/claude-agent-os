# Output Standard — where a monthly market update lives and how it's saved

Everything for one month lands in one Drive folder, named consistently, and formatted so it looks
genuinely good. When a skill says "save to Drive (output standard)," it means this.

Two non-negotiables: **(1) every piece for a month lives in that month's folder; (2) each doc is
clean and scannable — never a wall of text.**

---

## 1. Where it goes — the Drive folder structure

```
[Agent Name] — Market Updates/
└── 2026-07 · July 2026/                     (one month — created by the research skill)
      ├── Market Data — July 2026            (the researched numbers + sources; the source of truth)
      ├── Presentation — July 2026           (Slide Map · slides + talking points · design brief · email version)
      ├── Market Report PDF — July 2026      (the sendable doc · green-screen notes · send-it copy)
      ├── Short-Form Pack — July 2026
      ├── Instagram Pack — July 2026         (the 1:1 infographic + the carousel)
      ├── Distribution Pack — July 2026
      └── YouTube Script — July 2026         (only if the agent asked for the word-for-word script)
```

One folder per month, created by the **Market Research** skill and reused by every other skill.
Find-or-create; never duplicate a folder. Short pieces (a single caption) can stay in chat —
anything the agent will reuse, film from, or hand to a designer gets saved.

## 2. Naming convention (use everywhere — no exceptions)

| Thing | Pattern | Example |
|---|---|---|
| Month folder | `YYYY-MM · [Month Year]` | `2026-07 · July 2026` |
| Any doc | `[Piece] — [Month Year]` | `YouTube Script — July 2026` |

The folder's month is the month in the **title** of the update (the current month), not the month the
data covers — that's what the agent will look for later. The data period is stated inside each doc.

## 2b. What is NOT a file

Two parts of the month don't live in Drive:
- **The content board cards** (Market Board) live in the agent's Notion. The Drive docs stay the
  record; the board is the view.
- **The review** (Market Review) writes to `~/realtor-brain/memory/performance.md`, not the month
  folder — it's memory that shapes the next run, not a deliverable for this one.

## 3. The data block — the one file every skill reads

The researched numbers live in the Brain at **`~/realtor-brain/memory/market-data.md`**, appended as
one dated block per month (newest at the top). This is what makes "one command" work: research runs
once, and the presentation, script, shorts, infographic, and distribution pack all quote the same
figures.

- **Never research from a skill other than Market Research.** Read the block.
- If the block for the requested month doesn't exist, hand to **Market Research** first.
- After research writes it, **push the Brain to Drive** (`realtor-brain-sync`) — the local copy is
  wiped when the session ends, and an unsynced write is a lost write.

## 4. How to create folders + docs (Cowork Google Drive connector)
- **Folder:** `create_file` with `mimeType: application/vnd.google-apps.folder` and the right
  `parentId`; capture the returned `id` for what goes inside it.
- **Document:** write the structured text to a temp file, then render it to a styled `.docx` and upload:
  `python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "[Doc Name].docx" --title "[Title]" --subtitle "[Agent] · [City] · [Month Year]"`,
  then `create_file` the resulting **`.docx`** into the month folder. The structured text is only the
  renderer's input; the deliverable is the `.docx`.
- **No Drive connector?** Deliver the same content in chat as clean copy blocks and say plainly that
  connecting Google Drive means it saves itself next time. Never block the month on setup.
- **If the renderer won't run** (it prints `RENDERER-UNAVAILABLE`): **do not install anything, do not
  run `pip`, do not retry the command.** In a sandbox a package install can block for many minutes and
  looks exactly like a freeze. Save the structured text as a `.md` instead, upload that, and say one
  plain line — *"saved as a text version; the styled one needs a component this environment doesn't
  have."* The month always ships.
- **No command in this plugin should take more than a few seconds.** If one is still running after
  that, stop it and use the fallback rather than waiting.

## 5. How every doc reads
- Title block: the piece + the month + the agent's name and market + the **data period** the numbers cover.
- One H1, H2s per section, never deeper than H3. Short bullets over paragraphs.
- Anything with numbers (the glance page, property types, communities, affordability, the plan) goes
  in a bordered table.
- Every stat carries its source; a **Data Sources** section with URLs and retrieval dates closes any
  doc that quotes figures.
- Script lines each on their own line — never run dialogue together. `[SCREEN CUE]` and `[BRACKET]`
  directions on their own line.
- Stat callouts: the number on its own line, the label under it.
- No brand colours in the rendered docs — every doc renders to one clean neutral standard. Visual
  brand lives in the design briefs, which the agent takes to their design tool.
- Generous white space — half of this gets read on a phone.
