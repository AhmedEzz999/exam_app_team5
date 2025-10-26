import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import 'email_field.dart';
import 'name_field.dart';
import 'password_field.dart';
import 'phone_field.dart';
import 'signup_button.dart';
import 'username_field.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({super.key});

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey();

  late TextEditingController _usernameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneController;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signupFormKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          UsernameField(controller: _usernameController),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: NameField(
                  label: AppStrings.firstNameLabel,
                  controller: _firstNameController,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: NameField(
                  label: AppStrings.lastNameLabel,
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          EmailField(controller: _emailController),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PasswordField(
                  controller: _passwordController,
                  label: AppStrings.passwordLabel,
                  isConfirm: false,
                ),
              ),
              SizedBox(width: 10.h),
              Expanded(
                child: PasswordField(
                  controller: _confirmPasswordController,
                  label: AppStrings.confirmPasswordLabel,
                  isConfirm: true,
                  compareWith: _passwordController,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          PhoneField(controller: _phoneController),
          SizedBox(height: 38.h),
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
}
