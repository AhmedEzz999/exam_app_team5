import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({required this.label, required this.controller, super.key});
  final String label;
  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) return '$label is required';
    if (value.trim().length < 3) return '$label is too short';
    if (!RegExp(r"^[a-zA-Z'-]+$").hasMatch(value)) return 'Enter valid $label';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: label.toLowerCase() == 'first name'
            ? 'Enter first name'
            : (label.toLowerCase() == 'last name'
                  ? 'Enter last name'
                  : 'Enter $label'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: _validator,
      textInputAction: TextInputAction.next,
    );
  }
}
