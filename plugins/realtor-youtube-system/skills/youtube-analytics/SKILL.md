---
name: youtube-analytics
description: The Analytics module for the Realtor YouTube System. Reads the agent's real YouTube performance and turns it into plain-English insight — what's working, what's not, and WHY (weak title/thumbnail vs weak hook vs mid-video drop-off) — then feeds Ideation and the Coach. V1 needs ZERO technical setup: the agent exports their analytics CSV from YouTube Studio and uploads/pastes it; Claude parses and diagnoses it. (A one-click "Connect YouTube with Google" OAuth and a team-held key for competitor data are backend upgrades the team builds later — the agent never touches an API key.) Triggers on "how's my channel doing", "analyze my analytics", "how did my last video do", "review my YouTube stats", "here's my YouTube export".
---

# Analytics

Know what actually worked — from the agent's real numbers, with zero technical setup. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

**Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — §23 (analytics &
feedback: what to review §23.1, the key lead question §23.2, the 90-day audit §23.3, classifying videos by
intent §23.4) and §24.5 (the channel-audit template). The doctrine's rule: **track through to leads &
conversations, not just views** — and don't overreact to a single video.

## V1 — how the agent gives you data (dead simple: no API, no keys, no console)
The agent exports their stats from **YouTube Studio** — a tool they already use — and uploads/pastes the CSV.
Walk them through it the first time:
1. **YouTube Studio → Analytics → Advanced mode** (top-right).
2. Choose the date range (e.g., last 28 or 90 days) and the **Content** tab for per-video rows.
3. Click **Export → Comma-separated values (.csv)**.
4. Upload the file here (or paste its contents).
That's the whole "connection." No Google Cloud project, no API key, no OAuth.

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

## Backend upgrades (team builds later — the agent NEVER touches these)
- **"Connect YouTube with Google" (OAuth):** a one-click sign-in that auto-pulls analytics so the agent
  can skip the manual export. Requires the team to build/host the OAuth app — a Phase-6 project.
- **Team-held Data API key:** used in the backend for competitor/public data (Outliers). One key,
  team-side; agents never generate or see a key.

## Modes
On-demand, whenever the agent brings fresh stats — monthly is the right cadence for long-form YouTube.
