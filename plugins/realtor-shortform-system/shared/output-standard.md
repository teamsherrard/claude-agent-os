# Output Standard — saving content to Drive, organized + beautifully formatted

Every document the Short-Form System creates lands in the agent's Google Drive, in the right folder, with
a consistent name, and formatted so it looks genuinely good. This file is the standard. When a skill says
"save to Drive (output standard)," it means this.

Two non-negotiables: **(1) it goes to the right Drive folder with the right name; (2) it's clean and
scannable — never a wall of text.**

---

## 1. Where it goes — the Drive folder structure

The agent's short-form content lives in its own library folder (created at setup, parallel to the
YouTube System folder). Organized by month so it never becomes a dumping ground:

```
[Agent Name] — Short-Form System/
├── Content/
│     └── 2026-06 · June/                         (month folder — create as needed)
│           ├── 2026-06-13 · Green Screen · Calgary Rate Hold      (Doc)
│           ├── 2026-06-13 · Talking Head · First-Time Buyer Tips  (Doc)
│           └── 2026-06-14 · Carousel · 5 Things Before You List   (Doc)
└── Performance/
      └── 2026-06-01–14 · Performance Review                       (Doc)
```

Don't pre-create empty month folders — create the current month's folder the first time you save into it.

## 2. Naming convention (use everywhere — no exceptions)

| Thing | Pattern | Example |
|---|---|---|
| Month folder | `YYYY-MM · Month` | `2026-06 · June` |
| Content doc | `YYYY-MM-DD · [Format] · [Short Topic]` | `2026-06-13 · Green Screen · Calgary Rate Hold` |
| Performance doc | `YYYY-MM-DD–DD · Performance Review` | `2026-06-01–14 · Performance Review` |

Format = **Green Screen · Talking Head · Carousel**. Topic = 3–6 plain words (Title Case), no punctuation
soup. Dates are ISO (`YYYY-MM-DD`) so files sort chronologically on their own.

## 3. How to create folders + docs (Cowork Google Drive connector)
- **Folder:** `create_file` with `mimeType: application/vnd.google-apps.folder` and the right `parentId`;
  capture the returned `id` to use as the parent for what goes inside it.
- **Document:** `create_file` with **`contentMimeType: text/plain`** + `textContent`. The connector
  auto-converts `text/plain` into a clean Google Doc.
- Find-or-create: before creating a folder, list the parent and reuse the folder if it already exists —
  never make duplicate "June" folders.

## 4. Formatting — make it look good (within what actually converts)

**The hard constraint (verified):** the Drive connector only turns **`text/plain`** into a Google Doc.
`.docx` and HTML uploads do **not** convert (they land as ugly raw files), and a base64 `.docx` corrupts.
There is no API to add bold/colour/headings after creation. **So we make plain text look great by
structuring it well** — that's what produces a clean, readable Doc.

Do this, every time:
- **Title line** at the top, then a light **meta line** (agent · city · date). Then a blank line.
- **Section headers in ALL CAPS**, each preceded by a divider line of em dashes
  (`———————————————————————————————`) and followed by a blank line.
- **Generous blank-line spacing** between blocks — let it breathe. Never run sections together.
- **Bullets** with `•`; sub-points or beats with `—`. One point per line.
- **Cues, hooks, and labels on their own lines** (e.g. `HOOK (read word-for-word)` then the hook on the
  next line). Captions and scripts never run together as a paragraph blob.
- **Copy blocks the agent will paste** (captions, hashtags) sit under a clear label so they're easy to
  grab.
- **No** Markdown symbols (`#`, `**`, backticks), no tables, no emoji walls — plain-text import drops or
  mangles them. Structure with caps, dividers, spacing, and bullets only.

(Truly branded, designed documents are a future backend upgrade — and visual *design* is always the
agent's design tool's job, per house rules #3. These are clean working documents, done excellently.)

## 5. The canonical document skeleton
Every content doc follows this shape (fill with what the workflow already produced for chat):

```
[FORMAT] · [TOPIC]
[Agent Name] · [City] · [Date]

———————————————————————————————
[FIRST SECTION — e.g. THE ARTICLE / THE TOPIC]
...one item per line, labels on their own lines...

———————————————————————————————
THE CONTENT (hook + talking points / script / slides)
...

———————————————————————————————
INSTAGRAM + FACEBOOK
Caption:
...
Hashtags:
...

———————————————————————————————
TIKTOK
Caption (one line, no line breaks):
...

———————————————————————————————
YOUTUBE SHORTS
Title:
...
Description:
...
Tags:
...
```
(Carousel docs use SLIDE 1 / SLIDE 2 … + DESIGN DIRECTION + the IG/FB block; performance docs use the
review structure from `metrics-guide.md`. Same formatting rules throughout.)

## 6. The save flow (end of every content workflow)
1. Build the doc text following §4–§5 (same content you delivered in chat, structured for the page).
2. Find-or-create `[Agent Name] — Short-Form System/Content/[YYYY-MM · Month]/` (or `/Performance/`).
3. Create the Google Doc with the §2 name (`text/plain`).
4. Confirm in plain language + give the location:
   *"Saved to your Drive → Short-Form System → Content → June. Here's the doc: [link]."*
5. The content-log row (the workflow already writes it) is the index; the Doc is the readable copy.

Keep delivering the copy-paste version in chat too — the agent often records/posts right away. The Drive
doc is the organized record they (and their VA) can always find.
