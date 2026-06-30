---
name: youtube-triggers
description: Local-Event Triggers (Newsjacking) for the Realtor YouTube System. Watches the agent's specific market for timely events worth a video while they're hot — interest-rate decisions, new development or community launches, school-ranking changes, major infrastructure, big local news — and turns them into time-sensitive video suggestions flagged "film this week." Reads the AI Brain for communities, niche, and avatars. Runs daily/continuously or on demand. Triggers on "anything timely to film", "local news angles", "newsjack", "what's happening this week in [city]".
---

# Local-Event Triggers (Newsjacking)

Be the "mayor of the town" — catch timely local topics while they matter. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

> **Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — route every trigger
> using the doctrine's vocabulary (a content **pillar** §8, an **avatar**, **search intent** §3) and correct
> **misalignment patterns** as they appear (§28). Timeliness raises ranking, but it never overrides search
> intent: a trigger only earns a video if real buyers/sellers would *search* it (§28.1 too-clever → §3 S;
> §28.6 too-broad title; §28.4 chasing the spike/views). When you turn a trigger into a title or hook, use the
> **§29 prompt patterns** (topic generation §29.1, hook §29.3) — a searchable, market-specific title, not a
> news-headline slogan.

## Step 1 — Scope from the AI Brain
The agent's city + specific communities, niche, price band, and avatars (so triggers are relevant — a
rate change matters to buyers; a new school matters to upsizing families).

## Step 2 — Watch for triggers (web search; see research-method patterns)
- **Rates / policy:** central-bank decisions, big mortgage-rate moves.
- **Development:** new community launches, builder incentives, major projects, rezoning.
- **Infrastructure:** transit, roads, utilities (e.g., a water pipeline unlocking growth).
- **Schools:** new schools, ranking changes, catchment changes.
- **Big local news:** employer moves, population milestones, events.

## Step 3 — Turn each trigger into a timely idea
For each relevant trigger, produce a one-line **video angle** tied to an **avatar + content pillar**, written
as a **search-intent title** (what that buyer/seller would type — §3 S, §29.1), not a clever news slogan,
flagged with urgency:
`"🔥 FILM THIS WEEK — BoC holds rates June 10 → 'What today's rate decision means for Calgary buyers.'"`
Map the trigger to its natural pillar (a rate move → market update; a new community/build → relocation or
community tour) so it folds cleanly into the plan, not random one-off news (house rule #10).

## Step 4 — Output
Time-sensitive idea drops → feed **Ideation** (they get a timeliness boost in ranking). Deliver in chat;
nothing stored.

## Rules
- Only surface triggers genuinely relevant to the agent's market/niche/avatars — **no national noise**
  (§1.5: stay market-specific; §28.4: don't chase a spike for views over real local intent).
- Search intent still rules (§28.1, §28.6): a trigger that no one would search isn't a video — drop it or
  reframe it into a question buyers/sellers actually ask.
- Every trigger carries a source + date; flag if it's already old.

## Modes
Checked fresh whenever the agent asks for ideas + on demand ("anything timely to film?").
