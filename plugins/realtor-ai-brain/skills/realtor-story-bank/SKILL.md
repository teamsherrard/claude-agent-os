---
name: realtor-story-bank
description: >
  The agent's personal story library — what makes content magnetic and un-copyable. Facts (market, offer,
  voice) make content "sound like me"; real stories make it "could only be me." A spoken interview that mines
  the agent's career for real anecdotes — the deal that almost died, the buyer who cried at closing, the
  mistake that taught them everything — and files each as a STRUCTURED, tagged story (hook · story · lesson ·
  topic tags · emotional beat) so every future script, email, and post can automatically pull the right one.
  Targets a starter set of ~5 stories, but fully accommodates agents who have one or none (many are new) —
  it never makes them feel short, and the library grows via Dispatch as they close deals. Client privacy is
  protected: public use is anonymized. Feeds the Week-8 storytelling formats.

  Trigger on: "build my story bank", "my stories", "capture my stories", "add a story", "story library",
  "I have a good story", "storytelling", "refresh my story bank", "mine my career", or when a content skill
  needs a real anecdote and none is on file yet.
---

# Realtor Story Bank — the stories only they can tell (Brain)

The most magnetic content isn't tips — it's a real moment. And an agent's real moments are the one thing no
competitor program can replicate. This mines them, structures them, and makes them reusable. **~8 minutes, spoken.**

## Step 0 — Read the shared engine
Read `${CLAUDE_PLUGIN_ROOT}/shared/spoken-capture.md` (mechanism · natural interview · never-fabricate) and
`${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md`. This is the Story-Bank application of that engine.

## Step 1 — Load the Brain + set expectations (gently)
Read `~/realtor-brain/brain.md`, `identity/proof.md` (wins already on file — some may already be story seeds),
`identity/voice-print.md` (capture stories in their spoken voice). Open warmly, and **defuse the "I have no
stories" fear up front** — most agents, especially newer ones, think they have none:
> "We're going to grab a few real stories from your career — they make your content impossible to copy. And
> before you say 'I don't have any' — you have more than you think, and if you're newer and genuinely only
> have one or none, that's completely fine. We'll capture what's real today and your bank fills up fast as you
> close deals. Best out loud — **voice mode**, or paste a transcript."

## Step 2 — Mine for stories (aim for ~5; accept 0, 1, or 2 without flinching)
Ask a few of these, one at a time, following whatever lights them up. Each is a doorway to a story:
- "Tell me about a deal that almost fell apart — and how you saved it."
- "A first-time buyer moment that stuck with you."
- "Your biggest mistake in this business — and what it taught you."
- "A negotiation or bidding war you're proud of."
- "A time you had to tell a client a hard truth."
- "Why you got into real estate." *(always works — even a brand-new agent has this one)*

**If they're newer / thin on stories:**
- Never push or make them feel short. Take what's real, even one.
- Widen the net: a moment from their **past career/life** that shows who they are, a small but real client
  interaction, or just their **"why."** A single honest story beats five forced ones.
- If they truly have **zero** deal stories: capture the "why I got into this" story (they always have it),
  write the bank in its **"starter" state**, and lean into the growth loop (Step 5) — *"this is going to fill
  up on its own."* Never leave them feeling behind. A thin-but-real bank is a success here.

## Step 3 — Structure each story → `identity/story-bank.md`
A pile of anecdotes is useless; a tagged library is powerful. Capture each as a structured entry:
- **Hook** — one line (so the system can scan fast).
- **The story** — the real narrative, in their spoken voice, with the true details that make it land.
- **The lesson / point** — *what it proves.* **Mandatory** — a story with no point can't be used in content;
  ask "what's the takeaway?" if it's missing.
- **Tags** — topics it fits: buyers / sellers / negotiation / first-home / pricing / market-fear / relocation…
- **Emotional beat** — relief / pride / heartbreak / vindication (lets content match a *feeling*, not just a topic).
- **Privacy** — flag if it involves a real client; note "anonymize for public use."
- **Used-where** — starts empty; content skills stamp it when they use the story (rotation).

## Step 4 — Confirm + wire
Reflect the set back briefly ("here are the 4 I've got, tagged like this — look right?"), let them adjust, write.
> **Push to Drive** — `realtor-brain-sync` (PUSH). Stamp **last updated + story count** at the top.
Confirm honestly for their level: a full bank → *"These make your content un-copyable."*; a thin/starter bank →
*"Great start — and this grows every time you close. Send me a line when you do."*

## Step 5 — The growth loop (this is how thin banks become deep ones)
Point them at **Dispatch**: *"Every time you close or something good happens, just tell your Brain — 'just closed
the Wilsons, $25k under ask' — and `realtor-capture` files it as a story seed. Say 'add a story' anytime to flesh
one out."* `realtor-capture` logs closings/wins as seeds in `proof.md`/`memory`; a **"refresh my story bank"**
re-reads those seeds and turns them into full structured stories. New agents catch up fast this way.

## How every output uses this (the payoff)
Per the story law in `brain.md`: before writing content on a topic, a script/email/post skill checks
`story-bank.md` for a story matching the **topic or emotional beat**, weaves it into the open or close in the
agent's voice (**anonymized if it's a real client**), and stamps **Used-where** so the same story doesn't repeat
too soon. If the bank is empty, it simply writes without one — never invents a story to fill the gap.
