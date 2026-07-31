import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home.dart';
import 'utils/colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
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
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ASHIF",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
                letterSpacing: 10,
              ),
            ).animate().fadeIn(duration: 1000.ms).scale(begin: const Offset(0.5, 0.5)),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 2,
              color: AppColors.primary.withValues(alpha: 0.2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 0,
                  height: 2,
                  color: AppColors.primary,
                ).animate(onPlay: (controller) => controller.repeat())
                  .custom(
                    duration: 2000.ms,
                    builder: (context, value, child) {
                      return Container(
                        width: 200 * value,
                        height: 2,
                        color: AppColors.primary,
                      );
                    },
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
