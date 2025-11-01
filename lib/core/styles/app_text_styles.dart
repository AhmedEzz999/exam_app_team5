import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle kBlack20Mediam() => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.kBlackColor,
  );
  static TextStyle kBlack13Regular() => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.kBlackColor,
  );
  static TextStyle kBlack16Regular() => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.kBlackColor,
  );
  static TextStyle kBlack12UnderLineRegular() => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.kBlackColor,
    decoration: TextDecoration.underline,
  );
  static TextStyle kPlaceHolder14Regular() => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.kPlaceHolderColor,
  );
  static TextStyle kBlue12SemiBold() => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kPrimaryColor,
  );
  static TextStyle k16Medium() =>
      GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle kGrey12Regular() => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.kGreyColor,
  );
}
