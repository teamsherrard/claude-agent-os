---
name: listing-publish
description: >
  Schedules a listing's whole launch through the agent's own posting tool — Metricool by default, or
  GoHighLevel / Buffer. Takes the posts, shorts, and captions the launch already wrote, lays them
  across the real launch window (front-loaded to the first 72 hours, or worked backward from an open
  house date), shows the agent the queue, and schedules it once they say go. Never posts without a
  yes, never queues a HOLD piece, and never schedules a listing whose photos aren't back yet.

  Trigger on: "schedule my listing posts", "queue up my launch", "publish my listing content",
  "schedule the launch for [address]", "post my just listed", "put my listing posts in the queue",
  "schedule my open house posts", "can you post these for me".
---

# Schedule the launch

The launch is written. This puts it in the queue, on the right days, in the right order — so the
agent stops pasting captions between showings.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — plain and warm, never technical.
**Follow the publishing guide** (`${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md`) — it covers
Metricool, GoHighLevel, Buffer, best-time logic, the free-plan cap, media handling, **and the
listing-specific rules at the bottom of that file, which govern this skill.**

---

## Step 1 — Load the Brain and the listing
Read `~/realtor-brain/brain.md`, then `identity/publishing.md` (their posting tool and platforms),
`identity/operations.md` (timezone), and `identity/content-engine.md` (cadence).

(If `~/realtor-brain/` is empty — a fresh session or a different project — **pull it first with
realtor-brain-sync**; it lives in their cloud workspace, located by ID/marker.)

Read the listing block per `${CLAUDE_PLUGIN_ROOT}/shared/listing-schema.md` — address, stage, open
house date, **`Photos:`**, and **`Built:`**. Not on file → hand to **Listing Intake** first.

- **`publishing.md` says manual, or is missing** → hand over the copy-paste-ready posts, mention
  **once** that connecting a tool means you can schedule for them, and stop. Don't nag. This is the
  normal answer for most agents and it's a completely fine one.

## Step 2 — The two hard gates (check before anything else)

**Gate 1 — are the photos back?** If `Photos:` reads `not yet`, queue **nothing**:

> Once the photos are in I'll put the whole week out for you — a just-listed post without photos is
> a wasted post.

**Gate 2 — what's actually written?** Read `Built:`. You can only schedule pieces that exist. If
they want the launch queued and `social` isn't built, say so and offer to build it first:
*"Let me write the posts first — one minute — then I'll queue the whole week."*

## Step 3 — Gather the pieces (never rewrite them)

Collect what the launch already produced — from this conversation, from the listing's Drive folder,
or from the pieces they pasted. **This skill schedules; it never writes.** If a caption needs to
change, hand back to the skill that owns it.

**Leave every HOLD piece out.** `listing-social` writes a price-improvement post and a just-sold
post marked HOLD; `listing-print` writes a Just Sold card the same way. **Never queue one.** They go
out when the thing actually happens, and queuing one early is how a listing gets announced sold
before it is.

## Step 4 — Lay it across the window

A listing is a burst against a real date, not a content calendar.

**Stage `live now`** — front-load the first 72 hours:

| Day | What goes out |
|---|---|
| 1 | Just-listed announcement — feed + stories, every platform |
| 2 | The strongest short |
| 3 | Feature spotlight, or the tour |
| 5 | Second short |
| 7 | Neighbourhood short, or a "still available" feature angle |

**Stage `coming soon`** — teaser on day −3, the neighbour heads-up on day −2, the full announcement
on live day.

**An `Open house:` date on file** — everything works backward from it: invite 5 days out, reminder
the day before, feed post the morning of. **Never schedule a reminder for after the event**, and
hand over the day-of *stories* rather than scheduling them.

Use best-time slots per network when they didn't give times. Space them — never stack three in an
hour.

## Step 5 — Show the queue and get a real yes

**Never schedule without an explicit go-ahead.** Show it as a plain table — day, time, platform,
which post — and ask once:

> Here's the week for 14 Oak. Want me to put it in?

A specific instruction ("queue it all for my best times") **is** the yes. Anything vaguer, confirm.

**Say the free-plan cost before they say yes.** A single listing launch is 8–12 posts across
platforms, and Metricool Free is 20 a month — **one listing eats half the month.** Say it plainly
and offer the trim: the announcement, the best short, and the open house invite are the three that
matter. **Never silently drop a post.**

## Step 6 — Schedule it
Per the publishing guide: confirm the details, create each post with its per-platform caption, media,
and time. If the video can't attach through the connector, use the hybrid path — schedule the caption
and the slot, and tell them plainly to drop the video onto it in the app.

## Step 7 — Confirm, log, and close the loop

Confirm in plain words:

> Done ✅ — 14 Oak's first week is queued: the announcement tonight at 5:10, your top-3 short
> Thursday, and the open house invite Monday. Want me to change any of it?

Then **log it in both places**:
1. A row per post in `~/realtor-brain/memory/content-log.md`, marked `Scheduled` with the date and
   platforms — so the YouTube and Short-Form systems can see this property has been covered and
   don't duplicate it.
2. Append `published` to the listing block's `Built:` line per the schema — so "what's left on
   Maplewood?" and the listing board stay correct.

Then push the Brain to Drive. If `listing-board` has a board, update the card's **Built** chips and
**Next Up**; **scheduled is not published** — flip a status to published only when it actually goes
live or the agent confirms it did.

---

## Rules
- **Never post or schedule without a clear yes.** No silent auto-posting, ever.
- **Never queue a HOLD piece.**
- **Never schedule before photos are back.**
- **Never rewrite a caption here** — hand back to the skill that owns it.
- **Stories are handed over, not scheduled.**
- Everything still works with no connector — copy-paste-ready posts are a complete answer.

## Quality checklist
- [ ] Brain, `publishing.md`, and the listing block read; manual handled gracefully and once
- [ ] **Photos gate** checked — nothing queued against `not yet`
- [ ] **`Built:` gate** checked — only pieces that exist were scheduled
- [ ] Every HOLD piece left out of the queue
- [ ] Window shaped to the stage: front-loaded 72 hours, or worked backward from the open house date
- [ ] No reminder scheduled for after its event; day-of stories handed over, not queued
- [ ] Queue shown as a table and an explicit go-ahead received
- [ ] Free-plan cap said **before** the yes, with a trim offered — no post silently dropped
- [ ] Confirmed in plain words; logged to `content-log.md` **and** `Built: published`; Brain pushed
- [ ] Board updated if one exists — scheduled ≠ published
