---
name: shortform-optimizer
description: >
  The shared Platform Optimizer for the Short-Form Content OS. Takes ONE short-form post (its topic,
  hook, talking points or script, format, and CTA intent) and produces platform-specific publishing
  metadata so the same content performs natively on each app: Instagram + Facebook (caption +
  hashtags), TikTok (caption + hashtags, no line breaks), and YouTube Shorts (title + description +
  tags). Reads the agent's Brain for voice, CTA, local market, and compliance. Every other short-form
  skill (green screen, talking head, carousel) calls this as its optimization step — it is the single
  source of truth for platform rules. Text only; never designs or renders anything.

  Trigger on: "optimize this for each platform", "make platform versions", "captions and hashtags for
  Instagram TikTok and Shorts", "optimize my post", "platform-specific captions", "write my captions
  and hashtags", or whenever a short-form workflow reaches its optimization step.
---

# Short-Form Platform Optimizer

One post → native versions for every platform. Same core idea, optimized differently for how each app
ranks, displays, and rewards content. This skill produces **text only** — captions, hashtags, titles,
descriptions, tags. It never generates images, slides, or designs.

This is the **shared optimization engine** for the Short-Form Content OS. The green-screen, talking-
head, and carousel workflows all call it. Keeping the platform rules in one place means every piece of
content the agent posts follows the same up-to-date playbook.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — if you ever speak to the agent,
keep it plain and warm, never technical. (Usually you're invoked behind the scenes by another workflow.)

---

## Step 1 — Load the Brain

**Read `~/realtor-brain/brain.md` first** (follow its three laws), then open what this skill needs:

- `~/realtor-brain/identity/voice.md` — tone, signature phrases, and the **Primary CTA** (every caption ends on it unless the post's CTA intent overrides)
- `~/realtor-brain/identity/voice-samples.md` — the agent's **real writing samples**; match their actual cadence and phrasing so captions sound like them, not generic AI
- `~/realtor-brain/identity/profile.md` — city/market, niche, **social handles**, booking link
- `~/realtor-brain/identity/market.md` — neighbourhoods and local terms (for hyperlocal hashtags + keywords)
- `~/realtor-brain/identity/avatars.md` — who the post is for (shapes which keywords/hashtags matter)
- `~/realtor-brain/identity/offer.md` — offers, USP, **lead magnets** (the guides/checklists CTAs point to) — required for DM-keyword and download CTAs (see the CTA map)
- `~/realtor-brain/identity/content-engine.md` — platform priority order (optimize those first) and any signature series
- `~/realtor-brain/identity/compliance.md` — the third law; read before finalizing any public text

**The first law: read the Brain, never re-ask what it already knows.** The agent set all of this up once
(in Cowork; it lives in their Google Drive `Realtor AI Brain` folder and syncs to `~/realtor-brain/`).
Pull voice, market, avatar, offers, lead magnets, and handles straight from these files — do not ask the
agent for anything that's in them.

- **If `~/realtor-brain/` doesn't exist:** tell the agent to run _Realtor AI Brain — Setup_ first.
- **If a genuinely needed field is missing** (most commonly: no lead magnets listed in `offer.md`, so a
  DM-keyword CTA has nothing to point to): ask for it **once**, use it, then **write it back to the Brain**
  (append it to the relevant identity file and push to Drive per `brain.md`) so it's never asked again.

> Note: hashtags and hooks are intentionally **not** stored in the Brain — this skill generates them
> fresh per post so they stay timely and specific.

---

## Step 2 — Read the platform rules

**Read `references/platform-rules.md`** — the per-platform caption structure, hashtag strategy, length
targets, and the hard rules (e.g. TikTok strips line breaks; YouTube Shorts is a search play). That
file is the canonical spec. Apply it exactly.

---

## Step 3 — Get the post

If another short-form skill invoked you, you already have the post — use what it passed: the **hook**,
**talking points or script**, **format** (green screen / talking head / carousel / tour / story), and
**CTA intent** (see below). Do not re-ask.

If the agent invoked you directly, get the minimum:
1. **The post** — paste the script/talking points, or just the topic + hook.
2. **The format** — green screen, talking head, carousel, home tour, client story, personal story.
3. **CTA intent** — if unclear, infer it from the funnel role (see the CTA map below) and confirm in one line.

### CTA intent — the silent 4-3-2-1 logic
The agent thinks in formats; you keep the funnel balanced by matching the right CTA to each post's role:

| Funnel role | CTA direction |
|---|---|
| Awareness (reach) | follow / save / "send this to someone who…" |
| Trust (connection) | invite a reply, comment, or DM'd question — no ask for business |
| Authority (education) | "DM me '[KEYWORD]' for the [guide]" — tied to a real lead magnet |
| Conversion | book a call / download the lead magnet / request a valuation (Primary CTA from `voice.md`) |

Apply the **full CTA map** — the topic-level routing (DM "BUYER"/"SELLER"/"RELOCATION", market report,
neighbourhood guide) and the rule that DM-keyword/download CTAs must point to a **real lead magnet from
`offer.md`** — from `references/platform-rules.md` in Step 4. Only ~1 in 10 posts is a hard conversion
CTA (the "1" in 4-3-2-1); when unsure, default to a soft CTA. If `offer.md` lists no lead magnets, ask
once, use them, and write them back to the Brain (Step 1) so it's never asked again.

---

## Step 4 — Produce the platform versions

Optimize for the agent's **priority platforms first** (from `content-engine.md`); produce all three
blocks unless the agent named specific platforms. Follow `references/platform-rules.md` for each.

Everything must sound like the agent (`voice.md` + `voice-samples.md`), speak to their avatar, and name
the local market. The hook/idea is shared; the **packaging is per platform** — do not paste one identical
caption across all three.

### Video assets (for video formats — green screen, talking head, home tour, story; NOT carousel)
When the format is a video, also produce these — they belong to the post, not a single platform:
- **Cover / thumbnail text** — the bold 3–6 word overlay on the first frame (the "thumbnail" of a
  Reel/Short). This is what stops the scroll in the grid. Give 1 strong option (offer a 2nd if useful).
- **On-screen text cues** — 2–3 short overlays (≤6 words each) for retention: the key stat, the city, a
  key phrase, placed at the beats where they reinforce what's being said.

These are **text instructions only** — the agent adds them in their editor (CapCut/Reels/etc.). Never
render them as an image.

---

## Step 5 — Compliance pass (the third law)

Before delivering, run every caption/description through `~/realtor-brain/identity/compliance.md`:
- Append the required brokerage disclaimer + license # where the display rule applies.
- Remove any "claims to avoid" (guarantees, unsourced "#1/best", steering language).
- If `compliance.md` is empty, proceed but add one line: *"⚠️ Compliance file is unset — double-check your brokerage's disclaimer rules before posting."*

---

## Step 6 — Deliver

Present clean, copy-paste-ready blocks. No preamble inside the blocks — the agent copies them straight
into each app (or into the scheduler).

```
─────────────────────────────────────
VIDEO ASSETS  (skip for carousel)
─────────────────────────────────────
COVER / THUMBNAIL TEXT: [bold 3–6 word overlay for the first frame]
ON-SCREEN TEXT: [cue 1] · [cue 2] · [cue 3]

─────────────────────────────────────
INSTAGRAM + FACEBOOK
─────────────────────────────────────
CAPTION:
[caption — hook line first, value, CTA]

HASHTAGS:
[8–12 hashtags]

(Facebook tweak: [one line — e.g. "trim to ~4 hashtags; you can paste your booking link directly"])

─────────────────────────────────────
TIKTOK
─────────────────────────────────────
CAPTION (one line, no line breaks):
[short keyword-led caption + hashtags inline]

─────────────────────────────────────
YOUTUBE SHORTS
─────────────────────────────────────
TITLE:
[search-friendly, <70 chars, includes city, ends with #Shorts]

DESCRIPTION:
[2–3 lines, keywords + context + CTA + booking link]

TAGS:
[8–15 comma-separated tags]
─────────────────────────────────────
```

If a Brain-set posting/scheduling connector is configured (see `identity/publishing.md`), offer:
*"Want me to schedule these at your best times?"* — but never schedule without explicit approval.

---

## Quality checklist (run before delivering)
- [ ] Brain was read; nothing was asked that the Brain already answers
- [ ] Each platform has its OWN packaging — not one caption pasted three times
- [ ] Every caption opens with a scroll-stopping first line (front-loaded before the "…more" cut)
- [ ] TikTok caption is a **single line with no line breaks**
- [ ] YouTube Shorts title is search-led, includes the city, and is under ~70 characters
- [ ] At least 2 hyperlocal hashtags on IG (#[City]RealEstate, #[City]Homes or a neighbourhood tag)
- [ ] Video formats include cover/thumbnail text + on-screen text cues (skipped for carousel)
- [ ] CTA matches the post's funnel role; DM-keyword/download CTAs point to a **real** lead magnet from `offer.md`
- [ ] Voice matches `voice.md` + `voice-samples.md`; the city is named; it speaks to the avatar
- [ ] Compliance pass done (disclaimer/license appended where required; no banned claims)
