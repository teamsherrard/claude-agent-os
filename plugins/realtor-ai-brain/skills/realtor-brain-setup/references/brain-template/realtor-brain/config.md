# Config
*operational settings for this agent's Brain*

- **Brain home (permanent):** Google Drive → `Realtor AI Brain` folder. *(Local `~/realtor-brain/` is a
  per-session working copy that syncs from Drive — Cowork's local storage is wiped between sessions.)*
- **Brain schema:** 1  *(structure version — the migration skill upgrades old brains when this changes)*
- **Realtor AI Brain version:** [x.y]  *(plugin version that last touched this brain)*
- **Timezone:** [e.g. America/Edmonton]
- **Default CTA:** [pulled from identity/voice.md]
- **Brain created:** [Month Year] · **Last full review:** [Month Year]
- **Last synced to Drive:** [date, or "never"]

## Connectors this Brain uses
*The setup wizard walks the agent through connecting these. A skill that needs one and finds it
missing should tell the agent to connect it rather than failing silently.*

- [ ] **Gmail** — Jarvis emails (briefing, client emails)
- [ ] **Google Calendar** — booking showings / consults
- [ ] **Google Drive** — **REQUIRED: the Brain's permanent home** (syncs every session)
- [ ] **Pexels** — stock footage for video skills *(optional)*
- [ ] [other]
