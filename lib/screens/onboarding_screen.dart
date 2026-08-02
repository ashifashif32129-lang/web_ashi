import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _data = [
    {
      "title": "Modern UI Design",
      "description": "Experience the beauty of glassmorphism and Material 3 design systems.",
      "icon": "🎨"
    },
    {
      "title": "Smooth Animations",
      "description": "Fluid transitions and engaging micro-interactions for every user action.",
      "icon": "✨"
    },
    {
      "title": "High Performance",
      "description": "Optimized for speed and responsiveness across all your devices.",
      "icon": "⚡"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _data[index]["icon"]!,
                      style: const TextStyle(fontSize: 100),
                    ).animate().scale(duration: 600.ms).shake(),
                    
                    const SizedBox(height: 40),
                    
                    Text(
                      _data[index]["title"]!,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn().slideY(begin: 0.2),
                    
                    const SizedBox(height: 20),
                    
                    Text(
                      _data[index]["description"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 300.ms),
                  ],
                ),
              );
            },
          ),
          
          // Navigation Controls
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _navigateToLogin(),
                  child: const Text("SKIP"),
                ),
                
                Row(
                  children: List.generate(
                    _data.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? AppColors.primary : AppColors.textSecondary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                
                IconButton(
                  onPressed: () {
                    if (_currentPage < _data.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _navigateToLogin();
                    }
                  },
                  icon: Icon(
                    _currentPage == _data.length - 1 ? Icons.check_circle : Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}
