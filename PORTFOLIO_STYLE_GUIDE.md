# Portfolio Style Guide — Ori Cohen
## System Prompt for any new Claude session working on this portfolio

---

## Context

We are building the portfolio website of Ori Cohen, a Senior Product Designer at Verint.
The portfolio consists of three HTML files: `index.html`, `lux-case-study.html`, `myverint-case-study.html`.

**This is a designer's portfolio. Every pixel counts. Consistency is non-negotiable.**
No shortcuts. No approximations. If something does not match the spec below, fix it.

---

## Design Language

**Philosophy:** LUX 2.0 dark mode — Verint's enterprise design system adapted for a portfolio context.
Clean, data-dense, professional. No decoration for decoration's sake. Every element earns its place.
Inter font. Solid borders (not alpha). Compact radius. Zero letter-spacing on body text.

---

## Design Tokens

All three pages share these exact CSS custom properties:

```css
:root {
  /* Surfaces */
  --bg:      #121213;   /* page background */
  --bg-2:    #0E0F11;   /* alternate section background */
  --surface: #1A1B1E;   /* subtle raised surface */
  --card:    #232425;   /* card / panel */
  --card-h:  #353738;   /* card hover state */

  /* Borders — always solid, never alpha */
  --border:  #3A3C3E;   /* default border */
  --border-m:#46494B;   /* medium / hover border */
  --border-b:#585B5E;   /* bold / divider */

  /* Text */
  --ink:     #F7F8F8;   /* primary text */
  --ink-2:   #C0C5C9;   /* secondary text */
  --ink-3:   #9DA4AA;   /* tertiary / labels */

  /* Brand */
  --blue:    #66AFFF;   /* LUX dark mode blue (primary accent) */
  --green:   #66E2B0;   /* LUX dark mode success */
  --amber:   #FCA878;   /* LUX dark mode warning */
  --red:     #F78080;   /* LUX dark mode error */

  /* Typography */
  --f: 'Inter', -apple-system, sans-serif;

  /* Radius scale */
  --r-xs:   2px;
  --r-sm:   4px;    /* chips, badges, buttons */
  --r-md:   8px;    /* cards, inputs — DEFAULT */
  --r-lg:   12px;   /* larger cards, modals */
  --r-xl:   16px;   /* page-level elements */
  --r-full: 9999px; /* pills */

  /* Motion */
  --ease:   cubic-bezier(.4,0,.2,1);
  --spring: cubic-bezier(.22,.68,0,1.2);
}
```

**Google Font link (identical in all files):**
```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>
```

---

## Typography Scale

| Use | Size | Weight | Tracking | Line-height |
|-----|------|--------|----------|-------------|
| Hero H1 | `clamp(52px, 8vw, 88px)` | 800 | `-3px` | `.93` |
| Section H2 | `clamp(28px, 4vw, 44px)` | 700 | `-1.5px` | `1.1` |
| Sub-section H3 | `clamp(22px, 3vw, 32px)` | 700 | `-1px` | `1.1` |
| Hero subtitle | `15px` | 400 | `0` | `1.7` |
| Body default | `14px` | 400 | `0` | `1.75` |
| Body small | `12px` | 400 | `0` | `1.7` |
| Label / eyebrow | `10px` | 600 | `.12em` | — |
| Tag / meta | `11px` | 600 | `0` | — |
| Annotation title | `13px` | 600 | `-.2px` | — |
| Annotation body | `12px` | 400 | `0` | `1.72` |

**Rule:** No letter-spacing on body text. Letter-spacing only on labels/eyebrows (`.12em`) and hero title (`-3px`).

---

## Spacing System

**Section padding:** `96px 0` — every `<section>` on every page.
**Hero padding:** `120px 0 72px` (top accounts for fixed nav height of ~57px).
**Max content width:** `1080px` (`max-width: 1080px; margin: 0 auto;`).

| Name | Value | Use |
|------|-------|-----|
| Container desktop | `64px` L/R | `.wrap` padding |
| Container tablet | `32px` L/R | `≤900px` |
| Container mobile | `20px` L/R | `≤640px` |
| Card padding default | `24px` | `.card` |
| Card padding compact | `20px` | smaller cards |
| Grid gap large | `64px` | 2-col split layout |
| Grid gap cards | `12px` | card grids |
| Stack gap | `48px` | `margin-top` between major blocks within a section |
| Stack gap small | `32px` | minor blocks |

---

## Component Patterns

### Navigation (case studies)
Fixed top. Height `57px` (16px top/bottom padding + content).
Background: `rgba(18,18,19,.92)` + `backdrop-filter: blur(20px)`.
Border bottom: `1px solid var(--border)`.
Left: back link (12px/600, chevron icon, `var(--ink-2)` → `var(--ink)` on hover).
Center: label (10px/600, uppercase, `var(--ink-3)`).
Right: pill status badge.

### Section Eyebrow (`.sec-tag`)
```css
.sec-tag {
  font-size: 10px; font-weight: 600; letter-spacing: .12em;
  text-transform: uppercase; color: var(--ink-3);
  display: flex; align-items: center; gap: 8px; margin-bottom: 14px;
}
.sec-tag::before {
  content: ''; width: 20px; height: 1px; background: var(--border-b);
}
```

### Section Title (`.sec-title`)
```css
.sec-title {
  font-size: clamp(28px, 4vw, 44px);
  font-weight: 700; letter-spacing: -1.5px; line-height: 1.1; margin-bottom: 14px;
}
```

### Cards
- Background: `var(--card)`
- Border: `1px solid var(--border)`
- Border-radius: `var(--r-md)` (8px) default
- Padding: `24px 20px`
- Hover: `background: var(--card-h); border-color: var(--border-m);`

### Chips / Tags
- Border-radius: `var(--r-sm)` (4px)
- Font: `10px / 600`
- Padding: `3px 8px`
- Colors: use contextual LUX chip colors (blue, green, amber, red)

### Reveal animation
```css
.reveal { opacity: 0; transform: translateY(24px); transition: opacity .6s var(--ease), transform .6s var(--ease); }
.reveal.visible { opacity: 1; transform: none; }
```
(Note: case studies use `.visible` class. Homepage uses `.in` class. Unify to `.visible` in future.)

---

## Case Study Structure

Every case study follows this exact section order:
1. **Hero** — project name, one-line description, meta chips (role, platform, year)
2. **Situation** — the context / problem before the work
3. **Work** — scope, role, what was designed
4. **Flow** — the user flow / process diagram
5. **Showcase** — 2–3 key screens with phone frame + annotations
6. **Rationale** — 3 design principle cards
7. **Outcome** — metrics + quote
8. **Footer** — back link

### Section connectors (`.bridge`)
Between major sections, a bridge element signals "what comes next":
```html
<div class="bridge">
  <div class="bridge-icon"><!-- down arrow SVG --></div>
  <p class="bridge-text">One sentence leading into the next section.</p>
</div>
```

### Step connectors (between showcase steps)
Vertical centered connector with icon + italic caption:
```html
<div class="step-connector">
  <div class="step-connector-line">
    <div class="step-connector-line-top"></div>
    <div class="step-connector-icon"><!-- down arrow SVG --></div>
    <div class="step-connector-line-bot"></div>
  </div>
  <p class="step-connector-text">One italic sentence bridging the two screens.</p>
</div>
```

---

## Phone Mockup (MyVerint case study)

The phone frame is a pure HTML/CSS iOS device:
- Outer frame: `270px` wide, `border-radius: 50px`, dark aluminum gradient
- Inner screen: `250×540px`, `border-radius: 40px`, `overflow: hidden`, **`position: relative`** (critical!)
- Screen content: `390×844px` div, `transform: scale(0.641)`, `transform-origin: top left`, `position: absolute; top:0; left:0`
- Scale math: `390 × 0.641 = 250px` (matches inner width exactly)

Phone layout grid: `grid-template-columns: 290px 1fr; gap: 56px; align-items: start;`
Flip variant (alternating): `grid-template-columns: 1fr 290px;`

---

## Writing Tone

- **Not:** "I designed a beautiful form that thoughtfully addresses user needs."
- **Yes:** "The form has eight inputs. The organizing question was: what does an agent need to give you, and what can you infer?"

- **Not:** "I made deliberate choices to optimize the user experience."
- **Yes:** "The status timeline is the first element below the fold — visible without scrolling."

Observational, specific, story-driven. The reader should say "wow, there's a clear process here," not "this person is impressive."

**No emoji anywhere.**

---

## Files

| File | Purpose |
|------|---------|
| `index.html` | Homepage — hero, about, work grid, contact |
| `lux-case-study.html` | LUX 2.0 design system case study |
| `myverint-case-study.html` | MyVerint mobile app case study |
| `PORTFOLIO_STYLE_GUIDE.md` | This document |

All files are in `/outputs/ori-cohen-portfolio/`.
Images are in `/outputs/ori-cohen-portfolio/Images/`.

---

## What Consistency Means Here

- Same font loading: Inter, same weights
- Same CSS custom properties, same values
- Same section padding: `96px 0`
- Same max-width: `1080px`
- Same nav height and style
- Same eyebrow label style: `.sec-tag` pattern
- Same section title size and tracking
- Same card style: `--r-md` radius, `--border` border, `--card` background
- Same chip/tag style
- Same reveal animation class (`.visible`)
- Zero hardcoded colors that bypass the token system

If a value exists in `:root`, reference it via `var()`. Never hardcode `#121213` directly in component styles — use `var(--bg)`.
