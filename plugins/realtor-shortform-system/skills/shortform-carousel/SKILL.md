---
name: shortform-carousel
description: >
  The Carousel workflow for the Short-Form Content OS — value-driven swipe posts for agents who don't want
  to film. Produces a complete carousel SPEC as copyable text: a cover-slide hook, slide-by-slide copy
  (6–9 slides), design direction in plain words, and an Instagram + Facebook caption with hashtags and a
  CTA that drives to a lead magnet or asks people to share it with a friend. The agent pastes the copy into
  claude.ai/design to build the actual slides. SPEC ONLY — this skill NEVER renders slides, images, or any
  design.

  Trigger on: "carousel", "make a carousel", "carousel post", "swipe post", "I don't want to film",
  "value post without filming", "Instagram carousel", "carousel ideas", "turn this into a carousel", or
  any request for a carousel / non-video value post.
---

# Carousel Workflow (spec only)

The no-filming format. When the agent doesn't feel like being on camera, this gives them a high-value
swipe post — fully written — that they build in their design tool in a few minutes.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

> **We map; we never design (house rules #3).** This skill outputs the *words and the direction* only.
> It does NOT create slides, images, or PNGs. The agent copies the spec into **claude.ai/design** to make
> the visuals. If you ever feel tempted to render a slide — don't. Hand over the copy and the direction.

Carousels do two jobs: deliver real value (so people **save** and **share**), and drive action — either
to a **lead magnet** or a **"send this to a friend"** ask (great for growth + brand awareness). Carousels
are an **Instagram + Facebook** format, so optimization is IG/FB only.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, **city/market**, niche, handles
- `identity/market.md` — neighbourhoods, price ranges, local facts (carousels are full of specifics)
- `identity/avatars.md` — who it's for and what they worry about
- `identity/voice.md` + `identity/voice-samples.md` — tone + their real phrasing
- `identity/offer.md` — offer, USP, **lead magnets** (a carousel often drives to one)
- `identity/brand-visual.md` — their colours, fonts, and vibe — used to write the **design direction in
  words** (NOT to render anything)
- `identity/compliance.md` — the third law
- `memory/content-log.md` — avoid repeating a recent carousel topic

**Read the Brain; never re-ask what it knows** (house rules #2). If `~/realtor-brain/` is missing, send
them to **Realtor AI Brain — Setup**.

## Step 2 — Read the reference file
`references/carousel-guide.md` — carousel types, slide structures, and what makes one get saved/shared.

---

## Phase 1 — Pick the topic + the job
If the agent gave a topic, use it. If not, suggest 3–5 strong options from `carousel-guide.md` types,
grounded in their market/niche: local guides ("7 best coffee shops in [area]"), buyer education ("5 things
to know before buying your first home"), seller checklists ("6 things to do before you list"), neighbourhood
guides, market breakdowns, relocation content. Decide the **job**: drive to a **lead magnet** (from
`offer.md`) or a **share-with-a-friend** ask. Confirm in one friendly line.

**If they're unsure or ask your opinion, advise** (house rules #8 +
`${CLAUDE_PLUGIN_ROOT}/shared/advisor-playbook.md`): lead with the ONE you'd recommend and why (best fit
for their market + goal — e.g. a lead-magnet carousel if they need leads, a local guide if they need
reach), then offer the others as backups. Recommend; don't just list.

## Phase 2 — Build the carousel spec
**Read `references/carousel-guide.md`.** Produce, as clean copyable text:
- **Cover slide (slide 1)** — the hook. The single most scroll-stopping promise. Bold, short, benefit-led.
- **Slide-by-slide copy** — **6–9 slides total.** One idea per slide, short lines, easy to skim. Build
  momentum so people keep swiping; the last content slide pays off the cover's promise.
- **Final slide — the CTA** — either "DM me '[KEYWORD]' for [the lead magnet]" / "grab the [guide] — link
  in bio," or "save this + send it to someone who needs it." Use a real lead magnet from `offer.md`.
- **Design direction (in words)** — plain guidance the agent gives their design tool: suggested layout,
  which slide is the hook, where the CTA goes, and their brand colours/fonts/vibe from `brand-visual.md`
  (e.g. "dark slides, gold accents, big bold headline font, lots of white space, your logo small in the
  corner"). Words only — never a rendered example.

## Phase 3 — Caption (Instagram + Facebook)
Read `${CLAUDE_PLUGIN_ROOT}/skills/shortform-optimizer/references/platform-rules.md` and produce the
**Instagram + Facebook** block only (caption + hashtags + the FB tweak), applying the CTA map. (Carousels
aren't a TikTok/Shorts format — skip those.)

## Phase 4 — Compliance pass (third law)
Run the slides + caption through `~/realtor-brain/identity/compliance.md`. Disclaimer/license where
required; strip claims to avoid; Fair-Housing-safe (no "good area" proxies). Flag once if empty.

## Phase 5 — Deliver
One clean, copy-paste package: the slide-by-slide copy, the design direction, and the IG+FB caption +
hashtags. Close with a plain hand-off:
> "Here's your carousel — copy the slides into claude.ai/design to build it, then post with the caption
> below. Want another one?"

If the agent has connected a posting tool (`identity/publishing.md`), offer to schedule it once they've
built the slides, per `${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md` (carousels usually use the
hybrid path — caption + time scheduled, agent adds the built slides) — only with explicit approval.

## Phase 6 — Write back to the Brain (second law)
Append a row to `~/realtor-brain/memory/content-log.md`, then push to Drive:
```
| [date] | Instagram/Facebook | Carousel | [topic / angle] | [city/area] | Drafted | |
```

---

## Quality checklist
- [ ] Brain read; nothing re-asked that it already knows
- [ ] **No design rendered** — copy + written direction only (house rules #3)
- [ ] Cover slide is a genuine scroll-stopper; 6–9 slides; one idea per slide; skimmable
- [ ] Real value (worth a save); ends on a clear CTA — lead magnet (real, from `offer.md`) or share-with-a-friend
- [ ] Design direction uses their brand colours/fonts/vibe from `brand-visual.md` — in words
- [ ] IG + FB caption + hashtags only (no TikTok/Shorts)
- [ ] Voice matches `voice.md` + `voice-samples.md`; local and specific
- [ ] Compliance pass done
- [ ] Logged to `content-log.md`
