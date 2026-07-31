import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: BackgroundPainter(_controller.value),
          child: Container(),
        );
      },
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 100);

    // Blob 1 - Purple/Pink
    paint.color = Colors.purple.withValues(alpha: 0.12 + 0.05 * sin(animationValue * pi));
    canvas.drawCircle(
      Offset(
        size.width * 0.2 + (size.width * 0.15 * sin(animationValue * 2 * pi)),
        size.height * 0.3 + (size.height * 0.1 * cos(animationValue * 2 * pi)),
      ),
      size.width * 0.25,
      paint,
    );

    // Blob 2 - Blue/Cyan
    paint.color = AppColors.primary.withValues(alpha: 0.1 + 0.05 * cos(animationValue * pi));
    canvas.drawCircle(
      Offset(
        size.width * 0.8 + (size.width * 0.1 * cos(animationValue * 2 * pi)),
        size.height * 0.7 + (size.height * 0.15 * sin(animationValue * 2 * pi)),
      ),
      size.width * 0.3,
      paint,
    );

    // Blob 3 - Deep Blue
    paint.color = AppColors.accent.withValues(alpha: 0.08 + 0.04 * sin(animationValue * 3 * pi));
    canvas.drawCircle(
      Offset(
        size.width * 0.5 + (size.width * 0.25 * sin(animationValue * pi)),
        size.height * 0.5 + (size.height * 0.15 * cos(animationValue * pi)),
      ),
      size.width * 0.2,
      paint,
    );

    // Blob 4 - Indigo (Extra Color)
    paint.color = Colors.indigo.withValues(alpha: 0.1);
    canvas.drawCircle(
      Offset(
        size.width * 0.1 + (size.width * 0.1 * cos(animationValue * pi)),
        size.height * 0.8 + (size.height * 0.1 * sin(animationValue * 2 * pi)),
      ),
      size.width * 0.2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) => true;
}
