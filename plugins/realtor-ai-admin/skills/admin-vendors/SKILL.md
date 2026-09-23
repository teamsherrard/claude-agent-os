---
name: admin-vendors
description: >-
  Vendor Dispatch — "book the photographer for Tuesday at 123 Main" becomes a ready-to-send
  request email plus a calendar hold, from the trusted-partner list the agent already keeps in
  their Brain. Photographers, cleaners, inspectors, stagers, lawyers, handymen — one sentence
  replaces a lookup, a compose, and a calendar entry. Trigger on: "book the photographer",
  "get the cleaner in", "line up the inspector", "schedule the stager", "text the handyman"
  (becomes an email draft), "who's my [trade]", "book [vendor name] for [when/where]".
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Vendor Dispatch

The agent's trusted-partner network lives in `identity/vendors.md`. This lane turns "book the
photographer" into the whole errand.

1. **Find the vendor.** Match the trade (photographer, cleaner, inspector, stager, lawyer,
   lender, handyman…) in `identity/vendors.md`. Multiple in one trade → take the one marked
   preferred or listed first, say so, and name the alternates in the same line ("used Sarah
   Chen — say 'use the other one' for Apex Photo"). Named vendor → use them.
   **Not in the Brain?** Walk the ladder before asking: search mail for a past vendor of that
   trade (the agent has almost always emailed one) — found, use that real contact and say so;
   truly nothing → ask the ONE question ("who's your go-to inspector?").
2. **Draft the request** in the agent's voice: the job, the address, the date or time window,
   access details if logged on the listing, and "does that work?" — two to four sentences,
   signature from `operations.md`. Draft only; the agent reviews and sends.
3. **Hold the slot:** a guestless calendar hold at the requested time ("[Vendor] — [job] —
   [address] (unconfirmed)"). The vendor is invited only after they confirm — never before.
4. **Track the confirm:** one `deadlines.md` row — await [vendor] confirmation for [date],
   due the day before the job. When the reply lands, the agent says "the photographer
   confirmed" → convert the hold to a real event and mark the row Done.
5. **Report in one line, proof embedded:** "Drafted the ask to Sarah Chen (photographer) ·
   held Tue 10:00 at 123 Main · I'll flag it if she hasn't confirmed by Monday." Sync.

**Boundaries:** booking the photographer is Admin plumbing; what gets SHOT and made — the
listing's content — is the Listing Launch plugin. And a NEW vendor's details spoken on the go
("add this roofer to my list") is a knowledge capture → the Brain's realtor-capture writes
`vendors.md`, not this lane.

**In dispatch:** same flow, zero questions — assume, state the assumption, park real ambiguity
in the capture-log.
