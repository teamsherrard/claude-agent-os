---
name: youtube-seo
description: The SEO Engine for the Realtor YouTube System. Makes a video findable on YouTube AND Google. For a chosen idea/script it produces a complete SEO package — title options, a full description with timestamped chapters, tags, hashtags, and a pinned comment — all in the agent's voice with their CTA and links. Reads the AI Brain (market, niche, communities, offer/CTA) and the script. Saves an "SEO Package" Google Doc in that video's folder. Triggers on "SEO for this", "write my description and tags", "SEO package", "optimize this video", or as a hand-off after scripting.
---

# SEO Engine

Make the video rank — on YouTube search and Google. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and the full
`${CLAUDE_PLUGIN_ROOT}/shared/seo-knowledge-base.md` (search intent, title rules, tag priority order, real-estate keyword library, channel-size strategy).

> **Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — **§16 titles**,
> **§17 thumbnails** (per-pillar rules), **§18 descriptions / timestamps / tags / keywords**, **§24 output
> templates**. The doctrine is the source of truth; where the SEO knowledge base and the doctrine differ on
> titles/thumbnails/descriptions/keywords, **the doctrine wins**. Non-negotiables from it: the description's
> **first 3 lines = CTA + clickable links** (booking/calendar, phone, email, lead magnet — §18.1–§18.2);
> **keywords are video- AND market-specific, never broad** like "real estate" / "realtor" (§18.3); **tags are
> not important — don't overthink them** (§18.5); titles **match search intent + are market-specific** (city/
> neighborhood) and add the **year/month when relevance matters** (§16.1, §16.3); **thumbnails follow the
> pillar** (§17.2–§17.5, below).

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
1. **Title options (3)** — **match search intent first** (what a buyer/seller would actually type), **market-
   specific** (include the city / neighborhood), and **add the year or month when relevance matters** (§16.1,
   §16.3). Create curiosity + signal a clear payoff; differentiate from the **top 3–5 ranking videos** for this
   topic (§16.4). Use the **per-pillar title formulas** (§16.5: relocation / community / market update / home
   tour / local lifestyle). Ethical fear is fine when tied to a real mistake or tradeoff (§16.2). Practically:
   front-load the primary keyword (first ~30 chars), aim ~50–60 chars. Voice-matched; never clickbait if the
   Brain forbids it.
2. **Thumbnail text options (3)** — **3–5 words** on-screen, SEO-aware, a shortened version of the title
   (§17.2–§17.5). JUST the words — no design direction; the agent's design tool makes the image. **Note the
   per-pillar thumbnail rule so the agent briefs the image right** (§17): talking-head / relocation / market-
   update / lifestyle-list, **map tours**, and **community tours** → **headshot ≈ 33% + a facial expression +
   3–5 words** (map-tour background = a map of the city; community-tour background = a photo of the community).
   **HOME TOURS → no headshot** — high-quality home image + the **price or a unique feature**. Avoid the common
   mistakes (§17.7): too much text, unreadable on mobile, generic stock, no expression on talking-head topics.
3. **Description** —
   - **First 3 lines = the CTA + clickable links** (§18.1–§18.2): book-a-call / calendar link, phone, email,
     and the lead-magnet link — this comes FIRST, before any summary. Use the §18.2 opening template, in the
     agent's voice with their real links from the Brain.
   - Then a 200–300 word summary, naturally including **video- and market-specific keywords** + community
     names (primary 2–3×, no stuffing) — **never broad keywords** like "real estate" / "realtor" / "homes"
     (§18.3).
   - **Timestamped chapters** that are **descriptive and search-friendly** (not "Intro / Part 2") — build them
     from the script's sections (§18.4).
   - Required disclosures (brokerage, license #) per compliance.
4. **Tags (a handful) — don't overthink them** (§18.5): tags and keywords are **not** an important ranking
   lever. Add a short set that's **specific to this video + market** (not broad/generic), in rough priority
   order (exact primary → variation → long-tail → secondary). Never tell the agent tags are important.
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
On-demand; if the optional Monday Kickoff is enabled, also pre-built for the #1 idea so it's publish-ready.

## Hand-off
Pairs with the **Lead Engine** (the description links the lead magnet) and **Repurposing Engine**.
