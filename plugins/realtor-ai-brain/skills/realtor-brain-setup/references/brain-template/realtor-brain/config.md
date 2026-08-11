# Config
*operational settings for this agent's Brain*

- **Storage provider:** [google | microsoft]  *(set once at setup — see `shared/connectors.md`; every
  skill uses this to pick the storage/email/calendar connector. `READ-ONLY (org-gated)` after the
  provider if Microsoft write actions are disabled — saves are blocked until their admin enables them.)*
- **Workspace folder:** [display name — default "Social Agent OS"; the agent may rename it freely]
  - **Workspace folder ID:** [captured at first sync — IDs survive renames; ALWAYS locate by ID, never by name]
  - **Workspace link:** [the direct URL — hand this to the agent to bookmark]
  - **Owner account:** [which Google/Microsoft account holds it — checked when the workspace can't be found]
- **Brain home (permanent):** the workspace's `01 · AI Brain/_engine/` folder *(legacy brains: the
  `Realtor AI Brain` folder root)*. Local `~/realtor-brain/` is a per-session working copy — Cowork's
  local storage is wiped between sessions; an unsynced write is a lost write.
- **Brain schema:** 2  *(structure version — the migration skill upgrades old brains when this changes)*
- **Realtor AI Brain version:** [x.y]  *(plugin version that last touched this brain)*
- **Timezone:** [e.g. America/Edmonton]
- **Default CTA:** [pulled from identity/voice.md]
- **Brain created:** [Month Year] · **Last full review:** [Month Year]
- **Last synced:** [date, or "never"]

## Connectors this Brain uses
*The setup wizard confirms these (most agents connect them before the Brain build). A skill that needs
one and finds it missing should tell the agent to connect it rather than failing silently. Google-world
agents use the Google rows; Microsoft-world agents use the Microsoft 365 connector for storage + email +
calendar (see `shared/connectors.md`).*

- [ ] **Google Drive** *(google)* — the Brain's permanent home (syncs every session)
- [ ] **Gmail** *(google)* — AI Admin email drafts, inbox sweep, briefing *(draft-only — it cannot send)*
- [ ] **Google Calendar** *(google)* — booking showings / consults
- [ ] **Microsoft 365** *(microsoft)* — OneDrive storage + Outlook Mail + Outlook Calendar in one
  connector *(email stays draft-only by policy — write actions: [enabled / org-gated / untested])*
- [ ] **Zoom** — auto-creates meeting links on virtual bookings *(recommended; Google Meet / Teams is the fallback)* — can create meetings: [yes/no/untested]
- [ ] **Cal.com** — client self-booking links *(optional; falls back to the agent's own booking link, then to proposing times by email)*
- [ ] **Pexels** — stock footage for video skills *(optional)*
- [ ] [other]

## AI Admin runtime
*Written by "Set up my AI Admin" — leave blank until then.*
- **Assistant name:** [blank — default "AI Admin"]
- **Morning Briefing task id:** [blank] · runs daily 7:00am (agent timezone)
- **Daily Inbox Sweep task id:** [blank] · runs weekdays 8:30am (agent timezone)
- **Sweep may archive Promotions:** [yes/no — agent's choice at setup]
