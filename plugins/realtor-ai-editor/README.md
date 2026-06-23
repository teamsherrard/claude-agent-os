# Realtor AI Editor

An AI video editor for real estate agents. The agent talks to Claude in plain English; Claude **directs Descript** (on the agent's own account) to do the actual editing — long-form *and* short-form — while they watch it happen live.

## The philosophy

**Claude directs · Descript edits · the agent approves.**

Claude is not the editor — it's the director. It plans the edit, sources the B-roll, applies the agent's brand, and gives Descript tested instructions. Descript's own engine does the cutting, captions, audio, and rendering — and the agent watches it happen and approves before anything publishes. This keeps the quality high (a purpose-built editor does the editing) and the agent in control.

## One tool, one subscription

Descript does **both** long-form (YouTube) and short-form (Reels/Shorts/TikTok). The agent pays for one piece of software, connects it once, and never has to learn a second tool. That's the whole design goal: fewest steps, fewest subscriptions, fewest credits, least confusion.

## What it does

- Edits long-form videos: removes dead air, filler words, and bad takes; cleans up audio; adds chapters and tasteful on-brand graphics; exports with a ready-to-paste title and description.
- Makes short-form: recycles one long video into several vertical clips (or edits a standalone reel) with a hook, branded captions, and music.
- Adds **B-roll** Descript can't source on its own — the agent's own footage (a Google Drive library or per-video uploads), listing photos as motion stills, Descript's built-in stock, and several free stock libraries queried together so it doesn't recycle the same clips.
- Applies the agent's brand automatically (colors, fonts, logo, caption style) from their Realtor AI Brain.
- Handles confused or messy requests gracefully, without overwhelming the agent.

## What it can't do

- Edit fully on its own — it directs Descript; the agent reviews and approves.
- Frame-perfect, surgical edits — Descript's AI is fast but approximate, so there's always a review step.
- Heavy motion graphics / VFX — out of scope for v1 (an optional premium-graphics handoff can be added later).
- Publish without permission — publishing is gated to "needs approval" by default.

## The skills

| Skill | What it's for |
|---|---|
| `editor-setup` | One-time onboarding: connect Descript, pull brand from the Brain, optional stock keys. |
| `editor-navigator` | The friendly front door. Turns vague/messy requests into one clear plan; never overwhelms. |
| `edit-longform` | Edit a long-form / YouTube video end to end. |
| `edit-shortform` | Make reels, or recycle a long video into vertical clips. |
| `edit-listing` | Edit a property/home tour using the agent's own footage or listing photos. |
| `editor-broll` | The B-roll brain: finds and places footage from multiple sources. |

## Setup

Run `editor-setup`. The only required connection is **Descript** (a free, guided OAuth step in the Claude desktop app). Stock B-roll keys are **optional** — Descript's own stock library and the agent's own footage work with zero keys.

Heavy editing runs best in **Code mode** (the desktop app's Cowork / Code / Chat toggle) — it's more robust for long Descript jobs than Cowork. Same plugin, same login.

Settings are saved in the agent's Realtor AI Brain (`~/realtor-brain/editor/`) so they persist and sync like everything else.

## Cost-smart by default

Runs at a credit-smart **Standard** tier by default (~90% of full-polish quality at roughly half the credits). **Lean** for routine daily posts, **Full** for hero/case-study videos. Studio Sound is applied automatically on every video (agents shoot on phones).

## Status

v0.8.7 — finalized and audited; hardened through live editing of real realtor videos (short-form and long-form). In: directing Descript for long + short form, multi-source B-roll, brand + captions, credit tiers, automatic Studio Sound, split-screen layouts (with speaker reframing), contextual graphics, captions pinned safely below the face, clean frames (no black bars or ugly boxes), gentle and flattering treatment of people, honest human visual-QA, and a full do's-&-don'ts rulebook. Next: the optional premium graphics-engine / branded CTA-pack handoff.
