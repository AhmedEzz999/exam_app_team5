import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    required this.enabled,
    required this.onPressed,
    required this.isLoading,
    super.key,
  });
  final VoidCallback onPressed;
  final bool enabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      widget: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text(AppStrings.signUpButton),
      onPressed: enabled ? onPressed : null,
    );
  }
}
