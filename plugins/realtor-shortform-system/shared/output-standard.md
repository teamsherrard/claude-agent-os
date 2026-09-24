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
| Deep dive | `YYYY-MM-DD · Short-Form Deep Dive` | `2026-06-30 · Short-Form Deep Dive` |

Format = **Green Screen · Talking Head · Carousel**. Topic = 3–6 plain words (Title Case), no punctuation
soup. Dates are ISO (`YYYY-MM-DD`) so files sort chronologically on their own.

## 3. How to create folders + docs (Cowork Google Drive connector)
- **Folder:** `create_file` with `mimeType: application/vnd.google-apps.folder` and the right `parentId`;
  capture the returned `id` to use as the parent for what goes inside it.
- **Document:** write the structured text to a temp file, render it to a styled `.docx`, and upload that:
  `python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "[Doc Name].docx" --title "[Title]" --subtitle "[Agent · City]"`,
  then `create_file` the resulting **`.docx`**. The structured text is only the renderer's input.
- Find-or-create: before creating a folder, list the parent and reuse the folder if it already exists —
  never make duplicate "June" folders.

## 4. Formatting — the renderer makes it a clean, formatted `.docx`

The skill writes the **structured text** below; the shared renderer (`render_doc.py`) turns it into a clean,
formatted Word doc — real headings, bullet lists, light-grey rules — in **one neutral house style** (Arial,
pure-black text, no colour, no per-client branding). *(If `python-docx` is unavailable, build the same `.docx`
with the **docx skill**, matching that look.)*

Write the structured text like this, every time:
- **Title line** at the top, then a light **meta line** (agent · city · date). Then a blank line.
- **Section headers in ALL CAPS**, each preceded by a divider line of em dashes
  (`———————————————————————————————`) and followed by a blank line.
- **Generous blank-line spacing** between blocks — let it breathe. Never run sections together.
- **Bullets** with `•`; sub-points or beats with `—`. One point per line.
- **Cues, hooks, and labels on their own lines** (e.g. `HOOK (read word-for-word)` then the hook on the
  next line). Captions and scripts never run together as a paragraph blob.
- **Copy blocks the agent will paste** (captions, hashtags) sit under a clear label so they're easy to
  grab.
- **No** Markdown symbols (`#`, `**`, backticks) or emoji walls in the body — the renderer applies the
  formatting from the structure (caps headers, dividers, `•` bullets, `Label:` lead-ins).

(Every doc renders to a clean, formatted `.docx` in one neutral standard. Visual *brand design* is still the
agent's design tool's job, per house rules #3 — these are clean, well-formatted working documents.)

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

## 5b. The Deep Dive Report (the monthly analytics deliverable — stamped)
The one document that isn't content: the monthly deep dive from `shortform-analytics`. Same house grammar,
this fixed shape (mirrors the YouTube System's report so the two dives read as one ritual):
```
SHORT-FORM DEEP DIVE — [AGENT NAME], [CITY]  ·  [MONTH YYYY]
Window: [dates]  ·  Sources: [live data · Metricool · screenshots]  ·  [N] posts reviewed
Powered by Mike Sherrard Coaching Inc Frameworks

════════════════════════════════════════════
THE VERDICT
════════════════════════════════════════════
{3 sentences: where they stand · biggest strength · biggest fix}

════════════════════════════════════════════
THE SCORECARD   (this window vs last)
════════════════════════════════════════════
   Followers .............. {now}  ({+/- since last dive})
   Posts published ........ {n}  ({per week} vs Mike's 3/wk minimum)
   Avg reach / post ....... {n}  (your median: {n})
   Reel skip rate ......... {n%}   — or "not available — needs the live data connection"
   Saves + shares ......... {n}
   DMs / leads ............ {n}  (from {which posts})

════════════════════════════════════════════
PART 1 — YOUR ACCOUNT
════════════════════════════════════════════
   {every post ranked & tagged: format · funnel category · hook · reach · skip rate}
   ──── PER FORMAT / PER CATEGORY ────
   {averages}
   ──── HOOKS & RETENTION ────
   •  Best hooks (verbatim): "{…}" · "{…}" · "{…}" — {why each held}
   ──── THE FUNNEL LEAK ────
   >> {one plain sentence + the fix}

════════════════════════════════════════════
PART 2 — YOUR COMPETITORS
════════════════════════════════════════════
   [Channel/handle] ........ {numbers} · outlier: "{…}"
   •  What they do that you don't · What you do better · Positioning: {two sentences}

════════════════════════════════════════════
PART 3 — THE GAPS
════════════════════════════════════════════
   •  {gap} — {evidence}

════════════════════════════════════════════
PART 4 — THE NEXT 30 DAYS
════════════════════════════════════════════
   ──── DOUBLE DOWN ────   1.  {strength} — {number}
   ──── FIX ────           1.  {fix} — {the specific change}
   ──── THE PLAN (4-3-2-1) ────
   Week 1 · Post 1 — {hook/topic}   ({format · category})
   …
   >> THE ONE MOVE:  {one sentence}

────────────────────────────────────────────
Sources — {…}.  Compliance — Fair Housing checked.  ✓
Powered by Mike Sherrard Coaching Inc Frameworks
```
The stamp is a byline + footer only — never inside a caption or script block the agent pastes out.

## 6. The save flow (end of every content workflow)
1. Build the doc's structured text following §4–§5; write it to a temp file (e.g. `/tmp/doc.txt`).
2. Find-or-create `[Agent Name] — Short-Form System/Content/[YYYY-MM · Month]/` (or `/Performance/`).
3. **Render** the text to a styled `.docx` via `${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py` (§3), then upload
   that `.docx` with the §2 name into the folder.
4. Confirm in plain language + give the location:
   *"Saved to your Drive → Short-Form System → Content → June. Here's the doc: [link]."*
5. The content-log row (the workflow already writes it) is the index; the Doc is the readable copy.

Keep delivering the copy-paste version in chat too — the agent often records/posts right away. The Drive
doc is the organized record they (and their VA) can always find.
