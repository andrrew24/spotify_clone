import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/data/models/auth/signin_user_model.dart';

abstract class AuthRepo {
  Future<Either> register(CreateUserModel model);
  Future<Either> signin(SigninUserModel model);
}
