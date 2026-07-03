# Realtor Lead Capture (Plugin 5)

**The conversion layer.** The agent's other systems drive traffic (YouTube, short-form) — this turns that
attention into **captured leads.** It writes a **lead magnet** from the agent's offer, then maps the
**opt-in funnel** that gives it away — two aligned documents: the **copy, structure, and strategy**. It writes
the words; a **separate design skill** builds the visuals; it never hosts, and it never books calls.

Requires **Plugin 1 (the Realtor AI Brain)** — it reads the agent's offer, avatars, proof, and voice from
there and never re-asks.

## The flow — two steps, in order

**One campaign = one magnet + one funnel that sell each other.**

1. **Build the lead magnet** (`leadcapture-magnet`) — pick a brand-led guide (whole audience) or a focused
   buyer/seller guide, built from the offer in the Brain. Output: a clean, formatted doc in Drive (styled
   `.docx`) with the full guide content.
2. **Map the funnel** (`leadcapture-funnel`) — it reads the magnet from step 1 so the page sells *exactly*
   what the guide delivers, then writes the opt-in page section by section, applying the funnel strategy.
   Output: a clean, formatted doc in Drive (styled `.docx`) with the full page copy + structure.

The agent takes both docs to their design step, builds the guide PDF + the page, and hosts the page in their
own tool (their site, GoHighLevel, Carrd, etc.).

## The funnel sections (in order)

1. **Hero** — the hook headline (= the magnet's promise) + subhead + the opt-in CTA.
2. **The problem** — names and agitates the reader's real fear before any pitch.
3. **The guide** — what's inside + its value, shown with the magnet mockup (left/right) + a mid-page CTA.
4. **About the agent (WHO)** — what makes them amazing + why they're qualified + their process.
5. **Why work with them (OFFER + USP)** — the full offer + USP, the real "why hire me" (most pages miss this).
6. **The local market** — the real communities they serve, in facts (the un-fakeable, value-led section).
7. **Proof / results** — a dedicated block of real testimonials and numbers.
8. **As seen on / follow along** — their YouTube + socials, *only if they have any* (a trust signal, not a rival CTA).
9. **The opt-in** — present the magnet, the short form (name + email), and the final CTA.

**Goal = lead capture only.** After someone opts in, follow-up is the agent's job. The funnel never books a
call or touches a calendar — that's deliberate (keeps it simple and reliable).

## What's in here

```
realtor-lead-capture/
├── .claude-plugin/plugin.json
├── shared/
│   ├── house-rules.md       # the rules every skill applies (voice, compliance, map-not-design, …)
│   ├── copywriting-kb.md     # how to write genuinely good, high-converting copy (trains both skills)
│   ├── output-standard.md    # how the two docs are named, organized, and formatted in Drive
│   └── render_doc.py         # shared renderer: structured text → styled .docx
└── skills/
    ├── leadcapture-magnet/   # Step 1 — build the lead magnet from the offer
    └── leadcapture-funnel/   # Step 2 — map the opt-in funnel that gives it away
```

## Boundaries

- **Writes copy + structure + strategy only — never designs.** A separate design skill builds the visuals.
- **Lead capture only — never books calls** or integrates a calendar.
- **Doesn't host or publish.** The agent builds at the design step and hosts in their own tool.
- **Reads the Brain — never re-asks** the offer or identity.
