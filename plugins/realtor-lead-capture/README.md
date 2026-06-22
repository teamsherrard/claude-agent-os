# Realtor Lead Capture (Plugin 5)

**The conversion layer.** The agent's other systems drive traffic (YouTube, short-form) — this turns that
attention into **captured leads.** It writes a **lead magnet** from the agent's offer, then maps the
**opt-in funnel** that gives it away — two aligned documents the agent takes to **claude.ai/design** to
build. It writes the words and the structure; it never designs or hosts, and it never books calls.

Requires **Plugin 1 (the Realtor AI Brain)** — it reads the agent's offer, avatars, proof, and voice from
there and never re-asks.

## The flow — two steps, in order

**One campaign = one magnet + one funnel that sell each other.**

1. **Build the lead magnet** (`leadcapture-magnet`) — pick a buyer or seller guide, built from the offer in
   the Brain. Output: a clean Google Doc with the full guide content + a paste-ready claude.ai/design prompt.
2. **Map the funnel** (`leadcapture-funnel`) — it reads the magnet from step 1 so the page sells *exactly*
   what the guide delivers, then maps the opt-in page section by section. Output: a clean Google Doc with
   the full page copy + a paste-ready claude.ai/design prompt.

The agent takes both docs to claude.ai/design, builds the guide PDF + the page, and hosts the page in their
own tool (their site, GoHighLevel, Carrd, etc.).

## The funnel sections (fixed, in this order)

1. **Hero** — the hook headline (= the magnet's promise) + subhead + the opt-in CTA.
2. **About the agent** — what makes them amazing, their wins, their process — framed around the reader.
3. **The offer** — their offer, properly presented as the outcome the reader gets.
4. **The opt-in** — present the magnet, the short form (name + email), and the final CTA.

**Goal = lead capture only.** After someone opts in, follow-up is the agent's job. The funnel never books a
call or touches a calendar — that's deliberate (keeps it simple and reliable).

## What's in here

```
realtor-lead-capture/
├── .claude-plugin/plugin.json
├── shared/
│   ├── house-rules.md       # the rules every skill applies (voice, compliance, map-not-design, …)
│   ├── copywriting-kb.md     # how to write genuinely good, high-converting copy (trains both skills)
│   └── output-standard.md    # how the two docs are named, organized, and formatted in Drive
└── skills/
    ├── leadcapture-magnet/   # Step 1 — build the lead magnet from the offer
    └── leadcapture-funnel/   # Step 2 — map the opt-in funnel that gives it away
```

## Boundaries

- **Maps copy + structure only — never designs.** claude.ai/design builds the visuals.
- **Lead capture only — never books calls** or integrates a calendar.
- **Doesn't host or publish.** The agent builds in Design and hosts in their own tool.
- **Reads the Brain — never re-asks** the offer or identity.
