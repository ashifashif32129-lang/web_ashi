import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../utils/responsive.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Map<String, String>> _experience = const [
    {
      "date": "2025 - Present",
      "role": "Flutter Developer",
      "company": "Freelance & Personal Projects",
      "desc": "Building responsive Flutter mobile and web applications using Flutter, Dart, Firebase, and modern UI/UX principles. Continuously improving skills through real-world projects.",
    },
    {
      "date": "2025",
      "role": "Flutter Trainee",
      "company": "Self Learning",
      "desc": "Learned Flutter, Dart, Firebase, state management, REST APIs, and responsive UI development through hands-on practice and projects.",
    },
    {
      "date": "2025 - Present",
      "role": "App Developer",
      "company": "Portfolio Projects",
      "desc": "Developed multiple Flutter applications including portfolio websites, productivity apps, and Firebase-integrated projects with clean architecture.",
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 8),
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
            Container(
              width: 2,
              height: isMobile ? 180 : 200, // Fixed height instead of Expanded in IntrinsicHeight
              color: AppColors.border.withValues(alpha: 0.3),
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
    );
  }
}
