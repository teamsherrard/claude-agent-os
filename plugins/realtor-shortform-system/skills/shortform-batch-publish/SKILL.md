---
name: shortform-batch-publish
description: >
  The hands-off publishing department. The agent points at a Google Drive folder of FINISHED content
  (edited shorts, long-form videos, carousels, graphics) and this handles everything between "it's edited"
  and "it's live": it reads each piece to know what it's actually about, writes the platform-native package
  for each (caption, hashtags, title per platform — Instagram, Facebook, TikTok, YouTube Shorts/YouTube —
  in the agent's voice), pulls their best times to post from Metricool, and schedules the whole batch into
  the Metricool queue — the next 5, 10, two weeks, or a full month in one sitting. The agent reviews the
  queue once and approves; nothing goes live without a yes. Builds on shortform-optimizer + the Metricool
  scheduler (publishing-guide). Metricool by default; GoHighLevel / Buffer also work.

  Trigger on: "publish my content folder", "schedule my finished videos", "schedule everything in this
  folder", "point at my Drive folder", "batch schedule my content", "schedule my month of content",
  "queue up my month", "publish this batch", "hands-off publishing", "schedule my edited shorts", or any
  request to publish/schedule a whole folder or batch of finished content at once.
---

# Batch Publish (the publishing department)

Drive folder of finished content in → a scheduled month out, at the agent's best times, with one review.
This is the "month of shorts scheduled in one sitting" homework, as a single command.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — plain and warm, never technical —
and **Mike's frameworks** (`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md`): 4-3-2-1 balance, HVC-style
hooks in captions, **3–5 hashtags max**, per-platform packaging, CTA that doesn't always sell.

**Golden rule (never break it):** this schedules a lot at once, so the agent **reviews the full queue and
approves ONCE before anything is scheduled.** Never queue a post without that yes.

---

## Before you batch — the hands-off prerequisites (check once, up front, in plain words)
A truly hands-off month only works if these are true. Confirm them kindly at the start — don't spring them at post #21:
1. **A posting tool is connected** (`identity/publishing.md`). If not → run **shortform-setup** first, or take the manual path (hand over the packages).
2. **Metricool can actually reach the videos.** Metricool attaches media from a **public URL** OR from a **Google Drive account linked inside Metricool** (Metricool → Settings → connect Google Drive, one time). A raw Drive *share* link is **not** public, so without that Drive-in-Metricool link Metricool can't pull the files from the folder. No link → use the **hybrid path** (schedule caption + time; the agent drops each video in the Metricool app), or have them link Drive once for true hands-off.
3. **Accounts are set for auto-publish.** Instagram must be a **Business/Creator** profile (a personal IG gets a *reminder*, not an auto-post), and TikTok/YouTube connected. Otherwise "hands-off" quietly becomes a stack of manual reminders — say so before scheduling 30 of them.
4. **Plan reality.** Metricool **Free = 20 posts/month, 1 brand.** A real month of daily content across platforms blows past 20 fast, so a full-month batch needs **Starter (~$20/mo, unlimited publishing)**. Set this expectation the moment they ask for "a month."

---

## Step 1 — Point it at the folder + load context
- **The folder:** the agent names it or pastes the Drive link ("my Reels folder," "October content").
  If they don't specify, ask once, simply. List the folder's files via the Drive connector.
- **Load the Brain:** `~/realtor-brain/brain.md`, then `identity/voice.md` + `voice-samples.md` (voice),
  `profile.md` + `market.md` + `avatars.md` (who/where), `offer.md` (lead magnets for CTAs),
  `content-engine.md` (platform priority), `compliance.md` (the third law), and
  `identity/publishing.md` (which tool is connected + platforms). If no posting tool is connected, send
  them to **shortform-setup** first (or offer the manual path — hand over the packages to post themselves).
- Check `memory/content-log.md` — you'll match files to it in Step 2, and you'll write back to it in Step 6.

## Step 2 — Understand each piece (transcript + visuals) — no generic captions
For every file, you must actually know what it's about before you caption it. Work the transcript ladder,
best source first:
1. **It's ours →** match the file to `memory/content-log.md` / the `Short-Form System/Content` folder. If
   the system scripted it (green screen / talking head / carousel), the script/talking points **are** the
   transcript — use them. (Most of the pipeline lands here — no transcription needed.)
2. **Sidecar transcript →** a `.txt` / `.srt` / `.vtt` (or a Descript-exported transcript) next to the
   video — read it.
3. **Transcribe it →** if a transcription tool/connector is available, get the transcript; otherwise read
   the audio/opening frames + any on-screen text to determine the topic.
4. **Still unsure →** **ask the agent for a one-line description of that specific video.** Never write a
   caption from just the filename, and never fabricate what a video "probably" says.

Also note, per file: the **type** (short vertical / long-form horizontal / carousel / graphic), the
**format** (green screen / talking head / tour / story), and its **funnel role** (reach / value / trust /
conversion — Mike's 4-3-2-1), so the batch stays balanced.

## Step 3 — Write the per-platform package for each
For each piece, produce its package by applying
`${CLAUDE_PLUGIN_ROOT}/skills/shortform-optimizer/references/platform-rules.md` — in the agent's voice,
naming the local market, **3–5 hashtags**, CTA matched to the funnel role (real lead magnet from
`offer.md` when it warrants one). Route by type:
- **Short vertical** → Instagram Reels + Facebook, TikTok, YouTube Shorts (caption/hashtags; Shorts title/desc/tags).
- **Long-form horizontal** → **YouTube** (search-led title + description w/ chapters + tags) — not Shorts.
  (If the YouTube System plugin is installed, defer to its SEO for long-form.)
- **Carousel / graphic** → Instagram + Facebook (caption + hashtags). Carousels aren't a TikTok/Shorts format.
Run every caption/description through `compliance.md` (disclaimer/license where required; Fair-Housing-safe).

## Step 4 — Best times + build the schedule
- Pull the agent's **best times per network** from the connector (Metricool: `getBestTimeToPostByNetwork`).
- **How much to schedule:** whatever the agent said — "the next 5," "10," "two weeks," "a month," or the
  whole folder. Spread the pieces across days into best-time slots per Mike's cadence (daily is the goal,
  3×/week the floor); **never stack** several in one hour. Keep the 4-3-2-1 mix balanced across the run —
  if the folder is lopsided (e.g. all home tours = agent-bait), say so and suggest what's missing, but
  don't block.
- **Free-plan cap:** Metricool Free = **20 posts/month** (flagged in the prerequisites). If the batch
  would exceed it, never silently drop posts — trim to the strongest, post to fewer platforms, or
  recommend Starter (~$20/mo, unlimited).

## Step 5 — ONE review + approval (the whole point)
Save the proposed queue as a clean **content calendar** the agent reviews in one place, per
`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` — to
`[Agent Name] — Short-Form System/Content/[YYYY-MM · Month]/[YYYY-MM-DD] · Publishing Queue`. For each
piece show: the file, what it is, the platforms, the date + time, and the caption preview. Then, in chat,
give the plain-language summary and ask for the go:
> *"Here's your month — 14 posts across the next 3 weeks at your best times. Give it a look; want me to
> load it all into Metricool?"*
**Wait for the yes.** If they tweak (swap a time, drop one, change a caption), adjust and re-confirm.

## Step 6 — Schedule the batch + log
On approval, schedule each piece via the connected tool (`publishing-guide.md`): Metricool
`createScheduledPost` at its slot, attaching each file the way Metricool accepts it — a **public URL** or
a **Google-Drive-linked-in-Metricool** file (per the prerequisites above). If Metricool can't reach a
file, use the hybrid fallback: schedule the caption + slot and have the agent drop that video in the app. Then:
- If any fail, report exactly which scheduled and which need a second look — never claim all done if not.
- Append a `Scheduled` row per piece to `memory/content-log.md` (date + platforms) and push to Drive.
- **Mirror the batch on the content board** (house rules #10 — quietly skip if no board): each piece gets its
  card (match by System ID first — long-form videos from the YouTube system are usually ALREADY seeded cards;
  update those, never duplicate) with its Publishing Date set to the scheduled slot. Status stays as-is until
  it actually goes live — scheduled is not `Published`.

## Step 7 — Confirm
Plain summary + where it lives:
> *"Done ✅ — 14 posts scheduled through [date], all at your best times. Your queue is in Metricool, and
> the calendar's saved to your Drive → Short-Form System → Content → [month]. You're set for the month."*

---

## Quality checklist
- [ ] Read every piece for real (content-log match / sidecar transcript / transcription / asked) — zero generic captions
- [ ] Each package is per-platform, in the agent's voice, 3–5 hashtags, CTA matched to funnel role
- [ ] Type-routed correctly (shorts → Reels/TikTok/Shorts; long-form → YouTube; carousel/graphic → IG+FB)
- [ ] Scheduled at best times, spaced out; 4-3-2-1 balance kept (flagged if the folder was lopsided)
- [ ] Free-plan cap respected (flagged, never silently dropped)
- [ ] Full queue saved as a calendar doc + **approved once** before anything was scheduled
- [ ] Every piece logged to `content-log.md`; failures (if any) reported honestly
- [ ] Board mirrored (if they have it): every piece carded per house rules #10, System-ID matched (no duplicates), scheduled ≠ Published
- [ ] Compliance pass on every caption; talked plainly throughout
