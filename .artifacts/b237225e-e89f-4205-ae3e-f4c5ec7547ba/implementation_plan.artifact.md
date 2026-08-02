# Implementation Plan - Premium Flutter App & Responsive Portfolio

This plan outlines the development of two high-end Flutter projects: a premium Android UI and a modern responsive portfolio website, sharing a common Material 3 glassmorphism design language.

## User Review Required

> [!IMPORTANT]
> **Asset Requirements**: Lottie animations and specific images (projects/logo) are required. I will use placeholder Lottie URLs and network images initially.
> **Firebase**: Both projects will benefit from Firebase. The Android app will use it for Auth, and the Portfolio for the contact form.

## Proposed Changes

### 1. Project Infrastructure & Dependencies

#### [MODIFY] [pubspec.yaml](file:///Users/admin/StudioProjects/web_ashi/pubspec.yaml)
- Add: `animations`, `lottie`, `shimmer`, `visibility_detector`, `scrollable_positioned_list`.

#### [NEW] Directory Structure
- `lib/screens/`: Android App screens (Splash, Onboarding, Auth, Dashboard).
- `lib/widgets/`: Common UI components (Glass cards, Neumorphic buttons, Shimmer).
- `lib/models/`: Data models for projects, experience, user.
- `lib/animations/`: Custom animation controllers and transitions.
- `lib/constants/`: Colors, strings, and theme definitions.

### 2. Premium Android UI Implementation

- **Splash Screen**: Animated logo with `flutter_animate`.
- **Onboarding**: Smooth `PageView` with parallax and shared axis transitions.
- **Auth Flow**: Glassmorphism login/signup with shared axis page transitions.
- **Main Dashboard**:
    - Animated Bottom Navigation Bar.
    - ListView with `flutter_staggered_animations` and `shimmer` loading.
    - Hero animations for item details.

### 3. Responsive Portfolio Website Implementation

- **Hero Section**: Animated gradient background with floating shapes.
- **Experience Timeline**: Vertical timeline with entrance animations.
- **Projects**: Hover-zoom cards with glassmorphism.
- **Skills**: Progress bars that animate when visible (using `visibility_detector`).
- **Smooth Navigation**: `scrollable_positioned_list` for section-based scrolling.

### 4. Global Theming

- **Material 3**: Unified theme data for Light and Dark modes.
- **Glassmorphism/Neumorphism**: Reusable styling mixins/widgets.

## Verification Plan

### Manual Verification
- Test Android App on Emulator/Device for touch responsiveness and transitions.
- Test Portfolio Web on Chrome/Safari for responsive breakpoints (Mobile, Tablet, Desktop).
- Verify smooth scrolling and animation performance across platforms.
