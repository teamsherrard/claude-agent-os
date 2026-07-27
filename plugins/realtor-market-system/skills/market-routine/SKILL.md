---
name: market-routine
description: >
  Puts the monthly market update on autopilot — the Market Update AI Agent. Sets up a real scheduled
  task that fires on the 1st of every month, pulls the new numbers as soon as the board release lands,
  builds the month's package, and leaves it waiting with a short note so the agent's only job is to
  film. Also teaches the monthly rhythm itself (the Weeks 5–6 routine): what happens on which day,
  how long each part takes, and what to do when the data is late. Adopts an existing task rather than
  creating a twin, and never schedules anything without explicit approval.

  Trigger on: "set up my market routine", "run my market update every month", "automate my market
  update", "the 1st of the month agent", "market update on autopilot", "my monthly market rhythm",
  "schedule my market update", or offer it once at the end of a first successful monthly run.
---

# Market Routine — the 1st-of-the-month agent

The system only pays off if it happens every month. This is what makes it happen without the agent
remembering to make it happen.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — the timing rule (§2) is
the reason this is scheduled for the 1st and not the 15th.

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
| **1st** | The new numbers get pulled the moment the board release lands | The system | — |
| **1st–2nd** | The report, script, shorts, graphic, and distribution pack get built | The system | — |
| **Days 2–5** | **Film the market update** — read the script, share the report on screen | **The agent** | ~30 min |
| **Days 3–6** | Video goes up · newsletter goes out · infographic posts | The agent | ~20 min |
| **Weeks 2–4** | The three shorts and the story set go out on the posting plan | The agent | ~10 min/wk |
| **End of month** | Glance at what performed, so next month's angles improve | Both | ~5 min |

The two rules that make it stick:
- **Film in the first week.** The numbers are freshest, the search traffic is highest, and a market
  update filmed on the 20th is a market update nobody watches.
- **One recording, one month of content.** Everything else is already written. They never sit down
  to "make content" again — they sit down once, to film.

If the board release is late that month, the routine slides — it doesn't get skipped. Late data
beats invented data, always.

## Phase 2 — Offer the automation (once, plainly)

> Want me to just do this on the 1st of every month? I'll pull the new numbers as soon as they're
> out and have everything built and waiting for you — you'd only ever get a note saying it's ready.

If no: leave the rhythm with them, say they can start it any time, and stop. Don't ask twice.

## Phase 3 — Set it up (only with an explicit yes)

1. **Check the existing scheduled tasks first.** If a Market Update task already exists,
   **adopt and update it** — never create a twin.
2. **Create the task:** monthly, on the **1st at 9:00am in the agent's timezone** (from
   `operations.md`), using the prompt in `references/monthly-task-prompt.md` **verbatim**.
3. **Save the task id in `~/realtor-brain/config.md`** and **push the Brain to Drive immediately** —
   a crash between creating and saving is how duplicate tasks get born.
4. **Confirm in one plain line:** *"Done — on the 1st of every month I'll pull [City]'s numbers and
   have your whole package ready. You'll get a note when it's waiting."*

## Phase 4 — Run it once, together
Don't leave them wondering what it'll do. Offer to run this month's package right now by handing to
**Market Run**, so they see the output before the first scheduled fire. This is also how you catch a
missing connector or an empty `market.md` while someone is still at the keyboard.

## Phase 5 — Changing or stopping it
Handle these plainly whenever asked:
- **"Change the day/time"** → update the existing task, keep the same id in `config.md`.
- **"Pause it"** → pause rather than delete, so the id and history survive.
- **"Stop it"** → delete the task, clear the id from `config.md`, push the Brain, and confirm.
- **"Is it on?"** → check the task list and answer in one line.

---

## Notes on how the scheduled run behaves
- It runs in a **fresh session**, so the task prompt pulls the Brain from Drive first. That's why the
  Brain must be synced — an unsynced Brain means a scheduled run with no city and no voice.
- It **never posts, sends, or schedules anything.** It builds and leaves it waiting. Publishing is
  always the agent's own move.
- If the board release isn't out on the 1st, it says so and retries rather than shipping partial-month
  data as a headline (doctrine §2 and §7).

## Quality checklist
- [ ] The rhythm was taught before the automation was offered.
- [ ] Filming in the first week was stated as the rule that makes it work.
- [ ] Existing scheduled tasks checked; an existing task adopted rather than duplicated.
- [ ] Task created only after an explicit yes.
- [ ] Scheduled monthly on the 1st, in the agent's real timezone from `operations.md`.
- [ ] Task prompt used verbatim from `references/monthly-task-prompt.md`.
- [ ] Task id saved to `config.md` and the Brain pushed to Drive immediately.
- [ ] Offered one live run so they see it work before the first scheduled fire.
- [ ] Nothing posts or sends automatically — build-and-wait only.
