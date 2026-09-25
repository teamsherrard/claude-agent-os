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

  Trigger on: "run my YouTube deep dive" (the headline command), "run my deep dive", "run my analysis", "run my monthly analysis",
  "audit my channel", "analyze my channel", "full breakdown of my channel", "analyze my competitors",
  "where do I stand", "how do I compare", "how's my channel doing", "analyze my analytics", "how did my
  last video do", "review my YouTube stats", "here's my YouTube export", "audit this channel: [link]",
  "set up my analytics", "live analytics", "add my Studio numbers", "here's my Studio pack", or any request to
  analyze YouTube performance, competitors, or where they show up in search.
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

## Step 0 — The connector check (every deep dive, before anything else)
A deep dive must never fail quietly. Before reading the Brain, look at the tools you actually have in this
session:
- **No Composio tools at all** (nothing named `COMPOSIO_…`) → the agent hasn't added the connector to their
  Claude. Say so plainly, with the exact clicks, give them the choice — then stop and wait:
  > "Quick check before we dive in — your Claude doesn't have the Composio connector yet, so I can't pull your
  > live YouTube numbers. It's a one-time, 2-minute step:
  > 1. In Claude, click **Customize** → **Connectors** → **+** → **Add custom connector**
  > 2. Name: **Composio** · URL: **https://connect.composio.dev/mcp**
  > 3. Click **Connect**, approve in the browser window, then come back here and say **'run my YouTube deep
  > dive'** again — I'll hand you the YouTube sign-in link next.
  > Or, if you'd rather skip it for now: drop a screenshot of YouTube Studio → Analytics → Content and I'll run
  > the dive on that."
  Once per deep dive (a quick read gets a one-line version of it); never nag; never during setup.
- **Composio tools present, but no active YouTube connection** → the offer-once sign-in in Step 1 (#1).
- **Present and active** → carry on; nothing to say.

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
   - **Tools not present at all** → Step 0 already gave them the clicks; if they chose to continue now, #2/#3.
   Never during setup or the Game Plan, never a bare "list" just to check — this skill is the connection's
   only home.
2. **The Studio pack** — the ONLY source for private depth; the connection cannot read it (capability map
   B: no click-through, watch time, retention, traffic sources, search terms, or who's watching). For a deep
   dive, ask for it ONCE, before pulling, in plain words, and wait for the screenshots or a "skip":
   *"For the full read I need four screenshots from YouTube Studio — takes two minutes: (1) Analytics →
   Content, the video table; (2) Reach → Traffic source types + YouTube search terms; (3) Audience → age,
   gender, top locations, when your viewers are on YouTube; (4) the retention graph of your top 3 videos
   (Engagement). Drop them here — or say 'skip' and I'll run it without, and you can add them any time
   with 'add my Studio numbers'."* Skip → run; the report says exactly what's missing.
3. **Public channel reads** — titles, views, lengths, cadence, top performers from the channel link alone.
   Works on ANY public channel (theirs, a competitor's, a channel a coach is testing on).
Plain-talk rule: it's "hook into live data — one sign-in," **never "connect your YouTube channel."**

## Step 2 — Read the metrics + the method
`references/metrics-guide.md` (what each YouTube metric tells you + the funnel diagnosis) — and for a deep
dive, **`references/deepdive-guide.md` in full** (the 4-part structure and the pull method).

---

## THE DEEP DIVE (the main event — run it monthly)
**Window:** default the last 90 days (a month in = since the last dive). State it in one line, then go.
**Written for a realtor, not a marketer** — the plain-language rules at the top of
`references/deepdive-guide.md` are mandatory: every finding is *what we found · why it matters to you · do
this · the proof*; every section opens *In plain English:*; numbers in tables, not sentences; every metric
explained the first time it appears (the plain names in `references/metrics-guide.md`); no marketing words
without the plain phrase; long tables in the appendix.

**Pull everything the connection gives** (`shared/composio-data-engine.md` — capability map A + C, recipes
1, 2, 3, 7 and S): the channel and every video's full record (description, tags, length, captions flag,
publish time) → the packaging & SEO audit · your own captions for the hooks · playlists + channel sections ·
comment threads (once; 403 → say so) · 3–5 competitors as outliers · 6–10 search phrases for rank · 5–8
buyer questions through the AI answer engine · trends + news · the Studio pack if provided.

**Follow `references/deepdive-guide.md` in full — the report is built in this order:**
- **READ THIS FIRST** — the 3-sentence verdict · **THE ONE MOVE** (exactly one action — the cheapest,
  fastest, most measurable; never two joined by "and") · **do these three this week**.
- **YOUR NUMBERS AT A GLANCE** + **what's in this report** (pulled live · Studio pack in / not · not
  available on this connection).
- **Part 1 — Your channel:** 1.1 how you grew · 1.2 what's pulling by content type · 1.3 titles & thumbnails
  (the automated packaging audit + 3 re-titles) · 1.4 your best openings (verbatim) · 1.5 where viewers come
  from & who they are (Studio pack) · 1.6 what viewers are saying (comments) · 1.7 where views stop turning
  into calls (the one break + the "which video made you reach out?" habit) · 1.8 how often you post & your
  channel page.
- **Part 2 — The other agents in your market** (≤5, each vs its own normal; never an empty row).
- **Part 3 — Where you show up when people search** (YouTube rank · AI answer engine · what's rising + news).
- **Part 4 — The openings** (3–5 four-line cards) + your own winners from a new angle.
- **Part 5 — Your next 30 days:** keep doing · fix · the plan (~8 exact titles, one per row) · **cadence
  math** (total weekly output including any standing series — trimmed to fit 2/wk; standing series count,
  they never sit "on top") · THE ONE MOVE repeated.
- **Appendix — the full numbers** (every video · the packaging check · the search results).

**Deliver it like a coach:** in chat, lead with the 3-sentence verdict and the one move, then the Drive
link. End by **offering to act:** *"want me to start the first video on that plan right now?"* →
`youtube-make-video` (new chat). The Coach reads this dive for its next session.

**Save + seed — then say what you saved (hard gate: never end a dive without this line):**
1. Render the report on the **Deep Dive Report skeleton** (`${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md`) via
   `render_doc.py` — stamped (house rules #9) — and save as **`Deep Dive · [Month YYYY]`** in the
   workspace's **`Performance/`** folder (create it the first time; resolve per
   `${CLAUDE_PLUGIN_ROOT}/skills/youtube-setup/references/drive-structure.md`).
2. **Seed `memory/performance.md`** with a dated block: subscriber count (the baseline for next month's
   growth), best content type + pillar, the 3 best hooks, the one break in the path to calls, the opening to
   attack, the 30-day plan's titles, the search phrases and positions. Push to Drive — Ideation reads the
   winners; the Coach reads the leak.
3. If they have the **content board**, the 30-day plan's next ~2 weeks become the next cards
   (`${CLAUDE_PLUGIN_ROOT}/shared/notion-board-spec.md` window rules — dated cards only).
4. **The closing line, always:** *"Saved to your Drive → Performance / Deep Dive · [Month] (link) · your
   subscriber baseline is stored · your Brain is updated · live data: active."* If any of those didn't
   happen, say which and why — never imply a save that didn't run.

## STUDIO TOP-UP ("add my Studio numbers" — any time after a dive)
The agent drops the Studio pack (any of the four) after the fact:
1. Read the screenshots by vision; join every number to its video by title.
2. Re-open the latest `Deep Dive · [Month YYYY]` source, fill **1.5 where viewers come from & who they
   are**, add the CTR and watch-% columns to appendix A and the CTR verdict in 1.3, re-check the packaging
   re-titles against real click-through, and update **what's in this report**.
3. Re-render and re-save under the **same name** (replace), append a dated note to `memory/performance.md`,
   and say in chat what changed: *"added your Studio numbers — the click-through verdict moved two of the
   three re-titles; the top of the report is unchanged."*

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
- [ ] Step 0 connector check ran first; the sign-in was offered once (or the connector clicks given) — never at setup
- [ ] Answer sized to the ask — deep dive only when they asked for the full picture
- [ ] The Studio pack was asked for ONCE before pulling (or "skip" recorded); nothing private invented
- [ ] Pulled everything the connection gives: full video records → packaging audit · captions → hooks · playlists +
      sections · comments (once) · ≤5 competitors · search rank · AI answer presence · trends/news
- [ ] Every number real and sourced; empties "not available"; the channel's own median is the benchmark
- [ ] Written for a realtor: four-line findings · "In plain English" openers · numbers in tables · every metric
      explained once · no unexplained marketing words · long tables in the appendix
- [ ] READ THIS FIRST has the 3-sentence verdict, exactly ONE move, and three actions for this week
- [ ] 1.7 names the one break in the path to calls AND the "which video made you reach out?" habit
- [ ] Part 5: ~8 exact titles on the §22 mix + the cadence math (standing series counted, plan fits 2/wk)
- [ ] Report saved as a styled `.docx` in Performance/ · baseline stored · Brain seeded · the closing line said
- [ ] Ended with the offer to start the first video
