# Metrics Guide — reading short-form data like a coach

The job isn't to report numbers — it's to tell the agent what's working, what isn't, and *why*, then what
to do. This guide is how you turn raw metrics into that.

## What each metric actually tells you

| Metric | What it really means | If it's low… |
|---|---|---|
| **Views / reach** | Did the algorithm push it out? Mostly driven by the **hook + first 3 seconds**. | Weak or slow hook; topic too narrow; posted at a dead time. Fix the hook first. |
| **Watch time / retention / avg view %** | Did people *stay*? The truest quality signal. | Slow middle, no payoff, too long. Tighten; one idea per video. |
| **Reel avg watch time** *(live connection only)* | Seconds actually watched. Read it **against the video's length** — 18s watched on a 30s reel (60%) is strong; 18s on a 60s reel (30%) is weak. | Middle sags or it runs too long for the payoff. Cut to one idea; front-load the value. |
| **Reel skip rate** *(live connection only)* | % who swiped away fast — **the cleanest hook verdict there is.** High skip = the first 3 seconds didn't earn the next 3. | The **hook**. Rewrite the open: bolder first line, no throat-clearing, no slow logo intro. |
| **Saves** | "This is useful, I'll come back." Gold for realtors. | Not actionable/valuable enough. Make it more practical (carousels, checklists, how-tos). |
| **Shares / sends** | "This is relevant to someone I know." Drives reach. | Not relatable or local enough. Add the "send this to someone who's moving" angle. |
| **Comments** | Engagement + algorithm fuel. | No question/hook to react to. End with a question. |
| **Profile visits** | They were interested enough to check the agent out. | Content didn't make them curious about *who* this is. |
| **Follows** | Audience growth — the long game. | One-off value with no reason to come back. Build a series. |
| **DMs / link clicks / "keyword" replies** | **Leads** — the business outcome. | Weak or missing CTA; CTA not tied to a real lead magnet. |
| **Ads: spend / results / cost-per-result / CTR** | Is paid money working? | High cost-per-result = weak creative or wrong audience. Low CTR = weak hook/offer. |

## How to diagnose *why* a post under- or over-performed
Walk the funnel in order — the first weak link is usually the cause:
1. **Low views?** → it's the **hook** (or timing/topic), almost always. Nothing downstream matters if no one sees it.
2. **Good views, low watch time?** → the **middle** lost them (slow, no payoff, too long).
3. **Good watch time, no saves/shares?** → not **useful or relatable** enough.
4. **Good engagement, no DMs/leads?** → the **CTA** is weak or missing (or not tied to a lead magnet).

Name the specific weak link in plain words — that's the insight a dashboard can't give.

**When you have the reel-retention numbers (live connection), you can settle hook-vs-middle exactly** instead
of guessing from views alone:
- **High skip rate** → it's the **hook**. Even great content dies if the first 3 seconds don't hold. Rewrite
  the open (bolder first line, cut the intro).
- **Low skip rate but low avg-watch-time-vs-length** → the hook worked, the **middle** sagged. Tighten to one
  idea; get to the payoff faster.
- **Good watch time, low saves/shares** → the content held but wasn't **useful/relatable** enough to pass on.
This is the exact edge Metricool can't give you — use it whenever the live connection is on.

**Demographics (live connection):** if `follower_demographics` / `reached_audience_demographics` show the
audience is mostly **other agents or out-of-market**, that's the "agent-bait" trap — steer toward green screen
+ local lifestyle to pull in real local buyers/sellers (Mike's frameworks §4). If the top cities match the
agent's market, say so — it's proof the local strategy is working.

## Turn it into advice (always)
Every analysis ends with: **what's working → do more of it**, and **the one weak link → here's the fix.**
Tie it to their actual content and offer to act:
- "Your timely green screens are your reach engine — 2–3× your average. Let's keep one going daily."
- "Carousels are getting saved but not driving DMs — add a 'DM me BUYER for the guide' CTA. Want me to redo your last one with that?"
- "Your best hook was the contrarian one ('everyone thinks now's a bad time…') — let's use that style more."

## The 2-week performance review (structure)
Pull ~2 weeks, join to `content-log.md`, then report:

| Review item | What to surface |
|---|---|
| **Best post** | What it was (format + topic + hook) and why it won |
| **Weakest post** | What missed, and the likely weak link (hook/middle/value/CTA) |
| **Best content category** | Reach / value / trust / conversion (Mike's 4-3-2-1) — where they're winning |
| **Best format** | Green screen / talking head / carousel |
| **Best hook** | The hook style that's landing |
| **CTA performance** | What actually drove DMs / clicks / leads |
| **Make more of** | The 2–3 things to repeat next cycle |
| **Posts to remake** | Winners worth doing again in a fresh way |

Then write a dated block to `~/realtor-brain/memory/performance.md`:
```
## [date range]
- Best: [format/topic/hook] — [why]
- Best category: [..] · Best format: [..] · Best hook: [..]
- CTA: [what drove leads]
- Do more of: [..] · Remake: [..]
- One thing for next cycle: [..]
```
Push to Drive. The content workflows read the latest block so next cycle leans on what worked.

## Honesty rules
- Two weeks is often thin — call out small samples; don't over-read a single spike.
- Never invent or estimate a number. If the data isn't there, say so and ask for a screenshot.
- A bad week isn't a failure — it's data. Keep them encouraged and consistent.
