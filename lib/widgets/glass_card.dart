import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final double blur;
  final double opacity;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.all(20.0),
    this.margin,
    this.blur = 10.0,
    this.opacity = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: AppColors.card.withValues(alpha: opacity),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1.5,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
