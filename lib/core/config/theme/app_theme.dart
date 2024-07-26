import 'package:flutter/material.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.lightBackground,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              textStyle: AppStyles.styleBold22(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))));

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.darkBackground,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 100),
              backgroundColor: AppColors.primaryColor,
              textStyle: AppStyles.styleBold22(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))));
}
