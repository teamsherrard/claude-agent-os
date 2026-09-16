# Listing Triggers — how the Listing Launch AI Agent fires

*Referenced by `listing-routine`, which owns this file. Other skills read it only to know what will
happen on its own.*

The Market Update agent is **calendar-triggered** — the 1st of the month, every month. A listing
doesn't work that way: it has no fixed date, and every listing is on its own clock. So this agent is
**event-triggered**, implemented as one cheap daily sweep that asks a short list of questions about
every active listing and acts only when the answer is yes.

Most days it fires nothing and says nothing. That's the design, not a failure.

---

## The sweep

Once a day, in the agent's timezone from `identity/operations.md`, read every block in
`~/realtor-brain/memory/listings.md` where **Status is `Active` or `Pending`**, plus
`~/realtor-brain/memory/deadlines.md`. Then run the triggers below in order.

**Skip `Sold`, `Expired`, `Withdrawn`, and `Terminated` entirely — no exceptions.** Nothing fires on
them, nothing is built for them, and they are never mentioned in the morning note. Nagging an agent
about a house they no longer represent is the worst thing this agent can do, and before these
statuses existed it was the default behaviour.

## The triggers

| # | Fires when | What the agent does | Ceiling |
|---|---|---|---|
| **T1 · Photos landed** | `Photos:` changed from `not yet` to a link | Offers TOUR IT and the brochure photo plan — the two things that were blocked on photos | Once per listing |
| **T2 · Launch stalled** | Captured >24h ago · Stage `live now` · `Built:` has no `social` | Builds the just-listed post and the neighbour text, leaves them waiting | Once per listing |
| **T3 · Open house approaching** | `Open house:` is 5 days out · `Built:` has no `openhouse` | Builds the full SHOW IT kit | Once per open house date |
| **T4 · Open house tomorrow** | `Open house:` is tomorrow | Leaves the five day-of story lines and the sign-in question on top | Once per open house date |
| **T5 · Open house done** | `Open house:` was 2 days ago | Leaves the four follow-ups, including the seller update | Once per open house date |
| **T6 · Went quiet** | Stage `live now` · 14 days since `Captured:` · no `Built:` token added in 7 days | Hands to **REVIVE IT** (`listing-revive`) for the honest read. Builds nothing until the read says what's wrong | Once per listing, per 14-day window |
| **T7 · Under contract** | Stage moved to `under contract` | Queues CLOSE IT so the sold content is written *before* closing day, and adds the closing date to `deadlines.md` | Once per listing |
| **T8 · Closing day** | A `deadlines.md` closing date is today | Surfaces the already-written sold content: the post, the thank-you, and the review ask timing | Once per listing |
| **T9 · Weekly seller update** | Status `Active` · 7 days since the last seller update | Hands to **SERVE IT** (`listing-seller`) for the weekly update. **The single highest-retention action in the plugin** | Weekly, per listing |
| **T10 · Offer deadline today** | A `deadlines.md` offer deadline is today | Surfaces the final-calls messages from **SELL IT** (`listing-offers`) — the agents who showed are the ones who move the number | Once per deadline |
| **T11 · Expiry approaching** | The listing agreement ends in 21 days · Status `Active` | Hands to **REVIVE IT** for the expiry conversation — *before* the expiry, while it can still change | Once per listing |

**T6 and T11 are the honest ones.** They exist to tell an agent something isn't working, and they
must never dress that up as an opportunity. They build nothing on their own — they hand to REVIVE IT,
whose first job is an honest read that may well conclude *"this one's fine, be patient."* A trigger
that manufactures a price conversation to look busy is worse than no trigger.

## Rules

**1. Build and wait. Never post, send, or schedule.** The agent's own move, always — same rule as
every other scheduled agent in this system.

**2. Every trigger has a ceiling, and the ceiling is enforced from the Brain.** Write a fired
trigger into the listing block's `Seller notes:`-adjacent log line — `Agent: T3 fired 2026-07-20` —
so a re-run cannot fire it twice. A duplicate open-house kit is worse than none.

**3. One note per day, maximum.** If four triggers fire across three listings, that's **one** short
message, grouped by property. Never four notifications.

**4. Silence is the default.** No listings active, or nothing due? **Say nothing at all.** A daily
agent that reports "nothing to do" every day gets muted in a week.

**5. Nothing fires on a listing the agent archived, or marked `Expired`, `Withdrawn`, or
`Terminated`.** And the sweep never *sets* those statuses itself — moving a listing to expired is the
agent's call, always. If a listing looks long-dead, T6 asks once: *"Is 88 Ridge still yours?"*

**6. A fresh session means the Brain must be pulled first.** The scheduled run starts with an empty
sandbox — pull with `realtor-brain-sync` before reading anything, or the sweep sees no listings and
silently does nothing.

**7. A trigger that needs a connector the agent doesn't have degrades, never fails.** T1 with no
Higgsfield offers FILM IT instead. Never surface a connector error as the day's note.

---

## Provisioning (the check `listing-setup` and `listing-routine` both run)

1. Read `~/realtor-brain/config.md` for a `Listing Launch task:` line.
2. **Line with a task id** → provisioned. Say nothing. Move on.
3. **Line reading `declined`** → they turned it off. Say nothing, never re-offer.
4. **No line** → provision now (below).

**Never ask a question to decide this.** Provisioning is the default; opting out comes after.

**To provision:**
1. **Check existing scheduled tasks first.** A Listing Launch task already there → **adopt it**,
   write its id to `config.md`, done. Never create a twin.
2. Create the task from `${CLAUDE_PLUGIN_ROOT}/skills/listing-routine/references/daily-task-prompt.md`
   **verbatim**, daily at **7:30am in the agent's timezone** — early enough to matter for an open
   house, late enough not to be a 3am note. If `operations.md` names a start-of-day time, use theirs.
3. **Write `Listing Launch task: [id] · daily [time] [tz]` to `config.md` and push the Brain
   immediately.** A crash between creating and writing is how duplicate tasks are born.
4. **Tell them in one line, after the work they actually asked for** — never as an opening:

   > *Also set up: I'll keep an eye on your listings each morning — when an open house is coming up
   > or a launch stalls, I'll have the pieces ready. Say "stop watching my listings" any time.*

## Turning it off
- *"stop watching my listings"* → delete the task, write `Listing Launch task: declined` to
  `config.md`, push, confirm in one line. **Never re-offer.**
- *"pause it"* → pause rather than delete, so the id and history survive.
- *"change the time"* → update the existing task, keep the same id.
- *"is it on?"* → check the task list, answer in one line.
