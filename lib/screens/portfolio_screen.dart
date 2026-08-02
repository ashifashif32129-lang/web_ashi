import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  final List<String> _sections = ["Home", "About", "Skills", "Projects", "Experience", "Contact"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Animated Background
          const Positioned.fill(child: PortfolioBackground()),
          
          ScrollablePositionedList.builder(
            itemCount: _sections.length,
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionsListener,
            itemBuilder: (context, index) {
              return _buildSection(index);
            },
          ),
          
          // Navigation Bar
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: GlassCard(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                borderRadius: 30,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _sections.map((section) {
                    return TextButton(
                      onPressed: () {
                        _itemScrollController.scrollTo(
                          index: _sections.indexOf(section),
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutCubic,
                        );
                      },
                      child: Text(
                        section,
                        style: const TextStyle(color: AppColors.textPrimary),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(int index) {
    switch (index) {
      case 0: return _buildHero();
      case 1: return _buildAbout();
      case 2: return _buildSkills();
      case 3: return _buildProjects();
      case 4: return _buildExperience();
      case 5: return _buildContact();
      default: return Container(height: 600, color: Colors.transparent);
    }
  }

  Widget _buildContact() {
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        children: [
          const Text("Get In Touch", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              child: GlassCard(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Name", prefixIcon: Icon(Icons.person)),
                        validator: (value) => value!.isEmpty ? "Please enter your name" : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email)),
                        validator: (value) => value!.isEmpty ? "Please enter your email" : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        maxLines: 4,
                        decoration: const InputDecoration(labelText: "Message", prefixIcon: Icon(Icons.message)),
                        validator: (value) => value!.isEmpty ? "Please enter a message" : null,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // Send logic
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("SEND MESSAGE", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(Icons.link, "LinkedIn"),
                          const SizedBox(width: 20),
                          _buildSocialIcon(Icons.code, "GitHub"),
                          const SizedBox(width: 20),
                          _buildSocialIcon(Icons.camera_alt, "Instagram"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(icon, color: AppColors.accent, size: 30),
        onPressed: () {},
      ).animate(onPlay: (controller) => controller.repeat(reverse: true))
       .scale(duration: 2.seconds, end: const Offset(1.2, 1.2)),
    );
  }

  Widget _buildProjects() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        children: [
          const Text("Recent Projects", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: List.generate(4, (index) {
                  return ProjectCard(index: index, width: constraints.maxWidth > 800 ? (constraints.maxWidth - 60) / 2 : constraints.maxWidth);
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                "I am Ashif",
                textStyle: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                speed: const Duration(milliseconds: 200),
              ),
              TypewriterAnimatedText(
                "Flutter Developer",
                textStyle: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
            repeatForever: true,
          ),
          const SizedBox(height: 24),
          const Text(
            "Building modern, responsive, and high-performance applications.",
            style: TextStyle(fontSize: 20, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 1.seconds),
        ],
      ),
    );
  }

  Widget _buildAbout() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: GlassCard(
        child: Column(
          children: [
            const Text("About Me", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text(
              "I focus on writing clean code, building responsive user interfaces, and delivering smooth user experiences.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkills() {
    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          // Trigger animations
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
        child: Column(
          children: [
            const Text("My Skills", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            _buildSkillBar("Flutter", 0.9),
            _buildSkillBar("Dart", 0.85),
            _buildSkillBar("Firebase", 0.8),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillBar(String skill, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skill, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: AppColors.card,
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
            ),
          ).animate().scaleX(duration: 1.seconds, begin: 0),
        ],
      ),
    );
  }

  Widget _buildExperience() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        children: [
          const Text("Experience Timeline", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          _buildTimelineItem("2023 - Present", "Senior Flutter Developer", "Working on large-scale cross-platform apps."),
          _buildTimelineItem("2021 - 2023", "Junior Developer", "Developed internal tools and mobile UI components."),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String date, String title, String desc) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(width: 20, height: 20, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
              Expanded(child: Container(width: 2, color: AppColors.primary.withValues(alpha: 0.3))),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date, style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(desc, style: const TextStyle(color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).slideX(begin: 0.1);
  }
}

class ProjectCard extends StatefulWidget {
  final int index;
  final double width;

  const ProjectCard({super.key, required this.index, required this.width});

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isHovered
              ? [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))]
              : [],
        ),
        child: GlassCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: AnimatedScale(
                  scale: _isHovered ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: AppColors.primary.withValues(alpha: 0.1),
                    child: const Icon(Icons.work_outline, size: 50, color: AppColors.primary),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Project #${widget.index + 1}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text(
                      "A modern Flutter project showcasing advanced animations and clean architecture.",
                      style: TextStyle(color: AppColors.textSecondary),
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

class PortfolioBackground extends StatelessWidget {
  const PortfolioBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.background),
      child: Stack(
        children: List.generate(5, (index) {
          return Positioned(
            top: index * 200.0,
            left: index * 100.0,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.blobs[index % AppColors.blobs.length],
                shape: BoxShape.circle,
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
             .move(duration: 10.seconds, end: const Offset(100, 100))
             .scale(duration: 8.seconds, end: const Offset(1.2, 1.2)),
          );
        }),
      ),
    );
  }
}
