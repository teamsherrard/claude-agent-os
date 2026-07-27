---
name: realtor-voice-print
description: >
  The SPOKEN layer of the agent's voice. Written samples (voice-proof) teach Claude how the agent types —
  but scripts get read out loud, so the Brain also needs to know how they TALK. A guided, spoken interview
  (best in Claude voice mode on their phone, or by pasting a transcript) where the agent talks naturally, and
  Claude analyzes it for their Voice DNA: pacing, sentence length, signature phrases, how they explain hard
  things, their energy and humor, filler words, and the words they'd never say. Writes identity/voice-print.md,
  which every read-aloud output (YouTube scripts, reels, market-update scripts) reads so it sounds spoken-by-them,
  not written-by-AI. Compounds: every Dispatch voice note + voice-mode session enriches it over time. Built on
  realtor-voice-proof (adds the spoken layer); best run in Week 1 as the agent's first voice-mode session.

  Trigger on: "capture my speaking voice", "my voice print", "how I talk", "build my voice print", "voice mode
  setup", "make my scripts sound like me", "refresh my voice print", "my spoken voice", or right after voice-proof
  as the spoken layer.
---

# Realtor Voice Print — how the agent TALKS (Brain, spoken layer of Phase 4)

Written samples make captions sound like them. This makes **scripts** sound like them — and scripts are the
thing agents freeze on, because AI words aren't their words. Capture how they actually talk, and every script
comes back readable in their own mouth. **~8 minutes, spoken.**

## Step 0 — Read the shared engine
Read `${CLAUDE_PLUGIN_ROOT}/shared/spoken-capture.md` (the mechanism, how to run it, the never-fabricate rule)
and `${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md`. This skill is the Voice-Print application of that engine.
**Exception — the "use defaults / you decide" escape hatch does NOT apply here.** A person's voice cannot be
defaulted or invented. If the agent won't talk or says "you pick," treat it as **skip**: leave a friendly
placeholder in `voice-print.md` and move on — never generate a fake voice DNA.

## Step 1 — Load the Brain + set up the mic
Read `~/realtor-brain/brain.md`, `identity/voice.md`, `identity/voice-samples.md` (so the spoken layer builds on
the written one). Then get them talking:
> "This one's best out loud. Open **Claude voice mode** on your phone and just talk to me like we're on a call —
> I'll ask a few easy things, you ramble, I'll shape it after. Not in voice mode? No problem — talk into your
> phone's voice-to-text and **paste what it says**." *(If they try to upload an audio file, redirect to voice
> mode or a pasted transcript — don't claim to hear audio.)*

## Step 2 — The prompts (one at a time; let them ramble)
Pick 5–6, follow their energy, one natural follow-up each. Mix **narration · teaching · story · opinion** —
that's where real cadence and signature phrases live:
- "Drive me through your favourite neighbourhood like I'm a buyer sitting next to you."
- "Explain closing costs to a nervous first-time buyer."
- "Tell me about your last closing — what actually happened."
- "What do you find yourself saying to every first-time buyer?"
- "Rant for a sec — what's the biggest myth in your market right now?"
- "Why'd you get into real estate?"
Reassure a quiet/newer agent: *"Just say it how you'd say it to a friend — there's no wrong answer."*

## Step 3 — Analyze the Voice DNA → `identity/voice-print.md`
From what they said, extract (specific + verbatim, never invented):
- **Pace & rhythm** — fast/measured, long winding sentences or short punchy ones, where they pause.
- **Signature phrases** — the exact lines they actually use ("let's run the numbers", "here's the real deal").
- **How they explain hard things** — analogies, do they use numbers, do they slow down and reassure.
- **Energy & humour** — dry, warm, hyped, deadpan; when they get animated.
- **Filler & tics** — "honestly", "look", "right?" — a few real ones make dialogue sound human.
- **Never-say list** — words/phrases that aren't them (corporate-speak, hype words they'd never use).
- **A short "sounds like this" sample** — 2–3 sentences written in their spoken voice as the reference.
Reflect it back, let them tweak, then write. Stamp **last updated + sample count** at the top (it grows).

## Step 4 — Wire + confirm
> **Push to Drive** — `realtor-brain-sync` (PUSH). `voice.md` should point to `voice-print.md` as the spoken layer.
Confirm: *"Got your speaking voice. From now on your scripts come back sounding like YOU said them, not like AI
wrote them — you'll actually be able to read them on camera. And it keeps learning — every voice session sharpens it."*

## REFRESH mode (trigger: "refresh my voice print")
Spoken voice compounds. On refresh, re-read `voice-print.md` and analyze any **new spoken material the agent
brings to this session** — a fresh voice-mode conversation or a transcript they paste — then **enrich** the DNA
(sharper phrases, new tics) and bump the sample count. Merge, don't overwrite; keep the best. *(Honest scope:
there's no automatic Dispatch feed today — refresh works on what they bring to the session. If Dispatch later
tags voice notes as spoken samples, wire it in then.)*

## How every output uses this (the payoff)
Any skill producing **read-aloud** content — YouTube scripts, reels/shorts, market-update scripts, neighbourhood
tours, listing videos — reads `voice-print.md` and **writes for the ear in their cadence** (see the voice law in
`brain.md`). Written outputs (captions, emails) use it lightly for signature phrases. This is why it exists:
scripts they can actually read.
