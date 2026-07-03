---
name: shortform-talkinghead
description: >
  The Talking-Head workflow for the Short-Form Content OS — the agent's batchable "value" content. Gives
  the agent a list of video topics tailored to their local market and niche on the 80/20 rule (80% broad,
  wide-reaching topics for reach; 20% niche-focused for the right leads), then turns the ones they pick
  into ready-to-film scripts (15/30/45-second options, a word-for-word teleprompter version, AND a bullet
  version to riff from), plus per-platform captions/titles/tags. Built for batching — film several in one
  session. Text only; never films or designs.

  Trigger on: "talking head", "talking head ideas", "what should I talk about", "give me short-form
  video topics", "script my talking head", "value videos", "batch my talking heads", "what short videos
  should I make", "give me short form video ideas", or any request for talking-head topics or scripts.
  (For long-form YouTube ideas, that's the YouTube System — this is short-form only.)
---

# Talking-Head Workflow

The agent's value content — them, talking to camera, teaching something useful. This is the batchable
format: hand them a set of topics, script the ones they choose, and they film several in one sitting.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — plain, warm, never technical.

Two modes:
- **"Give me topics"** → run Phase 1 (the 80/20 topic list), let them pick.
- **"Script these"** (or they pasted a topic) → skip to Phase 2 and script the chosen topics.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first (follow its laws), then:
- `identity/profile.md` — name, **city/market**, niche, booking link, handles
- `identity/market.md` — neighbourhoods, price ranges, local conditions
- `identity/avatars.md` — who this is for and what they worry about
- `identity/voice.md` + `identity/voice-samples.md` — tone + their real phrasing (scripts must sound like them)
- `identity/offer.md` — offer, USP, **lead magnets** (for CTAs)
- `identity/content-engine.md` — their content pillars (topics should ladder up to these) + platform priority
- `identity/compliance.md` — the third law
- `memory/content-log.md` — what they've already covered, so topics stay fresh
- `memory/ideas.md` (tag `shortform`) — reel/topic ideas the agent captured on the go; put these at the TOP of the list, and mark each Used once scripted
- `memory/performance.md` — what worked last cycle (from the 2-week review); lean on it when picking topics, hooks, and CTAs. Skip if it doesn't exist yet

**Read the Brain; never re-ask what it knows** (house rules #2). If `~/realtor-brain/` is missing, send
them to **Realtor AI Brain — Setup**.

## Step 2 — Read the reference files
1. `references/topic-guide.md` — how to build the 80/20 topic list (broad vs niche, what makes a strong topic)
2. `references/script-guide.md` — how to write the scripts (15/30/45s, teleprompter + bullet versions)

---

## Phase 1 — The topic list (80/20)
**Read `references/topic-guide.md`.** Produce a ranked list of ~8–10 topics for the agent to choose from,
following the **80/20 rule**: ~80% broad, wide-reaching topics (reach: general buyer/seller questions,
"should I buy now," market mindset, money-saving tips — things anyone in the city cares about) and ~20%
niche-focused (their specialty: e.g. relocation, luxury, first-time buyers — fewer people, but the *right*
people). Ground every topic in their market/niche/pillars; none should be generic enough that a random
agent in another city could post it.

For each topic give: a working **title/angle**, a one-line **hook**, the **funnel role** (reach/value/
trust/conversion — kept silent), and a one-line **why this works for you** (a real local or niche
reason). Present them simply and let the agent pick which to film:
> "Here are some strong ones for you — most are wide-reach, a couple are aimed right at [niche]. Tell me
> which numbers you want to film and I'll script them."

**If they're unsure or say *"you pick"* / *"what do you think?"*, advise** (house rules #8 +
`${CLAUDE_PLUGIN_ROOT}/shared/advisor-playbook.md`): choose the top 3 yourself, give a one-line why for
each (grounded in their market + where they're light in the funnel), and offer to script them right away.
Don't hand an unsure agent a long list to sort through.

## Phase 2 — Scripts (for the chosen topics)
**Read `references/script-guide.md`.** For each chosen topic, build a ready-to-film script package:
- **Length** — **default to 45–60 seconds** (Mike's real-estate sweet spot); offer tighter 15/30s cuts
  for a punchy single-tip.
- **Teleprompter version** — word-for-word, natural spoken rhythm, for agents who like to read it.
- **Bullet version** — the same script as riff points, for agents who'd rather talk freely.
- Built on **HVC** (`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md`): **Hook** (bold, ~3s, never "stop
  scrolling") → **Value** (structured as a list) → **CTA** (aligns with format; doesn't always sell) — in the agent's voice.

## Phase 3 — Platform optimization
Read `${CLAUDE_PLUGIN_ROOT}/skills/shortform-optimizer/references/platform-rules.md` (per-platform rules,
the CTA map, video-asset rules) and produce, for each scripted video — passing the hook, the script, format
= `talking head`, and the CTA intent (apply the CTA map; use a real lead magnet from `offer.md` when the
topic warrants a DM-keyword/download CTA):
- **Video assets** → cover/thumbnail text + 2–3 on-screen text cues
- **Instagram + Facebook** → caption + hashtags (+ FB tweak)
- **TikTok** → one-line caption + hashtags (no line breaks)
- **YouTube Shorts** → title (search-led, city, #Shorts) + description + tags

## Phase 4 — Compliance pass (third law)
Run every script + caption through `~/realtor-brain/identity/compliance.md`. Append disclaimer/license
where required; strip claims to avoid. Flag once if `compliance.md` is empty.

## Phase 5 — Deliver
Clean, copy-paste packages. For each video: the title/angle, the chosen-length script (teleprompter +
bullet), the video assets, and the three platform blocks. Keep the chat around it friendly and short.

If the agent has connected a posting tool (`identity/publishing.md`), offer to schedule the batch at their
best times per `${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md` — only with explicit approval.

## Phase 6 — Save to Drive + log to the Brain
For **each** scripted video:
1. **Save the formatted doc** following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` — structured
   text (topic + the chosen-length script with teleprompter & bullet versions + video assets + the three
   platform blocks) **rendered to a styled `.docx` via the shared renderer** (`render_doc.py`,
   output-standard §6) and uploaded to `[Agent Name] — Short-Form System/Content/[YYYY-MM · Month]/`,
   named `[YYYY-MM-DD] · Talking Head · [Short Topic]`.
2. **Log it:** append a row to `~/realtor-brain/memory/content-log.md`:
   ```
   | [date] | Reels/TikTok/Shorts | Talking head | [topic / angle] · [funnel: reach/value/trust/conversion] | [city/area] | Scripted | |
   ```
Push the Brain to Drive. Then: *"Saved your [N] talking heads to your Drive (Short-Form System → Content →
[month]) and logged them so we don't repeat topics."*

---

## Quality checklist
- [ ] Brain read; nothing re-asked that it already knows
- [ ] Topic list follows 80/20 (mostly broad reach, ~20% niche); every topic is local/niche-specific, not generic
- [ ] Each script has 15/30/45 options + a teleprompter version AND a bullet version
- [ ] Scripts sound like the agent (`voice.md` + `voice-samples.md`); speak to "you"; city named
- [ ] Video assets (cover + on-screen text) + three platform blocks; TikTok caption single line
- [ ] CTA matches funnel role; lead-magnet CTAs point to a real guide from `offer.md`
- [ ] Compliance pass done
- [ ] Text only — no filming, no design rendered
- [ ] Logged to `content-log.md`
