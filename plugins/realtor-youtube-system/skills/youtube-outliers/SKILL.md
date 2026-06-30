---
name: youtube-outliers
description: Competitor Intelligence for the Realtor YouTube System — two jobs. (1) Outlier scan, weekly at most — watches competitor channels for videos that GENUINELY overperform (more than 2,000 views AND at least 3x the channel's subscriber count, and clearly above that channel's own norm) and reverse-engineers them into stronger, localized versions for the agent. (2) Evergreen competition analysis — maps the agent's market for channels over 2,000 subscribers, compiles their most popular videos that are 2+ years old (proven, durable demand), and helps the agent recreate them better. Reads the AI Brain for market, niche, and named competitors. Triggers on "what's working for competitors", "find outlier videos", "competitor research", "competition analysis", "what's blowing up in my niche", "what should I recreate".
---

# Competitor Intelligence

Find proven demand by studying what's already winning. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

> **Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — the **competitive
> audit** (§11.5 + §16.4: study the top 3–5 ranking videos and beat them on title, thumbnail, hook, delivery,
> local specificity, and what's missing), the **analytics lens** (§23.3–§23.4: which topics to repeat from a
> NEW angle, and classifying videos by intent — awareness / trust-building / high-intent lead-gen / niche
> authority / underperforming-needs-new-title-or-thumbnail), and **§3 "R — repetition wins"** (cover the same
> proven topic from many angles to build topic authority — not copy it). Every recreate must be **localized,
> on-brand, and stronger** than the original, never a clone.

## Part A — Outlier scan (weekly MAX — never more)
YouTube long-form doesn't move daily. Run this **once a week at most** — typically refreshed when the
agent asks for ideas, or on demand.

### What counts as an outlier — be strict (most videos don't qualify)
A video only counts if **ALL THREE** are true:
1. **More than 2,000 views**, AND
2. **Views ≥ 3× the channel's subscriber count**, AND
3. It clearly beats that channel's own typical video.

Why so strict: a video with 500 views on a 200-subscriber channel can *look* like an outlier, but it isn't
doing well and isn't special. Small absolute numbers ≠ proven demand. When in doubt, leave it out — a short
list of real outliers beats a long list of noise.

### Steps
1. Channels: the competitors named in the AI Brain; if none, find 3–7 relevant local/niche channels.
2. Scan their recent uploads against the three-part test above (public data — team-held API key in the
   backend, or web/YouTube search; never the agent's credentials).
3. For each true outlier, run the **competitive audit (§11.5 / §16.4)**: title · thumbnail · hook · delivery ·
   structure · local specificity · **what's missing** · why it worked.
4. Translate into a **stronger, localized, on-brand version** for THIS agent — beating the original on title,
   thumbnail, and delivery (§16.4), in the agent's voice and market.

## Part B — Evergreen competition analysis (monthly or on demand)
The deeper sweep — find the **proven, durable** topics in the agent's market worth recreating:
1. **Map the market:** find the channels serving the agent's market/niche with **2,000+ subscribers**.
2. **Mine their greatest hits:** for each, compile their most popular videos that are **2+ years old** —
   topics that still pull views years later = durable search demand, not a spike.
3. **Build the recreate list:** for each, give the agent — the topic · why it's proven (channel + rough view
   scale + age) · their stronger version (audited per §11.5/§16.4 → better title/hook/thumbnail, localized,
   their voice, and what the original missed).
4. **Help them recreate it:** offer to take any pick straight into "Make This Video." Flag the **repeat-from-a-
   new-angle** plays (§3 R, §23.3): a proven topic the agent should cover from several distinct angles over
   time to build topic authority — never the same video twice.

### If automation can't get clean numbers — teach the manual way (5 minutes)
Be honest when the data's out of reach, and show the agent the manual method instead:
> "Search YouTube for 'living in [your city]' / 'moving to [your city]' → open each channel with 2,000+
> subscribers → their Videos tab → sort by **Popular** → note the videos that are 2+ years old with big
> view counts. Paste me that list and I'll turn them into your stronger versions."

## Honesty
Web-based scans are imperfect (view/sub counts aren't always visible). Say so when precision is limited;
the backend API key (team-built) makes it sharper later. Never present a guess as data.

## Output
Short, real lists only — outlier angles and the recreate list — fed into **Ideation** as "Signals for
ideas" and surfaced in chat. Nothing stored, nothing padded. Where it sharpens a recommendation, tag a pick by
its **intent role (§23.4)** — awareness · trust-building · high-intent lead-gen · niche authority · or a
repeat-from-a-new-angle (§3 R, §23.3) — so the agent knows *why* it's worth recreating, not just that it ranked.

## Modes
Part A: weekly max, at ideation time + on demand. Part B: monthly or on demand ("competition analysis").
