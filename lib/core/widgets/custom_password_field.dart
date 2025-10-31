import 'package:flutter/material.dart';

import '../constants/app_strings/app_strings.dart';
import '../styles/app_colors.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    required this.hint,
    required this.label,
    required this.controller,
    required this.isConfirm,
    this.compareWith,
    this.textInputAction,
    super.key,
  });

  final String hint;
  final String label;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final bool isConfirm;
  final TextEditingController? compareWith;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      cursorColor: AppColors.kBlackColor,
      controller: controller,
      validator: _validatePassword,
      autocorrect: false,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(hintText: hint, labelText: label),
    );
  }

  String? _validatePassword(value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        label.toLowerCase(),
      );
    }
    if (!isConfirm && value.length < 8) return AppStrings.passwordMin;
    if (isConfirm && value != compareWith?.text) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }
}
