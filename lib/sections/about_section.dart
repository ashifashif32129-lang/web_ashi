import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        children: [
          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(),
          
          const SizedBox(height: 60),
          
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Row(
              children: [
                // Experience Stats
                Expanded(
                  child: Column(
                    children: [
                      _buildStat("5+", "Years of Experience"),
                      const SizedBox(height: 24),
                      _buildStat("50+", "Projects Completed"),
                      const SizedBox(height: 24),
                      _buildStat("10+", "Global Clients"),
                    ],
                  ),
                ),
                
                const SizedBox(width: 80),
                
                // Description
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I am a passionate Flutter Developer dedicated to crafting high-performance, beautiful mobile and web applications.",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "With deep expertise in Flutter and Dart, I focus on writing clean, maintainable code and building responsive user interfaces that deliver exceptional user experiences.\n\n"
                        "My approach combines technical excellence with a keen eye for design, ensuring that every project not only works perfectly but also looks premium and modern.",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
