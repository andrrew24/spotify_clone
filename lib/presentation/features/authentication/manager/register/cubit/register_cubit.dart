import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  final RegisterUsecase registerUsecase;

  Future<void> registerUser(CreateUserModel user) async {
    emit(RegisterLoading());
    try {
      var result = await registerUsecase.call(userId: user);
      result.fold(
        (l) {
          emit(RegisterFailure(errorMessage: l.errorMessage));
        },
        (r) {
          emit(RegisterSuccess());
        },
      );
    } on ClientException catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }
}
