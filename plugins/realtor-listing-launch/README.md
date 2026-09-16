# Realtor Listing Launch — Plugin 7

**One input — the address — and every listing becomes a content and lead-gen event.**

Say *"just listed 14 Oak"* and the property is captured once. It is never asked for again.

Requires **Plugin 1 (the Realtor AI Brain)** set up first.

---

## The eleven stages

Eight are the launch. Three are the life of the listing after launch day — the part most systems skip
and the part that decides whether a listing renews, sells, or expires.

| Stage | What it gives the agent | Skill |
|---|---|---|
| **WIN IT** | The listing presentation + the pre-listing package that gets the signature | `listing-win` |
| **LIST IT** | The MLS description, three lengths + a syndication-safe cut | `listing-description` |
| **LAUNCH IT** | Just-listed posts, story slides, and the Meta ad plan | `listing-social` · `listing-ads` |
| **FILM IT** | Room-by-room walkthrough script + the full YouTube SEO package | `listing-video` |
| **TOUR IT** | The listing photos → a cinematic tour. No filming, no videographer | `listing-tour` |
| **CLIP IT** | Three just-listed shorts, filmable in one trip | `listing-clips` |
| **SHOW IT** | The open house kit — invite, day-of stories, neighbours, follow-ups | `listing-openhouse` |
| **SERVE IT** | Showing feedback, the weekly seller update, the marketing report | `listing-seller` |
| **REVIVE IT** | The honest read, the price conversation, the re-launch, expiry | `listing-revive` |
| **SELL IT** | The offer deadline, final calls, multiple offers, under-bidders | `listing-offers` |
| **CLOSE IT** | The just-sold content, written before closing day | `listing-sold` |

**Supporting pieces:** `listing-brochure` (the feature sheet) · `listing-print` (postcards + door
hanger) · `listing-outreach` (database email, neighbour texts, agent-to-agent, buyer matches).

**The spine:** `listing-intake` (captures the property once) · `listing-launch` (the navigator and the
14-day plan).

**The system layer:** `listing-setup` (run once) · `listing-board` (the Notion pipeline) ·
`listing-publish` (schedules the launch) · `listing-routine` (the morning watch) ·
`listing-analytics` (what actually worked).

---

## Start here

```
"set up my listing system"      → listing-setup, about three minutes, run once
"just listed 14 Oak"            → the whole launch
"I have a listing appointment"  → WIN IT, before the listing exists
```

Then, day to day: *"what needs attention?"* · *"log a showing"* · *"it's not selling"* ·
*"we have multiple offers"* · *"it closed."*

## What it does not do

- **It never designs.** It writes copy, plans, and paste-ready design briefs. The agent's design tool
  builds the visuals. (TOUR IT is the one exception — it generates video, under strict rules.)
- **It never publishes on its own.** `listing-publish` schedules only with an explicit yes.
- **It never invents anything about a home.** A missing fact is `[CONFIRM]`, never a guess.
- **It never advises which offer to accept**, or interprets contract terms.
- **It never predicts a price or a sale date.**

## Connections (all bring-your-own, all optional)

| For | Connection | Without it |
|---|---|---|
| Saving the launch | Google Drive | Everything is delivered in chat |
| Cinematic tours (TOUR IT) | Higgsfield | FILM IT — the phone walkthrough — is offered instead |
| Finishing the tour | Plugin 6 (AI Editor) / Descript | The approved clips are handed over in shot order |
| Scheduling | Metricool · GoHighLevel · Buffer | Copy-paste-ready posts, which is a complete answer |
| The listing board | Notion | The Brain and the navigator's "what's left?" still work |

## The shared stack

`house-rules.md` (read first) · `listing-schema.md` (the one shape of a listing block) ·
`compliance-gate.md` (the three-state disclaimer rule, fair housing, claims) · `stages.md` ·
`tour-rules.md` · `output-standard.md` · `publishing-guide.md` · `listing-board-spec.md` ·
`listing-triggers.md` · `listing-doctrine.md`.

> **`listing-doctrine.md` ships deliberately empty.** It's the scaffold for Mike's own listing method.
> Until it's filled, a skill uses its own guidance and says nothing — an unfilled section is silent and
> is never guessed or attributed.
