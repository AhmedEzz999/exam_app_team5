import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_password_field.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'signup_button.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({super.key});

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> with AppValidators {
  final GlobalKey<FormState> _signupFormKey = GlobalKey();

  late TextEditingController _usernameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneNumberController;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signupFormKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextfield(
            hint: AppStrings.usernameHint,
            label: AppStrings.usernameLabel,
            controller: _usernameController,
            validator: validateUserName,
            autovalidateMode: _autovalidateMode,
          ),
          16.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomTextfield(
                  hint: AppStrings.firstNameHint,
                  label: AppStrings.firstNameLabel,
                  controller: _firstNameController,
                  validator: validateFirstName,
                  autovalidateMode: _autovalidateMode,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomTextfield(
                  hint: AppStrings.lastNameHint,
                  label: AppStrings.lastNameLabel,
                  controller: _lastNameController,
                  validator: validateLastName,
                  autovalidateMode: _autovalidateMode,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          CustomTextfield(
            hint: AppStrings.emailHint,
            label: AppStrings.emailLabel,
            controller: _emailController,
            validator: validateEmail,
            autovalidateMode: _autovalidateMode,
          ),
          16.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomPasswordField(
                  hint: AppStrings.passwordHint,
                  label: AppStrings.passwordLabel,
                  controller: _passwordController,
                  isConfirm: false,
                  autovalidateMode: _autovalidateMode,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomPasswordField(
                  hint: AppStrings.confirmPasswordHint,
                  label: AppStrings.confirmPasswordLabel,
                  controller: _confirmPasswordController,
                  isConfirm: true,
                  compareWith: _passwordController,
                  autovalidateMode: _autovalidateMode,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          CustomTextfield(
            hint: AppStrings.phoneNumberHint,
            label: AppStrings.phoneNumberLabel,
            controller: _phoneNumberController,
            validator: validatePhoneNumber,
            autovalidateMode: _autovalidateMode,
            textInputAction: TextInputAction.done,
          ),
          42.verticalSpace,
          SignupButton(
            signupFormKey: _signupFormKey,
            onAutovalidateModeChanged: (mode) {
              setState(() {
                _autovalidateMode = mode;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
