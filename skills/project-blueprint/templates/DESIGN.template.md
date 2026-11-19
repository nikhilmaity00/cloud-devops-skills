# UI/UX & Design System Standards

**Project Name:** [Project Name]  
**Design Standard Reference:** [`open-design-agent-kit`](skills/open-design-agent-kit/SKILL.md)  
**Theme Mode Support:** Dark Theme (Default) + Light Theme

---

## 1. Visual Identity & Anti-AI Slop Mandate
* **Core Aesthetic:** [e.g. Modern Minimalist Tech / Telemetry Dark / Clean Enterprise / Warm Editorial]
* **Anti-Slop Directives:**
  * ❌ No gratuitous purple/cyan gradient backgrounds with zero contrast.
  * ❌ No uniform border-radius on every nested container (e.g., cards inside cards with identical rounding).
  * ❌ No unstyled, flat gray AI boilerplate templates.
  * ✅ Enforce intentional typographic scale, deliberate whitespace, and high-contrast WCAG AA compliant text.

---

## 2. Design Tokens

### Color Roles

| Token | Dark Theme Value | Light Theme Value | Semantic Role |
| :--- | :--- | :--- | :--- |
| `primary` | `[#60A5FA / #38BDF8]` | `[#1D4ED8]` | Key brand accent, primary CTA buttons |
| `on-primary` | `[#0F172A]` | `[#FFFFFF]` | High-contrast text on primary background |
| `primary-container`| `[rgba(56,189,248,0.15)]`| `[#DBEAFE]` | Subtle container tint, active chip background |
| `surface` | `[#0B0F17 / #121212]` | `[#F8FAFC]` | Base application background |
| `surface-container`| `[#151C28 / #1E293B]` | `[#FFFFFF]` | Cards, dialogs, elevated containers |
| `border` / `outline`| `[rgba(255,255,255,0.12)]`| `[rgba(0,0,0,0.12)]`| Card outlines, field borders, subtle dividers |
| `text-primary` | `[#F8FAFC]` | `[#0F172A]` | Main titles, high-emphasis body text |
| `text-secondary` | `[#94A3B8]` | `[#64748B]` | Subtitles, labels, metadata, muted hints |
| `error` | `[#F87171]` | `[#DC2626]` | Destructive actions, validation alerts |

### Typography Scale (8-Point Modular Scale)

| Style | Size | Line Height | Weight | Typical Usage |
| :--- | :--- | :--- | :--- | :--- |
| `Headline Large` | 28sp / 28px | 36sp / 36px | Bold (700) | Screen titles |
| `Headline Medium`| 22sp / 22px | 28sp / 28px | SemiBold (600) | Section headers |
| `Title Medium` | 16sp / 16px | 24sp / 24px | Medium (500) | Card headers, list item titles |
| `Body Large` | 15sp / 15px | 22sp / 22px | Regular (400) | Primary content, form inputs |
| `Body Medium` | 13sp / 13px | 18sp / 18px | Regular (400) | Secondary info, table rows |
| `Label Small` | 11sp / 11px | 16sp / 16px | Medium (500) | Badges, all-caps metadata |

### Spacing & Elevation Grid
* **Spacing Scale:** Base `4px` / `8px` increments:
  * `4px` (xs): Tight icon-to-label gaps
  * `8px` (sm): Inter-card element spacing, compact control padding
  * `16px` (md): Standard screen margins, card interior padding
  * `24px` (lg): Major section separation
  * `32px` (xl): Hero block margins
* **Corner Radii:**
  * Small controls / buttons: `8px`
  * Standard cards / dialogs: `12px` - `16px`
  * Pills / status badges: `9999px`

---

## 3. Component Standards & Full State Matrix

Every interactive component and data container must support the complete state lifecycle:

| State | Visual Treatment | Example |
| :--- | :--- | :--- |
| **Default** | Standard resting token colors. | Solid card with subtle border |
| **Hover / Focus** | Elevated brightness or subtle ring. | `outline: 2px solid primary` |
| **Pressed / Active** | Tactile feedback, slight scale reduction (`scale(0.98)`). | Ripple / pressed surface tint |
| **Disabled** | 40% opacity, non-interactive cursor. | Muted text and disabled input |
| **Loading / Skeleton**| Shimmer pulse with matching component dimensions. | Skeleton box replacing text/image |
| **Empty State** | Descriptive icon, concise message, and primary CTA. | "No devices found. [Add Device]" |
| **Error State** | Clear error outline, red validation text, retry CTA. | Red border with error helper text |

---

## 4. Layout Architecture & Screen Templates
* **Mobile Layouts:** TopAppBar + Content Container + Bottom Navigation Bar.
* **Desktop / Web Layouts:** Persistent Left Navigation Rail (or Collapsible Sidebar) + Fluid Main Content Area + Header Actions.
* **Information Density:** High-density telemetry cards (Bento layout) for operational and dashboard screens.
