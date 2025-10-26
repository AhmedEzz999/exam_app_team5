import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class EmailField extends StatelessWidget {
  const EmailField({required this.controller, super.key});
  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.emailLabel,
      );
    }
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.emailLabel.toLowerCase(),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validator,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: 16.sp, color: AppColors.primaryTextColor),
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.hintTextColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
        labelText: AppStrings.emailLabel,
        hintText: AppStrings.emailHint,
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
