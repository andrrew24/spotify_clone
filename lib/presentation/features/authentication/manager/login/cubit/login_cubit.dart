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
    log('LoginLoading emitted');
    try {
      var result = await loginUsecase.call(params: user);
      result.fold(
        (l) {
          log('LoginFailure emitted with error: ${l.errorMessage}');
          emit(LoginFailure(errorMessage: l.errorMessage));
        },
        (r) {
          log('LoginSuccess emitted');
          emit(LoginSuccess());
        },
      );
    } catch (e) {
      log('LoginFailure emitted with exception: $e');
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
