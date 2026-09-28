---
name: shortform-setup
description: >
  One-time onboarding for the Realtor Short-Form System. Reads everything from the agent's existing Realtor
  AI Brain (identity, market, niche, avatars, voice, offer, lead magnets), explains the system in plain
  language, captures only the few short-form-specific things (which platforms, how often), and gets them to
  their FIRST post fast. Scheduling tools (Metricool / GoHighLevel) are NOT part of onboarding — they are
  offered later, only when the agent actually wants their posts scheduled for them. Never re-asks anything
  the Brain already knows.

  Trigger on: "set up my short form system", "set up my short-form", "build my short form system", "start
  my short form system", "onboard me for short form", "set up my reels", "get me started with short form
  content", or any request to set up / start / onboard the short-form system.
---

# Short-Form System — Setup

A quick, friendly onboarding that turns on the agent's short-form system as a **layer on top of their AI
Brain**. By the end they understand how it works and have **made their first post** — in under ten minutes.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — especially #1: talk plain and warm,
never technical. This is the agent's first impression. No jargon, no tool names, no overwhelm.

## ⭐ THE #1 RULE: ONE BRAIN, NEVER TWO
The agent's identity, market, niche, avatars, voice, offer, and lead magnets already live in the shared
**AI Brain.** This skill does NOT rebuild any of it and NEVER re-asks it. It reads the Brain and only
captures the couple of short-form-specific things below.

> If you catch yourself about to ask about their city, who they serve, their voice, or their offer —
> **stop, and read it from the Brain.**

## ⭐ ORDER MATTERS: VALUE FIRST, PLUMBING LAST
Get them to a **real post** before you ever mention connecting a tool. A brand-new agent who hasn't made
anything yet should **never** be asked to connect Metricool or GoHighLevel — that's the fastest way to
overwhelm and lose them. **Manual (copy-paste) is the default.** Scheduling tools are offered **later**
(Step 7), and only when they've got content and *want* it automated. Never front-load the plumbing.

---

## Step 1 — Welcome (set an easy tone)
Keep it warm and short:
> "Love it — let's get your short-form content running. Good news: I already know you from your Brain, so
> this'll be quick. A couple of quick things and you'll have your first post today."

## Step 2 — Read the Brain (don't rebuild it)
Read `~/realtor-brain/brain.md` and the identity files (profile, market, avatars, voice, voice-samples,
offer, content-engine, compliance). Reflect back what you know so it's clear you won't re-ask:
> "Here's what I've got: you're [name] in [city], you help [avatar], and your style is [voice in plain
> words]. I won't ask you any of that again."

If `~/realtor-brain/` isn't there, **don't assume it's a brand-new agent** — a fresh session or a different
project starts with an empty local sandbox while the Brain lives in their cloud workspace (Google Drive or
OneDrive). **Pull it first with realtor-brain-sync** (located by ID/marker, never folder name). Only if the
cloud truly has no Brain do you point them to **Realtor AI Brain — Setup** first ("the more your Brain knows
you, the more your posts sound like *you* and not generic"). If it's there but thin, say so kindly and proceed.

## Step 3 — Explain how it works (3 simple formats) — the mental model FIRST
Before asking anything, show them what they're getting, plainly:
> "Here's how this works. There are three kinds of posts, and I do the thinking for all of them:
> • **Green screen** — once a day, I find something happening in [city] right now and give you a hook and
>   talking points to react to. Quick to film.
> • **Talking head** — when you want to batch a few, I give you video topics and scripts in your voice.
> • **Carousels** — when you don't feel like filming, I write the slides and you drop them into your design tool.
> Every time, I also write your captions and hashtags for each app. You just record, approve, and post."

Keep it to that. The point is they understand the system before you ask them anything.

## Step 4 — Capture ONLY the short-form layer (two quick questions)
Ask only these, conversationally, one at a time — skip any the Brain already answers:

1. **Where do you post?** "Which of these do you post short videos to — Instagram, Facebook, TikTok, YouTube
   Shorts? Pick any." (Note their priority order. Per Mike: keep it to **one profile per platform** that
   blends personal + business — that's what builds the know-like-trust factor. Don't set up a separate
   "business" account.)
2. **How often, realistically?** "How often do you want to post — daily, or a few times a week? Be honest —
   we build around what you'll actually keep up with." (Per Mike: **minimum 3×/week; the goal is daily +
   daily stories.** Early on it's about **volume — getting the reps in**; CTAs and lead-gen come once there's
   momentum. Reassure them it's doable because you do the heavy lifting.)

Lead magnets: **read them from the Brain** (`identity/offer.md`). Only if none are listed, ask once ("any free
guides or checklists you give people — first-time buyer guide, seller checklist, relocation guide?") and
**append them to `identity/offer.md`** so it's never asked again. Don't make this a big interview.

**If they're unsure, advise — don't leave them hanging** (house rules #8 +
`${CLAUDE_PLUGIN_ROOT}/shared/advisor-playbook.md`): "Not sure how often?" → recommend the sweet spot (a daily
green screen + 2–3 posts/week). "Not sure which platforms?" → Instagram Reels + TikTok, cross-posted to
Shorts. Give the expert pick; let them adjust.

## Step 5 — First win: make their first post RIGHT NOW
This is the moment that sells the whole system — do it before anything technical:
> "Let's make your first one right now. Say *'give me today's green screen'* and I'll find something happening
> in [city] for you to react to — hook, talking points, captions, all done."

Hand off to **shortform-greenscreen** (or talking-head/carousel if they'd rather). They should finish setup
holding a real, ready-to-film post — not a checklist.

**Prefer to plan first?** If they'd rather map a whole month before filming, point them at the strategy
pipeline: *"run my short form research"* → *"build my short form plan"* → *"script these"* (`shortform-search-research`
→ `shortform-video-plan`/`shortform-ideas` → `shortform-scripts` → `shortform-batch`). Either path is a great
start — the quick win or the full plan.

## Step 6 — Save the short-form layer (keep it light + fast)
1. Save platforms + priority, cadence, and **posting method = `manual` for now** to
   `~/realtor-brain/identity/publishing.md` — **update only those fields**, preserve every other line
   (especially any `Content board:` line). Lead magnets go to `identity/offer.md`, not here. **Push only that
   one changed file** (write → push → verify), and **do not re-pull or re-sync the whole Brain** — it was
   already pulled at session start.
2. **Do NOT pre-create Drive folders during onboarding.** The content library
   (`[Agent Name] — Short-Form System/Content/…`) is created **automatically the first time a piece of content
   is saved** (find-or-create, per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`). Creating empty folders
   here just piles slow Drive calls onto onboarding for no benefit — skip it. Mention in plain words where
   content *will* live if useful; don't create anything.

> ⚡ **Keep onboarding light on Drive.** The Brain pull at session start is the ONE heavy Drive step;
> everything after it in setup should be local reads + a single small push. Never loop folder-creation,
> re-sync the whole Brain, or run per-file verifies here — that Drive pile-up is exactly what makes "launch"
> feel like it hangs for minutes.

## Step 7 — LATER: scheduling + insights (deferred — mention once, never push)
Only after the first win, plant these as one-liners for when they're ready. **Do not connect anything now.**
- **Scheduling (Metricool / GoHighLevel):** *"When you've made a few and you're tired of copy-pasting, just
  say 'schedule my posts for me' and I'll connect a tool — Metricool's free to start — so they post
  automatically. No rush; for now I hand you everything copy-paste-ready."* (When they ask, the connect
  happens via `shortform-publish` / `shortform-metricool` + `${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md`.)
- **Insights:** *"Once you're posting, just ask 'how did my reels do?' anytime — and a quick one-time sign-in
  to your Instagram and YouTube unlocks a full 'run my deep dive' analysis on your real numbers."* (Optional,
  never forced; powered by `${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md`.)

---

## Completion checklist
- [ ] Brain located (pulled first if empty), read, and reflected back — **nothing re-asked**
- [ ] System explained (3 formats) **before** any question was asked
- [ ] Short-form layer captured (platforms + cadence only); lead magnets read from Brain (asked once only if missing)
- [ ] Agent finished holding a **real first post** (handed to green screen / talking head / carousel)
- [ ] `publishing.md` saved (method = manual) and pushed — ONE file, no whole-Brain re-sync; **no empty Drive folders pre-created** (the content folder is made on first save)
- [ ] **No posting tool was connected or even required during onboarding** — scheduling only mentioned as a later option
- [ ] Whole thing felt fast, friendly, value-first, and non-techie (house rules #1)
