import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../utils/responsive.dart';

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
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 100, horizontal: isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            "Experience",
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(),
          
          SizedBox(height: isMobile ? 40 : 60),
          
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: _experience.map((exp) {
                return _buildTimelineItem(exp["date"]!, exp["role"]!, exp["company"]!, exp["desc"]!, isMobile);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String date, String role, String company, String desc, bool isMobile) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: isMobile ? 12 : 16,
                height: isMobile ? 12 : 16,
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
          SizedBox(width: isMobile ? 16 : 32),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isMobile ? 30 : 50),
              child: GlassCard(
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      role,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      company,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 18,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
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
