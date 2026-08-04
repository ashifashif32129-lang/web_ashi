import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../utils/responsive.dart';

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
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 100, horizontal: isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            "Projects",
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(),
          
          SizedBox(height: isMobile ? 40 : 60),
          
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth;
              if (isMobile) {
                cardWidth = constraints.maxWidth;
              } else if (isTablet) {
                cardWidth = (constraints.maxWidth - 30) / 2;
              } else {
                cardWidth = (constraints.maxWidth - 60) / 2;
              }

              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: _projects.map((project) {
                  return ProjectCard(
                    title: project["title"]!,
                    desc: project["desc"]!,
                    tech: project["tech"]!,
                    width: cardWidth,
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
    final bool isMobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        transform: (!isMobile && _isHovered) ? Matrix4.translationValues(0, -10, 0) : Matrix4.identity(),
        child: GlassCard(
          padding: EdgeInsets.zero,
          borderColor: (!isMobile && _isHovered) ? AppColors.primary : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image Placeholder
              Container(
                height: isMobile ? 200 : 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.border.withValues(alpha: 0.2),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(
                    Icons.work_outline,
                    size: isMobile ? 50 : 60,
                    color: (!isMobile && _isHovered) ? AppColors.primary : AppColors.textSecondary,
                  ),
                ),
              ),
              
              Padding(
                padding: EdgeInsets.all(isMobile ? 20.0 : 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.desc,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.tech,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 14,
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
