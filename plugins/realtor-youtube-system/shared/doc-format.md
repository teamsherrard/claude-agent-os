# Document Format — the house style for EVERY saved Google Doc

Every doc the system saves is a native Google Doc made from **plain text** (`contentMimeType: text/plain`).
Plain text is the only format that reliably converts to a clean Doc — so the polish comes entirely from
STRUCTURE. This file is the exact look to reproduce. Never save an unstructured wall; never rely on
bold/colour/markdown (plain-text import drops them).

## The visual grammar (reproduce these exact patterns)

**Title line** — first line, the doc's name in CAPS. Then a **meta line** of ` · `-separated facts, blank line:
```
THE BANK OF CANADA JUST HELD RATES — WHAT IT MEANS FOR CALGARY BUYERS
Runtime ~8 min  ·  Audience: Calgary buyers  ·  2026-06-13
```

**Section band** — standard header wrapped top + bottom by a 44-char `─` rule, label in CAPS, ` · ` timestamp:
```
────────────────────────────────────────────
HOOK  ·  0:00
────────────────────────────────────────────
```

**Major block** — for big structural blocks (Chapters, the Short, top-level parts) use the heavy `═` rule:
```
════════════════════════════════════════════
CHAPTERS   (paste into the description)
════════════════════════════════════════════
```

**Cue lines** — non-spoken notes on their OWN line, indented 3 spaces:
```
   >> ON SCREEN:  Riya Bidani | South Calgary
   [PAUSE]
   FACT:  Bank of Canada, Jun 10 2026
```

**Bullets** — 3-space indent, `•`, two spaces: `   •  First point.`

**Footer** — a `─` rule, then sourcing + compliance:
```
────────────────────────────────────────────
Facts verified — {claim} ({source}, {date}).
Compliance — {what was checked}.  ✓
```

Rules: a blank line between every section · spoken text in plain sentences · CAPS + dividers + indents carry
the hierarchy · use only `─` (U+2500), `═` (U+2550), `•` (U+2022). Tight and scannable — readable at a glance.

---

## Per-doc skeletons (fill in, keep the shape)

### Script
TITLE/meta → bands for `HOOK · 0:00`, `EARLY WARM CTA · 0:15`, `INTRO · 0:30`, numbered `1 · LABEL · MM:SS`
sections (3–5), `SOFT MID CTA`, `REASSURANCE`, `FINAL CTA` → heavy band `CHAPTERS` → heavy band
`30-SECOND SHORT` → footer. (Detailed skeleton: `${CLAUDE_PLUGIN_ROOT}/skills/youtube-script/references/script-format.md`.)

### SEO Package
```
{VIDEO TITLE} — SEO PACKAGE
For {avatar}  ·  {market}  ·  {YYYY-MM-DD}

──────────────── TITLE OPTIONS ────────────────
1.  {option}
2.  {option}
3.  {option}

──────────────── DESCRIPTION ────────────────
{2–3 keyword-rich lines in the agent's voice, then the CTA + booking link + lead-magnet link}

   CHAPTERS
   00:00  {…}
   01:00  {…}

──────────────── TAGS ────────────────
{tag, tag, tag, …}

──────────────── HASHTAGS ────────────────
#{…}  #{…}  #{…}

──────────────── PINNED COMMENT ────────────────
"{question prompt that drives comments + the CTA}"
```

### Lead Magnet Map
```
{VIDEO TITLE} — LEAD MAGNET MAP
Offer {offer}  ·  Avatar fear {fear}  ·  CTA {booking link}

──────────────── THE MAGNET ────────────────
Name:     {title}
Format:   {checklist / guide / calculator}
Promise:  {the one outcome it delivers}

──────────────── PAGE-BY-PAGE ────────────────
PAGE 1 — {purpose}
   •  {content}
PAGE 2 — {purpose}
   •  {content}

──────────────── CTA / NEXT STEP ────────────────
{the exact CTA + booking link}

(We map the content; the agent designs the visual in their own tool.)
```

### Repurposing Pack
```
{VIDEO TITLE} — REPURPOSING PACK
From the long-form script  ·  {YYYY-MM-DD}

════════════════ SHORT-FORM SCRIPTS ════════════════
SHORT 1 — {angle}
   {hook → one point → CTA}
SHORT 2 — {angle}
   {…}

════════════════ BLOG POST ════════════════
Title:  {…}
{body — ranks on Google as well as YouTube}

════════════════ EMAIL ════════════════
Subject:  {…}
{body + CTA}

════════════════ SOCIAL ════════════════
LinkedIn:   {…}
Facebook:   {…}
Instagram carousel:  Slide 1 {…} | Slide 2 {…} | Slide 3 {…}
```

Same shape every time, in the agent's own voice. This is the standard for what lands in their Drive.
