import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.value == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: _isLoading ? _buildShimmerEffect() : _buildContent(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.card.withValues(alpha: 0.8),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ).animate().slideY(begin: 1.0, end: 0, duration: 600.ms),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ).animate().scale(delay: 1.seconds, duration: 500.ms),
    );
  }

  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 6,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: AppColors.card,
          highlightColor: AppColors.neumorphicShadowLight,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GlassCard(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Hero(
                tag: 'item_$index',
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.image, color: AppColors.primary),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Premium Feature Item #$index",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "High-end Material 3 design with smooth animations.",
                      style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                    ),
                  ],
                ),
              ),
              IconButton(icon: const Icon(Icons.arrow_forward_ios, size: 16), onPressed: () {}),
            ],
          ),
        ).animate().fadeIn(delay: (index * 100).ms).slideX(begin: 0.2);
      },
    );
  }
}
