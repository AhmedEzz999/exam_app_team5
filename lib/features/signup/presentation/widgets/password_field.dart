import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.controller,
    required this.label,
    super.key,
    this.isConfirm = false,
    this.compareWith,
  });
  final TextEditingController controller;
  final TextEditingController? compareWith;
  final String label;
  final bool isConfirm;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.passwordLabel,
      );
    }
    if (!isConfirm && value.length < 8) return AppStrings.passwordMin;
    if (isConfirm && value != compareWith?.text) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      validator: _validator,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: 16.sp, color: AppColors.primaryTextColor),
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.hintTextColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
        labelText: label,
        hintText: isConfirm
            ? AppStrings.confirmPasswordHint
            : AppStrings.passwordHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.5.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorBorderColor,
            width: 1.5.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorBorderColor,
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
