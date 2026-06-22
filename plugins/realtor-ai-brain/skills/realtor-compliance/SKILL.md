---
name: realtor-compliance
description: >
  Phase 7 of the Realtor AI Brain — captures the legal and brokerage compliance rules every public-facing
  output must respect: brokerage disclaimer, license-number display, fair-housing, claims the agent
  legally cannot make, and brokerage logo/co-brand rules. Writes identity/compliance.md. Built so a
  nervous beginner finishes in ~2 minutes by confirming safe defaults — it auto-infers the regulator,
  pre-accepts the standard claims-to-avoid list, and lets them skip-and-flag anything they don't have
  handy. Never invents a disclaimer. This is assistance, not legal advice.

  Trigger on: "set up my compliance", "my disclaimers", "license display rules", "fair housing rules",
  "brokerage rules", "what I can't say in content", "make my content compliant", "phase 7", or any
  request about legal/brokerage requirements for the agent's marketing.
---

# Realtor Compliance (Brain Phase 7)

The safety net that keeps every public post inside the agent's brokerage + license rules. **~2 minutes —
mostly just confirming safe defaults.** Frame it warmly; never like a legal form.

## Step 0 — Follow the setup principle
Read `${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md`. Lead the WHOLE phase with reassurance + defaults:
*"I'll set safe, standard compliance defaults and you just confirm — this is a safety net, not legal
advice, and there's no homework."* Honour "use defaults" / "skip" at any point.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` and `identity/profile.md` (brokerage, license #, market). If
`~/realtor-brain/` doesn't exist, tell them to run **Realtor AI Brain — Setup** first.

## Open with the one-shot offer
> "Want me to set safe, standard real-estate compliance defaults — figure out your regulator from your
> market, add the standard list of claims to avoid, and note the fair-housing basics — so you just
> confirm? You can paste your brokerage's exact disclaimer now, or add it later. **Set the standards, or
> go through it?**"

- **"Set the standards" →** auto-fill from the items below + confirm in one pass.
- **"Go through it" →** walk the items, still defaulting anything they're unsure on.

## The items — all default-able
1. **Jurisdiction / regulator** — **auto-infer from their market** (RECA–Alberta, DRE–California,
   TREC–Texas, RECO–Ontario, etc.) and just confirm. Don't make them look it up.
2. **License # + display rule** — pull from `profile.md` if present; if not, **"add later" is fine** —
   note it as a to-do, never block. Default display rule: on all marketing.
3. **Claims to avoid** — present the standard real-estate list **pre-accepted**, agent only edits/adds:
   guaranteeing a price/ROI/sale; "best"/"#1"/"top" without a verifiable source; any language steering
   toward or away from a protected class; misrepresenting credentials or results. One-tap accept.
4. **Fair-housing** — default: equal-opportunity spirit, no protected-class steering language. Confirm
   only whether their brokerage requires the equal-housing logo on marketing.
5. **Brokerage disclaimer** — ask them to paste it if handy. **If not:** *"No worries — it's usually on
   your brokerage's marketing/branding page, or your managing broker has it. I'll flag it as a to-do, and
   your content will show '[brokerage disclaimer pending]' until you add it."* **Never invent a disclaimer.**
6. **Brokerage logo / co-brand rules** — infer from `profile.md`/brokerage and confirm: eXp (keep personal
   palette distinct from eXp blue), RE/MAX co-brand zone, KW, or independent (no constraints).

## Write + push to Drive + confirm
> **Push to Drive after writing** — run `realtor-brain-sync` (PUSH). An unsynced write is a lost write.
Write `~/realtor-brain/identity/compliance.md` — **full and specific** (the real claims-to-avoid list, the
inferred regulator, the brokerage rules), with any genuinely-missing piece (exact disclaimer, license #)
clearly flagged as a to-do rather than invented. Confirm: *"Your compliance guardrails are set — every
content skill will respect them. Add your exact disclaimer and license # whenever you have them."* Remind
once: safety net, not legal advice.
