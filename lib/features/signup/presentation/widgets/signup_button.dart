import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/app_colors.dart';

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
    AppColors.kPrimaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ValueListenableBuilder<Color>(
        valueListenable: _signupButtonColor,
        builder: (context, color, child) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.r),
              ),
            ),
            onPressed: () {
              final formState = widget.signupFormKey.currentState;
              if (formState != null && formState.validate()) {
                _signupButtonColor.value = AppColors.kPrimaryColor;
              } else {
                widget.onAutovalidateModeChanged(AutovalidateMode.always);
                _signupButtonColor.value = AppColors.kDisabledButtonColor;
              }
            },
            child: Text(
              AppStrings.signupButton,
              style: TextStyle(
                fontSize: 16.sp,
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
