---
name: leadcapture-gbp
description: >
  Builds the agent's complete Google Business Profile kit — the #1 local search surface, feeding Google
  Maps and the AI answers for "best realtor in [city]". Writes everything as a paste-by-paste checklist
  in the GBP dashboard's own order: the 750-character business description, the services list from their
  real offer, seeded Q&A in their voice, the first month of Google posts (pointing at their lead magnet
  funnel), review-reply templates, a photo checklist — AND the social-links setup that turns Google's
  new Social Media Updates carousel into free Maps distribution for every reel the Short-Form System
  already posts. Reads the Brain; copy only — never logs into Google, never claims the profile for them.

  Trigger on: "set up my Google Business Profile", "Google profile", "GBP", "show up on Google Maps",
  "Google posts", "Google reviews" / "reply to my Google reviews", "connect my socials to Google",
  "google my business", or any Google Business Profile request.
---

# Google Business Profile Kit — own "realtor near me"

Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and `${CLAUDE_PLUGIN_ROOT}/shared/copywriting-kb.md`.
When locals — or AI assistants — look for a realtor in their market, the Business Profile is what Google
shows first. Your job: hand the agent everything to paste, in the order the GBP dashboard asks for it.

## Step 0 — Load, never ask
Pull the Brain (house rule 2), then read: `brain.md` quick-ref, `identity/profile.md`,
`identity/offer.md`, `identity/market.md` (communities), `identity/avatars.md` (the questions real
prospects ask), `identity/proof.md`, `identity/compliance.md`, `identity/profiles.md` (the entity line +
GBP description if `leadcapture-profiles` already wrote them — reuse, never re-invent), and
`memory/market-data.md` (current sourced numbers, if the Market System has run).
One status question only (Your turn — one tap): *"Is your Google Business Profile already claimed and
verified, brand new, or not sure?"* Unclaimed → point them to google.com/business to claim it (we never
log in or claim for them — no credentials, ever); the kit works the moment they're in.

## Step 1 — The kit (write ALL of it, in dashboard order)
Grounding rules bind throughout: only Brain facts; market numbers ONLY from `memory/market-data.md` or
`market.md` with source + date (never re-research what's current — and never an unsourced stat on a
public profile); NEVER draft a review, only replies to reviews others wrote.

1. **Business description** — 750 chars max (first ~250 show — entity line + strongest benefit there).
   Reuse `profiles.md`'s if present. Count shown.
2. **Categories** — primary: Real estate agent / Real estate consultant; suggest secondaries that match
   their actual niche. One line on why the primary category is the biggest ranking lever they control.
3. **Services list** — one service per real offer item (`offer.md`), each with a one-line, benefit-first
   description. Never list a service they don't offer.
4. **Q&A — seed it yourself (legit and underused):** 8–10 REAL questions their avatars actually ask
   (`avatars.md` fears + `market.md` communities — "Do I need 20% down in [city]?", "Can I use my own
   agent for new construction?"), each answered in their voice, ≤ ~300 chars, ending with a soft CTA.
   The agent posts the question from their personal account and answers from the business — Google
   allows owner-seeded Q&A, and it pre-answers the exact queries AI assistants scan.
5. **The first month of Google posts** — 4 posts, one per week, each ≤1,500 chars with an image
   suggestion + button (Learn more / Sign up):
   Week 1 — introduction: the entity line + what makes them different (offer.md).
   Week 2 — the lead magnet: their guide + the funnel link (this is the lead-gen engine — GBP feeds
   the funnel `leadcapture-funnel` built; if no funnel exists yet, point at the booking link and note
   the funnel upgrade).
   Week 3 — market insight: ONE sourced number from `market-data.md`/`market.md` (source + date in the
   post) — or an evergreen community post if nothing current is on file.
   Week 4 — proof: a real testimonial (verbatim from `proof.md`, first name only) or a community
   spotlight. Never a fabricated review, never client PII.
6. **Review-reply templates** — 5 replies (happy buyer · happy seller · detailed review · short review ·
   critical review). Warm, specific, in their voice; the critical one de-escalates and moves offline;
   NO transaction details or client info in any reply (compliance.md rules apply to replies too).
7. **Photo checklist** — headshot, logo, cover, 3 community shots (from `02 · Brand` /
   `06 · Materials` if they have them; otherwise the shot list to capture on their phone this week).

## Step 2 — Connect the socials (the new leverage — explain it in plain words)
**The setup:** in the GBP dashboard → Edit profile → Social profiles, add ONE link per platform —
Facebook, Instagram, LinkedIn, Pinterest, TikTok, X, YouTube. Pull the exact URLs from `brain.md`
quick-ref / `profiles.md`; list them ready to paste.
**Why it's a big deal (say this):** Google now auto-shows recent posts from connected social accounts
right on the Business Profile — a "Social Media Updates" carousel on Maps and Search (rolling out
through 2026; if it isn't visible on their profile yet, connecting now means it's live the day it
lands). *"You're already posting three times a week with the Short-Form System — connect these links
once, and every reel you post also shows up on your Google listing. Free local distribution, zero extra
work — and active profiles are winning the top Maps spots."*
**The honest caveat:** Google chooses which posts appear (you choose the networks, not the posts) — so
everything posted stays brokerage-compliant, which the system already enforces on every post it writes.

## Step 3 — The rhythm (keep it alive — a stale profile sinks)
- **Monthly:** when the Market System runs, one GBP post with that month's headline number (quote
  `market-data.md` — research once, quote everywhere).
- **Per listing:** Listing Launch's just-listed and just-sold posts go on GBP too — same copy, Google
  audience.
- **Reviews:** reply within 48 hours using the templates; ask every closing for a review (Listing
  Launch's CLOSE IT stage already writes the ask).

## Step 4 — Deliver + write back
Render ONE doc per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` §4, sections in the exact order
above (paste-by-paste): **"📍 [Agent]'s Google Business Profile Kit — [YYYY-MM-DD]"** → the workspace's
**`02 · Brand/`** (find-or-create), hand the DIRECT link. Log the kit + date in `memory/content-log.md`
and push (write → push → verify). Close: *"Work top to bottom in your Google dashboard — description
first, socials connected before you close the tab. Say 'update my Google posts' next month and I'll
write the new set."*
