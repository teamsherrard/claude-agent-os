# The Listing Block — the one canonical shape

Every skill in this plugin reads and writes ONE block per property in
`~/realtor-brain/memory/listings.md`. This file is that block's definition. When a skill says
"read the listing block" or "apply the listing schema," it means this.

**Why this file exists:** the property is captured once and never re-asked. That promise only
holds if every skill agrees on where each fact lives. Two shapes in one file breaks it.

---

## The block

```
## 412 Maplewood Drive — Active
- Captured: 2026-07-16 · Stage: live now
- Type: Detached · Beds/baths/sqft: 3 / 2.5 / 1,840
- Price: $485,000
- Price history: $499,000 (2026-07-16) → $485,000 (2026-08-04)
- Target buyer: move-up family, first move out of a condo
- Features: renovated kitchen · fenced yard · quiet cul-de-sac near the greenway
- The story: sellers relocating; kitchen redone two years ago
- Seller notes: wants a Saturday open house
- Open house: 2026-07-25 · 1–3pm
- Photos: https://drive.google.com/… (or: not yet)
- Showings: 7 total · last 2026-08-02
- Feedback: kitchen dates it (×3) · loved the yard (×2) · street noise (×1)
- Drive folder: https://drive.google.com/…
- Built: description · social · ads
```

## The fields

| Field | Required | Who writes it | Notes |
|---|---|---|---|
| **Heading** | yes | intake | `## [Street Address] — [Status]`. See the status vocabulary below. `Active` / `Pending` / `Sold` match the Brain's own listings template exactly. |
| **Captured** | yes | intake | ISO date. Never changes. |
| **Stage** | yes | intake, navigator | `coming soon` · `live now` · `open house` · `reviewing offers` · `under contract` · `sold` · `stalled` · `back on market`. The launch stage — finer-grained than the heading's status. |
| **Type** | yes | intake | Detached · Semi · Townhouse · Condo · Acreage · Land. **Changes the copy in every stage** — a condo launch is not a detached launch. |
| **Beds/baths/sqft** | yes | intake | `3 / 2.5 / 1,840`. Any unknown part is `[CONFIRM]`. |
| **Price** | yes | intake | The CURRENT list price. `listing-sold` appends the sold price when cleared. |
| **Price history** | no | `listing-revive`, `listing-sold` | `$X (date) → $Y (date)`. Written on every price change. The re-launch content and the sold post both need to know a reduction happened; nothing else records it. |
| **Target buyer** | no | intake | Who this home is *for*, in the agent's words. Drives the angle of every piece. Never a protected class — describe the buyer's situation (move-up, downsizing, first purchase), never who they are. |
| **Features** | yes | intake | `·`-separated. The source of every claim made about the home. |
| **The story** | no | intake | Why they're selling, what was done to the home. Feeds the brochure and the long-form script. |
| **Seller notes** | no | intake | Timeline, tenant, as-is, no sign, anything the seller wants known or avoided. |
| **Open house** | no | intake, `listing-openhouse` | `YYYY-MM-DD · [time range]`. **This is a real field** — never parse it out of `Stage:`. Absent means no open house; `listing-print`'s door hanger and the whole SHOW IT kit gate on it. |
| **Photos** | no | intake, `listing-tour` | Drive folder link, or `not yet`. TOUR IT, the brochure photo plan, and the editor hand-off all read it — so the agent is asked for photos once, not once per skill. |
| **Showings** | no | `listing-seller` | `[count] total · last [date]`. The single number a seller asks about most. |
| **Feedback** | no | `listing-seller` | What people actually said, with a count per theme (`kitchen dates it (×3)`). **This is the raw material** for the seller update, the price conversation, and the re-launch — and the one thing no other system captures. Quote showing agents' words; never the visitors' names. |
| **Drive folder** | yes | intake | The listing's own folder (output standard). |
| **Built** | yes | every skill | `·`-separated, from the vocabulary below. Appended to, never rewritten. |

## `Built:` — the controlled vocabulary

Use these exact tokens. The navigator's "what's left on Maplewood?" and the board both read this
line, and a freehand label is a label neither can find.

`presentation` · `description` · `brochure` · `social` · `ads` · `walkthrough` · `tour` · `shorts` ·
`openhouse` · `print` · `outreach` · `published` · `sellerreport` · `revive` · `offers` · `sold`

One token per piece, appended in the order built. Never remove a token; never invent one.

## Rules

**1. Read before asking. Always.** Anything in the block is never re-asked — not the address, not
the price, not the beds, not the open house date, not where the photos are.

**2. A missing optional field is not a question.** It's `[CONFIRM]` in the output, or the piece is
skipped and the skip is said in one plain line. Never guess.

**3. Append to `Built:`, never rewrite it.** Two skills finishing close together must not lose each
other's token.

**4. Never invent a field.** If a skill needs something the schema doesn't carry, it asks once in
its own flow and the answer goes in `Seller notes:` — it does not invent a new line.

**5. Status and Stage move forward, except for the two that legitimately go back.** `listing-sold`
sets `Sold`. A deal that collapses moves `Pending` → `Active` with `Stage: back on market` — that is
the one backward move, and it is real. Nothing sets a `Sold` listing back to Active.

---

## The status vocabulary (the heading word)

| Status | What it means | What the system does |
|---|---|---|
| **Active** | On the market | Everything runs |
| **Pending** | Under contract, not closed | CLOSE IT gets written and queued; the launch stops |
| **Sold** | Closed | Nothing fires. It becomes track record (`proof.md`, `performance.md`, the board's 🏆 view) |
| **Expired** | The listing agreement ran out | **Nothing fires, and nothing nags.** The listing is history until the agent says otherwise |
| **Withdrawn** | Pulled off market, agreement intact | Same — silent. Often temporary (seller travelling, a repair) |
| **Terminated** | The agreement ended early | Silent. Handle with care; this one usually means something went wrong |

**Why the last three matter.** Before they existed, an expired listing stayed `Active` forever — so
the board kept showing it and the morning watch kept nagging about a house the agent no longer
represents. That is the single most embarrassing thing an assistant can do.

**Never set these silently.** Expired / Withdrawn / Terminated are the agent's call, always. Ask
plainly, once, and take the answer: *"Is 88 Ridge still yours, or did it come off?"*

---

## Reading an older block (migration)

Two older shapes exist in the wild. **Read them, don't reject them:**

- **The Brain's own template** — `## [Address] — [Active|Pending|Sold]` with `Key features:`,
  `Target buyer:`, and `Content made: [ ] YouTube walkthrough [ ] Reels [ ] Just-listed graphic
  [ ] Email`. Map `Key features:` → `Features:`, and read `Content made:` ticks as `Built:` tokens.
  The Brain's `realtor-listing-content-kit` still writes this shape.
- **Listing Launch v0.2–v0.3** — `## [Address] · captured [date] · status: [stage]` with
  `Built so far:`. Map `status:` → `Stage:` (and derive the heading status word), and
  `Built so far:` → `Built:`.

**`listing-setup` normalizes every block to the shape above**, once, without losing a word. Any
other skill that meets an old block reads it correctly and keeps going — it never blocks the agent
to migrate, and it never writes a second block for the same address.
