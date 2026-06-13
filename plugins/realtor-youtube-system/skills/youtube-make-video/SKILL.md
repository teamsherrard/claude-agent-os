---
name: youtube-make-video
description: Workflow 2 of 2 — Video Production. Run this in a NEW chat that becomes the video (one chat = one video). Given a chosen idea, it produces everything for that one video — step by step, in the agent's voice, all saved to that video's folder. It locks the packaging (title, hook, 3 thumbnail texts), writes the script, builds the SEO package, maps the lead magnet, and — after the agent films and publishes — repurposes it into shorts, a blog, an email, and social posts. Triggers on "make this video", "produce this video", "let's make the video", "build this video", or when a chosen idea is pasted into a fresh chat.
---

# Workflow 2 — Make This Video (one chat = one video)

This chat IS the video. Walk the agent through producing it **one simple step at a time** — never dump it
all at once. Everything saves to this video's folder. Apply `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

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
the title — text only, no design). Packaging first.

## Step 2 — Script
Write the full teleprompter script in the agent's voice — complete and ready to read, no placeholders
(Script Studio rules). Save it as **Script**. Offer a 30–45s short-form cut.

## Step 3 — SEO package
Build it (SEO Engine): 3 title options, 3 thumbnail texts, description + timestamped chapters, tags,
hashtags, pinned comment — with the agent's CTA, booking link, and lead-magnet link. Save as **SEO Package**.

## Step 4 — Lead magnet map
Map the matching lead magnet page-by-page (Lead Engine), tied to this video + the CTA — paste-ready for
the agent's design tool. Save as **Lead Magnet Map**.

## Step 5 — After filming: repurpose
Once the agent has filmed + published, repurpose (Repurposing Engine): short-form scripts, a blog post,
an email, and social posts. Save as **Repurposing Pack**.

## How to run it
- One step at a time, conversational. Confirm before moving on. The agent only ever feels "we're making my video."
- Run compliance on everything before saving.
- Done = the video's folder holds: Script · SEO Package · Lead Magnet Map · (later) Repurposing Pack.

## Hand-off
Script + packaging ready → the agent films. After they publish → "say 'repurpose this'." Results later
flow back into Ideation via the weekly briefing.
