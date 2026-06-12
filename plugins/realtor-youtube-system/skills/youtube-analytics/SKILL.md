---
name: youtube-analytics
description: The Analytics module for the Realtor YouTube System. Reads the agent's real YouTube performance and turns it into plain-English insight — what's working, what's not, and WHY (weak title/thumbnail vs weak hook vs mid-video drop-off) — then feeds Ideation and the Coach. V1 needs ZERO technical setup: the agent exports their analytics CSV from YouTube Studio and uploads/pastes it; Claude parses and diagnoses it. (A one-click "Connect YouTube with Google" OAuth and a team-held key for competitor data are backend upgrades the team builds later — the agent never touches an API key.) Triggers on "how's my channel doing", "analyze my analytics", "how did my last video do", "review my YouTube stats", "here's my YouTube export".
---

# Analytics

Know what actually worked — from the agent's real numbers, with zero technical setup. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## V1 — how the agent gives you data (dead simple: no API, no keys, no console)
The agent exports their stats from **YouTube Studio** — a tool they already use — and uploads/pastes the CSV.
Walk them through it the first time:
1. **YouTube Studio → Analytics → Advanced mode** (top-right).
2. Choose the date range (e.g., last 28 or 90 days) and the **Content** tab for per-video rows.
3. Click **Export → Comma-separated values (.csv)**.
4. Upload the file here (or paste its contents).
That's the whole "connection." No Google Cloud project, no API key, no OAuth.

## Step 1 — Parse what they gave you
From the CSV(s), per video: views, **impressions + CTR**, **average view duration / % viewed**, watch
time, subscribers gained, and (if present) traffic sources + search terms. Compare each video to the
channel's own baseline.

## Step 2 — Diagnose (the useful part)
- **Low CTR** → packaging problem (title/thumbnail), not the content.
- **Good CTR, low % viewed** → hook/pacing problem; note the likely drop point.
- **Strong across the board** → a proven topic — feed it into Ideation to make more.
Tie every diagnosis to one concrete next action.

## Step 3 — Output
A short, plain-English read — **explain each metric in human terms the first time**, benchmark against HER
own past videos (not generic norms), and on a new/small channel don't over-read 1–2 videos (flag "too early
to tell"). Top performer + why, weakest + why + the one fix, and 1–2 "do more of this" signals — each tied to
a real next step. Feed → **Ideation** (and the **Coach**, when asked). Deliver in chat. Nothing stored.

## Backend upgrades (team builds later — the agent NEVER touches these)
- **"Connect YouTube with Google" (OAuth):** a one-click sign-in that auto-pulls analytics so the agent
  can skip the manual export. Requires the team to build/host the OAuth app — a Phase-6 project.
- **Team-held Data API key:** used in the backend for competitor/public data (Outliers). One key,
  team-side; agents never generate or see a key.

## Modes
On-demand, whenever the agent brings fresh stats — monthly is the right cadence for long-form YouTube.
