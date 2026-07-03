# Publishing Guide — schedule + post (bring your own platform)

How the system actually gets a finished post onto the agent's socials, once they've connected a posting
tool. Every workflow calls this at its "want me to schedule this?" step. Apply house rules — talk plain.

---

## The golden rule — never post without approval
**Never schedule or publish anything without showing the agent the post and getting an explicit yes.**
No silent auto-posting, ever. Show what you'll post, where, and when — then wait for "go."

---

## Step 1 — Which tool? (read the Brain)
Read `~/realtor-brain/identity/publishing.md` for the agent's posting method (set during setup):
- **GoHighLevel** — they already use it; post through its Social Planner.
- **Metricool** — the default for everyone else.
- **Buffer** — fallback.
- **Manual** — no connector; hand over copy-paste-ready posts (most agents start here). Always valid.

If `publishing.md` says manual or is missing, just deliver the post for copy-paste and (gently, once)
mention they can connect a tool anytime to have you schedule for them. Don't nag.

---

## Route A — Metricool (default)
Connector: **`https://ai.metricool.com/mcp`** — one-click browser sign-in (standard OAuth; no API keys,
no tokens to paste). Works on any Metricool plan, including free.

Use the connected Metricool tools (call them by these names — your connection exposes them):
1. **`getBrandSettings`** — get the agent's brand (you need its **blogId/brandId** to schedule, and the
   **timezone** for the post time). Confirm which brand + connected networks.
2. **`getBestTimeToPostByNetwork`** — if the agent didn't give a time, pull the best slot per network and
   schedule into it (daily green screen benefits most).
3. **`createScheduledPost`** — schedule the post: pass the `date` (ISO 8601 with the brand's timezone),
   the `blogId`, and the `info` object (text, `providers` = the networks, and `media`). **`media` accepts
   public URLs to image OR video files** — so a Reel/TikTok/Short schedules with the agent's video by URL
   (Google Drive/Dropbox links auto-upload if the agent linked them in Metricool). Per-network must-haves:
   Instagram/TikTok need ≥1 image or video; Reels & Facebook Reels need a video; YouTube needs a video +
   title + `madeForKids`; X ≤280 chars (don't split into threads); Bluesky ≤300. Set `autoPublish` true.
4. **`getScheduledPosts`** / **`updateScheduledPost`** — list or change what's queued (e.g. "move it to 2pm").

**Free-plan guardrail:** free caps at **20 posts per calendar month** (counted when published — resets
on the 1st; queuing ahead is fine) and **3 months of analytics history**. If a month would exceed 20,
say so plainly and offer to post to one platform, or suggest the cheap Starter upgrade. Never silently
drop posts.

**Platforms:** Instagram, Facebook, TikTok, YouTube Shorts (+ LinkedIn, X, Threads, Pinterest, Bluesky,
GBP). Account-type reminders still apply (Instagram needs a Business/Creator profile to auto-publish).

---

## Route B — GoHighLevel (for agents who already use it)
Connector: **`https://services.leadconnectorhq.com/mcp/`**, authenticated with a **Private Integration
Token + Location ID** (the agent creates a PIT in their GHL sub-account → Settings → Private Integrations,
with the `socialplanner/*` scopes, and provides the token + location once). Reliable on the Unlimited
($297) plan or higher. Use the **Social Planner** tools to create/schedule posts and pull statistics.
Posts to IG/FB/TikTok/YouTube/GBP/LinkedIn/X; GHL handles the platform connections. Same approval rule.

---

## Route C — Buffer / manual
- **Buffer:** connector `https://mcp.buffer.com/mcp` (OAuth), $5/channel; create/queue posts. Thinner
  analytics — fine as a fallback.
- **Manual:** deliver the copy-paste-ready post (it's already formatted per platform). Done.

---

## Media / video handling
Reels/TikToks/Shorts are videos, so the schedule call needs the agent's video.
- **Path A (full — Metricool default):** Metricool's `createScheduledPost` takes `media` as **public
  URLs to image or video files**, so pass the agent's video URL and the complete post schedules. This is
  confirmed and the default path. The agent's video needs to live at a public URL (or a linked Google
  Drive/Dropbox link, which Metricool auto-uploads).
- **Path B (hybrid — fallback):** if the agent's video ISN'T at a shareable URL (it's only on their
  phone), schedule the **caption + platform + best-time slot** and tell them plainly: *"Caption and time
  are set — just open Metricool on your phone and drop your video onto it."* Still a big time-save.

Carousels: schedule with the image set if the tool supports it; otherwise hybrid (caption + slot, agent
adds the slides they built in claude.ai/design).

---

## After scheduling
- Confirm in plain language: *"Done — I scheduled 3 posts: your green screen tomorrow 5:10pm, the buyer
  talking head Thursday 12pm, and the carousel Saturday 9am. Want to change any?"*
- **Log each to the Brain:** update its row in `~/realtor-brain/memory/content-log.md` to `Scheduled`
  with the date/platform, then push to Drive.

## Measuring later
The same connector pulls performance (Metricool + GHL both expose analytics). The 2-week performance
review and any "how did my posts do?" ask are handled by the **`shortform-analytics`** skill — it reads
the connector and writes winners to `~/realtor-brain/memory/performance.md` so the next round of content
leans on what worked. Route those requests there instead of pulling numbers ad hoc.
