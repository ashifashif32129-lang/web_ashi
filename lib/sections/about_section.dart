import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/animated_counter.dart';
import '../utils/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 100, horizontal: isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            "About Me",
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(),
          
          SizedBox(height: isMobile ? 40 : 60),
          
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildStat(1, "Years of Experience", suffix: "+")),
                          const SizedBox(width: 16),
                          Expanded(child: _buildStat(10, "Projects Completed", suffix: "+")),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildStat(1, "Global Clients", suffix: "+"),
                      const SizedBox(height: 40),
                      _buildDescription(isMobile),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            _buildStat(5, "Years of Experience", suffix: "+"),
                            const SizedBox(height: 16),
                            _buildStat(50, "Projects Completed", suffix: "+"),
                            const SizedBox(height: 16),
                            _buildStat(10, "Global Clients", suffix: "+"),
                          ],
                        ),
                      ),
                      SizedBox(width: isTablet ? 40 : 80),
                      Expanded(
                        flex: 2,
                        child: _buildDescription(isMobile),
                      ),
                    ],
                  ),
          ).animate().fadeIn(delay: 400.ms).slide(
                begin: Offset(isMobile ? 0 : -0.1, isMobile ? 0.1 : 0),
                duration: 600.ms,
              ),
        ],
      ),
    );
  }

  Widget _buildDescription(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I am a passionate Flutter Developer dedicated to crafting high-performance, beautiful mobile and web applications.",
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "With deep expertise in Flutter and Dart, I focus on writing clean, maintainable code and building responsive user interfaces that deliver exceptional user experiences.\n\n"
          "My approach combines technical excellence with a keen eye for design, ensuring that every project not only works perfectly but also looks premium and modern.",
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildStat(int value, String label, {String suffix = ""}) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          AnimatedCounter(
            targetValue: value,
            suffix: suffix,
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
