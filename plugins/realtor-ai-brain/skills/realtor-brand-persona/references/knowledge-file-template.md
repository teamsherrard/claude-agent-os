# Knowledge File Template — Realtor Brain Identity Files

## About This Document

This is the exact structure of the knowledge file Claude builds from the interview.
Written in third person so any Claude skill can read it as a reference document.
Complete, specific, and immediately usable — no other skill should ever need to ask
"what city are you in?" after this content is in the Brain.

---

## DOCUMENT STRUCTURE

Use this exact structure. Fill in every section from the interview answers.
If a section wasn't covered in the interview, note "Not specified — ask agent."

---

# [AGENT FIRST NAME] — Claude Knowledge File
*Last updated: [Month Year]*
*This content lives in the agent's Brain (`~/realtor-brain/identity/`). Read it before running any skill.*

---

## 1. AGENT PROFILE

**Full name:** [First Last]
**City / Primary market:** [City, Province/State]
**Years in real estate:** [X years]
**Brokerage / Team:** [Name — or "Independent"]
**Primary focus:** [Buyers / Sellers / Both — with split if known, e.g., "60% buyers, 40% sellers"]
**Primary property types:** [e.g., "Detached homes and townhouses"]
**Booking link / CTA:** [URL or "not provided"]
**Social handles:** [Instagram, YouTube, TikTok if provided]

---

## 2. MARKET & GEOGRAPHY

**Primary market:** [City, region]

**Communities and neighbourhoods served:**
List every specific community, neighbourhood, suburb, or quadrant mentioned.
- [Community 1]
- [Community 2]
- [Community 3]
*(Add as many as were mentioned)*

**Price ranges worked in:**
- Primary range: $[X] – $[X]
- Secondary range (if applicable): $[X]+ or $[X] and under

**Niche (if applicable):** [e.g., "New construction", "Luxury $1M+", "First-time buyers",
"Investment properties", "Relocations from out of province/state", or "General residential"]

**Secondary market (if applicable):**
- Location: [City/area]
- Focus: [What they do there, price range, client type]

**Top neighbourhoods buyers ask about:**
- [Neighbourhood 1] — [one line on why buyers want it]
- [Neighbourhood 2] — [one line on why buyers want it]
- [Neighbourhood 3] — [one line on why buyers want it]

**Underrated / up-and-coming area:**
[Neighbourhood or area the agent mentioned as overlooked — good for content]

**Why people move TO this market:**
[Captured from Q12 — reasons people relocate to or within this city]

**Why people leave this market:**
[Captured from Q20 — reasons people sell and move away]

**Common misconceptions about this market:**
[Captured from Q21 — what outsiders get wrong about living here]

---

## 3. TARGET AVATARS

*If the agent serves multiple distinct audiences, each avatar gets its own section.*

### Avatar 1 — [Give This Avatar a Short Name, e.g., "The Calgary First-Time Buyer"]

**Who they are:**
[2-3 sentences describing this client. Age range if mentioned, life stage, situation.
Written from what the agent shared about their best clients.]

**Why they're buying or selling:**
[The real reason driving the decision — captured from Q14]

**What they're worried about:**
[Their primary fears and stresses going into the transaction — captured from Q15]

**What they want from an agent:**
[How they want to be treated and what they value — captured from Q16]

**What they say after working with this agent:**
[Actual feedback language the agent mentioned — captured from Q17. Quote directly if possible.]

**Common questions they ask:**
[Captured from Q23 — the things this avatar always seems confused about]

**Why they hesitate:**
[The real reason they stay on the fence — captured from Q24]

**Content that resonates with them:**
[Topics and angles that speak directly to this avatar's situation]

---

### Avatar 2 — [Short Name] *(if applicable)*

[Same structure as Avatar 1]

---

### Avatar 3 — [Short Name] *(if applicable — keep brief if a third type came up)*

[Same structure — condensed if the agent only briefly mentioned this group]

---

### Who the agent does NOT want to work with:
[Captured from Q19 — the client type that's been a bad fit]

---

## 4. BRAND & VOICE

**How the agent describes themselves (in their own words):**
[Capture their answer to Q25 as close to verbatim as possible — this is their natural voice]

**What makes them different:**
[Their actual differentiator from Q26 — specific, not "great service"]

**Personality and on-camera style:**
[Captured from Q27 — formal/casual, energy level, communication style]

**This agent's voice sounds like:**
- [Characteristic 1 — e.g., "Direct and no-nonsense"]
- [Characteristic 2 — e.g., "Warm and locally rooted"]
- [Characteristic 3 — e.g., "Data-informed but plain-spoken"]

**This agent's voice NEVER sounds like:**
- [What they want to avoid from Q28]
- [Any style or tone they explicitly rejected]

**Signature phrases (if any):**
[Captured from Q29 — things they say repeatedly that clients respond to]
If none provided: "No signature phrases identified — use the agent's natural voice."

**What they want people to feel after engaging with their content:**
[Captured from Q30]

**Communication style reference (if provided):**
[Person or creator they mentioned in Q31 as a tone reference — for calibration only,
not to copy]

**Primary CTA:**
[Captured from Q32 — what they want people to do after engaging with content]
e.g., "Book a free consultation — [link]" / "Follow for [city] market updates" / "DM the agent"

---

## 5. CONTENT

**Topics the agent is most confident talking about:**
- [Topic 1]
- [Topic 2]
- [Topic 3]
*(Add all topics mentioned)*

**Topics to avoid:**
[Captured from Q34 — any hard limits on content]
If none mentioned: "No content restrictions identified."

**The one thing they wish buyers/sellers understood:**
[Captured verbatim from Q36 — this is often their best content angle]

---

## 6. LOCAL MARKET INTELLIGENCE

**Things buyers consistently get wrong about this market:**
[Captured from Q22]

**The real reason buyers/sellers hesitate in this market:**
[Captured from Q24 — the fear underneath the surface objection]

**What this agent knows about their market that most agents don't:**
[Captured from Q26 differentiator + any market-specific knowledge that came up]

---

## 7. USAGE NOTES FOR OTHER SKILLS

*Read this section before running any skill with this agent's Brain.*

- Always address content to the avatar(s) described in Section 3 — not a generic audience
- Use the city and community names from Section 2 specifically — never "locally" or "in your area"
- Match the voice characteristics in Section 4 — especially the "never sounds like" list
- Default CTA for all content: [pull from Section 4 Primary CTA]
- If this agent has multiple avatars, confirm which avatar a specific piece of content is targeting
  before generating — some videos speak to buyers, some to sellers, and the messaging is different
- Price range context: keep all examples and scenarios within the ranges in Section 2

---

*To update this file: re-run the realtor-brand-persona skill and rebuild from the interview.*
*The more specific this file is, the better every other skill performs.*
