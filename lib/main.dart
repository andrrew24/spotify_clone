import 'package:flutter/material.dart';
import 'package:spotify_clone/core/config/router/app_router.dart';
import 'core/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
    );
  }
}
