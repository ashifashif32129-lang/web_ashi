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
  final ValueNotifier<Offset> _mousePosition = ValueNotifier(Offset.zero);

  @override
  void dispose() {
    _mousePosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) return widget.child;

    return MouseRegion(
      onHover: (event) => _mousePosition.value = event.localPosition,
      child: Stack(
        children: [
          ValueListenableBuilder<Offset>(
            valueListenable: _mousePosition,
            builder: (context, position, _) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 50),
                left: position.dx - 200,
                top: position.dy - 200,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          widget.child,
        ],
      ),
    );
  }
}
