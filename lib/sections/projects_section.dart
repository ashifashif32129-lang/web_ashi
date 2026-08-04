import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> _projects = const [
    {
      "title": "E-Commerce App",
      "desc": "A premium shopping experience with clean UI and real-time updates.",
      "tech": "Flutter • Firebase • Stripe",
    },
    {
      "title": "Finance Dashboard",
      "desc": "A data-rich dashboard with custom charts and glassmorphism.",
      "tech": "Flutter Web • Chart.js",
    },
    {
      "title": "Social Media platform",
      "desc": "Connecting people with a focus on privacy and high performance.",
      "tech": "Flutter • Node.js • MongoDB",
    },
    {
      "title": "Productivity Tool",
      "desc": "Helping teams stay organized with a minimal, Linear-inspired UI.",
      "tech": "Flutter • SQLite • Bloc",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        children: [
          const Text(
            "Projects",
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
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: _projects.map((project) {
                  return ProjectCard(
                    title: project["title"]!,
                    desc: project["desc"]!,
                    tech: project["tech"]!,
                    width: constraints.maxWidth > 800 ? (constraints.maxWidth - 60) / 2 : constraints.maxWidth,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final String tech;
  final double width;

  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.tech,
    required this.width,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        transform: _isHovered ? Matrix4.translationValues(0, -10, 0) : Matrix4.identity(),
        child: GlassCard(
          padding: EdgeInsets.zero,
          borderColor: _isHovered ? AppColors.primary : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image Placeholder
              Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.border.withValues(alpha: 0.2),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(
                    Icons.work_outline,
                    size: 60,
                    color: _isHovered ? AppColors.primary : AppColors.textSecondary,
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.desc,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.tech,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
