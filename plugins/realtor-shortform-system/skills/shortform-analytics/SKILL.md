---
name: shortform-analytics
description: >
  Short-Form Analytics — the ONE data skill of the Short-Form Content OS, powered by the live data
  connection (Instagram + YouTube — the only source with reel watch-time, skip-rate, and demographics),
  with Metricool/GoHighLevel and screenshots as fallbacks so it's never blocked. THE MAIN EVENT is the
  monthly DEEP DIVE: the full breakdown of their entire short-form presence (growth, audience, every post
  ranked by format + funnel category, hook + retention patterns, the funnel leak, cadence), their
  COMPETITORS, the content GAPS nobody local is filling, and a next-30-days plan — saved as a report and
  seeded back to the Brain so every workflow gets smarter. Quick questions work anytime in the same skill
  ("how did this post do", "analyze my ads", "how's my follower growth") — answered at the size of the ask.

  Trigger on: "run my social media deep dive" (the headline command), "run my short-form deep dive", "run my
  instagram deep dive", "run my deep dive", "run my analysis", "run my monthly analysis", "analyze my short form",
  "audit my short form", "full breakdown of my content", "analyze my competitors", "competitor analysis",
  "where do I stand", "how do I compare to other agents", "analyze my posts", "analyze my last [N] posts",
  "analyze my ads", "how did my reels do", "how's my account doing", "what's my data", "my best post",
  "how did this post do", "follower growth", "what's working", "run my 2-week review", "review my
  performance", or any request to analyze short-form performance, competitors, ads, or social data.
---

# Short-Form Analytics — the monthly deep dive + any quick question

One skill for all of it. **The ritual is monthly:** the agent runs their deep dive once a month and gets
the whole picture — their account, their competitors, the gaps, and the next 30 days. Between dives, any
quick question gets a quick answer. Never a dashboard; a coach reading the board with them.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) and the advisor stance
(`${CLAUDE_PLUGIN_ROOT}/shared/advisor-playbook.md`): interpret, don't dump. Every read ends with a plain
takeaway and a recommendation.

**Match the size of the answer to the size of the ask:** "run my social media deep dive" / "run my deep dive" / "run my analysis" / "audit
my short form" / "analyze my competitors" / "where do I stand" → **THE DEEP DIVE** (the full monthly
consult). A scoped question ("how did this post do", "analyze my ads", "how's my growth", "run my 2-week
review") → **QUICK READ** — answer exactly that, nothing more. When in doubt and it's been ~a month since
the last dive, offer the dive in one line; never force it.

---

## Step 0 — The connector check (every deep dive, before anything else)
A deep dive must never fail quietly. Before reading the Brain, look at the tools you actually have in this
session:
- **No Composio tools at all** (nothing named `COMPOSIO_…`) → the agent hasn't added the connector to their
  Claude. Say so plainly, with the exact clicks, give them the choice — then stop and wait:
  > "Quick check before we dive in — your Claude doesn't have the Composio connector yet, so I can't pull your
  > live Instagram and YouTube numbers. It's a one-time, 2-minute step:
  > 1. In Claude, click **Customize** → **Connectors** → **+** → **Add custom connector**
  > 2. Name: **Composio** · URL: **https://connect.composio.dev/mcp**
  > 3. Click **Connect**, approve in the browser window, then come back here and say **'run my social media
  > deep dive'** again — I'll hand you the Instagram and YouTube sign-in links next.
  > Or, if you'd rather skip it for now: drop screenshots of your Instagram insights (and YouTube Studio if you
  > post Shorts) and I'll run the dive on those."
  Once per deep dive (a quick read gets a one-line version of it); never nag; never during setup.
- **Composio tools present, but no active Instagram/YouTube connection** → the offer-once sign-in in Step 1.
- **Present and active** → carry on; nothing to say.

## Step 1 — Load the Brain + pick the data source
**If `~/realtor-brain/` is empty** (fresh session/project), pull it first with **realtor-brain-sync** (the
Brain lives in their cloud workspace, located by ID/marker); only if the cloud has none, run Brain Setup.
- Read `brain.md`, then `identity/publishing.md` (which tool is connected), `memory/content-log.md` (maps
  every post to its format / funnel category / hook — numbers mean little without knowing what the post
  *was*; newer rows carry a `· [funnel: …]` tag), `identity/offer.md` (lead-magnet CTAs, for the
  conversion read), `identity/voice.md` (tone), and `memory/performance.md` (the last block holds prior
  follower/subscriber counts — growth = today's minus those; the APIs return point-in-time counts).
- **For the DEEP DIVE also read:** `identity/profile.md` (city, handles), `identity/market.md`
  (neighbourhoods + local terms — scopes the gap search), `identity/avatars.md` (who they want following),
  `identity/content-engine.md` (pillars, platforms, cadence), `identity/strategy.md` (**competitors they
  admire** — the seed list).
- **Pick the data source, best-first** (use what's connected — never block on any one):
  1. **The live data connection (Instagram + YouTube)** — the deepest source and the only one with
     **reel watch-time + skip-rate + demographics + competitor YouTube data.** If the Composio tools are
     present, prefer it for organic IG/YT reads. **Read
     `${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md` §7** for the exact recipes, metrics, and
     account gates (Business/Creator IG, ≥1,000 followers for per-media insights, YT gives counts not
     watch-time). READ-ONLY — never a write/DM/comment tool. **Tools present but no sign-in yet** (the
     search/execute response says "no active connection")? For a deep dive, say plainly that the full
     version (retention + audience + competitor YouTube) needs it, and offer the one-time sign-in ONCE:
     *"want me to hook into your live Instagram and YouTube data? One sign-in each, and from then on I pull
     your numbers automatically."*
     - **Yes** → the ONE place the connection tool is allowed: `COMPOSIO_MANAGE_CONNECTIONS` with
       `{"toolkits":[{"name":"instagram","action":"add"},{"name":"youtube","action":"add"}]}` → put both
       returned links in your reply as markdown links (*"click each and log in — Instagram has to be a
       Business or Creator account — then come back and say 'done'"*) → on "done", call it again with
       `action: "list"` and confirm `active` → pull. Note `Live data: active [date]` at the top of
       `memory/performance.md`.
     - **No / not now** → note `Live data: declined [date]` there; never re-offer; do what Metricool +
       screenshots allow.
     - **Tools not present at all** → Step 0 already gave them the clicks; if they chose to continue now,
       Metricool + screenshots.
     Never during setup, never a bare "list" just to check — this skill is the connection's only home.
     Never block, never fabricate.
  2. **Metricool** — one call covers all platforms, plus **ads** and best-time. **"Analyze my ads" always
     comes from here** (spend, reach, cost-per-result — the live connection doesn't do ad spend).
  3. **GoHighLevel** — its social statistics, if that's their tool.
  4. **Screenshot / paste** — always works; vision reads it fine. **The system is never blocked on a
     connector.**
  - If both the live connection and Metricool are available: live for depth, Metricool only for
    ads/best-time — don't pull the same organic numbers twice.

## Step 2 — Read the metrics guide
**Read `references/metrics-guide.md`** — what each metric actually tells you and how to turn it into advice.

---

## THE DEEP DIVE (the main event — run it monthly)
**Window:** default the last 90 days (a month in = since the last dive). State it in one line, then go.
**Written for a realtor, not a marketer** — the plain-language rules at the top of
`references/deepdive-guide.md` are mandatory: every finding is *what we found · why it matters to you · do
this · the proof*; every section opens *In plain English:*; numbers in tables, not sentences; every metric
explained the first time it appears (the plain names in `references/metrics-guide.md`); no marketing words
without the plain phrase; long tables in the appendix.

**Pull everything the connection gives** (`shared/composio-data-engine.md` §7 — the full Instagram map —
plus recipes 2, 3 and 7): profile + growth · account insights (reach, profile visits, website + profile-link
taps, follows/unfollows, reactions) · **when your followers are online** (hourly, converted to their
timezone) · the three audiences (followers / reached / engaged by city, age, gender) · every post's insights
(reels: watch time + skip rate; posts: profile actions) · stories live today · comments on the top posts ·
DMs if connected · YouTube Shorts counts · 3–5 competitors (YouTube full; Instagram/TikTok a glance) ·
search rank · AI answer presence · trends + this week's news.

**Follow `references/deepdive-guide.md` in full — the report is built in this order:**
- **READ THIS FIRST** — the 3-sentence verdict · **THE ONE MOVE** (exactly one action, never two) · **do
  these three this week**.
- **YOUR NUMBERS AT A GLANCE** + **what's in this report**.
- **Part 1 — Your account:** 1.1 how you grew · 1.2 what's pulling by format and by job (vs 4-3-2-1) · 1.3
  your best hooks (skip rate) · 1.4 who's watching (locals vs agents) · 1.5 when to post (their own
  followers online) · 1.6 what turns into leads (link taps, profile actions, DMs) · 1.7 stories · 1.8 what
  viewers are saying · 1.9 where views stop turning into DMs · 1.10 how often you post.
- **Part 2 — The other agents in your market** (≤5; YouTube full, Instagram/TikTok a labelled glance).
- **Part 3 — Where you show up when people search.**
- **Part 4 — The openings** (3–5 four-line cards).
- **Part 5 — Your next 30 days:** keep doing · fix · the plan on 4-3-2-1 (one post per row) · **post at**
  the 3 best slots · **total output** vs Mike's 3/wk minimum and daily goal · THE ONE MOVE repeated.
- **Appendix — the full numbers.**

**Deliver it like a coach:** in chat, lead with the 3-sentence verdict and the one move, then the Drive
link. End by **offering to act**: *"want me to build the first 4 pieces of that 30-day plan right now?"* →
hand the bets to greenscreen / talkinghead / carousel.

**Save + seed — then say what you saved (hard gate: never end a dive without this line):**
1. Build the report on the **Deep Dive Report shape** (`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`
   §5b) with the byline + footer line `Powered by Mike Sherrard Coaching Inc Frameworks` (a flagship
   deliverable — never inside copy the agent pastes out). Render to a styled `.docx` (`render_doc.py`) →
   `[Agent Name] — Short-Form System/Performance/`, named `Deep Dive · [Month YYYY]`.
2. **Seed `memory/performance.md`** with a dated block: follower and subscriber counts (the baseline), best
   format + job, best hook styles with skip rates, the 3 best posting slots, the one break in the path to
   DMs, the opening to attack, today's link-tap and DM counts. Push the Brain to Drive — the content
   workflows read this, so the whole system inherits what the dive found.
3. **The closing line, always:** *"Saved to your Drive → Performance / Deep Dive · [Month] (link) · your
   follower baseline is stored · your Brain is updated · live data: active."* If any of those didn't happen,
   say which and why — never imply a save that didn't run.

## QUICK READ (any scoped question, anytime)
For "how did this post do," "analyze my last 10 posts," "analyze my ads," "how's my growth," "run my
2-week review":
1. **Pull only what they asked for**, from the Step-1 source (live connection recipes per
   `composio-data-engine.md` §7; Metricool for ads/best-time; screenshots read by vision).
2. **Join to what the post was** (`content-log.md`) so you talk format/category/hook, not IDs.
3. **Interpret + recommend** (metrics-guide): what's working, why (weak hook vs topic vs timing vs CTA),
   and 1–3 concrete next moves. A couple of clear sentences beats a table.
4. **"Run my 2-week review"** gets the structured mini-read (best post · weakest · best category · best
   format · best hook · what drove DMs) **and appends a dated block to `memory/performance.md`** (pushed
   to Drive) so the system learns between dives. Other quick reads: append to `performance.md` only when
   something genuinely notable surfaced.

---

## How you talk about data
- **Plain English first.** "Your rate-drop reel did 3× your usual views" — never "4,812 impressions vs a
  1,600 mean."
- **Always say what it means + what to do.** Numbers without a takeaway is a dashboard.
- **Be honest.** Thin data, a fluke spike, an account gate (personal IG) — say so; never over-read noise,
  never invent a benchmark.
- **Encourage.** Growth is slow; point at real progress.

## Quality checklist
- [ ] Step 0 connector check ran first; the sign-in was offered once (or the connector clicks given) — never at setup
- [ ] Answer sized to the ask — deep dive only when they asked for the full picture (offered, never forced)
- [ ] Pulled everything §7 gives: growth · account insights · followers online → posting slots · the three
      audiences · every post's insights (skip rate, watch time, profile actions) · stories · comments · DMs if on
      · ≤5 competitors · search rank · AI answer presence · trends/news
- [ ] Every number real and sourced; empties "not available"; the agent's own median is the benchmark
- [ ] Written for a realtor: four-line findings · "In plain English" openers · numbers in tables · every metric
      explained once · no unexplained marketing words · long tables in the appendix
- [ ] READ THIS FIRST has the 3-sentence verdict, exactly ONE move, and three actions for this week
- [ ] 1.4 answers locals-vs-agents plainly; 1.5 gives 3 posting slots in their timezone; 1.9 names the one break
- [ ] Part 5: the 4-3-2-1 plan one post per row + post-at slots + total output vs Mike's minimum and goal
- [ ] Report saved as a styled `.docx` in Performance/ · baseline stored · Brain seeded · the closing line said
- [ ] Ended with the offer to build the first pieces
