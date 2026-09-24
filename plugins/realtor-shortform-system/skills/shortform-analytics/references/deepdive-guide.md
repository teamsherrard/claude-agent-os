# Short-Form Deep Dive — the full breakdown (structure + method)

The most thorough read the system does: the agent's **entire** short-form presence, their **competitors**, and
the **openings** between the two — ending in a concrete plan. This is the short-form mirror of a full YouTube
channel audit. Interpret everything with `metrics-guide.md` + `mike-frameworks.md`; pull everything from
`composio-data-engine.md` §7. **READ-ONLY** — never call a write / DM-send / comment tool.

**Scope the window:** default to the **last 90 days** (enough posts to see real patterns); honour a window the
agent names. State the window up front.

**The rule for every section: end on "so what."** This is a diagnosis to act on, not a data dump.

---

## Part 1 — The account audit (their own short-form, in full)
Go deeper than the everyday analytics read — this is the diagnostic, not the summary.

### 1a. Growth & audience
- Follower trend + growth rate (vs the counts stored in `performance.md`); YouTube subs trend.
- Reach trend across the window — climbing, flat, or spiky? Tie spikes to specific posts.
- **Demographics (IG `follower_demographics` + `reached_audience_demographics`):** age / city / country / gender
  of both followers and the non-followers reached. The decisive question: **locals vs other agents vs
  out-of-market.** An agent-heavy audience = the agent-bait trap (mike-frameworks §4) — the single most common
  realtor short-form failure.
- Profile-visit → follow conversion: are views turning into follows, or just passing through?

### 1b. Content inventory (every post, ranked & tagged)
- Pull the full window (`INSTAGRAM_GET_IG_USER_MEDIA` + YouTube list/details). Rank by views — and separately
  by **saves**, by **shares**, and by **DMs driven**.
- Tag each post by **format** (green screen / talking head / carousel) and **category** (reach / value / trust /
  conversion) from `content-log.md`.
- Compute per-format and per-category averages: which format drives **reach**, which drives **saves**, which
  drives **DMs** (e.g. *"green screens = 3× your reach; carousels = 2× saves but near-zero DMs"*).
- **4-3-2-1 balance check:** what the mix actually was vs Mike's target — over-indexed on selling? All reach and
  no conversion? Name the imbalance.

### 1c. Hook & retention analysis (the edge no scheduler gives)
- Across all reels, group hooks by style (question / bold claim / contrarian / list / story) and read
  **`reels_skip_rate`** per group → the hook styles that actually hold for THIS agent.
- **`ig_reels_avg_watch_time` vs video length** → where videos lose people, and the ideal length for this agent.
- Name the 3 best-performing hooks **verbatim** and say why each worked.

### 1d. The funnel leak
Walk reach → engagement → profile visits → follows → DMs/clicks and name the **single biggest leak** (e.g.
*"strong reach, weak profile-visit-to-follow — there's no 'follow for more [city] updates' on-screen"*).

### 1e. Cadence & consistency
Posts/week vs Mike's minimum (3×/week; goal daily + daily stories). Gaps, streaks, and best days/times
(Metricool best-time if connected — note the live connection itself doesn't provide best-time).

---

## Part 2 — The competitor breakdown (the part to make excellent)
Identify **3–5 competitors:** start from `identity/strategy.md` (competitors they admire) and
`identity/market.md`; if thin, ask the agent for a few handles once; optionally discover local ones via
`YOUTUBE_SEARCH_YOU_TUBE` / `COMPOSIO_SEARCH_WEB` on the agent's city + "realtor".

### 2a. YouTube competitors — deep (public data, full support)
Per competitor: `YOUTUBE_GET_CHANNEL_ID_BY_HANDLE` → `YOUTUBE_GET_CHANNEL_STATISTICS` (batch) →
`YOUTUBE_LIST_CHANNEL_VIDEOS` → `YOUTUBE_GET_VIDEO_DETAILS_BATCH`. Then read:
- **Outliers** — videos whose views are a multiple of that channel's own median = topics proven to work; a
  small **local** channel overperforming counts double (that's a topic that works *here*, not just a big
  channel being big).
- Their top ~10 short-form topics + hook styles, posting cadence, and format mix.
- **What they do that the agent doesn't** — the transferable moves.

### 2b. Instagram competitors — surface (business_discovery)
Per competitor username via `INSTAGRAM_GET_USER_INFO` (business_discovery edge): follower_count + recent public
media (likes/comments visible). Read their format mix, hook styles, topics, cadence, and which posts beat
*their own* average. **Be honest:** you cannot see a competitor's reach, saves, or watch-time — never present
their public engagement as their "analytics."

### 2c. TikTok — manual glance
The API is authenticated-user-only, so competitor TikTok can't be pulled. If the agent cares, they eyeball 2–3
and you analyze what they screenshot/describe. Say this plainly; don't fake a pull.

### 2d. Positioning verdict
Where the agent stands vs the field — size, cadence, engagement, topic coverage. What's **saturated** (skip it)
and what **nobody local is doing** (claim it).

---

## Part 3 — Gaps & opportunities
- **Content-gap read** (recipe #3 logic): local topics with real demand + weak/stale/non-local coverage →
  specific bets with the evidence attached (*"'moving to [city]' — top result is 2 years old and no agent
  covers it"*).
- **Format opportunities:** formats competitors win with that the agent underuses.
- **Trend/audio** openings if surfaced (secondary signal).

---

## Part 4 — Synthesis + the next-30-days plan
- **Top 3 strengths to double down on** — each with the number that proves it.
- **Top 3 fixes** — the leaks/weaknesses, each with the specific change to make.
- **The 30-day plan:** a concrete content list, balanced to 4-3-2-1, seeded from the winning hooks/formats +
  the gaps found — detailed enough to hand straight to `shortform-greenscreen` / `shortform-talkinghead` /
  `shortform-carousel`. Offer to generate the first few right now.
- **One sentence:** the single most important move.

---

## Honesty rules (non-negotiable)
- Every number is real and cited ("your Instagram, pulled today"); **empty results = unavailable, never
  guessed.**
- Competitor IG/TikTok depth is limited — state it; never dress public engagement up as private analytics.
- Compare to the agent's **own** baseline and the **named** competitors — never to invented industry benchmarks.
- Account gates apply (Business/Creator IG for insights; ≥1,000 followers for per-media; YT = counts, not
  watch-time). If a gate blocks something, say so and press on with what's available.
