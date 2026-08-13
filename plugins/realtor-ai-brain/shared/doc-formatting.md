# Brain Doc Formatting — render deliverables as clean, formatted .docx

How the Brain's skills save documents (offer guidebooks, market updates, listing kits, the welcome doc) so
they're organized in Drive and genuinely look good. When a skill says "save as a clean doc (doc-formatting
standard)," it means this. **Every deliverable is rendered to a formatted `.docx` in one neutral house style —
the same clean look for every client (no colour, no per-client branding).**

## How to save — render structured text to a styled `.docx`
The skill writes the **structured text** (the grammar below: CAPS section dividers, `•` bullets, `Label:`
lead-ins); the shared renderer turns it into real Word formatting — headings, bullet lists, tables —
automatically.
1. Assemble the deliverable as structured text; write it to a temp file, e.g. `/tmp/doc.txt`.
2. Render it:
   `python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "[Doc Name].docx" --title "[Title]" --subtitle "[Agent · City]"`
   → produces the house style: **Arial**, **pure-black** text, real **headings**, **bullet lists**, and
   **tables**, thin light-grey rules. *(If `python-docx` is missing: `pip install python-docx`; if that's not
   possible, build the same `.docx` with the **docx skill**, matching the look below.)*
**Build + verify (EVERY document):** build ONLY via `render_doc.py` (or the docx skill matching the same
look) — never hand-write document XML. Before uploading, read the finished `.docx` text back and check:
(a) no raw `<w:` markup in the content — if you see any, the build is corrupt: rebuild; (b) **depth matches
the deliverable — client-facing guides and the master AI Brain doc are FULL, multi-page documents that
render the COMPLETE source content, never summaries.** Rich brain + thin render (a full brain under
~2,000 words) = a FAILED render — rebuild with the full content before uploading. Agents pay a premium
for this system; the documents must feel like it.
3. Upload the **`.docx`** to the agent's **workspace**, in the folder `shared/drive-map.md` assigns that
   deliverable type (content → `03 · Content/…`, market → `05 · Market`, the master doc → `01 · AI Brain`;
   **legacy brains** → the `Realtor AI Brain → exports` folder). Confirm in plain words with the real
   location: *"Saved to your Drive → [workspace] → [folder] → [name]."*

## Naming
`[Deliverable] · [Subject] · [Date]` — Title Case, ISO dates. Examples:
- `Market Update · Calgary · 2026-06`
- `Listing Kit · 123 Main St`
- `Why Work With Me · [Agent Name]`

## The look the renderer produces (one neutral standard for every client)
- **Arial** everywhere (never a serif). **Pure black** titles / headings / body; **dark grey** only for the
  small byline / footnotes.
- Section headings: bold black + a thin light-grey underline. **Real** bullet lists. **Real** tables
  (near-black header row, white text, light alternating rows). **No colour, no client branding.**
- These are clean working documents. For a *visually designed* client-facing piece (e.g. a lead-magnet PDF),
  produce the clean copy here and the agent drops it into their design tool — branding lives there.

## The structured text the renderer reads (write the doc in this grammar)
- **Title line** at the top; a light **meta line** under it (agent · city · date); then a blank line.
- **Section headers in ALL CAPS**, each wrapped by a divider rule
  (`────────────────────────────────────────────`), then a blank line. *(The renderer turns these into real
  headings — the rule is just the marker; `─`, `═`, or `—` all work.)*
- **Generous blank-line spacing** between blocks. **Bullets** with `•`, one point per line.
- **Labels and cues on their own lines** (e.g. `HOOK (read word-for-word)` then the hook on the next line) —
  scripts and captions never run together as a blob. **Copy the agent will paste** (captions, hashtags,
  descriptions) under a clear label, ready to grab.
- Plain structured text in the body (no Markdown `#`/`**`/backticks) — the renderer applies the formatting.
