import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color background = Color(0xFF0F172A);
  static const Color card = Color(0xFF1E293B);
  static const Color primary = Color(0xFF3B82F6);
  static const Color accent = Color(0xFF38BDF8);
  
  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.grey;

  // Neumorphic Colors (Dark)
  static const Color neumorphicShadowDark = Color(0xFF0D1425);
  static const Color neumorphicShadowLight = Color(0xFF1F2E4A);

  // Gradient Blobs
  static final List<Color> blobs = [
    Colors.purple.withValues(alpha: 0.15),
    Colors.blue.withValues(alpha: 0.15),
    Colors.indigo.withValues(alpha: 0.15),
  ];
}
