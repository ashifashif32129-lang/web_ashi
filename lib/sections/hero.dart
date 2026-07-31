import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/animated_title.dart';
import '../widgets/custom_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            AppConstants.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
              letterSpacing: 2,
            ),
          ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2),
          const SizedBox(height: 10),
          const AnimatedTitle(text: AppConstants.role),
          const SizedBox(height: 30),
          SizedBox(
            width: 800,
            child: Text(
              AppConstants.heroTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.secondaryText,
                height: 1.6,
              ),
            ),
          ).animate().fadeIn(delay: 500.ms, duration: 800.ms),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "View Projects",
                onPressed: () {},
              ),
              const SizedBox(width: 20),
              CustomButton(
                text: "Download CV",
                onPressed: () {},
                isPrimary: false,
              ),
            ],
          ).animate().fadeIn(delay: 1000.ms).scale(begin: const Offset(0.8, 0.8)),
        ],
      ),
    );
  }
}
