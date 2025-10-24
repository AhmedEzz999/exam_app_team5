import 'package:flutter/material.dart';

import '../widgets/email_field.dart';
import '../widgets/name_field.dart';
import '../widgets/password_field.dart';
import '../widgets/phone_field.dart';
import '../widgets/username_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneController;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _hasSubmitted = false;

  Color _getSignupButtonColor() {
    if (!_hasSubmitted) return const Color(0xFF02369C);
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      return const Color(0xFF02369C);
    }
    return const Color(0xFF878787);
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Sign up'),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                UsernameField(controller: _usernameController),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: NameField(
                        label: 'First name',
                        controller: _firstNameController,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: NameField(
                        label: 'Last name',
                        controller: _lastNameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                EmailField(controller: _emailController),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: PasswordField(
                        controller: _passwordController,
                        label: 'Password',
                        isConfirm: false,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: PasswordField(
                        controller: _confirmPasswordController,
                        label: 'Confirm password',
                        isConfirm: true,
                        compareWith: _passwordController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                PhoneField(controller: _phoneController),
                const SizedBox(height: 28),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getSignupButtonColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _hasSubmitted = true;
                        if (_formKey.currentState!.validate()) {
                          // Implement signup action
                        } else {
                          _autovalidateMode = AutovalidateMode.always;
                        }
                      });
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
