import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/section_heading.dart';
import '../widgets/glass_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: "Services"),
          const SizedBox(height: 40),
          LayoutBuilder(builder: (context, constraints) {
            return Wrap(
              spacing: 30,
              runSpacing: 30,
              children: AppConstants.services.map((service) {
                return SizedBox(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 30) / 2 : constraints.maxWidth,
                  child: GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.flash_on, color: AppColors.primary, size: 40),
                        const SizedBox(height: 20),
                        Text(
                          service['title']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          service['description']!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.secondaryText,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
