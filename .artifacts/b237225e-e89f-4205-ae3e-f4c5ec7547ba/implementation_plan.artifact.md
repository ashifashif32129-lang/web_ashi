# Portfolio Overhaul Implementation Plan

Overhaul the existing Flutter portfolio to a premium, modern design inspired by Apple, Linear, and Vercel.

## User Review Required

> [!IMPORTANT]
> **Typography**: I will use 'Inter' and 'Poppins' via Google Fonts as they represent the "Premium Typography" mentioned.
> **Electric Blue**: I'll define a specific Electric Blue accent (#00E5FF or similar) to contrast against the pure black background.

## Proposed Changes

### Branding & Design

#### [MODIFY] [app_colors.dart](file:///Users/admin/StudioProjects/web_ashi/lib/constants/app_colors.dart)
- Set background to deep black (#000000).
- Set primary/accent to Electric Blue (#00E5FF).
- Update Aurora gradient blob colors.

#### [MODIFY] [app_theme.dart](file:///Users/admin/StudioProjects/web_ashi/lib/constants/app_theme.dart)
- Update Material 3 theme to reflect the pure dark aesthetic with high contrast white text.

### Advanced UI Components

#### [NEW] [mouse_glow.dart](file:///Users/admin/StudioProjects/web_ashi/lib/widgets/mouse_glow.dart)
- A widget that tracks mouse movement on Web and renders a subtle radial gradient glow behind the content.

#### [NEW] [aurora_background.dart](file:///Users/admin/StudioProjects/web_ashi/lib/widgets/aurora_background.dart)
- An animated background with large, soft, moving gradient blobs (Aurora effect).

#### [MODIFY] [glass_card.dart](file:///Users/admin/StudioProjects/web_ashi/lib/widgets/glass_card.dart)
- Enhance glassmorphism with better border highlights and subtle internal shadows.

### Sections (Modularization)

I will move the sections from `PortfolioScreen` into individual files in `lib/sections/` for better maintainability and to apply specific animations to each.

#### [NEW] [hero_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/hero_section.dart)
#### [NEW] [projects_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/projects_section.dart)
#### [NEW] [skills_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/skills_section.dart)
#### [NEW] [experience_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/experience_section.dart)
#### [NEW] [contact_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/contact_section.dart)

### App Logic

#### [MODIFY] [main.dart](file:///Users/admin/StudioProjects/web_ashi/lib/main.dart)
- Update app title to "ASHIF".

#### [MODIFY] [loading_screen.dart](file:///Users/admin/StudioProjects/web_ashi/lib/loading_screen.dart)
- Create a minimal, high-end loading animation.

### Deployment

#### GitHub Pages Redeploy
- Execute `flutter build web --base-href "/web_ashi/"`.
- Update the `docs/` directory with the new build.
- Commit and push to the repository.

## Verification Plan

### Automated Tests
- `flutter analyze` to ensure no code errors.
- `flutter test` for basic widget integrity.

### Manual Verification
- Verify responsive layouts on multiple viewports.
- Check animation smoothness (60 FPS).
- Test contact form validation.
- Verify GitHub Pages deployment.
