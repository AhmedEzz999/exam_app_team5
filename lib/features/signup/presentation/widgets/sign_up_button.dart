import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    required this.enabled,
    required this.onPressed,
    super.key,
  });

  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      buttonText: AppStrings.signUpButton,
      onPressed: enabled ? onPressed : null,
    );
  }
}
