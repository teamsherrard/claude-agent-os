---
name: realtor-compliance
description: >
  Phase 7 of the Realtor AI Brain — captures the legal and brokerage compliance rules that every
  public-facing output must respect: required brokerage disclaimers, license-number display rules,
  fair-housing constraints, claims the agent legally cannot make, and brokerage logo/co-brand rules.
  Writes identity/compliance.md. Because every skill reads brain.md (which points here), this keeps all
  generated content compliant and protects the agent. This is assistance, not legal advice.

  Trigger on: "set up my compliance", "my disclaimers", "license display rules", "fair housing rules",
  "brokerage rules", "what I can't say in content", "make my content compliant", "phase 7", or any
  request about legal/brokerage requirements for the agent's marketing.
---

# Realtor Compliance (Brain Phase 7)

Captures the rules that keep the agent out of trouble. Quick — about 5 minutes — but important. Frame
it honestly: *"This makes sure your AI-generated content follows your brokerage and license rules. It's
a safety net, not legal advice — you're still responsible for your marketing."*

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` and `identity/profile.md` (for brokerage, license #, location). If
`~/realtor-brain/` doesn't exist, tell them to run **Realtor AI Brain — Setup** first.

## The interview
1. **Jurisdiction** — state/province + governing body (RECA, DRE, TREC, RECO, etc.). If unsure, infer
   from their market and confirm.
2. **License # + display rule** — the number and where it must appear.
3. **Required brokerage disclaimer** — ask them to paste the exact disclaimer text their brokerage
   requires on marketing (most have one). If they don't know, flag it as a to-do, don't invent one.
4. **Fair-housing** — equal-housing logo required? Any language constraints they've been told about.
5. **Claims to avoid** — guarantees of price/ROI, "best"/"#1" without a source, steering language, etc.
   Offer the common real-estate list and let them confirm/add.
6. **Brokerage logo / co-brand rules** — eXp blue, RE/MAX co-brand zone, KW constraints, independent.

## Write + push to Drive + confirm

> **Push to Drive after writing** — run `realtor-brain-sync` (PUSH). The local copy is wiped when the
> session ends; an unsynced write is a lost write.
Write `~/realtor-brain/identity/compliance.md`. Confirm: *"Your compliance rules are in your Brain —
every content skill will append your disclaimer and license #, and avoid claims you can't make."*
Remind them once: this is a safety net, not legal advice. If run as **Phase 7 of Setup**, hand control
back to Setup to finalize.
