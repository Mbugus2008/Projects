# Rental Management — Brand Colours

Official palette (v1 · Oct 2026). The same tokens are used in the Android app
(`lib/app/theme/app_theme.dart`), the admin console (`site.css`), the app icon
and every store graphic. Rendering sources live in `store-assets/src/`.

## Primary — brand blue

| Token | Hex | Usage |
|---|---|---|
| Rental Blue (primary) | **`#2563EB`** | Buttons, active states, links, app bar |
| Sky Blue (gradient end) | **`#3B82F6`** | Highlights, gradient end, headline accents |
| Navy (gradient start) | **`#1E3A8A`** | Gradient start, deep accents |

Brand gradient: `linear-gradient(135deg, #1E3A8A 0%, #2563EB 55%, #3B82F6 100%)` — used by the app icon, splash and store graphics.

## Neutrals

| Token | Hex | Usage |
|---|---|---|
| Ink | **`#0B1120`** | Dark surfaces, marketing backgrounds |
| Ink text | **`#0F172A`** | Headings on light surfaces |
| Cloud | **`#F4F6FB`** | App background |
| Surface | **`#FFFFFF`** | Cards |
| Border | **`#E2E8F0`** | Dividers, input outlines |
| Secondary text | **`#64748B`** | Body copy on light |
| Muted text | **`#94A3B8`** | Captions, placeholders, dark-theme secondary |

## Semantic

| Token | Hex |
|---|---|
| Success | **`#16A34A`** |
| Warning | **`#F59E0B`** |
| Danger | **`#DC2626`** |
| Info | **`#0EA5E9`** |
| Accent indigo | **`#6366F1`** |
| Teal | **`#0D9488`** |

## Quick rules

- On dark navy backgrounds use `#FFFFFF` for headings and `#94A3B8` for secondary text.
- On light backgrounds use `#0F172A` / `#64748B`.
- Never place `#2563EB` text on `#1E3A8A`; use `#93C5FD` instead.
- Status colours are for data only (paid = Success, overdue = Danger, partial = Warning).

## Asset map (`store-assets/`)

| File | Size | Play slot |
|---|---|---|
| `play-icon-512.png` | 512×512 | App icon |
| `play-feature-graphic-1024x500.png` | 1024×500 | Feature graphic |
| `phone-01…06-*.png` | 1080×1920 | Phone screenshots |
| `brand-palette.png` | 1200×760 | Internal reference card |

Launcher icon: `assets/icon/app_icon.png` (+ `_foreground`/`_background` adaptive
layers) generated into `android/app/src/main/res` via `dart run flutter_launcher_icons`.
