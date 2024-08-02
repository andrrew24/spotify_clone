import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/data/repos/auth/auth_repo_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependences() async {
  serviceLocator.registerLazySingleton<PocketBase>(
    () => PocketBase('http://127.0.0.1:8090/'),
  );

  serviceLocator.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(pb: serviceLocator<PocketBase>()));

  serviceLocator.registerSingleton<AuthRepo>(AuthRepoImpl(
      authRemoteDataSource: serviceLocator<AuthRemoteDataSource>()));

  serviceLocator.registerSingleton<RegisterUsecase>(
      RegisterUsecase(authRepo: serviceLocator<AuthRepo>()));
}
