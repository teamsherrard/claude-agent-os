---
name: listing-routine
description: >
  Owns the Listing Launch AI Agent — the morning watch that keeps every listing moving without the
  agent remembering to move it. Unlike a monthly agent, this one is event-triggered: it sweeps the
  active listings each morning and acts only when something is actually due — photos landed, an open
  house is five days out, a launch stalled, a listing went quiet, it went under contract, it closes
  today. Most mornings it fires nothing and says nothing. Also teaches the listing rhythm, and
  handles changing, pausing, or turning the watch off.

  Trigger on: "set up my listing routine", "watch my listings", "automate my listings", "the listing
  agent", "listings on autopilot", "remind me about my listings", "stop watching my listings",
  "is my listing watch on", "change my listing watch".
---

# Listing Routine — the morning watch

A market update happens on a date. A listing happens on *its own* clock — and that's why listings
get dropped. This is the agent that carries the clock.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the trigger rules** (`${CLAUDE_PLUGIN_ROOT}/shared/listing-triggers.md`) — the eight
triggers, provisioning, the ceilings, and how to turn it off. **This skill owns that file.**
**Read the listing schema** (`${CLAUDE_PLUGIN_ROOT}/shared/listing-schema.md`) — the sweep reads
those fields, and it can only fire correctly if the blocks are in one shape.

> **The agent never has to set this up.** It provisions itself the first time they use the plugin.
> This skill exists for the rhythm, and for when they want to change, pause, or stop it.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, then `identity/operations.md` (**timezone** — the schedule needs
it), `identity/profile.md`, and `config.md` (existing task ids). If `~/realtor-brain/` is missing,
**pull it first with realtor-brain-sync**; only if the cloud truly has no Brain do you send them to
**Realtor AI Brain — Setup**.

---

## Phase 1 — Teach the rhythm first

The automation matters less than the habit, because the agent still has to film, knock, and call.
Show it as a table, not a lecture:

| When | What happens | Who does it |
|---|---|---|
| **The day you get it** | Say the address — the launch plan and the first posts get built | The system |
| **That night** | Post the announcement · text the 20 closest neighbours | **The agent** |
| **Days 2–5** | Shorts, the video or the tour, the ad, the postcard order | The system builds · the agent posts |
| **5 days before an open house** | The whole open house kit appears | The system |
| **2 days after** | The follow-ups — including the seller update | The system builds · the agent sends |
| **Under contract** | The sold content gets written and queued | The system |
| **Closing day** | The sold post and the review ask are already waiting | The agent posts |

The two rules that make it work:
- **The neighbours are the agent's job, always.** The single highest-yield action in a launch is a
  text from a real person. The system will never send it for them, and shouldn't.
- **A listing gets its traffic in the first 72 hours.** Everything front-loads for a reason. A
  just-listed post on day five is a post nobody sees.

## Phase 2 — Confirm the watch is live (it usually already is)

Run the provisioning check in `${CLAUDE_PLUGIN_ROOT}/shared/listing-triggers.md`.

- **Already provisioned** → tell them when it runs, in one line: *"It's already on — I check your
  listings each morning at 7:30."* Nothing else to do.
- **Not provisioned** (they declined, or something failed) → provision it now per that file, and say
  the one line.

**Never ask permission to schedule it.** It's the plugin's default; opting out is a sentence away
and is handled in Phase 4.

## Phase 3 — Show them what it'll actually do

Don't leave them guessing. Run the sweep **once, right now**, against their real listings and show
what it would have surfaced this morning:

> If this had run today: 14 Oak's open house is Saturday and the invite isn't written — I'd have
> had the kit waiting for you. Everything else is quiet.

This is also how you catch an empty `listings.md`, a missing timezone, or old-shape blocks while
someone is still at the keyboard. **Nothing on file?** Say so plainly and point them at the intake —
the watch is real, it just has nothing to watch yet.

## Phase 4 — Changing, pausing, stopping
Per `${CLAUDE_PLUGIN_ROOT}/shared/listing-triggers.md`, handled plainly whenever asked:
- **"Change the time"** → update the existing task, keep the same id in `config.md`.
- **"Pause it"** → pause rather than delete, so the id and history survive.
- **"Stop it"** → delete the task, write `Listing Launch task: declined` to `config.md`, push,
  confirm in one line, and **never re-offer.**
- **"Is it on?"** → check the task list and answer in one line.

---

## How the scheduled run behaves
- It runs in a **fresh session**, so the task prompt pulls the Brain from Drive first. An unsynced
  Brain means a sweep that sees no listings and silently does nothing.
- It **builds and waits. It never posts, sends, or schedules.** Publishing is always the agent's own
  move — `listing-publish` does that, and only with a yes.
- **Silence is the default.** Nothing due means nothing said. A daily agent that reports "nothing to
  do" every day gets muted in a week.
- **One note per day, maximum**, grouped by property — never one notification per trigger.
- Every trigger has a **ceiling written back to the Brain**, so a re-run can't build the same open
  house kit twice.
- **T6 (went quiet) never dresses bad news as an opportunity.** It builds nothing and says the plain
  thing. *(When the REVIVE IT stage is built, T6 hands to it instead of notifying.)*
- A trigger needing a connector the agent doesn't have **degrades rather than fails** — no Higgsfield
  means FILM IT is offered instead, and a connector error is never the day's note.

## Quality checklist
- [ ] The rhythm was taught, not just the automation
- [ ] The neighbour text was named as the agent's own job, and the 72-hour rule stated
- [ ] Existing scheduled tasks checked; an existing task **adopted, never duplicated**
- [ ] Scheduled daily in the agent's **real timezone** from `operations.md`
- [ ] Permission was NOT asked for; opting out left one sentence away
- [ ] Task prompt used **verbatim** from `references/daily-task-prompt.md`
- [ ] Task id saved to `config.md` and the Brain pushed to Drive immediately
- [ ] One live sweep run so they saw it work — and an empty `listings.md` handled kindly
- [ ] Nothing posts or sends automatically — build-and-wait only
