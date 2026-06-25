# Game Plan Framework — Mike Sherrard's method, encoded

This is the backbone of the YouTube Game Plan. It follows the structure Mike uses in his real client game
plans. The deliverable reads like a premium coaching document: an honest audit, a clear strategy, exact
titles, and a goal-backed plan. Substance + structure is what makes it feel worth the cohort price — not
visual design.

---

## The document structure (assemble in this order)

**1. Title + stamp**
```
YOUTUBE GAME PLAN — [Agent Name], [City]
Prepared on Mike Sherrard Coaching Inc frameworks  ·  [Month Year]
Powered by Mike Sherrard Coaching Inc Frameworks
```

**2. Executive Summary** — the strategist's overview, in 4 beats:
- **Where they are** — honest snapshot (subs, videos, what's working) — and the verdict. For an active
  channel that underperforms: *"strong output, weak results — the problem isn't effort, it's strategic
  misalignment."* For a fresh channel: *"you're starting with a clean slate and a clear plan — most agents
  never get this far."*
- **The root causes** (active channels) — the specific gaps (too short, titles not search-driven, no pillars).
- **The insight** — *"your best content has always been [X]"* / *"the demand in your market is clearly [X]."*
- **The plan in one line** — focus on **3 high-intent pillars** + the goal: *"…over 90 days, the foundation
  for a channel that generates inbound leads on autopilot — and gets you to [their business goal]."*

**3. Channel Audit** — see "The audit, scaled" below. Honest, data-driven; for active channels include a
head-to-head **comparison vs a real local competitor** (subs · avg views · top video · length), pulled via
the Outliers engine.

**4. Your Goal → The Plan (the math)** — see "The goal-math" below. This is the confidence engine.

**5. The Four Strategic Shifts** — the coaching layer (tailor the framing to their audit):
- **Shift 1 — Video length 10–20 min.** The single biggest lever; watch time is what ranks. (Skip the
  "increase" framing for a fresh channel — just set the standard.)
- **Shift 2 — Titles built around search intent.** Every title answers something a real person types into
  YouTube. The test: if you can type the title into the search bar and expect relevant results, it's good;
  if it reads like a clever social caption, it won't rank.
- **Shift 3 — CTA early (first 60–90s).** Right after the hook, while viewership is highest: introduce, build
  credibility, invite the action (their real CTA from the Brain). A softer CTA repeats at the end.
- **Shift 4 — Organize into playlists.** One playlist per pillar — keeps viewers bingeing, lifts session time
  and subscriber conversion.

**6. The 3 Pillars** — for EACH pillar (see "Pillars" below):
- *Why this pillar generates leads* (the lead psychology — who it attracts and why they convert).
- The search-intent insight (what the audience actually types).
- **15–20 exact titles** in a list: `# · Exact Title · Search Intent & Lead Type`, ordered broad→niche.
- A **named playlist**.

**7. The 4-Part Video Structure** — Hook (0:00–0:30, the viewer's pain, not "welcome back") → Early CTA
(0:30–1:00) → Content (1:00–end, 10–20 min of real value) → Closing CTA (final 60s). Pull the canonical
version from `${CLAUDE_PLUGIN_ROOT}/skills/youtube-script/references/script-framework.md`; include one short
example hook + CTA in the agent's voice.

**8. 90-Day Publishing Calendar** — a week-by-week table at their real cadence (default 2 videos/week),
mixing pillars, front-loading the broadest-reach titles first. Concrete titles in each slot (drawn from §6).

**9. Success Metrics** — a small table: Metric · What it measures · 90-day target. Frame every target as a
**milestone toward the 12-month business goal** (Phase 4), not a random number. Sensible defaults: avg view
duration 40%+, CTR 4–8%, +50 subs/mo, 2–5 leads or booked calls/mo, top-5 for local search terms.

**10. Closing vision + footer** — one short, honest, motivating paragraph (*"stay consistent and here's where
this puts you in 12 months"*), then the footer credit: `Powered by Mike Sherrard Coaching Inc Frameworks`.

---

## The audit, scaled (works for ANY experience level)
The plan must help no matter where the agent is coming from. Scale the audit to their video count:
- **~100 videos (veteran)** → full audit: patterns across the library (length, title style, topic scatter,
  missing pillars), what's actually working, and the competitor comparison table. This is the Mike-style
  turnaround.
- **~10 videos** → lighter read: spot what's resonating and the 2–3 highest-impact fixes; don't over-analyze
  a small sample.
- **1–2 videos** → minimal: *"too early to read much into the numbers"* — acknowledge the start, then pivot
  to the forward plan.
- **0 videos (fresh)** → **no audit.** Open with encouragement, skip straight to competitor analysis +
  pillars + the launch calendar. Frame the whole doc as a launch plan, not a turnaround.

**Data sources (channel is mostly public — never "connect YouTube"):** the public channel via its URL
(titles, views, lengths, top performers); optionally a **screenshot** of YouTube Studio or the CSV **export**
for private watch-time/CTR depth (the Analytics engine handles ingestion). Competitor numbers come from the
Outliers engine (public data). Honest only — never invent a stat.

---

## Pillars — choose by LEAD TYPE
Pick 3 pillars where (a) the agent's Brain shows niche/avatar fit, (b) there's real search demand (Research),
and (c) competitors are already winning (Outliers). Each pillar should attract a **specific motivated lead**:
- **Relocation** — the highest-volume traffic driver for local agents; out-of-state buyers research for weeks.
  *(Honest/"warning"-framed titles outperform here — e.g. "Avoid These 5 [City] Suburbs if You're Moving
  From Out of State." Embrace it.)*
- **Market Updates** — the best seller-lead format; homeowners thinking of selling binge these to time the
  market. Translate data into decisions, never just read stats.
- **A niche pillar** — the agent's specialty (new construction, first-time buyers, probate/inherited,
  downsizers, investors) — lower volume, highest lead intent.
Give each a one-paragraph *"why this pillar generates leads."* Name a playlist per pillar.

## Exact titles — the method (not vague ideas)
- **Search-intent first.** The title mirrors the exact words the audience types. The audience searches the
  *problem* ("Can I sell a house in probate?"), not the service ("probate agent").
- **15–20 per pillar**, ordered **broad → niche**: broadest/highest-search at the top to build views, most
  specific/highest-intent lower (where the real leads are).
- **Annotate each** with *Search Intent & Lead Type* (a one-line "who this captures + why").
- **Use the formulas** in `${CLAUDE_PLUGIN_ROOT}/shared/idea-templates.md` (relocation / comparison /
  price-point / "X vs Y" / "avoid these" / "cost of living" / "best time to buy") and the local angles from
  Research + the winning patterns from Outliers.
- **Sub-group long pillars** (e.g. relocation → General / Suburb-Specific / Audience-Specific).
- **Compliance/Fair-Housing on EVERY title** (house rules #2): titles ship publicly. Keep them factual — no
  "good area," "safe," or "family-friendly"-as-a-proxy framing. "Best Suburbs for Families" → reframe to a
  fact-based angle ("[City] Suburbs With the Top-Rated Schools & Most Green Space"). Never steer.

## The goal-math (the confidence engine — honest, never a guarantee)
Reverse-engineer their **business goal** (`identity/strategy.md`) into the content plan so the videos
visibly ladder up to the deal/income target:
```
Business goal (deals or income)
  ÷ close rate            → qualified leads needed
  ÷ lead-conversion rate  → views / reach needed
  →                       → cadence + the pillars that produce those leads
  broken into             → 90-day milestones they can actually hit
```
- **Use their real numbers** from the Brain (close rate, average deal value). If a number's missing, use a
  **clearly-labelled, conservative assumption** the agent can adjust — never a hidden guess.
- **Show the chain** so it's believable, then translate to milestones: *"That's ~X booked conversations a
  month once you're consistent — your first 90 days get you to [milestone] on the way there."*
- **Honest framing — NEVER a guarantee** (house rules #2 + #5). *"Here's how this is genuinely possible"* — not
  *"you WILL make 20 deals."* Confidence comes from realistic math + small achievable milestones.
- **Reframe vanity metrics:** subscribers only matter if they convert — always connect subs → leads → deals,
  keeping their eye on the business goal.

## Tone + premium feel
Honest, confident, encouraging, specific — a strategist who's done this 100 times, not a hype guru (matches
Mike's calm-authority brand). Bespoke on every line (their market, communities, niche, goal). The premium
feel is the depth + structure + the stamp — delivered as a clean, well-structured Google Doc per
`${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md`. For a designed showpiece, hand a claude.ai/design prompt.
