---
name: riverside-publish
description: Post or schedule a finished Riverside edit to the agent's connected social channels — YouTube (and Shorts), TikTok, Instagram, Facebook Reels, LinkedIn, X — with a hard confirmation gate. Discovers which accounts are connected, reads each platform's rules, writes the caption/title/description in the agent's voice from the Brain (compliance-checked; defers to the Realtor YouTube System's SEO pack for YouTube if that plugin is installed), checks YouTube Content-ID on the media, shows a plain-language summary of EXACTLY what goes where and when, and only then publishes — then verifies the status once. Publishing is one-way (no unpublish from here), so nothing happens without the agent's explicit yes. Trigger on: "post it", "publish it", "put it on YouTube", "schedule it for Thursday", "post the reel to Instagram", "send it to my channels", or a yes to the publish offer at delivery. Usually reached through riverside-navigator or offered by an edit skill.
---

# Publish — post it, on their word

Follow `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and, for everything below, `${CLAUDE_PLUGIN_ROOT}/shared/publishing.md` (the gate, the copy shapes, the error table). Talk plainly (`${CLAUDE_PLUGIN_ROOT}/shared/plain-language.md`).

## Step 0 — Only on their word

"Edit my video" never includes posting. Run this skill only when they asked to publish or said yes to the offer. If you're unsure which video: *"Post the Phoenix video I finished this morning — right one?"*

## Step 1 — Discover (free)

1. `social_get_connected_platforms(studioId)` → accounts. Empty → *"Connect your channels in Riverside first (Studio settings → Social accounts) and I'll post for you next time."* Stop.
2. Which platform(s)? From their words, else from config `platforms` — one question max: *"YouTube only, or YouTube and Instagram? (I'd do both.)"*
3. `social_get_publishing_guidelines(platform)` for each — limits and constraints. Check the edit fits (a 9:16 ≤ 3 min → Shorts; a 12-min 16:9 → YouTube, not Facebook Reels). If it doesn't fit a channel, say so and skip that channel.
4. **YouTube:** `editing_get_export_publish_data(editId)` — a non-null `youtubeCode` = possible copyright match → tell the agent before anything else.
5. Is the edit exported? (`exports_get_export` on the last export id from the checkpoint log / delivery.) Exported → publish as-is. Not exported → you'll pass `composeSettings` (1080p defaults) and tell them a save happens first.

## Step 2 — Write the copy (free, compliance-checked)

- **YouTube:** if the Realtor YouTube System plugin is installed, use its title/description/SEO for this video. Otherwise: title ≤60, hook-led, keyword first; description = 2–3 line hook + the agent's CTA/links from the Brain + `00:00` chapters (from the edit's chapters) + the disclaimer line if `identity/compliance.md` requires it. `privacyStatus` **explicit** — recommend `unlisted` for a first look unless they said public. `youtubePlatform: YOUTUBE_SHORTS` for a vertical ≤3 min.
- **Instagram / TikTok / Facebook / LinkedIn / X:** the per-platform shapes in `publishing.md`, in `identity/voice.md`'s tone, ending on the CTA. If the Short-Form System produced a caption for this reel, use it.
- **Compliance gate (three states):** filled → apply exactly; missing or unfilled placeholder → no claims, no placeholder text, nudge once. No superlatives, no steering language, anywhere.
- **Schedule?** Convert their words to ISO-8601 with the Brain's timezone; say the local time back.

## Step 3 — The summary and the yes (non-negotiable)

Show it exactly like this, no IDs, one block per channel:

> **YouTube — Mike Sherrard Real Estate** · **unlisted** · publishes **now**
> Title: *What Agents Don't Tell You About Living In Phoenix*
> Description: (the full text)
>
> **Instagram — @mikesherrard** · Reel, shared to feed · **scheduled Thu Sep 24, 9:00 am MT**
> Caption: (the full text)
>
> *This can't be undone from here — later changes happen on the platform itself. Go?*

If a save happens first: *"It'll save a 1080p copy first (no watermark), then post automatically."*

Wait for an explicit yes. A "sure" counts; silence doesn't.

## Step 4 — Publish (one call per channel)

`social_upload_create(platform, studioId, platformAccountId, clipId:<editId>, <platform>Data, composeSettings? , scheduledAt?)` — `clipId` takes the edit id as-is. Then `social_get_upload_status(uploadId)` once, shortly after:
- `COMPLETED` → *"It's live on YouTube."*
- `SCHEDULED` → *"Queued for Thursday 9:00 am."* Stop; no polling.
- `PENDING` → *"It's saving and uploading — a few minutes. Ask me to check and I will."*
- `FAILED` → relay Riverside's `reason` in plain words; act on the code per the table. Never re-fire on an ambiguous outcome.

Never say "posted" off `upload_create` alone.

## Step 5 — Write it back

- `memory/content-log.md` in the Brain: what went where, when, the title/hook — so no skill repeats it.
- If the Notion Content Dashboard exists (YouTube / Short-Form systems), mark the card Published/Scheduled with the date.
- Checkpoint log line: `publish-<platform> · done · <uploadId>`.

## What you never do

Post without the summary and the yes · default YouTube to public · substitute a different edit or export if the named one can't be published (report and stop) · retry after `CONFLICT` / `SERVICE_UNAVAILABLE` / a timeout without checking status first · promise an unpublish.
