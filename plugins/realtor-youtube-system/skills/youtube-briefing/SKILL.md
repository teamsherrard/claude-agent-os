---
name: youtube-briefing
description: >
  Market Pulse — the weekly Monday Kickoff for the realtor content system. Once a week (Monday morning) it
  reads what's happening in the agent's market — local news, "things to do", new developments, rate moves,
  and what buyers & sellers are asking — and turns it into ONE organized briefing: this week locally, the
  market moves that matter, and a ranked content menu for the week (2 YouTube topics AND 3–5
  short-form/green-screen themes, each with a hook). The agent picks their whole week in 5 minutes. It
  provisions its OWN weekly schedule (no team setup) and also runs on demand; sends one short email from the
  agent's Gmail when connected.

  Triggers on: "set up my market pulse", "turn on my market pulse", "turn on my weekly briefing", "run my
  market pulse", "run my Monday kickoff", "send my kickoff now", "market pulse", "weekly briefing", "my
  content for the week", "stop my market pulse".
---

# Market Pulse — the weekly Monday Kickoff

One Monday briefing that turns *"what's happening in my market this week"* into the week's content — for both
long-form and short-form — so the agent never sits down to a blank screen. Apply
`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

**Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — this is the front of
the doctrine's **weekly workflow (§22.4)** and carries the **cadence (§15.3, §22.4): 2 videos/week ideal,
1/week minimum.** The first Monday of the month leans into the **monthly workflow (§22.5)**.

> **Two ways it runs:** it provisions its own **weekly schedule** (Step A) so it fires every Monday on its
> own, and it also runs **on demand** whenever the agent says *"run my market pulse."* Same briefing either
> way. If the schedule ever fails, nothing is lost — everything here is available by just asking.

---

## Step A — Provision the weekly schedule (it sets itself up; never ask permission)
Mirrors the Market System's auto-schedule pattern — provisioning is the default; **opting out is one sentence
away** (bottom of this step).
1. Read `~/realtor-brain/config.md` for a `Market Pulse task:` line. **A task id** → it's on; say nothing.
   **`declined`** → they turned it off; never re-offer. **No line** → provision now.
2. **`list_scheduled_tasks`** first — if a Market Pulse task already exists, **adopt it** (write its id to
   `config.md`); never create a twin.
3. **`create_scheduled_task`** — `taskId: market-pulse-weekly`, a **weekly** `cronExpression: 0 9 * * 1`
   (Mondays 9:00am in the agent's **LOCAL** time from `identity/operations.md` — no timezone math), and the
   `prompt` set **verbatim** from
   `${CLAUDE_PLUGIN_ROOT}/skills/youtube-briefing/references/weekly-task-prompt.md`.
4. **Verify** — call **`list_scheduled_tasks`** again and confirm the task is there, enabled, with a
   `nextRunAt`. **Not there → say so plainly; never claim a schedule that didn't save.**
5. **Write `Market Pulse task: market-pulse-weekly · runs Mondays 9:00am` to `config.md` and push the Brain
   immediately** (a crash between creating and writing is how duplicate tasks are born). Then, in one line
   after whatever they asked for: *"Also on: every Monday I'll send your Market Pulse — this week's market +
   your content menu. Say 'stop my market pulse' any time."*

**Changing / pausing / stopping:** `update_scheduled_task` to change the day (keep the id); pause = disable;
*"stop my market pulse"* → `delete_scheduled_task`, write `Market Pulse task: declined` to `config.md`, push,
confirm once, never re-offer.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, then `identity/profile.md` (city, niche, handles), `identity/market.md`
(communities, local terms), `identity/operations.md` (**timezone** — the schedule needs it),
`identity/content-engine.md` (pillars, platform priority), `memory/content-log.md` (so ideas stay fresh), and
`memory/performance.md` (lean on what worked). **If `~/realtor-brain/` is empty** (a fresh session or a
different project), pull it first with **realtor-brain-sync** — the Brain lives in the agent's cloud
workspace; only if the cloud has none, send them to **Realtor AI Brain — Setup**.

## Step 2 — Read the market (ONE research pass feeds everything)
Run the gather fresh via `${CLAUDE_PLUGIN_ROOT}/skills/youtube-research` + `${CLAUDE_PLUGIN_ROOT}/skills/youtube-triggers`.
Surface, for the **last 7 days**:
- **This week locally** — things to do, events, new restaurants/spots, top lists (the local-color that pulls
  in locals, not just agents).
- **Market moves** — rate changes, new developments, policy, and what buyers & sellers are suddenly asking.
- Rising **local search interest**.
One pass; don't research twice.

## Step 3 — Build the week's content menu (long-form + short-form)
From that one pass, produce ONE ranked menu:
- **🎬 YouTube (2 topics)** — final title + hook + a one-line data-backed *why*, gaps baked in (via
  `${CLAUDE_PLUGIN_ROOT}/skills/youtube-ideation`).
- **📱 Short-form / green-screen (3–5 themes)** — each a bold hook + the angle + the **source article link**,
  ready to film against. These are the *what*; the agent expands the ones they pick into a film-ready script
  on demand via the Short-Form System's **shortform-greenscreen** (*"give me today's green screen"* with the
  picked theme). This skill does not write the short-form scripts itself.
- **🔥 Timely** — anything worth jumping on this week.

Keep the **4-3-2-1 mix** balanced silently across the menu (reach / value / trust / conversion).

## Step 4 — Deliver + (optional) email
Deliver the briefing in chat — short and skimmable. If Gmail is connected, also send ONE warm email:
```
GOOD MORNING, {Agent} — your Market Pulse

📍 THIS WEEK IN {City}: {1–2 local things worth reacting to}
📊 MARKET MOVES: {the one number or story that matters}
🎬 FILM (YouTube): {topic 1} · {topic 2}
📱 SHORTS: {3–5 green-screen themes, one line each, each with its hook}
🔥 TIMELY: {any local event worth jumping on}
```
The agent picks their 2 YouTube topics + the shorts they want in ~5 minutes — the week's content is decided.

## First Monday of the month — the monthly workflow (§22.5)
The first Market Pulse of each month does a little more (doctrine §22.5): lead with the **market update** as
the #1 film-this-week; a one-line nudge to **review last month's analytics** (hand to Analytics / the Coach);
the reminder to **ask every new lead "which video made you reach out?"**; and point to **one content pillar to
improve** this month.

## Board (optional)
If a Notion Content Dashboard exists (the `Content board:` line in `identity/publishing.md`), the agent can
say *"add these to my board"* → dated cards drop onto the shared board (the YouTube + Short-Form systems share
it). The menu itself is never auto-dumped as undated cards — the board is a schedule, not an idea dump.

## Rules
- ONE short briefing; every idea carries its real *why*; plain, warm tone (house rules §6, §7).
- Cadence (§15.3): 2/week ideal, 1/week minimum — never push volume over quality.
- **One research pass feeds both long-form and short-form** — don't research twice (saves tokens, stays
  consistent).
- **Never post, send content, or schedule content** — it briefs; the agent chooses and films.
