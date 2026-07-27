---
name: listing-openhouse
description: >
  SHOW IT — the complete open house kit, built around the real date. Everything before, during, and
  after: the invite post and the countdown, the neighbour invite that fills the room, the agent-to-agent
  heads-up, five day-of story lines timed to the hours, the sign-in question that actually gets a
  phone number, and the 48-hour follow-up messages for the three kinds of people who walked through.
  An open house is a lead event, not a Saturday — this is the kit that treats it like one.

  Trigger on: "open house kit", "I have an open house", "open house for [address]", "promote my open
  house", "open house posts", "how do I get people to my open house", "open house follow up",
  "what do I post the day of the open house", "show it".
---

# SHOW IT — the open house kit

An open house is the only day a listing has strangers walking through it. Most agents post an invite
and hope. This is the whole event: fill it, run it, and follow up while people still remember the
house.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, contact (never ask).
- `identity/voice.md` — every message here goes to a real person; it has to sound like them.
- `identity/content-engine.md` — their platforms, for the posts and stories.
- `identity/operations.md` — their follow-up cadence and signature, if it's set.
- `identity/compliance.md` — disclaimer and licence.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing, and get the date
Read `~/realtor-brain/memory/listings.md` — address, beds/baths/sqft, price, features, status,
open house date. **Never re-ask any of it.** Not on file → **Listing Intake** first.

**No open house date on file?** That's the one thing this kit can't work without. Ask it alone:

> When's the open house — day and time?

Then write it into the listing block so nothing asks again. If they haven't set one, say the honest
thing in one line — *"Saturday 1–3 is the workhorse if you're picking"* — and stop until they choose.

**Already built the social pack?** Reuse its open house invite rather than writing a competing one.
Two different invites for the same event is exactly the inconsistency the house rules forbid.

---

## Phase 1 — Before: fill the room

Everything here is timed backward from the date.

**5 days out — the invite post.** Date, time, address, and the one thing worth the drive. Written for
their platforms. Urgency comes from the date, never from "won't last."

**4 days out — the neighbour invite.** The highest-yield message in the whole kit, because neighbours
come, and neighbours are the ones thinking about selling. Write it two ways:
- **The text / door-knock opener** — short, warm, "before it's open to everyone." Names the street.
- **The printed note** for the mailbox drop, if they'd rather walk it than text it.

**3 days out — the agent-to-agent note.** A quiet message to agents whose buyers fit this home. Plain,
collegial, no pitch. One paragraph.

**2 days out — the buyer-match texts.** Short personal messages to the pipeline and past clients who
match. Written to be edited per person, not blasted — leave `[NAME]` and one line to personalise.

**1 day out — the reminder + countdown.** A story with the native **countdown sticker**, plus a short
feed reminder post.

Deliver these as a small table so the sequence is obvious:

| When | What | Where |
|---|---|---|
| 5 days out | Invite post | Feed, their platforms |
| 4 days out | Neighbour invite | Text or printed note, 20 closest homes |
| 3 days out | Agent-to-agent note | Direct message |
| 2 days out | Buyer-match texts | Text, one at a time |
| 1 day out | Reminder + countdown | Story + feed |

## Phase 2 — Day-of: the five stories

Five story slides timed to the actual hours, each with the text and the native sticker:

1. **Morning** — "Open house today, [time]." Sticker: **countdown** to the start.
2. **Setting up** — the hero room, empty and clean. Sticker: **location**.
3. **Doors open** — one line, the address. Sticker: **link** to the listing.
4. **Mid-event** — the room with people in it, or a detail shot. Sticker: **question** ("What would
   you change first?"). Never a photo where a visitor is identifiable without asking.
5. **Last hour** — "Here till [time]." Sticker: **countdown** to the close, then a DM-starter.

One line of text per slide. Read at a walking pace, one thumb.

## Phase 3 — The sign-in question

The sheet is the whole point of the day, and "name and email" gets fake ones. Write **one question**
that earns a real answer and tells the agent who's actually a buyer:

> Are you looking in this neighbourhood specifically, or seeing what's out there?

Give them three variants to pick from, and one line on why it works. Plus the plain ask that follows a
real answer: *"Want me to send you anything else that comes up on this street?"* — which converts a
signature into permission.

## Phase 4 — After: the 48-hour follow-up

Three different people walked through. Write three different messages, sent within 48 hours:

1. **The genuinely interested** — reference the specific thing they reacted to, offer a private
   showing, ask a direct question about timeline.
2. **The neighbour** — thank them for coming, one honest line about what the market's doing on their
   street, no pitch. This is the one that turns into next year's listing.
3. **The just-looking** — short, useful, no pressure. Offer to send new listings that match. The ask
   is permission, not a meeting.

Plus **the seller update** — a short message to the sellers that night: how many came through, what
people responded to, what's next. Sellers rate agents on communication more than results, and this is
the message most agents forget.

## Phase 5 — Compliance pass

- Fair housing, hard: never describe who the home suits, never "great neighbourhood for [anyone]",
  never schools as code. The neighbour messages get read twice.
- Nothing invented about the home or the market — cite any stat with its source and month.
- No "won't last," no price predictions. Urgency is the date.
- Don't post photos of visitors who haven't agreed to it.
- Disclaimer and licence per `compliance.md`. Unset? Deliver and say so once.
- Banned words: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage.

## Phase 6 — Deliver + save

In chat, in the order they'll use it: **the before sequence** (with the table) → **the five day-of
stories** → **the sign-in question** → **the four follow-ups**. Label the follow-ups clearly as
after-the-event so nothing gets sent early.

Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` as **`Open House Kit — [Street Address]`**
in the listing's folder, and add `Open house kit` to **Built so far**.

End with one plain line:

> Text the neighbours yourself — that's the one that fills the room, and it's the one that turns into
> your next listing.

## Quality checklist
- [ ] Brain and listing block read; nothing re-asked.
- [ ] A real open house date on file — asked alone if missing, written back to the listing block.
- [ ] Existing social-pack invite reused, not duplicated with a competing one.
- [ ] Before-sequence timed backward from the date, delivered as a table.
- [ ] Neighbour invite written both ways — text/door-knock and printed note.
- [ ] Five day-of stories, each with its native sticker, timed to real hours.
- [ ] One sign-in question that earns a real answer, with three variants and the permission ask.
- [ ] Four follow-ups written — interested, neighbour, just-looking, **and the seller update**.
- [ ] Every message personalisable, none blast-shaped.
- [ ] Fair housing pass run twice on the neighbour messages; nothing invented.
- [ ] Saved to the listing's folder and logged in **Built so far**.
