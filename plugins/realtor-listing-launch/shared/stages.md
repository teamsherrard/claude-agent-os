# The Eight Stages — the spine of a listing launch

One listing, captured once, moves through eight stages. This file is the map: what each stage is,
which skill runs it, and when it fires. The **Listing Launch Plan** skill sequences these; every
other skill owns exactly one job inside one stage.

An agent never has to know these names. They say *"I just got a listing"* and the stages happen.

---

## The map

| Stage | What it does | Skill | Fires when |
|---|---|---|---|
| **WIN IT** | The listing presentation + pre-listing package that gets the signature | `listing-win` | Before the listing exists — they're pitching |
| **LIST IT** | The MLS description, written to convert and stay compliant | `listing-description` | Signed, going into the MLS |
| **LAUNCH IT** | Just-listed posts + Meta ad copy inside the character limits | `listing-social` + `listing-ads` | Live day, first 72 hours |
| **FILM IT** | Room-by-room YouTube walkthrough script + full SEO package | `listing-video` | Photos done, agent can walk the home |
| **TOUR IT** | Listing photos → animated cinematic home tour, no filming needed | `listing-tour` | Photos exist, agent can't or won't film |
| **CLIP IT** | 3 just-listed shorts scripts with captions | `listing-clips` | Alongside LAUNCH IT, days 1–5 |
| **SHOW IT** | The open house kit — invite, day-of stories, neighbours, follow-up | `listing-openhouse` | An open house date is on file |
| **CLOSE IT** | Just-sold content queued for closing day | `listing-sold` | Under contract → closing |

## The supporting pieces

Three skills aren't stages of their own — they're deliverables a stage reaches for. They can also be
called directly, because an agent often wants just the one thing.

| Piece | Skill | Belongs to |
|---|---|---|
| Property brochure / feature sheet | `listing-brochure` | LIST IT (hands to SHOW IT for the open house) |
| Just Listed / Just Sold postcards, door hanger | `listing-print` | LAUNCH IT and CLOSE IT |
| Database email, neighbour texts, agent-to-agent, buyer matches | `listing-outreach` | LAUNCH IT and SHOW IT |

## The two that sit outside the stages

- **`listing-intake`** — the keystone. Captures the property ONCE. Runs before any stage, and is what
  makes "never re-ask" possible.
- **`listing-launch`** — the navigator. Builds the 14-day plan, then runs the stages in order. It
  sequences and hands off; it never writes a deliverable itself.

---

## Stage rules

**1. Stages are a sequence, not a checklist.** They run in order because each one uses what the last
one settled. The MLS description fixes the language for the home; the posts, the scripts, and the ads
all inherit it. If a later stage contradicts an earlier one about the property, the build is wrong —
reread the listing block.

**2. Skip forward freely, never backward.** An agent who already listed the home skips WIN IT. An
agent with no open house skips SHOW IT. Say the skip in one plain line and move on — never make them
justify it, and never run a stage whose trigger hasn't happened (no just-sold content on day one).

**3. Every stage reads the same two sources.** The Brain (`~/realtor-brain/`) for who they are, and
the listing block (`memory/listings.md`) for the home. Neither is ever re-asked. A stage that needs a
fact nobody has writes `[CONFIRM]` — it does not guess.

**4. FILM IT and TOUR IT are alternatives, not a pair.** FILM IT is for an agent who will walk the
home with a phone. TOUR IT is for an agent who won't — it makes a cinematic tour from the photos
alone. Offer whichever fits what they actually have; offer both only if they ask.

**5. One stage at a time, in the agent's language.** Never announce a stage by name or say "running
LAUNCH IT." Say *"Let's get the posts out"* and do it.

**6. Every stage logs what it built.** Append to `Built so far:` in that listing's block, so a week
later "what's left on Maplewood?" has a real answer.
