---
name: open-design-agent-kit
description: Comprehensive design agent toolkit for UI/UX architecture, layout prototyping, mobile/web component design systems, and token generation. Use whenever creating, styling, redesigning, or auditing app interfaces.
---

# Open Design Agent Kit

The **Open Design Agent Kit** enforces professional, cohesive, and intentional UI/UX design across mobile and web applications. It eliminates generic "AI boilerplate" styling (flat gray layouts, purple gradients with poor contrast, unstyled cards) in favor of rigorous design systems, systematic token hierarchies, and polished interactive component states.

---

## 1. Core Design Standards

Whenever building UI, frontend components, or screen layouts:

1. **Token-Driven Architecture**: Never hardcode colors, raw hex values, arbitrary pixel sizes, or inline typography styles into view components. Always route visual properties through semantic design tokens.
2. **Clean Separation of Concerns**: Keep the design system layer (`Theme.kt`, `theme.dart`, `tokens.css`) strictly isolated from business logic, networking, and data storage.
3. **Complete State Coverage**: Never design only the "happy path." Every component and screen must explicitly handle:
   - **Default** (resting state)
   - **Hover / Focus** (interactive web/desktop)
   - **Pressed / Active** (tactile mobile/web feedback)
   - **Disabled** (clear opacity and non-interactive affordance)
   - **Loading / Skeleton** (content placeholder pulse)
   - **Empty State** (informative icon, description, and primary CTA)
   - **Error / Failure** (clear feedback with recovery action)
4. **Anti-AI Slop Rules**:
   - Avoid generic pastel purple/blue linear gradients across entire pages.
   - Ensure WCAG AA contrast (minimum 4.5:1 for normal text, 3:1 for large text and UI controls).
   - Use intentional hierarchy: at most one prominent primary CTA per view; secondary and tertiary actions must be visually subordinated.
   - Avoid repetitive card nesting (cards inside cards inside cards with identical border radii).
   - Stress-test layout with extreme strings (very long names, 9-digit numbers) to prevent text clipping and overflow.

---

## 2. Design Token Architecture

A robust design system is structured into three token tiers:

```
[ Primitive Tokens ]  -->  [ Semantic Tokens ]  -->  [ Component Tokens ]
(e.g., Blue-600, Gray-900)  (e.g., surface, primary)   (e.g., button-bg, card-elevation)
```

### Color Token Roles

| Token Role | Description | Typical Dark Theme Role | Typical Light Theme Role |
| :--- | :--- | :--- | :--- |
| `primary` | Key brand accent, main action buttons | High-chroma vibrant tint (e.g. `#60A5FA` or `#38BDF8`) | Deep saturated shade (e.g. `#1D4ED8`) |
| `on-primary` | Text/icons placed over primary color | Contrast text (e.g. `#0F172A`) | White text (`#FFFFFF`) |
| `primary-container` | Low-emphasis primary surface (chips, badges) | Low-opacity primary overlay | Soft tint container (e.g. `#DBEAFE`) |
| `surface` | Base background of the screen | Deep dark (e.g. `#0B0F17` / `#121212`) | Crisp white / off-white (`#F8FAFC`) |
| `surface-container-low` | Subtle card / panel background | Layered dark (`#151C28`) | Light gray (`#F1F5F9`) |
| `surface-container-high`| Elevated dialogs, popovers, active cards | Elevated dark (`#1E293B`) | Clean white with shadow (`#FFFFFF`) |
| `outline` / `border` | Dividers, card boundaries, input borders | Subtle outline (`rgba(255, 255, 255, 0.12)`) | Subtle outline (`rgba(0, 0, 0, 0.12)`) |
| `text-primary` | High-emphasis body, titles, headings | High contrast (`#F8FAFC` or `rgba(255,255,255,0.95)`) | Deep slate (`#0F172A`) |
| `text-secondary` | Captions, metadata, hints | Muted text (`#94A3B8` or `rgba(255,255,255,0.65)`) | Slate gray (`#64748B`) |
| `error` | Destructive actions, validation alerts | High-visibility red/rose (`#F87171`) | Standard error red (`#DC2626`) |

### Typography Scale (8-point scale)

| Style | Scale / Size | Line Height | Weight | Usage |
| :--- | :--- | :--- | :--- | :--- |
| `Display` | 32sp - 40sp | 40sp - 48sp | Bold (700) | Marketing hero, onboarding splash |
| `Headline` | 24sp - 28sp | 32sp - 36sp | SemiBold (600) | Top-level screen title |
| `Title` | 18sp - 20sp | 24sp - 28sp | Medium / SemiBold | Card titles, section headers |
| `Body Large` | 16sp | 24sp | Regular (400) | Main reading text, input fields |
| `Body Medium`| 14sp | 20sp | Regular (400) | Secondary info, table rows |
| `Label Small`| 11sp - 12sp | 16sp | Medium (500) | Badges, timestamps, all-caps metadata |

### Spacing & Grid System

Strict 4dp/8dp base increment:
* `4dp` (xs) — tight icon-to-text spacing, small chip padding
* `8dp` (sm) — intra-card element spacing, compact button padding
* `12dp` (md) — standard element gaps
* `16dp` (lg) — default screen margin, standard card interior padding
* `24dp` (xl) — section separation, grouped card spacing
* `32dp` (2xl) — major layout block separation

---

## 3. Platform Implementation Blueprints

### A. Android Jetpack Compose (Material 3)

Isolate tokens into `ui/theme/`:
* `Color.kt`: Define color palette.
* `Type.kt`: Define typography scale using standard font families.
* `Shape.kt`: Corner shape hierarchy (e.g. `RoundedCornerShape(12.dp)` for cards).
* `Theme.kt`: Provides `MaterialTheme(colorScheme = ..., typography = ..., shapes = ...)` with automatic dark/light theme detection and optional dynamic color.

```kotlin
// Example clean Compose token usage
@Composable
fun MetricCard(
    title: String,
    value: String,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.fillMaxWidth(),
        shape = MaterialTheme.shapes.medium,
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceContainerLow
        )
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                text = title.uppercase(),
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = value,
                style = MaterialTheme.typography.headlineMedium,
                color = MaterialTheme.colorScheme.onSurface
            )
        }
    }
}
```

### B. Flutter

Structure tokens in `lib/theme/`:
* Define `ThemeData` utilizing `ColorScheme.fromSeed(...)` or explicit `ColorScheme`.
* Extend with `ThemeExtension<AppCustomTokens>` for app-specific semantic tokens (e.g. status indicator colors, telemetry glow).
* Use `Theme.of(context).colorScheme` throughout widgets.

### C. Modern Web / Tailwind / CSS Variables

Structure tokens in CSS custom properties and expose them through Tailwind:

```css
:root {
  --color-surface: #0b0f17;
  --color-surface-container: #151c28;
  --color-primary: #38bdf8;
  --color-text-primary: #f8fafc;
  --color-text-secondary: #94a3b8;
  --radius-card: 12px;
}
```

---

## 4. Layout & Navigation Patterns

1. **Dashboard & Telemetry (High Density)**:
   - Use Bento grids for heterogeneous metrics.
   - High-contrast figures with subdued all-caps labels.
   - Status indicators with clear semantic colors (green/emerald for operational, amber for warning, rose for critical).
2. **Settings & Form Layouts**:
   - Group related settings into distinct card containers.
   - Use switch toggles, disclosure arrows, and inline validation helpers.
   - Keep destructive actions isolated at the bottom with prominent confirmation dialogs.
3. **Responsive Mobile Shell**:
   - Compact screens: Bottom `NavigationBar` (3-5 items) with visible active indicator.
   - Expanded / Tablet screens: Left-aligned `NavigationRail` or persistent `NavigationDrawer`.

---

## 5. Bundled References & Tooling

This skill bundles the complete Open Design reference library located in the `references/` subdirectory:
* **`references/guides/`**:
  - `app-screens.md`: Detailed guidance on mobile & web app screen flows, device frames, and realistic sample data.
  - `component-library.md`: Standard component architecture and atomic building blocks.
  - `design-systems.md`: In-depth token mapping, typography ratios, and brand styling.
  - `impeccable.md`: Anti-slop craft standards and audit rules.
  - `promote-to-app-code.md`: Runbook for promoting UI prototypes into idiomatic production code.
  - `site-audit.md`: Checklist for auditing layout, accessibility, and visual rhythm.
* **`references/design-systems/`**: Over 150 brand-tested design systems and token packs (including Apple, Airbnb, Bento, Linear, Monzo, Spotify, and more).
