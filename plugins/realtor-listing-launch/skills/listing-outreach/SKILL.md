---
name: listing-outreach
description: >
  The person-to-person messages that actually move a listing, all written to send — two subject lines
  and a short forwardable email to the agent's database, the "see it before the public" neighbour text
  with a door-knock opener, a quiet agent-to-agent note to the agents whose buyers fit this home,
  buyer-match texts for the pipeline and past clients, and the 3-day follow-up for anyone who came or
  went quiet. Reads the listing from the Brain, so the agent never re-enters the home.

  Trigger on: "email my database about the listing", "text my neighbours", "who should I tell about
  this listing", "outreach for [address]", "let my buyers know about the listing".
---

# Listing Outreach

Ads get impressions; people get showings. Most homes sell to somebody who was already one conversation
away — a neighbour, a buyer in the pipeline, an agent down the hall. You write those messages so the
agent can send them tonight, from their phone, without editing a word.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, contact (never ask for these).
- `identity/voice.md` — how they actually talk. These are personal messages; they have to sound like a
  text from them, not a newsletter.
- `identity/offer.md` — their CTA, so every message ends the way they normally ask.
- `identity/operations.md` — their email signature and how they sign off; use it on the database email.
  If it isn't set, close with their name and contact from the profile.
- `identity/compliance.md` — brokerage disclaimer and licence number, if it's set.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md` and pull the block for this address — beds/baths/sqft, price,
features, the story, the status, the open house date. **Never re-ask any of it.**

- Not on file → hand to **Listing Intake**, then come straight back and build. One short form, once.
- Several listings on file and they didn't name one → ask which address, in one line, and nothing else.
- Status drives the wording: **coming soon** → "before it hits the market"; **live now** → "just
  listed"; **open house** → every message points at the real date.

Also read `~/realtor-brain/memory/clients.md`. If a buyer on file matches this home — price range, beds,
area, what they said they wanted — **name them** in Phase 3 so the agent knows exactly who to text.
Match on what's written down, never on a guess.

---

## Phase 1 — The database email

Write **two subject lines** under 50 characters — one plain ("Just listed on Maplewood"), one curious
("The kitchen on this one is the whole story"). Label which is which. Then the email, 120–180 words,
four beats:
1. **One warm line** in their voice — not "Dear valued client."
2. **The home in two or three lines** — street, beds/baths, price, and the one thing that makes it
   worth a click. Real features from the listing block only.
3. **One reason to care** — the open house date, the coming-soon window, the reno, the street.
4. **The ask, and only one:** *"Know anyone who should see this?"* Forwardable, no pressure, no guilt.

Close with their sign-off from operations, and keep it text-first — no image walls, no six links.

## Phase 2 — The neighbour messages

Neighbours are the best referrers on the street and the next sellers on it. Three pieces:

- **The neighbour text** — for the closest 20 homes. Two or three sentences, max: who they are, what
  just happened on the street, and the invite to see it before the public. One easy question at the
  end — *"Want me to send you the photos before it goes live?"*
- **The door-knock opener** — the first 15 seconds, written as speech. Name, the home, why they're
  standing there, and a question that's easy to answer standing in a doorway: *"Do you know anyone
  who's been trying to get onto this street?"* Then stop talking.
- **The reply follow-up** — one line for anyone who answers, moving them to a real next step: sending
  the photos, the open house time, or a quick chat about what their own home is worth now.

## Phase 3 — Agent-to-agent + buyer matches

This is the quiet part that sells listings before the public ever sees them.

- **Agent-to-agent** — a short professional note to agents whose buyers fit this home: what it is, the
  price, the one feature their buyer would care about, and *"Anyone on your list looking for this?"*
  Three or four lines, colleague to colleague. No hype, no exclamation marks, and never a claim about
  other interest that doesn't exist.
- **Buyer-match text** — for buyers already in their pipeline. If `clients.md` named matches, write the
  message with the specific buyer's stated wish in it ("you wanted a fenced yard on a quiet street")
  and list who to send it to. If nobody matches, write the template and say so plainly.
- **Past-client text** — the people who already trust them. Warm check-in first, the listing second,
  and the one ask: *"Know anyone looking on this side of town?"*
- **The follow-up (3 days later)** — for anyone who came to the open house or replied and then went
  quiet. Short and useful, never chasing: thanks for coming, one honest update on the home, and one
  easy question — *"Still thinking about it, or has something else caught your eye?"* Both answers are
  a fine answer, and the message says so. No fake urgency, no invented offers, no guilt.

## Phase 4 — Compliance pass

Run every message through this before it ships:
- Sell the **property, the lifestyle, and the location**. Never the neighbours, never who would "fit"
  here, never schools as code for anything, never demographics.
- Nothing invented — no room, finish, view, or number that isn't in the listing block. Missing fact the
  message genuinely needs → **[CONFIRM]** and keep going.
- No price predictions, no guarantees, no "won't last," no claim that other buyers are circling unless
  the agent said it's true. Urgency = a real date or nothing.
- Banned words: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage (as a verb).
- These go to people they already know — say once, kindly, at delivery that local anti-spam and
  do-not-call rules still apply.
- Append the brokerage disclaimer and licence number where compliance calls for it. If that file is
  empty, deliver anyway and mention in one line that it's unset.

## Phase 5 — Deliver + save

Deliver in chat as labelled copy blocks — one block per message, in send order, ready to paste from a
phone. Put the named buyer matches at the top so the agent sends those first.

Save to Drive (`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`) as **Outreach — [Street Address]** in
the listing's folder. No Drive connector? Deliver in chat, say kindly that connecting Google Drive means
it saves itself next time, and never block on it. Then update the listing block in
`~/realtor-brain/memory/listings.md` — add `Outreach` to **Built so far** with today's date.

Close warm and short:

> Send the neighbour texts and the buyer matches tonight — those are the ones that turn into showings.
> The database email can go out in the morning. Want the open house kit next?

## Quality checklist
- [ ] Brain and listing block read; nothing re-asked that either one answers.
- [ ] `clients.md` checked — matching buyers named by name, or the gap said plainly.
- [ ] Every message sendable from a phone without editing — no blanks to fill except a first name.
- [ ] Every message names something real about THIS home or THIS street, and asks exactly ONE question.
- [ ] Two subject lines under 50 characters; email 120–180 words, forwardable, signed off properly.
- [ ] Neighbour text, door-knock opener, and reply follow-up all delivered.
- [ ] Agent-to-agent note claims no interest that doesn't exist; the 3-day follow-up has no guilt,
      no chasing, and no fake urgency.
- [ ] Compliance pass run; nothing invented; [CONFIRM] used instead of a guess.
- [ ] Saved to the listing's Drive folder and logged in the listing block.
