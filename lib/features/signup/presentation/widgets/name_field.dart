import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class NameField extends StatelessWidget {
  const NameField({required this.label, required this.controller, super.key});
  final String label;
  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.fieldRequired.replaceFirst('{field}', label);
    }
    if (value.trim().length < 3) {
      return AppStrings.nameShort.replaceFirst('{field}', label);
    }
    if (!RegExp(r"^[a-zA-Z'-]+").hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst('{field}', label);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: label == AppStrings.firstNameLabel
            ? AppStrings.firstNameHint
            : (label == AppStrings.lastNameLabel
                  ? AppStrings.lastNameHint
                  : 'Enter $label'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
        ),
      ),
      validator: _validator,
      textInputAction: TextInputAction.next,
    );
  }
}
