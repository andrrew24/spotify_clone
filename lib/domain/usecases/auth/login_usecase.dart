import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_user_model.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';

class LoginUsecase implements Usecase<Either, SigninUserModel> {

  @override
  Future<Either> call({SigninUserModel? params}) async {
    return await serviceLocator<AuthRepo>().signin(params!);
  }
}
