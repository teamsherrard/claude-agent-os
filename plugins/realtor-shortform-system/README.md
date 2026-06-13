# Realtor Short-Form System

An ongoing **short-form content operating system** for real estate agents — the short-form sibling to
the YouTube System. Where YouTube is project-based (research → outline → script → publish), short-form
is **routine-based**: a daily reactive post, batched value content, and a feedback loop that improves
every cycle.

It handles everything *around* the camera and the design tool — what to post, the hook, the talking
points or script, and the platform-specific captions and metadata. **It is text only: it never films,
edits, or designs.** Visuals (green-screen backgrounds, carousel slides) are described in words for the
agent to build in claude.ai/design.

Requires **Plugin 1 (the Realtor AI Brain)** set up first — every skill reads the agent's identity,
market, voice, and compliance from the shared Brain.

---

## How it's organized — the agent thinks in FORMATS

Agents batch by format (film all talking heads in one session; make carousels in another). So the
system is organized the way they actually work. Three production workflows:

1. **Daily Green Screen** (`shortform-greenscreen`) — reactive, once a day. Finds the single most
   timely local article and delivers a hook + talking points (not a script) + per-platform captions.
   *Never batched — timeliness is what makes green screen perform.*
2. **Talking Head** (`shortform-talkinghead`) — batched value content; a topic list on the 80/20 rule
   (80% broad reach, 20% niche) → scripts (15/30/45s, teleprompter + bullet) → per-platform optimization.
3. **Carousel** (`shortform-carousel`) — batched; value → lead-magnet / "share with a friend";
   **spec only** (cover + slide copy + design direction in words), the agent builds the slides in
   claude.ai/design.

Every workflow ends by calling the shared **Platform Optimizer** (`shortform-optimizer`) — the single
source of truth for how a post is packaged for Instagram + Facebook, TikTok, and YouTube Shorts.

**The agent only thinks in formats.** Behind the scenes Claude keeps the **4-3-2-1 funnel balance**
(awareness / trust / authority / conversion) and the **80/20 reach split** (broad / niche) correct by
choosing topics, angles, and CTAs — so the content stays balanced without the agent managing a plan.

New agents run **`shortform-setup`** once — it reads the Brain, asks only the few short-form-specific
things (which platforms, how often, how they'll post), and gets them to their first post.

---

## Posting: bring your own platform

The agent records, approves, and posts. They can copy-paste each post, or connect a tool so Claude
schedules for them — **no one is forced onto a new platform:**
- **Already use GoHighLevel?** Post straight through its Social Planner (GHL's official MCP).
- **Don't have one?** Metricool is the easy default (free to start); Buffer also works.
- **Prefer manual?** Fine — Claude hands over copy-paste-ready posts.

(Posting + the 2-week analytics loop are wired in a later release; see `docs/shortform-publishing-layer.md`.)

---

## Skills in this plugin

| Skill | What it does |
|---|---|
| `shortform-setup` | One-time onboarding — reads the Brain, captures only short-form specifics, connects posting, gets them to their first post. |
| `shortform-greenscreen` | Daily reactive post: one timely article → hook + talking points + on-screen text + per-platform captions. |
| `shortform-talkinghead` | Batched value videos: 80/20 topic list → scripts (15/30/45s, teleprompter + bullet) → per-platform packaging. |
| `shortform-carousel` | No-film value posts: cover + 6–9 slides of copy + design direction (words) + IG/FB caption. **Spec only.** |
| `shortform-optimizer` | Shared engine: one post → IG+FB, TikTok, YouTube Shorts packaging (captions, hashtags, titles, tags, cover/on-screen text) + the CTA map. Every workflow calls it. |
| `shortform-publish` | Schedules/posts through the connected tool — "schedule this for tomorrow at 10am," "post these at my best times." Confirms first, never auto-posts. |
| `shortform-analytics` | The data brain — "analyze my last 10 posts / my ads / my data," plus the 2-week review that records what worked to the Brain so the next round improves. |

Coming next: the light weekly menu/balance tracker (which ties the formats together and reads
`memory/performance.md` to keep improving).

---

## The laws (inherited from the Brain)

1. **READ the Brain first** (`~/realtor-brain/brain.md`) — never ask what the Brain already knows.
2. **WRITE back** — every post is logged to `memory/content-log.md`, then pushed to Drive.
3. **STAY COMPLIANT** — read `identity/compliance.md`, append the disclaimer + license #, avoid the listed claims.

And the plugin's own standard: **talk to the agent plain and warm, never technical** (`shared/house-rules.md`).
**We map, we never design** — words and direction only; claude.ai/design renders.
