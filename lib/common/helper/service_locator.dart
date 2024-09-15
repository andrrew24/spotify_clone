import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/data/repos/auth/auth_repo_impl.dart';
import 'package:spotify_clone/data/repos/song/song_repo_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';
import 'package:spotify_clone/domain/repos/song/get_new_song_repo.dart';
import 'package:spotify_clone/domain/repos/song/get_playlist_repo.dart';
import 'package:spotify_clone/domain/usecases/auth/login_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_song_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_playlist_use_case.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/register/cubit/register_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependences() async {
  serviceLocator.registerLazySingleton<PocketBase>(
    () => PocketBase(AppConstants.localHost),
  );

  serviceLocator.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(pb: serviceLocator<PocketBase>()));

  serviceLocator.registerSingleton<GetNewSongRemoteDataSource>(
      GetNewSongRemoteDataSourceImpl(pb: serviceLocator<PocketBase>()));

  serviceLocator.registerSingleton<GetPlaylistRemoteDataSource>(
      GetPlaylistRemoteDataSourceImpl(pb: serviceLocator<PocketBase>()));

  serviceLocator.registerSingleton<AuthRepo>(AuthRepoImpl(
      authRemoteDataSource: serviceLocator<AuthRemoteDataSource>()));

  serviceLocator.registerSingleton<GetNewSongRepo>(GetNewSongRepoImpl(
      getNewSongRemoteDataSource:
          serviceLocator<GetNewSongRemoteDataSource>()));

  serviceLocator.registerSingleton<GetPlaylistRepo>(GetPlaylistRepoImpl(
      getPlaylistRemoteDataSource:
          serviceLocator<GetPlaylistRemoteDataSource>()));

  serviceLocator.registerSingleton<RegisterUsecase>(
      RegisterUsecase(authRepo: serviceLocator<AuthRepo>()));

  serviceLocator.registerSingleton<RegisterCubit>(
      RegisterCubit(serviceLocator<RegisterUsecase>()));

  serviceLocator.registerSingleton<LoginUsecase>(
      LoginUsecase(authRepo: serviceLocator<AuthRepo>()));

  serviceLocator.registerSingleton<LoginCubit>(
      LoginCubit(serviceLocator<LoginUsecase>()));

  serviceLocator.registerSingleton<GetNewSongsUseCase>(
      GetNewSongsUseCase(getNewSongRepo: serviceLocator<GetNewSongRepo>()));

  serviceLocator.registerSingleton<GetPlaylistUseCase>(
      GetPlaylistUseCase(getPlaylistRepo: serviceLocator<GetPlaylistRepo>()));
}
