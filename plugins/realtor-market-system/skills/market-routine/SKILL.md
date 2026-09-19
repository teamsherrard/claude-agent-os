---
name: market-routine
description: >
  Owns the Market Update AI Agent — the scheduled workflow that runs every month on its own. It is
  provisioned automatically the first time the agent touches this plugin, timed to when their local
  board actually publishes (not blindly the 1st), and it re-times itself as it learns their board's
  real release day. When it fires it pulls the new numbers, builds the whole package — presentation,
  PDF report, three shorts, Instagram infographic + carousel, and the distribution pack — and leaves a short note (six lines at most). This skill also teaches the monthly rhythm (the Weeks 5–6 routine) and handles
  changing, pausing, or turning the schedule off.

  Trigger on: "set up my market routine", "run my market update every month", "automate my market
  update", "the 1st of the month agent", "market update on autopilot", "my monthly market rhythm",
  "schedule my market update", or offer it once at the end of a first successful monthly run.
---

# Market Routine — the 1st-of-the-month agent

The system only pays off if it happens every month. This is what makes it happen without the agent
remembering to make it happen.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the auto-schedule rules** (`${CLAUDE_PLUGIN_ROOT}/shared/auto-schedule.md`) — provisioning,
the release-day rule, self-correction, and how to turn it off. **This skill owns that file.**
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — the timing rule (§2) is
why this runs early in the month rather than mid-month.

> **The agent never has to set this up.** It provisions itself the first time they use the plugin.
> This skill exists for the rhythm, and for when they want to change, pause, or stop it.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, then `identity/operations.md` (**timezone** — the schedule needs
it), `identity/profile.md` (city, name), `identity/content-engine.md` (cadence), and `config.md`
(existing task ids). If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup**.

---

## Phase 1 — Teach the rhythm (do this first, even if they want the automation)

The routine matters more than the automation, because the agent still has to film. Show it as a
table, not a lecture:

| When | What happens | Who does it | How long |
|---|---|---|---|
| **Release day** | The new numbers get pulled the moment the board publishes | The system | — |
| **+1 day** | Deck, PDF report, shorts, infographic, carousel, and distribution pack get built | The system | — |
| **Within 3 days** | **Film the market update** — share the deck on screen and talk through it | **The agent** | ~30 min |
| **+1 day** | Video goes up · newsletter goes out (PDF attached) · infographic posts | The agent | ~20 min |
| **Weeks 2–4** | Shorts, carousel, and story set go out on the posting plan | The agent | ~10 min/wk |
| **End of month** | Glance at what performed, so next month's angles improve | Both | ~5 min |

The two rules that make it stick:
- **Film within three days of the numbers landing.** They're freshest, search traffic is highest, and
  a market update filmed on the 20th is a market update nobody watches.
- **One recording, one month of content.** Everything else is already written. They never sit down
  to "make content" again — they sit down once, to film.

If the board release is late, **the routine slides — it never skips.** The agent gets told, the run
re-checks every two days, and late data beats invented data every time.

## Phase 2 — Confirm the schedule is live (it usually already is)

Run the auto-schedule check (`${CLAUDE_PLUGIN_ROOT}/shared/auto-schedule.md`).

- **Already provisioned** → tell them when it runs and why that day: *"It's already on — runs the 4th
  of each month, because that's when [Board] publishes."* Nothing else to do.
- **Not provisioned** (they declined before, or something failed) → provision it now per that file,
  and say the one line.

**Never ask permission to schedule it.** It's the plugin's default behaviour; opting out is a
sentence away and is handled in Phase 4.

## Phase 3 — Run it once, together
Don't leave them wondering what it'll do. Offer to run this month's package right now by handing to
**Market Run**, so they see the output before the first scheduled fire. This is also how you catch a
missing connector or an empty `market.md` while someone is still at the keyboard.

## Phase 4 — Changing, pausing, stopping
Per `${CLAUDE_PLUGIN_ROOT}/shared/auto-schedule.md`, handled plainly whenever asked:
- **"Change the day/time"** → update the existing task, keep the same id in `config.md`.
- **"Pause it"** → pause rather than delete, so the id and history survive.
- **"Stop it"** → delete the task, write `Market Update task: declined` to `config.md`, push,
  confirm in one line, and **never re-offer.**
- **"Is it on?"** → check the task list and answer in one line.

---

## Notes on how the scheduled run behaves
- It runs in a **fresh session**, so the task prompt pulls the Brain from Drive first. That's why the
  Brain must be synced — an unsynced Brain means a scheduled run with no city and no voice.
- It **never posts, sends, or schedules anything.** It builds and leaves it waiting. Publishing is
  always the agent's own move.
- If the board release isn't out when it fires, it **re-checks every 2 days, up to 3 times** — it does
  not wait a month and it does not ship partial-month data as a headline (doctrine §2 and §7).
- It **learns the board's real release day** from two consecutive months and re-times itself.
- It **does not write the word-for-word script.** The deck's talking points are the recording aid;
  the script is built on request.

## Quality checklist
- [ ] The rhythm was taught, not just the automation.
- [ ] Filming within three days of the numbers landing was stated as the rule that makes it work.
- [ ] Existing scheduled tasks checked; an existing task adopted rather than duplicated.
- [ ] Scheduled to the board's real release day + 1 — never blindly the 1st — in the agent's real
      timezone from `operations.md`.
- [ ] Permission was NOT asked for; opting out was left one sentence away.
- [ ] Task prompt used verbatim from `references/monthly-task-prompt.md`.
- [ ] Task id saved to `config.md` and the Brain pushed to Drive immediately.
- [ ] Offered one live run so they see it work before the first scheduled fire.
- [ ] Nothing posts or sends automatically — build-and-wait only.
