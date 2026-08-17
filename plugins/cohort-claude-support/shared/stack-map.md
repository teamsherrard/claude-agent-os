# Stack Map — Mike's system, plugin by plugin (Tier 1)

The concierge's brain: what each plugin does, the phrases that start it, what it depends on, how it
fails, and who fixes what. **Support routes here instead of answering "how do I make a reel" itself
— the system already has a skill for almost everything.**

## The 9 plugins at a glance

| # | Plugin | The job | Front door (say this) |
|---|---|---|---|
| 1 | **Realtor AI Brain** | The shared brain every system reads — install FIRST | "Set up my brain" |
| 2 | **AI Admin** (Agent Leverage OS) | Calendar, email drafts, client memory, daily admin | "Set up my AI Admin" |
| 3 | **YouTube System** | Game Plan → ideas → scripts → SEO → leads → repurposing | "Set up my YouTube system" |
| 4 | **Short-Form System** | Daily green-screen, talking-head, carousels, publishing | "Set up my short-form system" |
| 5 | **Lead Capture** | Lead magnet + opt-in funnel copy | "Build my lead magnet" |
| 6 | **AI Editor** | Directs Descript to edit long-form + reels on their account | "Set up my video editor" |
| 7 | **Listing Launch** | One address in → the whole listing launch out (8 stages) | "Launch my listing" |
| 8 | **Market System** | One command → the complete monthly market package | "Run my market update" |
| 9 | **Cohort Claude Support** | This plugin — help, fixes, teaching, escalation | "Help" / "I'm stuck" |

Install order for new members: 1 first (everything reads it), then 2–8 in any order as the cohort
reaches them. 9 anytime.

## The master router — "I want to ___"

| Member says (any variant) | Route to | Plugin |
|---|---|---|
| "Set up my brain" / first-time setup / onboard me | `realtor-brain-setup` | 1 |
| "Is my brain complete / what's missing" | `realtor-brain-health` | 1 |
| "Load / save / back up / restore my brain" · new computer | `realtor-brain-sync` | 1 |
| "Upgrade / migrate my brain" · after plugin updates | `realtor-brain-migrate` | 1 |
| "Update my offer / brand / profile / voice" | the matching phase skill (persona, offer-usp, brand-direction, voice-proof, voice-print, content-engine, operations, compliance) | 1 |
| "I have existing materials / read my Drive folder" | `realtor-import` | 1 |
| "I've got a video idea / just closed / add a vendor / market note" (on the go) | `realtor-capture` | 1 |
| "Build my business plan / how many deals do I need / am I on track" | `realtor-business-plan` | 1 |
| "Book a showing / consult" · "draft an email" · "what's my day" | `realtor-ai-admin` | 2 |
| "Give me video ideas" / "what should I film" | `youtube-ideation` | 3 |
| "Make this video" (one chosen idea → everything) | `youtube-make-video` (NEW chat: one chat = one video) | 3 |
| "Write my script" / "SEO for this" / "repurpose this" | `youtube-script` / `youtube-seo` / `youtube-repurpose` | 3 |
| "Audit my channel / coach me" | `youtube-coach` | 3 |
| "Plan a batch day / keep me consistent" | `youtube-consistency` | 3 |
| "My YouTube game plan" | `youtube-gameplan` | 3 |
| "Today's green screen" / "what should I react to" | `shortform-greenscreen` | 4 |
| "Talking-head scripts / topics to batch" | `shortform-talkinghead` | 4 |
| "Make a carousel" | `shortform-carousel` | 4 |
| "Schedule / post this" · "publish my folder of finished content" | `shortform-publish` / `shortform-batch-publish` | 4 |
| "How did my posts do / analyze my reels" | `shortform-analytics` | 4 |
| "Build my lead magnet" → then "build the funnel page" | `leadcapture-magnet` → `leadcapture-funnel` | 5 |
| "Edit my video" (any vague edit ask) | `editor-navigator` (it translates + routes) | 6 |
| ONE small video fix ("just add captions", "fix the caption font", "just trim the start") | `editor-quick` (cheap single pass — also the fix for off-brand captions/colors) | 6 |
| "Edit my YouTube video" / "make a reel from this" / "edit my listing tour" | `edit-longform` / `edit-shortform` / `edit-listing` | 6 |
| "Add b-roll" | `editor-broll` | 6 |
| "Just listed 14 Oak — start the content" / any new listing | `listing-intake` → `listing-launch` runs the stages | 7 |
| Anything for one property (description, social, video script, open house, postcards, sold post, photo tour) | the matching `listing-*` skill — property is entered ONCE via intake | 7 |
| "Run my market update [month]" | `market-run` (sequences everything) | 8 |
| "My market deck / script / infographic / shorts / distribution" | the matching `market-*` skill (research must run first — `market-run` handles order) | 8 |
| "Put my market update on autopilot" | `market-routine` | 8 |
| "Help" / "I'm stuck" / any Claude question or breakage | `support-navigator` | 9 |

Content boards: `youtube-board` and `shortform-board` share ONE Notion dashboard (bring-your-own
Notion, always optional).

## Per-plugin notes: dependencies & known failure modes

### Plugin 1 — Realtor AI Brain (the keystone)
- **Everything depends on this.** If any skill anywhere says brain files are missing → route
  `realtor-brain-setup` (never built) or `realtor-brain-sync` (built but this machine/session
  doesn't have it).
- **Sync is the #1 concept:** Cowork's local desk is wiped between sessions; the CLOUD copy is
  the permanent home — **Google Drive OR Microsoft OneDrive** (`config.md`'s "Storage provider"
  line says which; Microsoft-world agents run Outlook + OneDrive for the same jobs — check before
  saying "Drive" or "Gmail" to a member). Write → push → verify is atomic; reads are newest-wins;
  older cloud copies act as version history. "My brain lost everything" is almost always "run the
  sync pull," not data loss.
- **Migrate after updates:** plugins auto-update from the marketplace, brain DATA doesn't reshape
  itself. Skill reports schema-behind → `realtor-brain-migrate`.
- Compliance uses a **3-state placeholder rule** (set / empty-with-note / skip-and-flag) — an empty
  compliance file is a flagged state, not a bug.

### Plugin 2 — AI Admin
- Depends on: Brain (identity/operations/voice) + **Gmail + Google Calendar connectors** (or the
  Microsoft 365 connector for Outlook/OneDrive-world agents — same jobs, different cable).
- Known modes: wrong timezone shifts briefings/bookings (setup now reads the calendar's own
  timezone — re-run setup if briefing lands at odd hours); **never auto-sends** (drafts only) — a
  member saying "it didn't send my email" is usually the approval step working as designed.

### Plugin 3 — YouTube System
- Depends on: Brain + Google Drive (Videos folders). Notion optional (board). Analytics V1 = the
  member's CSV export from YouTube Studio — no API key, no YouTube connection needed.
- House rhythm: **one chat = one video** (`youtube-make-video` in a fresh chat). Members who cram
  five videos into one chat hit the full-chat wall — that's the fix, not a bug report.

### Plugin 4 — Short-Form System
- Depends on: Brain. Publishing = **bring-your-own** (Metricool default, or GoHighLevel / Buffer /
  manual) — wired in `shortform-setup`.
- Known modes: publish/analytics skills failing usually = posting tool not connected or its login
  expired → re-run `shortform-setup`. Nothing auto-posts; approval is always the last gate.

### Plugin 5 — Lead Capture
- Depends on: Brain (offer/USP must exist — thin offer → route `realtor-offer-usp` first) + Drive
  campaign folder. Copy + strategy only: the .docx is rendered styled, and the DESIGN happens in
  Claude Design from the brief. Capture only (name + email), no booking — by design.

### Plugin 6 — AI Editor
- Depends on: Brain + **Descript connector (their own account + credits)**. Stock keys optional.
- Known modes: connection lost → `editor-setup` step 1 (navigator preflights `list_projects` and
  routes there automatically). Long edits use **per-clip checkpoints** — a died session RESUMES
  from the checkpoint log (re-open the edit and say "resume"), never restarts. **Credits-exhausted
  = hard stop** (paused mid-plan, waiting on a top-up — not broken). Editing spends Descript
  credits with an 80/20 discipline and a cost gate before each run.

### Plugin 7 — Listing Launch
- Depends on: Brain + Drive (listing folder). `listing-tour` additionally = bring-your-own
  **Higgsfield** account (photos animate under strict no-alteration rules) and hands clips to
  Plugin 6.
- Known modes: any listing skill asking for the address again = intake never ran → `listing-intake`
  once, then everything reads the Brain's listing block.

### Plugin 8 — Market System
- Depends on: Brain; research writes `memory/market-data.md` once per month and every piece quotes
  it. Deck + script are LOCKED together via the Slide Map (deck first, script one-beat-per-slide).
- Known modes: pieces refusing to run → that month's research hasn't run (`market-run` fixes
  order); data late early in the month = board release timing, the routine knows to wait; numbers
  always carry source + date — "it won't just give me a number" is the anti-invention rule working.

## Cross-cutting known issues (any plugin)

| Symptom | Reality | Fix route |
|---|---|---|
| "It forgot everything from yesterday" | Chats are workbenches; the Brain is the memory | Teach §3 doctrine; anything missing → capture/phase skills |
| "Brain missing" on a machine that had it | Fresh Cowork desk; Drive copy is fine | `realtor-brain-sync` pull |
| Claude can't read a folder (often Downloads/Desktop on Mac) | The Mac protects those folders per-app | Diagnostics tree #7 (grant access once / use the brain folder) |
| Connector "connected" but reads fail | Expired login or wrong Google account | Diagnostics tree #2 |
| "Nothing happened when I typed it" | Plugin not installed, or phrasing missed the trigger | Diagnostics tree #3 (exact phrases live in this file) |
| Docs come out unstyled/ugly | Deliverables render via the shared styled-doc pipeline | Log as bug via `support-escalate` if a skill delivered plain text |
| A skill wants a tool the member skipped (Notion, Metricool, Higgsfield…) | Bring-your-own tools are optional by design | Offer the setup skill for that tool, or the manual path |
| "It says it sent/saved/booked it — I can't find it" | Claimed-done ≠ done: verify with one cheap read; absent = draft-or-hallucination | Diagnostics tree #9 (redo via the owning skill, then reassure) |
