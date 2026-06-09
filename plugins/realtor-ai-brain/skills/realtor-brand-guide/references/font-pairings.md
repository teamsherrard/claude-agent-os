# Font Pairings Reference

All fonts available via Google Fonts CDN. Import both fonts together:
```html
<link href="https://fonts.googleapis.com/css2?family=DISPLAY_FONT:wght@400;700&family=BODY_FONT:wght@300;400;500&display=swap" rel="stylesheet">
```

---

## Luxury & Refined

**Pairing 1: Cormorant + Jost**
- Display: `Cormorant Garamond` — editorial, high fashion, timeless
- Body: `Jost` — geometric, clean, pairs perfectly with serifs
- Best for: Luxury listings, high-end market, aspirational brand
- Import: `family=Cormorant+Garamond:wght@400;600&family=Jost:wght@300;400;500`

**Pairing 2: Playfair Display + Lato**
- Display: `Playfair Display` — classic editorial, slightly dramatic
- Body: `Lato` — humanist, warm, highly readable
- Best for: Premium but approachable, established agent
- Import: `family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700`

---

## Clean & Modern

**Pairing 3: DM Serif Display + DM Sans**
- Display: `DM Serif Display` — contemporary serif with character
- Body: `DM Sans` — its perfect companion, optical sizing matched
- Best for: Modern professional, design-forward agent
- Import: `family=DM+Serif+Display&family=DM+Sans:wght@300;400;500`

**Pairing 4: Josefin Sans + Nunito**
- Display: `Josefin Sans` — geometric, art-deco influenced, distinctive
- Body: `Nunito` — round, friendly, approachable
- Best for: Lifestyle-focused brand, millennial market
- Import: `family=Josefin+Sans:wght@300;400;700&family=Nunito:wght@300;400;600`

---

## Bold & Urban

**Pairing 5: Bebas Neue + Plus Jakarta Sans**
- Display: `Bebas Neue` — all-caps condensed, strong presence
- Body: `Plus Jakarta Sans` — modern, slightly quirky, pairs well with strong display
- Best for: Urban market, high-energy brand, investor-focused
- Import: `family=Bebas+Neue&family=Plus+Jakarta+Sans:wght@300;400;500`

**Pairing 6: Black Han Sans + Work Sans**
- Display: `Black Han Sans` — heavy weight, commanding
- Body: `Work Sans` — optimized for screen, clean
- Best for: Bold brand, disruption positioning
- Import: `family=Black+Han+Sans&family=Work+Sans:wght@300;400;500`

---

## Warm & Approachable

**Pairing 7: Libre Baskerville + Source Sans 3**
- Display: `Libre Baskerville` — warm serif, trustworthy, readable
- Body: `Source Sans 3` — clean, professional, print-tested
- Best for: Community-focused agent, family neighborhoods, referral-heavy business
- Import: `family=Libre+Baskerville:wght@400;700&family=Source+Sans+3:wght@300;400;600`

**Pairing 8: Raleway + Open Sans**
- Display: `Raleway` — thin-to-bold range, elegant art-deco feel
- Body: `Open Sans` — highly legible, universal, trusted
- Best for: Versatile, works across all markets
- Import: `family=Raleway:wght@300;400;700&family=Open+Sans:wght@300;400;600`

---

## Creative & Distinctive

**Pairing 9: Syne + Outfit**
- Display: `Syne` — contemporary, slightly irregular, memorable
- Body: `Outfit` — variable font, modern feel
- Best for: Design-forward, creative agent differentiating from competition
- Import: `family=Syne:wght@400;700;800&family=Outfit:wght@300;400;500`

**Pairing 10: Fraunces + Manrope**
- Display: `Fraunces` — optical size variable serif, soft and refined
- Body: `Manrope` — geometric, precise, excellent readability
- Best for: Premium brand with warmth, luxury without coldness
- Import: `family=Fraunces:opsz,wght@9..144,400;9..144,700&family=Manrope:wght@300;400;600`

---

## Typography Scale (apply to all guides)

```css
h1 { font-family: var(--font-display); font-size: 3.5rem; font-weight: 700; letter-spacing: -0.02em; }
h2 { font-family: var(--font-display); font-size: 2.25rem; font-weight: 600; }
h3 { font-family: var(--font-display); font-size: 1.5rem; font-weight: 500; }
.label { font-family: var(--font-body); font-size: 0.75rem; font-weight: 500; letter-spacing: 0.12em; text-transform: uppercase; }
p { font-family: var(--font-body); font-size: 1rem; font-weight: 400; line-height: 1.7; }
.caption { font-family: var(--font-body); font-size: 0.875rem; font-weight: 300; }
```

---

## Canva Availability Reference

Use this when populating the Canva brief. Always provide a fallback for Pro/Google-only fonts.

| Display Font | Canva Free | Canva Pro | Fallback (Free) |
|---|---|---|---|
| Playfair Display | ✓ | ✓ | ✓ No fallback needed |
| Cormorant Garamond | ✗ | ✗ | Use Playfair Display |
| Libre Baskerville | ✓ | ✓ | ✓ No fallback needed |
| DM Serif Display | ✓ | ✓ | ✓ No fallback needed |
| Fraunces | ✗ | ✗ | Use DM Serif Display |
| Josefin Sans | ✓ | ✓ | ✓ No fallback needed |
| Bebas Neue | ✓ | ✓ | ✓ No fallback needed |
| Syne | ✗ | ◐ | Use Josefin Sans |
| Raleway | ✓ | ✓ | ✓ No fallback needed |
| Barlow Condensed | ✓ | ✓ | ✓ No fallback needed |
| Black Han Sans | ✓ | ✓ | ✓ No fallback needed |

| Body Font | Canva Free | Canva Pro | Fallback (Free) |
|---|---|---|---|
| Source Sans 3 | ✓ | ✓ | ✓ No fallback needed |
| DM Sans | ✓ | ✓ | ✓ No fallback needed |
| Lato | ✓ | ✓ | ✓ No fallback needed |
| Nunito | ✓ | ✓ | ✓ No fallback needed |
| Plus Jakarta Sans | ✗ | ◐ | Use DM Sans |
| Outfit | ✗ | ◐ | Use DM Sans |
| Manrope | ✗ | ◐ | Use Lato |
| Work Sans | ✓ | ✓ | ✓ No fallback needed |
| Montserrat | ✓ | ✓ | ✓ No fallback needed |
| Open Sans | ✓ | ✓ | ✓ No fallback needed |

**Recommended "always works" pairings for Canva Free:**
- Playfair Display + Lato (luxury, prestige)
- Libre Baskerville + Source Sans 3 (warm, approachable)
- Bebas Neue + Montserrat (bold, urban)
- Josefin Sans + Open Sans (clean, modern)
- Raleway + Work Sans (elegant, contemporary)
- DM Serif Display + DM Sans (editorial, design-forward)
