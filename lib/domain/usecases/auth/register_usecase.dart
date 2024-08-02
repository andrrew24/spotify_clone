import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/domain/repos/auth/auth_repo.dart';

class RegisterUsecase implements Usecase<Either, CreateUserModel> {
  final AuthRepo authRepo;

  RegisterUsecase({required this.authRepo});
  @override
  Future<Either<Failure, String>> call({CreateUserModel? params}) async {
    return await authRepo.register(params!);
  }
}
