# Jarvis (AI Admin) — Brain Wiring

*How the AI Admin reads/writes the Realtor AI Brain. Companion to `brain-spec.md` §5–§7 and
`BRAIN-CONTRACT.md`. **Status: SHIPPED as its own plugin** — `plugins/realtor-jarvis/` (Plugin 2 on
the marketplace; the skill + briefing, inbox-sweep, and dashboard templates in its `references/`).
Requires the Brain plugin (Plugin 1) installed and set up. This doc remains the wiring contract.*

**Drive sync (v0.10+):** the Brain's permanent home is the agent's Google Drive; `~/realtor-brain/`
is a per-session working copy. Jarvis PULLS the Brain if the local copy is missing (Step 0) and
PUSHES after every `memory/`/`config.md` write, batched once per turn — an unsynced write is a lost
write. Scheduled tasks (briefing, inbox sweep) always start with a PULL: they run in fresh sessions.

## Principle

The Admin asks the realtor **nothing** the Brain already knows. **No interview.** It loads
identity from the Brain and writes client activity back to the Brain. The old standalone
`jarvis/profile.json` + `memory.json` silo is **retired** (folds into the Brain per spec §10).

## READ — Step 1: Load the Brain (replaces Jarvis's old interview)

Read `~/realtor-brain/brain.md` first (quick-reference: name, market, voice one-liner, CTA,
booking link). Then open as needed:

- `identity/operations.md` → working hours, timezone, response-time commitment,
  **email signature (exact block)**, **booking rules** (showing/consult/open-house durations,
  buffers, in-person vs virtual + link), follow-up cadence, scripts. ← the Admin's operating config
- `identity/profile.md` → name, credentials, contact, niche, brokerage
- `identity/voice.md` → tone, never-sounds-like, signature phrases → how it drafts email
- `identity/offer.md` → services / USP → context for consults + email content
- `identity/vendors.md` → lender / title / inspector network → party coordination
- `identity/compliance.md` → fair-housing + disclaimers → email guardrails

If `~/realtor-brain/` is missing → tell the agent to run **Realtor AI Brain — Setup**. Never interview.

## WRITE — after every booking, email, and client update (spec §6)

- `memory/clients.md` — one block per client (Jarvis is the primary writer):
  ```markdown
  ## [Client] — [Buyer/Seller] — Stage: [..]
  - Looking: [..]
  - Last contact: [date] · Next action: [..]
  - Notes: [..]
  ```
- `memory/deadlines.md` — every promised follow-up + transaction date (financing, inspection,
  appraisal, walkthrough, closing).
- Listings belong to the content skills; Jarvis only touches `clients` + `deadlines`.

## Admin runtime state → `config.md` (NOT a silo)

`~/realtor-brain/config.md`: `dashboard_artifact_id`, `briefing_task_id`,
`briefing_send_time` (default 07:00, timezone from operations.md).

## System → Brain map

| Admin system | Reads | Writes |
|---|---|---|
| Scheduling | operations (booking rules, hours, virtual link) | clients (auto-log), deadlines |
| Inbox / Email | voice, operations (signature), compliance | clients (log sent mail) |
| Client Memory | clients, deadlines | clients, deadlines |
| Meeting notes | profile, voice | clients (note) |
| Daily Command | brain.md, clients, deadlines, calendar | — |
| Transaction Coordinator | vendors, operations | deadlines, clients |
| Document & File | profile, brand-visual | (Drive) |

## Retrofit checklist (COMPLETED — all items implemented in the shipped skill; kept for history)

1. Replace Jarvis's "Step 1 — interview / read profile.json" with the Load-the-Brain block above.
2. Replace all `jarvis/memory.json` reads/writes with `memory/clients.md` + `memory/deadlines.md`.
3. Move `dashboard_artifact_id` + `briefing_task_id` into `config.md`.
4. Booking durations come from `operations.md` booking rules (fallback to defaults only if absent).
5. Email sign-off = `operations.md` signature block, verbatim.
6. Read `compliance.md` before any client-facing email.

## Testing

`~/realtor-brain/` is not set up on this machine. Test against the sample brain
(`realtor-ai-brain/test/sample-brain/`, agent "Jordan Reyes"), or copy it to a throwaway
`~/realtor-brain/` to exercise the canonical path. (Sample brain predates `operations.md`,
so hours/signature/booking-rules fall back to defaults in that test.)
