# Platform Rules — The Short-Form Optimization Playbook

The single source of truth for how a short-form post is packaged per platform. Every short-form skill
reads this file. Update it here and every workflow inherits the change.

Core principle: **one idea, three native packagings.** Each platform ranks and displays content
differently, so the hook is shared but the caption, hashtags, and metadata are not.

Follows Mike's frameworks (`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md`): **3–5 searchable hashtags
max on every platform**, and captions/hooks **never say "stop scrolling."**

---

## Instagram Reels + Facebook

Treated together — one caption serves both, with a small Facebook tweak noted at the end.

**Caption structure:**
1. **Line 1 = the hook**, adapted for reading (the spoken hook from the video, rewritten to stop a
   thumb mid-scroll). This is the only part most people see before "…more" (~125 chars) — make it earn
   the tap.
2. **2–4 short lines of value / local context** — the substance, in the agent's voice, naming the city.
3. **One CTA line** — matched to the post's funnel role (see CTA map in SKILL.md).

- **Length:** ~100–200 words. Short, skimmable, line breaks between thoughts.
- **Tone:** `voice.md`. Speak to one person ("you"), not a broadcast.
- **Emoji:** sparingly, only if it fits the agent's voice.

**Hashtags (Instagram): 3–5 searchable — no more** (Mike's rule; a hashtag wall reads as spammy and
doesn't help reach). Blend:
- **1–2 hyperlocal** — `#[City]RealEstate`, `#[City]Homes`, `#[Neighbourhood]`
- **1–2 topic** — e.g. `#FirstTimeHomeBuyer`, `#[City]Living`
- **1 broad** (optional) — `#RealEstate` / `#Realtor`
- Prefer searchable, mid-size tags over million-post giants. Avoid follow-bait (#followforfollow, #f4f).

**Facebook tweak (note it, don't rewrite the whole thing):**
- Trim to **~3–5 hashtags** (FB doesn't reward dense hashtags).
- FB allows a **clickable link** — the agent can paste their booking link directly in the caption.
- Slightly more conversational / community-framed is fine; FB skews to an older, local audience.

---

## TikTok

TikTok is a **search + discovery** engine. People search TikTok like Google, so keywords matter — in
the caption AND ideally spoken/on-screen in the video.

**Caption rules:**
- **ONE LINE. NO LINE BREAKS.** The posting API strips line breaks, so write it as a single flowing
  sentence. Never format it as multiple lines.
- **Keyword-led + conversational** — lead with what someone would search ("buying in [city]…"), keep
  it casual and native to TikTok (not a polished IG caption).
- End with a **light CTA** woven in, not a formal sign-off.
- **Length:** short — roughly one sentence plus hashtags. Front-load the searchable terms.

**Hashtags (TikTok): 3–5**, blended:
- 1–2 **searchable local** — `#[city]`, `#[city]realestate`, `#[city]homes`
- 1–2 **niche/topic** — `#firsttimehomebuyer`, `#hometok`, `#realestatetok`
- 1 **broad reach** — `#realtok`, `#fyp` (only one broad tag; don't stuff)
- Lowercase, no spaces. Put them inline at the end of the single-line caption.

**On-screen text note (pass to the agent):** TikTok rewards a keyword in the first on-screen caption —
suggest one short keyword overlay for the opening frame.

---

## YouTube Shorts

Shorts are **searchable and indexed by Google + YouTube** — this is the SEO play of the three. Titles
and tags do real ranking work here.

**Title:**
- **Search-friendly, keyword-front, under ~70 characters.**
- **Include the city.** Lead with the term someone would type.
- End with **#Shorts**.
- Example shape: `Should You Buy in [City] Right Now? (2026 Market) #Shorts`

**Description:**
- **2–3 lines.** Open with a keyword-rich sentence restating the topic + city.
- Add one line of context/value, then the **CTA + booking link** (links are clickable on YouTube).
- Weave in 2–3 natural keywords; don't keyword-stuff.

**Hashtags: 3–5** in the description — include `#Shorts` + `#[city]` + 1–2 topic tags (Mike's 3–5 rule).

**Tags** (the separate YouTube keywords field — not visible hashtags): a handful of searchable phrases for
indexing — city + market terms, the main topic, agent/brand. This field is metadata, not the hashtag count.

---

## Video assets (video formats only — green screen, talking head, home tour, story; NOT carousel)

These belong to the post, not a single platform — produce them once for any video.

- **Cover / thumbnail text** — the bold **3–6 word** overlay on the first frame. It's what stops the
  scroll in the feed/grid, so it must tease the payoff, not summarize. Give one strong option (a second
  if useful). Examples: "Calgary's window is closing", "Rates held — now what?", "$750K in NW Calgary".
- **On-screen text cues** — 2–3 short overlays (**≤6 words each**) placed at the beats where they
  reinforce the spoken line: the key stat, the city, a turning-point phrase. These drive retention.

Text instructions only — the agent adds them in their editor. Never render an image.

---

## The CTA map (the silent 4-3-2-1 logic + lead-magnet routing)

Match the CTA on **both** the funnel role and the post topic. Any DM-keyword or download CTA must point
to a **real lead magnet listed in `identity/offer.md`** — never invent one. If none fits, use a soft CTA.

Mike's 4-3-2-1 (keep this ratio across the agent's posts): **4 reach (40%) · 3 value/education (30%) · 2 trust/connection (20%) · 1 conversion (10%)**.

| Post type / funnel role | CTA |
|---|---|
| **4 · Awareness / reach** (40%) | "Follow for [city] updates" · "save this" · "send this to someone thinking of moving" |
| **3 · Value / education** (30%) | "save this" · "follow for more tips" · "DM me '[KEYWORD]' for the [guide]" (→ a real lead magnet) |
| **2 · Trust / connection** (20%) | invite a reply, comment, or DM'd question — no ask for business |
| **1 · Conversion / selling** (10%) | book a call · download the lead magnet · request a home valuation (Primary CTA from `voice.md`) |
| Market update | "DM '[REPORT]' for this month's [city] market report" |
| Buyer education | DM **"BUYER"** → the buyer lead magnet |
| Seller education | DM **"SELLER"** → the seller lead magnet |
| Relocation | DM **"RELOCATION"** → the relocation guide |
| Neighbourhood / home tour | "DM for the full [neighbourhood] guide" · "address in bio" |
| Client story / personal story | relate + soft invite ("if this is you, DM me") — proof builds trust, don't hard-sell |

Only ~1 in 10 posts is a hard conversion CTA (the "1" in 4-3-2-1). Default to soft when unsure.

---

## Cross-platform rules (apply to all)

- **Never paste one identical caption across all three.** Different lengths, different hashtag logic,
  different CTAs. If two outputs look the same, rework them.
- **3–5 hashtags max** on every platform (Mike's rule) — searchable, mostly local; never a hashtag wall.
- **Never write "stop scrolling" / "don't scroll"** in a hook or caption — it reads as desperate (Mike).
- **Name the local market** in every version — local is the realtor's edge.
- **Match the funnel role** — soft CTAs by default; a hard "book a call" only on conversion posts
  (~1 in 10).
- **Voice first** — read it back; does it sound like the agent (`voice.md`), or like generic marketing?
- **Compliance last** — disclaimer/license where required; strip any "claims to avoid."
- **Text only** — this skill outputs words. Any visual (thumbnail, carousel slide, background) is
  described in words for the agent to build in claude.ai/design; it is never rendered here.
