import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({required this.controller, super.key});
  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.usernameLabel,
      );
    }
    if (value.trim().length < 3) {
      return AppStrings.usernameMin;
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.usernameLabel,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: AppStrings.usernameLabel,
        hintText: AppStrings.usernameHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
        ),
      ),
      validator: _validator,
      textInputAction: TextInputAction.next,
    );
  }
}
