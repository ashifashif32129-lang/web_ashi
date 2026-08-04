import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Map<String, String>> _experience = const [
    {
      "date": "2023 - Present",
      "role": "Senior Flutter Developer",
      "company": "Tech Solutions Inc.",
      "desc": "Leading a team of developers to build high-scale fintech applications for international clients.",
    },
    {
      "date": "2021 - 2023",
      "role": "Flutter Developer",
      "company": "Creative Apps Agency",
      "desc": "Developed over 10 cross-platform mobile applications with custom UI and smooth animations.",
    },
    {
      "date": "2020 - 2021",
      "role": "Junior App Developer",
      "company": "Startup Hub",
      "desc": "Assisted in the development of MVPs for various startups using Flutter and Firebase.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        children: [
          const Text(
            "Experience",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(),
          
          const SizedBox(height: 60),
          
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: _experience.map((exp) {
                return _buildTimelineItem(exp["date"]!, exp["role"]!, exp["company"]!, exp["desc"]!);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String date, String role, String company, String desc) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: AppColors.border,
                ),
              ),
            ],
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      company,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn().slideX(begin: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
