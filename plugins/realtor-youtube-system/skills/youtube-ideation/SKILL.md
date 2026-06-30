---
name: youtube-ideation
description: Workflow 1 of 2 — Ideation. The realtor's main entry point, and where everything starts — fully ON-DEMAND, the agent asks whenever they're ready for their next batch of content. It asks how many videos they want, pulls fresh market signals right then, and hands back ready-to-film ideas hyper-specific to their market — a BLEND of broad general/relocation ideas and niche-specific ideas, with coverage gaps automatically baked into the batch — each with a title, hook, a short thumbnail text line, and a data-backed "why," in the agent's voice. When the agent picks one, it tells them to open a NEW chat for that video (one chat = one video) and run "Make This Video." Triggers on "what should I film", "find my next video", "give me ideas", "give me video ideas", "ideas for this week", "what to make next", "I want to make a video", "help me with my YouTube".
---

# Workflow 1 — Ideation (where it all starts)

The realtor's front door — **on-demand by design.** They ask when they're ready to create; nothing is
scheduled, nothing can silently break, and the data is fresh at the exact moment they ask. Talk plain +
warm, never technical (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` §6). All machinery runs invisibly.

**Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — ideation runs on
**§3 (S.E.A.R.C.H.: search intent first, exact questions)**, **§8–§14 (the 6 content pillars)**, **§16 (title
principles + formulas)**, **§15 (content mix — blend broad searchable with niche)**, and **§24.1 (the
video-idea output template)**. The "blend" the agent gets is the doctrine's content mix in action: broad
searchable pillar content (~80%) plus the agent's niche (~20% in year one, §15.6); every idea starts from a
real search the buyer/seller would type, not a clever angle.

## Step 1 — Warm welcome + a quick question
Find the scope in one friendly question:
> "Awesome — let's find your next videos. Quick question: how many are you looking to film? Just one or
> two this week, or do you want to batch a few — say 4, so you film two now and two next week?"

## Step 2 — Gather FRESH signals (invisibly, right now)
**Start from the Game Plan (house rules #9):** read the agent's active pillars + goal (YouTube Layer) and
their planned title backlog (the **YouTube Game Plan** Doc) — the next ideas should advance THAT strategy,
not random topics. Then pull, at ask-time so everything's current: the **AI Brain** (market, clientele,
niche), **fresh research** (market data + local news + trends), **local-event triggers**, the **outlier
scan** (if it's been ~a week since the last one), and the **live coverage read** (Videos folders + channel —
what's already made). Also read the agent's **captured idea backlog** (`memory/ideas.md`, tag `youtube`) —
their own on-the-go ideas; bring these into the batch FIRST, and mark each Used once it becomes a video.
The agent only sees one plain line: *"Give me a sec — I'm checking what's happening in your market."*

## Step 3 — Generate the batch (blend + gaps baked in)
Run the engine in `references/idea-method.md` (rubric scored silently, packaging-first), using
`${CLAUDE_PLUGIN_ROOT}/shared/idea-templates.md` + `${CLAUDE_PLUGIN_ROOT}/shared/seo-knowledge-base.md`:
- **Aligned to the Game Plan first (house rules #9):** draw the batch from the agent's active pillars + the
  planned title backlog — advance the strategy and fill its next gaps, not random topics. A timely/off-plan
  idea is fine when a real signal warrants it — tie it to a pillar, or offer to fold it into the plan.
- **A BLEND, always (the doctrine's content mix, §15.6):** broad searchable pillar ideas (relocation,
  community/map tours, market updates, home tours, local lifestyle — the 6 content types in §8–§14) make up
  the bulk (~80%), plus niche-specific ideas from their specialty (~20% in year one). Draw across the six
  content types so the channel isn't all one pillar (§15.1, §28.3).
- **Coverage gaps are baked into the batch automatically** — if a neighbourhood or content type is uncovered,
  one of the ideas simply IS that gap (with its "why"). **Never run a separate "gap" conversation or second
  list** — one list, nothing for the agent to juggle or overthink.
- Hyper-specific to their real market, communities, price points, and the cities people relocate from.

## Step 4 — Present a TIGHT, scannable list (never a wall of text)
In order, plain and friendly. For EACH idea show only TWO lines:
- **The title**
- One line combining the **data-backed "why"** (a real signal — search/trend demand, a dated local event,
  a competitor outlier, lead intent, or a coverage gap) **+ who it's for**. Truthful, no invented numbers.
That's it — no hooks, no thumbnail text here (the engine has already decided them packaging-first; they
surface in Step 1 of Make This Video when she starts that video). If she asks about one, expand just that
one. A batch of 4 should fit on one phone screen.

## Step 5 — Help them choose, then hand off (one chat = one video)
Swap, adjust, lean timely — then when they pick:
> "Love it — open a new chat, name it after this video, and say **'make this video.'** I'll take it from there."

## Month-start bonus (baked in, one light line)
If it's a new month and no Market Report exists yet this month (check the Videos folders), add ONE line
after the ideas: *"Also — want me to build this month's market report deck? You'd just hit record."*
(runs `youtube-market-report`). Skippable, never pushy.

## Modes
**On-demand is the core.** If the agent explicitly enabled the optional Monday Kickoff, it simply runs
this same workflow on a schedule — identical output, no extra features.
