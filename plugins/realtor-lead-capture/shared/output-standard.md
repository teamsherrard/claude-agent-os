# Output Standard — saving the lead magnet + funnel to Drive, organized + well formatted

Both documents land in the agent's Google Drive, in one campaign folder, named consistently, and formatted
so they look genuinely good. When a skill says "save to Drive (output standard)," it means this.

Two non-negotiables: **(1) the magnet and its funnel live together in one campaign folder; (2) each doc is
clean and scannable — never a wall of text.**

---

## 1. Where it goes — the Drive folder structure

The agent's lead-capture work lives in its own library folder (parallel to the YouTube and Short-Form
folders). One folder per campaign, so a magnet and the funnel that gives it away always sit together:

```
[Agent Name] — Lead Capture System/
└── 2026-06-13 · New-Build Buyer Guide/          (one campaign — created when the magnet is built)
      ├── Lead Magnet — New-Build Buyer Guide      (Doc — built first)
      └── Lead Capture Funnel — New-Build Buyer Guide   (Doc — built second, sells the magnet)
```

A "campaign" = one audience + one magnet + the one funnel that markets it. Build several over time (a buyer
campaign, a seller campaign) — each gets its own dated folder. Find-or-create; never duplicate a folder.

## 2. Naming convention (use everywhere — no exceptions)

| Thing | Pattern | Example |
|---|---|---|
| Campaign folder | `YYYY-MM-DD · [Guide Name]` | `2026-06-13 · New-Build Buyer Guide` |
| Lead magnet doc | `Lead Magnet — [Guide Name]` | `Lead Magnet — New-Build Buyer Guide` |
| Funnel doc | `Lead Capture Funnel — [Guide Name]` | `Lead Capture Funnel — New-Build Buyer Guide` |

Guide Name = 2–5 plain words (Title Case). The date is the build date (ISO, so folders sort on their own).
The two docs share the same Guide Name so the pair is unmistakable.

## 3. How to create folders + docs (Cowork Google Drive connector)
- **Folder:** `create_file` with `mimeType: application/vnd.google-apps.folder` and the right `parentId`;
  capture the returned `id` to use as the parent for what goes inside it.
- **Document:** `create_file` with **`contentMimeType: text/plain`** + `textContent`. The connector
  auto-converts `text/plain` into a clean Google Doc.
- **Find-or-create:** before creating the top folder or a campaign folder, list the parent and reuse it if
  it already exists. The funnel doc saves into the **same campaign folder** the magnet created.

## 4. Formatting — make it look good (within what actually converts)

**The hard constraint (verified):** the Drive connector only turns **`text/plain`** into a Google Doc.
`.docx` and HTML uploads do **not** convert (they land as raw/broken files), and a base64 `.docx` corrupts.
There's no API to add bold/colour/headings after creation. **So we make plain text look great by structuring
it well.** Every time:
- **Title line** at the top, then a light **meta line** (agent · city · date), then a blank line.
- **Section headers in ALL CAPS**, each preceded by an em-dash divider line and followed by a blank line.
- **Generous blank-line spacing** between blocks — let it breathe.
- **Bullets** with `•`; beats/sub-points with `—`. One idea per line.
- **Labels and copy-blocks on their own lines** (e.g. `HERO HEADLINE:` then the headline on the next line),
  so the agent can grab each piece to paste into claude.ai/design.
- **No** Markdown symbols (`#`, `**`, backticks), no tables — plain-text import drops or mangles them.
  Structure with caps, dividers, spacing, and bullets only.

## 5. The two document skeletons

**Lead Magnet doc** — the full guide content the agent builds into a PDF:
```
LEAD MAGNET — [GUIDE NAME]
[Agent Name] · [City] · [Date]

———————————————————————————————
THE PROMISE
What this guide delivers, in one or two lines · who it's for.

———————————————————————————————
THE GUIDE  (page by page)
PAGE 1 — [title]
   • ...the actual, genuinely useful content...
PAGE 2 — [title]
   • ...
(5–9 pages of real value — never a tease)

———————————————————————————————
HOW [AGENT] HELPS NEXT
A soft, no-pressure close in the agent's voice — where to reach them. (No call booking.)

———————————————————————————————
BUILD IT IN CLAUDE.AI/DESIGN
[paste-ready design prompt — layout + brand colours/fonts from brand-visual.md]

———————————————————————————————
Compliance: [disclaimer + license # if the rule applies]
```

**Lead Capture Funnel doc** — the full opt-in page copy, section by section:
```
LEAD CAPTURE FUNNEL — [GUIDE NAME]
[Agent Name] · [City] · [Date]   ·   Sells: [the magnet above]

———————————————————————————————
SECTION 1 — HERO
Headline: ...        (= the magnet's promise)
Subhead: ...
CTA button: "Send me the free guide"

———————————————————————————————
SECTION 2 — ABOUT [AGENT]
What makes them amazing: ...
Wins / proof: ...
Their process: ...

———————————————————————————————
SECTION 3 — THE OFFER
The transformation: ...
Why [Agent]: ...
Proof: ...

———————————————————————————————
SECTION 4 — THE OPT-IN
What you'll get:
   • ...   (matches the guide's pages exactly)
Form: Name + Email
Reassurance: Free. Instant. No spam.
CTA button: "Send me the free guide"
Thank-you state: ...

———————————————————————————————
BUILD IT IN CLAUDE.AI/DESIGN
[paste-ready design prompt — one-page opt-in layout, section order, brand colours/fonts]
Host it: build the page in claude.ai/design, then publish on your site / GoHighLevel / Carrd.

———————————————————————————————
Compliance: [disclaimer + license # if the rule applies]
```

## 6. The save flow
1. Build the doc text following §4–§5.
2. Find-or-create `[Agent Name] — Lead Capture System/` then the campaign folder `YYYY-MM-DD · [Guide Name]/`.
   (The funnel saves into the same campaign folder the magnet made.)
3. Create the Google Doc with the §2 name (`text/plain`).
4. Confirm in plain language + give the location:
   *"Saved to your Drive → Lead Capture System → [campaign]. Here's the doc: [link]."*

Deliver the copy in chat too — the agent often pastes into claude.ai/design right away. The Drive docs are
the organized record they (and their VA) can always find.
