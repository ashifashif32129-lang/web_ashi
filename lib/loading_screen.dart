import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'screens/portfolio_screen.dart';
import 'constants/app_colors.dart';
import 'utils/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const PortfolioScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 1000),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Minimal logo reveal
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ).animate()
             .scale(duration: 1.seconds, curve: Curves.easeOutBack)
             .rotate(duration: 2.seconds, begin: 0, end: 1)
             .shimmer(delay: 1.5.seconds, duration: 1.seconds),
            
            const SizedBox(height: 48),
            
            // Text reveal
            Text(
              AppConstants.name.split(" ")[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: 8,
                color: Colors.white,
              ),
            ).animate()
             .fadeIn(delay: 500.ms, duration: 800.ms)
             .slideY(begin: 0.5, end: 0),
            
            const SizedBox(height: 24),
            
            // Progress line
            Container(
              width: 200,
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(1),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 0,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(1),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ).animate()
                 .custom(
                   duration: 3.seconds,
                   builder: (context, value, child) => FractionallySizedBox(
                     widthFactor: value,
                     child: child,
                   ),
                 ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
