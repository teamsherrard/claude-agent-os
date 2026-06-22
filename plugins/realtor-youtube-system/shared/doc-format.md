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
Flagship strategy docs (Game Plan, Market Report) also carry the **credibility stamp** (house rules #8):
`Powered by Mike Sherrard's frameworks & strategies` — once as a byline under the title, once as the final
footer line. Never put it inside a copy block the agent pastes out.

Rules: a blank line between every section · spoken text in plain sentences · CAPS + dividers + indents carry
the hierarchy · use only `─` (U+2500), `═` (U+2550), `•` (U+2022). Tight and scannable — readable at a glance.

---

## Per-doc skeletons (fill in, keep the shape)

### YouTube Game Plan (the flagship — stamped)
```
YOUTUBE GAME PLAN — [AGENT NAME], [CITY]
Prepared on Mike Sherrard's frameworks  ·  [Month Year]
Powered by Mike Sherrard's frameworks & strategies


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
THE 4-PART VIDEO STRUCTURE
════════════════════════════════════════════
   HOOK (0:00–0:30) — {the viewer's pain, not "welcome back"}
   EARLY CTA (0:30–1:00) — {their real CTA from the Brain}
   CONTENT (1:00–end) — {10–20 min of real value}
   CLOSING CTA (final 60s) — {next video + subscribe}


════════════════════════════════════════════
90-DAY CALENDAR   (2 videos/week)
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
Powered by Mike Sherrard's frameworks & strategies
```

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
