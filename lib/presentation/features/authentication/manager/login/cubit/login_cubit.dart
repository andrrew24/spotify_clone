import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_clone/data/models/auth/signin_user_model.dart';
import 'package:spotify_clone/domain/usecases/auth/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUsecase) : super(LoginInitial());
  final LoginUsecase loginUsecase;

  Future<void> loginUser(SigninUserModel user) async {
    emit(LoginLoading());
    try {
      var result = await loginUsecase.call(param: user);
      result.fold(
        (l) {
          emit(LoginFailure(errorMessage: l.errorMessage));
        },
        (r) {
          emit(LoginSuccess());
        },
      );
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
