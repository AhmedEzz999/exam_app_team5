import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'sign_up_name_row.dart';
import 'sign_up_password_row.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
    required this.validators,
    super.key,
  });

  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;
  final AppValidators validators;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextfield(
          hint: AppStrings.usernameHint,
          label: AppStrings.usernameLabel,
          controller: usernameController,
          validator: validators.validateUserName,
        ),
        16.verticalSpace,
        SignUpNameRow(
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          validators: validators,
        ),
        16.verticalSpace,
        CustomTextfield(
          hint: AppStrings.emailHint,
          label: AppStrings.emailLabel,
          controller: emailController,
          validator: validators.validateEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        16.verticalSpace,
        SignUpPasswordRow(
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
        ),
        16.verticalSpace,
        CustomTextfield(
          hint: AppStrings.phoneNumberHint,
          label: AppStrings.phoneNumberLabel,
          controller: phoneNumberController,
          validator: validators.validatePhoneNumber,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
