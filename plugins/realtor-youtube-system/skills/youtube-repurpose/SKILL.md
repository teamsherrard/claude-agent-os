---
name: youtube-repurpose
description: The Repurposing Engine for the Realtor YouTube System — turns one long-form video/script into a full pack of written assets, no editing. From the script it writes short-form scripts (Reels/Shorts/TikTok), a blog post (to rank on Google as well as YouTube — the double-dip), an email newsletter, LinkedIn + Facebook posts, and an Instagram carousel script — all in the agent's voice. Reads the AI Brain. Saves a "Repurposing Pack" Google Doc in the video's folder. Triggers on "repurpose this", "turn this into posts", "blog + email from this video", "repurposing pack", "make shorts from this".
---

# Repurposing Engine

One shoot → ten written assets. No editing. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

> **Part of the video package — one chat = one video.** Normally Step 5 of Make This Video (after filming),
> inside that same video's chat. For a video made outside the system, run it in a chat/folder for THAT
> video. Never a separate workflow.

## Input
The video's script (or its key points) + the AI Brain (voice, avatars, CTA, communities).

## Produce a Repurposing Pack
1. **Short-form scripts (3)** — 30–45s each, distinct angles from the video (a tip, a myth, a "watch out").
   Each: hook → one point → CTA → caption + hashtags (#Shorts + #YouTubeShorts + 2–4 niche + 1–2 trending).
2. **Blog post (600–900 words)** — the video as an article that actually ranks on Google: apply
   `${CLAUDE_PLUGIN_ROOT}/shared/seo-knowledge-base.md` (keyword-led H1, H2 headers, primary keyword in the
   first 100 words, natural keyword use, a meta-description line). Embed-the-video note at top. This is the whole double-dip.
3. **Email newsletter** — subject line + short, friendly email that teases the video + the takeaway + CTA.
4. **LinkedIn post** + **Facebook post** — platform-appropriate, value-first, low-hype.
5. **Instagram carousel script** — 6–8 slides (slide-by-slide copy), ending on the CTA.

## Rules
- Everything in the agent's voice; honor hard-avoids + compliance (Fair Housing language, disclosures).
- Use the agent's real communities and **reuse the same sourced facts** from the video — never re-invent stats.

## Save
A single **Repurposing Pack** Google Doc in the video's folder (`Videos/{month}/{video}/`), clearly sectioned.

## Modes
On-demand ("repurpose Tuesday's video"). Note: writing only — no video editing or posting.
