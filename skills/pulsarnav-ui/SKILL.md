---
name: pulsarnav-ui
description: >
  PulsarNav dark-theme Android UI design system. Use when building new Android apps that
  should match the PulsarNav visual language — dark background, multi-theme accent colors,
  card-based layout, ViewBinding, Material3 components, all-caps section labels, and
  functional-only copy with zero decorative fluff. Extracted from a vibe-coded Android app,
  so patterns are pragmatic rather than aspirational.
---

# PulsarNav UI System

This skill documents the exact design language used in PulsarNav — a Bluetooth companion app
for Bajaj motorcycles. It is a fully vibe-coded project, so the patterns here reflect what
actually shipped, not a theoretical ideal. Expect some inconsistencies; they're real.

Use this as a reference when building a new Android app that should feel like PulsarNav.

---

## When to Activate

Activate this skill when the user says things like:
- "make it look like PulsarNav"
- "use the PulsarNav design system"
- "dark themed Android app like the bike app"
- "reuse the UI from the previous project"
- "pulsarnav-ui"

---

## Design Philosophy

- Dark-first. The app never uses a pure light theme as the main experience.
- Functional only. Every piece of text in the UI is a label, value, or action. No taglines, no marketing copy, no decorative phrases.
- Section labels are ALL CAPS, small, and muted. They act as column headers, not titles.
- No emoji anywhere in the UI.
- Cards carry all content. Nothing floats loose on the background.
- Status is always visible. Connection state, hardware warnings, and permissions appear in the top bar at all times — the user should never have to hunt for why something isn't working.
- Buttons are glove-friendly. Primary actions are tall (50dp), full-width, and high-contrast.
- Accent color is the only real color in the UI. Everything else is a shade of near-black, dark gray, or muted white.

---

## Color System

### Base Palette (from `colors.xml`)

These are the raw named tokens. All theme colors derive from these.

```xml
<!-- Default light surface (used in light mode fallback) -->
<color name="background">#F4F5F8</color>
<color name="surface">#FFFFFF</color>
<color name="surface_card">#FFFFFF</color>
<color name="surface_elevated">#EAECEF</color>
<color name="surface_border">#E2E8F0</color>
<color name="surface_border_subtle">#CBD5E1</color>

<!-- Typography -->
<color name="text_primary">#0F172A</color>
<color name="text_secondary">#475569</color>
<color name="text_tertiary">#64748B</color>

<!-- Status -->
<color name="status_connected">#22C55E</color>
<color name="status_connected_subtle">#132B1C</color>
<color name="status_connected_border">#1D4A2B</color>
<color name="status_scanning">#F59E0B</color>
<color name="status_scanning_subtle">#2D2012</color>
<color name="status_scanning_border">#4E3517</color>
<color name="status_disconnected">#9E1B32</color>
<color name="status_disconnected_subtle">#2C1218</color>
```

> [!NOTE]
> The app ships with a DayNight Material3 theme. In practice, it defaults to dark mode
> (`isDarkMode = true` in AppSettings). The colors above are the light-mode XML values;
> the runtime theme system overrides them for dark mode (see Theme System section).

### Accent Themes (6 options)

Each theme is defined in `AppSettings.kt` as a constant string key. The UI reads the key
and applies the matching color set at runtime via `applyTheme()`.

| Theme key   | Primary (button, progress)  | Accent (light variant)  | Subtle (bg tint)  | Border            |
|-------------|-----------------------------|-------------------------|-------------------|-------------------|
| `wine_red`  | `#9E1B32`                   | `#C92A45`               | `#2C1218`         | `#541B26`         |
| `amoled`    | `#F8FAFC` (white on black)  | `#FFFFFF`               | `#141418`         | `#383844`         |
| `stealth`   | `#475569`                   | `#94A3B8`               | `#1E293B`         | `#334155`         |
| `amber`     | `#D97706`                   | `#F59E0B`               | `#2E1E08`         | `#5C3D10`         |
| `mint`      | `#059669`                   | `#10B981`               | `#0D2E21`         | `#134E35`         |
| `blue`      | `#0284C7`                   | `#38BDF8`               | `#0C253B`         | `#144566`         |

**Dark mode background stack** (applied programmatically):
- Root background: `#111827` (very dark navy/charcoal)
- Card surface: `#1E2433`
- Elevated surface: `#252D3D`
- Border: `#2D3748`
- Text primary: `#F1F5F9`
- Text secondary: `#94A3B8`
- Text tertiary: `#64748B`

For AMOLED theme, background collapses to `#000000` and card to `#0A0A0C`.

### Semantic Color Usage Rules

| Use case                   | Token / hex                          |
|----------------------------|--------------------------------------|
| Primary button fill        | Accent primary (e.g. `#9E1B32`)      |
| Primary button text        | `#FFFFFF`                            |
| Outlined button border     | Accent border                        |
| Outlined button text       | Accent light                         |
| Outlined button fill       | Accent subtle                        |
| Section label text         | `text_tertiary`                      |
| Body value text            | `text_primary`                       |
| Subtitle / hint            | `text_secondary`                     |
| Accent link / badge text   | Accent light                         |
| Warning badge text/icon    | `#F59E0B` (amber, regardless of theme)|
| Connected dot              | `#22C55E`                            |
| Disconnected dot           | Accent primary                       |
| Scanning dot               | `#F59E0B`                            |
| Card background            | Surface card color                   |
| Card stroke                | Surface border color                 |
| Progress track             | Surface border                       |
| Progress indicator         | Accent primary                       |

---

## Typography

### Scale (from `dimens.xml`)

| Token              | Size    | Usage                                              |
|--------------------|---------|----------------------------------------------------|
| `text_hero`        | 40–44sp | Big metric display (range km, speed, tank %)       |
| `text_headline`    | 20–22sp | App bar title, screen header                       |
| `text_card_title`  | 15–16sp | Card primary value label                           |
| `text_body_primary`| 14sp    | Main body text, card body content                  |
| `text_body_secondary`| 13sp  | Supporting body text                               |
| `text_caption`     | 12sp    | Secondary labels, button text in compact buttons   |
| `text_meta`        | 11sp    | ALL CAPS section headers, timestamps, sub-hints    |
| `text_badge`       | 9–10sp  | Badge pills, inline warning chips                  |

### Typography Rules

1. **ALL CAPS for section headers.** Use `android:textAllCaps="true"` or type in caps directly in the string resource. Add `android:letterSpacing="0.06"` to `0.08`.
2. **Bold everywhere that matters.** Section headers, card titles, values, button text — all bold. `android:textStyle="bold"`.
3. **No italic.** None, anywhere.
4. **Hero numbers use tight tracking.** `android:letterSpacing="-0.04"` for large metric numbers.
5. **App title uses slight negative tracking.** `android:letterSpacing="-0.02"`.
6. **Status text uses positive tracking.** `android:letterSpacing="0.08"` for the connection status text next to the dot.
7. **Font family:** System default (Roboto). Do not import a custom font unless the app has a strong brand reason.

---

## Dimension Tokens (from `dimens.xml`)

```xml
<!-- Screen padding -->
screen_padding_horizontal = 16dp
screen_padding_top        = 12dp
screen_padding_bottom     = 24dp

<!-- Cards -->
card_corner_radius        = 16dp
card_corner_radius_small  = 12dp
card_corner_radius_pill   = 999dp
card_stroke_width         = 1dp
card_stroke_width_thick   = 1.5dp
card_padding              = 16dp
card_margin_bottom        = 12dp

<!-- Buttons -->
btn_height_primary        = 50dp
btn_height_secondary      = 48dp
btn_height_compact        = 36dp
btn_corner_radius         = 12dp
btn_corner_radius_compact = 8dp

<!-- Section spacing -->
section_header_margin_top    = 16dp
section_header_margin_bottom = 8dp
```

---

## Layout Architecture

### Root Layout

The root is a `RelativeLayout` with `android:background="@color/background"`. Three
main regions are pinned with `RelativeLayout` rules:

```
RelativeLayout (root)
  LinearLayout (top bar)          -- alignParentTop
  View (top divider, 1dp)         -- below top bar
  FrameLayout (content frame)     -- below divider, above bottom nav
  BottomNavigationView (bottom)   -- alignParentBottom
```

### Top App Bar

A `LinearLayout` (horizontal) with `paddingHorizontal="20dp"`, `paddingVertical="14dp"`:

```
LinearLayout (horizontal, weight split)
  LinearLayout (weight=1, horizontal)
    TextView  -- app name, 22sp bold, letterSpacing -0.02
    View      -- 8dp circle dot (connection dot)
    TextView  -- "OFFLINE" / "CONNECTED", 9sp bold, letterSpacing 0.08
    LinearLayout (hardware warnings row)
      TextView (badge) -- "BT OFF"    -- visibility=gone when hardware OK
      TextView (badge) -- "GPS OFF"   -- visibility=gone when hardware OK
      TextView (badge) -- "PERMS NEEDED" -- visibility=gone when perms OK
  MaterialButton -- "SOS", 36dp height, pill shape, outlined accent style
```

**Top divider:** A 1dp `View` with `background="@color/surface_border_subtle"` separates
the top bar from the content.

### Bottom Navigation

Standard `BottomNavigationView` from Material3. 4 tabs. The tab icons and labels must be
functional (no decorative additions). The nav bar background matches the root background
color (not an elevated surface).

### Content Frame

A `FrameLayout` that hosts all tabs as `View.VISIBLE` / `View.GONE` swaps, or as fragment
containers. The active approach in PulsarNav: direct view references swapped via `when`
in `onNavigationItemSelected`. This is pragmatic for a small app; for a larger app use
`NavController`.

### Tab Content Layout

Each tab is a `NestedScrollView` (or `RecyclerView` for lists) with:
- `paddingHorizontal="16dp"`
- `paddingTop="12dp"`
- `paddingBottom="24dp"`

Content inside is a vertical `LinearLayout` stacking `MaterialCardView` elements with
`layout_marginBottom="12dp"` between them.

---

## Component Patterns

### Standard Card

```xml
<com.google.android.material.card.MaterialCardView
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:layout_marginBottom="@dimen/card_margin_bottom"
    app:cardBackgroundColor="@color/surface_card"
    app:cardCornerRadius="@dimen/card_corner_radius"
    app:cardElevation="0dp"
    app:strokeColor="@color/surface_border"
    app:strokeWidth="@dimen/card_stroke_width">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        android:padding="@dimen/card_padding">

        <!-- Section header row -->
        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:gravity="center_vertical"
            android:orientation="horizontal">

            <TextView
                android:layout_width="0dp"
                android:layout_height="wrap_content"
                android:layout_weight="1"
                android:letterSpacing="0.08"
                android:text="SECTION LABEL"
                android:textColor="@color/text_tertiary"
                android:textSize="11sp"
                android:textStyle="bold" />

            <!-- Optional: trailing badge or small tonal button -->

        </LinearLayout>

        <!-- Card body content here -->

    </LinearLayout>
</com.google.android.material.card.MaterialCardView>
```

> [!NOTE]
> `cardElevation="0dp"` always. Depth is communicated via stroke and background contrast,
> not shadow. This prevents the double-shadow look on dark backgrounds.

### Primary Action Button (Full Width)

```xml
<com.google.android.material.button.MaterialButton
    android:layout_width="match_parent"
    android:layout_height="@dimen/btn_height_primary"
    android:backgroundTint="@color/wine_red"
    android:text="Start Ride with Google Maps"
    android:textColor="@color/on_primary"
    android:textSize="15sp"
    android:textStyle="bold"
    app:cornerRadius="@dimen/btn_corner_radius" />
```

Replace `@color/wine_red` and `@color/on_primary` with the runtime theme colors when
using the theme system.

### Outlined / Secondary Button

```xml
<com.google.android.material.button.MaterialButton
    style="@style/Widget.Material3.Button.TonalButton"
    android:layout_width="match_parent"
    android:layout_height="@dimen/btn_height_secondary"
    android:backgroundTint="@color/wine_red_subtle"
    android:text="Navigate to Bike (Walking Directions)"
    android:textColor="@color/wine_red_light"
    android:textSize="14sp"
    android:textStyle="bold"
    app:cornerRadius="@dimen/btn_corner_radius"
    app:strokeColor="@color/wine_red_border"
    app:strokeWidth="@dimen/card_stroke_width" />
```

### Compact Tonal Button (card header action)

```xml
<com.google.android.material.button.MaterialButton
    style="@style/Widget.Material3.Button.TonalButton"
    android:layout_width="wrap_content"
    android:layout_height="32dp"
    android:backgroundTint="@color/surface_elevated"
    android:paddingHorizontal="12dp"
    android:paddingVertical="0dp"
    android:text="Recalibrate"
    android:textColor="@color/wine_red_light"
    android:textSize="11sp"
    android:textStyle="bold"
    app:cornerRadius="16dp"
    app:strokeColor="@color/surface_border"
    app:strokeWidth="1dp" />
```

### SOS / Header Pill Button

```xml
<com.google.android.material.button.MaterialButton
    style="@style/Widget.Material3.Button.TonalButton"
    android:layout_width="wrap_content"
    android:layout_height="36dp"
    android:backgroundTint="@color/wine_red_subtle"
    android:letterSpacing="0.04"
    android:paddingHorizontal="14dp"
    android:paddingVertical="0dp"
    android:text="SOS"
    android:textColor="@color/wine_red_light"
    android:textSize="12sp"
    android:textStyle="bold"
    app:cornerRadius="18dp"
    app:strokeColor="@color/wine_red_border"
    app:strokeWidth="1dp" />
```

### Badge Pill

A `TextView` with `@drawable/pill_badge` background (a shape drawable with 999dp corner
radius, transparent fill, 1dp accent-colored stroke).

```xml
<TextView
    android:layout_width="wrap_content"
    android:layout_height="22dp"
    android:background="@drawable/pill_badge"
    android:gravity="center"
    android:paddingHorizontal="7dp"
    android:text="PERMS NEEDED"
    android:textColor="@color/amber_accent"
    android:textSize="9sp"
    android:textStyle="bold" />
```

For warning badges: always use `@color/amber_accent` (`#F59E0B`) regardless of app theme.
For accent badges (e.g. "SOS HELP"): use `backgroundTint="@color/wine_red_subtle"` and
`textColor="@color/wine_red_light"`.

```xml
<!-- pill_badge.xml in drawable/ -->
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="rectangle">
    <corners android:radius="999dp" />
    <stroke android:width="1dp" android:color="?attr/colorOutline" />
    <solid android:color="@android:color/transparent" />
</shape>
```

### Connection Status Row (inside a card)

```xml
<LinearLayout
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:gravity="center_vertical"
    android:orientation="horizontal">

    <!-- Colored dot -->
    <View
        android:id="@+id/viewStatusDot"
        android:layout_width="14dp"
        android:layout_height="14dp"
        android:background="@drawable/circle_dot"
        android:backgroundTint="@color/status_disconnected" />

    <LinearLayout
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:layout_marginStart="12dp"
        android:layout_weight="1"
        android:orientation="vertical">

        <TextView
            android:id="@+id/tvConnectionStatus"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Disconnected"
            android:textColor="@color/text_primary"
            android:textSize="16sp"
            android:textStyle="bold" />

        <TextView
            android:id="@+id/tvSubStatus"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="2dp"
            android:text="Auto-reconnects when ignition turns ON"
            android:textColor="@color/text_tertiary"
            android:textSize="11sp" />

    </LinearLayout>

    <!-- Optional trailing compact action button -->

</LinearLayout>
```

```xml
<!-- circle_dot.xml in drawable/ -->
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="oval">
    <solid android:color="#FFFFFF" />
</shape>
```
Then tint it at runtime: `viewStatusDot.backgroundTintList = ColorStateList.valueOf(color)`.

### Toggle Chip Pair (two-option selector)

Used for binary selections like "Google Maps / Waze".

```xml
<LinearLayout
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:background="@drawable/bg_toggle_track"
    android:orientation="horizontal"
    android:padding="4dp">

    <TextView
        android:id="@+id/chipOptionA"
        android:layout_width="0dp"
        android:layout_height="40dp"
        android:layout_weight="1"
        android:background="@drawable/bg_toggle_selected"
        android:gravity="center"
        android:text="Google Maps"
        android:textColor="@color/on_primary"
        android:textSize="13sp"
        android:textStyle="bold" />

    <TextView
        android:id="@+id/chipOptionB"
        android:layout_width="0dp"
        android:layout_height="40dp"
        android:layout_weight="1"
        android:background="@android:color/transparent"
        android:gravity="center"
        android:text="Waze"
        android:textColor="@color/text_secondary"
        android:textSize="13sp"
        android:textStyle="bold" />

</LinearLayout>
```

In Kotlin: swap backgrounds on click to toggle selected state. Selected chip gets a solid
rounded background (accent color fill); unselected gets transparent.

### Settings Row with Switch

```xml
<LinearLayout
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:gravity="center_vertical"
    android:orientation="horizontal"
    android:paddingVertical="12dp">

    <LinearLayout
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:layout_weight="1"
        android:orientation="vertical">

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Auto Park Detection"
            android:textColor="@color/text_primary"
            android:textSize="14sp"
            android:textStyle="bold" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="2dp"
            android:text="Saves parking location when ignition turns off"
            android:textColor="@color/text_tertiary"
            android:textSize="12sp" />

    </LinearLayout>

    <com.google.android.material.switchmaterial.SwitchMaterial
        android:id="@+id/switchAutoPark"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="12dp" />

</LinearLayout>
```

Rows are stacked inside a card with thin 1dp `View` dividers (`@color/surface_border_subtle`)
between them.

### Quick Action Cards (icon + label, equal-width grid)

```xml
<LinearLayout
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="horizontal">

    <com.google.android.material.card.MaterialCardView
        android:layout_width="0dp"
        android:layout_height="64dp"
        android:layout_marginEnd="4dp"
        android:layout_weight="1"
        android:clickable="true"
        android:focusable="true"
        android:foreground="?attr/selectableItemBackground"
        app:cardBackgroundColor="@color/surface_card"
        app:cardCornerRadius="@dimen/card_corner_radius_small"
        app:cardElevation="0dp"
        app:strokeColor="@color/surface_border"
        app:strokeWidth="@dimen/card_stroke_width">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:gravity="center"
            android:orientation="vertical"
            android:padding="6dp">

            <ImageView
                android:layout_width="22dp"
                android:layout_height="22dp"
                android:src="@drawable/ic_home"
                app:tint="@color/wine_red_light" />

            <TextView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="2dp"
                android:text="Home"
                android:textColor="@color/text_primary"
                android:textSize="12sp"
                android:textStyle="bold" />

        </LinearLayout>
    </com.google.android.material.card.MaterialCardView>

    <!-- repeat for each shortcut -->

</LinearLayout>
```

### In-line Divider

```xml
<View
    android:layout_width="match_parent"
    android:layout_height="1dp"
    android:layout_marginVertical="14dp"
    android:background="@color/surface_border_subtle" />
```

---

## Theme System Implementation

The app stores the selected theme key in `SharedPreferences` as a string
(`KEY_APP_THEME = "app_theme"`). The default is `"wine_red"`.

At startup and whenever the user changes the theme, call an `applyTheme(themeName: String)`
function that resolves a color set and applies it to all dynamic views.

### Minimal Theme Data Structure

```kotlin
data class UiTheme(
    val backgroundColorRes: Int,
    val surfaceColorRes: Int,
    val cardColorRes: Int,
    val accentPrimaryRes: Int,
    val accentLightRes: Int,
    val accentSubtleRes: Int,
    val accentBorderRes: Int,
    val textPrimaryRes: Int,
    val textSecondaryRes: Int,
    val textTertiaryRes: Int,
    val borderColorRes: Int,
    val isDark: Boolean = true
)
```

### Resolving a Theme

```kotlin
fun resolveTheme(key: String): UiTheme {
    return when (key) {
        AppSettings.THEME_AMOLED -> UiTheme(
            backgroundColorRes = R.color.amoled_background,
            surfaceColorRes    = R.color.amoled_surface,
            cardColorRes       = R.color.amoled_card,
            accentPrimaryRes   = R.color.amoled_primary,
            accentLightRes     = R.color.amoled_accent,
            accentSubtleRes    = R.color.amoled_subtle,
            accentBorderRes    = R.color.amoled_btn_border,
            textPrimaryRes     = R.color.amoled_primary,
            textSecondaryRes   = R.color.text_secondary,
            textTertiaryRes    = R.color.text_tertiary,
            borderColorRes     = R.color.amoled_border
        )
        AppSettings.THEME_AMBER -> UiTheme(
            accentPrimaryRes = R.color.amber_primary,
            accentLightRes   = R.color.amber_accent,
            accentSubtleRes  = R.color.amber_subtle,
            accentBorderRes  = R.color.amber_border,
            // ... background/text same as dark defaults
        )
        // ... other themes
        else -> UiTheme(  // wine_red default
            accentPrimaryRes = R.color.wine_red,
            accentLightRes   = R.color.wine_red_light,
            accentSubtleRes  = R.color.wine_red_subtle,
            accentBorderRes  = R.color.wine_red_border,
            // ...
        )
    }
}
```

### Applying at Runtime

Call `applyTheme()` from `onCreate()` before `setContentView()`. Use
`AppCompatDelegate.setDefaultNightMode()` to control dark/light mode, then set
`backgroundTint`, `setTextColor()`, and `strokeColor` on key views after inflation.

---

## Kotlin / ViewBinding Conventions

### ViewBinding

Always use ViewBinding. Never use `findViewById()`.

```kotlin
class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}
```

### StateFlow for Feature Toggles

Settings that affect the UI are exposed as `StateFlow<Boolean>` from `AppSettings`.
Collect them in `onCreate` or a lifecycle-aware scope:

```kotlin
lifecycleScope.launch {
    repeatOnLifecycle(Lifecycle.State.STARTED) {
        settings.autoParkFlow.collectLatest { enabled ->
            binding.switchAutoPark.isChecked = enabled
        }
    }
}
```

### Writing a Setting

```kotlin
binding.switchAutoPark.setOnCheckedChangeListener { _, isChecked ->
    settings.isAutoParkEnabled = isChecked  // setter updates prefs + StateFlow
}
```

### Haptic Feedback

Add haptic feedback to all primary button taps:

```kotlin
binding.btnScan.setOnClickListener {
    it.performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY)
    // action
}
```

### Status Dot Updates

```kotlin
fun updateConnectionStatus(state: ConnectionState) {
    val (dotColor, label) = when (state) {
        ConnectionState.CONNECTED    -> Pair(R.color.status_connected, "CONNECTED")
        ConnectionState.SCANNING     -> Pair(R.color.status_scanning, "SCANNING")
        ConnectionState.DISCONNECTED -> Pair(R.color.status_disconnected, "OFFLINE")
    }
    binding.viewTopConnectionDot.backgroundTintList =
        ColorStateList.valueOf(ContextCompat.getColor(this, dotColor))
    binding.tvTopConnectionStatus.text = label
}
```

---

## Base Theme (XML)

```xml
<!-- themes.xml -->
<style name="Theme.YourApp" parent="Theme.Material3.DayNight.NoActionBar">
    <item name="colorPrimary">@color/wine_red</item>
    <item name="colorOnPrimary">@color/on_primary</item>
    <item name="colorPrimaryContainer">@color/wine_red_subtle</item>
    <item name="colorOnPrimaryContainer">@color/wine_red_light</item>
    <item name="android:statusBarColor">@color/background</item>
    <item name="android:navigationBarColor">@color/background</item>
    <item name="android:windowBackground">@color/background</item>
    <item name="colorSurface">@color/surface</item>
    <item name="colorOnSurface">@color/text_primary</item>
    <item name="colorOutline">@color/surface_border</item>
    <item name="materialAlertDialogTheme">@style/AppAlertDialog</item>
    <item name="bottomSheetDialogTheme">@style/AppBottomSheetDialog</item>
</style>

<style name="AppAlertDialog" parent="ThemeOverlay.Material3.MaterialAlertDialog">
    <item name="colorSurface">@color/surface_card</item>
    <item name="colorOnSurface">@color/text_primary</item>
    <item name="android:textColorPrimary">@color/text_primary</item>
    <item name="android:textColorSecondary">@color/text_secondary</item>
    <item name="buttonBarPositiveButtonStyle">@style/AppDialogButton</item>
    <item name="buttonBarNegativeButtonStyle">@style/AppDialogButtonSecondary</item>
</style>

<style name="AppDialogButton" parent="Widget.Material3.Button.TextButton">
    <item name="android:textColor">@color/wine_red_light</item>
    <item name="android:textStyle">bold</item>
</style>

<style name="AppDialogButtonSecondary" parent="Widget.Material3.Button.TextButton">
    <item name="android:textColor">@color/text_secondary</item>
</style>

<style name="AppBottomSheetDialog" parent="ThemeOverlay.Material3.BottomSheetDialog">
    <item name="bottomSheetStyle">@style/AppBottomSheetModal</item>
</style>

<style name="AppBottomSheetModal" parent="Widget.Material3.BottomSheet.Modal">
    <item name="backgroundTint">@color/surface</item>
</style>
```

---

## Bottom Sheet Pattern

Use `BottomSheetDialogFragment` for any multi-step or multi-field action (setup,
recalibrate, add fuel, etc.).

The sheet layout follows the same card-and-section structure:
- Sheet root: `LinearLayout` vertical with `paddingHorizontal="20dp"`, `paddingTop="20dp"`, `paddingBottom="32dp"`
- Drag handle at top: a 40dp wide, 4dp tall `View` centered, `@color/surface_border` tint
- Section headers same as card headers (ALL CAPS, 11sp, `text_tertiary`, bold)
- Primary action button at the bottom: full width, `btn_height_primary`
- Dismiss/cancel: text button in `text_secondary`, not a full outlined button

---

## Text and Copy Rules

These rules apply to every string in the app — layouts, string resources, Toasts, Snackbars,
dialog messages, everything.

1. No emoji. If you are tempted to add one, don't.
2. ALL CAPS for section labels and status indicators only. Title case everywhere else.
3. Sentences end without a period in labels. Use periods in multi-sentence descriptions only.
4. Keep it short. If a label needs more than 5 words, the label is probably wrong.
5. Use plain language. "Enable Notification Access" not "Grant notification permission to allow
   the application to intercept navigation events."
6. No marketing phrases. "Start Ride" not "Begin Your Journey".
7. Status is factual. "Disconnected" not "Not connected to your motorcycle".
8. Error messages state the problem and what to do. "Bluetooth is off. Turn it on to scan."

---

## Screen Structure Reference

### Home / Cockpit Tab

Vertical scroll. Cards top to bottom:
1. **Range & Fuel card** — hero number (DTE km), fuel progress bar, sync timestamp
2. **Connection & Navigation card** — status dot + "Scan" button, full-width "Start Ride" button
3. **Notification permission banner** — conditionally visible, accent stroke, warning icon
4. **Search bar** — `LinearLayout` with rounded bg, search icon, placeholder text; quick shortcut cards (Home, Work, Fuel) in a horizontal row below
5. **Last Parked card** — address, timestamp badge, outlined "Navigate to Bike" button
6. **Emergency card** — section header with "SOS HELP" badge, two equal-width hospital/ambulance buttons

### Accounts / Bike Tab

Vertical scroll. Cards:
1. **Rider profile card** — name, phone, blood group, emergency contact
2. **Vehicle card** — model selector, country selector, registration, bike name
3. **Documents vault card** — RC, insurance, PUC rows with expiry dates and file attach buttons

### Support / Help Tab

Vertical scroll. Cards:
1. **Issue checklist card** — RecyclerView of issues, each row with checkbox and category tag
2. **Service log card** — upcoming maintenance milestones
3. **Contact/FAQ rows**

### Settings Tab

Vertical scroll. One card per feature group:
- Feature toggles (switch rows with label + subtitle)
- Navigation app selector (toggle chip pair)
- Theme selector (chip grid or radio list)
- Fuel price input
- Export / Import data

---

## Common Gotchas

- `cardElevation="0dp"` is intentional. Do not add elevation thinking it will look better.
- Status bar and nav bar colors match the root background. Set them in the theme XML, not in code, to avoid flicker.
- `SwitchMaterial` thumb color inherits `colorPrimary`. Override it via a custom style if the accent theme changes at runtime — otherwise it stays the XML-compiled primary color.
- When applying runtime theme colors to `MaterialButton`, use `setBackgroundTintList()` not `setBackgroundColor()`. The latter breaks ripple.
- `BottomNavigationView` icon tint and selected indicator color must be set via `itemIconTintList` and `itemActiveIndicatorColor` to match the runtime theme.
- `RecyclerView` items should reuse the same section header + row pattern from cards. Wrap each section in a header ViewHolder and data rows in a content ViewHolder.
- Haptic feedback requires the view to have `android:hapticFeedbackEnabled="true"` or call `performHapticFeedback()` on a view that has it enabled by default (most interactive views do).
