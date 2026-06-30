---
name: youtube-leads
description: The Lead Engine for the Realtor YouTube System — turns each video into a lead capture. For a video, produces a complete Lead Magnet MAP — a page-by-page content + framework + offer + CTA spec the agent copies into their own design tool (we map; we do not design) — engineered from the avatar's real fear plus that video's topic. Runs inside that video's one chat as part of the video package (one chat = one video). Reads the AI Brain (offer, USP, avatars, CTA, booking link). Saves the "Lead Magnet Map" Google Doc in the video's folder. Triggers on "make a lead magnet", "lead magnet for this video", "map my lead magnet".
---

# Lead Engine

Turn views into booked calls. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

**Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — §6 (the CTA
framework), §18.1 (the description CTA + links), §26 (the CTA library). The lead magnet is offered *through*
the doctrine's CTAs: the **primary CTA right after the hook** and the **secondary CTA at the end** are what
send the viewer to the magnet/booking link, and the **first 3 lines of the description** carry the
booking/calendar/phone/email + the magnet link.

> **Part of the video package — one chat = one video.** This normally runs as Step 4 of Make This Video,
> inside that video's chat. If the agent asks for a lead magnet for a video made outside the system, do it
> in a chat/folder for THAT video — everything for one video stays in one place. Never a separate workflow.

## The Lead Magnet MAP (we map, they design)
For the video, produce a paste-ready spec for the agent's design tool. Structure:
```
LEAD MAGNET MAP — "{title}"
HOW TO USE: copy this into your design tool → "Design as a premium PDF using my brand."
THE BRIEF: title · subtitle · audience (avatar) · goal (capture leads from this video) · tone (Brain voice)
PAGE-BY-PAGE: for each page → Purpose · Framework/layout · exact COPY (headlines + body)
  (e.g. Cover → Why it matters + key stats → The how (steps/checklist) → Honest truth → Next steps/CTA)
THE OFFER & DISTRIBUTION: the hook · where it lives (video description + pinned comment) · the exchange
  (email → download) · the next step (book the call) · which video it pairs with
```
**Why this magnet (state it):** tie the magnet directly to the avatar's stated fear (from the Brain) + the
video's topic — e.g. a "buy-and-sell timeline" guide for the two-mortgage fear. Engineered for HER buyer's
pain, never a random freebie. Match it to the agent's offer/USP/CTA. Save as a **Lead Magnet Map** Google Doc
in the video's folder, using the Lead Magnet Map skeleton in `${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md` and
the "resolve, never duplicate" rule in
`${CLAUDE_PLUGIN_ROOT}/skills/youtube-setup/references/drive-structure.md`. (No visual design — that's the
agent's tool.)

**How the magnet is offered — through the doctrine's two CTAs (§6, §26), never a standalone pitch:**
- **Primary CTA (right after the hook, §6.1–§6.3):** the warm, value-first invitation — "my name is [Name]
  with [Brokerage], I have people just like you reaching out every week… if you'd like to chat about *your
  unique situation* and how I can help you *avoid costly mistakes*, [book a private call / grab the free
  guide] using the link in the description." Use the §26 library + the §6.4 variation that fits the avatar
  (buyer / seller / relocation / new-construction / luxury); rotate variations across videos, never an
  identical repeat. The magnet rides this CTA as the friendly, low-commitment first step.
- **Secondary CTA (the end, §6.5):** remind them to grab the magnet / book the call, then point to the next
  best video.
- **Description (first 3 lines, §18.1):** booking/calendar link · phone · email · the lead-magnet link —
  these come first, before the summary. That's where the in-video CTAs send the viewer.

(The §6 wording lives in the Brain's voice; pull the exact booking link, calendar, and offer from the Brain.)

## Open question it respects
Where the opt-in lives (their site/form/CRM) varies — note it from the Brain; if unknown, use a
`[LEAD CAPTURE LINK]` placeholder and flag it.

## Modes
Inside the video's chat — as Step 4 of Make This Video, or whenever the agent asks for that video.
