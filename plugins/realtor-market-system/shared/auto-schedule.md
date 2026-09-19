# Auto-Schedule — the Market Update AI Agent

*Owned by `market-routine`. `market-run` runs the provisioning step at the end of every monthly run.*

---

## The promise

The agent runs the plugin once, and from then on the monthly package **builds itself.** Every month,
the day after their local board publishes, the numbers get pulled and the whole package is built and
waiting — presentation, PDF, shorts, Instagram, newsletter, board cards. They film.

## Why it didn't fire before (read this, it's the whole fix)

The old version said "create the task" and nothing else — it never named the tool, and it ran as a
silent one-liner at the start of a long run, where it got skipped. **Name the tool, do it as a visible
step, and verify it exists afterwards.** A schedule that's "probably" set up is a schedule that isn't.

---

## The tools (Cowork / the Claude desktop app)

| Job | Tool | Key fields |
|---|---|---|
| See what already exists | `list_scheduled_tasks` | — |
| Create the monthly agent | `create_scheduled_task` | `taskId`, `title`, `description`, `cronExpression`, `prompt` |
| Change day, pause, resume | `update_scheduled_task` | `taskId` + only the fields changing (`cronExpression`, `enabled`) |
| A one-time re-check | `create_scheduled_task` with `fireAt` | an ISO timestamp — fires once, then disables itself |
| Run it now | `run_scheduled_task` | `taskId` |
| Turn it off | `delete_scheduled_task` | `taskId` |

- **`cronExpression` is in the agent's LOCAL time.** No timezone math. `0 9 3 * *` = the 3rd of every
  month at 9:00am wherever they are.
- **The `prompt` must be fully self-contained** — each run starts fresh with no memory of this chat.
  Use `${CLAUDE_PLUGIN_ROOT}/skills/market-routine/references/monthly-task-prompt.md` **verbatim**.
- **No scheduling tool in this session?** Don't fake it and don't skip it silently. Tell them in one
  plain line: *"I can't set up the monthly schedule from here — open Claude on your desktop and say
  'set up my market routine', and it'll do it in one step."* Write nothing to `config.md`.

---

## Provisioning (the last step of the first monthly run — visible, never silent)

1. **Read `~/realtor-brain/config.md`** for a `Market Update task:` line.
   - `declined` → they turned it off. Skip, say nothing, never re-offer.
   - A task id → call `list_scheduled_tasks` and confirm it still exists and is enabled. It does →
     done, say nothing. It's gone → treat as "no line."
   - No line → provision now.
2. **`list_scheduled_tasks` first.** A task whose id starts `market-update` already exists → **adopt
   it**; write its id to `config.md`. Never create a twin.
3. **Create it:**
   - `taskId`: `market-update-monthly`
   - `title`: `Monthly Market Update — [City]`
   - `description`: `Builds the whole monthly market update package the day after [Board] publishes`
   - `cronExpression`: `0 9 [release day + 1] * *` (the release-day rule below)
   - `prompt`: the task prompt, verbatim
4. **Verify.** Call `list_scheduled_tasks` again and confirm the task is there, enabled, with a
   `nextRunAt`. Not there → say so plainly; never claim a schedule that didn't save.
5. **Write** `Market Update task: market-update-monthly · runs the [Nth] at 9:00am` to `config.md`
   and **push the Brain immediately** — a crash between create and write is how twins are born.
6. **Tell them, as its own short moment at the end:**

   > *Last thing — your monthly agent is set up. On the **[Nth] of every month** (the day after
   > [Board] publishes), I'll pull [City]'s new numbers and build this whole package again, waiting
   > for you. **Claude needs to be open on your computer that day** — if it's closed, it runs the next
   > time you open it. Say "stop my market schedule" any time.*

   The "Claude needs to be open" line is not optional — otherwise they'll think it broke.

**Permission pop-up:** the app may ask them to approve the task. Tell them to click **Allow**. If they
decline it, write `declined` and move on.

---

## Which day (the release-day rule)

**Never blindly the 1st.** Boards publish on different days, and a run that fires before the release
finds nothing.

| Board / source | Typical release | Schedule on |
|---|---|---|
| CREB (Calgary) | 1st–2nd | the **3rd** |
| GVR (Vancouver) · FVREB | 2nd–4th | the **5th** |
| TRREB (Toronto) | 3rd–6th | the **7th** |
| Most Canadian boards | 2nd–5th | the **6th** |
| US state/local associations + MLSs | 10th–15th | the **15th** |
| NAR national existing-home sales | ~20th | the **21st** |

- This month's research recorded `Board released:` → schedule **release day + 1**.
- Not known → use the table above for their board. Unknown board, Canada → the **6th**; US → the **15th**.
- Cap at the **28th** so it fires in February too.

So "when does it run?" has a real answer: **early in the month for most Canadian agents, the second
week for most US agents** — whenever their numbers actually exist.

---

## When the board is late (the retry ladder — it must actually be able to run)

A monthly task **cannot wait two days** inside a run. So when the release isn't out yet, the run
schedules its own follow-ups:

1. Create a **one-time** task: `create_scheduled_task` with `fireAt` = now + 2 days (same time of day,
   with their timezone offset), `taskId` `market-update-retry-YYYY-MM-1`, same prompt.
2. That run checks again. Still not out → another one-time task at +2 days (`…-2`), then `…-3`.
3. After the third miss, stop retrying. Tell them plainly and ask whether to run on the most recent
   complete month.
4. When the numbers are found, **the retry run builds the package** — the monthly task will fire
   again next month as normal.

One-time tasks disable themselves after firing; nothing to clean up. **Never silently skip a month.**

## Self-correcting

Every successful run records `Board released:` in that month's data block. **Two consecutive months**
more than a day away from the schedule → `update_scheduled_task` with the new `cronExpression`
(release day + 1), update the `config.md` line, and say one line:

> *Your board's been publishing on the 4th — I've moved your monthly run to the 5th.*

One late month is noise; two is a pattern.

## Turning it off, changing it

- *"stop my market schedule"* → `delete_scheduled_task`, write `Market Update task: declined`, push,
  confirm in one line. Never re-offer.
- *"pause it"* → `update_scheduled_task` with `enabled: false`. The id and history survive.
- *"change the day"* → `update_scheduled_task` with the new `cronExpression`; same id.
- *"is it on?"* → `list_scheduled_tasks`, answer in one line with the next run date.
- *"run it now"* → `run_scheduled_task`.
