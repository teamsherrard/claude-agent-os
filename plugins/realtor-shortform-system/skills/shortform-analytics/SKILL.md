---
name: shortform-analytics
description: >
  The data + insights layer for the Short-Form Content OS. Pulls the agent's real performance — from their
  live data connection (Instagram + YouTube, the deepest source, the only one that returns reel watch-time
  and skip-rate) or their scheduler (Metricool / GoHighLevel) — and turns it into plain-English insight, not
  a number dump. Handles any "analyze / how did it do / what's my data" request: "analyze my last 10 posts,"
  "analyze my ads," "how did my reels do," "how's my follower growth," "what's my best post this month,"
  "how did this post do." Also runs the structured 2-week performance review that records what worked to the
  agent's Brain so the next round of content leans on it. (For an exhaustive competitor + own-account
  breakdown, that's `shortform-deepdive` — this skill is the everyday read and the 2-week loop.)

  Trigger on: "analyze my posts", "analyze my last [N] posts", "analyze my ads", "how did my reels do",
  "how's my account doing", "what's my data", "tell me my numbers", "my best post", "how did this post
  do", "follower growth", "what's working", "run my 2-week review", "review my performance", or any
  request to analyze short-form performance, ads, or social data.
---

# Analytics & Insights

The agent's data brain. They ask in plain English; you pull the real numbers from their connected tool and
tell them what it *means* and what to do next — like a short-form coach reading the data with them, not a
dashboard.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) and the advisor stance
(`${CLAUDE_PLUGIN_ROOT}/shared/advisor-playbook.md`): interpret, don't dump. Every analysis ends with a
plain takeaway and a recommendation.

---

## Step 1 — Load the Brain + find the data source
**If `~/realtor-brain/` is empty** (a fresh session, or a different project), pull it first with
**realtor-brain-sync** — the Brain lives in the agent's cloud workspace (Google Drive or OneDrive) and syncs
down, located by ID/marker (never folder name); only if the cloud has none, run **Realtor AI Brain — Setup**.
- Read `~/realtor-brain/brain.md`, then `identity/publishing.md` (which tool is connected),
  `memory/content-log.md` (to map each post back to its format / category / hook / topic — the numbers
  mean little without knowing what the post *was*; newer rows carry a `· [funnel: …]` tag in the
  Topic/Angle cell — read the category from it, and infer from the topic for older untagged rows),
  `identity/offer.md` (lead-magnet CTAs, for conversion read), and `identity/voice.md` (tone). Also read
  `memory/performance.md` if it exists — its last block holds the **prior follower/subscriber counts** you
  subtract from today's to get growth (the APIs return a point-in-time count, not a delta).
- **Pick the data source, best-first** (use what's connected — never block on any one):
  1. **The live data connection (Instagram + YouTube)** — the deepest source and the only one that returns
     **reel watch-time + skip-rate + demographics.** If the Composio tools are present in the session, prefer
     it for organic IG/YT reads. **Read `${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md` §7** for the
     exact read recipes, metrics, and account gates (Business/Creator IG, ≥1,000 followers for per-media
     insights, YT gives counts not watch-time). READ-ONLY — never call a write/DM/comment tool.
  2. **Metricool** — one call covers all platforms at once, plus **ads** and best-time. Use it for a fast
     cross-platform pulse, for **"analyze my ads"** (the live connection doesn't do ad spend), or whenever the
     live connection isn't set up.
  3. **GoHighLevel** — if that's their tool, use its social statistics.
  4. **Screenshot / paste fallback** — if nothing analytics-capable is connected (or they're Buffer-only),
     say so kindly and have the agent paste a screenshot or their numbers; vision works fine. **The system is
     never blocked on a connector.**
  - If both the live connection *and* Metricool are available, lead with the live connection for depth and
    reach for Metricool only for ads/best-time — don't pull the same organic numbers twice.

## Step 2 — Read the metrics guide
**Read `references/metrics-guide.md`** — what each metric actually tells you, how to turn it into advice,
and the structure of the 2-week review.

---

## Mode A — Ad-hoc analysis (most requests)
For "analyze my last 10 posts," "analyze my ads," "how did my reels do," "what's my data," etc.:

1. **Pull what they asked for**, from the source you picked in Step 1:
   - **Live connection (Instagram + YouTube)** — follow `composio-data-engine.md` §7. In short:
     `INSTAGRAM_GET_IG_USER_MEDIA` to rank the recent posts, then `INSTAGRAM_GET_IG_MEDIA_INSIGHTS` on the
     ones in question for `views / reach / saved / shares` **and reel `ig_reels_avg_watch_time` +
     `reels_skip_rate`** (the retention read Metricool can't give); `INSTAGRAM_GET_USER_INSIGHTS` for
     account reach / profile_views / accounts_engaged (+ demographics on request);
     `INSTAGRAM_GET_USER_INFO` + `YOUTUBE_GET_CHANNEL_STATISTICS` (`mine=true`) for follower/subscriber
     counts (growth = today's minus the last count in `performance.md`); `YOUTUBE_GET_VIDEO_DETAILS_BATCH`
     for Shorts stats. Never request `impressions` (use `views`); cast YouTube's string numbers.
   - **Metricool** — `getBrandSettings` (get the **brandId**) → `getAnalyticsAvailableMetrics` (discover the
     metric field IDs for their networks — reach, reel plays, saves, follower growth, and **ads** metrics if
     they run ads) → `getAnalyticsDataByMetrics` (brandId + `from`/`to` + the metric IDs). Use
     `getBestTimeToPostByNetwork` for timing questions. **"Analyze my ads" always comes from here** (spend,
     reach, results, cost-per-result) — the live connection doesn't do ad spend.
   - **GoHighLevel** — its social statistics tool. **Screenshot/paste** — read the numbers off what they send.
   - Either way, pick the metrics that match the request: post/reel performance (views, watch time, saves,
     shares, comments, reach), account metrics (followers, profile visits, growth), or ads (spend, results,
     cost-per-result).
2. **Join to what the post was** (from `content-log.md`) so you can talk format/category/hook, not just IDs.
3. **Interpret like an expert** (see `metrics-guide.md`): what's working, what's not, and *why* (weak hook
   vs weak topic vs wrong time vs weak CTA). Lead with the answer in plain English.
4. **End with a recommendation** — 1–3 concrete next moves tied to their content ("your timely green
   screens are your reach engine — do more; your carousels are getting saves but no DMs, so let's add a
   lead-magnet CTA"). Offer to act on it ("want me to build 3 more like your top one?").

Keep it human and short. A couple of clear sentences + the takeaway beats a table of every metric. Show
specific numbers only where they make the point.

## Mode B — The 2-week performance review (the loop)
For "run my 2-week review" / "review my performance" (and the natural cadence of the system):

1. Pull the last ~2 weeks across platforms; join to `content-log.md`.
2. Produce the review (full structure in `metrics-guide.md`): **best post · weakest post · best content
   category (reach/value/trust/conversion — Mike's 4-3-2-1) · best format (green screen/talking head/carousel) ·
   best hook · CTA performance (what drove DMs/leads) · what to make more of · posts worth remaking.**
3. **Write it to the Brain** — append a dated block to `~/realtor-brain/memory/performance.md` (create the
   file if it doesn't exist), then push to Drive. This is what makes the system get smarter: the content
   workflows read the latest `performance.md` so the next round leans on what worked.
4. **Save the readable report to Drive** following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` —
   the review as structured text, **rendered to a styled `.docx` via the shared renderer** (`render_doc.py`,
   output-standard §6) and uploaded to `[Agent Name] — Short-Form System/Performance/`, named
   `[YYYY-MM-DD–DD] · Performance Review`. (The `performance.md` block is the machine-readable memory; this
   doc is the readable one the agent + their VA review.)
5. Tell the agent the 3-sentence version + the one thing to do more of next, and where the report saved.

---

## How you talk about data (important)
- **Plain English first.** "Your rate-drop reel did 3× your usual views" — not "4,812 impressions vs a
  1,600 mean."
- **Always say what it means + what to do.** Numbers without a takeaway is a dashboard, and they can get
  that anywhere.
- **Be honest.** If two weeks is thin data or a spike was a fluke, say so — don't over-read noise.
- **Encourage.** Growth is slow; point out real progress and keep them going.

## Quality checklist
- [ ] Pulled the actual numbers (or used the agent's screenshot/paste fallback) — never made any up
- [ ] Used the deepest source available — on the live connection, read reel **watch-time + skip-rate** to
      judge whether the hook held, not just views
- [ ] Joined numbers to what the post *was* (format/category/hook from `content-log.md`)
- [ ] Growth (followers/subs) computed against the prior count in `performance.md`; today's count stored back
- [ ] Led with plain-English insight + the *why*, not a number dump
- [ ] Ended with a clear recommendation and offered to act on it
- [ ] 2-week review (if run) written to `memory/performance.md` and pushed to Drive
- [ ] Honest about thin/noisy data (and any account-gate limits, e.g. personal IG); encouraging in tone
