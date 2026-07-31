import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AnimatedTitle extends StatelessWidget {
  final String text;
  final double fontSize;

  const AnimatedTitle({
    super.key,
    required this.text,
    this.fontSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fontSize * 1.5,
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        isRepeatingAnimation: true,
        repeatForever: true,
      ),
    );
  }
}
