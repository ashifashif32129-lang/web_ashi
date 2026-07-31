import 'package:flutter/material.dart';
import 'utils/colors.dart';
import 'sections/hero.dart';
import 'sections/about.dart';
import 'sections/skills.dart';
import 'sections/services.dart';
import 'sections/why_choose_me.dart';
import 'sections/contact.dart';
import 'sections/footer.dart';
import 'widgets/animated_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  void _scrollToSection(int index) {
    Scrollable.ensureVisible(
      _sectionKeys[index].currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background.withValues(alpha: 0.8),
        elevation: 0,
        title: const Text(
          "ASHIF",
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          _navItem("About", 0),
          _navItem("Skills", 1),
          _navItem("Services", 2),
          _navItem("Contact", 3),
          const SizedBox(width: 20),
        ],
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    const HeroSection(),
                    AboutSection(key: _sectionKeys[0]),
                    SkillsSection(key: _sectionKeys[1]),
                    ServicesSection(key: _sectionKeys[2]),
                    const WhyChooseMeSection(),
                    ContactSection(key: _sectionKeys[3]),
                    const FooterSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }

  Widget _navItem(String title, int index) {
    return TextButton(
      onPressed: () => _scrollToSection(index),
      child: Text(
        title,
        style: const TextStyle(color: AppColors.text, fontWeight: FontWeight.w500),
      ),
    );
  }
}
