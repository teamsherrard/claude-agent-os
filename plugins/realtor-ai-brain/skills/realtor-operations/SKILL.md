---
name: realtor-operations
description: >
  Phase 6 of the Realtor AI Brain — captures how the agent operates so their AI Admin can run: working
  hours, response-time, email signature, booking rules, follow-up cadence, vendor network, goals
  (business / YouTube / life / personal), and the competitors they admire.
  Writes identity/operations.md, identity/vendors.md, identity/strategy.md. Built so a brand-new agent
  finishes in ~3 minutes by accepting proven defaults (it only gets long if they choose to customize),
  and never gets stuck on decisions they haven't made yet. Runs right before "Set up my AI Admin" — it
  is NOT part of first-run Brain Setup.

  Trigger on: "set up my operations", "how I run my business", "my booking rules", "my email
  signature", "add my vendor network", "my preferred lenders/lawyers/inspectors", "my business goals",
  "prep for AI Admin", "phase 6", or any request to capture how the agent works day-to-day.
---

# Realtor Operations + Vendors + Goals + Competitors (Brain Phase 6)

Captures the operational truth the **AI Admin** needs to book showings, email in the agent's voice, and
make referrals. **Most agents finish in ~3 minutes by accepting smart defaults** — it only gets long if
they want to customize everything.

> **When to run:** right before **"Set up my AI Admin"** (the only skill that uses this). It is NOT part
> of first-run Brain Setup — a brand-new agent can skip it entirely until they're ready for their Admin.

## Step 0 — Follow the setup principle
Read `${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md` and obey it: **ask once, default-if-unsure**, and
honour "use defaults" / "skip" at any point. **Defaults are full-quality, never stubs** — an agent who
types nothing still gets professional booking rules, a real follow-up cadence, and a clean signature.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, plus `identity/profile.md`, `identity/voice.md`, `identity/offer.md`.
If `~/realtor-brain/` doesn't exist, tell them to run **Realtor AI Brain — Setup** first.

## Open with the one-shot offer (do this FIRST, before any piece-by-piece question)
> "I can set you up with proven, standard settings — 30-minute showings with 15-minute buffers, a
> follow-up cadence that works (new lead → call same day, then day 1 / 3 / 7, then monthly; past client →
> quarterly + their home anniversary), same-day weekday response, and a clean email signature built from
> your profile. You can tweak any of it later. **Want me to set these standards, or customize?**"

- **"Set the standards" / "use defaults" →** write all of Phase A from the defaults below + the Brain,
  confirm in one pass, then move to Vendors. ~1 minute.
- **"Customize" →** walk Phase A one item at a time, still defaulting any single answer they're unsure on.

## Phase A — Operations → `identity/operations.md`
Every item is **default-able** — only make them decide if they want to override:
- **Email signature** — **build it entirely from `profile.md`** (name, title, brokerage, phone, booking
  link) and just ask "look right?" Never make them retype it.
- **Working hours + timezone** — default Mon–Fri 9–6, Sat by appointment; timezone inferred from market.
- **Response-time commitment** — default same-day on weekdays.
- **Booking rules** — default 30-min showings (15-min buffers), 30-min buyer/seller consults (in-person
  or virtual), a standard open-house window.
- **Standing virtual-meeting link** — their Zoom/Meet link if they have one; if not, skip (AI Admin falls
  back to Google Meet automatically).
- **Follow-up cadence** — default new lead → same-day call + day 1/3/7 + monthly; active client → weekly;
  past client → quarterly + home anniversary.
- **Standard scripts** (objection handling, follow-up templates) — optional; default "none yet, add later."

**Write the defaults out in FULL and specific** (real durations, a real cadence, a real signature) — the
file should read like a sharp operations playbook a pro would keep, never bracketed placeholders.

## Phase B — Vendor network → `identity/vendors.md` (genuinely optional — never homework)
Lead with the out: *"Do you already have trusted partners — a lender, lawyer, inspector? If not, no
problem at all; most agents add these as they meet them, and we can do that anytime."*
- **Has some →** capture name + contact + why for each they actually name. Don't ask for all roles.
- **None / "skip" →** write `vendors.md` with a friendly "add these as you build your network" note. The
  empty table stays as a prompt for *later* — never present it as something to fill in now. Never block.

## Phase C — Goals + Competitors → `identity/strategy.md`
Light and default-able (ask-once-default). Capture, in one friendly pass:
- **Business goals** — this year's GCI / transaction goal.
- **YouTube / content goals** — subscriber + lead targets (the YouTube Game Plan reads these). No channel
  yet? A sensible default ("steady growth + a few leads a month") is fine.
- **Life + personal goals** — the bigger "why" (more time with family, financial freedom, a personal
  milestone). One light line each; skippable.
- **What they want to be known for, growth focus, #1 priority, capacity.**
- **Competitors they admire / follow** in their local market — agents or YouTube channels they look up to.
  This feeds the YouTube Outlier engine + content strategy, so it's captured once here and never re-asked in
  the YouTube System. None yet? Leave the friendly placeholder — the system finds local outliers automatically.
If unsure on any of it, infer a sensible default from their market + niche and let them confirm in one word.

## Write + push to Drive + confirm
> **Push to Drive after writing** — run `realtor-brain-sync` (PUSH). An unsynced write is a lost write.
Write the three files (vendors may be the friendly placeholder). Confirm: *"Your operations and goals are
in your Brain — when you set up your AI Admin, it already knows your hours, signature, booking rules, and
cadence. Add vendors anytime as you build your network."*
