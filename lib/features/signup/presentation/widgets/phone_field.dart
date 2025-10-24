import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({required this.controller, super.key});
  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) return 'Phone is required';
    if (!RegExp(r'^\d{10,}').hasMatch(value)) {
      return 'This phone number is not valid';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Phone number',
        hintText: 'Enter phone number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: _validator,
      textInputAction: TextInputAction.done,
    );
  }
}
