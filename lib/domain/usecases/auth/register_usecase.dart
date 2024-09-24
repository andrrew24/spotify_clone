import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';

class RegisterUsecase implements Usecase<Either, CreateUserModel> {
  @override
  Future<Either> call({CreateUserModel? userId}) async {
    return await serviceLocator<AuthRepo>().register(userId!);
  }
}
