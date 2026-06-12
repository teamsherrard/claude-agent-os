---
name: youtube-triggers
description: Local-Event Triggers (Newsjacking) for the Realtor YouTube System. Watches the agent's specific market for timely events worth a video while they're hot — interest-rate decisions, new development or community launches, school-ranking changes, major infrastructure, big local news — and turns them into time-sensitive video suggestions flagged "film this week." Reads the AI Brain for communities, niche, and avatars. Runs daily/continuously or on demand. Triggers on "anything timely to film", "local news angles", "newsjack", "what's happening this week in [city]".
---

# Local-Event Triggers (Newsjacking)

Be the "mayor of the town" — catch timely local topics while they matter. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

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
For each relevant trigger, produce a one-line **video angle** tied to an avatar, flagged with urgency:
`"🔥 FILM THIS WEEK — BoC holds rates June 10 → 'What today's rate decision means for Calgary buyers.'"`

## Step 4 — Output
Time-sensitive idea drops → feed **Ideation** (they get a timeliness boost in ranking). Deliver in chat;
nothing stored.

## Rules
- Only surface triggers genuinely relevant to the agent's market/niche/avatars — no national noise.
- Every trigger carries a source + date; flag if it's already old.

## Modes
Checked fresh whenever the agent asks for ideas + on demand ("anything timely to film?").
