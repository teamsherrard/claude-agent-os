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

  Trigger on: "run my deep dive", "run my analysis", "run my monthly analysis", "analyze my short form",
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

**Match the size of the answer to the size of the ask:** "run my deep dive" / "run my analysis" / "audit
my short form" / "analyze my competitors" / "where do I stand" → **THE DEEP DIVE** (the full monthly
consult). A scoped question ("how did this post do", "analyze my ads", "how's my growth", "run my 2-week
review") → **QUICK READ** — answer exactly that, nothing more. When in doubt and it's been ~a month since
the last dive, offer the dive in one line; never force it.

---

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
     - **Tools not present at all** (no Composio connector in their Claude) → say it once, plainly: *"the
       full live version needs the 2-minute connector step from your install guide (say 'help' for it) —
       for now, drop screenshots of your Instagram insights and I'll run it on those."* Never nag.
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
**Window:** default the **last 90 days** (or what they name — "since last month" = the last ~30). Say which
you're using, in one line, then go.

**Follow `references/deepdive-guide.md` in full** — it is the report structure and the pull method:
- **Part 1 — Account audit:** growth & audience (incl. the locals-vs-agents demographics read), the full
  content inventory ranked & tagged (per-format / per-funnel-category averages), hook + reel-retention
  analysis (real watch-time/skip-rate — name the 3 best hooks verbatim), **the funnel leak**, cadence.
- **Part 2 — Competitor breakdown:** YouTube deep (outlier analysis — the only competitor data the connection
  can pull), Instagram + TikTok by hand (a public-profile glance or the agent's screenshots, labelled as a
  glance, never as their analytics) — and the positioning verdict. Seed competitors from `strategy.md`; fewer
  than 3 → ask once for a couple of handles.
- **Part 3 — Gaps & opportunities:** content gaps backed by evidence (real demand + weak/stale/non-local
  coverage), format and trend openings.
- **Part 4 — Synthesis + the 30-day plan:** top 3 strengths, top 3 fixes, and a concrete 4-3-2-1-balanced
  content list seeded from the winning hooks/formats and the gaps.
Interpret every metric with `references/metrics-guide.md`, weighed against
`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md` (4-3-2-1, HVC, locals-not-agents).

**Deliver it like a coach:** lead with the 3-sentence verdict — *where they stand, the biggest strength,
the biggest fix* — then the scannable detail underneath. End by **offering to act**: *"want me to build the
first 4 pieces of that 30-day plan right now?"* → hand the bets to greenscreen / talkinghead / carousel.

**Save + seed:**
1. Build the report on the **Deep Dive Report shape** (`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`
   §5b — the verdict · scorecard · your account · competitors · gaps · next 30 days, one video per row) with
   the byline + footer line `Powered by Mike Sherrard Coaching Inc Frameworks` (a flagship deliverable —
   never inside copy the agent pastes out). Render to a styled `.docx` (`render_doc.py`) → `[Agent Name]
   — Short-Form System/Performance/`, named `Deep Dive · [Month YYYY]`. Share the link.
2. **Seed `memory/performance.md`** with a dated block: best format, best hook styles, the funnel leak, the
   competitor gap to attack, and today's follower/sub counts. Push the Brain to Drive — the content
   workflows read this, so the whole system inherits what the dive found.

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
- [ ] Answer sized to the ask — deep dive only when they asked for the full picture (offered, never forced)
- [ ] Pulled real numbers (or the screenshot fallback) — never invented; empties called unavailable
- [ ] Deepest source used — live connection reel watch-time/skip-rate for hook judgment where available
- [ ] Numbers joined to what each post WAS (format/category/hook from `content-log.md`)
- [ ] Growth computed against the prior counts in `performance.md`; today's counts stored back
- [ ] DEEP DIVE: all 4 parts · the funnel leak named · competitors honestly labelled by depth · gaps
      evidence-backed · ends in the 4-3-2-1-balanced 30-day plan + the offer to build the first pieces
- [ ] Report saved to Drive as a styled `.docx`; findings seeded to `memory/performance.md`
- [ ] Led with plain-English insight + the why; ended with a recommendation; encouraging throughout
