import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int targetValue;
  final TextStyle style;
  final Duration duration;
  final String suffix;

  const AnimatedCounter({
    super.key,
    required this.targetValue,
    this.style = const TextStyle(),
    this.duration = const Duration(seconds: 2),
    this.suffix = "",
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = IntTween(begin: 0, end: widget.targetValue).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetValue != widget.targetValue) {
      _animation = IntTween(begin: _animation.value, end: widget.targetValue).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
      );
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Text(
          "${_animation.value}${widget.suffix}",
          style: widget.style,
        );
      },
    );
  }
}
