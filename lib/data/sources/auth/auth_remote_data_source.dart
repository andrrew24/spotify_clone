import 'dart:developer';

import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/data/models/auth/signin_user_model.dart';
import 'package:spotify_clone/data/sources/auth/auth_local_data_source.dart';

abstract class AuthRemoteDataSource {
  Future<void> signin(SigninUserModel model);
  Future<void> register(CreateUserModel model);
  signout();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<void> register(CreateUserModel model) async {
    final body = <String, dynamic>{
      "email": model.email,
      "password": model.password,
      "passwordConfirm": model.password,
      "name": model.fullname
    };
    await pb.collection('users').create(body: body);
  }

  @override
  Future<void> signin(SigninUserModel model) async {
    await pb.collection('users').authWithPassword(model.email, model.password);
  }

  @override
  signout() async {
    pb.authStore.clear();
  }
}
