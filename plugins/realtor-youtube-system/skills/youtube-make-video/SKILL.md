---
name: youtube-make-video
description: Workflow 2 of 2 — Video Production. Run this in a NEW chat that becomes the video (one chat = one video). Given a chosen idea, it produces everything for that one video — step by step, in the agent's voice, all saved to that video's folder. It locks the packaging (title, hook, 3 thumbnail texts), writes the script, builds the SEO package, maps the lead magnet, and — after the agent films and publishes — repurposes it into shorts, a blog, an email, and social posts. Triggers on "make this video", "produce this video", "let's make the video", "build this video", or when a chosen idea is pasted into a fresh chat.
---

# Workflow 2 — Make This Video (one chat = one video)

This chat IS the video. Walk the agent through producing it **one simple step at a time** — never dump it
all at once. Everything saves to this video's folder. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

> **Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`). Every video follows
> the universal structure **§4** (Hook → Primary CTA near the beginning → Body → Secondary CTA → next-video
> direction) and the matching pillar's spec: market updates **§9.1**, home tours **§10.1** (+ new-construction
> positioning **§10.5**), relocation **§11.1**, community tours **§12.1**, map tours **§13.1/§13.3**, local
> lifestyle **§14.1**. Lock the packaging and outline on the **§24.2 outline template**. The downstream skills
> (Script Studio §4–§7, SEO §16–§18) carry the detail — keep this flow coherent with the doctrine throughout.

> This is the guided full-video flow. If the agent only wants one piece — just a script, just the SEO, just
> a lead magnet, just repurposing — let them jump straight to that skill; don't force the whole sequence.

## Step 0 — Set up the video
Confirm the idea/title. Then resolve the save location per
`${CLAUDE_PLUGIN_ROOT}/skills/youtube-setup/references/drive-structure.md` ("Saving content — resolve,
never duplicate"): from the YouTube Layer get the workspace anchor, find-or-create the month bucket
`{YYYY-MM · Month}`, then find-or-create this video's folder `{YYYY-MM-DD · Title}`. EVERYTHING in this
chat saves there under its fixed name (Script · SEO Package · Lead Magnet Map · Repurposing Pack). Confirm
the spot in plain words and suggest the agent name this chat after the video.

## Step 1 — Lock the packaging (quick, before the script)
Confirm or refine the final **Title**, the **Hook**, and **3 short thumbnail text options** (pulled from
the title — text only, no design). Packaging first. Identify the video's **pillar** so the script follows
that pillar's structure (§9–§14). The hook follows the §5.4 formula (never "welcome back" / §5.5); the title
is search-intent-first and beats the top 3–5 ranking videos (§16, §16.4).

## Step 2 — Script
Write the full teleprompter script in the agent's voice — complete and ready to read, no placeholders
(Script Studio rules) — on the doctrine's structure: Hook (§5) → Primary CTA right after it (§6.2: "people
just like you" / "your unique situation" / "avoid costly mistakes" / book a private call) → Body that
delivers the promise (§7) → Secondary CTA + next-video direction at the end (§6.5). Length per §27.6
(relocation 8–12 min, others 10–25 min). Save it as **Script**. Offer a 30–45s short-form cut.

## Step 3 — SEO package
Build it (SEO Engine): 3 title options, 3 thumbnail texts, description + timestamped chapters, tags,
hashtags, pinned comment — with the agent's CTA, booking link, and lead-magnet link. Save as **SEO Package**.

## Step 4 — Lead magnet map
Map the matching lead magnet page-by-page (Lead Engine), tied to this video + the CTA — paste-ready for
the agent's design tool. Save as **Lead Magnet Map**.

## Step 5 — After filming: repurpose
Once the agent has filmed + published, repurpose (Repurposing Engine): short-form scripts, a blog post,
an email, and social posts. Save as **Repurposing Pack**.

## Step 6 — Fill their content-board card (if they have the Notion board)
If the agent's **Content Dashboard** exists in their Notion (built by `youtube-board` — check quietly; if
Notion isn't connected or there's no board, skip silently, never nag): update this video's card per
`${CLAUDE_PLUGIN_ROOT}/shared/notion-board-spec.md` — the full **script, SEO package, and lead magnet
written INTO the card's page**, the Drive links in the columns, the **top-3 proven reference videos** from
Step 1's competitive read (real links + numbers only), and Status → `Scripted` (then `Recorded` /
`Published` as the agent reports it). One plain line: *"Your card on the board has everything now — script,
SEO, lead magnet, and the 3 videos to beat."*

## How to run it
- One step at a time, conversational. Confirm before moving on. The agent only ever feels "we're making my video."
- Run compliance on everything before saving.
- Done = the video's folder holds: Script · SEO Package · Lead Magnet Map · (later) Repurposing Pack — and
  the board card (if they have one) holds it all too.

## Hand-off
Script + packaging ready → the agent films. After they publish → "say 'repurpose this'." Results flow
back into Ideation automatically — it reads the channel, folders, and analytics live next time the agent
asks for ideas.
