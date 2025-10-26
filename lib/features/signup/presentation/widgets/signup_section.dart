import 'package:flutter/material.dart';

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
          const SizedBox(height: 16),
          UsernameField(controller: _usernameController),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: NameField(
                  label: AppStrings.firstNameLabel,
                  controller: _firstNameController,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NameField(
                  label: AppStrings.lastNameLabel,
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          EmailField(controller: _emailController),
          const SizedBox(height: 24),
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
              const SizedBox(width: 12),
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
          const SizedBox(height: 24),
          PhoneField(controller: _phoneController),
          const SizedBox(height: 28),
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
