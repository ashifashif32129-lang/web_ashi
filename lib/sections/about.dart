import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/colors.dart';
import '../widgets/section_heading.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: "About Me"),
          const SizedBox(height: 30),
          const Text(
            "Hi, I'm Ashif, a Flutter Developer passionate about creating beautiful and scalable mobile and web applications.\n\n"
            "I focus on writing clean code, building responsive user interfaces, integrating Firebase, and delivering smooth user experiences.",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.secondaryText,
              height: 1.6,
            ),
          ).animate().fadeIn(duration: 1000.ms),
        ],
      ),
    );
  }
}
