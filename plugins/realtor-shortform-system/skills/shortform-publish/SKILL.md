---
name: shortform-publish
description: >
  Schedules and posts the agent's short-form content through their connected posting tool (Metricool by
  default, or GoHighLevel / Buffer). The agent just says it in plain English — "schedule this for tomorrow
  at 10am," "post these at my best times this week," "put this in my queue for Friday," "post this to
  Instagram and TikTok" — and this confirms the details and schedules it. Always shows the post and waits
  for a yes before anything goes live; never auto-posts. Picks best-time slots when no time is given.

  Trigger on: "schedule this", "schedule this post", "post this tomorrow", "post this at [time]", "schedule
  these for my best times", "put this in my queue", "schedule my content", "post this to [platform]",
  "queue this up", "schedule it for [day/time]", or any request to schedule/post finished content.
---

# Schedule & Post

Turns a finished post into a scheduled (or published) post on the agent's socials — through whatever tool
they connected. The agent speaks naturally; you handle the rest.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — plain and warm, never technical.

---

## Step 1 — What are we scheduling, and where
- **The post(s):** use what's already in the conversation (a green screen / talking head / carousel just
  produced), or what the agent pasted. If it's unclear which post they mean, ask once, simply.
- **The posting tool:** read `~/realtor-brain/identity/publishing.md` for their method (Metricool /
  GoHighLevel / Buffer / manual) and connected platforms. If it's "manual" or unset, just hand them the
  copy-paste post and mention (once) they can connect a tool to have you schedule it.
- **When:** if they gave a time ("tomorrow at 10am"), use it. If they said "best time" or gave none, pull
  their best-time-to-post from the connector and use that slot. Convert natural language to a real
  date/time in their timezone.

## Step 2 — Schedule it
Follow `${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md` (it covers Metricool, GoHighLevel, Buffer, the
best-time logic, the free-plan cap, and the video/media handling). In short:
1. Confirm the details back in one plain line: *"Posting your green screen to Instagram + TikTok tomorrow
   at 10am — good?"* (If they already gave an explicit time + platform, that's your yes — just confirm and go.)
2. Use the connected tool's scheduling capability to create the post (caption per platform, media, time).
3. If the tool can't attach the video through the connector, use the hybrid path: schedule the caption +
   slot and tell them plainly to drop the video onto it in the app.

**Golden rule:** never schedule or publish without the agent's clear go-ahead. A specific instruction
("schedule this at 2pm Friday") IS the go-ahead — confirm and do it. Anything vaguer, confirm first.

## Step 3 — Confirm + log
- Tell them what's scheduled, where, and when, in plain words: *"Done ✅ — your reel goes out tomorrow at
  10am on Instagram and TikTok. Want me to line up another?"*
- Update the post's row in `~/realtor-brain/memory/content-log.md` to `Scheduled` (date + platforms), then
  push to Drive.

---

## Notes
- **Batch scheduling:** if they ask to schedule several ("schedule all of these at my best times"), space
  them out sensibly across the days/slots — don't stack five posts in one hour.
- **Free plan:** Metricool's free plan caps at 20 scheduled posts/month — if they'd exceed it, say so and
  offer to post to one platform or suggest the upgrade. Never silently drop a post.
- **Account types:** Instagram auto-publishes from a Business/Creator profile; if theirs is personal, the
  tool may send a reminder instead of auto-posting — mention it once if relevant.
- This skill doesn't write content — it schedules what the workflows produced. If they want something new,
  point them to green screen / talking head / carousel.

## Quality checklist
- [ ] Confirmed the post, platforms, and time before scheduling
- [ ] Got a clear go-ahead (explicit instruction counts); never auto-posted
- [ ] Used best-time slots when no time was given; spaced out batches
- [ ] Handled video via full-attach or the hybrid fallback
- [ ] Flagged the free-plan cap if relevant
- [ ] Logged to `content-log.md` and pushed to Drive
- [ ] Talked plainly — no tool names or jargon
