---
name: shortform-deepdive
description: >
  The Short-Form Deep Dive — the exhaustive, on-demand breakdown the agent runs when they want the WHOLE
  picture, not a quick read. It audits their entire short-form presence in detail (growth, audience make-up,
  every post ranked by format and funnel category, hook + reel-retention patterns, where the funnel leaks,
  cadence), then breaks down their COMPETITORS (deep on YouTube via outlier analysis, surface on Instagram),
  finds the content gaps nobody local is filling, and ends with a concrete next-30-days plan. The short-form
  mirror of a full YouTube channel audit. Reads live Instagram + YouTube data; text + data only, never posts.

  Trigger on: "run my deep dive", "short-form deep dive", "run my analysis", "run my short form analysis",
  "analyze my short form in detail", "full breakdown of my content", "audit my short form", "analyze my
  competitors", "competitor analysis", "where do I stand", "how do I compare to other agents", or any request
  for a thorough/detailed short-form + competitor analysis. (A quick per-post or 2-week read is
  `shortform-analytics`; the monthly one-pager is `shortform-scorecard`.)
---

# Short-Form Deep Dive

The full consult: the agent's entire short-form presence, their competitors, and the openings between them —
ending in a plan they can act on this week. This is the deepest, most detailed thing the system does, and it's
what an agent runs when they ask *"analyze my short-form"* and mean **all of it**.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — plain and warm, and (house rules #8 +
`${CLAUDE_PLUGIN_ROOT}/shared/advisor-playbook.md`) opinionated: this is a coach reading the whole board with
them, not a report generator. Every section ends on **"so what."**

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, then `identity/profile.md` (name, city, **handles**), `identity/market.md`
(neighbourhoods, local terms — scopes the gap search), `identity/avatars.md` (who they want following them),
`identity/content-engine.md` (pillars, platform priority, cadence), `identity/strategy.md` (**competitors they
admire** — the seed list for Part 2), `identity/offer.md` (lead magnets — for the DM/lead read),
`memory/content-log.md` (to tag every post: format / category / hook), and `memory/performance.md` (prior
follower/subscriber counts for growth; past winners). If `~/realtor-brain/` is missing, **pull it first with realtor-brain-sync** — a fresh project just has an
empty local sandbox; the Brain lives in the agent's cloud workspace (Google Drive or OneDrive), located by
ID/marker. Only if the cloud has no Brain either, run **Realtor AI Brain — Setup**.

## Step 2 — Confirm scope + data source (one quick line, then go)
- **Window:** default the **last 90 days**; if they named one, use it. Say which you're using.
- **Data source:** the **live data connection (Instagram + YouTube)** is what makes this deep — it's the only
  source with reel retention + demographics + competitor YouTube data. **Read
  `${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md` §7** for the exact recipes, metrics, and gates.
  READ-ONLY throughout. If the live connection isn't present, tell them plainly that a full deep dive (esp.
  the competitor + retention parts) needs it, offer the one-time sign-in, and meanwhile do as much as Metricool
  + their screenshots allow — never block, never fabricate.
- **Competitors:** seed from `strategy.md`; if there are fewer than 3, ask once for a couple of handles (the
  agents/creators they watch), and optionally discover local ones via search (per the guide).

## Step 3 — Run the deep dive
**Follow `references/deepdive-guide.md` in full** — it is the report structure and the pull method. In order:
- **Part 1 — Account audit:** growth & audience (incl. the locals-vs-agents demographics read), full content
  inventory ranked & tagged (per-format / per-category averages), hook + reel-retention analysis, the funnel
  leak, cadence.
- **Part 2 — Competitor breakdown:** YouTube deep (outlier analysis), Instagram surface (business_discovery),
  TikTok manual, and the positioning verdict.
- **Part 3 — Gaps & opportunities:** the content-gap read (real demand + weak/stale/non-local coverage), format
  and trend openings.
- **Part 4 — Synthesis + 30-day plan:** top 3 strengths, top 3 fixes, and a concrete 4-3-2-1-balanced content
  list seeded from the winning hooks/formats and the gaps.

Interpret every metric with `${CLAUDE_PLUGIN_ROOT}/skills/shortform-analytics/references/metrics-guide.md` and
weigh it against `${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md` (4-3-2-1, HVC, the locals-not-agents rule).

## Step 4 — Deliver it like a coach
Lead with the 3-sentence verdict — *where they stand, their biggest strength, their biggest fix* — then the
detail underneath for the agent (and their VA) who want to go deep. Keep it readable: headers, short lines,
the number that proves each point. It's long by nature — make it **scannable**, never a wall.

End by **offering to act:** *"Want me to build the first 4 pieces of that 30-day plan right now?"* — and hand
the specific bets to `shortform-greenscreen` / `shortform-talkinghead` / `shortform-carousel`.

## Step 5 — Save + seed the Brain
1. **Save the report to Drive** per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: render the structured
   text to a styled `.docx` via `render_doc.py` and upload to `[Agent Name] — Short-Form System/Performance/`,
   named `[YYYY-MM-DD] · Short-Form Deep Dive`. Share the link.
2. **Seed `memory/performance.md`** with a short dated block capturing the headline findings (best format,
   best hook styles, the funnel leak, the competitor gap to attack, and the stored follower/sub counts), then
   push the Brain to Drive — so the everyday workflows and the next scorecard inherit what this found.

---

## Quality checklist
- [ ] Stated the window + data source up front; used the live connection for depth (or was honest about the limit)
- [ ] Part 1 done in full — incl. the **locals-vs-agents demographics** read and per-format/per-category averages
- [ ] Hook analysis used real **skip-rate / watch-time**, and named the 3 best hooks verbatim
- [ ] Named the single biggest **funnel leak**
- [ ] Competitors broken down — YouTube outliers (deep), Instagram business_discovery (surface, honestly labelled), TikTok noted as manual
- [ ] Content gaps backed by evidence (demand + weak/stale/non-local coverage)
- [ ] Ended in a concrete, 4-3-2-1-balanced **30-day plan** and offered to build the first pieces
- [ ] Every number real + cited; empties called unavailable; no invented benchmarks
- [ ] Report saved to Drive (`.docx`) and headline findings seeded to `performance.md`
