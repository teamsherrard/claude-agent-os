---
name: shortform-scorecard
description: >
  The Monthly Short-Form Scorecard — a scheduled 1st-of-month agent that pulls the agent's Instagram +
  YouTube numbers and their DM count into ONE plain-English page: how far they reached, how many followers
  they gained, their best hook and best format, and how many DMs/leads it drove — then writes the winners to
  their Brain so next month's content leans on what worked, and saves a clean report to their Drive. Runs on
  its own every month; also runs on demand. No CRM — leads are measured from Instagram DMs, keyword replies,
  and link clicks. Text + data only; it never posts.

  Trigger on: "run my scorecard", "my short-form scorecard", "monthly scorecard", "how did I do this month",
  "my monthly numbers", "set up my monthly scorecard", "short form scorecard", "turn on my monthly report",
  "stop my scorecard", or offer it once at the end of a first analysis or 2-week review. (Everyday per-post reads are `shortform-analytics`; an exhaustive competitor breakdown is `shortform-deepdive`.)
---

# Monthly Short-Form Scorecard — the 1st-of-the-month agent

One page, once a month, no effort from the agent: *"here's your month."* It answers the only questions that
actually matter — did I reach more people, did I grow, what worked, and did it drive any leads — and quietly
makes the content engine smarter by writing the winners back to the Brain.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — plain and warm, never technical.
This is a report a busy agent reads in 30 seconds, not a dashboard.

> **Two ways it runs:** on its own (a monthly scheduled task, provisioned once — Step A), and on demand when
> the agent says *"run my scorecard"* (skip to Step 1). The build is identical either way.

---

## Step A — Make sure the monthly agent exists (provision once; never ask permission)
Run this the first time the agent touches the scorecard (or at setup). Mirrors the Market System's
auto-schedule pattern:
1. Read `~/realtor-brain/config.md` and look for a `Short-Form Scorecard task:` line.
   - **Present with a task id** → it's on. Say nothing, move on.
   - **Reads `declined`** → they turned it off. Say nothing, never re-offer.
   - **No line** → provision it now (below).
2. **Check the existing scheduled tasks first** — a scorecard task already there → **adopt it** (write its id
   to `config.md`), never create a twin.
3. Create a **monthly** scheduled task for the **1st at 9:00am in the agent's timezone** (from
   `identity/operations.md`), using `${CLAUDE_PLUGIN_ROOT}/skills/shortform-scorecard/references/monthly-task-prompt.md`
   **verbatim** as the task prompt.
4. **Write `Short-Form Scorecard task: [id] · runs 1st 9am [tz]` to `config.md` and push the Brain
   immediately** (a crash between creating and writing is how duplicate tasks are born).
5. Tell them in **one line**, after whatever they actually asked for — never as an opening:
   > *Also on: the 1st of each month I'll drop a one-page scorecard of how your short-form did — say "stop my
   > scorecard" any time.*

The 1st reports the **previous complete month** (all of its data has landed by then).

## Step 1 — Load the Brain + last month's counts
**If `~/realtor-brain/` is empty** (a fresh session, or a different project), pull it first with
**realtor-brain-sync** — the Brain lives in the agent's cloud workspace (Google Drive or OneDrive) and syncs
down, located by ID/marker (never folder name); only if the cloud has none, run **Realtor AI Brain — Setup**.

Read `~/realtor-brain/brain.md`, then `identity/profile.md` (name, city, **handles**),
`identity/content-engine.md` (platform priority, cadence), `identity/offer.md` (**lead magnets** — for the
DM-keyword read), `identity/compliance.md`, `memory/content-log.md` (to name every post: format / category /
hook), and **`memory/performance.md`** — its last block holds last month's **follower + subscriber counts**,
which you subtract from today's to get growth (the APIs return a point-in-time count, not a delta). If there's
no prior block, this is the **baseline month** — say *"first scorecard, so this is your starting line"* and
invent no growth figure.

## Step 2 — Pull the month (live connection, §7)
**Read `${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md` §7** and pull the **previous complete month**.
READ-ONLY — never call a write / DM-send / comment tool.
- **Instagram:** `INSTAGRAM_GET_USER_INFO` (followers now) · `INSTAGRAM_GET_USER_INSIGHTS` (reach,
  profile_views, accounts_engaged, total_interactions, website_clicks; + `follower_demographics` /
  `reached_audience_demographics`, `timeframe=this_month`) · `INSTAGRAM_GET_IG_USER_MEDIA` (rank the month's
  posts) · `INSTAGRAM_GET_IG_MEDIA_INSIGHTS` on the **top and bottom reels** (views, saved, shares +
  `ig_reels_avg_watch_time` + `reels_skip_rate`).
- **YouTube:** `YOUTUBE_GET_CHANNEL_STATISTICS` (`mine=true` → subs, views now) · `YOUTUBE_LIST_CHANNEL_VIDEOS`
  + `YOUTUBE_GET_VIDEO_DETAILS_BATCH` (the month's Shorts, ranked). Cast the string numbers.
- **DMs = leads (no CRM):** `INSTAGRAM_LIST_ALL_CONVERSATIONS` → count conversations **started in the month**;
  surface keyword DMs ("BUYER"/"SELLER"/"RELOCATION"). If `instagram_manage_messages` isn't granted, say *"DMs
  aren't connected yet"* and use `website_clicks` + comment replies as the lead signal instead.
- **Fallbacks (never block, never fabricate):** no live connection → pull what Metricool can (no reel retention
  then) or ask for a screenshot. IG personal/private → say it needs a Business/Creator profile and report
  YouTube + whatever else is available. Empty results = unavailable, not zero-if-you-guess.

## Step 3 — Build the one page (the scorecard)
Interpret with `${CLAUDE_PLUGIN_ROOT}/skills/shortform-analytics/references/metrics-guide.md` and
`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md` (best hook, the 4-3-2-1 read). Keep it to **one page**:
- **The headline line** (fill it in): *"This month you reached **[X]** people, gained **[Y]** followers, your
  best hook was **'[…]'**, and it drove **[N]** DMs."*
- **Reach & growth** — IG reach; follower growth (+Y, or the honest baseline); YT subs/views growth.
- **Engagement** — saves + shares + comments (the pass-it-on signals that drive reach).
- **Top 3 posts** — each with format · hook · views · and, for reels, watch-time / skip-rate — and *why* it won.
- **Weakest post + the one weak link** — hook vs middle vs value vs CTA (use skip-rate to settle hook-vs-middle
  when you have it).
- **Best format + best content category** — green screen / talking head / carousel, and reach / value / trust /
  conversion; is the 4-3-2-1 mix balanced, or all reach and no conversion?
- **Leads** — DM count + keyword DMs + link clicks, honestly labelled. This is the business outcome.
- **One move for next month** — the single highest-leverage change, tied to their numbers. Offer to tee it up
  (*"want me to line up 4 more like your top green screen?"*).
Plain English, encouraging, honest about thin data.

## Step 4 — Write the winners to the Brain (this is what makes it compound)
Append a dated monthly block to `~/realtor-brain/memory/performance.md` (create it if missing), and **store
the counts for next month's growth math**:
```
## [YYYY-MM] Short-Form Scorecard
- Reach: [X] · Follower growth: [+Y] · YT subs: [+Δ]
- Best format: [..] · Best category: [..] · Best hook: [.."..."]
- Leads: [N] DMs ([keywords]) · [clicks] link clicks
- Do more of: [..] · One move next month: [..]
- Stored counts (for next month): followers=[N] · subs=[N]
```
Push the Brain to Drive. The content workflows read the latest block, so next month leans on what worked.

## Step 5 — Save the report to Drive
Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: write the scorecard's structured text, **render it to a
styled `.docx`** via `render_doc.py` (output-standard §3/§6), and upload it to
`[Agent Name] — Short-Form System/Performance/`, named **`[YYYY-MM] · Short-Form Scorecard`**. Share the link.

## Step 6 — Changing / pausing / stopping
- **"change the day/time"** → update the existing task, keep the same id in `config.md`.
- **"pause it"** → pause rather than delete, so the id and history survive.
- **"stop my scorecard"** → delete the task, write `Short-Form Scorecard task: declined` to `config.md`, push,
  confirm in one line, and **never re-offer.**
- **"is it on?"** → check the task list and answer in one line.

## Notes on how the scheduled run behaves
- It runs in a **fresh session**, so it pulls the Brain from Drive first — an unsynced Brain means a run with
  no city and no voice.
- It **never posts, sends, or schedules content** — it builds the page, saves it, and leaves a short note.
- If the live connection isn't available in the scheduled session, it does the best it can from what's
  connected and **says so** — it never fabricates and never fails silently.

## Quality checklist
- [ ] Reported the previous COMPLETE month; growth computed vs last month's stored counts (or an honest baseline)
- [ ] One page, plain English, headline line filled with real numbers — never a number dump
- [ ] Top + weakest posts named with format + hook; reel skip-rate / watch-time used for the hook verdict when available
- [ ] Leads measured from DMs / keywords / link clicks — **NO CRM** — and never invented
- [ ] Winners + stored counts written to `performance.md` and pushed to Drive
- [ ] Report rendered to a styled `.docx` and saved to `Performance/` with the right name
- [ ] Account-gate limits stated honestly (personal IG, DMs not connected, YT counts-not-watch-time)
- [ ] Schedule provisioned once without asking; opt-out left one sentence away
