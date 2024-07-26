import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/presentation/features/get_started/pages/get_started_page.dart';
import 'package:spotify_clone/presentation/features/splash/pages/splash_page.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: kSplash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: kgetStarted,
      builder: (BuildContext context, GoRouterState state) {
        return const GetStartedPage();
      },
    ),
  ],
);
