import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeState { light, dark }

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.dark);

  void switchToDarkMode() {
    if (!(state == ThemeState.dark)) {
      emit(ThemeState.dark);
    }
  }

  void switchToLightMode() {
    if (!(state == ThemeState.light)) {
      emit(ThemeState.light);
    }
  }
}
