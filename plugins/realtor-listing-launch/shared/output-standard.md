# Output Standard — where a launch lives and how it's saved

Everything for one listing lands in one Drive folder, named consistently, and formatted so it looks
genuinely good. When a skill says "save to Drive (output standard)," it means this.

Two non-negotiables: **(1) every piece for a listing lives in that listing's folder; (2) each doc is
clean and scannable — never a wall of text.**

---

## 1. Where it goes — the Drive folder structure

```
[Agent Name] — Listings/
├── Listing Presentation — 88 Ridge Road      (WIN IT — before the listing exists, so no folder yet)
└── 2026-07-16 · 412 Maplewood Drive/         (one listing — created by the intake)
      ├── Launch Plan — 412 Maplewood Drive
      ├── MLS Description — 412 Maplewood Drive
      ├── Brochure — 412 Maplewood Drive
      ├── Social Pack — 412 Maplewood Drive
      ├── Walkthrough + SEO — 412 Maplewood Drive
      ├── Tour — 412 Maplewood Drive
      ├── Shorts — 412 Maplewood Drive
      ├── Ad Plan — 412 Maplewood Drive
      ├── Open House Kit — 412 Maplewood Drive
      ├── Postcard — 412 Maplewood Drive
      ├── Outreach — 412 Maplewood Drive
      └── Sold — 412 Maplewood Drive
```

**WIN IT is the exception:** the listing presentation is built *before* there's a listing, so it
saves loose in `[Agent Name] — Listings/`. When the agent wins it, the intake creates the dated
folder — move the presentation into it if the connector allows, otherwise leave it and don't fuss.

One folder per listing, created by the intake skill and reused by every other skill. Find-or-create;
never duplicate a folder. Short pieces (a single caption, one text) can stay in chat — anything the
agent will reuse or hand to a designer gets saved.

## 2. Naming convention (use everywhere — no exceptions)

| Thing | Pattern | Example |
|---|---|---|
| Listing folder | `YYYY-MM-DD · [Street Address]` | `2026-07-16 · 412 Maplewood Drive` |
| Any doc | `[Piece] — [Street Address]` | `Ad Plan — 412 Maplewood Drive` |

Street address only (no city/state) so names stay short and sort cleanly. The date is the launch date.

## 3. How to create folders + docs (Cowork Google Drive connector)
- **Folder:** `create_file` with `mimeType: application/vnd.google-apps.folder` and the right `parentId`;
  capture the returned `id` for what goes inside it.
- **Document:** write the structured text to a temp file, then render it to a styled `.docx` and upload:
  `python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "[Doc Name].docx" --title "[Title]" --subtitle "[Address · Agent]"`,
  then `create_file` the resulting **`.docx`** into the listing folder. The structured text is only the
  renderer's input; the deliverable is the `.docx`.
- **No Drive connector?** Deliver the same content in chat as clean copy blocks and say plainly that
  connecting Google Drive means it saves itself next time. Never block the launch on setup.

## 4. How every doc reads
- Title block: the piece + the address + the agent's name and market + date.
- One H1, H2s per section, never deeper than H3. Short bullets over paragraphs.
- Anything with numbers (the launch plan, character counts, specs, budget) goes in a bordered table.
- Character counts shown under every length-limited piece (MLS versions, ad headlines, postcard front).
- Generous white space — it gets read on a phone, one-handed, between showings.
