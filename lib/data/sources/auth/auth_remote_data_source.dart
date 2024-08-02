import 'package:dartz/dartz.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either> signin();
  Future<Either> register(CreateUserModel model);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final PocketBase pb;

  AuthRemoteDataSourceImpl({required this.pb});

  @override
  Future<Either> register(CreateUserModel model) async {
    try {
      final body = <String, dynamic>{
        "email": model.email,
        "password": model.password,
        "passwordConfirm": model.password,
        "name": model.fullname
      };
      var result = await pb.collection('users').create(body: body);

      print(result);

      return const Right("Register Succes");
    } on ClientException catch (e) {
      return Left(ServerFailure.fromPocketBase(e));
    }
  }

  @override
  Future<Either> signin() async {
    try {
      await pb
          .collection('users')
          .authWithPassword('bob@example.com', '12345678');

      return const Right("Sign in success");
    } on ClientException catch (e) {
      return Left(ServerFailure.fromPocketBase(e));
    }
  }
}
