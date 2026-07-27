---
name: market-shorts
description: >
  Turns the month's numbers into three ready-to-film short-form videos, each a different format so the
  feed doesn't repeat itself — a GREEN SCREEN ARTICLE REACTION (the agent reacts to a real, verified
  article about this month's data), a TALKING-HEAD OPINION (their strongest take, chosen from what the
  data actually shows), and a STAT GRAPHIC (one number on screen with a voiceover, plus the design
  brief to build it). Each ships with a word-for-word hook, the script or talking points, on-screen
  text, and platform-ready captions for Instagram, Facebook, TikTok, and YouTube Shorts. Reads the
  month's data block — never researches the numbers again.

  Trigger on: "make my market shorts", "3 shorts from my market update", "short form from this
  month's data", "reels from my market update", "clip my market update", "market update shorts", or
  as step 3 of a full monthly run.
---

# Market Shorts

Three videos out of one month's research. Different formats, different audiences, different hooks —
so someone who watches all three gets a fuller picture than someone who watches one, and the agent's
feed never looks like the same post twice.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — interpret-don't-recap
(§3) and the 2-CTA thinking (§9), scaled down to one CTA per short.

**Read `references/concepts-guide.md`** — the three formats in full, hook formulas, and the variety rules.

**If the Short-Form System (Plugin 4) is installed**, these three slot into that system's formats
(green screen · talking head · graphic) and its optimizer owns platform packaging. Say so in one
line, hand the finished concepts over for scheduling, and don't rebuild what it already does.

---

## Step 1 — Load the numbers and the Brain
1. `~/realtor-brain/memory/market-data.md` — this month's block, including the **"what people are
   asking"** list. Not there? Hand to **Market Research** first. Never re-pull the stats here.
2. `~/realtor-brain/brain.md`, then `identity/voice.md` + `identity/voice-samples.md` (their real
   phrasing), `identity/profile.md` (city, handles, booking link), `identity/avatars.md` (who each
   short is aimed at), `identity/offer.md` (real lead magnets for the CTA),
   `identity/brand-visual.md` (colours and fonts for the stat graphic brief),
   `identity/content-engine.md` (which platforms to package for), `memory/content-log.md` (don't
   repeat last month's angles), `identity/compliance.md`.

---

## Concept 1 — Green screen article reaction

The agent holds a real article on their phone (or behind them on screen) and reacts to it with a
local expert's read. Timeliness is the whole point.

**Find the article.** Search for coverage published in the **last 0–7 days** about this month's board
release, the rate environment, or a local policy/development story tied to the data. **Fetch it and
verify it loads** — no paywall, no 404, no guessed URL. Check `content-log.md` so it isn't a repeat.

**Deliver:**
- Headline, source, publication date, **verified link** (the agent pulls this up on their phone)
- The one stat from the article to hold on screen
- **The hook** — one line, ≤12 words, word-for-word
- **4–6 talking points** to riff from, not a script — reaction content has to sound unscripted:
  what happened → what it means for a buyer/seller in [city] → the take → what they're telling
  clients → the CTA beat
- On-screen text cues
- Runtime target: 30–60 seconds

**The angle:** what the headline actually means *here*. Never a news recap — no "according to,"
no "experts say." The agent already knows this and is telling you.

## Concept 2 — Talking-head opinion

No background, no article. Just the agent and the camera. The most personal format and the one that
builds the strongest connection.

**Pick the angle from what this month's data actually shows** — not a generic take. Options in
`references/concepts-guide.md`: contrarian · before/after · myth-buster · prediction (labelled as
opinion) · community spotlight · direct advice. Choose the one this month's numbers genuinely
support, and say in one line why it fits.

**Deliver:** the chosen angle and why · a **word-for-word 30–60 second script** (this one is scripted,
because an opinion has to land tight) · riff notes for agents who prefer to ad lib · on-screen text
cues · runtime.

Best raw material: the divergence between property types, the one community behaving differently, or
the recurring worry from the block's "what people are asking" list.

## Concept 3 — Stat graphic

One number, big, on screen — the agent's voice over it, or straight to camera beside it. Built for
the scroll: it works with the sound off and rewards turning it on.

**Deliver:**
- **The number** — the single most arresting stat of the month, and why it's the one
- **The design brief** — paste-ready for claude.ai/design or Canva, 1080×1920 (9:16), brand colours
  and fonts from `brand-visual.md`: the number huge, the label under it, the comparison line, the
  agent's handle. Panel by panel, with the real values in it — never a summary
- **The hook** — word-for-word, ≤12 words, and it must not restate the number the graphic already
  shows. The graphic shows; the hook tells them why to care
- **Word-for-word 20–40 second voiceover** — the number, the comparison, what it means, one move
- On-screen text beats, timed
- If the month has a second strong number, note it as a swap so the agent can make two

---

## Phase 2 — Package for platforms

For each of the three, using the platforms in `identity/content-engine.md`:
- **Instagram + Facebook** — caption + hashtags (8–10, at least 2 local)
- **TikTok** — one-line caption + hashtags, **no line breaks**
- **YouTube Shorts** — search-led title with the city, description, tags, `#Shorts`
- **One CTA each**, matched to the format — soft for the reaction, the lead magnet or consult for
  the opinion and the graphic. Every lead-magnet CTA points at something real from `offer.md`.

## Phase 3 — Variety check (run before delivering)
- All three hooks use different formulas — no two open the same way
- All three aim at different viewers (buyer / seller / general local or relocating)
- No two lead with the same stat
- All three captions open differently
- Together they tell a fuller story of the month than any one of them alone

## Phase 4 — Compliance, save, log
Run every caption and script through `identity/compliance.md` — disclaimer and licence where the
display rule applies, nothing on the claims-to-avoid list, no forecast as fact, fair housing on
anything about a community. Empty? Proceed and flag once.

Save into the month folder as `Short-Form Pack — [Month Year]`
(`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`). Append **three rows** to
`memory/content-log.md` — one per concept, with its angle, status `Scripted` — then **push the Brain
to Drive**.

## Quality checklist
- [ ] Every stat came from the data block; nothing re-researched except the article.
- [ ] Concept 1's article is 0–7 days old, fetched and verified, and not a repeat.
- [ ] Concept 1 is talking points, not a script; Concepts 2 and 3 are word-for-word.
- [ ] Concept 2's angle is specific to this month's numbers, with the reason stated.
- [ ] Concept 3's design brief has real values, 9:16, brand colours — not a summary.
- [ ] Concept 3's hook doesn't just read out the number already on screen.
- [ ] Every hook is one line, ≤12 words, word-for-word.
- [ ] Every concept interprets — no bare stat read-outs, no news-anchor language.
- [ ] City named in all three; one CTA each, pointing at something real.
- [ ] Variety check passed on hooks, audiences, stats, and captions.
- [ ] Platform blocks complete; TikTok caption is a single line.
- [ ] Compliance done; three rows logged; Brain pushed.
