import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    required this.enabled,
    required this.onPressed,
    super.key,
  });

  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      buttonText: AppStrings.signupButton,
      onPressed: enabled ? onPressed : null,
    );
  }
}
