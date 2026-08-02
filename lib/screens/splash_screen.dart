import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Animation
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.flash_on, size: 60, color: Colors.white),
            )
            .animate()
            .scale(duration: 800.ms, curve: Curves.elasticOut)
            .rotate(duration: 1200.ms)
            .shimmer(delay: 1.seconds, duration: 1.seconds),
            
            const SizedBox(height: 24),
            
            const Text(
              "PREMIUM APP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: AppColors.textPrimary,
              ),
            )
            .animate()
            .fadeIn(delay: 500.ms, duration: 800.ms)
            .slideY(begin: 0.5, end: 0),
          ],
        ),
      ),
    );
  }
}
