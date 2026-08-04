import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants/app_colors.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;

  const HeroSection({super.key, required this.onContactPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Name with reveal animation
          const Text(
            "ASHIF",
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w900,
              letterSpacing: -2,
              color: AppColors.textPrimary,
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
          
          const SizedBox(height: 8),
          
          // Subtitle with typing animation
          SizedBox(
            height: 40,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Flutter Developer",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                    letterSpacing: 2,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Intro text
          const SizedBox(
            width: 600,
            child: Text(
              "Crafting high-performance, beautiful mobile and web experiences with a focus on premium UI/UX and seamless animations.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ).animate().fadeIn(delay: 1.seconds, duration: 800.ms),
          
          const SizedBox(height: 60),
          
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPrimaryButton("View Projects", () {}),
              const SizedBox(width: 20),
              _buildSecondaryButton("Contact Me", onContactPressed),
            ],
          ).animate().fadeIn(delay: 1.5.seconds).scale(begin: const Offset(0.9, 0.9)),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 0,
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSecondaryButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
