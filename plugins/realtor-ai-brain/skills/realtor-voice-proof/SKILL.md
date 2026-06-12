---
name: realtor-voice-proof
description: >
  Phase 4 of the Realtor AI Brain — captures the agent's real writing samples (for authentic voice
  matching) and their proof library (testimonials, stats, case studies) into the Brain. The writing
  samples are the single biggest lever on content quality: they make every generated script and caption
  sound like the agent, not like generic AI. The proof library gets reused across listings, lead
  magnets, bios, and emails.

  Trigger on: "add my writing samples", "voice samples", "capture my voice", "add my testimonials",
  "build my proof library", "add my reviews", "add my stats", "phase 4", or any request to give the
  Brain real examples of how the agent writes or proof of their results.
---

# Realtor Voice Samples + Proof (Brain Phase 4)

Two quick, high-leverage additions to the Brain: **how the agent actually writes** and **proof they
get results.** Light — about 5 minutes. Mostly paste-and-go.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, plus `identity/profile.md`, `identity/voice.md`, `identity/offer.md`.
You already know their described voice and offer — this phase adds *real examples* and *proof*. If
`~/realtor-brain/` doesn't exist, tell them to run **Realtor AI Brain — Setup** first.

## Phase A — Writing samples (the voice lever)
Ask the agent to **paste 3–5 pieces of their own real past content** — Instagram captions, an email to
a client, a LinkedIn post, a video script, anything they actually wrote. Reassure: "Don't polish them,
don't pick the fanciest — pick the most *you*."

For each, capture it **verbatim** and add a one-line note on what's distinctive (short sentences? dry
humor? no emojis? lots of line breaks?). Write to `~/realtor-brain/identity/voice-samples.md`.

If they have nothing written: that's fine — note it and suggest they come back after they've posted a
few things. Don't fabricate samples.

## Phase B — Proof library
Collect, conversationally:
- **Testimonials** — paste 2–5 real client quotes (first name / client type + year).
- **Stats** — homes sold, years, average days on market (vs market), list-to-sale ratio, competitive-
  offer win rate, awards/rankings. Whatever they know — don't force numbers they don't have.
- **Case studies** — 1–2 signature wins (situation → what they did → outcome).

Write to `~/realtor-brain/identity/proof.md`.

## Push to Drive + confirm

> **Push to Drive after writing** — run `realtor-brain-sync` (PUSH). The local copy is wiped when the
> session ends; an unsynced write is a lost write.
Tell them: *"Added to your Brain — your real voice and your proof. Now every script sounds more like
you, and every listing/lead magnet can pull in real testimonials and stats."* If run as **Phase 4 of
Setup**, hand control back to Setup.
