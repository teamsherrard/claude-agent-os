---
name: market-distribution
description: >
  Packages the month for distribution and turns the market update into a lead engine — the report as
  a monthly lead magnet with its opt-in copy, the newsletter segment for the agent's database, the
  captions for every platform they post on, and the CTAs that point each piece at the funnel. Also
  lays out the week-by-week posting plan so one month's work gets spread across the month instead of
  dumped in a day. Reads the month's data block and the finished pieces — never researches, never
  sends or schedules anything without explicit approval.

  Trigger on: "schedule my market posts", "schedule my posts", "draft my newsletter email", "send my market newsletter", "distribute my market update", "the newsletter for my market update", "my market
  update lead magnet", "captions for my market update", "how do I post my market update", "market
  distribution plan", or as step 5 of a full monthly run.
---

# Market Distribution

The month's work is done; this is what makes it produce leads. The report becomes a magnet, the
database gets the email, every platform gets copy written for it, and the whole thing gets spread
across four weeks instead of posted in an afternoon.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — §9, the 2-CTA model. The
report is the highest-converting magnet an agent has, because the viewer just watched its value.

**If the Lead Capture System (Plugin 5) is installed**, hand the magnet concept to `leadcapture-magnet`
and the opt-in to `leadcapture-funnel` for the full build — this skill produces the monthly recurring
version, not a one-off magnet from scratch. One line, then hand over.

---

## Step 1 — Load the month and the Brain
1. `~/realtor-brain/memory/market-data.md` — this month's block. **Confirm its month matches the
   month you're distributing.**
2. The month's finished pieces — the presentation, the PDF report, the script, the shorts, the
   infographic, and the carousel — so every CTA points at something that actually exists. Missing?
   Say which, and offer to build it first.
3. `~/realtor-brain/brain.md`, then `identity/offer.md` (the real offer + existing magnets),
   `identity/voice.md` + `voice-samples.md`, `identity/profile.md` (booking link, handles),
   `identity/content-engine.md` (**their actual platforms and cadence** — plan around those, never a
   generic list), `identity/publishing.md` (posting tool, if connected), `identity/compliance.md`.

---

## Phase 1 — The lead magnet

The magnet is **the PDF report itself**, offered as a recurring subscription rather than a one-off
download. That's the difference between a lead and a list — and it's why the PDF gets designed
properly rather than being an afterthought.

Produce:
- **The magnet name** — concrete and local: *"The [City] Market Report — every month, before it's
  public."* Not "Free Market Guide."
- **The promise** — one sentence on what they get and how often.
- **Opt-in copy** — headline, 2–3 bullets on what's inside (real specifics from this month's report,
  not generic), the button text, and the one-line privacy reassurance.
- **The delivery email** — what lands in the inbox when they sign up: the report, one line of the
  agent's voice, and a soft consult CTA.
- **Where it gets offered** — the video description, the pinned comment, the infographic caption,
  the story sticker, and the newsletter footer. List the exact placements.
- If `offer.md` already has a market-report magnet, **update it rather than inventing a second one.**
  Two competing magnets split the list.

## Phase 2 — The newsletter segment

The market update as the anchor section of the agent's monthly email. If they don't send a
newsletter, this *is* the newsletter.

Produce:
- **3 subject lines** — lead with the number, not the month
- **Preview text** — one line, ~90 characters, not a repeat of the subject
- **The segment** — 250–400 words: the headline story, 4–5 scannable stats, the three lenses in
  three short blocks, one line of the agent's take
- **Both CTAs** (doctrine §9 — the newsletter is the one written piece that carries the full 2-CTA
  model, because the reader is already opted in and warm):
  - **Primary — the consult**, placed high, right after the headline story while they're still
    reading: one natural line plus the booking link. *"If you want to know what these numbers mean
    for your place specifically, that's a free 15-minute call — here's my calendar."*
  - **Secondary — the report**, at the end: the PDF attached or linked, positioned as the thing they
    keep and forward. *"The full [Month] report is attached — it's the one I send my own clients."*
  - **Never two asks of the same kind.** One is a conversation, one is a download. That's why both
    can coexist here without cancelling each other out — and it's the exception to the one-CTA-per-
    piece rule everywhere else in this plugin.
- **The forward line** — *"Know someone buying or selling in [City]? Forward this."* Referral is the
  cheapest reach an agent has
- **Send timing** — the day the video goes up, or the day after

*(**Market Presentation** already produced an email version — refine and reuse it, never write a
second, different one. Same month, same numbers, one email. **Check it carries both CTAs before
reusing it;** if an older draft has only one, add the missing one — the newsletter always ships with
both.)*

## Phase 3 — The captions

For each platform in `identity/content-engine.md`, and for each piece that goes on it:

| Piece | Platforms | What to write |
|---|---|---|
| The YouTube video | YouTube | Full description: CTA + link first, then what it covers, chapters, source and data period |
| The 3 shorts | Reels · TikTok · Shorts | Already packaged by **Market Shorts** — reuse, don't rewrite |
| The infographic | Instagram · Facebook | Already packaged by **Market Social** — reuse |
| The PDF report | LinkedIn · Facebook · email | A longer-form post: the headline story, three stats, the take, the magnet CTA |
| The carousel | Instagram · Facebook | Already packaged by **Market Social** — reuse |
| The story set | Instagram stories | 4 frames: the hero number, the meaning, a poll ("buying or waiting?"), the link sticker |

Anything already written by another skill gets **reused verbatim**, not rewritten. One month, one
voice, one set of numbers.

## Phase 4 — The CTA map

Every piece points somewhere specific. Set it out as a table so nothing is left pointing nowhere:

| Piece | Funnel role | CTA | Points at |
|---|---|---|---|
| YouTube video | Authority | Primary: consult · Secondary: the magnet | Booking link · opt-in |
| Green screen short | Reach | Soft — "follow for the monthly numbers" | Profile |
| Opinion short | Trust | Comment or DM keyword | The report |
| Stat graphic | Reach / save | "Full report — link in bio" | Opt-in |
| Infographic post | Reach / save | The magnet | Opt-in |
| Carousel | Reach / dwell | Save + send it on | Profile · opt-in |
| Newsletter | Conversion | **Both** — consult high, report at the end | Booking link · the PDF |

Rule: **one CTA per piece.** Two asks is zero asks. Only the **long-form video** and the
**newsletter** carry both — the video has the runtime, and the newsletter's reader is already opted
in and reading, so a consult ask and a download ask don't compete.

## Phase 5 — The month's posting plan

Spread it across four weeks so one recording feeds the whole month:

| Week | What goes out |
|---|---|
| 1 | The YouTube video · the newsletter (PDF attached) · the infographic |
| 2 | Green screen article reaction · the story set |
| 3 | Stat graphic · the carousel |
| 4 | Talking-head opinion · a teaser for next month's numbers |

Shape it to their real cadence from `content-engine.md` — if they post twice a week, this is already
their whole month; if they post daily, this is the spine and the rest fills in around it.

## Phase 5b — Hand the leads somewhere (don't let them sit)

The report is the highest-converting magnet an agent has, and a magnet with no follow-up is a list
that rots. Close the loop:

- **If the AI Admin (Plugin 2) is installed** — hand it the follow-up: anyone who downloads this
  month's report gets logged to `memory/clients.md` with the source (*"downloaded the [Month] market
  report"*) and a follow-up task on the agent's normal cadence from `identity/operations.md`. Say it
  in one line and let the Admin own it from there — **never build a second follow-up system here.**
- **If the Lead Capture System (Plugin 5) is installed** — the opt-in page and thank-you flow are
  theirs; hand the magnet over rather than describing a funnel this plugin doesn't own.
- **If neither is installed** — write the agent a three-message follow-up sequence (day 0 delivery,
  day 3 the one-question check-in, day 10 the soft consult offer) and say plainly that the AI Admin
  would run this automatically.

**Market-update downloads are seller-intent leads** — the hardest kind to earn. Someone who asks for
next month's numbers is usually watching their own equity. Say that to the agent once; it changes how
fast they follow up.

## Phase 6 — Compliance, save, and scheduling
Compliance pass on every public-facing line (`identity/compliance.md`) — disclaimer and licence where
required, nothing on the claims-to-avoid list, fair housing throughout.

Save into the month folder as `Distribution Pack — [Month Year]`
(`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`).

If they've connected a posting tool (`identity/publishing.md`), offer to schedule the plan — **only
with explicit, per-post approval, never automatically.** If they post manually, just hand it over.

## Quality checklist
- [ ] Every number matches the data block and the other pieces exactly.
- [ ] Magnet is the recurring report, named concretely; existing magnet updated, not duplicated.
- [ ] Opt-in copy uses real specifics from this month, not generic bullets.
- [ ] Newsletter is 250–400 words, leads with a number, forward line present.
- [ ] Newsletter carries BOTH CTAs — consult placed high, report at the end — and they're different
      kinds of ask, not two versions of the same one.
- [ ] Captions reuse what other skills already wrote — nothing rewritten into a second voice.
- [ ] Only the agent's real platforms appear in the plan.
- [ ] CTA map complete; one CTA per piece; long-form is the only one with two.
- [ ] Every CTA points at something that actually exists.
- [ ] Posting plan spreads across four weeks and matches their real cadence.
- [ ] Compliance pass done; pack saved to the month folder.
- [ ] Leads routed — to the AI Admin if installed, or a 3-message sequence written if not.
- [ ] No second follow-up system built where Plugin 2 or 5 already owns it.
- [ ] Nothing scheduled or sent without explicit approval.
