import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class SharedAxisTransitionPage extends StatelessWidget {
  final Widget child;
  final SharedAxisTransitionType transitionType;

  const SharedAxisTransitionPage({
    super.key,
    required this.child,
    this.transitionType = SharedAxisTransitionType.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 600),
      reverse: false,
      transitionBuilder: (child, animation, secondaryAnimation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: transitionType,
          child: child,
        );
      },
      child: child,
    );
  }
}
