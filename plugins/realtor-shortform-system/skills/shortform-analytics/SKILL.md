---
name: shortform-analytics
description: >
  The data + insights layer for the Short-Form Content OS. Pulls the agent's real performance from their
  connected tool (Metricool by default, or GoHighLevel) and turns it into plain-English insight — not a
  number dump. Handles any "analyze / how did it do / what's my data" request: "analyze my last 10 posts,"
  "analyze my ads," "how did my reels do," "how's my follower growth," "what's my best post this month,"
  "how did this post do." Also runs the structured 2-week performance review that records what worked to
  the agent's Brain so the next round of content leans on it.

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
- Read `~/realtor-brain/brain.md`, then `identity/publishing.md` (which tool is connected),
  `memory/content-log.md` (to map each post back to its format / category / hook / topic — the numbers
  mean little without knowing what the post *was*), `identity/offer.md` (lead-magnet CTAs, for conversion
  read), and `identity/voice.md` (tone).
- The connected tool provides the numbers: **Metricool** (default) or **GoHighLevel**. If no analytics
  connector is set up, say so kindly and offer the fallback: the agent pastes a screenshot or their
  numbers and you analyze those (vision works fine) — the system is never blocked on the connector.

## Step 2 — Read the metrics guide
**Read `references/metrics-guide.md`** — what each metric actually tells you, how to turn it into advice,
and the structure of the 2-week review.

---

## Mode A — Ad-hoc analysis (most requests)
For "analyze my last 10 posts," "analyze my ads," "how did my reels do," "what's my data," etc.:

1. **Pull what they asked for** from the connected tool. On **Metricool**, the flow is:
   `getBrandSettings` (get the **brandId**) → `getAnalyticsAvailableMetrics` (discover which metric field
   IDs exist for their connected networks — e.g. Instagram reach, reel plays, saves, follower growth, and
   **ads** metrics if they run ads) → `getAnalyticsDataByMetrics` (brandId + date range `from`/`to` + the
   metric IDs) to pull the actual numbers. Use `getBestTimeToPostByNetwork` for timing questions. (On
   GoHighLevel, use its social statistics tool instead.) Pick the metrics that match the request:
   - posts / reels / videos performance (views, plays, watch time, saves, shares, comments, reach)
   - account/profile metrics (followers, profile visits, growth)
   - **ads** performance (spend, reach, results, cost-per-result) — for "analyze my ads"
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
   category (awareness/trust/authority/conversion) · best format (green screen/talking head/carousel) ·
   best hook · CTA performance (what drove DMs/leads) · what to make more of · posts worth remaking.**
3. **Write it to the Brain** — append a dated block to `~/realtor-brain/memory/performance.md` (create the
   file if it doesn't exist), then push to Drive. This is what makes the system get smarter: the planner
   and the content workflows read the latest `performance.md` so the next round leans on what worked.
4. Tell the agent the 3-sentence version + the one thing to do more of next.

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
- [ ] Joined numbers to what the post *was* (format/category/hook from `content-log.md`)
- [ ] Led with plain-English insight + the *why*, not a number dump
- [ ] Ended with a clear recommendation and offered to act on it
- [ ] 2-week review (if run) written to `memory/performance.md` and pushed to Drive
- [ ] Honest about thin/noisy data; encouraging in tone
