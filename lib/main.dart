import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/core/config/router/app_router.dart';
import 'package:spotify_clone/core/config/theme/app_theme.dart';
import 'package:spotify_clone/presentation/features/choosemode/manager/cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
  final pb = PocketBase('http://10.0.2.2:8090/');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
            title: 'Flutter Demo',
            theme: state == ThemeState.light
                ? AppTheme.lightTheme
                : AppTheme.darkTheme,
          );
        },
      ),
    );
  }
}
