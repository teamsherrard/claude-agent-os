# [Agent First Name] — Realtor AI Brain · Index
*Last updated: [Month Year] · Realtor AI Brain v[x.y]*

> **This is the index. Every skill reads this file first.**
> **This Brain lives in the agent's cloud workspace** (Google Drive or OneDrive — see `config.md` for the
> provider + workspace folder ID). The local copy is synced down each session. After you change anything
> here, it gets pushed back (via `realtor-brain-sync`, write → push → verify) so it persists.

## How to use this Brain (the laws)
1. **READ this first.** For depth on any topic, open the specific file listed under "The files" below.
   Never ask the agent for anything already in the Brain.
2. **WRITE back what you learn:**
   - New listing → `memory/listings.md`
   - Anything published or scripted → `memory/content-log.md`
   - Client conversation / note → `memory/clients.md`
   - New deadline or follow-up → `memory/deadlines.md`
   - Content performance review → `memory/performance.md` (read it back before planning new content)
   - This month's researched market numbers → `memory/market-data.md` (researched once, quoted by
     every market piece — never re-search what's already in the current month's block)
   - On-the-go idea / win / vendor / market note → **realtor-capture** files it into `memory/ideas.md`,
     `identity/proof.md`, `identity/vendors.md`, or `identity/market.md`
   - **Then PUSH to Drive** (`realtor-brain-sync`) — the local copy is wiped when the session ends;
     an unsynced write is a lost write.
3. **STAY COMPLIANT.** Before publishing anything public-facing, read `identity/compliance.md` — append
   the required brokerage disclaimer + license #, and avoid the listed "claims to avoid." *(If
   `compliance.md` is empty, proceed but note it's unset.)*
4. **SOUND LIKE THEM.** When producing anything **read aloud** (video / reel / YouTube scripts, tours), read
   `identity/voice-print.md` and write for the ear in their spoken cadence. When producing content that can
   carry a story (scripts, emails, posts), check `identity/story-bank.md` for a real story matching the topic
   or emotional beat, weave it into the open or close in their voice (**anonymize real clients**), then stamp
   its **Used-where** so stories rotate. Never fabricate a voice or a story — if a file is empty, just proceed.

If `~/realtor-brain/` is missing files, tell the agent to run **Realtor AI Brain — Setup**.

## Quick reference (the fields every skill needs)
- **Name:** [First Last]
- **Market:** [City, Region]
- **Primary avatar:** [short name — e.g., "NW Calgary first-time buyer"]
- **Voice in one line:** [e.g., "Direct, warm, locally rooted — never corporate"]
- **Primary CTA:** [e.g., "Book a free consult — [link]"]
- **Brand colors:** [#hex] / [#hex] / [#hex] · **Fonts:** [Heading] / [Body]
- **Booking link:** [url] · **Socials:** [@instagram, @youtube, @tiktok]
- **Locale:** [country · currency · units — format every price, date, and measurement to this (config.md)]

## The files
**identity/** — who the agent is (set once, changes rarely)
- `identity/profile.md` — name, credentials, contact, niche
- `identity/market.md` — communities, price ranges, local intelligence
- `identity/avatars.md` — target client types and their pains
- `identity/voice.md` — full tone rules, never-sounds-like, signature phrases, CTA
- `identity/offer.md` — services, guarantees, USP, why-hire-me
- `identity/brand-visual.md` — brand *direction*: colours, fonts, vibe, logo direction, tagline (feed to Claude Design)
- `identity/voice-samples.md` — real WRITTEN samples (how they type)
- `identity/voice-print.md` — the SPOKEN voice DNA (how they talk) — read for every read-aloud script
- `identity/proof.md` — testimonials, stats, case studies (reuse as proof)
- `identity/story-bank.md` — real career stories, tagged by topic (weave into scripts/emails/posts)
- `identity/content-engine.md` — content plan: pillars, platforms, cadence, series, video default
- `identity/publishing.md` — how the agent posts short-form (platforms, cadence, posting tool) — written by the Short-Form System
- `identity/operations.md` — hours, signature, booking rules, follow-up cadence
- `identity/vendors.md` — trusted partner network (AI Admin referrals)
- `identity/strategy.md` — goals (business · YouTube · life · personal) + positioning + competitors they admire
- `identity/business-plan.md` — the 90-day plan: deals needed + the 3 weekly moves + dashboard (refreshed quarterly)
- `identity/compliance.md` — disclaimers, license display, claims to avoid (read before publishing)

**memory/** — what the agent has done (grows daily)
- `memory/clients.md` — client ledger — **the AI's working memory, NOT the CRM.** The agent's CRM
  (GoHighLevel, Follow Up Boss, etc.) stays the system of record for contacts + pipeline; this file holds
  the context the AI needs (notes, active matters, preferences). Never present it as the CRM, and when
  they conflict, the CRM wins.
- `memory/listings.md` — listings + which content has been made
- `memory/content-log.md` — everything published (check before creating, to avoid repeats)
- `memory/performance.md` — what's working in content (written by the 2-week review; read before planning)
- `memory/market-data.md` — the local market numbers, one dated block per month (written by the Market System)
- `memory/deadlines.md` — what's due and when
- `memory/ideas.md` — content ideas + backlog captured on the go (read before generating new ideas; mark Used)

**intake/** — drop zone for the agent's existing materials (testimonials, bio, past posts, market reports,
lead magnets, workbooks). They upload here or point to a Drive folder, then say **"import my materials"** —
`realtor-import` extracts each piece and files it into `identity/` after they confirm. Not read directly by
other skills; it's the on-ramp, not a source of truth.

**config.md** — connectors, timezone, defaults, version
