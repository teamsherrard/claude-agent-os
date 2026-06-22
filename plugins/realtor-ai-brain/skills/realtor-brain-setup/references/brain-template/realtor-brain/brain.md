# [Agent First Name] — Realtor AI Brain · Index
*Last updated: [Month Year] · Realtor AI Brain v[x.y]*

> **This is the index. Every skill reads this file first.**
> **This Brain lives in the agent's Google Drive (`Realtor AI Brain` folder).** The local copy is synced
> from Drive each session. After you change anything here, it gets pushed back to Drive (via
> `realtor-brain-sync`) so it persists.

## How to use this Brain (the laws)
1. **READ this first.** For depth on any topic, open the specific file listed under "The files" below.
   Never ask the agent for anything already in the Brain.
2. **WRITE back what you learn:**
   - New listing → `memory/listings.md`
   - Anything published or scripted → `memory/content-log.md`
   - Client conversation / note → `memory/clients.md`
   - New deadline or follow-up → `memory/deadlines.md`
   - Content performance review → `memory/performance.md` (read it back before planning new content)
   - **Then PUSH to Drive** (`realtor-brain-sync`) — the local copy is wiped when the session ends;
     an unsynced write is a lost write.
3. **STAY COMPLIANT.** Before publishing anything public-facing, read `identity/compliance.md` — append
   the required brokerage disclaimer + license #, and avoid the listed "claims to avoid." *(If
   `compliance.md` is empty, proceed but note it's unset.)*

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
- `identity/brand-visual.md` — brand *direction*: colours, fonts, vibe, logo direction, tagline (feed to Claude Design)
- `identity/voice-samples.md` — real writing samples (match their actual voice)
- `identity/proof.md` — testimonials, stats, case studies (reuse as proof)
- `identity/content-engine.md` — content plan: pillars, platforms, cadence, series, video default
- `identity/publishing.md` — how the agent posts short-form (platforms, cadence, posting tool) — written by the Short-Form System
- `identity/operations.md` — hours, signature, booking rules, follow-up cadence
- `identity/vendors.md` — trusted partner network (AI Admin referrals)
- `identity/strategy.md` — goals (business · YouTube · life · personal) + positioning + competitors they admire
- `identity/compliance.md` — disclaimers, license display, claims to avoid (read before publishing)

**memory/** — what the agent has done (grows daily)
- `memory/clients.md` — client ledger
- `memory/listings.md` — listings + which content has been made
- `memory/content-log.md` — everything published (check before creating, to avoid repeats)
- `memory/performance.md` — what's working in content (written by the 2-week review; read before planning)
- `memory/deadlines.md` — what's due and when

**config.md** — connectors, timezone, defaults, version
