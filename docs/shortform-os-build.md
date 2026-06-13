# Short-Form OS — Architecture & Build Order (v6)

The short-form content operating system for realtors, organized around **how agents actually work**
(batch by format), not around a master calendar. Companion to `shortform-publishing-layer.md`
(the Metricool publish + analytics rail).

Source: `$10MM Systems - Content to Client Cohort (6).docx` + decisions 2026-06-12.

---

## 1. Two principles that scope the whole system

### Principle A — The agent thinks in FORMATS; Claude enforces the rest (3 axes)
Three orthogonal axes. Only the first is visible to the agent.

| Axis | Controls | Visible to |
|---|---|---|
| **Format** — green screen / carousel / talking head | Production: the workflow, the batching, what's delivered | **Agent** (the only thing they think about) |
| **4-3-2-1** — awareness / trust / authority / conversion | Funnel balance across the 2-week cycle | **Claude, silently** (a check, not a unit of work) |
| **80/20** — broad / niche | Reach vs. conversion in topic selection (esp. talking head) | **Claude, silently** |

The agent says "it's talking-head batch day." Claude picks the specific topics, angles, and CTAs so
the hidden 4-3-2-1 balance and 80/20 split work out across the cycle. Agent gets simplicity; the
system keeps the rigor. This is "Claude does the heavy thinking; the agent records," made structural.

### Principle B — MAP, don't design
**Code/Cowork skills never render visual design.** They output copy + framework + direction (text).
The agent pastes that into **claude.ai/design** to render the actual visuals.

- Consistent with the existing "we map, we do not design" pattern (`youtube-leads` lead magnets).
- Scopes the entire short-form system to **text output** — scripts, talking points, captions,
  carousel specs, optimization, analytics. No image pipeline, fast, cheap.
- Consequences: carousel workflow is **spec-only** (do NOT wire `design-director`/`carousel-designer`);
  green-screen workflow **drops PNG background generation entirely**.
- **FULLY LOCKED 2026-06-12** (Mike: "Do not generate any designs. Do not generate any PNG
  backgrounds. No."). No exceptions, no override. `realtor-article-greenscreen` is therefore
  superseded — its only unique value over `trending-articles` was the PNG output — so it is
  retired/absorbed, not consolidated.

---

## 2. Cadence model

Assumption: most agents post ~1×/day, some up to 2×/day. Ideal = 1 green screen/day + 1 category
post/day from: talking head value, home tour, carousel, client success story, just listed/just sold,
personal story.

**Realism flag:** 2/day = 28 posts per 2 weeks (vs v5's 10). Green screen daily is fine (hook +
talking points = a ~2-min film). But a filmed category post *every* day is heavy. Realistic default
the menu enforces:

> Daily green screen (quick, reactive) · 3–4 batched talking heads/week · 2–3 carousels/week ·
> listing/story content as it naturally happens.

Lands near 1.5–2/day without demanding two real films daily; the 4-3-2-1 check keeps it balanced.

---

## 3. The three production workflows

### 3.1 Daily Green Screen — reactive, NOT batched
Timeliness drives performance, so this runs once/day on whatever's relevant right now.
**Delivers:** the article (verified link) + a strong **hook** + **key talking points (NOT a full
script)** + per-platform optimization. No PNG background (Principle B).
**Build:** mostly REUSE — `realtor-trending-articles` adapted to *daily single delivery*, *lead with
talking points* (it already outputs riff notes; make the full script optional), + the shared
optimizer. Consolidate `trending-articles` + `article-greenscreen` into this one skill (minus PNGs).

### 3.2 Talking Head — batched
**Delivers:** a list of video topics from the agent's local market + niche on the **80/20 rule**
(80% broad/reach, 20% niche) → **scripts** → per-platform optimization.
**Build:** light NEW — topic generator reads `identity/content-engine.md` pillars + market/avatars;
script logic already exists in the article skills; + shared optimizer.

### 3.3 Carousel — batched, SPEC ONLY
**Delivers (copyable text, no rendered slides):** cover slide (hook) · slide-by-slide copy (6–9
slides) · framework + design direction in words · caption + hashtags (IG/FB) · CTA = lead magnet or
"share with a friend." Agent builds the slides in claude.ai/design.
**Build:** light NEW, spec-only. Do NOT wire any design/render skill.

### Category posts (not new workflows — reuse existing skills)
- Home tour, just listed/just sold → `realtor-listing-content-kit`
- Client success story → `realtor-voice-proof` proof library
- Personal story → small net-new topic helper (or a talking-head sub-mode)

---

## 4. Shared component — `shortform-optimizer` (highest-leverage net-new)
Every workflow calls it. Produces per-platform variants:

| Platform | Output |
|---|---|
| Instagram + Facebook | Caption + hashtags (save/share + DM-keyword CTA) |
| TikTok | Caption + hashtags — **NO line breaks** (TikTok API strips them) |
| YouTube Shorts | Search-friendly title + description + tags |

Reads `identity/voice.md` (CTA, tone), `identity/compliance.md` (third law — gates every caption),
`identity/market.md` (local hashtags). Build once; all three workflows depend on it.

---

## 5. Orchestration — light menu + balance tracker (NOT the heavy v5 planner)
Replaces the v5 "Two-Week Planner" keystone. A thin front-door that:
- Tells the agent their format-based week ("3 talking heads, 2 carousels, daily green screen").
- Silently maintains the 4-3-2-1 balance + 80/20 split when choosing topics/CTAs.
- Flags gaps ("you're light on trust + conversion → here's a client story + one soft-CTA post").
- Mirrors the `youtube-planner` front-door pattern (plain-English routing to the right workflow).

---

## 6. Publish + measure (unchanged — see `shortform-publishing-layer.md`)
All three workflows feed the Metricool MCP: schedule at `get_best_time_to_post` slots (daily green
screen benefits most), pull per-post metrics into `shortform-analytics`, write winners to
`memory/performance.md`, next cycle's menu reads them. Screenshots remain the never-blocked fallback.

---

## 7. Reuse vs. build (v6)

| Component | Status |
|---|---|
| Agent knowledge (brand/market/voice/offer/compliance/pillars) | ✅ Reuse the Brain |
| `shortform-optimizer` (shared) | 🔨 Build — do first |
| Daily Green Screen | ♻️ Reuse+consolidate `trending-articles`+`article-greenscreen` (drop PNGs) + optimizer |
| Talking Head | 🔨 Light new (80/20 topics + existing script logic + optimizer) |
| Carousel | 🔨 Light new, spec-only (no design wiring) |
| Home tour / just listed-sold | ✅ Reuse `listing-content-kit` |
| Client story | ✅ Reuse `voice-proof` |
| Personal story | 🔨 Tiny new helper |
| Menu + balance tracker | 🔨 Light new (front-door pattern) |
| Publish + analytics | 🔨 Build on Metricool MCP (publishing-layer spec) |

---

## 8. Build order
1. **`shortform-optimizer`** (shared dependency).
2. **`shortform-greenscreen`** (daily, text-only) — completes the first vertical slice:
   timely article → hook + talking points → per-platform optimization → schedule (Metricool) →
   analytics. Highest frequency, most reuse, least new code; proves the whole loop.
   *(Gate before publish wiring: the 30-min Metricool Cowork connector test.)*
3. **`shortform-talkinghead`** + **`shortform-carousel`** (both reuse the optimizer — "same pattern,
   different input").
4. Wire category posts to existing skills; add the **menu + balance tracker**.
5. **`shortform-analytics`** + `memory/performance.md` loop (publishing-layer spec §4).
6. Packaged as **Plugin 4** (`realtor-shortform-system`), its own plugin on the marketplace shelf —
   parallel to the YouTube System (Plugin 3), depends on Plugin 1 (the Brain). *(Corrects the earlier
   "subset inside realtor-ai-brain" note — the repo convention is numbered plugins.)*

---

## 9. QA sweep vs the v6 doc (2026-06-13) — slice 1

Audited every requirement in the doc (top workflow-mapping section + all body tables) against the built
skills. Findings + fixes:

- **CTA Mapper** (doc lists it as its own skill) → **folded into the optimizer** as the full CTA map in
  `platform-rules.md` (funnel roles + DM "BUYER"/"SELLER"/"RELOCATION", market report, neighbourhood
  guide), with DM-keyword/download CTAs routed to a **real lead magnet from `offer.md`**.
- **Platform Optimizer assets** (doc image 11) → optimizer now also outputs **cover/thumbnail text** and
  **on-screen text cues** for video formats (was missing). Captions/title/description/tags already present.
- **Brain consumption** (the "use ALL the Brain data, never re-ask" requirement) → both skills now read
  the full relevant identity set, adding **`offer.md`** (lead magnets) and **`voice-samples.md`** (real
  voice), and encode the first law: read the Brain, never re-ask; if a field is genuinely missing, ask
  once and write it back.
- **⚠️ Brain gap (flagged, not yet fixed):** the Brain has **no structured lead-magnets field**.
  `offer.md` carries offers/USP/proof but not the agent's list of downloadable guides that CTAs point to.
  The doc's Agent Project explicitly stores "Lead magnets → Helps Claude create CTAs." Interim: skills
  ask-once-and-persist. **Proper fix (next Plugin-1 patch):** add a "## Lead magnets" section to the
  `offer.md` template + a capture step in `realtor-offer-usp` setup, so it's in the Brain from onboarding.

Deferred (correctly, by design — not gaps): the **2-week planner / analytics / Co-Work digest** are later
phases (tracked in the build order). The 15/30/45-sec scripts + teleprompter variants are now BUILT in
the talking-head workflow (below).

---

## 10. Build status (2026-06-13) — Plugin 4 v0.2.0

**Built + validated (uncommitted):**
- ✅ `shortform-optimizer` (+ `platform-rules.md`: per-platform rules, full CTA map, video-asset rules)
- ✅ `shortform-greenscreen` (+ search-guide, hook-formulas, talking-points-guide)
- ✅ `shortform-talkinghead` (+ topic-guide [80/20], script-guide [15/30/45 + teleprompter + bullet])
- ✅ `shortform-carousel` (+ carousel-guide; spec-only, IG/FB)
- ✅ `shortform-setup` (onboarding — reads Brain, captures only the delta, connects posting)
- ✅ `shared/house-rules.md` (plain-talk tone standard + the laws + map-don't-design; every skill applies it)
- ✅ Brain (Plugin 1 v0.14.0): lead-magnets now captured in `offer.md` via `realtor-offer-usp`;
  `realtor-article-greenscreen` removed (superseded).

**Posting:** bring-your-own-platform — GoHighLevel (official MCP Social Planner, for agents who have it),
Metricool (default), Buffer (fallback), or manual. See `shortform-publishing-layer.md` §1 + §7.

**Still to build:** weekly menu/balance tracker; `shortform-analytics` + `memory/performance.md` loop;
publish wiring (after the Metricool Cowork test + a GHL PIT test); the small "personal story" helper;
wire category posts (home tour / just listed-sold → `listing-content-kit`; client story → `voice-proof`).
