# Idea Method — Internal Rubric, Packaging & Voice

> INTERNAL ONLY. The agent never sees this rubric or the scores. They see ranked ideas + packages.

## The scoring rubric (rank candidates with this, silently)
Score each candidate 1–5 on six criteria, then weight:

| Criterion | Question | Weight |
|---|---|---|
| Demand | Are people actually searching this? | ×3 |
| Business value | Does it attract real buyers/sellers + tie to the offer? | ×3 |
| Competition gap | Can they realistically rank / is it underserved locally? | ×2 |
| Niche fit | Does it match their avatar + positioning? | ×2 |
| Timeliness | Seasonal or newsworthy right now? | ×1 |
| Hook | How strong is the title/hook? | ×1 |

Priority = D×3 + B×3 + G×2 + N×2 + T×1 + H×1 (max 60). Rank high → low. Show only the order.

## Packaging-first checklist (every idea)
- **Title:** specific, search-shaped, voice-matched. Use a proven formula (listicle / question / how-to /
  benefit), front-load the keyword, and lean long-tail for a small channel. See `${CLAUDE_PLUGIN_ROOT}/shared/seo-knowledge-base.md`.
- **Hook:** name the viewer's situation/fear in line one; promise the payoff in line two.
- **Thumbnail text:** 2–5 punchy on-screen words — a shortened, SEO-aware version of the title. Text only, no design.

## Voice-matched titles — good vs bad (example: a calm, consultative, never-salesy agent)
- ✅ "The New 5% GST Savings on Calgary New Builds — Who Actually Qualifies"
- ✅ "Buying and Selling at the Same Time — How to Avoid Two Mortgages"
- ❌ "You're LOSING $1000s on Your New Build!! (MUST WATCH)"  ← hype/clickbait = brand violation
- ❌ "INSANE Calgary Secret Realtors Don't Want You to Know"   ← gimmicky = brand violation
Earn the click with specificity + genuine value, calibrated to the agent's brand.

## Topic memory & coverage read (do this BEFORE generating — no tracker, read live)
Build topic memory each run by reading the agent's **Videos folders + their published channel**. Map:
- **Neighbourhoods/communities** covered vs. still on their list (from the Brain) → surface uncovered ones.
- **Pillars/categories** covered → keep the channel balanced; don't over-index one pillar.
- **Avatars/lead-types** served → make sure each ideal viewer is getting content.
- **Exact topics already made** → never propose a duplicate.

## Sourcing ideas
- Start from the Research Brief's "Signals for ideas" (timely, local, high-relevance).
- Pull from the template library in `${CLAUDE_PLUGIN_ROOT}/shared/idea-templates.md` (the Big 5 categories + proven title
  formulas) — fill every `[bracket]` with the agent's real market / communities / price points / niche.
- Always produce a **BLEND**: broad general/relocation/comparison ideas + niche-specific ideas tied to the
  agent's specialty (new construction, first-time buyers, mortgage if dually licensed, etc.). Both, every batch.
- Fill **coverage gaps** from the read above (underserved pillar, uncovered neighbourhood, neglected avatar).
- Each idea should map to an avatar question/fear OR a timely local signal — ideally both.
- Never repeat an already-made topic.

## Every idea must justify itself (THIS is the moat)
Never hand over a title without the **data-backed reason** it's a smart bet. This is the whole reason an
agent uses this system instead of ChatGPT — every idea is grounded in THEIR live market, THEIR niche, THEIR
channel, and what's actually trending in THEIR city. Generic AI can't do that.

Each idea's "Why this one" must cite at least one **real** signal — be specific, name the source/type:
- 📈 **Demand** — a search/trend signal (Google Trends rising, YouTube autocomplete shows people typing it,
  or it's a proven high-search format like "moving to [city]" / "cost of living" / comparisons).
- 🔥 **Timely** — a real, dated market event or news (rate change, new development, rule change, migration data).
- 👀 **Proven** — a competitor's similar video is overperforming (from the outlier scan).
- ❓ **Asked** — real questions people are asking (comments, "people also ask," forums).
- 💰 **Business** — directly attracts the agent's buyer/seller avatar (lead intent).
- 🗺️ **Gap** — fills an uncovered neighbourhood/pillar they can own.
Lead with the strongest real signal. **Honesty:** don't fabricate exact search volumes — if no keyword tool
is connected, justify with the proven format + the real trend/event/gap, and keep it truthful.

## Output rules
- Default 5 ideas (or however many they asked for), ranked. Mix timely with evergreen.
- GENERATE the full package per idea (Title · Hook · Thumbnail text — packaging-first), but PRESENT only
  two lines each: the title + one line of data-backed "why" + who it's for. The hook + thumbnail surface
  in Make This Video Step 1. Expand an idea only if the agent asks.
- No scores, no rubric, no pillar/cluster jargon in what the agent sees. Keep the whole list scannable.
- Always end with the handoff: pick one → new chat → "make this video."
