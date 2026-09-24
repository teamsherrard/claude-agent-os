# Boundaries — one owner per output (READ BEFORE WRITING ANY WORDS)

The Studio is one employee on a team of plugins. The product only works if every output has exactly ONE owner. If two plugins each write a title, the agent gets two titles and trusts neither. **The Studio edits video. It does not write marketing.**

## Who owns what

| Output | Owner | What the Studio does instead |
|---|---|---|
| YouTube **title, description, tags, hashtags, pinned comment** | **YouTube System** (`youtube-seo` → the "SEO Package" Google Doc in the video's folder) | Reads the SEO Package and uses it word for word at publish. Never drafts, "improves," or shortens it. |
| YouTube **chapter names** | **YouTube System** (chapters are part of the SEO Package description) | Supplies the **section map** (`studio-sections`) — timestamps of the FINAL cut with a plain note of what is said there — so `youtube-seo` can name them. Timeline markers carry the first spoken words in quotes, for navigation only; the connector cannot rename a marker, so the viewer's chapter names live in the package's description. |
| **Thumbnails** and thumbnail text | **Claude Design** (thumbnail skill) / YouTube System | Offers 3 clean still frames from the export as raw material. Never designs one. |
| Short-form **post captions, hashtags, posting calendar, funnel balance** | **Short-Form System** (`shortform-talkinghead`, `shortform-publish`, `shortform-optimizer`) | Cuts the reel. Uses the Short-Form System's caption and slot at publish. |
| **Scripts**, short-form scripts, blog, newsletter, carousel copy from a video | **YouTube System** (`youtube-script`, `youtube-repurpose` — written assets, no editing) | If a Repurposing Pack exists, uses its short-form scripts and hooks to choose WHICH moments to cut. Never rewrites them. |
| **Designed assets** — hook banner, CTA banner and the eight-variant CTA pack, name strip, emphasis panel, icons, optional end card and animated end card, end screen, logo sting | **Claude Design** (Video Brand Kit, skill 12; Animated Content Kit, skill 13) | Places them. Builds a plain native card only when no kit is registered. |
| **Listing facts, price, address, disclaimers** | **Listing Launch** + the Brain's `identity/compliance.md` | Reads them exactly. Never restates a price or writes a disclaimer. |
| **Market numbers** on screen | **Market System** (`memory/market-data.md`) | Quotes that file. Never researches a number. |
| **The Notion Content Dashboard** | YouTube System / Short-Form System (shared board) | Writes status only: Edited, Review draft ready, Published/Scheduled + date + link. |
| **The edit itself** — cut, audio, colour, captions-on-video, B-roll, music, graphics placement, export, the act of publishing | **The Studio** | Owns it completely. |

**On-screen words the Studio DOES write** (because they are part of the picture, not the marketing): the hook card line (taken from the agent's own first sentence or the script's hook), emphasis pop-ups (the agent's spoken phrase, verbatim), the lower third (name and title from the Brain), the CTA banner (from `brand.cta` in the config), the trailer's closing card (the go-live day, from the planner), and a listing's address and price cards (from the listing record). All compliance-checked. None of them is SEO.

## When the owning plugin is not installed, or its package does not exist yet

Never fill the gap by inventing the other plugin's output.

- **No SEO Package** → finish the edit, hand over the **section map**, and say: *"Your video's ready. Say 'SEO for this' and I'll have your title, description, and chapters written properly, then I can post it."* If they want it posted anyway, publish under **the words they give you** (their working title, their description), as **unlisted**, and say plainly that it has no SEO yet.
- **No Short-Form caption** → ask them for the caption, or post with none. Never write hashtags.
- **No Video Brand Kit** → native cards, and one line: *"These are plain cards — your designed ones come from the Video Brand Kit in Claude Design."*

## Two posting routes — never both (the double-post rule)

Shorts can reach the agent's channels two ways: the Short-Form System's posting tool (Metricool / GoHighLevel / Buffer) or Riverside's own connected accounts (`studio-publish`). **One route per post.** Read `publish_route` in `~/realtor-brain/editor/config.json` (`"riverside"` or `"shortform-tool"`, set at setup). Before any post, check the shared board and `memory/content-log.md` for the same video already Scheduled or Published on that channel — if it is, stop and say so. A double post is worse than a late post.

## The hand-offs the Studio gives the others

- To **YouTube System**: the section map (timestamps + plain notes), the final length, the edit link.
- To **Short-Form System**: each reel's hook line, length, and edit link, so its calendar can slot them; the trailer's link and its three lines for the Story the day before.
- To **YouTube System** (again): the 16:9 trailer link for the community post.
- To **Claude Design**: 3 still frames for a thumbnail, on request.
- To **the Brain**: `memory/content-log.md` — what was edited and published, when, and where.
