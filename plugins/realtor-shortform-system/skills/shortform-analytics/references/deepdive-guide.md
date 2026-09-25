# Short-Form Deep Dive — the full breakdown (structure + method)

The most thorough read the system does: the agent's **entire** short-form presence, the other agents in
their market, where they show up when people search, the openings, and a 30-day plan — once a month.
Interpret everything with `metrics-guide.md` + `mike-frameworks.md`; pull everything from
`composio-data-engine.md` §7 (the full Instagram map), recipes 2, 3 and 7, and recipe S for YouTube Shorts
retention. **READ-ONLY** — never call a write / DM-send / comment / reply tool. Rendered on the **Deep Dive
Report shape** in `shared/output-standard.md` §5b — stamped.

## Who reads this — and the plain-language rules (non-negotiable)
The reader is a real estate agent, not a marketer. Cohort feedback, verbatim: *"it's just so much
information that I have no idea what I'm looking at."* So:
1. **Every finding is the same four lines:** *What we found · Why it matters to you · Do this · The proof.*
   "Do this" is the exact post, hook, or change — nothing the agent has to translate.
2. **Every section opens with `In plain English:`** — one sentence a friend would say across a table.
3. **Numbers live in tables and dotted rows, not sentences.** A sentence carries at most two numbers.
4. **Explain every metric the first time it appears**, in the same line: *"skip rate — who swiped away in the
   first 3 seconds."* Plain names are in `metrics-guide.md`; use them.
5. **No marketing words without the plain phrase next to them:** "the ask" not "CTA"; "where views stop
   turning into messages" not "the funnel"; "people who saw at least one post" not "reach" on first use.
6. **Why = outcome words** (messages, calls, clients), never metric words.
7. **Short on purpose:** 3–5 openings, 3 strengths, 3 fixes; long tables go to the APPENDIX; page one alone
   tells a busy agent what to do.
8. **Detailed where it counts:** every "Do this" is exact; every "proof" carries a real number and its source.

## Window and data ladder
**Window:** the last 90 days by default; honour a window the agent names. State it in one line.
**Sources, best-first, never blocked:** the live connection (§7 — Instagram in full, YouTube counts) →
Metricool (ads, best-time as a second opinion) → GoHighLevel statistics → screenshots. Say exactly what you
had under **WHAT'S IN THIS REPORT**. Never invent a number the source didn't return.

---

## Page one — READ THIS FIRST
- **The verdict** — three plain sentences: where they stand · the biggest strength · the biggest fix.
- **THE ONE MOVE** — exactly one action (never two joined by "and"): the cheapest, fastest, most measurable
  change, visible within two weeks. Repeated word for word at the end of Part 5.
- **DO THESE THREE THIS WEEK** — three specific actions from the fixes and openings.
- **YOUR NUMBERS AT A GLANCE** with the plain meaning in each note; then **WHAT'S IN THIS REPORT**.

## Part 1 — Your account (method per section)
- **1.1 How you grew** — followers now vs the count stored last time (`performance.md`); follows and
  unfollows (`follows_and_unfollows`); reach and profile visits vs the previous window (pull it too). First
  dive = baseline; say so.
- **1.2 What's pulling — by format and by job** — every post tagged by format (green screen / talking head /
  carousel) and job (reach / value / trust / convert) from `content-log.md`; typical reach, saves and skip
  rate per group; the actual mix vs 4-3-2-1 → what to rebalance. End on *Keep doing / Rethink*.
- **1.3 Your best hooks** — group reel hooks by style (question / bold claim / contrarian / list / story);
  read `reels_skip_rate` and `ig_reels_avg_watch_time` vs length per group; quote the 3 best hooks word for
  word with their skip rate, and the weakest opening. Hook vs middle per the metrics guide.
- **1.4 Who's watching** — the three audiences (followers / reached / engaged) by city, age, gender. The
  decisive question in plain words: **locals vs other agents vs out-of-market.** Agent-heavy = the agent-bait
  trap (mike-frameworks §4) → steer to green screen + local lifestyle.
- **1.5 When to post** — `online_followers` for the last 7 days (hourly, UTC → convert to the agent's
  timezone) → the 3 best slots. Their own audience, not a generic chart. Metricool best-time = second
  opinion if connected.
- **1.6 What turns into leads** — website taps, profile-link taps (call/text/email/address), profile
  actions per post (`profile_activity` with the action breakdown — which posts made people tap), DMs
  started (if the messages permission is on; else "not connected yet"). Never invent a lead count.
- **1.7 Stories** — only what's live today via the API (24 h); a month of stories = the agent's screenshots
  of their story insights. Say which.
- **1.8 What viewers are saying** — comments on the top posts: leads (buyer/seller intent — answer today),
  repeated questions (→ next posts, counted), unanswered comments.
- **1.9 Where views stop turning into DMs** — walk the path in plain words (see it → watch → visit the
  profile → follow → message) and name the ONE place it breaks with the fix.
- **1.10 How often you post** — posts/week vs Mike's 3 minimum and the daily goal; stories per week; gaps.

## Part 2 — The other agents in your market
3–5 from `identity/strategy.md` + `identity/market.md` (ask once if thin). **YouTube = a full pull** (recipe
2: standout videos as a multiple of their own normal; small local channels count double). **Instagram and
TikTok = a look at their public profile** (the agent opens it or drops screenshots; the connection cannot
read other people's accounts — say so plainly; never call it their analytics). Rows labelled by source.
Then *What they do that you don't* (move → why → how you'd do it), *What you do better*, *Where you sit*.
Never an empty row; cap at 5.

## Part 3 — Where you show up when people search
Recipe 7, short-form flavour: **3.1 On YouTube** (the market's local phrases — Shorts and long-form rank
here) · **3.2 When they ask an AI assistant** (buyer/seller questions → in the answer or citations? who is?
→ the one profile/page fix) · **3.3 What's rising** (direction of local phrases + this week's news hooks →
green-screen posts). Say "an AI answer engine", never a brand.

## Part 4 — The openings
Recipe 3 logic + the format read: 3–5 four-line cards (*What we found · Why it matters to you · Do this —
the exact hook/topic, format, job, week · The proof*). Formats competitors win with that the agent hasn't
used are openings too. The under-posted job in 4-3-2-1 belongs in Part 5's FIX list.

## Part 5 — Your next 30 days
- **Keep doing** — 3 strengths with the proving number. **Fix** — 3 fixes: what's wrong · why it costs you ·
  do this.
- **The plan (4-3-2-1)** — a concrete post list, one per row (hook/topic · format · job · week), seeded from
  the winning hooks/formats + the openings, ready for `shortform-greenscreen` / `shortform-talkinghead` /
  `shortform-carousel`; **Post at:** the 3 slots from 1.5; **Total output:** posts/week + stories vs Mike's
  minimum and goal. Offer to build the first 4 pieces now.
- **THE ONE MOVE** — repeated word for word.

## Appendix — the full numbers
Every post in the window (reach · saves · shares · skip % · profile actions) · the three audience tables ·
the search results pulled. Long tables live here, never in the body.

## Honesty rules (non-negotiable)
- Every number is real and cited ("your Instagram, pulled today"); **empty results = "not available", never
  guessed.**
- Competitor Instagram/TikTok depth is a glance — state it; never dress public engagement up as analytics.
- Compare to the agent's **own** baseline and the **named** competitors — never to invented benchmarks.
- Account gates apply (Business/Creator; ≥1,000 followers for per-post numbers; YouTube = counts, not
  watch-time). If a gate blocks something, say so and press on with what's available.
- Read-only always: nothing is ever posted, replied to, or sent.
