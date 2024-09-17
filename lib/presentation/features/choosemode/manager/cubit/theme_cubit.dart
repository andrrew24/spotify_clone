// import 'package:flutter_bloc/flutter_bloc.dart';

// enum ThemeState { light, dark }

// class ThemeCubit extends Cubit<ThemeState> {
//   ThemeCubit() : super(ThemeState.dark);

//   void switchToDarkMode() {
//     if (!(state == ThemeState.dark)) {
//       emit(ThemeState.dark);
//     }
//   }

//   void switchToLightMode() {
//     if (!(state == ThemeState.light)) {
//       emit(ThemeState.light);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}
