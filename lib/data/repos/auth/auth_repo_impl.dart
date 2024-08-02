import 'package:dartz/dartz.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> register(CreateUserModel model) async {
    try {
      var result = await authRemoteDataSource.register(model);

      print(result);

      return const Right("Register Success");
    } on ClientException catch (e) {
      return Left(ServerFailure.fromPocketBase(e));
    }
  }
}
