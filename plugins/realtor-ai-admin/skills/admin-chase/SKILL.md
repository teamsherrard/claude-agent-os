---
name: admin-chase
description: >-
  Chase ("who owes me?") — the on-demand answer to the realtor's oldest time-suck: waiting on
  everyone. Scans sent mail for asks that never got a reply (lender letters, sign-backs, condo
  docs, photographer confirmations), ranks them by how long they've been dangling with
  deal-critical items first, and drafts a polite nudge for each — ready to review and send.
  Trigger on: "who owes me", "who owes me a reply", "who hasn't replied", "am I waiting on
  anything", "what am I waiting on", "chase [name]", "nudge [name]", "chase the lender",
  "any replies outstanding", "follow up on everything".
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Chase — "who owes me?"

Realtors spend their day waiting on other people. This lane finds every dangling ask and puts a
nudge draft behind each one, so "who owes me?" from the car replaces twenty minutes of scrolling
sent mail. (The daily inbox sweep's WAITING ON section is the automatic surface; this is the
deep, on-demand lane that actually drafts the nudges.)

1. **Scan.** Search SENT mail (default: last 14 days; go deeper if the agent asks or an active
   deal predates it) for threads where the agent asked a question or requested something and
   nothing has come back since. Cross-check the inbox so a reply that arrived isn't counted.
   Add any open `deadlines.md` rows where someone ELSE owes the action (an "await lender
   letter" row is a chase item, not a follow-up). Skip promotions, newsletters, and personal
   threads — chase business asks only.
2. **Rank honestly.** Deal-critical first (Under Contract / Lender-Title threads, anything tied
   to an open `deadlines.md` row), then by days waiting. **Cap the list at 8** — a wall of
   debts is as useless as no list.
3. **Report:** one line each — who · what they owe · how many days. Nothing padded.
4. **Draft the nudges.** For every listed item (or just the named one on "chase [name]"),
   write a short, polite nudge in the agent's voice — reference the original ask, no
   guilt-tripping, one clear question — and save it as a Gmail draft. Confirmation states the
   count: "6 nudges in your Gmail — review and send."
5. **Never double-nudge:** if sent mail shows a nudge on that thread in the last 2 business
   days, skip it and say so ("nudged Tuesday — give it a day").
6. **Log:** for chase items tied to a client, add one line to their block (nudged [who] re
   [what], [date]). Sync.

**In dispatch** ("who owes me?" from the car): same flow, zero questions — the ranked list IS
the report, drafts flagged.
