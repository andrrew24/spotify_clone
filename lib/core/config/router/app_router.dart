import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/domain/usecases/auth/login_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_song_usecase.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/register/cubit/register_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/register_or_signup_page.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/register_page.dart';
import 'package:spotify_clone/presentation/features/authentication/pages/sign_in_page.dart';
import 'package:spotify_clone/presentation/features/choosemode/pages/choose_mode_page.dart';
import 'package:spotify_clone/presentation/features/home/manager/get_new_songs_cubit/get_new_songs_cubit.dart';
import 'package:spotify_clone/presentation/features/home/pages/home_page.dart';
import 'package:spotify_clone/presentation/features/intro/pages/get_started_page.dart';
import 'package:spotify_clone/presentation/features/play_song/pages/play_song_page.dart';
import 'package:spotify_clone/presentation/features/splash/pages/splash_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: pb.authStore.isValid ? AppConstants.kHomePage : AppConstants.kSplash,
  routes: <RouteBase>[
    GoRoute(
      path: AppConstants.kSplash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: AppConstants.kgetStarted,
      builder: (BuildContext context, GoRouterState state) {
        return const GetStartedPage();
      },
    ),
    GoRoute(
      path: AppConstants.kchooseMode,
      builder: (BuildContext context, GoRouterState state) {
        return const ChooseModePage();
      },
    ),
    GoRoute(
      path: AppConstants.kRegisterOrSignup,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterOrSignupPage();
      },
    ),
    GoRoute(
      path: AppConstants.kSignInPage,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
            create: (context) => LoginCubit(serviceLocator<LoginUsecase>()),
            child: const SignInPage());
      },
    ),
    GoRoute(
      path: AppConstants.kRegisterPage,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
            create: (context) =>
                RegisterCubit(serviceLocator<RegisterUsecase>()),
            child: const RegisterPage());
      },
    ),
    GoRoute(
      path: AppConstants.kHomePage,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: AppConstants.kPlaySongPage,
      builder: (BuildContext context, GoRouterState state) {
        return const PlaySongPage();
      },
    ),
  ],
);
