import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../constants/app_colors.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _isVisible = false;

  final List<Map<String, dynamic>> _skills = [
    {"name": "Flutter", "level": 0.95},
    {"name": "Dart", "level": 0.90},
    {"name": "Firebase", "level": 0.85},
    {"name": "REST API", "level": 0.80},
    {"name": "State Management", "level": 0.90},
    {"name": "UI/UX Design", "level": 0.85},
  ];

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
        child: Column(
          children: [
            const Text(
              "Skills",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ).animate().fadeIn(),
            
            const SizedBox(height: 60),
            
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: _skills.map((skill) {
                    return SizedBox(
                      width: constraints.maxWidth > 800 ? (constraints.maxWidth - 80) / 2 : constraints.maxWidth,
                      child: _buildSkillBar(skill["name"], skill["level"]),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillBar(String name, double level) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "${(level * 100).toInt()}%",
              style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.border.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutCubic,
            width: _isVisible ? double.infinity : 0,
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: _isVisible ? level : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
