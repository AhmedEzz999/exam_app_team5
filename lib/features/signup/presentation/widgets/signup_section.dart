import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_validators.dart';
import 'signup_button.dart';
import 'signup_fields.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({super.key});

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> with AppValidators {
  final GlobalKey<FormState> _signupFormKey = GlobalKey();

  late final TextEditingController _usernameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _phoneNumberController;

  bool _isButtonEnabled = true;
  bool _hasPressedButton = false;

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
      // context.read<SignUpCubit>().login(
      // email: _emailController.text,
      // password: _passwordController.text,
      // );
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signupFormKey,
      onChanged: _hasPressedButton ? _validateSignUpForm : null,
      child: Column(
        children: [
          SignupFields(
            usernameController: _usernameController,
            firstNameController: _firstNameController,
            lastNameController: _lastNameController,
            emailController: _emailController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            phoneNumberController: _phoneNumberController,
            validators: this,
          ),
          42.verticalSpace,
          SignupButton(enabled: _isButtonEnabled, onPressed: _submitSignUp),
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
