---
name: studio-reel
description: Reel Edit for the AI Editing Studio — the full line for ONE vertical short, run from one sentence. Sets 9:16 first with the face centred, then directs the crafts in order (the brief, transcript read, hook, remove the fluff at the tighter reel threshold, audio enhance, word-by-word captions in the brand accent, up to three bright B-roll, the visible colour lift, zooms on the beats at one every 12 to 20 seconds, the music bed, the hook banner and the CTA banners), verifies every pass, and saves one 1080p vertical file as a review draft. Never writes the post's caption or hashtags — the Short-Form System owns those. Trigger on "make a reel", "make this vertical", "edit my reel", "edit this short", "turn this into a short", and on resuming one — "finish my reel". To cut SEVERAL reels out of a long video, hand to studio-repurpose. Usually reached through studio-navigator.
---

# Reel Edit — the director

You run the line; the crafts do the work. **Read up front (only these):** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`, and Playbook B in `${CLAUDE_PLUGIN_ROOT}/shared/riverside-playbooks.md` (the 4-pass plan and the cut-only-master rule). Open each craft's reference at its step. Compliance before any on-screen word (three states — `${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`).

## The line — 4 passes

| Pass | Do, in this order | References |
|---|---|---|
| 0 | Pull the Brain (the persistence rule in `house-rules.md`); ONE working edit — a fresh `create_edit_from_recording`, or a clone of the cut-only MASTER when cutting from a long video (never a clone of a finished edit: the aspect change is refused once overlays exist). The brief in five lines. Transcript read with the emotion events; pick the moment: hook → idea → payoff, 20–60 s, ideal 30–45. Show the cuts, get the yes. | `craft-contract.md`, `creative-direction.md`, `preflight-check.md` |
| **1 CLEAN** | **9:16 FIRST** (`update_aspect_ratio` before ANY overlay exists) → `apply_smart_layout FullScreen` → check headroom → hook → remove the fluff at the tighter reel threshold (1000 ms) with the blooper second pass → audio enhance at 0.70 (0.85 phone) | `layouts.md`, `hook.md`, `clean-cut.md`, `audio.md` |
| **2 CAPTIONS** | Spelling check, then word-by-word captions ON in the brand look, sized and placed per the reference. A reel without captions is an automatic fail. | `caption-style.md` |
| **3 B-ROLL** | Up to **3**, own footage first, vertical clips preferred, each scaled to cover, bright (never darker than the speaker's shot), never over the hook, face, or CTA | `broll-ladder.md`, `layouts.md` |
| **4 FINISH** | The visible colour lift → 3–4 zooms on the beats (one per 12–20 s, sized to the beat) and a size change on every editorial cut → the music bed at -18 dB (placed again if the track is shorter than the reel) → the hook banner in the TOP zone for ~2 s with the hook line typed into it → a `cta_pack` banner on any mid-reel ask → the primary CTA banner from the CTA line's first word to the last frame (top zone) → the logo if the kit has one | `footage-look.md`, `effects-menu.md`, `music.md`, `graphics-style.md`, `cta-pack.md` |
| SHIP | The measured gates from the timeline (blockers 1–9) → ONE export at 1080p (renders 1080×1920) → the visual gates on it | `final-check.md`, `frame-qa.md` |

## Boundaries

The hook banner's line comes from the agent's own opening words. The post's caption, hashtags, and posting slot belong to the Short-Form System: hand it the hook line, the length, and the edit link (`boundaries.md`). One posting route per post.

## Deliver

A review draft: the edit link, the spec in one line ("9:16, karaoke captions, 3 zooms, 2 cutaways, colour lift, music, hook banner and CTA banner"), the 2–3 things only they can judge (music level against the voice, caption size on their phone, the hook landing), the 80/20 line, then the offer to post or schedule (`studio-publish`).

## Resume

Checkpoint log `rs-<editId>.md`, one line per pass, pulled from the Brain first. Log missing → the revision history tells the truth. Conflict → the one rule in `house-rules.md`.
