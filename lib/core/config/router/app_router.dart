import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/domain/usecases/auth/login_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_song_usecase.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/register/cubit/register_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/register_or_signup_page.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/register_page.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/sign_in_page.dart';
import 'package:spotify_clone/presentation/features/choosemode/pages/choose_mode_page.dart';
import 'package:spotify_clone/presentation/features/home/manager/cubit/get_new_songs_cubit.dart';
import 'package:spotify_clone/presentation/features/home/pages/home_page.dart';
import 'package:spotify_clone/presentation/features/intro/pages/get_started_page.dart';
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
        return BlocProvider(
            create: (context) => LoginCubit(serviceLocator<LoginUsecase>()),
            child: const SignInPage());
      },
    ),
    GoRoute(
      path: kRegisterPage,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
            create: (context) =>
                RegisterCubit(serviceLocator<RegisterUsecase>()),
            child: const RegisterPage());
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
