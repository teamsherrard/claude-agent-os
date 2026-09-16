# The Compliance Gate — run before ANY public-facing piece ships

*When a skill says "run the compliance gate," it means this file. Every skill in this plugin that
produces something a member of the public will see runs it: MLS copy, posts, captions, ads, the
brochure, the postcards, the door hanger, video scripts, YouTube descriptions, the tour, and every
outreach message.*

This is assistance, not legal advice. The agent stays responsible for their marketing.

---

## Part 1 — `compliance.md` has THREE states, and two of them mean "no disclaimer yet"

Read `~/realtor-brain/identity/compliance.md` and decide which state it's in. **Getting this wrong
is how a placeholder ends up printed on a postcard.**

| State | What it looks like | What it means |
|---|---|---|
| **1 — MISSING** | The file isn't there | No disclaimer available |
| **2 — FILLED** | Real brokerage name, a real licence number, actual disclaimer text | Use it |
| **3 — UNFILLED TEMPLATE** | The file exists, but still carries `[bracketed]` tokens or unreplaced template headings | **No disclaimer available** |

**Why state 3 is the dangerous one.** First-run Brain setup scaffolds `compliance.md` as a template
— it ships pre-filled with `[number]`, `[name]`, `[exact disclaimer text the brokerage requires]`.
Compliance is a *later* phase, so for most new agents the file **exists and is not empty** while
being completely unfilled. A skill that only checks "is it empty?" will read state 3 as state 2 and
stamp the literal template text onto a live listing.

**Detection:** any `[` bracket token, or any unreplaced template heading, anywhere in the file = **state 3**.

**Treat state 3 EXACTLY like state 1 (MISSING).**

## Part 2 — What to do in each state

**State 2 (FILLED)** — append the brokerage disclaimer and licence number wherever the piece calls
for it, verbatim as written in the file. Follow its display rules, its claims-to-avoid list, and its
fair-housing constraints.

**States 1 and 3 (no disclaimer available):**
- **NEVER stamp a `[placeholder]` disclaimer onto anything.** Not on a postcard, not in MLS remarks,
  not in a YouTube description, not in an ad.
- Withhold the disclaimer line entirely. Where a piece has a dedicated contact/compliance block (the
  brochure footer, the postcard contact block), leave `[Brokerage Name]` and `[Licence #]` **as
  visible placeholders for the agent to fill before printing** — and say so, plainly, once.
- **Do NOT stop, fail, or block the launch.** Deliver everything else in full.
- Nudge **once**, at the end, after the work they asked for:

  > *I left the brokerage disclaimer off — your compliance isn't set up yet. Say "set up my
  > compliance" and I'll lock your brokerage disclaimer and licence number in for every listing.*

  Once per session, not once per piece. Never open with it.

## Part 3 — The fair-housing pass (every piece, every time, all three states)

Compliance being unset changes nothing here. This runs always.

- Sell the **property, the lifestyle, and the location.** Never the neighbours, never who would
  "fit" or "belong" here, never demographics of any kind.
- **No "perfect for families,"** no "great for young couples," "ideal for retirees," "bachelor pad,"
  "empty nesters," "safe," "exclusive," "quiet family neighbourhood," "up-and-coming."
- **No school-quality claims.** A school district named as a factual boundary is fine; "top-rated
  schools," "great schools," "excellent school district" is not.
- **No religious references** and no ability-based framing — `"walking distance"` / `"steps from"`
  becomes the actual distance.
- **Target buyer** from the listing block describes a *situation* (move-up, downsizing, relocating),
  never a person. If it reads as a protected class, it does not go in the copy.

## Part 4 — The claims pass

- **No guarantees** of price, timeline, or outcome. No "I'll get you more than any other agent."
- **No price predictions** and no market forecasts — not in copy, not in a script, not at a kitchen
  table. A sold price is a fact; "the market's coming back" is a forecast.
- **No result promises** on ads — no leads, views, calls, or outcomes predicted.
- **No "won't last,"** no invented urgency. Urgency is a real date or it doesn't exist.
- **Commission is negotiable** and is never described as fixed, standard, or set by anyone.
- **Every market stat carries its source and its month**, or it doesn't appear. (When
  `memory/market-data.md` has this month's block, quote that — it's already sourced and dated.)
- **Nothing invented about the home.** Every claim traces to the listing block, or it's `[CONFIRM]`.
- **Banned words everywhere:** unlock, supercharge, game-changer, revolutionary, secret weapon,
  leverage (as a verb).

## Part 5 — Channel-specific rules

- **Meta ads** — housing runs under the **Special Ad Category**: restricted targeting, no age or
  gender selection, no narrow-audience or ZIP-level targeting, and a minimum radius applies. Say so
  in the ad plan every time, and tell them to confirm the current rules in Ads Manager, since Meta
  changes them.
- **Print** — brokerage name and licence number must appear on every mailed piece. That's a note
  **to the agent**, never printed copy, and in states 1/3 it comes with "confirm the exact wording
  with your broker before this goes to print."
- **MLS remarks** — the syndication cut carries **zero contact information**; most portals strip or
  reject it.
- **A generated tour** (TOUR IT) carries its disclosure line and is never presented as filmed
  footage. See `tour-rules.md`.
- **Sold price** is published only when the agent has cleared it and `compliance.md` allows it.
  When in doubt, "sold above asking" says the same thing and breaks no rules.

---

## The one-line summary

> Read `compliance.md`. Brackets mean unfilled — treat it as missing. Never print a placeholder,
> never block the launch, nudge once. Fair housing and the claims rules run regardless.
