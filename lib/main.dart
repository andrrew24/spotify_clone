import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/core/config/router/app_router.dart';
import 'package:spotify_clone/core/config/theme/app_theme.dart';
import 'package:spotify_clone/core/observer/simple_bloc_observer.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify_clone/domain/usecases/auth/login_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_song_usecase.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/register/cubit/register_cubit.dart';
import 'package:spotify_clone/presentation/features/choosemode/manager/cubit/theme_cubit.dart';
import 'package:spotify_clone/presentation/features/home/manager/get_new_songs_cubit/get_new_songs_cubit.dart';
import 'package:spotify_clone/presentation/features/home/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  // open hive box for handling user token
  await Hive.openBox(AppConstants.kAuth);
  // load variables in .env file (placed in the root project folder)
  await dotenv.load(fileName: ".env");
  // used hydrated bloc to save theme mode state
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationCacheDirectory());
  // used bloc observer to observe app different states
  Bloc.observer = SimpleBlocObserver();
  // initialize pocketbase instance to handle user auth
  await initPocketBase();
  // initialize app dependencies
  await initDependences();

  //configs for native splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    const Duration(seconds: 0),
  );
  FlutterNativeSplash.remove();
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
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
          );
        },
      ),
    );
  }
}
