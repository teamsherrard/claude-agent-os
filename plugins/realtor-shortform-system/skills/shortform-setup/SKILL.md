---
name: shortform-setup
description: >
  One-time onboarding for the Realtor Short-Form System. Reads everything from the agent's existing
  Realtor AI Brain (identity, market, niche, avatars, voice, offer, lead magnets) and only captures the
  few things that are short-form-specific — which platforms they post to, how often they realistically
  want to post, their lead magnets (if not already in the Brain), and how they'll publish (a posting tool
  like Metricool or GoHighLevel, or manually for now). Explains the system in plain language and hands the
  agent straight to their first post. Never re-asks anything the Brain already knows.

  Trigger on: "set up my short form system", "set up my short-form", "build my short form system", "start
  my short form system", "onboard me for short form", "set up my reels", "get me started with short form
  content", or any request to set up / start / onboard the short-form system.
---

# Short-Form System — Setup

A quick, friendly onboarding that turns on the agent's short-form system as a **layer on top of their AI
Brain**. By the end they understand how it works and have made their first post — in under ten minutes.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — especially #1: talk plain and
warm, never technical. This is the agent's first impression. No jargon, no tool names, no overwhelm.

## ⭐ THE #1 RULE: ONE BRAIN, NEVER TWO
The agent's identity, market, niche, avatars, voice, offer, and lead magnets already live in the shared
**AI Brain.** This skill does NOT rebuild any of it and NEVER re-asks it. It reads the Brain and only
captures the few short-form-specific things below.

> If you catch yourself about to ask about their city, who they serve, their voice, or their offer —
> **stop, and read it from the Brain.**

---

## Step 1 — Welcome (set an easy tone)
Keep it warm and short:
> "Love it — let's get your short-form content running. Good news: I already know you from your Brain, so
> this'll be quick. A couple of quick things and you'll have your first post today."

## Step 2 — Read the Brain (don't rebuild it)
Read `~/realtor-brain/brain.md` and the identity files (profile, market, avatars, voice, voice-samples,
offer, compliance). Reflect back what you know so it's clear you won't re-ask:
> "Here's what I've got: you're [name] in [city], you help [avatar], and your style is [voice in plain
> words]. I won't ask you any of that again."

If the Brain is missing or thin, say so kindly and point them to set it up first ("the more your Brain
knows you, the more your posts sound like *you* and not generic"). If `~/realtor-brain/` doesn't exist,
tell them to run **Realtor AI Brain — Setup** first.

## Step 3 — Capture ONLY the short-form layer (one question at a time)
Ask only these, conversationally, one at a time — skip any the Brain already answers:

1. **Where do you post?** "Which of these do you post short videos to — Instagram, Facebook, TikTok,
   YouTube Shorts? Pick any." (Note their priority order. Per Mike: keep it to **one profile per platform**
   that blends personal + business — that's what builds the know-like-trust factor. Don't set up a separate
   "business" account.)
2. **How often, realistically?** "How often do you want to post — daily, or a few times a week? Be honest,
   we'll build around what you'll actually keep up with." (Per Mike: **minimum 3×/week; the goal is daily +
   daily stories.** Early on it's about **volume — getting the reps in**; CTAs and lead-gen come once
   there's momentum. Reassure them it's doable because you do the heavy lifting.)
3. **Your freebies (lead magnets).** Only if the Brain doesn't already list them: "Do you have any free
   guides or checklists you give people — like a first-time buyer guide, a seller checklist, a relocation
   guide? These are what we point people to." If they share new ones, **save them to their Brain** so this
   is never asked again.

**If they're unsure on any of these, advise — don't leave them hanging** (house rules #8 +
`${CLAUDE_PLUGIN_ROOT}/shared/advisor-playbook.md`). "Not sure how often?" → recommend the sweet spot
(a daily green screen + 2–3 posts/week) and reassure them you do the heavy lifting. "Not sure which
platforms?" → recommend Instagram Reels + TikTok, cross-posted to Shorts. Give the expert pick; let them
adjust.

That's the whole interview. Nothing else at the Brain level.

## Step 4 — How they'll post (connect, or keep it simple)
Explain simply that they can either copy-paste each post themselves, or connect a tool so you can schedule
for them. Ask one question:

> "When your posts are ready, do you want to post them yourself, or should I schedule them for you? If
> you'd like me to schedule, do you already use a posting tool — like GoHighLevel or Metricool?"

- **They already use GoHighLevel or Metricool** → great, we'll connect that one (no new platform to learn).
- **They use neither and want scheduling** → recommend Metricool (it's free to start and easy), or Buffer.
- **They'd rather post manually for now** → totally fine; you'll hand them copy-paste-ready posts. They can
  connect a tool anytime later.

Don't force a connector. If they pick one, walk them through connecting it in plain steps (the connect
mechanics — Metricool's one-click sign-in, GoHighLevel's token — are in
`${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md`; the connection is a one-time thing). Keep the *how it
works behind the scenes* invisible — for Metricool it's literally "create a free Metricool account,
connect your socials there once, then sign in when I ask." Reassure them it's quick and they only do it once.

## Step 5 — Save the short-form layer + set up their Drive folder
1. Save a small note to the Brain at `~/realtor-brain/identity/publishing.md` with: platforms + priority,
   posting cadence, posting method (which tool, or "manual"), and lead-magnet list if newly captured.
   Push the Brain to Drive. The Brain stays the one source of truth.
2. **Provision their content folder in Google Drive** (so everything they make has an organized home),
   following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: create
   `[Agent Name] — Short-Form System/` with a `Content/` and a `Performance/` folder inside. Don't
   pre-create month folders — those get made the first time content is saved. Share the folder link so
   they know where their content will live.

## Step 6 — Explain how it works (3 simple formats) + first post
Explain it the way they'll actually use it — plainly:
> "Here's how this works. There are three kinds of posts, and I do the thinking for all of them:
> • **Green screen** — once a day, I find something happening in [city] right now and give you a hook and
>   talking points to react to. Quick to film.
> • **Talking head** — when you want to batch a few, I give you video topics and scripts.
> • **Carousels** — when you don't feel like filming, I write the slides and you drop them into your
>   design tool.
> Every time, I also write your captions and hashtags for each app. You just record, approve, and post."

Then get them a quick win:
> "Want to start right now? Say *'give me today's green screen'* and I'll find something for you to film."

---

## Completion checklist
- [ ] Brain located, read, and reflected back — **nothing re-asked**
- [ ] Short-form layer captured (platforms, cadence) — only the delta
- [ ] Lead magnets confirmed (read from Brain, or captured once and saved back)
- [ ] Posting method chosen (a tool connected, or "manual for now") — never forced
- [ ] `identity/publishing.md` saved and pushed to Drive
- [ ] System explained in plain language (3 formats) and the agent pointed to their first post
- [ ] Whole thing felt fast, friendly, and non-techie (house rules #1)
