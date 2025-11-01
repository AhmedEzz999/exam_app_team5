import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/widgets/custom_password_field.dart';

class SignUpPasswordRow extends StatelessWidget {
  const SignUpPasswordRow({
    required this.passwordController,
    required this.confirmPasswordController,
    super.key,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomPasswordField(
            hint: AppStrings.passwordHint,
            label: AppStrings.passwordLabel,
            controller: passwordController,
            isConfirm: false,
            isLogin: false,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: CustomPasswordField(
            hint: AppStrings.confirmPasswordHint,
            label: AppStrings.confirmPasswordLabel,
            controller: confirmPasswordController,
            isLogin: false,
            isConfirm: true,
            compareWith: passwordController,
          ),
        ),
      ],
    );
  }
}
