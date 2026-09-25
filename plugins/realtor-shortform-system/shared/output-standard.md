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
Window: [dates]  ·  Sources: [live Instagram + YouTube data · Metricool · screenshots]  ·  [N] posts reviewed
Powered by Mike Sherrard Coaching Inc Frameworks


════════════════════════════════════════════
READ THIS FIRST
════════════════════════════════════════════
{3 plain sentences: where you stand · your biggest strength · your biggest fix}

>> THE ONE MOVE:  {one sentence — the single cheapest, fastest change that matters most this month}

   ──── DO THESE THREE THIS WEEK ────
   1.  {a specific action}
   2.  {…}
   3.  {…}


════════════════════════════════════════════
YOUR NUMBERS AT A GLANCE   (this window vs last)
════════════════════════════════════════════
   Followers .............. {now}  ({+/- since last dive} — or "first dive: this is your baseline")
   Posts published ........ {n}  ({n}/wk vs Mike's 3/wk minimum)
   Reach this window ...... {n}  (people who saw at least one post)
   Typical post ........... {median reach}  (half your posts do better, half worse)
   Reel skip rate ......... {n%}  (who swiped away in the first 3 seconds)   — or "not available — needs the live connection"
   Saves + shares ......... {n}
   Link taps .............. {n}  (website + profile-link taps — the lead actions)
   DMs / leads ............ {n}  (from {which posts})   — or "DMs not connected yet"

   ──── WHAT'S IN THIS REPORT ────
   •  Pulled live:  {your Instagram · your YouTube · N other channels · N searches}
   •  From screenshots / Metricool:  {…}
   •  Not available on this connection:  {other people's Instagram and TikTok (a glance by hand) · Facebook · …}


════════════════════════════════════════════
PART 1 — YOUR ACCOUNT
════════════════════════════════════════════
   ──── 1.1 HOW YOU GREW ────
   In plain English:  {one sentence}
   Followers .............. {now vs last}  (follows {n} · unfollows {n})
   Reach ................. {this window vs previous}
   Profile visits ......... {n}
   •  What this means for you:  {…}

   ──── 1.2 WHAT'S PULLING — BY FORMAT AND BY JOB ────
   In plain English:  {one sentence}
   Green screen ({n}) ..... {typical reach}  ({saves} · {skip rate})
   Talking head ({n}) ..... {…}
   Carousel ({n}) ......... {…}
   Reach posts ({n}) ...... {…}   (the 4 in 4-3-2-1)
   Value posts ({n}) ...... {…}
   Trust posts ({n}) ...... {…}
   Convert posts ({n}) .... {…}
   •  Your mix vs Mike's 4-3-2-1:  {what it actually was} → {what to rebalance}
   •  Keep doing:  {…}   ·   Rethink:  {…}

   ──── 1.3 YOUR BEST HOOKS ────
   In plain English:  {one sentence: the first 3 seconds decide everything — here's what held}
   •  "{hook 1, word for word}" — {skip rate} — {why it held}
   •  "{hook 2}" — {…}
   •  "{hook 3}" — {…}
   •  Your weakest opening:  "{…}" — {skip rate} — {what to stop doing}

   ──── 1.4 WHO'S WATCHING ────
   In plain English:  {one sentence: are these local buyers and sellers, or other agents?}
   Your followers ......... {top cities · age band · gender}
   Who you reached ........ {top cities}
   Who engaged ............ {top cities}
   •  Locals vs agents:  {the verdict, plain}
   •  What this means for you:  {…}

   ──── 1.5 WHEN TO POST ────
   In plain English:  {one sentence: when your own followers are online}
   Best slots ............. {day/time 1 · day/time 2 · day/time 3}  (your timezone)
   •  Do this:  {…}

   ──── 1.6 WHAT TURNS INTO LEADS ────
   In plain English:  {one sentence}
   Website taps ........... {n}
   Profile-link taps ...... {n}  (call · text · email · address)
   Posts that drove profile actions ... "{post}" ({n}) · "{post}" ({n})
   DMs started ............ {n}   — or "not connected yet"
   •  What this means for you:  {…}

   ──── 1.7 STORIES ────
   {what's live today: link taps · replies · exits}   — or "no stories live today; drop screenshots of your story insights and I'll read the month"

   ──── 1.8 WHAT VIEWERS ARE SAYING ────
   •  Leads in the comments:  {n} — answer these today: "{quote}"
   •  Questions people keep asking:  "{question}" ({n} times) → your next post: "{hook}"
   •  Unanswered comments:  {n}

   ──── 1.9 WHERE VIEWS STOP TURNING INTO DMs ────
   In plain English:  {the path: people see it → watch → visit your profile → follow → message you}
   >> {the one place it breaks — and the specific fix}

   ──── 1.10 HOW OFTEN YOU POST ────
   Posts per week ......... {n}  (Mike's minimum 3 · goal daily)   ·   Stories .......... {n days/wk}
   •  What to change:  {…}


════════════════════════════════════════════
PART 2 — THE OTHER AGENTS IN YOUR MARKET
════════════════════════════════════════════
   In plain English:  {one sentence: YouTube we can read in full; Instagram and TikTok are a look at their public profile}
   [Channel A] ........ {subs} · typical video {n} · standout: "{title}" ({n} views, {x}× their normal) — YouTube
   [Account B] ........ {followers} · {posts/wk} · what stands out — Instagram, public-profile glance
   ──── WHAT THEY DO THAT YOU DON'T ────
   •  {the move} — {why it works} → {how you'd do it}
   ──── WHAT YOU DO BETTER ────
   •  {…}
   ──── WHERE YOU SIT ────
   {two sentences}


════════════════════════════════════════════
PART 3 — WHERE YOU SHOW UP WHEN PEOPLE SEARCH
════════════════════════════════════════════
   In plain English:  {one sentence}
   ──── 3.1 ON YOUTUBE ────
   | What people type | Where you are | Who's #1 today | Their views |
   |---|---|---|---|
   ──── 3.2 WHEN THEY ASK AN AI ASSISTANT ────
   | The question | Are you in the answer? | Who is |
   |---|---|---|
   •  What gets you into the answer:  {the one profile or page fix}
   ──── 3.3 WHAT'S RISING ────
   •  {phrase} — {direction} → {post idea}
   •  In the news this week:  {headline} ({source}, {date}) → {green-screen post}


════════════════════════════════════════════
PART 4 — THE OPENINGS   (what locals want that nobody local is posting)
════════════════════════════════════════════
   In plain English:  {one sentence}
   ──── OPENING 1 — {short plain name} ────
   •  What we found:  {one sentence}
   •  Why it matters to you:  {one sentence, in outcome words}
   •  Do this:  post "{hook / topic}"  ({format} · {job} · {week})
   •  The proof:  {2–3 short facts, each with one number}
   {…3–5 openings, never more}


════════════════════════════════════════════
PART 5 — YOUR NEXT 30 DAYS
════════════════════════════════════════════
   ──── KEEP DOING (YOUR STRENGTHS) ────
   1.  {strength} — {the number that proves it}
   ──── FIX ────
   1.  {what's wrong} — {why it costs you} — do this: {the specific change}
   ──── THE PLAN (4-3-2-1) ────
   Week 1 · Post 1 — {hook / topic}   ({format} · {job})
   …
   Post at:  {your 3 best slots from 1.5}
   Total output:  {n} posts a week + stories {n} days — {vs Mike's 3 minimum / daily goal}

   >> THE ONE MOVE:  {the same sentence as page one}


════════════════════════════════════════════
APPENDIX — THE FULL NUMBERS
════════════════════════════════════════════
   ──── A. EVERY POST IN THE WINDOW, BEST TO WORST ────
   | # | Post (hook) | Format · job | Reach | Saves | Shares | Skip % | Profile actions |
   |---|---|---|---|---|---|---|---|
   ──── B. YOUR AUDIENCE IN FULL ────
   | Audience | Top cities | Age | Gender |
   |---|---|---|---|
   ──── C. SEARCH RESULTS WE PULLED ────
   | Phrase | #1 | #2 | #3 | Your best |
   |---|---|---|---|---|


────────────────────────────────────────────
Sources — live Instagram + YouTube data pulled {date} · Metricool {ads / best-time} · screenshots · {N} searches · an AI answer engine.  Compliance — Fair Housing checked.  ✓
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
