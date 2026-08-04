import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette (Premium Dark)
  static const Color background = Color(0xFF000000);
  static const Color card = Color(0xFF0A0A0A);
  static const Color primary = Color(0xFF00E5FF); // Electric Blue
  static const Color accent = Color(0xFF00E5FF);
  
  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFA1A1AA); // Zinc-400

  // Border & Accent Colors
  static const Color border = Color(0xFF27272A); // Zinc-800
  static const Color glow = Color(0x3300E5FF);

  // Neumorphic Colors (Temporary placeholders to fix old UI code)
  static const Color neumorphicShadowDark = Color(0xFF000000);
  static const Color neumorphicShadowLight = Color(0xFF1A1A1A);

  // Aurora Gradient Blobs
  static final List<Color> blobs = [
    const Color(0xFF00E5FF).withValues(alpha: 0.1), // Electric Blue
    const Color(0xFF7C3AED).withValues(alpha: 0.1), // Violet
    const Color(0xFF2563EB).withValues(alpha: 0.1), // Blue
  ];
}
