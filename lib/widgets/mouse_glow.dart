import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';

class MouseGlow extends StatefulWidget {
  final Widget child;

  const MouseGlow({super.key, required this.child});

  @override
  State<MouseGlow> createState() => _MouseGlowState();
}

class _MouseGlowState extends State<MouseGlow> {
  Offset _mousePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) return widget.child;

    return MouseRegion(
      onHover: (event) {
        setState(() {
          _mousePosition = event.localPosition;
        });
      },
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            left: _mousePosition.dx - 200,
            top: _mousePosition.dy - 200,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
