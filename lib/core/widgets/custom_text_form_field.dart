import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.hint,
    required this.label,
    required this.controller,
    this.autovalidateMode,
    super.key,
    this.isPassword = false,
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
  });
  final String hint;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Function()? onEditingComplete;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword!,
      cursorColor: AppColors.kBlackColor,
      controller: controller,
      validator: validator,
      autocorrect: false,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(hintText: hint, labelText: label),
    );
  }
}
