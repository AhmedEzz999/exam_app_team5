import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.hint,
    required this.label,
    required this.controller,
    required this.autovalidateMode,
    this.validator,
    this.textInputAction,
    super.key,
  });
  final String hint;
  final String label;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.kBlackColor,
      controller: controller,
      validator: validator,
      autocorrect: false,
      textInputAction: textInputAction ?? TextInputAction.next,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(hintText: hint, labelText: label),
    );
  }
}
