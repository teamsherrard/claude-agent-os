---
name: youtube-analytics
description: >
  YouTube Analytics — the Realtor YouTube System's data skill, powered by the live data connection
  (Composio). Reads the agent's real YouTube performance and turns it into plain-English insight — what's
  working, what's not, and WHY (weak title/thumbnail vs weak hook vs mid-video drop-off) — then feeds
  Ideation and the Coach. Two ways in, never blocked: with the live data connection (one optional sign-in,
  offered HERE on first use — never at setup) it pulls the channel + per-video numbers automatically; without
  it, the agent drops their YouTube Studio export or a screenshot and gets the same analysis. This is the
  ONLY YouTube skill that uses the live data connection. Triggers on "how's my channel doing", "analyze my
  analytics", "how did my last video do", "review my YouTube stats", "here's my YouTube export", "set up my
  analytics", "live analytics", "connect my analytics".
---

# Analytics

Know what actually worked — from the agent's real numbers, with zero technical setup. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

**Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — §23 (analytics &
feedback: what to review §23.1, the key lead question §23.2, the 90-day audit §23.3, classifying videos by
intent §23.4) and §24.5 (the channel-audit template). The doctrine's rule: **track through to leads &
conversations, not just views** — and don't overreact to a single video.

## How you get the data (best-first — never blocked on anything)
1. **The live data connection (best)** — if the Composio tools are present in this session, pull the real
   numbers directly (`${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md`, recipes 1 + 5: channel stats →
   the upload catalog → per-video views/likes/lengths/dates). READ-ONLY, always — never a write tool.
   **First use in a session:** warn in plain words RIGHT BEFORE the first call — *"quick one — a permission
   box will pop up so I can pull your real YouTube numbers; hit Allow and we're set."* Never let the card
   appear unexplained. If they deny it, fall back to #2 silently and don't re-trigger it this session.
   **Not connected at all?** Offer it ONCE, in plain words: *"want me to hook into live YouTube data? One
   sign-in, and from then on I pull your numbers automatically."* Record the answer in the YouTube Layer
   (`active` / `declined [date]`) and never re-offer. Never during setup or the Game Plan — this skill is
   the connection's only home.
2. **The Studio export / screenshot (always works, and the only source for private depth)** — watch time,
   CTR, and retention aren't in the public data, so for the deep read walk them through it once:
   **YouTube Studio → Analytics → Advanced mode → pick the range → Content tab → Export → CSV** — or just
   a screenshot of the analytics screen; vision reads it fine.
Plain-talk rule: it's "hook into live data — one sign-in," **never "connect your YouTube channel"** (that
phrasing makes agents think there's a technical project; real testers froze on it).

**Works on ANY public channel — including someone else's.** Public reads (titles, views, lengths, cadence,
top performers) only need a channel LINK — the agent's own, a competitor's, or another agent's channel a
coach is testing on ("audit this channel: [URL]"). Only the private depth (watch time, CTR, retention) needs
that channel owner's Studio export or screenshot.

## Step 1 — Parse what they gave you
From the CSV(s), per video, review the doctrine's full set (§23.1): views, **impressions + CTR**, **average
view duration / % viewed**, **retention graph** (where viewers drop), watch time, **traffic sources**,
**search terms**, comments, and subscribers gained. Compare each video to the channel's own baseline.

**The numbers are only half of it (§23 — track through to leads, not just views).** The CSV can't see who
booked a call, so ask the agent for it: which videos generated comments, calls, emails, or booked
appointments — and, the single most important question (§23.2), **"Which video did you watch that made you
decide to reach out?"** Tell the agent to ask every new lead that, and feed their answers in here. That's the
real signal — a video with modest views that produces conversations beats a high-view video that produces
none. (The Lead Engine and the Coach use this too.)

## Step 2 — Diagnose (the useful part)
- **Low CTR** → packaging problem (title/thumbnail), not the content.
- **Good CTR, low % viewed** → hook/pacing problem; note the likely drop point.
- **Strong across the board** → a proven topic — feed it into Ideation to make more.
Tie every diagnosis to one concrete next action.

**Classify each video by intent, not just performance (§23.4)** — a low-view video can still be a win.
Sort them into: **awareness** · **trust-building** · **high-intent lead-gen** · **niche-authority** ·
**underperforming → needs a new title or thumbnail** · **worth repeating from a new angle**. Judge each by
whether it pulled the *right* intent (and leads), not by views alone. **Don't overreact to a single video**
(§23) — look for the pattern across the catalog.

## Step 3 — Output
A short, plain-English read — **explain each metric in human terms the first time**, benchmark against HER
own past videos (not generic norms), and on a new/small channel don't over-read 1–2 videos (flag "too early
to tell"). Top performer + why, weakest + why + the one fix, and 1–2 "do more of this" signals — each tied to
a real next step. Where leads data exists, name which videos actually drove conversations (§23.2), not just
views. Feed → **Ideation** (and the **Coach**, when asked). Deliver in chat. Nothing stored.

## The 90-day audit (§23.3) + channel-audit template (§24.5)
When there's a real body of work (~90 days / a dozen-plus videos) or the agent asks for the big-picture read,
run the doctrine's **90-day audit questions (§23.3):** which videos got the most views · highest CTR · best
retention · most comments · the most **leads** · which were easiest to make / felt most natural · which
pillars to increase · which topics to repeat from a new angle · which titles + thumbnails performed best.

For a full channel audit, walk the **§24.5 template:** niche clarity · local specificity · pillar balance ·
search intent · title quality · thumbnail quality · hook strength · **CTA strength** · posting consistency ·
description optimization · next-video strategy · **lead-conversion path** · 90-day recommendations. (The Coach
owns the deep on-demand audit — hand off there for the full pass.)

## Scope — analytics is the connection's ONLY home
The live data connection powers THIS skill and nothing else in the plugin. Setup, the Game Plan, references,
make-video, comments, the channel page — all run on the classic paths and never touch it (locked after live
cold-tests: no permission cards during onboarding, ever). The wider engine recipes stay parked for the
future PRO tier (`shared/composio-data-engine.md`).

## Modes
On-demand, whenever the agent brings fresh stats — monthly is the right cadence for long-form YouTube.
