import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/router/app_router.dart';
import 'package:spotify_clone/core/config/theme/app_theme.dart';
import 'package:spotify_clone/core/observer/simple_bloc_observer.dart';
import 'package:spotify_clone/domain/usecases/auth/login_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/song_usecase.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/register/cubit/register_cubit.dart';
import 'package:spotify_clone/presentation/features/choosemode/manager/cubit/theme_cubit.dart';
import 'package:spotify_clone/presentation/features/home/manager/cubit/get_new_songs_cubit.dart';
import 'package:spotify_clone/presentation/features/home/pages/home_page.dart';

void main() async {
  await initDependences();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const SpotifyClone());
}

class SpotifyClone extends StatelessWidget {
  const SpotifyClone({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
            theme: state == ThemeState.light
                ? AppTheme.lightTheme
                : AppTheme.darkTheme,
          );
        },
      ),
    );
  }
}
