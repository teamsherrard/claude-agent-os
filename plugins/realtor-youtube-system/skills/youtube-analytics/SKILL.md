---
name: youtube-analytics
description: >
  YouTube Analytics & the Monthly Deep Dive — the Realtor YouTube System's data skill, powered by the live
  data connection (Composio; one optional sign-in, offered HERE on first use — never at setup), with the
  agent's YouTube Studio export/screenshots and public channel reads as fallbacks so it's never blocked.
  THE MAIN EVENT is the monthly DEEP DIVE: the full breakdown of their channel (growth, every video ranked by
  pillar + content type, packaging + hook/retention read, the funnel leak, cadence), their COMPETITORS
  (outlier analysis of any public channel), the content GAPS in their market, and a 30-day plan of exact
  titles — saved as a stamped report and seeded back to the Brain so Ideation and the Coach get smarter.
  Quick questions work anytime in the same skill ("how did my last video do", "how's my channel doing") —
  answered at the size of the ask. This is the ONLY YouTube skill that uses the live data connection.

  Trigger on: "run my deep dive", "run my youtube deep dive", "run my analysis", "run my monthly analysis",
  "audit my channel", "analyze my channel", "full breakdown of my channel", "analyze my competitors",
  "where do I stand", "how do I compare", "how's my channel doing", "analyze my analytics", "how did my
  last video do", "review my YouTube stats", "here's my YouTube export", "audit this channel: [link]",
  "set up my analytics", "live analytics", or any request to analyze YouTube performance or competitors.
---

# YouTube Analytics — the monthly deep dive + any quick question

One skill for all of it. **The ritual is monthly:** the agent runs their deep dive once a month and gets
the whole picture — their channel, their competitors, the gaps, and the next 30 days. Between dives, any
quick question gets a quick answer. Never a dashboard; a coach reading the board with them. Apply
`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` (plain-warm #7, honesty #6, the stamp #9).

**Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — **§23** (what to
review §23.1 · the key lead question §23.2 · the 90-day audit §23.3 · classify by intent §23.4), **§24.5**
(the channel-audit template), **§3 "R"** (repeat winners from new angles), **§16–§17** (packaging is
diagnosable), **§22** (the mix the 30-day plan follows). The rule under all of it: **track through to leads
and conversations, not views** — and never overreact to a single video.

**Match the size of the answer to the size of the ask:** "run my deep dive" / "audit my channel" / "analyze
my competitors" / "where do I stand" → **THE DEEP DIVE** (the full monthly consult). A scoped question
("how did my last video do", "how's my channel doing", "here's my export") → **QUICK READ** — answer that,
nothing more. If it's been ~a month since the last dive, offer it in one line; never force it.

---

## Step 1 — Load the Brain + pick the data source
Read `~/realtor-brain/brain.md`, then `identity/profile.md` (channel handle), `identity/strategy.md`
(**competitors they admire** — the seed list; business goals), `identity/market.md` (communities + local
terms — scopes the gap search), `identity/offer.md` (CTA, lead magnets — for the leads read),
`memory/content-log.md` (what each video WAS), `memory/performance.md` (prior subscriber count = growth;
past winners), plus the **YouTube Layer** + **Game Plan** (the 3 pillars + the calendar — the audit is
measured against the plan). `~/realtor-brain/` empty? Pull it with realtor-brain-sync first.

**Pick the data source, best-first — never blocked on any one:**
1. **The live data connection (best)** — if the Composio tools are present, pull the real numbers directly
   (`${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md`, recipes 1/2/3/5: channel stats → the upload
   catalog → per-video views/likes/lengths/dates → competitor channels → gap searches). READ-ONLY, always.
   **First call in a session:** warn in plain words RIGHT BEFORE it — *"quick one — a permission box will
   pop up so I can pull your real YouTube numbers; hit Allow and we're set."* Denied? Fall to #2 silently,
   no re-prompts this session. **Tools present but no YouTube sign-in yet** (the search/execute response says
   "no active connection")? Offer it ONCE, plainly: *"want me to hook into live YouTube data? One sign-in, and
   from then on I pull your numbers automatically."*
   - **Yes** → the ONE place the connection tool is allowed: `COMPOSIO_MANAGE_CONNECTIONS` with
     `{"toolkits":[{"name":"youtube","action":"add"}]}` → put the returned link in your reply as a markdown
     link (*"click this, log into the YouTube account you film on, then come back and say 'done'"*) → on
     "done", call it again with `action: "list"` and confirm the account shows `active` → pull. Record
     `active` in the YouTube Layer.
   - **No / not now** → record `declined [date]` in the YouTube Layer; never re-offer; carry on with #2/#3.
   - **Tools not present at all** (no Composio connector in their Claude) → say it once, plainly: *"the full
     live version needs the 2-minute connector step from your install guide (say 'help' for it) — for now,
     drop a Studio screenshot and I'll run it on that."* Then #2/#3. Never nag.
   Never during setup or the Game Plan, never a bare "list" just to check — this skill is the connection's
   only home.
2. **The Studio export / screenshot** — the ONLY source for private depth (CTR, average view duration,
   retention, traffic sources, search terms). For a deep dive, ask for it once in plain words: *"for the
   full read, grab a screenshot of YouTube Studio → Analytics → Content (or the export) and drop it here."*
   (Export path: Studio → Analytics → Advanced mode → range → Content tab → Export → CSV.)
3. **Public channel reads** — titles, views, lengths, cadence, top performers from the channel link alone.
   Works on ANY public channel (theirs, a competitor's, a channel a coach is testing on).
Plain-talk rule: it's "hook into live data — one sign-in," **never "connect your YouTube channel."**

## Step 2 — Read the metrics + the method
`references/metrics-guide.md` (what each YouTube metric tells you + the funnel diagnosis) — and for a deep
dive, **`references/deepdive-guide.md` in full** (the 4-part structure and the pull method).

---

## THE DEEP DIVE (the main event — run it monthly)
**Window:** default the last 90 days (a month in = since the last dive). State it in one line, then go.
**Follow `references/deepdive-guide.md` in full:**
- **Part 1 — Channel audit:** growth vs. the stored count · every video ranked & tagged by pillar/content
  type with per-type averages · packaging (CTR/title gates/§17 thumbnails) + hook-vs-middle from
  retention · **the funnel leak** (views → clicks → watch → CTA → leads, §23.2) · cadence + pillar coverage
  vs. the plan.
- **Part 2 — Competitors:** 3–5 channels from the Brain (ask once if thin) → outliers by each channel's own
  median (small local overperformers count double) → what they do that the agent doesn't → the positioning
  verdict.
- **Part 3 — Gaps:** demand + weak/stale/non-local coverage (evidence attached) · the starving pillar ·
  repeat-from-new-angle plays · packaging fixes worth doing this week.
- **Part 4 — Synthesis + 30-day plan:** top 3 strengths (with the proving number), top 3 fixes (with the
  specific change), ~8 exact titles on the §22 mix (title gates apply) with type + week, and the one move.

**Deliver it like a coach:** lead with the 3-sentence verdict — *where they stand, the biggest strength,
the biggest fix* — then the scannable detail. End by **offering to act:** *"want me to start the first
video on that plan right now?"* → `youtube-make-video` (new chat). The Coach reads this dive for its
next session.

**Save + seed:**
1. Render the report on the **Deep Dive Report skeleton** (`${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md`) via
   `render_doc.py` — stamped (house rules #9) — and save as **`Deep Dive · [Month YYYY]`** in the
   workspace's **`Performance/`** folder (create it the first time; resolve per
   `${CLAUDE_PLUGIN_ROOT}/skills/youtube-setup/references/drive-structure.md`). Share the link.
2. **Seed `memory/performance.md`** with a dated block: subscriber count, best content type + pillar, the
   3 best hooks, the funnel leak, the competitor gap to attack, the 30-day plan's titles. Push to Drive —
   Ideation reads the winners; the Coach reads the leak.
3. If they have the **content board**, the 30-day plan's next ~2 weeks become the next cards
   (`${CLAUDE_PLUGIN_ROOT}/shared/notion-board-spec.md` window rules — dated cards only).

## QUICK READ (any scoped question, anytime)
For "how's my channel doing", "how did my last video do", "here's my export", "audit this channel: [link]":
1. **Pull only what's asked** from the Step-1 source. Compare each video to the channel's OWN baseline.
2. **Join to what the video was** (`content-log.md` / the plan) so you talk pillars and hooks, not IDs.
3. **Diagnose (metrics-guide):** low CTR → packaging · good CTR, low % viewed → hook/pacing · strong
   across → a proven topic (feed Ideation). Classify by intent (§23.4). Tie every read to one next action.
4. **Leads over views:** ask which videos produced comments, calls, bookings — and push the §23.2 habit:
   *"ask every new lead which video made them reach out, and tell me."*
Deliver in chat; store nothing unless something genuinely notable surfaced (then a short dated block in
`performance.md`).

---

## How you talk about data
- **Plain English first.** "Your relocation video did 3× your usual" — never "4,812 vs a 1,600 mean."
- **Explain each metric the first time** it appears ("click-through rate — how often people who see your
  thumbnail actually click").
- **Always say what it means + what to do.** Numbers without a takeaway is a dashboard.
- **Be honest.** Thin data, a fluke, no Studio export = say so; never invent a benchmark.
- **Encourage.** YouTube compounds slowly — point at real progress.

## Scope — analytics is the connection's ONLY home
The live data connection powers THIS skill and nothing else. Setup, the Game Plan, references, make-video,
comments, the channel page — all run on the classic paths and never touch it (locked after live cold-tests).

## Quality checklist
- [ ] Answer sized to the ask — deep dive only when they asked for the full picture (offered, never forced)
- [ ] Real numbers only, source labelled; empties called unavailable; the agent's own median is the benchmark
- [ ] Every video joined to what it WAS (pillar / content type / hook)
- [ ] Growth computed against the stored count; today's count stored back
- [ ] DEEP DIVE: all 4 parts · the funnel leak named · 3 best hooks quoted · competitors by their own median ·
      gaps evidence-backed · ~8 exact titles on the §22 mix passing the title gates · the one move
- [ ] Report rendered on the skeleton, stamped, saved to Performance/; findings seeded to `performance.md`
- [ ] Led with the 3-sentence verdict; ended with the offer to start the first video
