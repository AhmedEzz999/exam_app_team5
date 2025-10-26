import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../view_models/cubit/login_cubit.dart';
import 'remember_and_forget_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> with AppValidators {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _globalKey;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final bool isValid = _globalKey.currentState?.validate() ?? false;

    if (isValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isValid;
      });
    }
  }

  void _submitLogin() {
    context.read<LoginCubit>().login(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        onChanged: _validateForm,
        autovalidateMode: AutovalidateMode.disabled,
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            CustomTextfield(
              hint: 'Enter you email',
              label: 'Email',
              validator: validateEmail,
              controller: _emailController,
            ),
            const SizedBox(height: 24),
            CustomTextfield.password(
              hint: 'Enter you password ',
              label: 'Password',
              validator: validatePassword,
              controller: _passwordController,
            ),
            const SizedBox(height: 12),
            const CustomRememberAndForget(),
            const SizedBox(height: 32),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {}
                if (state is LoginErrorState) {}
              },
              builder: (context, state) {
                return state is LoginLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      )
                    : CustomElevatedButton(
                        buttonText: 'Login',
                        onPressed: _isButtonEnabled ? _submitLogin : null,
                      );
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: AppTextStyles.kBlack16Regular(),
                    ),
                    TextSpan(
                      text: 'sign up',
                      style: AppTextStyles.kBlack12UnderLineRegular().copyWith(
                        color: AppColors.kPrimaryColor,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
