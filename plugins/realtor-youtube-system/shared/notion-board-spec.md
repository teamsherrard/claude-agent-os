# Content Dashboard — the ONE Notion board (shared spec)

The agent's **Content Dashboard** in *their own* Notion — modeled on Mike Sherrard's real YouTube content
dashboard. **ONE board for the whole system**: the YouTube System and the Short-Form System both write to the
SAME database; each has its own **view**. This file is the canonical spec — an identical copy ships in both
plugins (like `render_doc.py`); if you change it, change both.

**Golden rules**
- **Bring-your-own Notion, never required.** Everything works without it — the board is a premium *view*,
  not the system. The **Game Plan + the Brain (content-log) stay the source of truth**; the board mirrors them.
- **One board per agent, ever.** ALWAYS search their Notion for `[Agent Name] — Content Dashboard` first and
  reuse it (add rows / missing views). Never create a second board; never edit unrelated pages.
- **Draft-only conduct:** create and update only this board and its rows. Never delete rows the agent made,
  never touch anything else in their workspace, never act unasked.
- **Plain talk:** to the agent it's "your content board" — never "database", "properties", "views", "MCP".

---

## The board (find-or-create)

**Page + database name:** `[Agent Name] — Content Dashboard` · icon 🎬
**Description line:** *"Every video lives here from idea → script → recording → published. Built and updated
by your AI system."*

**Columns (database properties)** — Mike's dashboard, adapted to what this system actually produces:

| Column | Kind | What goes in it |
|---|---|---|
| **Topic** | Title | The exact video/post title (search-intent title for long-form) |
| **Format** | Select | `Long-Form` · `Green Screen` · `Talking Head` · `Carousel` |
| **Status** | Select | `Idea` → `Scripted` → `Ready to Film` → `Recorded` → `Published` |
| **Pillar** | Select | Long-form: the agent's 3 Game-Plan pillars (create the options from THEIR pillar names). Short-form: the funnel role — `Reach` · `Value` · `Trust` · `Convert` |
| **Context** | Text | Two short bullets, Mike-style: `• What: …` `• Outcome: …` (what the video covers + what the viewer walks away with) |
| **Script** | URL | Link to the script doc in their Drive (added when the script is made) |
| **SEO / Post Package** | URL | Link to the SEO package (long-form) or the post package (short-form) in Drive |
| **References** | Text | **The top 3 PROVEN videos on this exact topic** — real YouTube links from the competitive audit (doctrine §11.5/§16.4): videos by other agents/creators that rank and perform on this search, each as `link · channel · ~views · the one thing to beat` (e.g. *"their thumbnail wins but they skip prices — we'll show real numbers"*). REAL links + numbers found by Research/Outliers only — NEVER invented, never stale guesses. These are gold for the agent: watch the 3 before filming, then beat them. |
| **Resource Assets** | Text | The CTA + lead magnet for this video, b-roll notes, thumbnail text idea |
| **Recording Date** | Date | When they plan to film (from the calendar / cadence) |
| **Publishing Date** | Date | When it goes (or went) live |

**Inside every row (the page body) — the full content lives IN the card.** The columns are the tracker; when
a video gets made, the system writes the actual deliverables into the row's page, clearly sectioned, so the
agent opens one card and has everything:
- **🎬 SCRIPT** — the full script (hook → primary CTA → sections → secondary CTA), word-for-word, ready to
  read off the card.
- **🔍 SEO PACKAGE** — title options, the description (CTA + links first 3 lines), tags, thumbnail text,
  pinned comment.
- **🧲 LEAD MAGNET** — this video's magnet + CTA lines, and where the magnet lives.
- **📚 REFERENCES — WATCH THESE 3 FIRST** — the top-3 proven videos, each with the one thing to beat.
- **📋 ASSETS & NOTES** — b-roll/filming notes, disclaimers to say, anything else from the working docs.
(Short-form rows: the post package instead — script/talking points, caption, hashtags, cover text.)
The Drive `.docx` files remain the saved record (link columns point there); the card body is the daily-use
copy so the agent never hunts through folders on filming day.

**Views to create** (via the Notion connection's view tools; if view creation isn't available, create the
board anyway and tell the agent in one line: *"In Notion, click `+ Add view`, filter Format to Long-Form —
that's your YouTube view; do the same for the other formats for your Short-Form view."*):
1. **🎬 YouTube — Long-Form** — filter `Format = Long-Form`, grouped by Status (board/pipeline), sorted by
   Recording Date.
2. **📱 Short-Form** — filter `Format ≠ Long-Form`, grouped by Status, sorted by Publishing Date.
3. **🗓 Calendar** — calendar view on Publishing Date (everything).

## Who writes what

- **YouTube System** — `youtube-gameplan` **seeds the board from the 90-day calendar** (every planned title
  as an `Idea` row: Topic, Pillar, Context from its Search Intent & Lead Type note, Recording Date from the
  week + their cadence, Resource Assets = their CTA/lead magnet from the Brain). Then, when a video gets
  made, the make-video flow **fills the card completely**: the §11.5 competitive audit's top-3 into
  References; the full script, SEO package, and lead magnet written INTO the page body (+ the Drive links in
  the columns); Status flips `Scripted` → `Recorded` → `Published` as it happens. One card = the whole video.
- **Short-Form System** — each workflow (green screen / talking head / carousel) **adds its post's row** when
  the content is made (`Ready to Film`, Format + funnel role set, package link attached) and flips it to
  `Published` when the agent confirms it went out. (The Brain's `content-log` row is still written — the
  board mirrors it, never replaces it.)
- **Either plugin can create the board** — whichever runs first. The other finds it and adds its view + rows.

## Two-way sync — the board and the chat always agree (no duplicates, ever)

**WRITE side — find the card first, always.** Before creating ANY card, search the board for an existing one
for this video/post (the Game Plan seed means long-form cards usually ALREADY exist):
- Match on the title — exact first, then near-match (the seeded title vs. a slightly refined one).
- **Found** → UPDATE that card (and if the title was refined during packaging, rename the card's Topic to
  the final title — same card, better title). **Never create a second card for the same video.**
- **Not found** → create it (an off-plan video still gets a card).

**READ side — the board is also an input.** When it exists, the system reads it:
- **"Make this video"** → find the card; its dates/pillar/context ride along into production.
- **"What should I film this week?" / planning & check-ins** (ideation, consistency, briefing) → read
  Recording Dates + Statuses: what's due, what's stuck in `Scripted`, what got `Published`.
- **Cards the AGENT added by hand** = their ideas. Treat them as real input: offer to produce them, and to
  fold them into the plan — never ignore them, never delete them.

**Conflicts:** the agent's own edits win on dates and forward status moves (they moved filming to Thursday —
that's the new truth; reflect it, offer to update the plan). Strategy stays with the Game Plan + Brain: if
the board has drifted far from the plan, say so plainly and offer to reconcile ("update my board" /
"refresh my plan") — never silently overwrite either side.

## Connecting Notion (when it isn't connected — plain words, never block)

1. Deliver whatever the agent asked for normally first — never block on the connection.
2. One plain line on what it unlocks: *"Want this as a live content board in Notion — like a mission control
   for your videos? Connect Notion once and I'll build and maintain it for you."*
3. The path, step by step: *"Click your profile (bottom-left) → **Settings** → **Connectors** → find
   **Notion** → **Connect** → sign in and approve → come back and say 'connected'."*
4. One reassurance: *"I only create and update your content board — nothing else in your Notion, and nothing
   publishes on its own."*
- Update conduct: rows the agent edited by hand keep their edits — update only the fields the system owns
  (links, status, dates), and never downgrade a status the agent moved forward themselves.
