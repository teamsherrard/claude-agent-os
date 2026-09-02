# Diagnostics — the decision trees (Tier 3)

Run by `support-diagnose`. Rules of engagement: cheapest check first · one step at a time · look
but never touch (house rule #1) · translate everything (plain-language.md) · two failed fixes →
`support-escalate`. A "check" here means READ (list a folder, read a file, one cheap connector
read, one screenshot) — never write, never reconfigure.

Openers that route here and which tree: "brain isn't working" → #1 · "can't see my
email/calendar/files" → #2 · "typed it, nothing happened" → #3 · "Claude is slow/stuck/down" → #4 ·
"doesn't sound like me / output is off" → #5 · "chat too long / disappeared" → #6 · "can't read my
folder" → #7 · "I don't see Cowork / no Cowork button" → #8 · "it says it sent it but nothing
arrived" / "my morning briefing stopped" → #9. **No tree fits?** Don't force one —
fall back to the navigator's rule: T2 lookup via the source map's official indexes, and if
confidence stays low, `support-escalate`. Never bend a tree around a symptom it wasn't built for.

## Tree #1 — "My brain isn't working" (the big one)

1. **Does the brain exist here?** List `~/realtor-brain/` — and judge by `brain.md`, not the
   folder: a folder WITHOUT `brain.md` counts as never-built (stray files prove nothing).
   - Missing / no `brain.md` → Has this member EVER set up? Ask one question: "Have you done 'set
     up my brain' before, on any computer?"
     - Never → route **`realtor-brain-setup`** ("let's build it — one guided session").
     - Yes, on another machine / before → route **`realtor-brain-sync`** restore ("your permanent
       copy lives in your own cloud drive — let's pull it down; takes minutes").
2. **Is it populated or placeholder?** Read `brain.md` + spot-check `identity/profile.md`,
   `identity/voice.md`. Mostly `[set later]` / empty → route **`realtor-brain-health`** ("the
   brain exists but it's running on fumes — a quick health check will show the 2–3 things worth
   filling in first").
3. **Is it stale vs Drive?** If sync is set up, a quick pull-check via **`realtor-brain-sync`**
   (newest-wins makes this safe). Symptom "it lost what I added yesterday (on my other
   machine/session)" → this, almost always. Clean pull but the content still absent → the OTHER
   machine may hold an unpushed write: open it there, say "save my brain," then pull again here.
4. **Schema current?** If any skill reported "brain looks out of date" → route
   **`realtor-brain-migrate`**. Reassure: migrate renames/reorganizes WITHOUT losing content.
5. Still broken with a healthy-looking brain → the problem is the SKILL, not the brain → tree #3,
   then escalate with the brain-health one-liner attached.

## Tree #2 — Connector trouble (Google, Notion, Descript, Metricool/GHL)

1. **Which account do they THINK is connected?** One question: "Which email did you connect —
   personal or work?" (Wrong-account is ~a third of these.)
2. **Cheap read test** on the failing connector: list today's calendar / one recent Drive file /
   `list_projects` for Descript. Works → the connector is fine; the real issue is the ask or the
   skill → tree #3. **Server-class error while clearly signed in** (e.g. Microsoft's
   "SearchPlatformResolutionFailed") → that's the provider's servers, NOT the connection: use
   error-codes' Microsoft row (browse-don't-search + the onedrive.com split test) — reconnecting
   fixes nothing here.
3. **Auth error on the read** → the link expired. Plain words: "The link between Claude and your
   [Google/Microsoft/Descript/…] needs a refresh — 60 seconds." Then BRING THE BUTTON TO THEM
   (house rule #5): surface the connector's Connect card right in this chat (directory inline, or
   one gentle call so the card renders) — the member clicks, signs in on the provider's page,
   done; verify with the cheap read again. Card won't surface → route the OWNER: Google/Microsoft
   → the walkthrough in `support-teach` (card-first, article-guided Settings as fallback) ·
   Descript → **`editor-setup`** step 1 · Metricool/GHL/Buffer → **`shortform-setup`** · Notion →
   the board skill's connect step.
4. **Read works but the SKILL can't see the thing** (folder/calendar/project) → scope or location:
   confirm the exact folder/calendar name they expect; commonly the file lives outside the
   system's folders (see tree #7 for Mac-protected folders).
4b. **"My posts never went out" (publish failure)** — auth is the LAST suspect, not the first:
   ① did they APPROVE the batch? (nothing auto-posts — an unapproved queue is the #1 cause) →
   ② are the posts sitting in the tool's own queue/planner? (cheap read) → ③ the tool's own
   status page → ④ then reconnect → ⑤ still failing → the TOOL's own support via
   `escalation.md`'s third-party row (Mike's team can't fix Metricool's side).
5. **Work-account blocked by their brokerage's IT** (admin-blocked messages) → not fixable here:
   offer the personal-account path or the IT letter via **`support-escalate`** (FAQ Q17).

## Tree #3 — "I typed it and nothing happened" (trigger/install)

1. **What EXACTLY did they type, and where?** (Cowork vs Chat matters — the system lives in
   Cowork. In Chat → that's the whole answer; move them to Cowork.)
2. **Is the plugin installed?** Check whether the owning plugin's skills appear in YOUR available
   skill listing (`stack-map.md` knows the owner; if its skills aren't in your context, it isn't
   installed here). For version questions, the member's plugin settings panel is the truth — ask
   for a screenshot of it; there is no marketplace lookup from inside a session. Not installed →
   install from Mike's official marketplace link (`cohort-kb.md`), then retry.
3. **Phrasing missed the trigger** → hand them the exact phrase from `stack-map.md`'s router
   ("say: *run my market update for August*") and confirm it fires.
4. **Right skill, wrong state** — skill fired but immediately asked for setup/brain → that's the
   dependency chain working (brain first, setup first); route per its message.
5. **Updates pending** → have them refresh/update plugins (marketplace), retry once. Still dead
   with correct phrase + installed plugin → **`support-escalate`** with the exact phrase tried.

## Tree #4 — "Claude is slow / stuck / down / erroring on everything"

1. **STATUS FIRST** (house rule #2): status.claude.com. Incident → plain words, their work is
   safe, nothing to fix, try again later. Log, done.
2. **Scope it:** everything, or one job? One question: "Is it acting up on everything, or just
   this one task?"
   - One task → error text/screenshot → `error-codes.md`; retry once; two fails → escalate.
   - Everything, status clean → 3.
3. **The usual suspect: a marathon chat.** Long chat = slow chat. Fresh chat, invoke the same
   skill; Brain carries context (FAQ Q27).
4. **The boring checklist**, one at a time: is the desktop app current · restart the app ·
   is their internet OK. (Never uninstall/reinstall as a support step — that's escalate-level.)
5. Still broken → **`support-escalate`** (this pattern = real bug or account state; humans).

## Tree #5 — "Output is off" (doesn't sound like me / generic / wrong facts / wrong look)

1. **Which kind of off?** Voice · genericness · wrong facts · wrong LOOK (font, colors, caption
   style, branding). One screenshot or paste of the offending output.
1b. **Wrong look on a VIDEO** (captions in the wrong font, off-brand colors, missing CTA card) →
   not a brain problem: route **`editor-quick`** (one cheap targeted fix) — and if the brand
   itself is wrong in the editor's config, `editor-setup` re-pulls it from the Brain.
2. **Voice off** → brain depth: `identity/voice.md` + voice-samples thin? → route
   **`realtor-voice-proof`** (written) / **`realtor-voice-print`** (spoken). (FAQ Q21.)
3. **Generic content** → market/avatar/offer files thin → **`realtor-brain-health`** for the
   highest-impact gaps.
4. **Wrong facts about their business** → find where the Brain says it: it's either stale (route
   the owning phase skill to update) or was never captured.
5. **Wrong MARKET numbers** → Plugin 8's anti-invention rules: was this month's research run?
   (`memory/market-data.md` dated this month?) Not run → `market-run`. Run, but a skill deviated
   from the data block → that's a real bug → **`support-escalate`** with the doc.

## Tree #6 — Sessions & "my chat disappeared / it forgot everything"

1. **Check BEFORE reassuring:** does `~/realtor-brain/brain.md` exist? WITH a Brain → reassure
   with confidence (FAQ Q4/Q5): chats are workbenches; the Brain + their cloud drive are the
   memory. WITHOUT a Brain (day-one member) → be honest instead: *"Right now nothing saves your
   work between chats — that's exactly what the Brain fixes, and it's the next setup step.
   Let's build it."* Never recite "nothing is lost" to someone with nowhere for it to be saved.
2. **Looking for a DELIVERABLE from that chat?** Deliverables live in Drive (campaign/video/
   listing folders), not in the chat — find it there with them.
3. **Looking for a decision/idea that was only ever said in chat?** Honest answer: chat text
   doesn't persist, THIS time it may be gone — then teach the fix so it never happens again:
   "capture this" (`realtor-capture`) writes it to the Brain in one line.
4. **"It forgot who I am"** → that's tree #1 (brain missing/unsynced on this machine), not memory.

## Tree #7 — "Claude can't read my folder/file" (Mac privacy)

1. Confirm the path: Downloads / Desktop / Documents are Mac-protected per-app (known repo
   issue). Two doors, member picks:
   - **Grant once:** System Settings → Privacy & Security → Files & Folders (or Full Disk Access)
     → allow for the Claude app, then restart the app. Screenshot-guide them through it.
   - **Move instead** (recommended default): work from the brain/campaign folders the system
     already uses — no permissions dance, and sync covers it.
2. File uploaded to chat vs on disk confusion → teach the difference in one line; for system jobs
   the file wants to BE in the campaign folder.
3. Granted access and still blocked → restart app, retry once → **`support-escalate`**.

## Tree #8 — "I don't see Cowork" (availability, not breakage)

1. **Where are they looking?** One question + screenshot: browser or desktop app, and which
   plan? (Both matter; neither is guessable.)
2. **Fetch, don't recall:** availability by plan/surface changes — fetch the mapped articles
   ("Cowork on web / desktop / mobile" + the pricing page via `source-map.md`) and answer from
   today's truth.
3. **If their plan genuinely lacks it** → that's a plan decision, warmly → `support-account`
   (which fetches before recommending).
4. **If their plan has it but the button's missing** → the boring checklist: right account
   signed in · app current · restart. Still missing with a qualifying plan → **`support-escalate`**
   (Anthropic-side rollout/account state; not fixable from here).

## Tree #9 — "It says it sent/saved it, but it doesn't exist" + "my scheduled thing stopped"

**A. Claimed-sent:** Claude said it emailed/saved/booked something and the member can't find it.
1. **Verify the artifact with one cheap read** — the email in Sent, the doc in Drive, the event
   on the calendar. Found → it's a WHERE problem; show them.
2. **Absent** → it was a draft-that-never-sent or a hallucinated claim. Don't relitigate — redo
   the action through the owning skill, watch it confirm, THEN reassure. Log it (real bug signal
   if a skill claimed completion falsely).

**B. Scheduled runs stopped** (7am briefing, market autopilot, a Cowork scheduled task):
1. Does the schedule still EXIST? (Cowork's tasks panel — screenshot if unsure.)
2. Did its dependencies break at run time? (connector expired → tree #2 · usage limit hit at
   run hour → account · brain unsynced → tree #1.)
3. Schedule fine, deps fine, still silent → re-create via the owning skill's routine step
   (`market-routine`, the admin's briefing setup) → still dead → **`support-escalate`**.
