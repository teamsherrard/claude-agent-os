---
name: shortform-scripts
description: >
  The Short-Form Script Pack — turns picked ideas into ready-to-film videos: the hook written three ways, the
  word-for-word 30–60 second script with its word count, a bullet version to riff from, the shots to get, and
  the per-platform captions (via the optimizer). Batches a whole week in one run; gives hooks on their own when
  that's all the agent wants. Reads the plan or ideas above it, and hands the batch to `shortform-batch` for a
  film day. Step 3 of the strategy pipeline. Text only; never posts.

  Trigger on: "script my reels", "script these", "write my scripts", "write my reel", "give me hooks", "hooks
  for [topic]", "script this week's videos", "script the first five", or any request to script short-form
  videos. (This is the batch scripting front door; a single talking-head topic also works via
  shortform-talkinghead — either lands you a script.)
---

# Short-Form Script Pack (strategy pipeline, step 3)

Turn an idea into something the agent can film today — hook, script, shots, captions — for one video or a whole
week. Vertical, **30–60 seconds**, phone-filmed, one person.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) and
`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md` — every script is **HVC**: bold ~3s **Hook** (never "stop
scrolling"), **Value** as a clean list, **CTA** that doesn't always sell.

## Step 1 — Load the Brain + FIND THE IDEAS FIRST
**If `~/realtor-brain/` is empty**, pull it first with **realtor-brain-sync**; only if the cloud has none, run
Brain Setup. Read `brain.md`, `identity/voice.md` + `voice-samples.md` (scripts must sound like them),
`identity/offer.md` (lead magnets, for the CTA), `identity/compliance.md`. **Find the ideas** — the plan
(`shortform-video-plan`) or ideas (`shortform-ideas`) list above you, in Drive, or pasted. If it's there, say
which you're scripting and start; if they named a topic, script it — zero questions. Default to five.

**Hooks only?** ("give me hooks" / "hooks for [topic]") → give 10 hooks across the styles below and stop; offer
the full script for the strongest.

## Step 2 — For EACH video (use these exact section names)
- **THE HOOK — 3 ways** — three options, each <3s spoken (~8–12 words), styles labelled, the strongest marked
  with one line why. Styles: **question · contrarian · number/stakes · mistake · callout · curiosity-gap** —
  never three of the same. Banned openings: "hey guys", "welcome back", "in today's video", "let's talk about",
  or the agent's credentials. The first word is the hook.
- **THE SCRIPT** — word-for-word, written for speech, **30–60s** (show the word count; ~90–130 words). Shape:
  hook → the turn ("here's what nobody tells you") → 2–3 beats of real substance → the CTA. Every line sayable
  in one breath.
- **THE BULLET VERSION** — the same video as 5 riff beats (same hook + CTA, word-for-word). Most agents film
  from this — give it equal weight.
- **THE SHOTS** — one line per beat: where to stand, what to show, what b-roll to grab.
- **THE CAPTIONS** — hand the hook + script + format + CTA intent to **`shortform-optimizer`** (its
  `references/platform-rules.md` is the single source of truth): IG+FB caption + **3–5 searchable hashtags**
  (per Mike — never a hashtag wall), TikTok one-line, YouTube Shorts title/description/tags. Do not write your
  own hashtag rules here.
After all videos: **THE BATCH NOTE** — which film in one session, and the one to post first.

## Step 3 — Save + hand off
Deliver clean copy-paste blocks in chat (they film from these), and save per
`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` (render `.docx` → `[Agent Name] — Short-Form
System/Content/[YYYY-MM · Month]/`, named `[YYYY-MM-DD] · Scripts · [batch/topic]`). Log each to
`memory/content-log.md` (status `Scripted`) and push. Close: *"Say 'batch these' and `shortform-batch` turns
them into one filming session."*

## Rules
- **The read-aloud test governs:** if a line can't be said in one breath while walking, rewrite it. The delete
  test: cut any word that isn't earning its place.
- **The any-agent test:** rewrite anything generic with the street, community, price, or local process.
- One CTA per video (from `offer.md`); numbers only if the agent/research gave them (carry the source); never
  invent a client story (mark where the agent fills it). Append the brokerage disclaimer where the market
  requires it (compliance).
- **Fair housing**; match the Brain's voice. Text only — never post, send, or schedule.

## Quality checklist
- [ ] Brain + the ideas/plan loaded; scripting started without re-asking
- [ ] Each video: hook ×3 (mixed styles) · word-for-word script w/ word count · bullet version · shots
- [ ] Captions produced via `shortform-optimizer` (3–5 hashtags; per-platform), not hand-rolled here
- [ ] HVC throughout; read-aloud + any-agent tests passed; one CTA; compliance appended
- [ ] Saved to Drive, logged to `content-log.md`, handed to `shortform-batch`
