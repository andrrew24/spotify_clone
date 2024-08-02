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
    log('RegisterLoading emitted');
    try {
      var result = await registerUsecase.call(params: user);
      result.fold(
        (l) {
          log('RegisterFailure emitted with error: ${l.errorMessage}');
          emit(RegisterFailure(errorMessage: l.errorMessage));
        },
        (r) {
          log('RegisterSuccess emitted');
          emit(RegisterSuccess());
        },
      );
    }on ClientException catch (e) {
      log('RegisterFailure emitted with exception: $e');
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }
}
