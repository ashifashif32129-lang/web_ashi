import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AuroraBackground extends StatefulWidget {
  const AuroraBackground({super.key});

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
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
          painter: AuroraPainter(_controller.value),
          child: Container(),
        );
      },
    );
  }
}

class AuroraPainter extends CustomPainter {
  final double animationValue;

  AuroraPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 120);

    for (int i = 0; i < AppColors.blobs.length; i++) {
      final color = AppColors.blobs[i];
      paint.color = color;

      final phase = i * (2 * pi / AppColors.blobs.length);
      final x = size.width * 0.5 +
          size.width * 0.3 * cos(animationValue * 2 * pi + phase);
      final y = size.height * 0.5 +
          size.height * 0.3 * sin(animationValue * 2 * pi + phase);

      canvas.drawCircle(Offset(x, y), size.width * 0.3, paint);
    }
  }

  @override
  bool shouldRepaint(covariant AuroraPainter oldDelegate) => true;
}
