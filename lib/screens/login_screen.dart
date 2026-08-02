import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import 'dashboard_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSuccess = false;

  void _handleLogin() async {
    setState(() => _isSuccess = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient Blobs
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
             .move(duration: 5.seconds, end: const Offset(50, 50)),
          ),
          
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_isSuccess)
                    Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_s2lryxtd.json', // Success checkmark
                      width: 150,
                      height: 150,
                      repeat: false,
                    )
                  else ...[
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ).animate().fadeIn().slideY(begin: -0.2),
                    
                    const SizedBox(height: 40),
                    
                    GlassCard(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text("LOGIN", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 400.ms).scale(begin: const Offset(0.9, 0.9)),
                    
                    const SizedBox(height: 24),
                    
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupScreen()),
                        );
                      },
                      child: const Text("Don't have an account? Sign Up"),
                    ).animate().fadeIn(delay: 800.ms),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
