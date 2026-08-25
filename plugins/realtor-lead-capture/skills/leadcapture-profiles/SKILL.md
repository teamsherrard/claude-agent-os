---
name: leadcapture-profiles
description: >
  Writes the agent's bio / about section for EVERY platform — Instagram, TikTok, Facebook, LinkedIn,
  YouTube, X, Threads, Google Business Profile, Zillow/Realtor.com, plus an email signature — each one
  sized to that platform's real character limit (count shown, never over), optimized for LEAD GEN (one
  CTA pointing at their funnel or booking link) AND for AI SEARCH (the same entity line on every
  platform, so "best [niche] realtor in [city]" AI answers can find and triangulate them). Reads
  everything from the Brain, saves the pack as a styled doc, and writes the final bios back to the Brain
  so every other system quotes the same words. Copy only — it never logs into any platform.

  Trigger on: "write my bios", "my Instagram bio", "fix my bio", "about section", "LinkedIn about",
  "YouTube channel description", "optimize my profiles", "bio for [platform]", "about me for my page",
  or any request for profile/bio/about copy for a platform.
---

# Platform Profiles — one identity, every platform, sized to fit

You write the agent's ENTIRE bio stack in one run — every platform, every character limit, one
consistent identity. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` (plain + warm, Brain first,
copy-only, compliant, write-back law) and `${CLAUDE_PLUGIN_ROOT}/shared/copywriting-kb.md`.

## Step 0 — Load, never ask
Pull the Brain (house rule 2 — pull before concluding anything is missing), then read: `brain.md`
quick-ref, `identity/profile.md` (name, credentials, years, brokerage), `identity/offer.md` (USP),
`identity/voice.md` (tone + signature phrases), `identity/proof.md` (real numbers only),
`identity/brand-visual.md` (tagline), `identity/compliance.md` (license display rules — some
states/provinces require the license # or brokerage in public profiles: whatever compliance.md says
appears in EVERY long-form bio and never gets cut for space).
**The CTA + link (one per bio):** the live funnel URL from the newest campaign in
`03 · Content/Guides/` (the funnel doc records it) → else their booking link (`brain.md` quick-ref) →
else a DM hook ("DM me MOVE for the guide"). Never more than one CTA per bio.
If a real bio already exists in `identity/profiles.md`, this is an UPDATE — show what changes and why,
never silently rewrite.

## Step 1 — The entity line (the AI-search key — build it FIRST)
One sentence, used VERBATIM near the top of every platform:
**"[First Last] — [niche] real estate agent in [City, State/Province]."**
(e.g. "Sam Smith — new-construction real estate agent in Austin, Texas.")
Why (say it to the agent in one line, labeled as the system's doctrine): AI assistants and search
engines recommend agents they can identify consistently — the same name + niche + city, word-for-word,
on every profile is what lets "best [niche] realtor in [city]" answers triangulate to THEM. Confirm the
entity line with the agent once (Your turn — one tap), then never vary it.

## Step 2 — Write the stack (limits are HARD — show the count under each, recount after any edit)
Every bio: entity line (or its compressed form) + their sharpest benefit + the one CTA. Voice per
`voice.md`. Grounding: ONLY facts from the Brain — never invent awards, years, sales numbers, or
designations; a bio with a made-up stat is a compliance incident on a public profile.

| Platform | Field | Hard limit |
|---|---|---|
| Instagram | Bio | 150 chars (line-broken, emoji sparingly, CTA + link label) |
| TikTok | Bio | 80 chars |
| X | Bio | 160 chars |
| Threads | Bio | 500 chars |
| Facebook | Page intro | 101 chars |
| Facebook | Page About | ~255 chars |
| LinkedIn | Headline | 220 chars |
| LinkedIn | About | up to 2,600 (first 300 carry the hook — the fold) |
| YouTube | Channel description | up to 1,000 (first ~150 show in search — entity line + hook there) |
| Google Business Profile | Business description | 750 (first 250 show — hand to `leadcapture-gbp` if they want the full GBP kit) |
| Zillow / Realtor.com / brokerage site | About | 200–300 words, long-form, proof-woven |
| Email | Signature block | name · entity line · phone · booking link · compliance line |

Platform notes that earn the expert badge: Instagram counts line breaks + emoji against the 150;
LinkedIn's first 300 characters decide whether About gets expanded; YouTube's description is SEARCHED —
work the niche + city query families in naturally; the long-form bios are written in first person, warm,
"you"-forward (copywriting-kb principle 5).

## Step 3 — Deliver + write back (atomic)
1. Render ONE doc per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` §4 (render_doc.py): each
   platform as a section, the paste-ready text in a copy block, the character count under it.
   Name: **"🪪 [Agent]'s Platform Profiles — [YYYY-MM-DD]"** → save to the workspace's **`02 · Brand/`**
   (find-or-create), hand the DIRECT link.
2. Write the finals to **`~/realtor-brain/identity/profiles.md`** (create if the brain predates it):
   entity line at top, then each platform's final text + date. Push (write → push → verify — the
   write-back law). Every other system now quotes the same identity.
3. Close with the checklist: *"Paste each one into its platform — start with Instagram and Google.
   When your brand, offer, or niche changes, say 'update my bios' and I'll refresh the whole stack."*
