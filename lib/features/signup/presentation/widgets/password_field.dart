import 'package:flutter/material.dart';

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
    if (value == null || value.isEmpty) return AppStrings.fieldRequired.replaceFirst('{field}', AppStrings.passwordLabel);
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
      decoration: InputDecoration(
        labelText: label,
        hintText: isConfirm
            ? AppStrings.confirmPasswordHint
            : AppStrings.passwordHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
        ),
      ),
      obscureText: true,
      validator: _validator,
      textInputAction: TextInputAction.next,
    );
  }
}
