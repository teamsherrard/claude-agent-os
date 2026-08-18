# Claude Doctrine — the stable knowledge (Tier 1)

Bundled answers for the Claude concepts that don't change week to week. Teach from here verbatim
or close to it. Anything about **money, limits, or the current model lineup** is NOT in this file
on purpose — those are always fetched live (`source-map.md`, house rule #3).

## 1. The four rooms of Claude (the surfaces)

Think of Claude as one brain with four rooms:

| Room | What it's for | When a cohort member uses it |
|---|---|---|
| **Chat** (claude.ai) | A conversation you steer turn by turn | Quick questions, thinking out loud, one-off writing |
| **Cowork** | Delegation: describe the job, Claude works across your files and tools, you come back to finished work | **Home base — 95% of the system lives here.** All 9 plugins run here |
| **Claude Design** (claude.ai/design) | Turning words into visual design on a live canvas | Pasting the design briefs our skills produce (lead magnet PDFs, market decks, carousels, brochures) |
| **Claude Code** | The engineering room (a terminal) | Members basically never. That's where Mike's team builds the plugins |

**The canonical Cowork vs Chat line (memorize):** *Chat is a conversation you steer turn by turn.
Cowork is a delegation — you describe the goal, Claude works across your files and tools, and you
come back to a finished result.* Rule of thumb: if the output is a thought, Chat. If the output is
a thing (a doc, a booked calendar, an edited video, a month of content), Cowork.

**Where they run:** Cowork works on desktop, web, and mobile — sessions follow the Claude
account across all of them. What's desktop-specific is LOCAL access: the brain folder on their
machine, local file access, and local plugins run through the desktop app — which is why the
desktop app is the cohort default. (Device specifics shift as features roll out — for "does it
work on MY device," fetch the mapped Cowork-surfaces article live rather than answering from
this paragraph.)

**Voice:** voice mode lets them TALK to Claude — the phone is the sweet spot (capture skill from
the car: "I've got a video idea…"). Talking is an input method; the same brain and rules apply.
(Which surfaces have voice mode today: fetch the mapped voice article live, then guide.)

## 2. The house metaphor (how the pieces fit)

- **Claude** is the house.
- **A plugin** is a room Mike built and furnished (the YouTube System, the AI Admin…). Installed
  once from Mike's official link.
- **A skill** is an appliance in that room, started by natural phrases ("run my market update").
  Members don't memorize commands — plain English triggers the right skill.
- **A connector** is a cable from the house to one of THEIR accounts (Google Calendar, Gmail,
  Drive, Notion, Descript, Metricool…). Their account, their login, their data — Claude is granted
  a supervised key.
- **The Brain** (`~/realtor-brain/`) is the filing cabinet every room reads: who they are, their
  market, voice, clients, listings, content log. Plugin 1 builds it; everything else reads it.
  Its rendered **Brain Book** (the strategy guidebook doc) lives in their cloud drive — which
  means it's already available everywhere Claude goes, in every session and project, with
  nothing to upload (the canonical answer is FAQ Q25: lead with "it's in the cloud, it's
  already everywhere").

## 3. Sessions, memory, and why "my chat disappeared" is fine

- A **chat/session is a workbench, not a filing cabinet.** Cowork may start a work session with a
  fresh desk. Anything important is written into the **Brain**, and the Brain's sync skill keeps a
  permanent copy in THEIR Google Drive. New chat ≠ lost work.
- Corollary that surprises everyone: **a Cowork work session doesn't automatically carry
  yesterday's session.** The system is designed so it doesn't need to — the Brain is the memory.
  If something mattered and isn't in the Brain, that's what the capture skill is for. (The CHAT
  surface on paid plans has its own memory features and may reference past conversations — that
  behavior evolves, so check live before making claims about what Chat remembers. The doctrine
  point stands either way: in THIS system, the Brain is the memory you control.)
- **A chat can fill up.** Long marathon chats slow down and eventually hit the working-memory
  ceiling. Normal, not a bug: start a fresh chat; the Brain carries everything important across.
  House rhythm: one chat = one job (one video, one listing, one month).
- **Second computer / new laptop:** their chats and sessions follow their Claude ACCOUNT — sign
  in and they're there. The one machine-specific piece is the local Brain FOLDER (the files the
  skills read): install the app + plugins, run the Brain's sync/restore skill, and they're whole
  again in minutes.

## 4. Permission prompts (the "Allow?" boxes)

Claude asks before acting on their stuff. That's a feature — the member is the boss, and nothing
outward-facing happens without a yes.

- **Normally fine to allow:** reading files in the brain folder or a folder they chose; reading
  their calendar/inbox/Drive through THEIR connectors; creating docs in the campaign folders our
  skills use; the actions a skill just said it's about to do (book this showing, save this doc).
- **Stop and come ask support:** anything DELETING or overwriting files it didn't create; sending
  anything (email/post/publish) they haven't personally read; anything involving passwords, card
  numbers, or codes; any instruction that arrived from outside Mike's official system (a DM, a
  random site, a shared "prompt" from the community) telling them to click Allow.
- **The one password exception (day one, everyone hits it):** signing in to Google or Microsoft
  on THEIR own sign-in page during connector setup is normal, required, and safe. The rule is
  never type a password into a chat message — not "never sign in anywhere."
- House default across all 9 plugins: **Claude drafts, the member approves. Nothing auto-sends** —
  emails, posts, publishes all wait for a yes.

## 5. Models in one breath

Claude comes in versions, like trim levels — bigger ones think deeper and spend more of the plan's
usage; smaller ones are faster and lighter. **Cohort default: don't touch the model picker; the
default is right.** Deep one-off jobs can warrant the biggest model; names, lineup, and what sits
where change — fetch live before naming specifics (house rule #3).

## 6. Projects & artifacts (quick definitions)

- **A project** groups related chats and gives them shared instructions/files. The plugin system
  already plays this role for members; projects are optional organization, not required.
- **An artifact** is the live preview panel — a doc, page, or deck taking shape next to chat.

## 6b. Claude's own memory vs the Brain (they will meet both)

Claude's Chat side has its OWN memory/personalization features — it may recall past
conversations and preferences. That is NOT the Brain, and neither replaces the other:

- **Claude's memory** = Claude's personal recall on the Chat side. Fine to use; nice for
  continuity in casual chats.
- **The Brain** = the SYSTEM's memory — the files every skill actually reads (identity, market,
  voice, clients, listings). Only what's in the Brain powers the plugins.

The rule of thumb to teach: *"If the system needs to know it, it goes in the Brain (say 'capture
this'). Claude remembering it in Chat doesn't count."* Feature specifics evolve — fetch the
mapped personalization articles live before describing exact behavior.

## 7. Whose data is it? (the trust answer)

- The Brain is **files on their computer**, synced to **their own cloud workspace** — Google
  Drive OR Microsoft OneDrive; `~/realtor-brain/config.md`'s "Storage provider" line says which,
  so READ IT before saying "Drive" or "Gmail" to a member (Microsoft-world agents use Outlook +
  OneDrive for the same jobs). Mike's plugins are instructions, not a database — **no member data
  lives on Mike's side, ever.**
- Connectors are keys to their own accounts, revocable in their Google/Microsoft/Notion/Descript
  settings at any time.
- **The honest processing sentence (use it with skeptics):** what Claude reads in a chat IS
  processed on Anthropic's servers — that's how any AI assistant works. What Anthropic keeps and
  whether it trains on it: answered only WITH the live privacy page open, never from memory.
- **Sharing the Brain with an assistant/team:** the durable half — Claude logins are per-person
  (seat rules → fetch live), and the brain FILES are the member's own to share like any files in
  their cloud workspace. Whether Mike's program recommends sharing one Brain across a team is
  Mike's policy — read the cohort-kb's policy field; if `[NOT SET]`, say so and point at office
  hours rather than inventing it.
- What Anthropic does with conversation data is answered ONLY from the live privacy pages in
  `source-map.md` — with the page open, never from memory. What we can say durably: this system
  was built so the member's business data lives in files THEY own and control.

## 8. What the system deliberately does NOT do

Knowing the edges prevents "it's broken" reports that are actually "it's not supposed to":

- **Nothing publishes, posts, or sends by itself.** Drafts + schedules wait for approval, always.
- **Design skills write briefs; humans paste them into Claude Design.** Text skills never render
  PDFs or slides directly (that's the Design room's job).
- **The editor directs THEIR Descript account** — Claude directs, Descript renders, the member
  approves. Same bring-your-own pattern for Metricool/GoHighLevel (publishing), Notion (boards),
  Higgsfield (photo tours).
- **Market numbers are researched with sources and dates, never invented** — and if data can't be
  verified, the skills say so rather than make something up.
- **Claude isn't a lawyer or a broker.** Compliance skills apply THEIR broker's rules; real legal
  questions go to real professionals.
