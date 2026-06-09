# Multi-Agent / Team Brand System

This reference covers how to handle brand guide requests for couples, teams, and group entities. The standard solo-agent skill assumes one person. Team brands are architecturally different and require a different approach.

---

## Detecting Team vs Solo

During Step 1 (info gathering), detect if this is a team brand from:
- Two names given ("Josh and Stephanie", "The Bautista Twins", "Scott & Sean")
- Team entity name given ("The Collective", "Dream Homes Group", "The Power Pair")
- Phrases like "we are a team", "my partner and I", "husband and wife team"
- Brokerage context suggesting a team (e.g., "we run a team under eXp")

If team is detected, ask one additional question before proceeding:
> "Got it — I'll build a full team brand system. Quick question: is there a team entity name (like 'The Martinez Group' or 'The Collective') separate from your individual names, or is the brand just under your combined names?"

Their answer determines the logo architecture (see below).

---

## Team Brand Architecture

Every team brand requires THREE levels of logo, not one:

### Level 1 — Combined Team Logo
The primary brand mark when both agents act together. Used on:
- All shared marketing (open houses, listings, social)
- Team business cards and email signatures  
- YouTube channel, Instagram profile
- All content where both agents are credited

**Design approach:**
- Combined initials (e.g., "SS" for Scott & Sean, "JS" for Josh & Stephanie)
- Or team name wordmark if they have a separate team entity name
- One unified mark — not two separate logos side by side

### Level 2 — Individual Agent Logos
Each agent has their own version of the mark for solo activities. Used on:
- Individual agent's social media profile
- Solo content/Reels where only one agent appears
- Individual business cards
- Separate email signatures

**Design approach:**
- Same mark style/family as the combined logo
- Each agent's version uses just their initials or first name
- Same color system — visual consistency maintained
- The individual mark should be instantly recognizable as part of the same family as the combined mark

### Level 3 — Team Entity Logo (if applicable)
Only if the team has a named entity separate from their personal names (e.g., "The Collective", "Dream Homes Group"). Used on:
- Team's separate brand presence
- Group listings
- Team merch, signage, yard signs
- Website / domain

**Design approach:**
- Can be more abstract than personal mark
- Still uses the same color system
- Typography can differ slightly to differentiate the entity from the agents

---

## Logo Design Patterns for Teams

### Couples / Married Teams
Examples: Josh & Stephanie De Los Santos, Sergio & Sheila Manriquez

**Best approach — Shared initial mark:**
If both agents share a last name initial (e.g., both "D" for De Los Santos), one letter mark works for both.
If different initials, design a mark that splits: left half = partner 1's initial, right half = partner 2's initial.

**SVG example — split initial mark:**
```svg
<!-- Combined JSD mark for Josh & Stephanie De Los Santos -->
<svg viewBox="0 0 160 100">
  <!-- J (Joshua) -->
  <text x="20" y="72" font-family="[display font]" font-size="52" font-weight="700" fill="[primary]">J</text>
  <!-- S (Stephanie) - offset, slightly lighter -->
  <text x="58" y="72" font-family="[display font]" font-size="52" font-weight="700" fill="[secondary]" opacity="0.85">S</text>
  <!-- De Los Santos -->
  <text x="80" y="88" font-family="[display font]" font-size="10" font-weight="400" fill="[primary]" letter-spacing="2">DE LOS SANTOS</text>
</svg>
```

Individual marks:
```svg
<!-- Joshua only -->
<text>J</text>
<text>[smaller] JOSHUA DE LOS SANTOS</text>

<!-- Stephanie only -->
<text>S</text>
<text>[smaller] STEPHANIE DE LOS SANTOS</text>
```

### Twin / Sibling Teams
Examples: Bautista Twins (Scott & Sean)

**Best approach — Interlocking marks:**
Double letters that interlock or overlap (BB for Bautista Brothers). Individual marks use single initial.

```svg
<!-- Combined BB mark - interlocking -->
<svg viewBox="0 0 120 100">
  <text x="5" y="75" font-family="[display font]" font-size="68" font-weight="700" fill="[primary]">B</text>
  <text x="48" y="75" font-family="[display font]" font-size="68" font-weight="700" fill="[primary]" opacity="0.7">B</text>
</svg>

<!-- Scott only -->
<text>B</text><text>SCOTT BAUTISTA</text>

<!-- Sean only -->
<text>B</text><text>SEAN BAUTISTA</text>
```

### Named Team Entity
Examples: "The Collective", "Dream Homes Group", "The Power Pair"

**Best approach — Abstract mark for entity, monogram for individuals:**
The team entity gets a geometric abstract mark (triangle, arrow, chevron, circle system). The individual agents keep personal monogram marks. Both use the same color palette.

```
Team entity: [Abstract geometric mark] + "THE COLLECTIVE" wordmark
Agent 1: [S monogram] + "SERGIO MANRIQUEZ" wordmark  
Agent 2: [S monogram] + "SHEILA MANRIQUEZ" wordmark
```

---

## Brand Guide Structure for Teams

For team brands, the HTML brand guide gets an expanded Logo System section:

### Logo Section Structure (Teams)

**Part A — Combined Mark**
Show the combined team logo in the 4 standard background variations (dark, light, primary, outline). Label each as "Combined — use when both agents are credited."

**Part B — Individual Marks**
Side-by-side: Agent 1's mark and Agent 2's mark in dark background versions.
Label: "Individual — use for solo content and separate business cards."

**Part C — Team Entity Mark (if applicable)**
Show the entity mark separately if one exists.
Label: "Team Entity — use for team listings and shared business presence."

**Part D — Logo Architecture Diagram**
A simple diagram showing WHICH logo to use WHEN:
```
                    ┌─────────────────────────┐
                    │   IS BOTH AGENTS         │
                    │   CREDITED?              │
                    └──────────┬──────────────┘
                               │
              ┌────────────────┼────────────────┐
             YES               │               NO
              │                │                │
   ┌──────────▼────────┐       │    ┌───────────▼──────────┐
   │  USE: Combined    │       │    │  WHICH AGENT?         │
   │  Team Logo        │       │    └──────────┬────────────┘
   └───────────────────┘       │         ┌─────┴─────┐
                               │      Agent 1      Agent 2
                               │         │            │
                               │  ┌──────▼──┐  ┌─────▼───┐
                               │  │Individual│  │Individual│
                               │  │Logo A   │  │Logo B   │
                               │  └─────────┘  └─────────┘
```

Render this as an HTML/CSS flowchart in the document — not ASCII art.

---

## Info Gathering for Teams

Replace the solo Step 1 with this expanded intake when a team is detected:

**Required (team):**
- Both agents' full names
- Brokerage
- Market city AND state/province (required for skyline)
- Team entity name (if any — okay if none)
- Brand vibe / colors
- Combined niche / specialty
- 3 brand personality words (for the team, not individuals)
- Which agent is the "lead" or are they equal partners? (affects layout hierarchy)

**Optional (team):**
- Do they want separate individual business cards or one combined card?
- Do they film content together or separately? (affects which mockups to prioritize)
- Any brands they admire aesthetically?

---

## Mockup Adjustments for Teams

When generating Application Examples for a team brand:

**Business Card:**
- Generate TWO business card mockups side by side:
  - Combined card: both names, combined logo
  - Individual card: single agent name, individual mark
- Show front of combined card + front of individual card

**Reel Cover:**
- Show TWO reel cover mockups:
  - "Together" version: both names visible, combined mark
  - "Solo" version: one agent name, individual mark (use Agent 1 as example)

**Open House Graphic:**
- Always uses the combined mark and lists both agent names/contacts

**Profile Picture:**
- Two options: combined mark for shared account, individual mark for personal accounts

---

## Brand Voice for Teams

The brand voice section for teams includes one additional element:

**Speaking roles:**
Define who speaks in what context.
```
WHEN WE SPEAK AS A TEAM:
"We help Austin families..." / "Our clients tell us..." / "The two of us bring..."

WHEN [AGENT 1] SPEAKS SOLO:
"I've been helping Austin families for 10 years..." / "My approach is..."

WHEN [AGENT 2] SPEAKS SOLO:
"I specialize in..." / "My clients know they can count on me..."
```

This matters for Reels content especially — solo Reels should sound like the individual, not the team.

---

## Canva Brief Additions for Teams

When generating the Canva handoff brief for a team brand, add this section:

```
TEAM LOGO USAGE MATRIX

┌───────────────────────────────┬─────────────────┬─────────────────┐
│ USE CASE                      │ LOGO TO USE     │ AGENT NAMES     │
├───────────────────────────────┼─────────────────┼─────────────────┤
│ Shared Instagram profile      │ Combined mark   │ Both            │
│ Joint listing post            │ Combined mark   │ Both            │
│ Open house graphic            │ Combined mark   │ Both            │
│ [Agent 1]'s solo Reel         │ Individual A    │ Agent 1 only    │
│ [Agent 2]'s solo Reel         │ Individual B    │ Agent 2 only    │
│ [Agent 1]'s business card     │ Individual A    │ Agent 1 only    │
│ [Agent 2]'s business card     │ Individual B    │ Agent 2 only    │
│ Combined business card        │ Combined mark   │ Both            │
│ YouTube banner                │ Combined mark   │ Both            │
│ Team entity materials         │ Entity mark     │ Team name only  │
└───────────────────────────────┴─────────────────┴─────────────────┘
```

---

## Quality Checklist — Teams

Add these checks for team brand outputs:

- [ ] Combined logo mark shown in 4 background variations
- [ ] Individual mark for Agent 1 shown
- [ ] Individual mark for Agent 2 shown  
- [ ] Team entity mark shown (if applicable)
- [ ] Logo architecture diagram present (which logo, when)
- [ ] Business card shows BOTH combined and individual versions
- [ ] Reel cover shows BOTH combined and solo versions
- [ ] Brand voice section includes team voice vs individual voice distinction
- [ ] Canva brief includes the Team Logo Usage Matrix table
- [ ] All three logo levels use the same color palette — visual family is maintained
- [ ] Individual marks are clearly recognizable as part of the same brand family as the combined mark
