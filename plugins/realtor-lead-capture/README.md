# Realtor Lead Capture (Plugin 5)

**The conversion layer.** The agent's other systems drive traffic (YouTube, short-form) — this turns that
attention into **captured leads.** It writes a **lead magnet** from the agent's offer, then maps the
**opt-in funnel** that gives it away — two aligned documents: the **copy, structure, and strategy**. It writes
the words; a **separate design skill** builds the visuals; it never hosts, and it never books calls.

Requires **Plugin 1 (the Realtor AI Brain)** — it reads the agent's offer, avatars, proof, voice, and the
strategy chapters of their AI Brain Book (`strategy.md` + `business-plan.md`) from there and never re-asks.

## The flow — a front door, then two steps in order

**One campaign = one magnet + one funnel that sell each other.**

0. **The front door** (`leadcapture-navigator`) — where every agent starts ("launch lead capture plugin" /
   "set up my lead capture"). Quietly checks the Brain + offer are ready, detects fresh vs. half-built vs.
   finished campaigns so nobody is ever bounced or re-asked, then opens a fresh start with ONE personal
   welcome message (who it is, the plan, "ready? just say yes") — never a question box or a menu.
   **The first campaign is locked: the RELOCATION GUIDE** (*"Moving to [City]? Start Here"*) — the #1
   highest-intent search traffic in every market. No menu, no overthinking; the navigator runs a 5-question
   intake (each answer pre-filled from the Brain) and hands off. Second campaign onward, the choice opens up.
1. **Build the lead magnet** (`leadcapture-magnet`) — writes the full guide from the offer in the Brain
   (relocation first; brand-led or niche after that). Output: a clean, formatted doc in the workspace
   (`03 · Content/Guides/`, styled `.docx`) with the full guide content — and a row in the Brain's offer so
   the YouTube and Short-Form systems point their CTAs at it.
2. **Map the funnel** (`leadcapture-funnel`) — reads the magnet from step 1 so the page sells *exactly*
   what the guide delivers, then writes the opt-in page section by section, applying the funnel strategy.
   Output: a clean, formatted doc in the same campaign folder (styled `.docx`) with the full page copy + structure.

The agent takes both docs to their design step, builds the guide PDF + the page, and hosts the page in their
own tool (their site, GoHighLevel, Carrd, etc.). Once it's live: the page link goes on their **Google
Business Profile** + video descriptions + social bios — the systems that drive traffic point here.

## The funnel sections (in order)

1. **Hero** — the hook headline (= the magnet's promise) + subhead + the opt-in CTA.
2. **The problem** — names and agitates the reader's real fear before any pitch.
3. **The guide** — what's inside + its value, shown with the magnet mockup (left/right) + a mid-page CTA.
4. **About the agent (WHO)** — what makes them amazing + why they're qualified + their process.
5. **Why work with them (OFFER + USP)** — the full offer + USP, the real "why hire me" (most pages miss this).
6. **The local market** — the real communities they serve, in facts (the un-fakeable, value-led section).
7. **Proof / results** — real testimonials and numbers, plus the **proof photo strip**: an auto-scrolling
   horizontal strip of the agent's real photos (wins, clients, community, testimonial moments).
8. **As seen on / follow along** — their YouTube + socials, *only if they have any* (a trust signal, not a rival CTA).
9. **The opt-in** — a 3-line mini-FAQ, then **button → pop-up → thank-you page:** every CTA ("Grab Your
   Free Guide" — the one phrase everywhere) opens the opt-in pop-up (first name, email, phone + an honest
   line on what the phone is for); submitting lands on the thank-you page with the **direct link to the
   guide PDF as an instant download** — no email needed to deliver it.

**Goal = lead capture only.** After someone opts in, follow-up is the agent's job. The funnel never books a
call or touches a calendar — that's deliberate (keeps it simple and reliable).

## What's in here

```
realtor-lead-capture/
├── .claude-plugin/plugin.json
├── shared/
│   ├── house-rules.md        # the rules every skill applies (voice, compliance, relocation-first, …)
│   ├── copywriting-kb.md     # how to write genuinely good, high-converting copy (trains the two build skills)
│   ├── output-standard.md    # how the two docs are named, organized, and formatted in the workspace
│   └── render_doc.py         # shared renderer: structured text → styled .docx
└── skills/
    ├── leadcapture-navigator/ # Step 0 — the front door: orient, check, lock, intake, route
    ├── leadcapture-magnet/    # Step 1 — build the lead magnet from the offer
    └── leadcapture-funnel/    # Step 2 — map the opt-in funnel that gives it away
```

## Boundaries

- **Writes copy + structure + strategy only — never designs.** A separate design skill builds the visuals.
- **Lead capture only — never books calls** or integrates a calendar.
- **Doesn't host or publish.** The agent builds at the design step and hosts in their own tool.
- **Reads the Brain — never re-asks** the offer or identity.
