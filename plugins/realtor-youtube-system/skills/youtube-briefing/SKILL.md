---
name: youtube-briefing
description: OPTIONAL Monday Kickoff for the Realtor YouTube System — OFF by default. The core system is fully on-demand (the agent just asks for their next batch of content); this exists only for agents who explicitly want a scheduled Monday message. When enabled, it runs the same Ideation flow (fresh research → ranked ideas with data-backed whys, gaps baked in), pre-builds the #1 idea so it's film-ready, flags anything timely, and emails ONE short message from the agent's Gmail. Requires a scheduled task set up during onboarding. Triggers on "set up my Monday kickoff", "turn on my weekly briefing", "run my Monday kickoff", "send my kickoff now", "weekly briefing".
---

# Monday Kickoff (OPTIONAL — off by default)

The system's core is **on-demand** — one idea flow, least friction, least breakage. This skill exists ONLY
for agents who explicitly ask for a scheduled Monday nudge. **Never enable it by default, never imply it's
required.** Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## What it does (when an agent turns it on)
1. Runs **Ideation** fresh — research → triggers → outlier scan (weekly max) → ranked ideas, gaps baked in.
2. Pre-builds the **#1 idea** (script + SEO package) into its Videos folder so it's genuinely film-ready.
3. Flags anything **timely** this week.
4. Composes ONE short, warm, skimmable email and sends it from the agent's **Gmail**.

```
GOOD MORNING, {Agent} — your YouTube week

🎬 FILM THIS WEEK: {#1 title} — already scripted ✅ (link)
💡 ALSO READY: {ideas #2–#5, one line each — each with its data-backed why}
🔥 TIMELY: {any local event worth jumping on}
```

## Rules
- ONE short message; every idea carries its real "why"; plain, warm tone (house rules §6, §7).
- The first kickoff of a month includes the market-report offer (same line Ideation uses).
- If the schedule ever fails, nothing is lost — everything here is available on demand by asking.

## Setup + honesty
Requires a scheduled task (host scheduler), set up with team help — only if the agent asks for it. Be clear
when enabling: "You can always just ask me for ideas anytime — this only adds the Monday email."
