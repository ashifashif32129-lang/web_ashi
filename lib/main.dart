import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'constants/app_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/portfolio_screen.dart';

void main() {
  runApp(const MyApp());
}

final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.dark);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, child) {
        return MaterialApp(
          title: 'Premium Flutter App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: kIsWeb ? const PortfolioScreen() : const SplashScreen(),
        );
      },
    );
  }
}
