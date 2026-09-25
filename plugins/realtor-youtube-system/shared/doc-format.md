# Document Format — the house style for EVERY saved document

Every deliverable is rendered to a **clean, formatted `.docx`** in one neutral house style — the same look for
every client (no colour, no per-client branding). The skill writes the **structured text** defined below
(CAPS section bands, `•` bullets, `Label:` lead-ins, simple aligned tables); the shared renderer turns that
into real Word formatting — headings, bullet lists, tables — automatically. **Do NOT save flat `text/plain`.**

## Saving — render the structured text to a styled `.docx`
1. Assemble the doc as structured text (the skeletons below); write it to a temp file, e.g. `/tmp/doc.txt`.
2. Render it:
   `python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "[Doc Name].docx" --title "[Title]" --subtitle "[Agent · City]"`
   → produces the house style automatically: **Arial**, **near-black** text, real **headings** (from the
   bands), real **bullet lists** and **tables**, thin light-grey rules. *(If `python-docx` is missing:
   `pip install python-docx`; if that's not possible, build the same `.docx` with the **docx skill**, matching
   the look below.)*
3. Upload the **`.docx`** to the agent's Drive folder — the structured text was only the renderer's input; the
   deliverable is the `.docx`.

**NEVER upload the raw structured text as the deliverable.** The CAPS bands and `────`/`════` rules are the
RENDERER'S INPUT, not a document — if a saved doc ever shows literal dash lines as text, the raw input was
uploaded: that is a FAILED delivery. Re-render and upload the `.docx` (ONE corrective re-upload; if it fails
again, stop and tell the agent — never loop). The fallback chain when rendering breaks: `render_doc.py` →
(`pip install python-docx`, ONCE) → the **docx skill** matching the same look, ONCE → then STOP and say the
renderer is unavailable — never "just upload the text."
**Verify before uploading (every doc):** read the finished `.docx` back — (a) no raw `<w:` markup in the
content (corrupt build → rebuild); (b) depth matches the deliverable — a rich source rendered thin is a
failed render, rebuild with the full content. Agents pay a premium; the documents must feel like it.

## The look the renderer produces (match it if you ever build by hand)
- **Arial** everywhere (installed on every platform — never a serif). **Near-black (#111)** titles /
  headings / body — crisp, never grey; a legible **dark grey** only for the small byline + stamp.
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
Flagship strategy docs (Game Plan, Market Report) also carry the **credibility stamp** (house rules #9):
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
   1.  {length 10–25 min (relocation 8–12)}
   2.  {search-intent titles}
   3.  {primary CTA right after the hook (~0:30–1:00)}
   4.  {playlists per pillar}


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
   BODY (1:00–end) — {deliver the promise; 10–25 min of real, local value (relocation 8–12) — §7}
   SECONDARY CTA (final 60s) — {book/reach out + watch the next best video — §6.5}


════════════════════════════════════════════
90-DAY CALENDAR   (24 videos · 2/week · the §22 mix across the 6 content types)
════════════════════════════════════════════
   Week 1 · Video 1 — {exact title}   ({content type})
   Week 1 · Video 2 — {exact title}   ({content type})
   Week 2 · Video 1 — {…}   ({…})
   …  (one video per row — the weekly 2-video rhythm must read at a glance; 12 weeks)


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

### Deep Dive Report (flagship — stamped; written for a realtor, not a marketer — the Short-Form plugin mirrors this shape in output-standard.md §5b)
```
YOUTUBE DEEP DIVE — [AGENT NAME], [CITY]  ·  [MONTH YYYY]
Window: [dates]  ·  Sources: [live YouTube data · Studio pack · captions · public reads]  ·  [N] videos reviewed
Powered by Mike Sherrard Coaching Inc Frameworks


════════════════════════════════════════════
READ THIS FIRST
════════════════════════════════════════════
{3 plain sentences: where you stand · your biggest strength · your biggest fix — no jargon, no numbers beyond two}

>> THE ONE MOVE:  {one sentence — the single cheapest, fastest change that matters most this month}

   ──── DO THESE THREE THIS WEEK ────
   1.  {a specific action: a title to film, a change to make, a thing to paste}
   2.  {…}
   3.  {…}


════════════════════════════════════════════
YOUR NUMBERS AT A GLANCE   (this window vs last)
════════════════════════════════════════════
   Subscribers ............ {now}  ({+/- since last dive} — or "first dive: this is your baseline")
   Videos published ....... {n}  ({n}/wk vs your plan of 2/wk)
   Views this window ...... {n}  ({vs the previous window})
   Typical video .......... {median views}  (half your videos do better than this, half worse)
   Comments ............... {n}  ({where they come from})
   Click-through rate ..... {n%}  (of the people who saw your thumbnail, how many clicked)   — or "not provided yet"
   Watch time ............. {m:ss} / {% viewed}  (how long people stay)   — or "not provided yet"
   Leads / calls booked ... {n}  (from {which videos})   — or "not tracked yet — ask every lead which video made them reach out"

   ──── WHAT'S IN THIS REPORT ────
   •  Pulled live:  {your channel · N other channels · N searches · captions of your top N videos}
   •  From your Studio pack:  {in — the four screenshots} — or "not provided — say 'add my Studio numbers' any time and the click-through, watch-time, traffic and audience sections fill in"
   •  Not available on this connection:  {comments (permission) → 'check my comments' with screenshots · …}


════════════════════════════════════════════
PART 1 — YOUR CHANNEL
════════════════════════════════════════════
   ──── 1.1 HOW YOU GREW ────
   In plain English:  {one sentence}
   Subscribers ............ {now vs last}
   Views ................. {this window vs previous}
   Uploads ............... {this window vs previous}
   •  What this means for you:  {one or two sentences}

   ──── 1.2 WHAT'S PULLING — BY CONTENT TYPE ────
   In plain English:  {one sentence: which kind of video works for you}
   {Content type} ......... {typical views}  ({n} videos · {share} of all views)
   {…every type you made}
   •  Keep doing:  {type} — {why, in outcome words}
   •  Rethink:  {type} — {why}

   ──── 1.3 TITLES & THUMBNAILS (PACKAGING) ────
   In plain English:  {one sentence: are people clicking?}
   | Check | Your videos | What to change |
   |---|---|---|
   | Title under 70 characters | {n of N pass} | {…} |
   | One promise per title | {…} | {…} |
   | Your market / the phrase people type in the title | {…} | {…} |
   | Booking link + free guide in the first 3 lines of the description | {…} | {…} |
   | Chapters (timestamps) | {…} | {…} |
   | A question or comment prompt | {…} | {…} |
   | Uploaded captions | {…} | {…} |
   | Best publish day / time | {day, time — by typical views} | {…} |
   •  Re-title these 3 now:  "{old}" → "{new}" · "{old}" → "{new}" · "{old}" → "{new}"

   ──── 1.4 YOUR BEST OPENINGS ────
   In plain English:  {one sentence}
   •  "{hook 1, word for word}" — {why it held, in plain words}
   •  "{hook 2}" — {…}
   •  "{hook 3}" — {…}
   •  Use this opening style on:  {the next video}

   ──── 1.5 WHERE VIEWERS COME FROM & WHO THEY ARE   (from your Studio pack) ────
   In plain English:  {one sentence}
   Found you by searching ... {n%}  (vs browsing {n%} · suggested {n%})
   Top search terms ....... {term · term · term}
   Who they are ........... {age band · gender split · top locations}
   When they're watching .. {days / hours}
   •  What this means for you:  {…}
   — or:  Not provided yet. Say "add my Studio numbers" and drop the four screenshots; this section fills in.

   ──── 1.6 WHAT VIEWERS ARE SAYING ────
   In plain English:  {one sentence}
   •  Leads in the comments:  {n} — answer these today: "{quote}" · "{quote}"
   •  Questions people keep asking:  "{question}" ({n} times) → your next video: "{title}"
   •  Unanswered comments:  {n}
   — or:  Comments aren't readable on this connection. Say "check my comments" and drop screenshots.

   ──── 1.7 WHERE VIEWS STOP TURNING INTO CALLS ────
   In plain English:  {the path in one sentence: people see the video → click → watch → hear your ask → call}
   >> {the one place it breaks, plainly — and the specific fix}
   •  The habit that fixes tracking:  ask every new lead "which video made you reach out?" and tell me — from now on I count leads by video.

   ──── 1.8 HOW OFTEN YOU POST & YOUR CHANNEL PAGE ────
   Uploads per week ....... {n}  (longest gap {n} days)
   Playlists .............. {n}  ({do they match your 3 pillars?})
   Channel page ........... {featured sections — or "not set up"}
   •  What to change:  {…}


════════════════════════════════════════════
PART 2 — THE OTHER AGENTS IN YOUR MARKET
════════════════════════════════════════════
   In plain English:  {one sentence: we looked at N channels and judged each against its own normal, not against you}
   [Channel A] ........ {subs} · typical video {n} · standout: "{title}" ({n} views, {x}× their normal)
   [Channel B] ........ {…}   (3–5 channels, never an empty row)

   ──── WHAT THEY DO THAT YOU DON'T ────
   •  {the move} — {why it works, plain} → {how you'd do it}
   ──── WHAT YOU DO BETTER ────
   •  {…}
   ──── WHERE YOU SIT ────
   {two sentences}


════════════════════════════════════════════
PART 3 — WHERE YOU SHOW UP WHEN PEOPLE SEARCH
════════════════════════════════════════════
   In plain English:  {one sentence: when someone types these into YouTube, or asks an AI assistant, this is what they find}

   ──── 3.1 ON YOUTUBE ────
   | What people type | Where you are | Who's #1 today | Their views |
   |---|---|---|---|
   | {phrase} | {#3 / not in the top 20} | {channel} | {n} |
   •  Own next:  "{phrase}" — {why it's winnable}

   ──── 3.2 WHEN THEY ASK AN AI ASSISTANT ────
   | The question | Are you in the answer? | Who is |
   |---|---|---|
   | {question} | {yes — cited / no} | {who} |
   •  What gets you into the answer:  {the one page or profile fix}

   ──── 3.3 WHAT'S RISING ────
   •  {phrase} — {up / flat / down over 12 months, plain} → {video idea}
   •  In the news this month:  {headline} ({source}, {date}) → {the "news + you" video}


════════════════════════════════════════════
PART 4 — THE OPENINGS   (topics people search that nobody local owns)
════════════════════════════════════════════
   In plain English:  {one sentence: we found N openings; each is a video with proven demand and weak competition}

   ──── OPENING 1 — {short plain name} ────
   •  What we found:  {one sentence}
   •  Why it matters to you:  {one sentence, in outcome words}
   •  Do this:  film "{exact title}"  ({content type} · {week})
   •  The proof:  {2–3 short facts, each with one number}

   ──── OPENING 2 — {…} ────
   {…}   (3–5 openings, never more)

   ──── YOUR OWN WINNERS, FROM A NEW ANGLE ────
   •  "{your winner}" ({n} views) → "{new title 1}" · "{new title 2}"


════════════════════════════════════════════
PART 5 — YOUR NEXT 30 DAYS
════════════════════════════════════════════
   ──── KEEP DOING (YOUR STRENGTHS) ────
   1.  {strength} — {the number that proves it}
   ──── FIX ────
   1.  {what's wrong} — {why it costs you} — do this: {the specific change}
   ──── THE PLAN ────
   Week 1 · Video 1 — {exact title}   ({content type})
   Week 1 · Video 2 — {exact title}   ({content type})
   …  (~8 videos on the §22 mix, one per row)
   Total output:  {n} videos a week including {standing series} — {fits / trims to} your {2}/wk.

   >> THE ONE MOVE:  {the same sentence as page one}


════════════════════════════════════════════
APPENDIX — THE FULL NUMBERS
════════════════════════════════════════════
   ──── A. EVERY VIDEO IN THE WINDOW, BEST TO WORST ────
   | # | Video | Type | Length | Views | Comments | CTR | Watch % |
   |---|---|---|---|---|---|---|---|
   ──── B. THE PACKAGING CHECK, VIDEO BY VIDEO ────
   | Video | ≤70 chars | One promise | Market | Link in first 3 lines | Chapters | Captions |
   |---|---|---|---|---|---|---|
   ──── C. SEARCH RESULTS WE PULLED ────
   | Phrase | #1 | #2 | #3 | Your best |
   |---|---|---|---|---|


────────────────────────────────────────────
Sources — live YouTube data pulled {date} · Studio pack {in / not provided} · captions of {N} videos · {N} searches · an AI answer engine.  Compliance — Fair Housing checked.  ✓
Powered by Mike Sherrard Coaching Inc Frameworks
```
(Short-Form's dive uses the same shape with its own labels: reels/carousels per format + funnel category,
hook skip-rate, Instagram/YouTube competitors, the 4-3-2-1 30-day list.)

### Script
TITLE/meta → bands for `HOOK · 0:00` (doctrine §5) → `PRIMARY CTA · ~0:45` (§6.2, right after the hook) →
numbered `1 · LABEL · MM:SS` body sections (3–5, §7) → optional brief mid-reminder → `SECONDARY CTA` (§6.5 —
book + the next best video) → heavy band `CHAPTERS` → heavy band `30-SECOND SHORT` → footer. (Detailed
skeleton: `${CLAUDE_PLUGIN_ROOT}/skills/youtube-script/references/script-format.md`.)

### Channel Page Kit
```
CHANNEL PAGE KIT — [AGENT NAME]
[Channel handle]  ·  [market]  ·  [YYYY-MM-DD]

──────────────── CHANNEL DESCRIPTION ────────────────
   >> PASTE INTO:  Studio → Customization → Basic info → Description (opening paragraph)
{the 2–3 keyworded sentences}

──────────────── ABOUT SECTION ────────────────
   >> PASTE INTO:  same field, directly below the description
{who it serves · the pillars · proof line · CTA + link · disclosure}

──────────────── LINKS ────────────────
   •  {Booking link} — {why}
   •  {Lead magnet} — {why}

──────────────── CHANNEL KEYWORDS ────────────────
   >> PASTE INTO:  Studio → Settings → Channel → Basic info
{comma-separated keyword list}

──────────────── PLAYLISTS ────────────────
   •  {Playlist name}:  {one-line keyworded description}

──────────────── BANNER TEXT BRIEF ────────────────
Headline:  {…}
Subline:  {…}
   >> Build in your design tool; finished image → Customization → Branding → Banner

──────────────── UPLOAD DEFAULTS ────────────────
   >> SET ONCE IN:  Studio → Settings → Upload defaults
{default description block (§18.2 CTA-first) · default tags · category · visibility · language}

────────────────────────────────────────────
Compliance — Fair Housing + disclosure checked.  ✓
```

### SEO Package
```
{VIDEO TITLE} — SEO PACKAGE
For {avatar}  ·  {market}  ·  {YYYY-MM-DD}

──────────────── TITLE OPTIONS ────────────────
1.  {option}
2.  {option}
3.  {option}

──────────────── DESCRIPTION ────────────────
{first 3 lines — the §18.2 opening: CTA + clickable links (book-a-call / calendar link · phone · email · lead-magnet link)}
{then 2–3 keyword-rich summary lines in the agent's voice}

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
