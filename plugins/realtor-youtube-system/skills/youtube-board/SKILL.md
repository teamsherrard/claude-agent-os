---
name: youtube-board
description: >
  Builds and maintains the agent's Content Dashboard in THEIR OWN Notion — one board for all their content,
  modeled on Mike Sherrard's real YouTube dashboard, with a YouTube long-form view, a Short-Form view, and a
  calendar. Seeded from their actual Game Plan (every planned title as a card with real dates), and then kept
  alive by the system: when a video gets made, its card fills with the full script, SEO package, lead magnet,
  and the top-3 proven reference videos — everything in one card. Bring-your-own Notion; never required.

  Triggers on "build my content board", "set up my board", "content board in notion", "notion board",
  "notion dashboard", "content dashboard", "put my plan in notion", "update my board", or after the Game
  Plan when the agent says yes to the board offer.
---

# Content Dashboard (Notion) — mission control for their content

The agent's whole content operation as ONE visual board in *their* Notion — like the dashboard Mike runs his
own channel on. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` (plain talk always — it's "your content
board", never "database/properties/views").

**The spec is canonical:** `${CLAUDE_PLUGIN_ROOT}/shared/notion-board-spec.md` — the board name, columns,
views, row-body sections, find-or-create rules, and update conduct all live there. Follow it exactly; this
skill is the builder/refresher, and the Short-Form System shares the SAME board (its own view, same spec).

## Step 1 — Is Notion connected?
Check whether Notion tools are available in this conversation.
- **Not connected** → follow the spec's "Connecting Notion" walkthrough: never block, one plain line on what
  it unlocks, the exact click-path, one reassurance. Then stop gracefully (offer to build it the moment
  they've connected).
- **Connected** → continue.

## Step 2 — Find-or-create THE board (one per agent, ever)
Search their Notion for `[Agent Name] — Content Dashboard` (name from the Brain).
- **Exists** → reuse it: add any missing columns/views per the spec, then jump to whatever the agent asked
  for (seed / refresh / update).
- **Doesn't exist** → create it per the spec: the page + database, the columns (Pillar options = THEIR 3
  Game-Plan pillar names + the short-form funnel roles), and the three views (🎬 YouTube — Long-Form ·
  📱 Short-Form · 🗓 Calendar). If view creation isn't available, use the spec's one-line fallback tip.

## Step 3 — Seed it from the Game Plan (the premium moment)
Open the **YouTube Game Plan** doc (workspace root) + the YouTube Layer:
- Every title on the **90-day calendar** becomes an `Idea` card: Topic (the exact title) · Format
  `Long-Form` · Pillar · **Context** (`• What:` / `• Outcome:` written from the title's Search Intent & Lead
  Type note) · **Recording Date** (the calendar week at their cadence — anchor Week 1 to next week unless
  they say otherwise) · **Resource Assets** (their real CTA + lead magnet from the Brain).
- **References**: don't fake it at seed time — fill the top-3 proven videos only where research has actually
  run (the make-video flow adds them per card as each video gets prepped, per the spec).
- No Game Plan yet? Say so plainly and offer it first (`youtube-gameplan`) — the board is built FROM the
  plan (house rules #10), not instead of it.

## Step 4 — Confirm in plain words
*"Your content board is live in your Notion — every video from your 90-day plan is on it with filming dates.
When we make a video together, its card fills up with the full script, the SEO package, your lead magnet,
and the 3 top-performing videos to beat. Here's the link."*

## Ongoing (how the system keeps it alive — every skill honors this)
Per the spec's "Who writes what": make-video fills the card completely (script + SEO + lead magnet INTO the
page body, Drive links in the columns, top-3 references, status flips as it happens). Rows the agent edited
keep their edits; never downgrade a status they moved forward. "Update my board" → reconcile the board with
the Videos folders + content-log: fill gaps, fix stale statuses, add any new planned titles.

## Rules
- **One board, found not duplicated** — always search first (spec golden rule).
- **Real references only** — actual links + numbers from Research/Outliers; never invented (house rules #6).
- **The board mirrors; it never becomes the source of truth** — the Game Plan + the Brain stay canonical
  (house rules #10). If the board and the plan disagree, the plan wins; offer to refresh the board.
- Draft-only conduct: this board and its rows, nothing else in their Notion, nothing published on its own.
- Works-without-it: an agent with no Notion loses nothing — Drive docs + chat remain the full experience.
