# Short-Form OS — Publishing & Analytics Layer (v0.1)

How a realtor goes from *talking to Claude* to *content scheduled on their real social accounts,
with real analytics flowing back* — without ever touching an API key.

The mechanism: a social-publishing tool's **remote MCP server**, added once in Cowork as a custom
connector (OAuth sign-in). The tool holds the platform connections and has already passed
Meta/TikTok's app audits — the thing that makes direct platform APIs impossible for individual
agents. Claude calls the tool's functions from plain conversation.

All vendor facts below verified 2026-06-12 against official docs.

---

## 1. The decision

**Bring-your-own-platform — never force a new tool.** Pick the rail per agent:

| Role | Tool | Why |
|---|---|---|
| **For agents who already use it** | **GoHighLevel** | Official MCP **now includes the Social Planner** (6 tools: create/edit/get post(s), get-account, get-statistics) → IG/FB/TikTok/YouTube/GBP/LinkedIn/X, video/Reels supported, GHL handles the platform app-review. Analytics via `get-social-media-statistics`. Many realtors already pay for GHL → zero new platform. (See §7.) |
| **Default for everyone else** | **Metricool** | Official remote MCP works on every plan incl. Free; richest analytics in Claude (per-post metrics, best-time-to-post, competitor tracking); realtors know the brand; Starter $20–25/mo realistic; Advanced ≈ $3/client/mo if we run posting for clients |
| Optional add-on | **Blotato** ($29/mo) | AI faceless-video generation (~178 videos/mo) for agents who won't film. NOT a backbone: analytics not in MCP yet; weak agency model |
| Fallback | **Buffer** | Official MCP (since 2026-05-27), OAuth, free plan works, $5/channel/mo. Thin analytics |
| Manual | none | Claude hands over copy-paste-ready posts; agent posts themselves. Always available |
| Watchlist | **Zernio** (ex-Late) | Full white-label + per-account pricing (~$6/acct) + deepest analytics MCP — for a future branded "Social OS" product |

Ruled out: Zapier/Make (no TikTok posting), direct Meta/TikTok/YouTube APIs (per-developer app
review + business verification; unaudited TikTok apps can only post private videos), Meta/TikTok
official MCPs (ads-only as of spring 2026), Hootsuite/Sprout (no posting MCP / enterprise pricing).

> **GoHighLevel — verified 2026-06-13.** Official MCP `https://services.leadconnectorhq.com/mcp/`,
> **36 tools incl. 6 Social Planner tools** (Social Planner MCP support marked Complete 2025-10-14).
> Auth = **Private Integration Token (PIT) + Location ID**, created in the sub-account's Settings →
> Private Integrations with `socialplanner/*` scopes — **not clean OAuth yet**, so in Cowork the agent
> pastes the PIT + Location ID into chat (token-in-prompt), or we later host a thin OAuth-fronting
> wrapper for one-click. API/MCP access is reliable on the **Unlimited ($297) plan or higher** (Starter
> $97 = "limited" API — UNVERIFIED whether PIT/MCP works there). Social Planner itself is included on
> all plans. Community GHL MCPs (BusyBee3333 520+ tools, mastanley13, drausal) exist if we ever need
> more than the official set. Net: "post through your existing GoHighLevel" is offerable today.

---

## 2. The gate: verification test

**Endpoint VERIFIED 2026-06-13** by probing `https://ai.metricool.com/mcp` directly:
- Live; returns a proper `www-authenticate: Bearer` challenge → standard MCP **OAuth 2.1**.
- Discovery (`/.well-known/oauth-protected-resource` + `/.well-known/oauth-authorization-server`) is
  fully formed: scopes `mcp:read` / `mcp:write`; **Dynamic Client Registration** (`/oauth/register`),
  `authorization_code` + `refresh_token`, **PKCE S256**, public-client (`none`) supported. This is exactly
  what Claude custom connectors auto-handle → **one-click browser sign-in, no API keys/tokens.**
- Official capabilities (Metricool help doc): "view and manage brands + social connections," "view and
  download metrics/analytics," **"view, create, and publish posts (scheduled and published)."**
- Plan: any, incl. **free** (free = 20 scheduled posts cap + 3-month analytics window).

**Both gates now RESOLVED** (connected 2026-06-13; tool schemas inspected directly):

1. ~~Does the OAuth connector flow complete?~~ → **Resolved** — standard OAuth DCR+PKCE; connected fine.
2. ~~Can the schedule tool attach VIDEO?~~ → **Resolved — YES.** `createScheduledPost`'s `info.media`
   field "accepts public URLs to image or video files," and the tool enforces per-network video rules
   (Reels/Facebook Reels need a video; IG/TikTok need ≥1 image or video; YouTube needs a video). So
   **Path A (full hands-off) is the default** — schedule a Reel/TikTok/Short with the agent's video by
   URL. Path B (hybrid) only applies if the video isn't at a shareable URL.

**Verified tool surface (Metricool MCP):** `getBrandSettings` (brandId + timezone), `getBestTimeToPostByNetwork`,
`createScheduledPost`, `getScheduledPosts`, `updateScheduledPost`, `getAnalyticsAvailableMetrics`,
`getAnalyticsDataByMetrics` (brandId + from/to + Data-Studio metric IDs). Wired by name into
`shared/publishing-guide.md` and `shortform-analytics` (bare names — the connection's server-id prefix
varies per user, so skills reference the tools by name only).

### Quick live check (≈10 min in Cowork, once connected)
Add custom connector → `https://ai.metricool.com/mcp` → sign in. Then: "list my Metricool brands" →
"best time to post on Instagram this week" → "schedule a TikTok for tomorrow 10am with this video: [URL]"
(← the media test) → "pull my Instagram metrics, last 30 days" → delete the test post in Metricool.

### Setup (10 min)
1. Create a free Metricool account (or use an existing one) → add one **test brand**.
2. In that brand, connect at least **Instagram** (must be a Business or Creator profile) and
   ideally **TikTok** (personal account is fine — TikTok direct-publish works for both).
3. Have a short test video (any 10-sec clip) uploaded somewhere with a public URL
   (Google Drive share link set to "anyone with link", or any hosted mp4).

### Connect (5 min)
4. Cowork → Settings → Connectors → **Add custom connector** →
   - Name: `Metricool`
   - URL: `https://ai.metricool.com/mcp`
5. Complete the OAuth sign-in in the browser tab that opens. ✅ **PASS #1** if the connector
   shows connected and its tools appear.

### Exercise the tools (15 min) — type these prompts verbatim
| # | Prompt | Expect (tool) | Pass criteria |
|---|---|---|---|
| 1 | "List my Metricool brands" | `get_brands` | Test brand returned |
| 2 | "What's my best time to post on Instagram this week?" | `get_best_time_to_post` | Day/hour heatmap-style answer |
| 3 | "Schedule a TikTok post for tomorrow 10am, caption 'MCP test — ignore', using this video: [URL]" | `post_schedule_post` | **Post appears in Metricool's planner WITH the video attached** |
| 4 | "Move that test post to 2pm" then "Show my scheduled posts" | `update_schedule_post`, `get_scheduled_posts` | Time updated, post listed |
| 5 | "Pull my Instagram metrics for the last 30 days" | `get_metrics` / `get_analytics` | Real numbers (free plan window is short — 30d is safe) |
| 6 | Delete the test post in the Metricool app | — | Cleanup |

### Decision branches
- **All pass →** build Path A (full hands-off): Claude schedules complete posts, video included,
  at best-time slots.
- **#3 fails on media only →** Path B (hybrid): Claude schedules everything *except* the file —
  caption + platforms + best-time slot as a draft; the realtor opens the Metricool mobile app and
  drops the video in. Still a massive win. Optionally route video-heavy posts through Blotato
  (its MCP has a presigned media-upload tool; note Cowork egress may block uploads to
  `database.blotato.io` — public `mediaUrls` are the safe pattern).
- **OAuth/connector fails entirely →** retest with Buffer (`https://mcp.buffer.com/mcp`,
  documented OAuth custom connector on every plan) to isolate whether the problem is Metricool
  or Cowork, then decide rail.

Record results at the bottom of this doc.

---

## 3. Realtor onboarding copy (draft — becomes part of setup/Phase 8)

> ### Connect your posting account (one time, ~10 minutes)
> Your AI schedules content through **Metricool** — a free social media tool that connects to
> your Instagram, TikTok, and YouTube once, so Claude can do the rest forever.
>
> **Part A — Metricool (one time)**
> 1. Go to metricool.com and create a free account.
> 2. It will ask you to connect your socials. Connect Instagram (you need a free Business or
>    Creator profile — Settings → Account type in the Instagram app), TikTok, and YouTube.
> 3. That's it. You never need to open Metricool again if you don't want to.
>
> **Part B — Give Claude the keys**
> 1. In Claude, open Settings → Connectors → Add custom connector.
> 2. Name it `Metricool`, paste this address: `https://ai.metricool.com/mcp`
> 3. Sign in with your Metricool account when the browser opens. Done.
>
> **Now you can just say things like:**
> - "Schedule this week's posts at my best times."
> - "When do my followers actually see my content?"
> - "How did my reels do the last two weeks? What should I make more of?"
>
> Claude will always show you the full plan and wait for your OK before anything gets scheduled.
>
> 💡 The free Metricool plan covers your trial (20 scheduled posts/month). Once you're posting
> the full system across 3 platforms, upgrade to Starter (~$22/mo) — that's the whole cost of
> your posting infrastructure.

Compliance note for the wizard: remind the agent their brokerage rules still apply; every caption
passes through `identity/compliance.md` before scheduling (third law).

---

## 4. Skill wiring spec

### 4.1 Brain contract additions
- **`identity/publishing.md`** (new, written by setup): Metricool brand name/ID, connected
  platforms + account types (IG Business? TikTok personal?), approval preference, preferred
  posting windows if the agent has any, plan tier (free/Starter → posts/mo budget).
- **`memory/performance.md`** (new, written by analytics): one table per cycle —
  `| cycle end | post | category (4-3-2-1) | format | hook style | platform | views | saves | comments | DMs/leads | verdict |`
  plus a 3-line "what to do more of" summary. The planner reads the latest cycle's summary.
- `memory/content-log.md` (existing): publish phase appends Status `Scheduled` + scheduled
  datetime + platforms (and Metricool post id if returned).

### 4.2 `shortform-planner` — add Phase: Publish (after approval)
1. Plan approved → call `get_best_time_to_post` per platform → assign each of the 10 posts a slot
   (respect 4-3-2-1 pacing: never two Conversion posts adjacent; spread categories across the
   2 weeks).
2. For each post: captions come from the platform-optimizer step — **one variant per network**
   (TikTok caption must avoid line breaks — the TikTok API strips them; IG caption carries the
   save/share + DM-keyword CTA; Shorts gets a search-friendly title).
3. Call `post_schedule_post` per post (multi-platform where the content is identical; per-network
   where variants differ). Media: per test Path A (attach URL) or Path B (draft, agent drops file).
4. Show the final scheduled calendar; write back to `content-log.md`.
5. **Guardrails:** never schedule without explicit plan approval in this conversation; never
   touch posts the system didn't create; compliance pass on every caption before step 3;
   if the brand is on the free plan and the cycle needs >20 scheduled posts, say so and offer
   the single-platform fallback or Starter upgrade.

### 4.3 `shortform-analytics` — MCP-first, screenshots as fallback
1. Pull the cycle: `get_metrics`/`get_analytics` + per-network detail (`get_instagram_reels`,
   `get_tiktok_videos`, `get_youtube_videos`).
2. Join against `content-log.md` (match scheduled posts → published posts).
3. Classify winners/losers by category × format × hook style; produce the review (best post,
   weakest, best category, best format, best hook, CTA performance, next-cycle recommendations,
   posts worth remaking).
4. Optional depth: `get_network_competitors_posts` — "what's working for other agents in
   [city]" → feeds next plan's Awareness ideas.
5. Write `memory/performance.md`; tell the agent the 3-sentence version.
6. **Fallback path stays:** no connector / data too thin → accept screenshots or pasted numbers
   (vision parse), same write-back. The system must never be blocked by the connector.

### 4.4 Setup wizard (Phase 8 or part of shortform setup)
Detect connector → if missing, walk through §3 copy → verify with `get_brands` → write
`identity/publishing.md` → hand back.

### 4.5 Optional Blotato lane (later, behind its own setup)
For agents who want faceless content: `blotato_create_visual` (template video from script) →
review → schedule via Metricool (or Blotato's own scheduler). Separate skill; requires their
$29 plan; do not make it a dependency of the core system.

---

## 5. Cost summary (per realtor)

| Stage | Tooling cost |
|---|---|
| Trial / first cycle | $0 (Metricool Free — 20 scheduled posts ≈ one cycle on one platform) |
| Full system (3 platforms × 10 posts/cycle ≈ 60 scheduled/mo) | Metricool Starter **$20–25/mo** |
| + AI faceless videos (optional) | + Blotato $29/mo |
| Agency-managed alternative (us posting for them) | Metricool Advanced $53–159/mo ÷ 15–50 brands ≈ **$3/client/mo** (Custom = white-label) |

---

## 6. Test results log

| Date | Tester | Cowork OAuth | Media attach (#3) | Verdict / notes |
|---|---|---|---|---|
| — | — | — | — | — |
