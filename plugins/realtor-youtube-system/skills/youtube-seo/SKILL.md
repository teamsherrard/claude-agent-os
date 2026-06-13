---
name: youtube-seo
description: The SEO Engine for the Realtor YouTube System. Makes a video findable on YouTube AND Google. For a chosen idea/script it produces a complete SEO package — title options, a full description with timestamped chapters, tags, hashtags, and a pinned comment — all in the agent's voice with their CTA and links. Reads the AI Brain (market, niche, communities, offer/CTA) and the script. Saves an "SEO Package" Google Doc in that video's folder. Triggers on "SEO for this", "write my description and tags", "SEO package", "optimize this video", or as a hand-off after scripting.
---

# SEO Engine

Make the video rank — on YouTube search and Google. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and the full
`${CLAUDE_PLUGIN_ROOT}/shared/seo-knowledge-base.md` (search intent, title rules, tag priority order, real-estate keyword library, channel-size strategy).

> **Part of the video package — one chat = one video.** Normally Step 3 of Make This Video, inside that
> video's chat. If the agent asks for SEO on a video made outside the system ("just do the SEO for this
> one"), run it in a chat/folder for THAT video — ask for the title/topic + a quick rundown, and proceed.
> Never a separate workflow.

## Step 1 — Gather
- The final/working title, and the script if one exists here (for accurate chapters). **Standalone:** if the
  agent already has a finished video and no script in the system, ask for the title/topic + what it covers.
- AI Brain: market + communities (use real names), niche keywords, offer/CTA, booking link, required disclosures.
- Relevant keywords from the Research Brief.
- **Live demand check (don't guess):** before finalizing, pull real signals — YouTube + Google autocomplete,
  "people also ask," and the titles/tags of competitor videos that actually rank for this topic. Ground the
  title + keywords in what people are really searching. Be honest about volumes (never assert numbers you didn't verify).

## Step 2 — Produce the SEO package
1. **Title options (3)** — **front-load the primary keyword (first ~30 chars), 50–60 chars,** 1–2 power
   words, a proven formula (listicle / question / how-to / benefit). Voice-matched; never clickbait if the Brain forbids it.
2. **Thumbnail text options (3)** — 2–5 punchy on-screen words each, a shortened / SEO-aware version of the
   title. JUST the words that go on the thumbnail — no design direction, no visual notes; the agent's design
   tool makes the image.
3. **Description** —
   - Strong first 2 lines (first ~100 chars — these show in search) restating the hook + primary keyword.
   - A 200–300 word summary, naturally including secondary keywords + community names (primary 2–3×, no stuffing).
   - **Timestamped chapters** built from the script's sections (00:00 Intro, etc.).
   - CTA block: the agent's real CTA + booking link, plus the matching lead-magnet link (from Lead Engine).
   - Required disclosures (brokerage, license #) per compliance.
4. **Tags (8–15, in priority order)** — exact primary → variation → long-tail → secondary → supporting →
   broad → branded; 200–300 chars; lean long-tail for a small channel.
5. **Hashtags** — 3–5 (e.g., #yyccalgary #calgaryrealestate #okotoks).
6. **Pinned comment** — a specific question to drive comments (a ranking signal) + push the lead magnet.
7. **Watch-time extras** — note the chapters list, an SRT caption upload, the right playlist to add it to,
   and end-screen + card suggestions (next video / subscribe / home-value tool).
8. **"Why these" breakdown (for the agent)** — a short plain-English blurb: which keyword the title targets and
   why, which tags show the strongest real demand vs. which are supporting/long-tail, and the one-line reason
   this package should rank for her. Justify it — never a generic tag dump.

## Step 3 — Save
Save as an **SEO Package** Google Doc inside the video's folder, using the SEO Package skeleton in
`${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md` (CAPS section bands, clean labelled blocks), and place it per
the "resolve, never duplicate" rule in
`${CLAUDE_PLUGIN_ROOT}/skills/youtube-setup/references/drive-structure.md`.

## Modes
On-demand, and bundled into the weekly briefing for the #1 idea so it's publish-ready.

## Hand-off
Pairs with the **Lead Engine** (the description links the lead magnet) and **Repurposing Engine**.
