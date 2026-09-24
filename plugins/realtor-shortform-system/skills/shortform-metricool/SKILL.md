---
name: shortform-metricool
description: >
  The Metricool Control Panel for the Short-Form System — the one place to CONNECT, CHECK, and MANAGE the
  agent's posting. It is NOT a publisher and NOT a content maker. It connects Metricool to Claude and runs the
  full health check (which brands + networks are linked, is Instagram a Business/Creator account, is Google
  Drive linked for video, is the free-plan cap in play), shows and edits what's in the queue (move, space out,
  or remove scheduled posts), verifies posts actually went out and explains + fixes any that failed, and sets
  the agent's best-time posting slots. Written for Metricool (the default); the same checks apply on
  GoHighLevel / Buffer.

  Trigger on: "check my metricool", "is my metricool connected", "connect my metricool", "set up metricool",
  "metricool health check", "what's scheduled", "what's in my queue", "what's going out this week", "move my
  post", "reschedule my posts", "space out my posts", "remove that scheduled post", "did my posts go out",
  "why did my post fail", "fix my posting", "set my best times", or any request to connect / check / manage
  the posting queue. (Scheduling NEW content = shortform-publish; a whole month from a Drive folder =
  shortform-batch-publish; performance / ads / the deep dive = shortform-analytics — hand off, don't duplicate.)
---

# Metricool Control Panel

The home for everything **around** posting that isn't making content or reading performance: **connect ·
check · manage · verify.** This is what makes the "post while you sleep" promise trustworthy — because
someone finally owns *"is it connected right, what's queued, and did it actually go out?"*

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — plain and warm, never technical; most
agents don't know (or care) what an API is. The connector mechanics live in
`${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md` (**Route A — Metricool**) — read it for the exact calls.

## What this skill does NOT do (hand off — never duplicate)
- **Make content** → green screen / talking head / carousel.
- **Schedule a NEW post** ("post this tomorrow at 10am") → `shortform-publish`.
- **Schedule a whole month from a Drive folder** → `shortform-batch-publish`.
- **Read performance / ads / the deep dive** → `shortform-analytics`.
This skill is the **operations layer** only.

## Step 1 — Load the Brain + find the tool
**If `~/realtor-brain/` is empty** (a fresh session or a different project), pull it first with
**realtor-brain-sync** — the Brain lives in the agent's cloud workspace, located by ID/marker; only if the
cloud has none, run **Realtor AI Brain — Setup**. Then read `~/realtor-brain/identity/publishing.md` for the
connected method (Metricool / GoHighLevel / Buffer / manual) and platforms. This skill is written for
**Metricool** (the default); on **GoHighLevel or Buffer** the same four jobs apply — do what that connector
allows and say so plainly. If the method is "manual" or unset, offer to connect one (Job A).

## Job A — Connect & health-check  ("check my metricool" / "connect my metricool")
The connection checklist in plain words — these are the things that silently break auto-posting when skipped:
1. **Connected to Claude?** If not, walk the **one-click Metricool sign-in** (per publishing-guide — standard
   browser OAuth, no keys or tokens). Confirm success with `getBrandSettings` (it returns the brand, the
   connected networks, and the timezone).
2. **Which networks are linked?** From `getBrandSettings`, confirm Instagram / Facebook / TikTok / YouTube are
   connected inside Metricool. Name any that are missing and point them to connect it in Metricool once.
3. **Instagram = Business or Creator?** Required to auto-publish. If IG posts only send reminders, their
   account is personal — tell them to switch (free: Instagram Settings → Account type).
4. **Google Drive linked in Metricool?** Required for videos to attach automatically (Metricool → Settings →
   Google Drive). Without it, video posts use the hybrid path (caption + time scheduled, agent drops the video).
5. **Free-plan cap?** Metricool Free = **20 scheduled posts/month + 1 brand.** If they'll post more than that,
   flag **Starter (~$20/mo, unlimited)** — never let them silently hit the cap.

Deliver a simple **green/red checklist** + the one or two things to fix. Save any change (e.g., the method) to
`publishing.md` and push the Brain.

## Job B — See & manage the queue  ("what's scheduled" / "move my post" / "space these out")
1. Pull the queue with `getScheduledPosts` (the date range they asked for — this week / this month).
2. Show it plainly: **date · time · platform(s) · the post in one line.** A simple calendar list, never raw data.
3. Edit on request with `updateScheduledPost`: **move** a post to a new day/time, or **space out** a cluster
   (don't stack five in one hour). To **remove** a post, use the connector's delete if available — otherwise
   tell them plainly to delete it in the Metricool app (the connector may be create/update only).
4. **Confirm before removing anything** — show exactly what will be removed and get a yes (it's irreversible).
5. Keep cadence sane: flag if a day is overloaded or a week is empty.

## Job C — Verify delivery + fix failures  ("did my posts go out" / "why did this fail")
1. Pull recent posts with `getScheduledPosts` and read each one's **status** (scheduled / published / failed).
2. Report plainly: what **published**, what's still **queued**, and **anything that failed.**
3. For a failure, give the likely cause in plain words + the fix — the usual suspects:
   - **IG post failed** → personal account (switch to Business/Creator) or an expired connection (reconnect).
   - **Video didn't attach** → Google Drive not linked in Metricool (Job A #4) → reschedule via the hybrid path.
   - **Nothing after a certain date** → hit the Free-plan monthly cap (Job A #5).
4. Offer to **reschedule** a failed post — hand it to `shortform-publish` if it needs rebuilding.
**Never say "all posted" without actually reading the statuses.**

## Job D — Set best-time posting slots  ("set my best times" / "when should I post")
1. Pull `getBestTimeToPostByNetwork` for their connected networks.
2. Turn it into a simple standing weekly plan in plain words (*"your reels do best Tue/Thu ~6pm and Sat ~10am"*).
3. Offer to use these as the default whenever they schedule (publish / batch-publish read the same best-time
   data). Save the plan note to `publishing.md` if useful; push the Brain.

## Golden rules
- **Manage only** — this skill never creates or writes new content, and only ever touches the agent's **own**
  connected account.
- **Confirm before removing** anything from the queue; deletions are irreversible.
- **Never claim a post published** without reading its real status (Job C).
- Plain language throughout — no tool names or "API" talk to the agent (house rules #1).

## Quality checklist
- [ ] Loaded the Brain (pulled first if empty) + read `publishing.md` for the connected tool
- [ ] Health check covered the 5 silent-breakers (connected · networks · IG Business · Drive-linked · free cap)
- [ ] Queue shown as a plain calendar; edits confirmed; **removals confirmed before deleting**
- [ ] Delivery verified from real statuses — failures named with a plain cause + the fix
- [ ] Best-time slots given as a simple plan, not raw data
- [ ] Handed off create / batch / performance to the right skill — no overlap
- [ ] Talked plainly; saved any connection or plan change to the Brain and pushed
