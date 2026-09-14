---
name: youtube-channel
description: >
  The Channel Page Kit for the Realtor YouTube System — builds the agent's actual YouTube channel PAGE so
  it converts and ranks: the keyworded channel description + about section, the links block, channel
  keywords, the playlist structure (their real Game Plan playlists), a banner text brief, upload defaults
  (with the doctrine's CTA-first default description), and a channel trailer plan — delivered as a
  paste-by-paste checklist in YouTube Studio's own order, plus a saved Channel Page Kit doc. Works for a
  brand-new channel (week-1: page ready before the first video) or as a fix for a messy existing one (with
  the data connection it reads their REAL current page first). This owns the channel PAGE only — full
  system onboarding ("set up my YouTube system") belongs to youtube-setup.

  Triggers on "set up my channel page", "set up my youtube channel", "channel setup", "fix my channel",
  "fix my channel page", "channel description", "about section", "optimize my channel", "my channel looks
  empty/bad", "channel keywords", "banner", "playlists", "upload defaults", "channel trailer".
---

# Channel Page Kit — make the channel page rank and convert

The agent's channel page is their storefront: it tells YouTube what the channel is about (ranking) and
tells a first-time visitor why to stay and reach out (converting). This skill builds every piece of it,
paste-ready. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` — plain-warm talk (#7), Brain-first (#2),
compliance (#3), the doc pipeline (#4), why-not-ChatGPT (#8).

**Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — **§18.3** (keywords:
market-specific real search phrases, never broad terms or marketing-speak), **§18.1–§18.2** (the CTA-first
description order — it governs the upload-defaults template), **§15.1 + Shift 4** (playlists per pillar,
one per focus), **§16** (search language: write words people actually type), **§21** (compliance on
everything public). The channel page is doctrine §18 applied to the CHANNEL instead of a video.

**The Live Data Engine** (`${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md`): with the data
connection, the EXISTING-channel path reads their real current page first (recipe 1 with the snippet part —
current description, handle, country) so the fix is grounded in what's actually there. Read-only, always.
Without it: ask them to paste their channel link (public read) or their current about text. **Never say
"connect your channel"** — it's a link or a paste.

## Step 1 — Load everything (ask NOTHING the system knows)
- **The Brain:** `profile.md` (name, brokerage, market), `market.md` (communities by name), `avatars.md`
  (who they serve), `offer.md` (CTA, booking link, lead magnets), `voice.md`, `compliance.md` (brokerage
  disclosure + license line — the about section carries it), `proof.md` (one real credibility line).
- **The Game Plan + YouTube Layer:** the 3 pillars + their **named playlists** (Shift 4) and cadence — the
  page must match the plan, not invent a second strategy. No Game Plan yet? The kit still builds (playlists
  default to the 6 content types localized to their market) — but offer the Game Plan first if they're new.
- **The Brain's saved bios** (if the Lead Capture profiles pack wrote them): reuse the SAME entity line and
  CTA phrasing — every platform saying the same thing is what lets AI search triangulate them. Never write
  a competing YouTube bio; extend the saved one channel-native, and note any refinement back to the Brain.
- **Mode:** NEW (no channel / empty) or EXISTING (fix it). Infer from the Layer's channel status — never ask
  if it's already known. EXISTING → read the current page (engine, or their paste) and open the checklist
  with one plain line on what you're changing and why ("swapping the marketing-speak for phrases people
  actually search; keeping your booking link").

## Step 2 — Build the kit (every piece paste-ready, in Studio's own order)
Deliver **one piece at a time in chat** — plain-warm, with the exact click-path above each piece. The agent
pastes as you go; the whole thing is ~15 minutes. The pieces, in order:

1. **CHANNEL DESCRIPTION** *(Studio → Customization → Basic info → Description — the opening paragraph)*
   2–3 sentences in their voice, keyworded the way people search (§18.3: "moving to [city]", "[city]
   neighborhoods", "homes for sale in [city]" — their REAL market + communities, never "your trusted real
   estate resource"), naming who it's for + what they'll get + the cadence from the plan.
2. **ABOUT SECTION** *(pasted directly below the description, same field)*
   Who the channel serves (their avatars, in plain words) · what the videos cover (their 3 pillars, named) ·
   one real proof line (`proof.md` — never invented) · the CTA with the actual booking/magnet link (§18.1:
   the ask + the link, early and unmissable) · the **brokerage disclosure + license line** (`compliance.md`).
3. **LINKS** *(Customization → Basic info → Links)* — priority order with one plain "why" each: booking
   link first (the conversion path), the lead-magnet funnel, website, then ONE best social. Not ten links —
   the page has one job.
4. **CHANNEL KEYWORDS** *(Studio → Settings → Channel → Basic info → Keywords)* — 8–12 market-specific
   phrases (§18.3: "[city] real estate", "moving to [city]", "living in [city]", their communities, their
   niche). Never broad single words ("realtor", "homes").
5. **PLAYLISTS** *(Content → Playlists → New)* — **their Game Plan's named playlists, one per pillar**
   (Shift 4 — that's what makes viewers binge a lane and converts subscribers), each with a one-line
   keyworded description; plus the standing ones as their library grows (market updates · community tours ·
   the remaining content types, localized). Titles in search language (§16).
6. **BANNER TEXT BRIEF** *(words only — they build it in their design tool; finished image →
   Customization → Branding → Banner)* — headline + subline that pass the 2-second test: who it's for +
   the market + the cadence (e.g. "Everything About Living in [City]" / "New videos every week"). Include
   the safe-area note (keep text centered — TV/desktop/mobile crop differently). We map; we never design.
7. **UPLOAD DEFAULTS** *(Studio → Settings → Upload defaults)* — so every future upload starts right:
   the **default description block on the §18.2 template** (first 3 lines = CTA + booking link + phone/email
   + lead-magnet link — exactly the order every video's SEO package uses), a small default tag set (§18.5:
   market-specific, don't overthink), category (People & Blogs or Travel & Events — whichever fits their
   mix), default visibility, and language.
8. **CHANNEL TRAILER (new channels)** — don't script it here: *"want your channel trailer? Open a fresh
   chat and say 'make this video: my channel trailer' — 60–90 seconds: who you help, what you cover, and
   your CTA — and it gets the full treatment."* (One chat = one video; the trailer is a video.) EXISTING
   channels with a strong recent video: set that as the trailer instead — name which one and why.

**Every piece paste-ready as written** — the only [brackets] allowed are for facts the agent declined to
give (flag those at the top). Run the **compliance pass (#3)** on the whole kit before delivering: Fair
Housing on every phrase, disclosure present, no guarantees, no invented stats.

## Step 3 — Save the kit + confirm
Assemble the full kit as structured text on the **Channel Page Kit skeleton**
(`${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md`), render via `shared/render_doc.py`, and save as
**`Channel Page Kit`** in the **`Setup/`** folder (next to the YouTube Layer — resolve per
`${CLAUDE_PLUGIN_ROOT}/skills/youtube-setup/references/drive-structure.md`, never duplicate). Confirm plainly: *"Your channel page kit is saved —
and everything's pasted. Your channel now tells YouTube exactly what it is, and tells a visitor exactly
why to reach out."* Note in the **YouTube Layer** that the channel page is set (date) so check-ins and
the coach know.

## Rules
- **The page matches the plan** — playlists ARE the Game Plan's playlists; keywords ARE their pillars +
  market. One strategy everywhere (house rules #10).
- **Search language, never marketing-speak** (§16/§18.3) — if a phrase couldn't be typed into the YouTube
  search bar by a real buyer, rewrite it.
- **One entity line across platforms** — reuse the Brain's saved bios; consistency is what AI search rewards.
- **No subscriber promises, no hype** — the page's job is clarity and conversion, not bravado.
- **We paste-guide; we never touch the channel.** Every change is the agent pasting in their own Studio —
  nothing is written to YouTube by the system (read-only, always).
- EXISTING mode keeps what's working (accurate facts, live links, a good handle) — say what you kept.

## Hand-off
New channel → *"Page's ready. Now let's fill it: say 'build my game plan'"* (if none) or *"pick a title
from your plan and say 'make this video.'"* Existing → the fix list is done; route them back to the plan.
