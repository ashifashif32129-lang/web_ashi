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
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 120,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          // Section Heading
          Column(
            children: [
              const Text(
                "About Me",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 4,
                ),
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 12),
              Text(
                "Transforming Ideas into Digital Reality",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                  color: AppColors.textPrimary,
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 800.ms),
            ],
          ),

          const SizedBox(height: 80),

          // Content Area
          Container(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Side: Abstract Graphic + Description
                Expanded(
                  flex: isMobile ? 0 : 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAbstractGraphic(isMobile),
                      const SizedBox(height: 40),
                      Text(
                        "I am a passionate Flutter Developer dedicated to crafting high-performance, beautiful mobile and web applications.",
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 26,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                          color: AppColors.textPrimary,
                        ),
                      ).animate().fadeIn(delay: 400.ms),
                      const SizedBox(height: 24),
                      Text(
                        "With deep expertise in Flutter and Dart, I focus on writing clean, maintainable code and building responsive user interfaces that deliver exceptional user experiences.\n\n"
                        "My approach combines technical excellence with a keen eye for design, ensuring that every project not only works perfectly but also looks premium and modern.",
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          color: AppColors.textSecondary,
                          height: 1.8,
                          letterSpacing: 0.5,
                        ),
                      ).animate().fadeIn(delay: 600.ms),
                    ],
                  ),
                ),

                if (!isMobile) SizedBox(width: isTablet ? 40 : 100),
                if (isMobile) const SizedBox(height: 60),

                // Right Side: Statistics Grid
                Expanded(
                  flex: isMobile ? 0 : 4,
                  child: Column(
                    children: [
                      _AboutStatCard(
                        value: 1,
                        label: "Years Experience",
                        suffix: "+",
                        delay: 800.ms,
                      ),
                      const SizedBox(height: 24),
                      _AboutStatCard(
                        value: 5,
                        label: "Flutter Projects",
                        suffix: "+",
                        delay: 1000.ms,
                      ),
                      const SizedBox(height: 24),
                      _AboutStatCard(
                        value: 2,
                        label: "Clients",
                        suffix: "+",
                        delay: 1200.ms,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbstractGraphic(bool isMobile) {
    return Container(
      height: isMobile ? 120 : 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            Colors.transparent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Icons.code,
              size: 150,
              color: AppColors.primary.withValues(alpha: 0.05),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTechIcon(Icons.phone_android),
                const SizedBox(width: 24),
                _buildTechIcon(Icons.laptop),
                const SizedBox(width: 24),
                _buildTechIcon(Icons.bolt),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 1.seconds).scale(begin: const Offset(0.95, 0.95));
  }

  Widget _buildTechIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Icon(icon, color: AppColors.primary, size: 32),
    );
  }
}

class _AboutStatCard extends StatefulWidget {
  final dynamic value;
  final String label;
  final String suffix;
  final Duration delay;

  const _AboutStatCard({
    required this.value,
    required this.label,
    this.suffix = "",
    required this.delay,
  });

  @override
  State<_AboutStatCard> createState() => _AboutStatCardState();
}

class _AboutStatCardState extends State<_AboutStatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: _isHovered ? Matrix4.translationValues(0, -5, 0) : Matrix4.identity(),
        child: GlassCard(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          borderColor: _isHovered ? AppColors.primary.withValues(alpha: 0.6) : null,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.trending_up, color: AppColors.primary),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.value is int
                        ? AnimatedCounter(
                            targetValue: widget.value,
                            suffix: widget.suffix,
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                              height: 1,
                            ),
                          )
                        : Text(
                            widget.value.toString(),
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                              height: 1,
                            ),
                          ),
                    const SizedBox(height: 8),
                    Text(
                      widget.label,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: widget.delay).slideX(begin: 0.1, end: 0);
  }
}
