import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../utils/constants.dart';
import '../widgets/glass_card.dart';
import '../utils/responsive.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  void _downloadResume() async {
    final url = Uri.parse(AppConstants.cvUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 100, horizontal: isMobile ? 20 : 40),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: GlassCard(
            padding: EdgeInsets.all(isMobile ? 32 : 60),
            borderColor: AppColors.primary.withValues(alpha: 0.3),
            child: Column(
              children: [
                Icon(
                  Icons.description_outlined,
                  size: isMobile ? 60 : 80,
                  color: AppColors.primary,
                ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                 .moveY(begin: -10, end: 10, duration: 2.seconds),
                
                const SizedBox(height: 32),
                
                const Text(
                  "Interested in my work?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                Text(
                  "Download my full resume to see more details about my technical skills, education, and professional journey.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 48),
                
                SizedBox(
                  width: isMobile ? double.infinity : null,
                  child: ElevatedButton.icon(
                    onPressed: _downloadResume,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
