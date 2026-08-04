import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: GlassCard(
            padding: const EdgeInsets.all(60),
            borderColor: AppColors.primary.withValues(alpha: 0.3),
            child: Column(
              children: [
                const Icon(
                  Icons.description_outlined,
                  size: 80,
                  color: AppColors.primary,
                ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                 .moveY(begin: -10, end: 10, duration: 2.seconds),
                
                const SizedBox(height: 32),
                
                const Text(
                  "Interested in my work?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                const Text(
                  "Download my full resume to see more details about my technical skills, education, and professional journey.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 48),
                
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download_rounded),
                  label: const Text("DOWNLOAD RESUME"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    elevation: 10,
                    shadowColor: AppColors.primary.withValues(alpha: 0.5),
                  ),
                ).animate().scale(delay: 500.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
