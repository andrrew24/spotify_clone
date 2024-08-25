import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/register_or_signup_page.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/register_page.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/sign_in_page.dart';
import 'package:spotify_clone/presentation/features/choosemode/pages/choose_mode_page.dart';
import 'package:spotify_clone/presentation/features/home/pages/home_page.dart';
import 'package:spotify_clone/presentation/features/intro/pages/get_started_page.dart';
import 'package:spotify_clone/presentation/features/splash/pages/splash_page.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: kSplash,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: kgetStarted,
      builder: (BuildContext context, GoRouterState state) {
        return const GetStartedPage();
      },
    ),
    GoRoute(
      path: kchooseMode,
      builder: (BuildContext context, GoRouterState state) {
        return const ChooseModePage();
      },
    ),
    GoRoute(
      path: kRegisterOrSignup,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterOrSignupPage();
      },
    ),
    GoRoute(
      path: kSignInPage,
      builder: (BuildContext context, GoRouterState state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      path: kRegisterPage,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: kHomePage,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
);
