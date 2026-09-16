---
name: listing-setup
description: >
  One-time setup for the Listing Launch System — about three minutes, run once. Reads everything it
  can from the agent's Brain and captures only the handful of things a listing launch needs and
  nothing else knows: their MLS character limit, their farm area, their brokerage's print rules, how
  they'll publish, and whether they want cinematic tours. Locks their compliance disclaimer in so
  nothing ever ships a placeholder, tidies any listings already on file into one shape, provisions
  the morning listing watch, and hands them straight to their first launch.

  Trigger on: "set up my listing system", "set up listing launch", "onboard me for listings", "get me
  started with listings", "set up my listing launch system", "configure my listings", or offered once
  at the end of a first listing launch if it hasn't been run.
---

# Listing Launch — Setup

A short, friendly setup that turns the listing system on as a **layer on top of the AI Brain**. By
the end they understand it and have a listing moving — in under ten minutes.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — especially #1: plain and
warm, never technical. This is their first impression.

## ⭐ THE #1 RULE: ONE BRAIN, NEVER TWO
Their name, brokerage, market, voice, offer, proof, and brand already live in the Brain. This skill
does **not** rebuild any of it and **never re-asks it**. It reads the Brain and captures only the
listing-specific layer below.

> If you catch yourself about to ask their city, their brokerage, their voice, or their CTA —
> **stop, and read it from the Brain.**

---

## Step 1 — Welcome (set an easy tone)
> "Let's get your listing system running. Good news — I already know you from your Brain, so this is
> quick. A few things only you can tell me, then we'll launch something."

## Step 2 — Read the Brain (don't rebuild it)
Read `~/realtor-brain/brain.md`, then `identity/profile.md`, `market.md`, `voice.md`, `offer.md`,
`brand-visual.md`, `content-engine.md`, `operations.md` (timezone), and `config.md`. Reflect it back
so it's obvious you won't re-ask:

> "Here's what I've got: you're [name] with [brokerage] in [city], you work [niche], and your style
> is [voice in plain words]. I won't ask you any of that again."

If `~/realtor-brain/` is missing, **don't assume a brand-new agent** — a fresh session starts with
an empty sandbox while the Brain lives in their cloud workspace. **Pull it first with
realtor-brain-sync** (located by ID/marker, never folder name). Only if the cloud truly has no Brain
do you send them to **Realtor AI Brain — Setup**. If it's there but thin, say so kindly and proceed.

## Step 3 — Lock compliance FIRST (the one that can't wait)

Run the state check in `${CLAUDE_PLUGIN_ROOT}/shared/compliance-gate.md` — Part 1.

- **FILLED** → say so in one line and move on. *"Your brokerage disclaimer's set — every listing
  gets it automatically."*
- **MISSING or UNFILLED TEMPLATE** → this is the one thing worth two minutes right now, because it
  goes on mailed postcards and MLS remarks:

  > "One thing worth locking in now: your brokerage disclaimer and licence number. They have to go on
  > your listing marketing, and if I don't have them I'll leave a blank for you rather than guess.
  > Want to set that up? It takes about two minutes — say the word and I'll run it."

  Hand to the Brain's **`realtor-compliance`** skill if they say yes, then come back. **If they say
  no, that's fine** — note it once, continue the setup, and never ask again in this session. The
  gate handles it safely either way.

**Never write a disclaimer for them. Never fill the template from inference.**

## Step 4 — Capture the listing layer (one at a time, skip what the Brain answers)

Only these five. Ask conversationally, one at a time, and **advise when they're unsure** — never
leave them stuck on a decision they haven't made.

1. **MLS character limit.** *"What's your MLS's limit for the description? Most are 1,000 — I'll use
   that if you're not sure."* → saves to `config.md` as `MLS character limit:`. This is the single
   most-repeated question in the whole plugin; asked here, it's never asked again.
2. **Their farm.** *"When a listing goes live, which streets or community do you want the neighbour
   push aimed at?"* → `identity/market.md` as `Listing farm:`. Drives the neighbour texts, the
   postcard mailing plan, and the neighbour-reach ad.
3. **Print rules.** *"Does your brokerage have rules for printed pieces — a logo that has to appear,
   a required size or colour?"* → appends to `identity/compliance.md` under the brokerage logo
   section. Unsure → *"Worth a quick ask to your broker before your first postcard order — I'll
   leave the placeholders visible until you know."*
4. **How they'll publish.** *"When your listing posts are ready, do you want to post them yourself,
   or should I schedule them? Do you already use Metricool or GoHighLevel?"* → `identity/publishing.md`.
   **Update only that field — preserve every other line in the file**, especially `Content board:`
   (the content systems wrote it). Manual is a completely fine answer and the default for most.
5. **Cinematic tours.** *"Some listings you won't have time to film. I can turn the photos into a
   cinematic tour instead — that runs on a Higgsfield account. Want me to check if yours is
   connected?"* → if connected, note it in `config.md` as `Higgsfield: connected`. If not, don't
   push: *"No problem — I'll write you a phone walkthrough script instead, and this is here whenever
   you want it."*

That's the whole interview.

## Step 5 — Tidy the listings already on file

Read `~/realtor-brain/memory/listings.md` and normalize every block to
`${CLAUDE_PLUGIN_ROOT}/shared/listing-schema.md`, using its migration rules.

- **Old Brain-template blocks** (`Key features:`, `Content made:` ticks) and **old Listing Launch
  blocks** (`status:`, `Built so far:`) both get mapped into the canonical shape.
- **Never lose a word.** Anything that doesn't map to a field goes into `Seller notes:`.
- **Never invent a value.** A block with no `Type:` gets `Type: [CONFIRM]`, not a guess.
- **Never merge two blocks** for what might be two different properties — if two headings are close
  but not identical, leave both and say so in one line.
- Nothing on file? Skip silently — this is a normal first run.

Then say it plainly, once: *"Tidied up the three listings you already had — same information, just
in one shape so nothing gets asked twice."*

## Step 5½ — Mark setup as done
Write `Listing Launch setup: done [date]` to `~/realtor-brain/config.md` and push. **This one line is
what stops every other skill re-offering setup and re-asking what setup captured** — without it the
intake nudges forever.

## Step 6 — Provision the morning watch
Run the provisioning check in `${CLAUDE_PLUGIN_ROOT}/shared/listing-triggers.md`. **Don't ask
permission** — it's the default, and opting out is one sentence away. Mention it in the wrap-up, one
line, not as its own step.

## Step 7 — Set up their Drive home
Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`, find-or-create `[Agent Name] — Listings/`.
Don't pre-create per-listing folders — the intake makes those. Share the link so they know where
listing work will live. No Drive connector? Say so kindly, keep going, never block.

## Step 8 — Explain it, then launch something

Plainly, the way they'll use it:

> "Here's how this works. When you get a listing, just tell me — *'just listed 14 Oak'* — and I'll
> take it from there:
> • **Before you have it** — your listing presentation and the package you send ahead.
> • **The day it lists** — your MLS description, your posts, your ad, the postcard.
> • **The video** — a walkthrough script if you're filming, or a cinematic tour built from your
>   photos if you're not.
> • **The open house** — the invites, the day-of stories, and the follow-ups.
> • **When it closes** — your sold post and the review ask, already written.
> You give me the address once. I never ask for it again."

Then the quick win:

> "Got a listing right now — or one coming up? Tell me the address and I'll start. If you've got an
> appointment coming instead, say *'listing presentation'* and we'll go win it first."

---

## Completion checklist
- [ ] Brain located, read, and reflected back — **nothing re-asked**
- [ ] Compliance state checked FIRST; `realtor-compliance` offered if unset, and a no accepted
      gracefully — **no disclaimer ever written or inferred**
- [ ] MLS character limit captured and saved to `config.md`
- [ ] **`Listing Launch setup: done [date]` written to `config.md`** and pushed
- [ ] Farm area saved to `market.md`; print rules appended to `compliance.md`
- [ ] Publishing method saved to `publishing.md` — **other lines in that file preserved**
- [ ] Higgsfield checked without pressure; FILM IT named as the fallback
- [ ] Existing listing blocks normalized to the schema, nothing lost, nothing invented, nothing merged
- [ ] Morning watch provisioned (not asked about), mentioned in one line at the end
- [ ] `[Agent Name] — Listings/` provisioned, or the connector gap explained kindly
- [ ] System explained in plain words and the agent pointed at a real first action
- [ ] Whole thing felt fast, friendly, and non-techie
