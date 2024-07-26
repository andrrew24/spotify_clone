import 'package:flutter/material.dart';
import 'core/config/theme/app_theme.dart';
import 'package:spotify_clone/presentation/features/splash/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const Splash(),
    );
  }
}
