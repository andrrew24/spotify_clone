import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';

class SignOutUsecase extends Usecase<void, BuildContext> {
  @override
  Future<void> call({BuildContext? param}) async {
    await serviceLocator<AuthRepo>().signout();
    GoRouter.of(param!).pushReplacement(AppConstants.kgetStarted);
  }
}
