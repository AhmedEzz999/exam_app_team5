import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class SignupButton extends StatefulWidget {
  const SignupButton({
    required this.signupFormKey,
    required this.onAutovalidateModeChanged,
    super.key,
  });
  final GlobalKey<FormState> signupFormKey;
  final ValueChanged<AutovalidateMode> onAutovalidateModeChanged;

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  final ValueNotifier<Color> _signupButtonColor = ValueNotifier(
    AppColors.primaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ValueListenableBuilder<Color>(
        valueListenable: _signupButtonColor,
        builder: (context, color, child) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            onPressed: () {
              final formState = widget.signupFormKey.currentState;
              if (formState != null && formState.validate()) {
                _signupButtonColor.value = AppColors.primaryColor;
              } else {
                widget.onAutovalidateModeChanged(AutovalidateMode.always);
                _signupButtonColor.value = AppColors.disabledButtonColor;
              }
            },
            child: const Text(
              AppStrings.signupButton,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _signupButtonColor.dispose();
    super.dispose();
  }
}
