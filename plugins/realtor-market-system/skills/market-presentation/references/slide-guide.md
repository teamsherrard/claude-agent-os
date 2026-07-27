# Slide Guide — what goes on each slide, and how the email version is built

The canonical sequence and numbering live in `${CLAUDE_PLUGIN_ROOT}/shared/deck-spec.md` §3. This
file is how each slide is *written*. Slides are named below, not numbered — the real deck uses the
**Slide Map's** numbers once conditionals are resolved.

---

## Who this is for

Buyers, sellers, and homeowners watching a YouTube video, often on a phone, often at half attention.
Not analysts. Not other agents.

**Always:** plain language · the number big · one line of meaning under it · the city named.
**Never:** board acronyms unexplained · a bare stat · a sentence that would be true in any city.

---

## Title

Clean and unremarkable — it's on screen for eight seconds while they say the hook.

- **[City] Real Estate Market Update · [Month Year]** (the *current* month, per doctrine §2)
- Agent name · brokerage
- Small type, bottom: *"Source: [Board], [data period]"* — the honesty line that lets the title carry
  the current month while the data covers the last complete one.

**Talking points:** the hook is said *over* this slide, not read off it. Point one is the number that
opens the video.

## The headline

One sentence, the biggest text in the deck, nothing else on it. This is the slide that tells someone
scrubbing the video whether to stay.

- Not "July Market Update." Something like *"More choice than buyers have had in two years."*
- ≤12 words.

**Talking points:** state the headline, give the one number behind it, then the **primary CTA** — the
offer and the booking link, one natural line, right here while attention is highest (doctrine §9).

## The Market at a Glance

The money slide. All 8 headline stats at once, so the viewer gets the shape of the month before the
detail. Tiles in a 4×2 grid; each tile: metric name small above · the number large · YoY with arrow
below.

Close it with the condition in words: *"[Month] in [City] is a [seller's / balanced / buyer's] market."*

**Talking points:** don't read all eight. Say the shape of the month, name the two that moved most,
promise the detail is coming. The urge to read every tile is what makes market updates boring.

## Price

The benchmark or average price, huge, with its YoY change and one line of meaning.

> *"$587,400 · ↑ 2.1% from last June — prices are firming, not spiking."*

**Talking points:** what the change means for someone deciding this month, and what it does *not*
mean. This is where "prices are crashing" gets corrected with a real number.

## Supply

New listings · active inventory · months of supply, and the condition they imply. Three numbers, one
story: is there more or less to choose from than there was?

**Talking points:** supply is the best predictor of what happens next and almost nobody covers it
well. This is where the agent sounds like the person who actually knows the market.

## Speed

Days on market · sale-to-list ratio. How fast homes go, and how close to asking.

**Talking points:** this is the slide sellers feel. Say what it means for their timeline honestly,
including when it's slower than they'd like.

Close the opening section here with the verdict line that sets up the three lenses.

## If you're buying here

Three takeaways plus one concrete move. Written *to* a buyer — "you," not "buyers."

> *"You're competing with fewer people than last year. Use it on conditions, not just price."*

**Talking points:** the position they'd take with someone who called this morning. No "it depends."

## If you're selling here

Three takeaways plus one concrete move, written to a seller. Honest, including the unwelcome part —
sellers hire the agent who told them the truth about pricing.

## If you're moving here

Three takeaways plus one concrete move for someone who doesn't know the city yet: what a budget
actually buys, which areas are moving, what surprises people arriving from somewhere pricier or
cheaper.

**This is the slide most agents don't have**, and it pulls the highest-intent out-of-town leads in
the whole deck. Give it a real slide, not a footnote.

## Property types

Detached | condo | townhouse, side by side: price, YoY, sales, days on market.

Then **call out the divergence** — the one place they're behaving differently. All three moving
together? Say so in a line and keep the slide short.

**Talking points:** lead with the divergence. It's the interesting part, and usually a short-form
hook too.

## Community spotlight *(conditional)*

Only the communities in `identity/market.md`, only with published data. Price plus one line each.

No data published? **The slide comes out, and the script's beat comes out with it** — never ship an
empty slide. Say on camera instead that a street-level read is a quick conversation away.

Fair housing applies hardest here: describe **the market**, never the residents.

## Niche slide *(conditional)*

Only when the agent has a named niche *and* real published data — new-construction starts and
incentives, luxury tier, whatever `market.md` says. Same rules: real numbers, one meaning line.

## Rates & what it actually costs

The rate, the change since last month and last year, and what the central bank signalled
(attributed, never predicted). Then the payment examples straight from the block:

`$[price] home | [X]% down | [X]% rate | ≈ $[monthly]/month`

Where the comparison lands, show the same home at last year's rate. Small type: approximate,
excludes taxes, insurance, and fees.

**This is the slide people screenshot.** Big numbers, small caveat, both present.

## My take + what I'd do

The agent's own read, 2–3 sentences, in their voice from `voice.md` and `voice-print.md`. Then the
three lenses' one move each, one line apiece.

**Talking points:** this is the least scripted moment in the video and the most human. The points
should prompt them, not put words in their mouth.

## CTA

The real offer, the booking link, the handles, and *"Know someone buying or selling in [City]? Send
them this."* Brokerage disclaimer and licence number live here.

**Talking points:** the **secondary CTA** (doctrine §9) — usually the recurring report, since the
viewer just watched its value — then the subscribe ask, then the end-card line.

---

## The email version

Not a summary of the deck — a standalone piece for someone who will never watch the video. Built from
the headline, glance, three-lens, and CTA slides.

- **Subject lines (3)** — lead with the number. *"Calgary homes are sitting a week longer"* beats
  *"July market update."*
- **Preview text** — ~90 characters, not a repeat of the subject.
- **Body** — the headline story · 4–5 stats in a scannable list · the three lenses in three short
  blocks · one line of the agent's take.
- **One CTA** — the recurring report, or the consult. Not both.
- **250–400 words.** Longer and it's the deck, not an email.
- Disclaimer and licence per `compliance.md`.

---

## Deck quality standards

- Every number traceable to the data block; sources listed at the end of the doc
- Every stat slide carries its meaning line
- ≤20 words per slide; the number is the largest element
- All three lenses get their own slide
- Slide count and numbering match the Slide Map exactly
- A recording aid first, a design piece second
