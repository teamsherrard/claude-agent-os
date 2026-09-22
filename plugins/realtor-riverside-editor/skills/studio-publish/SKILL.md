---
name: studio-publish
description: Publish for the AI Editing Studio. Post or schedule a finished Riverside edit to the agent's connected social channels — YouTube (and Shorts), TikTok, Instagram, Facebook Reels, LinkedIn, X — with a hard confirmation gate. Discovers which accounts are connected, reads each platform's rules, fetches the title, description, chapters, and captions from the plugins that own them (the YouTube System's SEO Package, the Short-Form System's caption and slot) and never writes them itself, checks them against platform limits and compliance, enforces one posting route per post so nothing is ever double-posted, checks YouTube Content-ID on the media, shows a plain-language summary of EXACTLY what goes where and when, and only then publishes — then verifies the status once. Publishing is one-way (no unpublish from here), so nothing happens without the agent's explicit yes. Trigger on: "post it", "publish it", "put it on YouTube", "schedule my YouTube video", "post the reel to Instagram", "send it to my channels", or a yes to the publish offer at delivery. For reels, only when `publish_route` in the editor config is `riverside`; when it is `shortform-tool`, the Short-Form System's shortform-publish owns the post. Usually reached through studio-navigator or offered by an edit skill.
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

## Step 2 — Fetch the copy from its owner (never write it)

Read `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`. The Studio posts; it does not write marketing.

- **YouTube:** open the YouTube System's **SEO Package** Google Doc in this video's folder and use its title, description (chapters included), and tags word for word. If chapter times shifted in the edit, give the new section map back to the YouTube System rather than rewriting its chapters. `privacyStatus` is always explicit: recommend **unlisted** for a first look unless they said public. `youtubePlatform: YOUTUBE_SHORTS` for a vertical of 3 minutes or less.
- **Instagram / TikTok / Facebook / LinkedIn / X:** the caption, hashtags, and the posting slot come from the Short-Form System for this reel.
- **No package yet?** Offer the owner in one line: *"Say 'SEO for this' and your title and description get written properly, then I'll post it."* If they want it up now, post under the words THEY give you, as unlisted, and say it has no SEO yet. Never invent a title, a hashtag, or a description.
- **Your checks:** the owner's text fits the platform limits (`publishing.md`), passes compliance (three states), and the same video is not already Scheduled or Published on that channel (the double-post rule: shared board + `memory/content-log.md`; one route per post, per `publish_route` in the config).
- **Schedule?** Convert their words to ISO-8601 with the Brain's timezone and say the local time back. If the Short-Form System or Listing Launch set the slot, use theirs.

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
