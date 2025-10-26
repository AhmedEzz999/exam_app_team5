import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class Themes {
  static light() => ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      titleTextStyle: AppTextStyles.kBlack20Mediam(),
    ),
    splashFactory: NoSplash.splashFactory,
    inputDecorationTheme: InputDecorationThemeData(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.kGreyColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.kGreyColor),
      ),
      hintStyle: AppTextStyles.kPlaceHolder14Regular(),
      labelStyle: AppTextStyles.kGrey12Regular(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: AppColors.kWhiteColor,
        textStyle: AppTextStyles.k16Medium(),
      ),
    ),
  );
  static dark() => ThemeData(brightness: Brightness.light);
}
