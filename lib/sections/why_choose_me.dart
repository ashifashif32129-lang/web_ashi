import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/section_heading.dart';
import '../widgets/glass_card.dart';

class WhyChooseMeSection extends StatelessWidget {
  const WhyChooseMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: "Why Choose Me"),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 2.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: AppConstants.whyChooseMe.length,
            itemBuilder: (context, index) {
              final item = AppConstants.whyChooseMe[index];
              return GlassCard(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(_getIcon(item['icon']!), color: AppColors.accent, size: 24),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: (index * 100).ms).slideX(begin: 0.1);
            },
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'code': return Icons.code;
      case 'devices': return Icons.devices;
      case 'auto_awesome': return Icons.auto_awesome;
      case 'storage': return Icons.storage;
      case 'speed': return Icons.speed;
      case 'palette': return Icons.palette;
      default: return Icons.check;
    }
  }
}
