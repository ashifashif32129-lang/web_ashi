import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../constants/app_colors.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../widgets/aurora_background.dart';
import '../widgets/glass_card.dart';
import '../widgets/mouse_glow.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/projects_section.dart';
import '../sections/experience_section.dart';
import '../sections/resume_section.dart';
import '../sections/contact_section.dart';
import '../sections/footer_section.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _sections = [
    "Home",
    "About",
    "Skills",
    "Projects",
    "Experience",
    "Resume",
    "Contact",
  ];

  void _scrollTo(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
    );
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: isMobile ? _buildDrawer() : null,
      body: MouseGlow(
        child: Stack(
          children: [
            // Aurora Background
            const Positioned.fill(child: AuroraBackground()),
            
            // Sections
            ScrollablePositionedList.builder(
              itemCount: _sections.length + 1, // +1 for Footer
              itemScrollController: _itemScrollController,
              itemPositionsListener: _itemPositionsListener,
              itemBuilder: (context, index) {
                if (index == _sections.length) return const FooterSection();
                return _buildSection(index);
              },
            ),
            
            // Navigation Bar
            if (!isMobile) _buildNavBar(),
            
            // Mobile Menu Button
            if (isMobile)
              Positioned(
                top: 20,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int index) {
    switch (index) {
      case 0: return HeroSection(onContactPressed: () => _scrollTo(6));
      case 1: return const AboutSection();
      case 2: return const SkillsSection();
      case 3: return const ProjectsSection();
      case 4: return const ExperienceSection();
      case 5: return const ResumeSection();
      case 6: return const ContactSection();
      default: return const SizedBox();
    }
  }

  Widget _buildNavBar() {
    return Positioned(
      top: 32,
      left: 20,
      right: 20,
      child: Center(
        child: GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          borderRadius: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                AppConstants.name.split(" ")[0].toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
                const SizedBox(width: 32),
                ...List.generate(_sections.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () => _scrollTo(index),
                      child: Text(
                        _sections[index],
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                AppConstants.name.split(" ")[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          ...List.generate(_sections.length, (index) {
            return ListTile(
              title: Text(
                _sections[index],
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () => _scrollTo(index),
            );
          }),
        ],
      ),
    );
  }
}
