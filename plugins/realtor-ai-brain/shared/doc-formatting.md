# Brain Doc Formatting — save deliverables as clean Google Docs

How the Brain's skills save documents (offer guidebooks, market updates, listing kits, the welcome doc)
so they're organized in Drive and actually look good. When a skill says "save as a clean Google Doc
(doc-formatting standard)," it means this.

## The hard constraint (why we don't make .docx)
Cowork's Google Drive connector only converts **`text/plain`** into a clean Google Doc (and `text/csv`
into a Sheet). **`.docx` and HTML do NOT convert** — they land as raw, broken-looking files — and a
base64 `.docx` corrupts on upload. There's no API to apply headings/bold/colour after creation. So we
make the document look good by **structuring plain text well**, and let the connector convert it.

> This replaces the old "compile into .docx" step. Do **not** render `.docx` or HTML for these
> deliverables — build structured plain text and create a Google Doc.

## How to create it
- Create the doc with the Drive connector: `create_file` with **`contentMimeType: text/plain`** +
  `textContent`, into the agent's **`Realtor AI Brain` → `exports`** folder in Drive (find-or-create the
  `exports` folder; don't duplicate it). The connector converts it to a Google Doc.
- Confirm the location + link in plain words: *"Saved to your Drive → Realtor AI Brain → exports → [name]."*

## Naming
`[Deliverable] · [Subject] · [Date]` — Title Case, ISO dates. Examples:
- `Market Update · Calgary · 2026-06`
- `Listing Kit · 123 Main St`
- `Why Work With Me · [Agent Name]`

## Formatting rules (make plain text look great)
- **Title line** at the top; a light **meta line** under it (agent · city · date); then a blank line.
- **Section headers in ALL CAPS**, each preceded by an em-dash divider line
  (`———————————————————————————————`) and followed by a blank line.
- **Generous blank-line spacing** between every block — let it breathe.
- **Bullets** with `•`; beats/sub-points with `—`; one point per line.
- **Labels and cues on their own lines** (e.g. `HOOK (read word-for-word)` then the hook on the next
  line). Scripts and captions never run together as a paragraph blob.
- **"Shaded box" content** (hooks, closing lines, scripts) → since plain text can't shade, set it off with
  its own label + a divider above and below, so it's visually distinct.
- **Copy the agent will paste** (captions, hashtags, descriptions) under a clear label, ready to grab.
- **No** Markdown (`#`, `**`, backticks), no tables, no emoji walls — plain-text import drops/mangles them.

## On branding
A `text/plain` Google Doc can't carry brand colours or fonts (the connector won't apply them, and there's
no post-creation styling API). So these are **clean, well-structured working documents** — not branded
visual design. Brand colours/fonts live in actual design outputs (the agent's design tool / claude.ai
design). For a polished, *visually designed* client-facing piece (e.g. a lead-magnet PDF), produce the
clean copy here and tell the agent to drop it into their design tool. (A team-built Google-Docs styling
integration is a possible future upgrade.)
