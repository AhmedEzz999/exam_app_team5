import 'package:flutter/material.dart';

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
    if (value == null || value.isEmpty) return '$label is required';
    if (!isConfirm && value.length < 8) return 'Password min 8 chars';
    if (isConfirm && value != compareWith?.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: isConfirm ? 'Confirm password' : 'Enter password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      obscureText: true,
      validator: _validator,
      textInputAction: TextInputAction.next,
    );
  }
}
