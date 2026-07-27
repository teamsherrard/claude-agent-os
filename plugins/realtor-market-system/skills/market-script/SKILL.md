---
name: market-script
description: >
  Writes the word-for-word YouTube market update script, built around this month's exact numbers and
  timed to walk through the market report page by page — so the agent reads, advances the slide, and
  never has to think about what comes next. Teleprompter-ready, in the agent's own voice, with screen
  cues, camera direction, section timings, the 2-CTA model, and the three audience lenses. Ships with
  title options, thumbnail text, the hook, and a description opening so the video is ready to publish,
  not just ready to film. Reads the month's data block — never researches.

  Trigger on: "write my market update script", "my YouTube script for [month]", "script my market
  video", "the market update video script", "write the script for my market report", or as step 2 of
  a full monthly run.
---

# Market Update Script

The agent opens the report, starts recording, and reads. That's the whole promise. Everything they
need to say is on the page, in their words, in the order the report is already in.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — interpret-don't-recap
(§3), the three lenses (§4), the 2-CTA model (§9), the eight common mistakes (§10).

**Read `references/script-guide.md`** — the section-by-section formula, formatting conventions, and
the quality rules.

**If the Realtor YouTube System (Plugin 3) is installed**, hand the finished script to its
`youtube-seo` for the full SEO package and `youtube-leads` for the lead magnet — this skill produces
the script plus a basic publish kit, not a full SEO build. Say so in one line; don't duplicate it.

---

## Step 1 — Load the numbers, the report, and the Brain
1. `~/realtor-brain/memory/market-data.md` — this month's block. Not there? Hand to **Market
   Research** first. Never search here.
2. The month's **market report**, so every `[SCREEN: advance to page X]` cue points at a page that
   actually exists. Not built yet? Hand to **Market Report** first — the script is written against it.
3. `~/realtor-brain/brain.md`, then:
   - `identity/voice.md` + `identity/voice-samples.md` — **this is the difference between a script
     they'll read and one they'll rewrite.** Match their real phrasing, their sentence length, their
     signature lines. Never write in generic-realtor voice.
   - `identity/profile.md` — name, city, booking link, brokerage.
   - `identity/offer.md` — the real offer and lead magnet behind both CTAs.
   - `memory/content-log.md` — what they covered last month, so the take is fresh.
   - `identity/compliance.md` — read before finalizing.

---

## Phase 1 — Write the script

Target **15 minutes** — roughly 1,950 words at 130 words per minute. 13–17 minutes is fine. Follow
the section formula in `references/script-guide.md`:

| Section | Time | What it does |
|---|---|---|
| **Intro** | 60–90s | Opens on the single most striking number of the month. Never "hey guys, welcome back." Then who they are, what this video is, and the **primary CTA** |
| **1 — At a glance** | 2–3 min | Walks page 2 stat by stat: the number, the comparison, one line on what it means |
| **2 — For buyers** | 2–3 min | Straight to local buyers. A clear position, not "it depends" |
| **3 — For sellers** | 2–3 min | Straight to local sellers. Honest, including what they don't want to hear |
| **4 — Moving here** | 1–2 min | The relocation lens — what a budget buys, which areas are moving, what surprises newcomers |
| **5 — Property types** | 2 min | The divergence between detached, condo, townhouse |
| **6 — Communities** | 1–2 min | Quick hits on their named communities. Skip if no data, and give the time to buyers/sellers |
| **7 — Rates & real cost** | 1–2 min | The monthly payment numbers said out loud |
| **Outro** | 60–90s | Three takeaways, the **secondary CTA**, subscribe ask, end-card direction |

Non-negotiables while writing:
- **Word-for-word.** Every line is speakable as written. Read it aloud in your head — if it sounds
  like a document, rewrite it as speech.
- **Every number matches the data block exactly.** No rounding "for flow."
- **Every stat is followed by its meaning** (doctrine §3). A number said aloud with no interpretation
  is the single most common failure in this format.
- **Both CTAs present** — primary right after the hook, secondary in the outro (doctrine §9).
- **The city by name at least once per section.** Never "locally," never "in our market."
- Say the data period out loud once, early: *"these are the numbers that just closed out June."*
- No forecast stated as fact. Opinions are labelled as opinion: *"here's what I think happens next."*

## Phase 2 — The publish kit

So the video is ready to go up, not just ready to film:

- **3 title options** — city + the month in the title + a clear payoff. Search-led, not clever.
- **Thumbnail text** — 3–5 words, plus a one-line note on the shot (talking-head market update:
  headshot roughly a third of the frame, clear expression).
- **The hook**, isolated — the first two lines, so they can rehearse them.
- **Description opening** — the CTA and booking link first, then two lines on what the video covers,
  then the data source and period.
- **Chapter timestamps** — matched to the sections above.
- **Suggested next video** for the end card (usually last month's update).

## Phase 3 — Compliance pass
Run the script and the description through `identity/compliance.md`. Append the disclaimer and
licence number where the display rule applies; strip anything on the claims-to-avoid list; check that
no prediction is phrased as fact and nothing about a community reads as who lives there. If
`compliance.md` is empty, proceed and flag it once.

## Phase 4 — Save + log
Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: save into the month folder as
`YouTube Script — [Month Year]`, with each spoken line on its own line and every `[SCREEN: …]` cue on
its own line so it's readable off a teleprompter.

Append one row to `~/realtor-brain/memory/content-log.md` (YouTube · Long-form · the month's angle ·
status `Scripted`), then **push the Brain to Drive**.

One line to close: *"Script's ready — want the three shorts pulled from it?"*

## Quality checklist
- [ ] Every figure came from the data block; nothing researched here; no rounding for flow.
- [ ] Opens on a number, not a greeting.
- [ ] Every `[SCREEN: advance to page X]` cue points at a real page in this month's report.
- [ ] All four audience sections present — buyers, sellers, relocating in, plus property types.
- [ ] Every stat followed by what it means; no bare read-outs anywhere.
- [ ] A clear position taken in the buyer and seller sections — no "it depends."
- [ ] Both CTAs present, in the right places, pointing at a real offer.
- [ ] City named by name at least once per section.
- [ ] Data period said aloud once, early.
- [ ] Sounds like the agent — checked against `voice-samples.md`, not generic realtor voice.
- [ ] 1,700–2,100 words.
- [ ] Publish kit complete: titles, thumbnail text, hook, description opening, chapters, next video.
- [ ] Compliance pass done; logged to `content-log.md`; Brain pushed.
