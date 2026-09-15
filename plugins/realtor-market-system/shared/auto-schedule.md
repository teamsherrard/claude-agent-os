# Auto-Schedule — the Market Update AI Agent provisions itself

*Referenced from the entry-point skills. When a skill says "run the auto-schedule check," it means this.*

---

## The promise

The agent installs the Market System and the monthly agent **already exists.** They never have to
find it, ask for it, or know it's a "scheduled task." On the 1st of every month their package is
built and waiting.

## The check (run it once, at the start of the first market skill they touch)

1. Read `~/realtor-brain/config.md` and look for a `Market Update task:` line.
2. **Line present with a task id** → it's provisioned. Say nothing. Move on.
3. **Line present reading `declined`** → they turned it off. Say nothing, never re-offer.
4. **No line at all** → this is the first run. Provision it now (below).

**Never ask a question to decide this.** Provisioning is the default; the agent opts out afterwards,
not in.

## Provisioning

1. **Check the existing scheduled tasks first.** A Market Update task already there → **adopt it**,
   write its id to `config.md`, done. Never create a twin.
2. Create the task using `${CLAUDE_PLUGIN_ROOT}/skills/market-routine/references/monthly-task-prompt.md`
   **verbatim**, at the schedule the release-day rule gives you (below).
3. **Write `Market Update task: [id] · runs [day] [time] [tz]` to `config.md` and push the Brain
   immediately.** A crash between creating and writing is how duplicate tasks are born.
4. **Tell them in one line, after the work they actually asked for** — never as an opening:

   > *Also set up: on the [Nth] of every month I'll pull [City]'s new numbers and have your whole
   > package built and waiting. Say "stop my market schedule" any time.*

Do not explain how it works, do not list what it builds, do not ask them to confirm. One line.

## Which day to schedule (the release-day rule)

**Never blindly schedule the 1st.** Boards publish on wildly different days, and a run that fires
before the release finds nothing:

| Board / source | Typical release |
|---|---|
| CREB (Calgary) | 1st–2nd |
| GVR (Vancouver) · FVREB | 2nd–4th |
| TRREB (Toronto) | 3rd–6th |
| Most Canadian boards | 2nd–5th |
| US state/local associations + MLSs | 10th–15th |
| NAR national existing-home sales | ~20th |

- **First run, board release day already known** (this month's research recorded it) → schedule
  **release day + 1**.
- **Not known yet** → schedule the **3rd** as a starting point and let the first successful run
  correct it (below).
- **US agents on state/local data** → start at the **12th**, not the 3rd.

## Self-correcting

Every successful research run records the date the board actually published into that month's data
block (`Board released:`). When the routine sees **two consecutive months** with a release day more
than a day off the current schedule, it **moves the task to release day + 1** and says so in one line:

> *Your board's been publishing on the 4th — I've moved your monthly run to the 5th so the numbers
> are always there.*

Never move the schedule on a single month's evidence; one late release is noise, two is a pattern.

## Turning it off

- *"stop my market schedule" / "turn off the monthly thing"* → delete the task, write
  `Market Update task: declined` to `config.md`, push, confirm in one line. Never re-offer after that.
- *"pause it"* → pause rather than delete so the id and history survive.
- *"change the day"* → update the existing task, keep the same id.
