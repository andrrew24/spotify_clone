import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/features/choosemode/manager/cubit/theme_cubit.dart';

bool isDarkMode(BuildContext context) {
  return (BlocProvider.of<ThemeCubit>(context).state == ThemeState.light);
}