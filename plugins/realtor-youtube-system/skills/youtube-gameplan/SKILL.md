---
name: youtube-gameplan
description: >
  The flagship FIRST deliverable of the Realtor YouTube System — a complete, personalized YouTube Game Plan
  built on Mike Sherrard's frameworks. It audits the agent's existing channel (scaled to however many videos
  they have — 100, 10, 2, or none), picks 3 high-intent content pillars for their market, generates exact
  search-optimized video titles per pillar, reverse-engineers their business goal into a content plan, and
  lays out a 90-day calendar + success metrics — assembled into one premium Google Doc stamped "Powered by
  Mike Sherrard Coaching Inc Frameworks." Runs automatically at the end of setup, or on demand.

  Triggers on "build my game plan", "my youtube game plan", "my youtube strategy", "my channel plan", "map my
  channel", "what's my youtube plan", "refresh my game plan", "give me my youtube strategy", or right after
  setup as the first thing the agent receives.
---

# YouTube Game Plan — the flagship first deliverable

This is the **wow.** The first thing the agent gets after setup: a complete, bespoke YouTube strategy that
makes them feel *"this thing just handed me my entire channel plan, built around my market."* It is built on
**Mike Sherrard's frameworks** and carries his stamp — something a realtor could never get by prompting
Claude themselves, because it fuses Mike's method with THEIR Brain + THEIR channel data.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — especially the credibility stamp (#8),
compliance/Fair-Housing on titles (#2), honest-no-guarantees (#5), and the clean-doc format (#3).

> **The "why not just do it myself" moat:** Mike's frameworks × their Brain (offer, market, avatars, goals) ×
> their real channel data. The premium feel comes from **substance + structure**, delivered as a clean,
> well-structured Google Doc — never visual design. (For a designed PDF, hand a claude.ai/design prompt.)

---

## Step 1 — Load the Brain + the YouTube Layer
Read `~/realtor-brain/brain.md`, then:
- `identity/profile.md` — name, brokerage, market/city, niche.
- `identity/market.md` — communities, price bands, local specifics (the pillars + titles are full of these).
- `identity/avatars.md` — who they serve + the fears/questions they search (pillars are chosen by lead type).
- `identity/offer.md` — offer, USP, CTA, booking link, lead magnets (the plan's conversion path).
- `identity/proof.md` — real wins/results (credibility in the plan; never invented).
- `identity/voice.md` (+ `voice-samples.md`) — write the whole plan in their voice.
- **`identity/strategy.md` — their BUSINESS goals** (deals/year, income, lead targets). This anchors the
  goal-math (Phase 4). If it's empty, ask once for their goal and write it back to the Brain.
- `identity/compliance.md` — disclaimers + claims rules (titles ship publicly).
- **The YouTube Layer** (`Setup/`) — channel URL + status, the 12-month YouTube target, cadence, competitor
  channels, pillars/CTA library.

**Read the Brain; never re-ask what it knows** (house rules). If `~/realtor-brain/` is missing → Brain Setup.

## Step 2 — Read the framework + line up the engines
- `references/gameplan-framework.md` — **the backbone** (Mike's structure, the audit-scaling, pillar logic,
  the exact-title method, the goal-math, the 90-day calendar + metrics, the stamp).
- This skill **orchestrates the existing engines** — don't reinvent them:
  - Audit → `${CLAUDE_PLUGIN_ROOT}/skills/youtube-analytics/SKILL.md` (their channel/CSV/screenshot read)
  - Competitor analysis → `${CLAUDE_PLUGIN_ROOT}/skills/youtube-outliers/SKILL.md`
  - Search/market signals → `${CLAUDE_PLUGIN_ROOT}/skills/youtube-research/references/research-method.md`
  - Pillars + exact titles → `${CLAUDE_PLUGIN_ROOT}/skills/youtube-ideation/references/idea-method.md` + `${CLAUDE_PLUGIN_ROOT}/shared/idea-templates.md`
  - The 4-part video structure → `${CLAUDE_PLUGIN_ROOT}/skills/youtube-script/references/script-framework.md`

## Step 3 — Get the channel data for the audit (scaled — house rules #6 plain talk)
The audit flexes to wherever they are (full detail in the framework). The channel is mostly **public**, so:
- **Active channel** → research the public channel from its URL: titles, view counts, lengths, top performers,
  upload cadence. Offer the deeper read in one plain line: *"Want me to go deeper? Drop a screenshot of your
  YouTube Studio analytics or your export and I'll add your watch-time and click data."* Never required.
- **Empty / none / starting fresh** → skip the audit numbers entirely; lead with competitor analysis + the
  pillars + the launch calendar. (The setup answer already tells you which path.)
Never ask them to "connect YouTube" — public + screenshot/CSV is all it takes.

---

## Phase 1 — The Channel Audit (scaled to their experience)
Per the framework: honest, data-driven, never flattery. 100 videos → full audit (length, titles, missing
pillars) + a head-to-head table vs a real local competitor (from Outliers). 10 → lighter read. 1–2 →
"too early to read much," acknowledge the start. 0 → skip; this becomes a launch plan. Always name the
insight: *"your best-performing content has always been X — there's an audience, they just can't find you."*

## Phase 2 — The 3 Pillars (chosen by LEAD TYPE)
Pick **3 high-intent pillars** from the Brain (niche, market, avatars) + real demand (Research) + what's
winning locally (Outliers). Each pillar targets a specific motivated lead. For each: a short *"why this
pillar generates leads"* (the lead psychology) + a named playlist. (Riya, e.g.: New Construction / Calgary
Market Updates / Relocation to Calgary.)

## Phase 3 — Exact Video Titles per pillar (the gold)
For each pillar, generate **15–20 EXACT, search-optimized titles** (not vague ideas), each annotated with
**Search Intent & Lead Type**, ordered **broad → niche** (highest search volume → highest lead intent). Use
real search language (the "type it into YouTube" test) + the idea-templates + competitor outlier patterns.
**Run every title through compliance/Fair-Housing** (house rules #2) — no "best suburbs for families"-style
proxies; keep them factual and safe, since titles ship publicly.

## Phase 4 — Your Goal → The Plan (the math that builds confidence)
Reverse-engineer their **business goal** (from `strategy.md`) into the content plan, per the framework:
`goal (deals/income) ÷ close rate → leads needed ÷ conversion → views/reach → cadence + pillars → 90-day
milestones.` Show the numbers, **state the assumptions**, and frame it as a **credible path — NEVER a
guarantee** (house rules #2 + #5). Reframe gently: subscribers are a vanity metric unless they convert — tie
subs → leads → deals. This is the section that makes them believe *"this is genuinely possible."*

## Phase 5 — The 4 Strategic Shifts + Video Structure + Playlists
- The **4 strategic shifts** (tailored to their audit): length (10–20 min), search-intent titles, early CTA
  (first 60–90s), playlists per pillar.
- The **4-part video structure** (Hook → Early CTA → Content → Closing CTA) — from `script-framework.md`,
  with their real CTA from the Brain (a call OR a lead magnet — not hardcoded).
- The named **playlists** (one per pillar).

## Phase 6 — 90-Day Calendar + Success Metrics
- A **90-day publishing calendar** at their real cadence (default ~2/week), week by week, mixing pillars,
  front-loading the broadest titles.
- A **success-metrics** block with 90-day targets (view duration, CTR, subs, leads/bookings, ranking) framed
  as **milestones toward their 12-month goal** — not random numbers.

## Phase 7 — Assemble, deliver, save, hand off
1. **Assemble the Game Plan** into one premium Google Doc following the **Game Plan skeleton** in
   `${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md` — Mike's structure, clean bands, the **credibility stamp**
   (byline under the title + footer credit, house rules #8).
2. **Compliance pass** (house rules #2): every title + claim Fair-Housing-safe, disclaimers where needed,
   no guarantees.
3. **Deliver in chat** — a warm, plain-language summary (not the whole doc): *"Here's your YouTube Game Plan
   — your 3 pillars, ~50 ready-to-film titles, and the 90-day plan to hit [their goal]. It's in your Drive."*
4. **Save to Drive** at the workspace root as **`YouTube Game Plan — [Agent]`** (workspace per
   `${CLAUDE_PLUGIN_ROOT}/skills/youtube-setup/references/drive-structure.md`, formatted as the Game Plan
   skeleton in `${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md`) so it's the first thing they see. Confirm the
   location plainly. **Then
   make it the operating strategy (house rules #9):** write the plan's anchors — the **3 pillars + playlists,
   the goal, and the cadence** — into the **YouTube Layer** (`Setup/`), so every other skill (ideation,
   research, scripts, the calendar, the coach) reads them and stays aligned. The full Doc holds the title
   backlog + 90-day calendar; skills open it for that detail.
5. **Optional premium PDF** — offer a ready-to-paste **claude.ai/design** prompt to turn it into a designed
   showpiece (brand colours/fonts from `brand-visual.md`). Words only — never a render.
6. **Hand off:** *"Pick any title from Pillar 1 and say 'make this video' — I'll script it, SEO it, and the
   rest."*

---

## Quality checklist
- [ ] Brain + YouTube Layer read; business goal pulled from `strategy.md`; nothing re-asked
- [ ] Audit scaled correctly to their video count (full / light / minimal / skip-for-fresh)
- [ ] 3 pillars, each chosen by lead type with a "why it generates leads" + a named playlist
- [ ] 15–20 EXACT search-optimized titles per pillar, annotated (intent + lead type), broad→niche
- [ ] **Every title Fair-Housing-safe + compliant** (house rules #2)
- [ ] Goal-math present, assumptions stated, framed as a credible path — **no guarantees** (house rules #2 + #5)
- [ ] 4 shifts + 4-part video structure + playlists + 90-day calendar + metrics-as-milestones
- [ ] Built in the agent's voice; local and specific (why-not-ChatGPT)
- [ ] **Credibility stamp** present (byline + footer, house rules #8)
- [ ] Saved as `YouTube Game Plan — [Agent]` at the workspace root; location confirmed plainly
- [ ] Handed off to "make this video"
