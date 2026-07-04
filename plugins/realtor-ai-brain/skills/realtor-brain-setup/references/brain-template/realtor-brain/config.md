# Config
*operational settings for this agent's Brain*

- **Brain home (permanent):** Google Drive → `Realtor AI Brain` folder. *(Local `~/realtor-brain/` is a
  per-session working copy that syncs from Drive — Cowork's local storage is wiped between sessions.)*
- **Brain schema:** 2  *(structure version — the migration skill upgrades old brains when this changes)*
- **Realtor AI Brain version:** [x.y]  *(plugin version that last touched this brain)*
- **Timezone:** [e.g. America/Edmonton]
- **Default CTA:** [pulled from identity/voice.md]
- **Brain created:** [Month Year] · **Last full review:** [Month Year]
- **Last synced to Drive:** [date, or "never"]

## Connectors this Brain uses
*The setup wizard walks the agent through connecting these. A skill that needs one and finds it
missing should tell the agent to connect it rather than failing silently.*

- [ ] **Gmail** — AI Admin email drafts, inbox sweep, briefing *(required for AI Admin; draft-only — it cannot send)*
- [ ] **Google Calendar** — booking showings / consults *(required for AI Admin)*
- [ ] **Google Drive** — **REQUIRED: the Brain's permanent home** (syncs every session)
- [ ] **Zoom** — auto-creates meeting links on virtual bookings *(recommended; Google Meet is the automatic fallback)* — can create meetings: [yes/no/untested]
- [ ] **Cal.com** — client self-booking links *(optional; falls back to the agent's own booking link, then to proposing times by email)*
- [ ] **Pexels** — stock footage for video skills *(optional)*
- [ ] [other]

## AI Admin runtime
*Written by "Set up my AI Admin" — leave blank until then.*
- **Assistant name:** [blank — default "AI Admin"]
- **Morning Briefing task id:** [blank] · runs daily 7:00am (agent timezone)
- **Daily Inbox Sweep task id:** [blank] · runs weekdays 8:30am (agent timezone)
- **Sweep may archive Promotions:** [yes/no — agent's choice at setup]
