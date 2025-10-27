import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_password_field.dart';
import '../../../../core/widgets/custom_text_field.dart';

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

  bool _isButtonEnabled = true;
  bool _hasPressedButton = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _hasPressedButton ? _validateSignUpForm : null,
      key: _signupFormKey,
      child: Column(
        children: [
          CustomTextfield(
            hint: AppStrings.usernameHint,
            label: AppStrings.usernameLabel,
            controller: _usernameController,
            validator: validateUserName,
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
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomTextfield(
                  hint: AppStrings.lastNameHint,
                  label: AppStrings.lastNameLabel,
                  controller: _lastNameController,
                  validator: validateLastName,
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
            keyboardType: TextInputType.emailAddress,
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
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
          ),
          42.verticalSpace,
          CustomElevatedButton(
            buttonText: AppStrings.signupButton,
            onPressed: _isButtonEnabled ? _submitSignUp : null,
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

  void _validateSignUpForm() {
    final bool isFormValid = _signupFormKey.currentState?.validate() ?? false;

    if (isFormValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isFormValid;
      });
    }
  }

  void _submitSignUp() {
    final bool isFormValid = _signupFormKey.currentState?.validate() ?? false;

    setState(() {
      _hasPressedButton = true;
    });

    if (isFormValid) {
      // context.read<LoginCubit>().login(
      //   email: _emailController.text,
      //   password: _passwordController.text,
      // );
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }
}
