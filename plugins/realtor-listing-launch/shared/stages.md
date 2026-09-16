# The Eleven Stages — the spine of a listing launch

One listing, captured once, moves through eleven stages. **Eight of them are the launch** — the part
every listing gets. **Three are the life of the listing after launch day** — the part most systems
skip, and the part that decides whether a listing renews, sells, or expires. This file is the map: what each stage is,
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
| **SERVE IT** | Showing feedback, the weekly seller update, the marketing report | `listing-seller` | Weekly, from launch until it closes |
| **REVIVE IT** | The honest read, the price conversation, the re-launch, expiry | `listing-revive` | It's not selling — typically week 4+ |
| **SELL IT** | The offer deadline, final calls, multiple offers, under-bidders | `listing-offers` | An offer is in, or a deadline is set |
| **CLOSE IT** | Just-sold content queued for closing day | `listing-sold` | Under contract → closing |

## The supporting pieces

Three skills aren't stages of their own — they're deliverables a stage reaches for. They can also be
called directly, because an agent often wants just the one thing.

| Piece | Skill | Belongs to |
|---|---|---|
| Property brochure / feature sheet | `listing-brochure` | LIST IT (hands to SHOW IT for the open house) |
| Just Listed / Just Sold postcards, door hanger | `listing-print` | LAUNCH IT and CLOSE IT |
| Database email, neighbour texts, agent-to-agent, buyer matches | `listing-outreach` | LAUNCH IT and SHOW IT |

## The skills that sit outside the stages

**The spine**
- **`listing-intake`** — the keystone. Captures the property ONCE, in the shape `listing-schema.md`
  defines. Runs before any stage, and is what makes "never re-ask" possible.
- **`listing-launch`** — the navigator. Builds the 14-day plan, then runs the stages in order. It
  sequences and hands off; it never writes a deliverable itself.

**The system layer** (they touch every stage but belong to none)
- **`listing-setup`** — run once. Captures the MLS limit, the farm, the print rules, the publishing
  tool, and the tour connection; locks compliance in; normalizes old listing blocks; turns on the
  morning watch.
- **`listing-board`** — the Listing Pipeline in Notion: every property, what's built, what's next.
- **`listing-publish`** — schedules the launch through the agent's own posting tool.
- **`listing-routine`** — the Listing Launch AI Agent: the morning watch that fires a stage when its
  trigger actually happens (`listing-triggers.md`).
- **`listing-analytics`** — the only skill that checks whether any of it worked: post numbers from
  their posting tool, and days-on-market patterns from their own closed listings.

---

## Stage rules

**1. Stages are a sequence, not a checklist.** They run in order because each one uses what the last
one settled. The MLS description fixes the language for the home; the posts, the scripts, and the ads
all inherit it. If a later stage contradicts an earlier one about the property, the build is wrong —
reread the listing block.

**2a. The three post-launch stages are not a sequence.** SERVE IT runs weekly for the whole life of
the listing. REVIVE IT runs only when the evidence says something's wrong — and its honest read is
allowed to conclude *"nothing is wrong, be patient."* SELL IT runs on a single day. Never run REVIVE
IT on a listing that's two weeks old and performing normally.

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

**6. Every stage logs what it built.** Append its token to `Built:` in that listing's block — from
the controlled vocabulary in `listing-schema.md`, never a freehand label — so a week later "what's
left on Maplewood?" has a real answer, and the board and the morning watch stay correct.

**7. One deliverable, one owner.** Several stages touch the same kind of message. House rule 7 says
which stage owns each one; the others reuse it or hand off. Never write a competing version.

**8. The order the plan says is the order the pieces come.** The navigator builds a 14-day plan and
then hands off **in the plan's own order** — not in the stage table's order. The plan is what the
agent is looking at; being handed the shorts last when the plan said day 2 is a broken promise.


---

## The dead states — and the rule that matters most

A listing that is `Sold`, `Expired`, `Withdrawn`, or `Terminated` is **finished**. No stage fires on
it, nothing is built for it, and the morning watch never mentions it. An assistant that keeps
suggesting content for a house the agent no longer represents is worse than an assistant that says
nothing at all.

The system **never sets those statuses itself** — that's the agent's call, asked plainly once.
