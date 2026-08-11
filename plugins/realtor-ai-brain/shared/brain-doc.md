# The AI Brain Document — one organized master doc (the deliverable)

Every agent gets **ONE comprehensive "Your AI Brain" document** — a premium, well-organized render of their
whole Brain, saved to Drive. It is a **render of the identity files** (which stay the source of truth), never a
new source — so it's always rebuildable and never drifts. Generated at the end of Setup, refreshed whenever the
Brain materially changes (especially after the **Business Plan** is built), and on demand ("show me my Brain").

## How to build it
1. **Read the identity files that exist.** Pull each section's content from its file (below). Skip nothing —
   for a section whose file isn't built yet, render a **one-line placeholder + how to fill it**, so the agent
   can see what's still open (this matters most for **Business Plan** and **Operations**, which come after core setup).
2. **Assemble the sections in order** as the house-style **structured text** — each section title as a CAPS band
   (`──── SECTION ────`) so `shared/render_doc.py` styles it; bullets and `Label:` lead-ins as usual.
3. **Render + save.** Run it through `shared/render_doc.py` (per `shared/doc-formatting.md`) to a premium `.docx`
   and save it to the workspace's **`01 · AI Brain/`** (legacy brains: `Realtor AI Brain → exports`) as
   **"[Agent] — AI Brain — [YYYY-MM-DD]"** — dated, so regenerations never collide; newest = current
   (use `--eyebrow "Realtor AI Brain"`).
   Then push (`realtor-brain-sync`). The `.docx` is the keepsake; the markdown identity files remain the truth.

## The sections (in this order)
1. **SNAPSHOT** — name · market · niche · voice-in-one-line · primary CTA · booking link · socials (from `brain.md` quick-ref)
2. **WHO YOU ARE** — `identity/profile.md`
3. **WHO YOU SERVE** — `identity/avatars.md` (each avatar, with their fears/motivations)
4. **YOUR MARKET** — `identity/market.md` (communities, price bands, local intel)
5. **YOUR OFFER & USP** — `identity/offer.md`
6. **YOUR VOICE & PROOF** — `identity/voice.md` (tone) + `voice-print.md` (spoken, if built) + `proof.md` + `story-bank.md` (if built)
7. **YOUR BRAND DIRECTION** — `identity/brand-visual.md` (note: take this into claude.ai/design to build the visuals)
8. **YOUR CONTENT PLAN** — `identity/content-engine.md`
9. **★ YOUR 90-DAY BUSINESS PLAN** — `identity/business-plan.md` (the target · deals needed · daily & weekly KPIs ·
   the 3 weekly moves). **If not built yet:** placeholder — *"Run 'build my business plan' and this section fills in."*
10. **HOW YOU OPERATE** — `identity/operations.md` + `identity/vendors.md`. **If not built yet:** placeholder —
    *"Set up when you build your AI Admin."*
11. **COMPLIANCE** — `identity/compliance.md` (disclaimer, license display, claims to avoid)

## Rules
- Written **for the agent** — clear headings, second person, genuinely useful as a reference; premium via `render_doc.py`.
- **Never invent** — render only what's actually in the Brain; use placeholders for what isn't built yet.
- **Refresh, don't fork** — regenerate the same "[Agent] — AI Brain" doc after the Business Plan is built, and on
  "show me my Brain" / "regenerate my Brain document". One doc, always current.
