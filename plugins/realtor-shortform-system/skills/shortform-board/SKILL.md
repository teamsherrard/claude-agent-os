---
name: shortform-board
description: >
  Connects the Short-Form System to the agent's Content Dashboard in THEIR OWN Notion — the SAME single board
  the YouTube System uses, with a Short-Form view: every green-screen, talking-head, and carousel post as a
  card with its format, funnel role (reach/value/trust/convert), full post package in the card body, and
  publish date. One board for all their content, two views. Bring-your-own Notion; never required.

  Triggers on "build my content board", "content board in notion", "notion board", "add my posts to the
  board", "content dashboard", "update my board", or when a workflow offers to track a finished post there.
---

# Content Dashboard (Notion) — the Short-Form view

The agent's ONE content board — shared with the YouTube System — with short-form posts as cards. Apply
`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` (plain talk: "your content board," never "database/views").

**The spec is canonical:** `${CLAUDE_PLUGIN_ROOT}/shared/notion-board-spec.md` — board name, columns, views,
row-body sections, find-or-create, and update conduct. Follow it exactly. **Never create a second board:**
if the YouTube System already built `[Agent Name] — Content Dashboard`, this skill finds it and simply
ensures the 📱 Short-Form view exists.

## Step 1 — Is Notion connected?
Check whether Notion tools are available. **Not connected** → the spec's "Connecting Notion" walkthrough
(never block; deliver the content normally, one plain line + click-path + reassurance). **Connected** → on.

## Step 2 — Find-or-create THE board
Search their Notion for `[Agent Name] — Content Dashboard`. Exists → reuse; ensure the 📱 Short-Form view
(filter: Format ≠ Long-Form) + any missing columns. Doesn't exist → create the full board per the spec
(the YouTube System shares it later).

## Step 3 — Cards for posts (how the workflows use this)
When a workflow finishes a post (green screen / talking head / carousel) and the agent wants it tracked:
- Add a card: **Topic** (the post's title/hook) · **Format** · **Pillar** = its funnel role (`Reach` /
  `Value` / `Trust` / `Convert` — the 4-3-2-1 balance made visible) · **Context** (`• What:` / `• Outcome:`)
  · **SEO / Post Package** link (the Drive doc) · Status `Ready to Film` · **Publishing Date** (its planned
  slot).
- **Into the card body**: the full post package — script/talking points, caption, hashtags (3–5), cover
  text — so filming day is open-one-card simple.
- When the agent says it's posted (or the publish step schedules it): flip to `Published` + confirm the date.
- The Brain's `content-log` row is STILL written every time (house rules) — the board mirrors the log,
  never replaces it.

## Rules
- **One board ever** — search first; the YouTube System and this system share it (spec golden rule).
- The board is a mirror — `content-log` + the Brain stay the source of truth; "update my board" reconciles
  from the log (fill gaps, fix statuses), never the reverse.
- Draft-only conduct: this board and its rows, nothing else in their Notion, nothing posts on its own.
- Works-without-it: no Notion, no loss — Drive docs + chat + the content-log remain the full experience.
