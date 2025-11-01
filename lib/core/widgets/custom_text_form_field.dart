import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.hint,
    required this.label,
    required this.controller,
    this.autovalidateMode,
    super.key,
    this.isPassword = false,
    this.isValid = true,
    this.validator,
    this.onEditingComplete,
  });
  const CustomTextfield.password({
    required this.hint,
    required this.label,
    required this.controller,
    this.isPassword = true,
    this.autovalidateMode,
    super.key,
    this.validator,
    this.onEditingComplete,
    this.isValid = true,
  });
  final String hint;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Function()? onEditingComplete;
  final bool? isPassword;
  final bool? isValid;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword!,
      cursorColor: AppColors.kBlackColor,
      controller: controller,
      validator: validator,
      autocorrect: false,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle: isValid!
            ? AppTextStyles.kGrey12Regular()
            : AppTextStyles.kGrey12Regular().copyWith(
                color: AppColors.kRedErrorColor,
              ),
      ),
    );
  }
}
