import 'package:flutter/material.dart';
import 'constants/app_theme.dart';
import 'loading_screen.dart';

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
          title: 'ASHIF | Flutter Developer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: const LoadingScreen(),
        );
      },
    );
  }
}
