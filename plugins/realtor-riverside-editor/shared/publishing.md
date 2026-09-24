# Publishing — post from Riverside, on the agent's word

Riverside can post the finished edit straight to the agent's connected channels — YouTube (and Shorts), TikTok, Instagram, Facebook Reels, LinkedIn, X — now or scheduled. It's powerful and mostly **one-way**: a scheduled or failed post can still be changed (`social_update_upload`) or cancelled (`social_cancel_upload`) before it goes out, but once a post is live nothing on this connector can edit, delete, or unpublish it. So it's gated harder than anything else in the plugin.

## The gate (non-negotiable, every time)

1. **Never publish unless the agent asked to publish** (or said yes to your offer at delivery). "Edit my video" is not permission to post it.
2. **Discover, don't assume:** `social_get_connected_platforms(studioId)` → the accounts, their `platformAccountId`, YouTube `channelId`s, TikTok `privacyLevelOptions` and `maxVideoPostDurationSec`, X `characterLimit`. An empty list = nothing connected → *"Connect your YouTube / Instagram in Riverside (Studio settings → Social accounts) and I'll post for you next time."*
3. **Read the rules first:** `social_get_publishing_guidelines(platform)` — title/caption limits, duration and aspect-ratio constraints (Shorts ≤ 3 min 9:16; Facebook Reels ≤ 90 s; Instagram 5 s–15 min, 4:5–9:16; LinkedIn ≤ 15 min, ≤ 200 MB; TikTok rejects watermarks).
4. **YouTube: check Content ID first** — `editing_get_export_publish_data(editId)`: a non-null `youtubeCode` flags a copyright match (a music bed you didn't expect to be flagged). Tell the agent before posting.
5. **Fetch the copy from its owner — never write it** (`${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`). YouTube title, description, chapters, tags, and pinned comment come word for word from the YouTube System's **SEO Package** Google Doc in that video's folder. A reel's caption, hashtags, and slot come from the Short-Form System. Your only checks: the text fits the platform limits below, and it passes compliance (three-state rule in `final-check.md`; a required disclaimer line that is missing is a stop, not something you add). **No package yet?** Say *"Say 'SEO for this' and I'll have your title and description written properly, then I'll post it."* If they want it up anyway, post under THEIR words as **unlisted** and say it has no SEO yet. Also check the double-post rule: one route per post (`publish_route` in the editor config: reels go through the Short-Form System's tool when it says `shortform-tool`, and this skill never posts them), and the same video already Scheduled or Published on that channel (shared board, `memory/content-log.md`) → stop and say so.
6. **Show the summary and get an explicit yes.** Human-readable, no IDs:
   > *"Ready to post to **YouTube — Mike Sherrard Real Estate** as **unlisted**: title "…", description below, 4 chapters. Publishes **now** (or: scheduled Thu 9:00 am MT). This can't be undone from here — if you want it changed later you'd do that on YouTube. Go?"*
   Privacy on YouTube is **always explicit** — never default to public. Default recommendation: **unlisted** first (they can flip it to public on YouTube after a last look), unless they say public.
7. **One call:** `social_upload_create(platform, studioId, platformAccountId, clipId:<editId>, <platform>Data, composeSettings?, scheduledAt?)`. `clipId` takes the **edit id as-is**. If the edit has no export yet, pass `composeSettings` (`{}` accepts 1080p / no watermark / no transcription defaults — tell the agent those defaults first) → export-then-publish. If it was already exported, omit it.
8. **Verify once:** `social_get_upload_status(uploadId)` shortly after. `COMPLETED` = live. `SCHEDULED` = queued; report `scheduledAt` and stop (it can still be moved with `social_update_upload` or cancelled with `social_cancel_upload` until it goes out). `PENDING` = still rendering/uploading — say so, check again only when they ask. `FAILED` → relay the `reason` (Riverside's own recovery text) and act on the code. Never say "it's live" off `upload_create` alone.

## Errors → what you say

| Code | Plain words | Then |
|---|---|---|
| `VALIDATION_ERROR` "not exported yet" | *"Needs a save first — doing that now."* | retry WITH `composeSettings` |
| `VALIDATION_ERROR` (metadata) | fix the copy to the limit it names | retry once |
| `INVALID_TOKEN` / `UNAUTHORIZED` / `FORBIDDEN` naming the account | *"Your YouTube connection in Riverside expired — reconnect it in Studio settings and say 'post it' again."* | stop |
| `CONFLICT` / `SERVICE_UNAVAILABLE` / `INTERNAL_SERVER_ERROR` / timeout | outcome ambiguous → **do not re-fire**; check `get_upload_status` if you have an id, otherwise ask the agent to look at the platform | stop |
| `RATE_LIMIT_EXCEEDED` | *"The platform's throttling us — try again in a few minutes."* | stop |

## Scheduling

`scheduledAt` is ISO-8601 with a timezone (`2026-09-24T09:00:00-06:00`). Convert from the agent's plain words using the Brain's timezone (`~/realtor-brain/config.md`, not the editor's `config.json`). If the Short-Form System or Listing Launch plugin planned the slot, use theirs. Say the local time back in the summary.

## Per-platform limits — a checklist for the OWNER'S copy (never a writing guide)

- **YouTube:** title ≤100 characters, description ≤5000 bytes, `privacyStatus` explicit, `youtubePlatform: YOUTUBE_SHORTS` for a vertical ≤3 min.
- **Instagram:** caption ≤2200 characters, ≤30 hashtags, ≤20 tags; `shareToFeed: true` unless told otherwise.
- **TikTok:** the caption field is called title (≤2200); `privacyLevel` from the account's options.
- **Facebook Reels:** ≤90 s, 9:16 only; description optional.
- **LinkedIn:** ≤3000 characters; `visibility` PUBLIC unless told.
- **X:** honour the account's `characterLimit`; every URL counts 23.

## What it is NOT

Not a scheduler for someone else's file, not a way to post to a channel Riverside can't see, and not a substitute for the agent's last look. Offer it at delivery; run it only on their word.
