---
name: admin-matchback
description: >-
  Match-Back — the payoff for every note the agent ever logged: name a property and it finds the
  buyers. Scans the entire client ledger AND the archive for logged needs, reactions, and price
  ranges, returns a ranked shortlist with the WHY for each match, and drafts a personal note to
  each one referencing their specific logged need (drafts only — the agent reviews and sends).
  No CRM, no MLS — the fuel is months of the agent's own captured notes, which is why no other
  tool can copy this. Trigger on: "who wants this listing", "who's looking for…", "match my
  buyers", "who should I show this to", "just listed a [property] — who do I know", "any buyers
  for [address/type/area]", "match this listing to my clients".
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Match-Back ("who wants this listing?")

The agent names a property — theirs, a colleague's, or one they just walked — and you find the
people already in their world who want it. This turns note-taking into deal-making.

1. **Parse the property** from whatever they gave: beds/baths, type, area/community, price
   point, standout features (suite, yard, garage, view). If it's one of the agent's own
   listings, pull the rest from `memory/listings.md`.
2. **Scan EVERYTHING:** every block in `memory/clients.md` AND `memory/clients-archive.md` —
   the Looking / Notes / logged-reaction lines are the matching fuel. Past clients count
   (they refer, upsize, and know buyers). Never skip the archive.
3. **Score honestly.** A match must trace to something actually logged — "the Wus wanted a
   legal suite in the NW under $700K" matches; vibes don't. **Never invent a need that was
   never captured**; if nothing matches, say so plainly and suggest who's *closest* and why.
4. **Deliver the shortlist, ranked:** one line each — name · stage · the logged need it
   matches, quoted or near-quoted · how fresh the signal is. Cap at the top 5.
5. **Draft the notes.** For each match (or the top 3 if more), create an email draft in the
   agent's voice referencing THEIR specific logged need — "you mentioned wanting a suite for
   your mom — this one just came up" — never a blast, never generic. Drafts only, stated in
   the confirmation ("3 drafts in your Gmail — review and send").
6. **Log it:** one line to each matched client's block (matched to [address], note drafted);
   follow-up rows for any the agent says they'll call instead. Sync.

**In dispatch** ("just walked a great 4-bed in Cranston — who wants it?"): same flow, zero
questions, shortlist + drafts reported in one glance.

**Boundary:** this matches *people to a property*. Launching the listing's marketing is the
Listing Launch plugin; this skill may end with one line — "want the full launch? say 'launch
my listing'" — when the property is the agent's own new listing.
