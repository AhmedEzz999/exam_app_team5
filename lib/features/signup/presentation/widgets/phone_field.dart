import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({required this.controller, super.key});
  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.phoneLabel,
      );
    }
    if (!RegExp(r'^\d{11}').hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.phoneLabel.toLowerCase(),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: AppStrings.phoneLabel,
        hintText: AppStrings.phoneHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: _validator,
      textInputAction: TextInputAction.done,
    );
  }
}
