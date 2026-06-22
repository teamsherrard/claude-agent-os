---
name: youtube-setup
description: One-time onboarding for the Realtor YouTube System. READS everything from the agent's existing Realtor AI Brain (identity, market, niche, avatars, offer, voice) and only captures what's genuinely YouTube-specific — channel, goals, posting cadence — never re-asking what the AI Brain already knows. Then connects Google, provisions a clean Google Drive workspace (Videos + Setup), and delivers the agent's full YouTube Game Plan (built on Mike Sherrard's frameworks) as their first deliverable — no YouTube connection needed (V1 analytics come from their YouTube Studio export). Use when a real estate agent wants to set up / build / start / onboard their YouTube system or connect their channel. Triggers on "set up my YouTube system", "build my YouTube system", "start my YouTube system", "onboard me", "connect my YouTube channel".
---

# Realtor YouTube System — Setup

One-time onboarding that stands up the agent's YouTube System as a **layer on top of their existing
AI Brain**. By the end the agent has: a YouTube Layer linked to their AI Brain, connected tools, a clean Google
Drive workspace (Videos + Setup), and their full **YouTube Game Plan** — the first epic deliverable.

## ⭐ THE #1 RULE: ONE BRAIN, NEVER TWO
The agent's **identity, market, niche, avatars, offer, and voice already live in the shared Realtor
AI Brain.** This skill does **NOT** rebuild any of it and **NEVER re-asks it.** It READS the AI Brain
and only captures the few things that are genuinely YouTube-specific.

> If you ever catch yourself about to ask about their niche, market, who they serve, their offer, or
> their voice — **STOP.** Read it from the AI Brain instead. See `references/ai-brain-contract.md`.

## Golden rules
- Warm guide, not a form. This should feel *fast* precisely because most of it is already known.
- **Never ask a question the agent can't easily answer.** They're a busy, non-technical realtor — techy or
  open-ended questions ("which tools should I connect?", "what's your subscriber target?") make them freeze
  and feel dumb. **Default-if-unsure:** the moment they hesitate, pick a smart default, tell them what you
  picked, and move on — they can change anything later. Ask ONLY what genuinely can't be defaulted, one thing
  at a time. (Mirrors the Brain's ask-once-default principle.)
- The AI Brain is the source of truth; the YouTube Layer points back to it and never copies it.
- Confirm before creating Drive files. Everything is created in the agent's own account.

---

## Step 1 — Welcome
Set the tone that this will be quick because you already know them:
> "Good news — I already have most of what I need from your AI Brain, so this'll be quick. Just a
> couple of YouTube-specific things and then I'll build your whole workspace."

## Step 2 — Load the AI Brain (do NOT rebuild it)
1. Locate and read the shared Realtor AI Brain per `references/ai-brain-contract.md`.
2. Map its fields into the YouTube context (identity, market, niche, avatars, offer, voice, brand).
3. Reflect back what you already know, so it's clear you won't re-ask:
   > "Here's what I pulled from your AI Brain: you're [name], you serve [avatar] in [market], your
   > niche is [niche], your voice is [tone]. I won't ask you any of that again."
4. **Assess how rich the Brain is.** If it's thin (vague niche, no clear avatars, no competitors), tell the
   agent plainly and kindly that the more specific their Brain, the sharper everything gets ("the detail in
   here is what makes your videos *yours* and not generic"), and point to the 1–2 additions that would help
   most. A thin Brain = generic output = no better than ChatGPT. Add anything missing to the AI Brain, centrally.

## Step 3 — Capture ONLY the YouTube layer
Ask only for what's YouTube-specific and not already in the AI Brain (see `youtube-layer-template.md`):
- **Channel:** YouTube channel URL (or "none yet"); if it exists, note video count + best/worst performers.
- **YouTube goal:** ask once, lightly — *"what would make this worth it: more leads, or growing the channel?"*
  If they give a number, great; **if they're unsure, don't push for one — default to "steady growth + a few
  leads a month" and move on.** (Their real business goal — deals/year, income — is read live from the Brain's
  `strategy.md` for the Game Plan's math; you don't need a precise YouTube number here.)
- **Cadence:** the realistic posting commitment + filming time they can give.
- **Competitor channels:** 3–7 local/niche YouTube channels to track (feeds the Outlier engine) — only if
  the AI Brain doesn't already name them.
- **Neighbourhood coverage list:** the communities they want to cover systematically (usually already in the
  AI Brain — pull from there; only ask if missing). Ideation's coverage read tracks progress against it.
- **(Optional) on-camera voice refinement:** the AI Brain already has their voice. ONLY if they want
  an extra-tight match, offer to read 2–3 video transcripts to layer in their spoken on-camera cadence.
  Skip without hesitation — the AI Brain voice is enough. (See `voice-profile-guide.md`.)

That's the whole interview. Do not collect anything else at the brain level.

## Step 4 — Tools (don't make them choose — default and move on)
**Drive is already connected** (it's the Brain's home) — and that's everything the YouTube System needs to
run. **Do NOT ask the agent "which tools should I set up?"** — it's a techy question they can't answer, and
it stalls them. Just confirm Drive's good and keep moving. One plain line is plenty:
> "Your Drive's already connected, so we're good to go — I'll handle the rest."
- **Calendar + Gmail are optional add-ons** for two specific features only: putting filming days on their
  calendar, and the optional Monday email. **Never ask about them up front.** Only when the agent later
  actually wants one of those ("put my filming days on my calendar," "send me a weekly email") do you say
  *"one-time connect for that — takes a sec"* and set it up then, at the point of need.
- **YouTube — no connection needed** (analytics via their Studio export; competitor scans via the web).
  Never ask them for API keys.

## Step 5 — Provision the Drive workspace (minimal)
Using the Google Drive connector, create the structure in `references/drive-structure.md`: the top
workspace **nested inside the agent's existing master Drive** (never an orphan folder), plus a `Videos/`
and a `Setup/` folder — following the exact naming convention there. **Record the top-workspace folder ID
into the YouTube Layer** so every later skill saves to the same organized place. **Do NOT create tracker
spreadsheets** — no
Idea Bank, Content Map, Content Calendar, Keyword Map, or Performance Log. The system is briefing-driven
and reads state live. (The agent's first deliverable — their full YouTube Game Plan, which includes their
pillars + a starter slate of ideas — is built next, in Step 7.)

## Step 6 — Save the YouTube Layer (a thin file, not a brain copy)
Save a small **YouTube Layer** that stores ONLY channel, goals, cadence, pillars, and any optional
voice refinement — and that *references* the AI Brain for everything else. Mirror a readable copy to
the "YouTube Layer" Doc in their folder. The AI Brain stays the single source of truth; when it
updates, the YouTube System reflects it automatically with no re-onboarding.

## Step 7 — Deliver the YouTube Game Plan (the first epic win)
This is the moment that makes setup feel worth it. Immediately build the agent's **YouTube Game Plan** by
running `${CLAUDE_PLUGIN_ROOT}/skills/youtube-gameplan/SKILL.md`: their channel audit (scaled to however many
videos they have), 3 high-intent pillars, ~50 exact ready-to-film titles, the goal-math that ties it to
their business goal, and a 90-day plan — in one premium Doc stamped "Powered by Mike Sherrard's frameworks,"
saved to their workspace. Share the Drive link, then hand off:
> "Open your Game Plan — it's your whole channel mapped out. Then pick any title from Pillar 1 and say
> 'make this video,' and I'll script it, optimize it, and the rest."

This is the system's "wow" — lead with it, don't bury it.

---

## Completion checklist
- [ ] AI Brain located, read, and mapped — **nothing re-asked**
- [ ] YouTube Layer captured (channel, goals, cadence) — only the delta
- [ ] Voice inherited from AI Brain (optionally refined with transcripts)
- [ ] Drive confirmed connected (it's all that's needed) — Calendar/Gmail deferred to point-of-need; no YouTube connection (V1 = Studio export)
- [ ] Drive set up (Videos + Setup only — NO tracker spreadsheets)
- [ ] **YouTube Game Plan** built (audit + 3 pillars + exact titles + goal-math + 90-day calendar) and saved to the workspace
- [ ] Folder link shared
