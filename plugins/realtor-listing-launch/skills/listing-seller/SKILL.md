---
name: listing-seller
description: >
  SERVE IT — the seller communication layer, and the reason listings get renewed instead of expiring.
  Logs showings and what people actually said, writes the weekly seller update that most agents never
  send, and builds the marketing report that proves — item by item — everything that's been done for
  the property. Sellers rate their agent on communication far more than on results, and this is the
  only skill in the system whose whole job is that.

  Trigger on: "log a showing", "showing feedback", "we had 3 showings", "what did the feedback say",
  "weekly seller update", "update my seller", "send my seller an update", "my seller wants to know
  what I'm doing", "marketing report", "what have I done for this listing", "prove my value",
  "seller report for [address]".
---

# SERVE IT — keeping the seller

A listing is lost long before it expires. It's lost in the third week of silence, when the seller
decides nobody's working. This is the skill that stops that — and it runs on information nothing
else in the system captures.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Read the schema** (`${CLAUDE_PLUGIN_ROOT}/shared/listing-schema.md`) — this skill owns the
`Showings:` and `Feedback:` fields, and everything downstream depends on them.

---

## Step 1 — Load the Brain and the listing
Read `~/realtor-brain/brain.md`, then `identity/profile.md`, `identity/voice.md` (the seller knows
how they write — this has to sound like them), and `identity/operations.md` (signature, cadence).

Read the listing block: price, price history, stage, `Built:`, `Showings:`, `Feedback:`, open house.
**Never re-ask the property.** Not on file → **Listing Intake** first.

(If `~/realtor-brain/` is empty — a fresh session — **pull it first with realtor-brain-sync**.)

---

## Job 1 — Log a showing and its feedback

The agent says it in passing: *"had three showings, everyone loves the yard but says the kitchen's
dated."* Take it and file it. **One line back, never a form.**

Write to the listing block:
- **`Showings:`** — increment the count, update the last date.
- **`Feedback:`** — add each theme with a running count: `kitchen dates it (×3)`. **Group by theme,
  don't list every comment** — three people saying the kitchen is dated is one fact with a number on
  it, and that number is what makes the price conversation possible later.

Rules:
- **Quote what showing agents said. Never name the visitors**, and never record anything about who
  they were — fair housing applies to a private note exactly like a public caption.
- **Never soften it.** "Priced high" goes in as "priced high." Sanitised feedback is useless in six
  weeks when it's the evidence.
- **Never invent a theme** or infer one from silence. No feedback is its own data point.

Confirm in one plain line: *"Logged — that's 7 showings now, and the kitchen's come up three times."*
Then push the Brain.

## Job 2 — The weekly seller update

The highest-retention message in real estate, and the one most agents skip. Short, honest, sendable.

Five parts, in this order:
1. **What happened this week** — showings, the open house, the enquiries. Real numbers from
   `Showings:`, never a vague "lots of interest."
2. **What people said** — the themes from `Feedback:`, stated plainly. **Including the hard one.**
   A seller who hears "three people mentioned the kitchen" from you isn't surprised by the price
   conversation later.
3. **What I did** — this week's marketing, from `Built:`. Concrete: *"your video went up, the
   neighbourhood short went out Thursday, and the ad reached 2,400 people in the area."*
4. **What's next week** — one or two specific things, with days.
5. **One question** — anything needed from them, or a plain *"anything you want me to change?"*

Rules:
- **150–250 words.** A seller update nobody reads isn't an update.
- **Never pad a quiet week.** *"Two showings, both said the same thing about the price, and I want to
  talk about that this week"* is a better message than a paragraph of activity. Sellers can tell.
- **Never promise a result**, never predict a sale date, never say "I'm confident we'll get an offer."
- Sign off with their signature from `operations.md`.

**No feedback logged yet?** Say so honestly rather than writing a hollow update: *"I don't have
showing notes for this week — give me the gist and I'll write it in two minutes."*

## Job 3 — The marketing report (the "prove my value" document)

The seller asks *"what exactly are you doing for my house?"* — usually at week six, usually right
before they get nervous. Everything needed to answer is already in `Built:`.

Build it from what actually happened. **Never claim a piece that isn't in `Built:`.**

| Section | What goes in it |
|---|---|
| **The property** | Address, list price, days on market, price history if there is one |
| **What's been built** | One line per `Built:` token, in plain English — the MLS description, the posts, the video, the tour, the shorts, the postcard, the open house kit. Each with its date |
| **Where it's been seen** | The platforms it went out on, the ad reach if there was an ad, the open house attendance |
| **What the market said** | Showings, and the feedback themes with their counts |
| **What's next** | The specific next actions, with dates |

- **Plain English, no jargon** — this is read by a homeowner, not a marketer.
- **Numbers or nothing.** "Extensive social media marketing" is what every other agent's report says.
  "Nine posts, three videos, 2,400 people reached in your neighbourhood" is why they renew.
- **No result claims and no forecasts.** The report says what was done, not what it will produce.
- Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` as **`Marketing Report — [Street
  Address]`**, render it to `.docx`, and append `sellerreport` to `Built:`.

**This report is also the honest setup for a price conversation.** If the feedback and the showing
count say the price is the problem, hand to **`listing-revive`** after delivering it — don't bury
the conversation inside the report.

---

## Compliance pass
Run the gate (`${CLAUDE_PLUGIN_ROOT}/shared/compliance-gate.md`). For seller-facing documents the
parts that bite are:
- **No guarantees, no forecasts, no predicted sale date or price.** Ever.
- **Nothing invented** — every number traces to the listing block or the agent's own words.
- **Fair housing applies to feedback notes**: record what was said about the *property*, never about
  who came through.
- The marketing report is a client document — the brokerage disclaimer applies where compliance says.

## Deliver + save
Job 1 is one line in chat. Jobs 2 and 3 are copy blocks plus the saved doc. Update the listing block
and push the Brain **immediately** — an unsynced write is a lost write.

End with one plain line: *"Send this tonight — the sellers who hear from you weekly are the ones who
renew."*

## Quality checklist
- [ ] Brain and listing block read; the property never re-asked.
- [ ] Feedback grouped by theme **with counts**, recorded in the agent's own words, nothing softened.
- [ ] No visitor names or descriptions recorded — fair housing applies to private notes.
- [ ] Weekly update is 150–250 words, five parts, **includes the hard feedback**, and pads nothing.
- [ ] No promised results, no predicted sale date, no "I'm confident" language anywhere.
- [ ] Marketing report built **only** from real `Built:` tokens, with numbers instead of adjectives.
- [ ] Report saved and `sellerreport` appended to `Built:`.
- [ ] Handed to `listing-revive` when the evidence says price, rather than burying it.
- [ ] Listing block updated and the Brain pushed immediately.
