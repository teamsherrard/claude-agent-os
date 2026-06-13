---
name: shortform-greenscreen
description: >
  The Daily Green Screen workflow for the Short-Form Content OS. Once a day, finds the single most
  timely, locally-relevant real estate or market article worth reacting to RIGHT NOW, and delivers a
  ready-to-film package: the verified article + the key stat to hold on screen + a word-for-word HOOK +
  4–6 KEY TALKING POINTS (not a full script, so delivery stays natural and fast) + platform-specific
  captions/titles/tags. Reactive and daily on purpose — timeliness drives green-screen performance, so
  this is never batched. Text only: it does NOT generate green-screen backgrounds, images, or designs —
  the agent holds the article on their phone or builds a background separately in claude.ai/design.

  Trigger on: "green screen", "my green screen", "today's green screen", "daily green screen", "what
  should I react to today", "find me something to film today", "what's relevant to film right now",
  "trending article to react to", "give me my green screen for today", or any request for a daily,
  timely article-reaction short.
---

# Daily Green Screen

The agent's daily reaction post. Find the one thing happening in their market right now that's worth a
30–60 second take, hand them a hook and the talking points, and let them film it in two minutes.

**Why daily and reactive (not batched):** green screen earns reach by being *timely* — "I'm on top of
this market today." Batching a week of reactions in advance kills that signal. Run this once per day on
whatever is freshest.

**Why talking points, not a script:** reaction content should sound natural and unscripted. The agent
reads the **hook** word-for-word to stop the scroll, then **riffs from bullet points** in their own
voice. That's faster to film and far more watchable than reading a script to camera.

**This skill is text only.** No PNG backgrounds, no rendered graphics. The agent pulls the article up
on their phone and holds it behind them (or makes a background in claude.ai/design from the cover/
on-screen text the optimizer returns). Never generate an image here.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — above all #1: talk to the agent
plain and warm, never technical. No tool names, no jargon, no overwhelm.

---

## Step 1 — Load the Brain

**Read `~/realtor-brain/brain.md` first** (follow its three laws), then open:

- `~/realtor-brain/identity/profile.md` — name, **city/market** (the primary search target), niche, booking link, handles
- `~/realtor-brain/identity/market.md` — neighbourhoods, price ranges, local conditions
- `~/realtor-brain/identity/avatars.md` — who this is for and what they worry about right now
- `~/realtor-brain/identity/voice.md` — tone, never-sounds-like, signature phrases, Primary CTA
- `~/realtor-brain/identity/voice-samples.md` — the agent's real writing samples; match their actual phrasing
- `~/realtor-brain/identity/offer.md` — offers, USP, and **lead magnets** (so the CTA can point to a real guide)
- `~/realtor-brain/identity/compliance.md` — the third law; read before finalizing
- `~/realtor-brain/memory/content-log.md` — what's already been covered, so today's pick is fresh

**The first law: read the Brain, never re-ask what it already knows.** The agent built all of this once
in Cowork; it lives in their Google Drive `Realtor AI Brain` folder and syncs to `~/realtor-brain/`. The
city, audience, voice, offers, lead magnets, and handles are already here — use them; don't ask.

- **If `~/realtor-brain/` doesn't exist:** tell the agent to run _Realtor AI Brain — Setup_ first.
- **If only the city or audience is missing:** ask just for those — nothing else.
- **If a needed field is genuinely absent** (e.g. no lead magnets for a CTA): ask once, use it, and write
  it back to the Brain (push to Drive per `brain.md`) so it's never asked again.

---

## Step 2 — Read the reference files

1. `references/search-guide.md` — where to find timely articles, freshness rules, what makes one usable
2. `references/hook-formulas.md` — 10 hook formulas; pick the best fit for today's article
3. `references/talking-points-guide.md` — how to write the hook + talking points (the core deliverable)

---

## Phase 1 — Find today's article (pick ONE)

Today's pick must be **fresh and reactable**. Run the searches in `search-guide.md` for the agent's
city/market, prioritizing items published in the **last 0–3 days**.

1. Run the search categories (local market, rates, buyer/seller trends, national-with-local-angle, local development).
2. Shortlist the 3–4 most timely, locally-relevant, reaction-worthy items.
3. **Verify links with web_fetch** — read the actual article; confirm it loads (no 404 / paywall / redirect). Never use a headline alone or a guessed URL.
4. Check `content-log.md` — don't resurface a story/angle already covered recently.
5. **Pick the single best one for today.** Briefly mention 1–2 runners-up so the agent can swap if they'd rather react to a different one — but lead with your pick. Don't stall the daily flow waiting for a choice. If they're unsure or say *"you pick"* / *"what do you think?"*, just choose the best one and go — that's the advisor move (house rules #8).

**Choose for:** freshness (0–3 days wins) → local relevance ([city]-specific beats national) →
reaction potential (can the agent add a real take?) → a stat that stops the scroll.

---

## Phase 2 — Build the green-screen package

**Read `references/talking-points-guide.md`** and produce, for the chosen article:

- **The article line** — headline, source, date, verified link, and the **key stat to hold/show on screen**.
- **The hook** — one line, under 10 words, **word-for-word** (the agent reads this exactly), using a formula from `hook-formulas.md`.
- **4–6 key talking points** — shorthand bullets the agent riffs from, in this beat order:
  1. What happened / the key number (the setup)
  2–3. What it actually means for a buyer/seller in [city] right now (**the take — where the value lives**)
  4. A forward look or a piece of advice ("here's what I'm telling my clients…")
  5. The CTA beat (matched to funnel role; lead-magnet CTAs come from `offer.md`)
- **Estimated runtime** — aim 30–60 seconds.

*(Cover/thumbnail text and on-screen text cues are produced in Phase 3 by the optimizer, so they're
consistent with the platform packaging — don't write them here.)*

Talking points are **prompts, not sentences to read.** Opinionated, local, "you"-focused. No news-anchor
language ("according to…", "experts say…") — the agent already knows this and is sharing it.

---

## Phase 3 — Platform optimization

Run the shared optimizer. **Read
`${CLAUDE_PLUGIN_ROOT}/skills/shortform-optimizer/references/platform-rules.md`** (the canonical spec —
per-platform rules, the CTA map, and the video-asset rules) and produce, for this post — passing through
the hook, the talking points, format = `green screen`, and the CTA intent (default to a soft CTA; green
screen is usually Awareness/Authority — apply the CTA map, using a real lead magnet from `offer.md` if
the post warrants a DM-keyword/download CTA):

- **Video assets** → cover/thumbnail text + 2–3 on-screen text cues
- **Instagram + Facebook** → caption + hashtags (+ the FB tweak)
- **TikTok** → one-line caption + hashtags (**no line breaks**)
- **YouTube Shorts** → title (search-led, city, #Shorts) + description + tags

---

## Phase 4 — Compliance pass (third law)

Run every caption/description through `~/realtor-brain/identity/compliance.md`: append the disclaimer +
license # where the display rule applies; strip any "claims to avoid." If `compliance.md` is empty,
proceed and flag it once.

---

## Phase 5 — Deliver

One clean, copy-paste package:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TODAY'S GREEN SCREEN — [date]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ARTICLE
Headline: [exact headline]
Source: [publication] · Published: [date]
Link: [verified URL]   ← pull this up on your phone and hold it behind you
Key stat (show on screen): [the number]

─────────────────────────────────────
HOOK (read word-for-word):
[hook]

TALKING POINTS (riff in your own words):
• [point 1 — the number / what happened]
• [point 2 — what it means for you in [city]]
• [point 3 — the take]
• [point 4 — advice / forward look]
• CTA: [one line]

Estimated runtime: [X] sec

─────────────────────────────────────
[VIDEO ASSETS block — cover/thumbnail text + on-screen text]
[INSTAGRAM + FACEBOOK block]
[TIKTOK block]
[YOUTUBE SHORTS block]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

If the agent has connected a posting tool (`identity/publishing.md` — Metricool, GoHighLevel, or Buffer),
offer to schedule it at the best time, following `${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md` —
**only with explicit approval** (never auto-post). If they post manually, just hand over the post.

---

## Phase 6 — Write back to the Brain (second law)

Append one row to `~/realtor-brain/memory/content-log.md`, then push to Drive per `brain.md`:

```
| [date] | Reels/TikTok/Shorts | Green screen | [article angle] | [city/area] | Scripted | [article URL] |
```

Then tell the agent: *"Logged today's green screen to your Brain."* (Reminder: an unsynced write is a
lost write — push to Drive.)

---

## Quality checklist (run before delivering)
- [ ] Brain was read (city, audience, voice, offers, lead magnets); nothing re-asked that the Brain answers
- [ ] Exactly ONE article, published within the last 0–7 days (0–3 ideal), link verified via web_fetch
- [ ] Not a repeat of a recent angle in `content-log.md`
- [ ] Hook is one line, under 10 words, word-for-word, from a formula
- [ ] Talking points are bullets to riff from — NOT a written-out script
- [ ] At least one genuine local take (not a news recap); city named; "you"-focused
- [ ] No news-anchor language ("according to…", "experts say…")
- [ ] Video assets included (cover/thumbnail text + on-screen cues); three distinct platform blocks; TikTok caption single line, no breaks
- [ ] CTA matches the funnel role (soft by default); any lead-magnet CTA points to a real guide from `offer.md`
- [ ] Compliance pass done
- [ ] No image/background generated — text only
- [ ] Logged to `content-log.md`
