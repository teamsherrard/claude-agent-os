---
name: realtor-operations
description: >
  Phase 6 of the Realtor AI Brain — captures how the agent operates so their AI admin (Jarvis) can run:
  working hours, response-time commitments, email signature, booking rules, follow-up cadence, standard
  scripts, their vendor/partner network, and their business goals. Writes identity/operations.md,
  identity/vendors.md, and identity/strategy.md — the files Jarvis reads to book showings, send emails
  in their voice, make referrals, and prioritize the right work.

  Trigger on: "set up my operations", "how I run my business", "my booking rules", "my email
  signature", "add my vendor network", "my preferred lenders/lawyers/inspectors", "my business goals",
  "prep for Jarvis", "phase 6", or any request to capture how the agent works day-to-day.
---

# Realtor Operations + Vendors + Goals (Brain Phase 6)

Captures the operational truth Jarvis needs to act as a real admin. About 15 minutes. This is the
foundation the **Jarvis** skill reads before it books anything or sends any email.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, plus `identity/profile.md`, `identity/voice.md`, `identity/offer.md`.
If `~/realtor-brain/` doesn't exist, tell them to run **Realtor AI Brain — Setup** first.

## Phase A — Operations → `identity/operations.md`
Conversationally capture:
- **Working hours + timezone**, and **response-time commitment**.
- **Email signature** — exact block (pull name/title/brokerage/booking link from `profile.md`; confirm).
- **Booking rules** — showing duration + buffers; buyer/seller consult duration + in-person/virtual;
  open-house defaults.
- **Follow-up cadence** — new lead / active client / past client sequences.
- **Standard scripts** (optional) — objection handling, follow-up templates, or "none yet."

## Phase B — Vendor network → `identity/vendors.md`
List their trusted partners (mortgage, lawyer, inspector, stager, photographer, contractor, cleaner/
mover): name, contact, and why they recommend them. These power Jarvis referrals and co-marketing.

## Phase C — Goals → `identity/strategy.md`
Capture this year's goals (GCI / transactions), what they want to be known for, growth focus, current
#1 priority, and capacity constraints.

## Write + confirm
Write all three files. Confirm: *"Your operations, vendors, and goals are in your Brain. When you set
up Jarvis next, it already knows your hours, your signature, your booking rules, and who you refer."*
If run as **Phase 6 of Setup**, hand control back to Setup, then point them to **"Set up my Jarvis."**
