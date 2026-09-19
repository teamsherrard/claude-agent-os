---
name: market-script
description: >
  Writes the word-for-word YouTube market update script — the words that run on this month's
  presentation. **Optional, and built on request:** the deck already ships with talking points under
  every slide and records on its own, so this is the safety net for agents who want exact words
  rather than the default deliverable. It reads the deck's Slide Map and writes exactly one beat per slide, in order, with
  [SLIDE N] cues, so the agent reads, advances one slide, and never has to think about what comes
  next. The deck and the script are one package; this half is written against the other. Teleprompter
  -ready, in the agent's own voice, with camera direction, section timings, the 2-CTA model, and the
  three audience lenses. Ships with title options, thumbnail text, the hook, and a description opening
  so the video is ready to publish, not just ready to film. Reads the month's data block — never
  researches.

  Trigger on: "write the script", "give me the words", "write my market update script", "my YouTube script for [month]", "script my market
  video", "the market update video script", "write the script for my market report", or as step 2 of
  a full monthly run.
---

# Market Update Script

The agent opens the deck, starts recording, shares their screen, and reads. That's the whole promise.
Everything they need to say is written, in their words, in the exact order the slides are already in.

**You are writing the second half of one package.** The presentation is the first half, and it
already decided the structure. Your job is the words that run on it — not a different shape.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the deck spec** (`${CLAUDE_PLUGIN_ROOT}/shared/deck-spec.md`) — §2, the Slide Map contract,
governs this skill. One slide, one beat, same order, same numbering.
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — interpret-don't-recap
(§3), the three lenses (§4), the 2-CTA model (§9), the eight common mistakes (§10).

**Read `references/script-guide.md`** — the section-by-section formula, formatting conventions, and
the quality rules.

**If the Realtor YouTube System (Plugin 3) is installed**, hand the finished script to its
`youtube-seo` for the full SEO package and `youtube-leads` for the lead magnet — this skill produces
the script plus a basic publish kit, not a full SEO build. Say so in one line; don't duplicate it.

---

## Step 1 — Load the Slide Map, the numbers, and the Brain
1. **The month's `Presentation — [Month Year]`, and specifically its Slide Map** (the numbered table
   at the top). This is your outline — you don't get to write a different one. Not built yet? Hand to
   **Market Presentation** first and come back; the script cannot be written before the deck exists.
2. `~/realtor-brain/memory/market-data.md` — this month's block. Never search here.
3. `~/realtor-brain/brain.md`, then:
   - `identity/voice-print.md` — **the SPOKEN voice DNA, and the most important file here.** This
     script gets read out loud, so it's written from how they *talk*, not how they type: their
     pacing, sentence length, signature phrases, filler, the words they'd never say. Brain law 4
     makes this mandatory for read-aloud output. `identity/voice.md` sets the tone rules and
     `identity/voice-samples.md` (how they *write*) is the fallback only if voice-print is empty.
   - `identity/story-bank.md` — per Brain law 4, check for a real story matching this month's theme
     and weave one short **anonymized** version into the open or the close, then stamp its
     *Used-where* so stories rotate. Never fabricate one; empty file → just proceed.
   - `identity/profile.md` — name, city, booking link, brokerage.
   - `identity/offer.md` — the real offer and lead magnet behind both CTAs.
   - `memory/content-log.md` — what they covered last month, so the take is fresh.
   - `identity/compliance.md` — read before finalizing.

---

## Phase 1 — Write one beat per slide

**Walk the Slide Map top to bottom and write a beat for every slide — no more, no fewer.** The map
gives you the slide number, the beat it carries, and its running time. That's the outline. Follow
`references/script-guide.md` for how each beat is written.

Target **15 minutes** — roughly 1,950 words at 130 words per minute. 13–17 minutes is fine. The map's
running times tell you how to spend the budget; if a beat wants more room, take it from property
types or communities, never from the interpretation.

Every beat opens with its cue on its own line:

```
[SLIDE 7 — If you're buying here]   (2–3 min)
```

Then the words. The agent's eye goes to the cue, their hand advances the slide, and they keep reading.

Non-negotiables while writing:
- **One beat per slide, in the map's order, using the map's numbers.** If a conditional slide was
  dropped from the deck, its beat does not exist in the script.
- **Never invent a slide.** If a beat seems to need a visual the deck doesn't have, that's a note
  back to the presentation, not a `[SLIDE 12]` cue for a slide that isn't there.
- **Say what's on screen, don't read what's on screen.** The slide shows the number; the script says
  what it means. If a line just recites the slide, cut it.
- **Word-for-word.** Every line is speakable as written. Read it aloud in your head — if it sounds
  like a document, rewrite it as speech.
- **Every number matches the data block exactly.** No rounding "for flow."
- **Every stat is followed by its meaning** (doctrine §3). A number said aloud with no interpretation
  is the single most common failure in this format.
- **Both CTAs present** — primary right after the hook, secondary in the outro (doctrine §9).
- **The city by name at least once per beat.** Never "locally," never "in our market."
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
- **Chapter timestamps** — matched to the beats, using the Slide Map's running times.
- **Suggested next video** for the end card (usually last month's update).

## Phase 3 — The alignment check (run it, don't assume it)

Before anything is delivered, put the Slide Map and the script side by side and confirm:

1. **Count** — the number of `[SLIDE N]` cues equals the number of slides in the map. Exactly.
2. **Order** — the cues run 1, 2, 3… with nothing skipped and nothing out of sequence.
3. **Titles** — each cue's slide title matches the map's title for that number.
4. **Dropped conditionals** — a slide that isn't in the deck has no beat in the script.
5. **Numbers** — any figure spoken in a beat matches the figure on that slide.

If any of these fail, **fix the script to match the deck** — the deck is the structure, and it was
built first for exactly this reason. The only time the deck changes is if the script surfaces a beat
that genuinely needs a slide; then say so plainly and hand back to **Market Presentation** to add it
and re-issue the map. Never patch it by inventing a cue.

Then close the script with the one-line contract so the agent sees it too:

> *"[N] slides, [N] beats — advance one slide each time you see a cue."*

## Phase 4 — Compliance pass
Run the script and the description through `identity/compliance.md`. Append the disclaimer and
licence number where the display rule applies; strip anything on the claims-to-avoid list; check that
no prediction is phrased as fact and nothing about a community reads as who lives there. If
`compliance.md` is empty, proceed and flag it once.

## Phase 5 — Save + log
Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: save into the month folder as
`YouTube Script — [Month Year]`, with each spoken line on its own line and every `[SLIDE N — title]`
cue on its own line so it's readable off a teleprompter. Open the doc with the Slide Map it was
written against, so the deck and the script travel together as one package.

Append one row to `~/realtor-brain/memory/content-log.md` (YouTube · Long-form · the month's angle ·
status `Scripted`), then **push the Brain to Drive**.

One line to close: *"Script's ready — want the three shorts pulled from it?"*

## Quality checklist
- [ ] Every figure came from the data block; nothing researched here; no rounding for flow.
- [ ] Opens on a number, not a greeting.
- [ ] Written against the deck's Slide Map — one beat per slide, no invented slides.
- [ ] Alignment check run: cue count, order, titles, dropped conditionals, and numbers all match.
- [ ] All three lenses have their own beat — buyers, sellers, relocating in.
- [ ] Every stat followed by what it means; no bare read-outs anywhere.
- [ ] A clear position taken in the buyer and seller sections — no "it depends."
- [ ] Both CTAs present, in the right places, pointing at a real offer.
- [ ] City named by name at least once per beat.
- [ ] Data period said aloud once, early.
- [ ] Written from `voice-print.md` (spoken voice), not `voice-samples.md` (written voice).
- [ ] Story bank checked; any story used is real, anonymized, and stamped Used-where.
- [ ] 1,700–2,100 words.
- [ ] Publish kit complete: titles, thumbnail text, hook, description opening, chapters, next video.
- [ ] Script says what the slides mean — never just recites what's already on them.
- [ ] Compliance pass done; logged to `content-log.md`; Brain pushed.
