# Implementation Plan - Final Polish & Missing Features

This plan covers the remaining features to complete the portfolio, including extra sections, social links, SEO, and a loading screen.

## User Review Required

> [!NOTE]
> **CV Download**: I will add a placeholder for the CV download link. You will need to replace it with your actual hosted PDF URL or add the file to your assets.

> [!IMPORTANT]
> **SEO Configuration**: The changes to `index.html` are specifically for the web build. Make sure to rebuild the project for web (`flutter build web`) after these changes are applied to see them in the hosted version.

## Proposed Changes

### [Component: Data & Utilities]

#### [MODIFY] [constants.dart](file:///Users/admin/StudioProjects/web_ashi/lib/utils/constants.dart)
- Add data for "Why Choose Me" section.
- Add social link URLs.

### [Component: UI Sections]

#### [NEW] [why_choose_me.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/why_choose_me.dart)
- A grid-based section highlighting "Clean Code", "Responsive Design", etc.

#### [MODIFY] [hero.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/hero.dart)
- Add "Download CV" button next to "Contact Me".

#### [MODIFY] [footer.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/footer.dart)
- Use `FontAwesomeIcons` for GitHub, LinkedIn, and Instagram.
- Add functional (placeholder) social links.

### [Component: App Experience]

#### [NEW] [loading_screen.dart](file:///Users/admin/StudioProjects/web_ashi/lib/loading_screen.dart)
- A simple, animated splash screen that shows before the `HomePage` loads.

#### [MODIFY] [main.dart](file:///Users/admin/StudioProjects/web_ashi/lib/main.dart)
- Integrate the `LoadingScreen`.

### [Component: Web/SEO]

#### [MODIFY] [index.html](file:///Users/admin/StudioProjects/web_ashi/web/index.html)
- Update `<title>` to "Ashif | Flutter Developer".
- Update `<meta name="description">` with a professional summary for SEO.

## Verification Plan

### Manual Verification
- Verify "Why Choose Me" section displays correctly on mobile/desktop.
- Test "Download CV" and social link buttons (ensure they open in new tabs).
- Check the loading screen animation.
- View the browser tab title to verify SEO update.
