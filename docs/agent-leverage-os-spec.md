# The Agent Leverage OS — Unified System Spec

*v1.0 · merges the "Content to Client" cohort brief ("The Agent Leverage OS") with the
7-system, brain-native master map. Productivity only — CRM and content are sibling products.
Companions: `brain-spec.md`, `jarvis-brain-wiring.md`, `jarvis-retrofit/`, `product-framing.md`.*

---

## The thesis

Real estate agents don't need more tools — they need **less friction**. The Agent Leverage OS
is a set of Claude-powered systems that run the admin side of an agent's business: scheduling,
inbox, notes, follow-ups, and a daily plan. It lives inside the agent's own Claude, runs on
their own connected accounts, reads everything from one Brain, and does most of its work
automatically.

Three principles separate it from a pile of prompts:
1. **Connected, not pasted** — native Gmail / Calendar / Cal.com. The agent never copy-pastes
   their inbox or calendar in.
2. **One Brain, not many Projects** — a single source of truth every system reads and writes.
3. **Automated, not just reactive** — the highest-value work runs on a schedule, in the background.

**Product vs. persona:** the product is *The Agent Leverage OS*; each agent's assistant has its
own name (default *Jarvis*), stored in the Brain.

---

## 1. The 5 outcomes (the why)

Everything the product does ladders up to one of these. Lead with these in marketing, not features.
1. Manage communication faster
2. Plan the day / week with more clarity
3. Reduce admin & mental clutter
4. Improve the client experience
5. Better business follow-through

---

## 2. The architecture (how)

**Three layers**
- **Brain (data)** — `~/realtor-brain/`, the single source of truth (identity + memory). See `brain-spec.md`.
- **Systems (apps)** — the 7 productivity systems below; interchangeable, all read/write the Brain.
- **Package (delivery)** — one Cowork plugin the agent installs and owns; built and versioned in Code from the repo.

**Vocabulary** — Systems contain **Workflows** (agent-triggered) and **Automations** (self-running).

**Connectors** — native only: Gmail · Google Calendar · Google Drive · Cal.com · Zoom for Claude.
No Zapier. The inbox itself is a zero-config integration (lead, lender, and transaction emails already arrive there).

**Scope boundary** — productivity only. Leads / nurture / pipeline → the **AI CRM VA**.
Content / marketing → the existing realtor skill suite. The Admin hands off to both.

---

## 3. The 7 systems (the what)

*Each system: the outcome it serves · its workflows · its automations · what it reads/writes in the Brain.*

### 1. Scheduling System — Plan with clarity
- **Workflows:** Auto-Booking · One-Tap Client Booking (Cal.com) · Rescheduling · Route Optimizer
- **Automations:** Pre-Appointment Prep · Conflict Guard
- **Brain:** reads `operations` (booking rules, hours, virtual link); writes `clients` (auto-log), `deadlines`

### 2. Inbox System — Communicate faster · Reduce admin
- **Workflows:** Email on Autopilot (draft in voice → **Recommended / Shorter / Warmer + one action item** → approve → send) · Thread Summary
- **Automations:** Inbox Triage (*what needs attention · who to reply to · what to ignore · what follow-ups to create*) · Auto-Labeling & Sorting · Attachment Filing · Waiting-On Tracker · Declutter
- **Brain:** reads `voice`, `operations` (signature), `compliance`; writes `clients` (logged mail)

### 3. Client Memory System — Follow-through · Client experience
- **Workflows:** Total Client Recall
- **Automations:** Auto-Logging · Task & Promise Follow-ups · Deadline Watchdog
- **Brain:** reads/writes `clients`, `deadlines`

### 4. Meeting System (Note-Taker) — Client experience · Follow-through
- **Automations:** Note-Taker — after every call: **Summary / Client goals / Concerns / Action items / Follow-up draft / Reminders**
- **Brain:** reads `profile`, `voice`; writes `clients` (summary + goals + concerns), `deadlines` (action items + next touch)

### 5. Daily Command System — Plan with clarity · Reduce clutter
- **Automations:** 7am Briefing (greeting · today's schedule · **TOP 3 MONEY-MAKING ACTIONS** · urgent · follow-ups due · inbox · one suggestion) · Command Center Dashboard · Special-Date Surfacing · Productivity Scorecard
- **Brain:** reads `brain.md`, `clients`, `deadlines` + calendar
- *This is the cohort's "Daily Agent Game Plan": what must happen today, what can be delayed, delegated, or made recurring.*

### 6. Transaction Coordinator System — Follow-through · Client experience
- **Workflows:** Deal Timeline Builder · Party Coordination
- **Automations:** Milestone Nudges · Document Checklist
- **Brain:** reads `vendors`, `operations`; writes `deadlines`, `clients`

### 7. Document & File System — Reduce admin & clutter
- **Workflows:** Template Filling · Contract Data Extraction
- **Automations:** Auto-Filing (Drive)
- **Brain:** reads `profile`, `brand-visual`

---

## 4. The Brain contract

Two laws: **read `brain.md` first; write back what you learn.** The Admin reads
`identity/{operations, profile, voice, offer, vendors, compliance}` and writes
`memory/{clients, deadlines}`. **No interview, ever** — identity comes from the Brain.
Full detail in `jarvis-brain-wiring.md`.

---

## 5. The daily / weekly rhythm (the routine)

- **7am Briefing (daily)** — the game plan, led by the top 3 money-making actions.
- **Continuous** — auto-labeling, auto-logging, follow-up + deadline tracking, note-taker after calls.
- **Optional cadences** — end-of-day wrap · Monday week-ahead · Friday follow-ups.

---

## 6. Delivery & ownership

- **Realtors (Cowork):** install the plugin from the Directory → connect their own Google + Cal.com
  → one-time Brain setup → own it. Three clicks; data never leaves their accounts.
- **Agency (Code):** build and version the plugin in the GitHub repo; publish as a plugin / marketplace.
  Clients never touch the repo or a terminal.

---

## 7. Build status & roadmap

- Brain spec + template — done.
- **Phase 1 (brain-native foundation)** — proven against the sample brain (load-no-interview + write-back).
- **Phase 2 (persona, dashboard, 7am briefing)** — built, brain-native, staged in `jarvis-retrofit/`.
- **Pending go-live** — seed the real Brain (profile / voice / operations) + connect accounts → live test (booking + briefing).
- **Then** — package into the Cowork plugin + new-client provisioning + update path.

---

## 8. The sales / marketing layer

Lead with the 5 outcomes, not features. Core frame: *hire the assistant you've always wanted —
for the price of software, who never forgets a client and runs in the background.* The
systems → outcomes map lives in `product-framing.md`; the value stack and swipe hooks are
already drafted.
