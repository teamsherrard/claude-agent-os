---
name: admin-feedback
description: >-
  Showing Feedback Chaser — after showings on the agent's own listing, drafts the feedback
  request to each showing agent, tracks who has answered, and summarizes the replies by theme.
  The chore agents hate most about their own listings, reduced to one phrase. Feeds the Listing
  Launch plugin's seller layer: the themes it gathers are what the weekly seller update is made
  of. Trigger on: "get feedback on [address]", "ask the showing agents", "chase feedback",
  "feedback requests for [address]", "any feedback on my listing", "did the showing agents
  reply", "what did they think of [address]".
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Showing Feedback Chaser

Every showing on the agent's listing should produce feedback, and almost none does — because
asking is a chore. This lane does the asking and the chasing; what the answers MEAN for the
seller belongs to the Listing Launch plugin (see the boundary below).

## Ask ("get feedback on 123 Main")
1. **Find the showings.** From whichever exists: calendar events at that address, showing
   confirmation emails in the inbox (search the address), or the agent just naming the showing
   agents. Resolve each showing agent's email via the Name-Resolution Ladder — **never invent
   one**.
2. **Draft one short request per showing agent**, courteous and 30-seconds-answerable: thanks
   for showing, then three quick asks — their buyer's interest level, how the price sat, any
   objections. Drafts only. Skip anyone already asked for this showing (check sent mail).
3. **Track it:** one `deadlines.md` row per outstanding ask — await feedback · [agent] ·
   [address], due in 2 business days.
4. **Report:** "4 feedback requests in your Gmail — Chen, Ortiz, Kaur, Webb · I'll chase
   whoever's quiet in 2 days."

## Collect ("any feedback yet?")
1. Read the reply threads. **Summarize by theme with counts** ("loves the yard ×3 · kitchen
   dated ×2 · price high ×2") — never soften it, never invent a theme, and no reply means
   silence, not a data point. Mark answered rows Done; the quiet ones get ONE polite nudge
   draft (the Chase rules apply — never twice in 2 business days).
2. **Hand the themes over:** with the Listing Launch plugin installed, end with "want this
   logged and the seller update written? Say **'showing feedback for [address]'**" — its
   `listing-seller` skill owns the `Showings:`/`Feedback:` record, the weekly seller update,
   and the marketing report. Without it, append the themes as plain dated notes to that
   listing's block in `memory/listings.md` — no invented schema. Sync.

**Boundary (one owner per output):** this lane drafts the requests and gathers the raw
answers. The seller-facing words — the weekly update, the marketing report, the price
conversation — are the Listing Launch plugin's, always.

**In dispatch** ("leaving 123 Main — get me feedback from today's showings"): same flow, zero
questions, requests drafted and reported in one glance.
