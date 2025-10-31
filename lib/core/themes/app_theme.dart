import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class AppThemes {
  static light() => ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kBackgroundColor,
      titleTextStyle: AppTextStyles.kBlack20Medium(),
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    splashFactory: NoSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.kBackgroundColor,

    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 16.sp, color: AppColors.kBlackColor),
    ),

    inputDecorationTheme: InputDecorationThemeData(
      hintStyle: AppTextStyles.kPlaceHolder14Regular(),
      labelStyle: AppTextStyles.kGrey12Regular(),

      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.kBorderColor, width: 1.5.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.kBorderColor, width: 1.5.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(
          color: AppColors.kErrorBorderColor,
          width: 1.5.w,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(
          color: AppColors.kErrorBorderColor,
          width: 1.5.w,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.k16Medium(),
      ),
    ),
  );

  static dark() => ThemeData(brightness: Brightness.light);
}
