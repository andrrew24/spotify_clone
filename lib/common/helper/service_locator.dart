import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/data/repos/auth/auth_repo_impl.dart';
import 'package:spotify_clone/data/repos/song/song_repo_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';
import 'package:spotify_clone/domain/usecases/auth/login_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/song_usecase.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/register/cubit/register_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependences() async {
  serviceLocator.registerLazySingleton<PocketBase>(
    () => PocketBase('http://127.0.0.1:8090/'),
  );

  serviceLocator.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(pb: serviceLocator<PocketBase>()));

  serviceLocator.registerSingleton<SongRemoteDataSource>(
      SongRemoteDataSourceImpl(pb: serviceLocator<PocketBase>()));

  serviceLocator.registerSingleton<AuthRepo>(AuthRepoImpl(
      authRemoteDataSource: serviceLocator<AuthRemoteDataSource>()));

  serviceLocator.registerSingleton<SongRepo>(SongRepoImpl(
      songRemoteDataSource: serviceLocator<SongRemoteDataSource>()));

  serviceLocator.registerSingleton<RegisterUsecase>(
      RegisterUsecase(authRepo: serviceLocator<AuthRepo>()));

  serviceLocator.registerSingleton<RegisterCubit>(
      RegisterCubit(serviceLocator<RegisterUsecase>()));

  serviceLocator.registerSingleton<LoginUsecase>(
      LoginUsecase(authRepo: serviceLocator<AuthRepo>()));

  serviceLocator.registerSingleton<LoginCubit>(
      LoginCubit(serviceLocator<LoginUsecase>()));

  serviceLocator.registerSingleton<GetNewSongsUseCase>(
      GetNewSongsUseCase(songRepo: serviceLocator<SongRepo>()));
}
