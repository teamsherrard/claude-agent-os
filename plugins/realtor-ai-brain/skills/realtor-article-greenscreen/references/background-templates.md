# Background Templates — 9:16 Green Screen Visual Guide

## Core Layout Principle

Every background is split into two zones:
- **Agent zone** (40% of frame width): Left OR right side — completely clear of any text or cards.
  This is where the agent's face and body will appear via green screen.
- **Content zone** (60% of frame width): Opposite side — displays the article headline, stat, and source.

Alternate agent zone left/right across the batch so the feed looks varied.

---

## Canvas Specs

- Size: 1080 × 1920 px (9:16 — standard Instagram/TikTok vertical format)
- Safe zone for text: 60px padding from all edges
- Font: Use clean sans-serif (Inter, DM Sans, or system fallback)
- All backgrounds must be saved as PNG

---

## Template 1 — Stat Spotlight (Dark)

**Best for:** Market data, price changes, rate announcements, inventory reports

**Layout:**
```
┌─────────────────────────────┐
│ [SOURCE BADGE — top right]  │  ← 40px from top/right
│                             │
│  [AGENT   │  HEADLINE       │
│   ZONE    │  (2-3 lines,    │
│   40%     │  bold white,    │
│   clear]  │  40px font)     │
│           │                 │
│           │  ┌───────────┐  │
│           │  │ KEY STAT  │  │  ← Gold card, centered in content zone
│           │  │  LARGE    │  │     Stat in 72px bold
│           │  │  BOLD     │  │     Label in 24px below
│           │  └───────────┘  │
│                             │
│ [AGENT NAME • CITY]         │  ← Footer, 32px from bottom
└─────────────────────────────┘
```

**Colors:**
- Background: #111111
- Headline text: #FFFFFF
- Stat card background: Agent brand color (fallback: #B8973A dark gold)
- Stat text: #FFFFFF
- Source badge: Semi-transparent dark card with white text
- Footer: #888888

---

## Template 2 — Breaking News (Dark with Accent Bar)

**Best for:** Rate announcements, policy changes, unexpected market shifts

**Layout:**
```
┌─────────────────────────────┐
│ ▌ SOURCE NAME    [DATE]      │  ← Left accent bar in brand color, full height left edge
│ ▌                           │
│ ▌  [AGENT   │  "JUST IN" or │
│ ▌   ZONE    │  "NEW DATA"   │  ← Small label in brand color, 24px
│ ▌   40%     │               │
│ ▌   clear]  │  HEADLINE     │  ← 44px bold white, 2-3 lines
│ ▌           │               │
│ ▌           │  KEY STAT     │  ← 64px bold, brand color
│ ▌           │  [context]    │  ← 24px grey subtext
│ ▌                           │
│ ▌ [AGENT NAME • CITY]       │
└─────────────────────────────┘
```

**Colors:**
- Background: #0D0D0D
- Accent bar: Agent brand color (fallback: #B8973A), 8px wide, full height
- Headline: #FFFFFF
- Stat: Agent brand color
- Label ("JUST IN"): Agent brand color, all caps
- Footer: #666666

---

## Template 3 — Local Spotlight (Clean Light)

**Best for:** Local market updates, neighbourhood news, city-specific data

**Layout:**
```
┌─────────────────────────────┐
│  [CITY NAME — LARGE]        │  ← City name at top, 48px, brand color
│  MARKET UPDATE              │  ← Subline, 24px grey
│                             │
│  [AGENT   │  HEADLINE       │
│   ZONE    │  (dark text,    │
│   40%     │  40px,          │
│   clear]  │  2-3 lines)     │
│           │                 │
│           │  ┌───────────┐  │
│           │  │ KEY STAT  │  │  ← Brand color card
│           │  │  (dark    │  │
│           │  │   text)   │  │
│           │  └───────────┘  │
│           │                 │
│  [Source name]              │  ← Small source attribution, 20px
│  [AGENT NAME • CITY]        │
└─────────────────────────────┘
```

**Colors:**
- Background: #F8F7F4 (off-white)
- City name: Agent brand color (fallback: #B8973A)
- Headline: #111111
- Stat card: Agent brand color background, white text
- Source: #888888
- Footer: #444444

---

## Template 4 — Quote Card (Dark)

**Best for:** Expert predictions, market outlook quotes, surprising statements from officials

**Layout:**
```
┌─────────────────────────────┐
│                             │
│  [AGENT   │  "             │  ← Large opening quote mark, brand color
│   ZONE    │                 │
│   40%     │  PULL QUOTE    │  ← 36px, white, italic, centered in content zone
│   clear]  │  FROM ARTICLE  │     Max 20 words
│           │               "│  ← Closing quote mark
│           │                 │
│           │  — SOURCE NAME  │  ← Attribution, 22px, grey
│           │  [DATE]         │
│                             │
│  [AGENT NAME • CITY]        │
└─────────────────────────────┘
```

**Colors:**
- Background: #111111
- Quote marks: Agent brand color, 120px
- Quote text: #FFFFFF
- Attribution: #888888
- Footer: #666666

---

## Template 5 — Stats Stack (Dark)

**Best for:** Monthly market reports, board statistics, multi-data-point articles

**Layout:**
```
┌─────────────────────────────┐
│  REPORT TITLE (short)       │  ← 28px, grey, top
│  [Month] [Year]             │
│                             │
│  [AGENT   │  ┌──────────┐  │
│   ZONE    │  │ STAT 1   │  │  ← Brand color left border on each stat row
│   40%     │  │ +12% ▲   │  │     Stat: 48px bold white
│   clear]  │  │ [label]  │  │     Label: 20px grey
│           │  └──────────┘  │
│           │  ┌──────────┐  │
│           │  │ STAT 2   │  │
│           │  │ 14 days  │  │
│           │  │ avg DOM  │  │
│           │  └──────────┘  │
│           │  ┌──────────┐  │
│           │  │ STAT 3   │  │
│           │  │ $680K    │  │
│           │  │ avg price│  │
│           │  └──────────┘  │
│  [Source] [AGENT NAME•CITY] │
└─────────────────────────────┘
```

**Colors:**
- Background: #111111
- Stat rows: Left border in brand color, 6px
- Stat numbers: #FFFFFF, bold
- Labels: #888888
- Report title: #666666

---

## Brand Color Application

**Priority order:**
1. Pull primary brand color from agent's brand personality file in the Project
2. If provided during intake, use that
3. If neither — use #B8973A (dark gold) as the universal fallback accent

Apply the brand color to: accent bars, stat cards, quote marks, card borders, city name highlights.
The brand color should appear on every background — it's the consistent visual element that ties
the batch together and makes it feel like a cohesive content series from one agent.

---

## File Naming Convention

`[city-slug]_[article-topic-slug]_[template-name].png`

Examples:
- `calgary_inventory-low_stat-spotlight.png`
- `austin_rate-drop_breaking-news.png`
- `vancouver_local-sales_local-spotlight.png`
- `toronto_crea-forecast_quote-card.png`
- `calgary_market-report_stats-stack.png`

---

## Quality Check for Every Background

Before delivering:
- [ ] Canvas is exactly 1080 × 1920px
- [ ] Agent zone (40%) is completely clear of text and cards
- [ ] Left/right alternated correctly for this position in the batch
- [ ] Brand color applied to accent elements
- [ ] Source name visible (credibility anchor)
- [ ] Key stat is the largest text element in the content zone
- [ ] Agent name and city in footer
- [ ] Text is fully within safe zone (60px padding from edges)
- [ ] File saved as PNG, not JPG
