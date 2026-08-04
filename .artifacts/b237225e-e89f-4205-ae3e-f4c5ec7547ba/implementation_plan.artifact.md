# Responsive Portfolio Implementation Plan

Make the ASHIF portfolio fully responsive with dedicated layouts for Mobile, Tablet, and Desktop.

## User Review Required

> [!IMPORTANT]
> **Navigation**: Mobile will use a Drawer or Bottom Sheet for navigation, while Desktop/Tablet will keep the floating Glassmorphism Navbar.
> **Animations**: Hover effects will be disabled on Mobile to prevent sticky states on touch.

## Proposed Changes

### [Component: Utilities]

#### [NEW] [responsive.dart](file:///Users/admin/StudioProjects/web_ashi/lib/utils/responsive.dart)
- Define breakpoints: Mobile (< 600), Tablet (600-1024), Desktop (> 1024).

### [Component: Screens]

#### [MODIFY] [portfolio_screen.dart](file:///Users/admin/StudioProjects/web_ashi/lib/screens/portfolio_screen.dart)
- Implement `Scaffold` drawer for Mobile.
- Conditional rendering of the Navbar.
- Adjust vertical spacing between sections for smaller screens.

### [Component: Sections]

#### [MODIFY] [hero_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/hero_section.dart)
- Scale down font sizes for Mobile.
- Change horizontal alignment if needed (center for all is usually fine).
- Adjust button padding for touch targets.

#### [MODIFY] [about_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/about_section.dart)
- Switch from Row (Desktop) to Column (Mobile) for Stats and Description.
- Adjust stat card grid/layout for Tablet.

#### [MODIFY] [skills_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/skills_section.dart)
- Adjust `Wrap` spacing and item width based on screen size.

#### [MODIFY] [projects_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/projects_section.dart)
- Update `ProjectCard` width calculations for 1, 2, or 3 columns.
- Disable hover lift on Mobile.

#### [MODIFY] [experience_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/experience_section.dart)
- Adjust timeline padding and icon size for Mobile.

#### [MODIFY] [contact_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/contact_section.dart)
- Switch from Row to Column for Contact Info and Form on Mobile/Tablet.

#### [MODIFY] [footer_section.dart](file:///Users/admin/StudioProjects/web_ashi/lib/sections/footer_section.dart)
- Adjust link spacing and text alignment for Mobile.

## Verification Plan

### Manual Verification
- Test on Chrome DevTools responsive mode (iPhone SE, Pixel 7, iPad Air, Desktop 1080p).
- Ensure no horizontal overflow on any device.
- Verify touch-friendliness of buttons and forms.
- Confirm animations perform smoothly on mobile viewports.
