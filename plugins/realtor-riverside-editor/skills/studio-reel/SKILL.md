---
name: studio-reel
description: Reel Edit for the AI Editing Studio — the full line for ONE vertical short, run from one sentence. Sets 9:16 first with the face centred, then directs the crafts in order (transcript read, hook, remove the fluff at the tighter reel threshold, audio enhance, word-by-word captions in the brand accent, up to three B-roll, color, energy, music, hook card and call-to-action), verifies every pass, and saves one 1080p vertical file as a review draft. Never writes the post's caption or hashtags — the Short-Form System owns those. Trigger on "make a reel", "make this vertical", "edit my reel", "edit this short", "turn this into a short", and on resuming one — "finish my reel". To cut SEVERAL reels out of a long video, hand to studio-repurpose. Usually reached through studio-navigator.
---

# Reel Edit — the director

You run the line; the crafts do the work. **Read up front (only these):** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`, and Playbook B in `${CLAUDE_PLUGIN_ROOT}/shared/riverside-playbooks.md` (the 4-pass plan). Open each craft's reference at its step. Compliance before any on-screen word (three states — `${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`).

## The line — 4 passes

| Pass | Do, in this order | References |
|---|---|---|
| 0 | ONE working edit (a fresh `create_edit_from_recording`, or a clone when cutting from a long video). Transcript read; pick the moment: hook → idea → payoff, 20–60 s, ideal 30–45. Show the cuts, get the yes. | `craft-contract.md`, `preflight-check.md` |
| **1 CLEAN** | **9:16 FIRST** (`update_aspect_ratio` before ANY overlay exists — it is refused afterwards) → `apply_smart_layout FullScreen` → check headroom → hook → remove the fluff at the tighter reel threshold → audio enhance | `layouts.md`, `hook.md`, `clean-cut.md`, `audio.md` |
| **2 CAPTIONS** | Spelling check, then word-by-word captions ON in the brand look, sized and placed per the reference. A reel without captions is an automatic fail. | `caption-style.md` |
| **3 B-ROLL** | Up to **3**, own footage first, vertical clips preferred, each scaled to cover, never over the hook, face, or CTA | `broll-ladder.md`, `layouts.md` |
| **4 FINISH** | Color → punch-ins on the key beats → the music bed (placed again if the track is shorter than the reel) → hook card and CTA card at the TOP EDGE above the hairline, sized per the reference, then the logo if the kit has one | `footage-look.md`, `effects-menu.md`, `music.md`, `graphics-style.md`, `cta-pack.md` |
| SHIP | ONE export at 1080p (renders 1080×1920) → quality check | `final-check.md`, `frame-qa.md` |

## Boundaries

The hook card line comes from the agent's own opening words. The post's caption, hashtags, and posting slot belong to the Short-Form System: hand it the hook line, the length, and the edit link (`boundaries.md`). One posting route per post.

## Deliver

A review draft: the edit link, the spec in one line ("9:16, captions, 2 cutaways, music, hook and CTA"), the 2–3 things only they can judge (music level against the voice, caption size on their phone, the hook landing), the 80/20 line, then the offer to post or schedule (`studio-publish`).

## Resume

Checkpoint log `rs-<editId>.md`, one line per pass. Log missing → the revision history tells the truth. Conflict → the one rule in `house-rules.md`.
