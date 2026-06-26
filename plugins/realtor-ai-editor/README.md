# Realtor AI Editor

An AI video editor for real estate agents. The agent talks to Claude in plain English; Claude **directs Descript** (on the agent's own account) to do the actual editing — long-form *and* short-form — while they watch it happen live.

## The philosophy

**Claude directs · Descript edits · the agent approves.**

Claude is not the editor — it's the director. It plans the edit, sources the B-roll, applies the agent's brand, and gives Descript tested instructions. Descript does it all — the cutting, captions, audio, b-roll, grade, minimal on-brand graphics (a hook card + CTA), and rendering — and the agent watches it happen and approves before anything publishes. Claude does the high-value 80% in Descript; the agent finishes the last 20% (extra B-roll, extra graphics, tweaks) by hand, for free. This keeps the quality high and the agent in control.

## One tool, one subscription

Descript does **both** long-form (YouTube) and short-form (Reels/Shorts/TikTok). The agent pays for one piece of software, connects it once, and never has to learn a second tool. That's the whole design goal: fewest steps, fewest subscriptions, fewest credits, least confusion.

## What it does

- Edits long-form videos: removes dead air, filler words, and bad takes; cleans up audio; adds B-roll, a colour grade, chapters, and minimal on-brand graphics (a hook card + CTA, done natively in Descript); exports with a ready-to-paste title and description.
- Makes short-form: recycles one long video into several vertical clips (or edits a standalone reel) with a hook, branded captions, and music.
- Adds **B-roll** Descript can't source on its own — the agent's own footage (a Google Drive library or per-video uploads), listing photos as motion stills, Descript's built-in stock, and several free stock libraries queried together so it doesn't recycle the same clips.
- Applies the agent's brand automatically (colors, fonts, logo, caption style) from their Realtor AI Brain.
- Handles confused or messy requests gracefully, without overwhelming the agent.

## What it can't do

- Edit fully on its own — it directs Descript; the agent reviews and approves.
- Frame-perfect, surgical edits — Descript's AI is fast but approximate, so there's always a review step.
- Hollywood-grade motion VFX / 3D / heavy motion design — out of scope; graphics are minimal, clean, Descript-native cards (a hook card + CTA), not full motion design.
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

## Cost-smart by default — the 80/20 rule

Descript AI credits are the agent's money, so the editor does the high-value **80%** brilliantly and then **stops**: a clean cut, Studio Sound (~55% default), a bare-minimum colour grade, karaoke captions, a little energy (a couple of zoom punch-ins + swoosh, smooth transitions, a couple of SFX), a hook card + CTA, and up to **3** B-roll. The agent finishes the last **20%** — extra B-roll, extra cards, tweaks — **by hand in Descript, which costs no AI credits.** Hard caps keep credits safe: short-form B-roll max 3, ≤2–3 graphic cards, no count-up animations, no heavy AI effects. (Full rule: `shared/credit-tiers.md`.)

## Status

**Descript-MCP-only.** Claude directs Descript for clean, professional edits — long + short form — and does the high-value 80%, leaving the agent the manual 20%. Includes: multi-source B-roll (capped at 3 on short-form + de-duped), brand + captions (big, below the face, brand-accent active word), minimal on-brand graphics (a hook card + CTA, done natively in Descript), always-on colour grade and Studio Sound, the 80/20 credit discipline, split-screen layouts (with speaker reframing), clean frames, flattering treatment of people, honest human visual-QA, and a full do's-&-don'ts rulebook.
