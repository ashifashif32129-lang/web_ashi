import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants/app_colors.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onProjectsPressed;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    required this.onProjectsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      height: MediaQuery.sizeOf(context).height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Name with reveal animation
          Text(
            AppConstants.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 50 : (isTablet ? 70 : 100),
              fontWeight: FontWeight.w900,
              letterSpacing: isMobile ? -1 : -3,
              color: AppColors.textPrimary,
              height: 1,
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
          
          const SizedBox(height: 12),
          
          // Subtitle with typing animation
          SizedBox(
            height: isMobile ? 30 : 40,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Flutter Developer",
                  textStyle: TextStyle(
                    fontSize: isMobile ? 18 : 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                    letterSpacing: isMobile ? 1 : 2,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Intro text
          SizedBox(
            width: isMobile ? double.infinity : 600,
            child: Text(
              "Crafting high-performance, beautiful mobile and web experiences with a focus on premium UI/UX and seamless animations.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ).animate().fadeIn(delay: 1.seconds, duration: 800.ms),
          
          const SizedBox(height: 50),
          
          // Action Buttons
          isMobile
              ? Column(
                  children: [
                    _buildPrimaryButton("View Projects", onProjectsPressed, fullWidth: true),
                    const SizedBox(height: 16),
                    _buildSecondaryButton("Contact Me", onContactPressed, fullWidth: true),
                  ],
                ).animate().fadeIn(delay: 1.5.seconds).scale(begin: const Offset(0.9, 0.9))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPrimaryButton("View Projects", onProjectsPressed),
                    const SizedBox(width: 20),
                    _buildSecondaryButton("Contact Me", onContactPressed),
                  ],
                ).animate().fadeIn(delay: 1.5.seconds).scale(begin: const Offset(0.9, 0.9)),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed, {bool fullWidth = false}) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          elevation: 0,
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  Widget _buildSecondaryButton(String text, VoidCallback onPressed, {bool fullWidth = false}) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
