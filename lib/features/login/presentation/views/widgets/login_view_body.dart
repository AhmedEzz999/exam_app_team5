import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_routes/app_routes.dart';
import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../view_models/cubit/login_cubit.dart';
import '../../view_models/cubit/login_events.dart';
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

  void _validateSignInForm() {
    final bool isValid = _globalKey.currentState?.validate() ?? false;

    if (isValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isValid;
      });
    }
  }

  void _submitLogin() {
    context.read<LoginCubit>().doIntent(
      Login(email: _emailController.text, password: _passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          onChanged: _validateSignInForm,
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              16.verticalSpace,
              CustomTextfield(
                hint: AppStrings.emailHint,
                label: AppStrings.emailLabel,
                controller: _emailController,
                validator: validateEmail,
              ),
              24.verticalSpace,
              CustomPasswordField(
                hint: AppStrings.passwordHint,
                label: AppStrings.passwordLabel,
                controller: _passwordController,
                isConfirm: false,
              ),
              6.verticalSpace,
              const CustomRememberAndForget(),
              32.verticalSpace,
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
                          widget: const Text(AppStrings.loginButton),
                          onPressed: _isButtonEnabled ? _submitLogin : null,
                        );
                },
              ),
              16.verticalSpace,
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.dontHaveAccount,
                        style: AppTextStyles.kBlack16Regular(),
                      ),
                      TextSpan(
                        text: AppStrings.signUpButton,
                        style: AppTextStyles.kBlack12UnderLineRegular()
                            .copyWith(
                              color: AppColors.kPrimaryColor,
                              fontSize: 16.sp,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go(AppRoutes.signUpRoute);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
