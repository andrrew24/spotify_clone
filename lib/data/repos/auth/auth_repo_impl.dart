import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/data/models/auth/signin_user_model.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, String>> register(CreateUserModel model) async {
    try {
      await authRemoteDataSource.register(model);
      return const Right("Register Success");
    } on ClientException catch (e) {
      log(ServerFailure.fromPocketBase(e).errorMessage);
      return Left(ServerFailure.fromPocketBase(e));
    }
  }

  @override
  Future<Either<Failure, String>> signin(SigninUserModel model) async {
    try {
      await authRemoteDataSource.signin(model);
      return const Right("Login Success");
    } on ClientException catch (e) {
      log(ServerFailure.fromPocketBase(e).errorMessage);
      return Left(ServerFailure.fromPocketBase(e));
    }
  }
}
