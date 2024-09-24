import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/data/repos/auth/auth_repo_impl.dart';
import 'package:spotify_clone/data/repos/song/song_repo_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_local_data_source.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source_impl.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';

import 'package:spotify_clone/domain/repos/song/song_repo.dart';
import 'package:spotify_clone/domain/usecases/auth/login_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/sign_out_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/add_or_remove_fav_song_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_song_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_playlist_use_case.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/register/cubit/register_cubit.dart';

final serviceLocator = GetIt.instance;

late PocketBase pb;

Future<void> init() async {
  final localStorage = AuthLocalDataSourceImpl();
  final token = await localStorage.getToken();

  final customAuthStore = AsyncAuthStore(
    initial: token,
    clear: localStorage.deleteToken,
    save: localStorage.setToken,
  );

  pb = PocketBase(AppConstants.baseUrl, authStore: customAuthStore);
}

Future<void> initDependences() async {
  serviceLocator
      .registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());

  serviceLocator.registerSingleton<AuthRepo>(AuthRepoImpl(
      authRemoteDataSource: serviceLocator<AuthRemoteDataSource>()));

  serviceLocator.registerSingleton<RegisterUsecase>(RegisterUsecase());

  serviceLocator.registerSingleton<RegisterCubit>(
      RegisterCubit(serviceLocator<RegisterUsecase>()));

  serviceLocator.registerSingleton<LoginUsecase>(LoginUsecase());

  serviceLocator.registerSingleton<LoginCubit>(
      LoginCubit(serviceLocator<LoginUsecase>()));

  serviceLocator
      .registerSingleton<SongRemoteDataSource>(SongRemoteDataSourceImpl());

  serviceLocator.registerSingleton<SongRepo>(SongRepoImpl(
      songRemoteDataSource: serviceLocator<SongRemoteDataSource>()));

  serviceLocator.registerSingleton<GetNewSongsUseCase>(GetNewSongsUseCase());

  serviceLocator.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());

  serviceLocator.registerSingleton<AddOrRemoveFavSongUsecase>(
      AddOrRemoveFavSongUsecase());

  serviceLocator.registerSingleton<SignOutUsecase>(SignOutUsecase());
}
