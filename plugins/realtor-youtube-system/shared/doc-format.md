# Document Format — the house style for EVERY saved document

Every deliverable is rendered to a **clean, formatted `.docx`** in one neutral house style — the same look for
every client (no colour, no per-client branding). The skill writes the **structured text** defined below
(CAPS section bands, `•` bullets, `Label:` lead-ins, simple aligned tables); the shared renderer turns that
into real Word formatting — headings, bullet lists, tables — automatically. **Do NOT save flat `text/plain`.**

## Saving — render the structured text to a styled `.docx`
1. Assemble the doc as structured text (the skeletons below); write it to a temp file, e.g. `/tmp/doc.txt`.
2. Render it:
   `python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "[Doc Name].docx" --title "[Title]" --subtitle "[Agent · City]"`
   → produces the house style automatically: **Arial**, **pure-black** text, real **headings** (from the
   bands), real **bullet lists** and **tables**, thin light-grey rules. *(If `python-docx` is missing:
   `pip install python-docx`; if that's not possible, build the same `.docx` with the **docx skill**, matching
   the look below.)*
3. Upload the **`.docx`** to the agent's Drive folder — the structured text was only the renderer's input; the
   deliverable is the `.docx`.

## The look the renderer produces (match it if you ever build by hand)
- **Arial** everywhere (installed on every platform — never a serif). **Pure black** titles / headings / body;
  **dark grey (#333)** only for the small byline + stamp.
- Section headings: bold black + a thin light-grey underline. **Real** bullet lists. **Real** tables: near-black
  header row (white text) + light alternating rows. **No colour, no client branding** — one standard for all.
- Flagship strategy docs carry `Powered by Mike Sherrard Coaching Inc Frameworks` (top byline + footer).

---

## The structured text the renderer reads (write the doc in this grammar)

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
Flagship strategy docs (Game Plan, Market Report) also carry the **credibility stamp** (house rules #8):
`Powered by Mike Sherrard Coaching Inc Frameworks` — once as a byline under the title, once as the final
footer line. Never put it inside a copy block the agent pastes out.

Rules: a blank line between every section · spoken text in plain sentences · CAPS + dividers + indents carry
the hierarchy · use only `─` (U+2500), `═` (U+2550), `•` (U+2022). Tight and scannable — readable at a glance.

---

## Per-doc skeletons (fill in, keep the shape)

### YouTube Game Plan (the flagship — stamped)
```
YOUTUBE GAME PLAN — [AGENT NAME], [CITY]
Prepared on Mike Sherrard Coaching Inc frameworks  ·  [Month Year]
Powered by Mike Sherrard Coaching Inc Frameworks


════════════════════════════════════════════
EXECUTIVE SUMMARY
════════════════════════════════════════════
{where they are + the verdict · root causes · the insight · the plan in one line + their goal}


════════════════════════════════════════════
CHANNEL AUDIT
════════════════════════════════════════════
{scaled to their video count — for a fresh channel this is a short "starting clean" note}
   COMPETITOR SNAPSHOT
   [Agent] ........ subs · avg views · top video · length
   [Competitor] ... subs · avg views · top video · length


════════════════════════════════════════════
YOUR GOAL → THE PLAN   (the math)
════════════════════════════════════════════
Goal: {from strategy.md}
{goal ÷ close rate → leads ÷ conversion → views → cadence → 90-day milestones}
{assumptions stated · a credible path, never a guarantee}


════════════════════════════════════════════
THE FOUR STRATEGIC SHIFTS
════════════════════════════════════════════
   1.  {length 10–20 min}     2.  {search-intent titles}
   3.  {early CTA, 60–90s}    4.  {playlists per pillar}


════════════════════════════════════════════
PILLAR 1 — {NAME}   ·   Playlist: "{playlist name}"
════════════════════════════════════════════
Why it generates leads: {the lead psychology}

   #    EXACT TITLE                                   SEARCH INTENT & LEAD TYPE
   1    {title}                                       {who it captures + why}
   2    {title}                                       {…}
   …    (15–20, ordered broad → niche)

(PILLAR 2 and PILLAR 3 — same shape)


════════════════════════════════════════════
THE VIDEO STRUCTURE   (every video — doctrine §4)
════════════════════════════════════════════
   HOOK (0:00–0:30) — {the viewer's question/fear, not "welcome back" — §5}
   PRIMARY CTA (0:30–1:00) — {warm invite: "people just like you" + book a private call, from the Brain — §6.2}
   BODY (1:00–end) — {deliver the promise; 10–20 min of real, local value — §7}
   SECONDARY CTA (final 60s) — {book/reach out + watch the next best video — §6.5}


════════════════════════════════════════════
90-DAY CALENDAR   (24 videos · 2/week · the §22 mix across the 6 content types)
════════════════════════════════════════════
   Week 1 — {Video 1}  ·  {Video 2}    ({pillars})
   Week 2 — {…}
   …  (12 weeks)


════════════════════════════════════════════
SUCCESS METRICS   (90-day milestones toward {goal})
════════════════════════════════════════════
   Avg view duration ...... 40%+
   Click-through rate ..... 4–8%
   Subscribers ............ +50 / month
   Leads / booked calls ... 2–5 / month
   Search ranking ......... top 5 for local terms


────────────────────────────────────────────
{closing vision — one honest, motivating paragraph}
Powered by Mike Sherrard Coaching Inc Frameworks
```

### Script
TITLE/meta → bands for `HOOK · 0:00` (doctrine §5) → `PRIMARY CTA · ~0:45` (§6.2, right after the hook) →
numbered `1 · LABEL · MM:SS` body sections (3–5, §7) → optional brief mid-reminder → `SECONDARY CTA` (§6.5 —
book + the next best video) → heavy band `CHAPTERS` → heavy band `30-SECOND SHORT` → footer. (Detailed
skeleton: `${CLAUDE_PLUGIN_ROOT}/skills/youtube-script/references/script-format.md`.)

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
