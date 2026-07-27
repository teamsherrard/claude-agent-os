# Deck Spec — the presentation and the script are one package

*The canonical slide sequence, and the contract that keeps the deck and the script locked to each
other. `market-presentation` builds against this file; `market-script` builds against the Slide Map
that skill produces. Neither invents its own structure.*

---

## 1. The problem this solves

The agent records their market update by **sharing their screen and talking over a deck.** If the
deck has 14 slides and the script has 9 sections, the recording falls apart on camera — they're on
slide 6 reading section 4, and they stop and start over. The two are not two deliverables. They are
**one package: a deck, and the words that run on it.**

So: **one slide = one script beat, in the same order, with the same numbering.** Always.

---

## 2. The Slide Map — the lock

`market-presentation` runs first and produces the **Slide Map**: the final, numbered slide list for
this month, with every conditional slide already resolved in or out. It is the first section of the
presentation doc, and it looks like this:

```
SLIDE MAP — July 2026   ·   14 slides   ·   ~15 min

| # | Slide | Script beat | Time |
|---|---|---|---|
| 1 | Title — Calgary Market Update, July 2026 | Hook + intro | 0:00–1:00 |
| 2 | The headline — "More choice than buyers have had in two years" | Intro + primary CTA | 1:00–1:40 |
| 3 | The Market at a Glance | Section 1 opens | 1:40–3:00 |
…
```

**`market-script` must read this map and produce exactly one beat per slide, in order.** If the
script has a section the map doesn't have, or the map has a slide the script never reaches, the
build is wrong — fix it before delivering. This check is in both skills' checklists.

---

## 3. The canonical sequence (14 slides, 2 conditional)

| # | Slide | What's on it | Script beat |
|---|---|---|---|
| 1 | **Title** | "[City] Real Estate Market Update · [Month Year]" · agent name + brokerage · the data-period line in small type | Hook, then intro |
| 2 | **The headline** | The one-sentence story of the month, big. Nothing else | Intro + **primary CTA** |
| 3 | **The Market at a Glance** | All 8 headline stats as tiles with YoY arrows — the money slide | Section 1 opens |
| 4 | **Price** | The benchmark/average price, huge, with its YoY and one line of meaning | Section 1 |
| 5 | **Supply** | New listings · active inventory · months of supply, and the condition it implies | Section 1 |
| 6 | **Speed** | Days on market · sale-to-list ratio, and what that says about demand | Section 1 closes with the verdict |
| 7 | **If you're buying here** | 3 takeaways for local buyers + one concrete move | Section 2 |
| 8 | **If you're selling here** | 3 takeaways for local sellers + one concrete move | Section 3 |
| 9 | **If you're moving here** | 3 takeaways for relocators + one concrete move | Section 4 |
| 10 | **Property types** | Detached / condo / townhouse side by side, with the divergence called out | Section 5 |
| 11 | **Community spotlight** *(conditional)* | The agent's named communities + one line each | Section 6 |
| 12 | **[Niche slide]** *(conditional)* | Only if `identity/market.md` names a specific niche with real data (e.g. new-construction starts and incentives) | Section 5b |
| 13 | **Rates & what it actually costs** | The rate, the change, and the real monthly-payment examples | Section 7 |
| 14 | **My take + what I'd do** | The agent's 2–3 sentence read, then the three lenses' one move each | Outro opens |
| 15 | **CTA** | The real offer, booking link, handles, "send this to someone who needs it" | Outro + **secondary CTA** |

*(That's 15 with both conditionals in, 13 with both out. The Slide Map states the real number.)*

**Slides 3–6 are the doctrine's "3–4 stat slides."** Slide 3 shows everything at once so the viewer
gets the shape of the month; 4, 5, and 6 then go deep on one idea each. Don't merge them — the glance
slide is what the agent holds on while they set up the story, and the deep slides are what they talk
over.

### The conditional rules
- **Slide 11 drops** when the board doesn't publish community-level data. The script's Section 6
  drops with it, and that time goes to the buyer and seller beats.
- **Slide 12 only exists** when the agent has a named niche *and* there's real published data for it.
  Never add a niche slide with no numbers on it.
- **When a conditional drops, renumber the whole deck**, and the Slide Map carries the real numbers.
  The script uses the map's numbers, never this file's. That's the entire reason the map exists.

---

## 4. How every slide is designed

The deck is a **recording aid**, not a design portfolio piece. It gets watched inside a YouTube
player, often on a phone, at maybe a third of full size.

- **16:9**, 1920×1080.
- **One idea per slide.** If a slide needs a paragraph to explain itself, it's two slides.
- **Twenty words maximum** on any slide, headline included. Stat slides should be well under.
- **The number is the biggest thing on the slide** — big enough to read when the video is scaled to a
  phone. If a number needs small type to fit, something else on the slide has to go.
- **Every stat slide carries its meaning** in one short line (doctrine §3). A slide with a bare
  number on it is a slide the agent has to rescue with their voice.
- **Arrows show direction only** — never colour-coded good/bad. Inventory up is good news for a
  buyer and bad for a seller, and both are watching.
- **The source and data period** appear in small type on the title slide and on the glance slide.
- **No animation, no transitions, no build-ins.** The agent advances one slide at a time while
  talking. Anything that moves on its own will desync from the script.
- Brand colours and fonts from `identity/brand-visual.md`. Unset → say so and use near-black on
  off-white with a single accent.

---

## 5. Talking points live on the deck too

Every slide ships with **2–4 conversational talking-point lines** under it — what to say while that
slide is up, in the agent's voice.

This is deliberate redundancy, and it's the safety net: an agent who doesn't want to read a
teleprompter can open the deck, hit record, and talk from the points alone. The full word-for-word
script is the same content expanded — it never contradicts the points, it just writes them out.

---

## 6. What the deck feeds

Build it once, and it's the source for three other pieces — which is why it runs first:

| Piece | Takes from the deck |
|---|---|
| The script | The Slide Map, beat for beat |
| The email / distribution version | Slides 2, 3, 7, 8, 9, and 15 rewritten as prose |
| The 1:1 infographic | Slide 3's stats and slide 2's headline |
| The stat-graphic short | Slide 4, 5, or 6 — whichever number is most arresting |

If any of those state a number the deck doesn't, the build is wrong.
