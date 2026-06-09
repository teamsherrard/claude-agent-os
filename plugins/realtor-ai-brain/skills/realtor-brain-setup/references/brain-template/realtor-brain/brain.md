# [Agent First Name] — Realtor AI Brain · Index
*Last updated: [Month Year] · Realtor AI Brain v[x.y]*

> **This is the index. Every skill reads this file first.**

## How to use this Brain (the two laws)
1. **READ this first.** For depth on any topic, open the specific file listed under "The files" below.
   Never ask the agent for anything already in the Brain.
2. **WRITE back what you learn:**
   - New listing → `memory/listings.md`
   - Anything published or scripted → `memory/content-log.md`
   - Client conversation / note → `memory/clients.md`
   - New deadline or follow-up → `memory/deadlines.md`

If `~/realtor-brain/` is missing files, tell the agent to run **Realtor AI Brain — Setup**.

## Quick reference (the fields every skill needs)
- **Name:** [First Last]
- **Market:** [City, Region]
- **Primary avatar:** [short name — e.g., "NW Calgary first-time buyer"]
- **Voice in one line:** [e.g., "Direct, warm, locally rooted — never corporate"]
- **Primary CTA:** [e.g., "Book a free consult — [link]"]
- **Brand colors:** [#hex] / [#hex] / [#hex] · **Fonts:** [Heading] / [Body]
- **Booking link:** [url] · **Socials:** [@instagram, @youtube, @tiktok]

## The files
**identity/** — who the agent is (set once, changes rarely)
- `identity/profile.md` — name, credentials, contact, niche
- `identity/market.md` — communities, price ranges, local intelligence
- `identity/avatars.md` — target client types and their pains
- `identity/voice.md` — full tone rules, never-sounds-like, signature phrases, CTA
- `identity/offer.md` — services, guarantees, USP, why-hire-me
- `identity/brand-visual.md` — colors, fonts, logo, tagline

**memory/** — what the agent has done (grows daily)
- `memory/clients.md` — client ledger (Jarvis)
- `memory/listings.md` — listings + which content has been made
- `memory/content-log.md` — everything published (check before creating, to avoid repeats)
- `memory/deadlines.md` — what's due and when

**config.md** — connectors, timezone, defaults, version
