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
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../view_models/cubit/login_cubit.dart';
import '../../view_models/cubit/login_events.dart';
import 'login_button.dart';
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
  bool _isButtonEnabled = true;
  bool _hasPressedButton = false;

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
    final bool isFormValid = _globalKey.currentState?.validate() ?? false;

    if (isFormValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isFormValid;
      });
    }
  }

  void _submitLogin() {
    final bool isFormValid = _globalKey.currentState?.validate() ?? false;

    setState(() {
      _hasPressedButton = true;
    });

    if (isFormValid) {
      context.read<LoginCubit>().doIntent(
        Login(email: _emailController.text, password: _passwordController.text),
      );
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          onChanged: _hasPressedButton ? _validateSignInForm : null,
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
              CustomTextfield.password(
                hint: AppStrings.passwordHint,
                label: AppStrings.passwordLabel,
                controller: _passwordController,
                validator: validatePassword,
                textInputAction: TextInputAction.done,
              ),
              6.verticalSpace,
              const CustomRememberAndForget(),
              32.verticalSpace,
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    customSnackBar(context, message: AppStrings.signInSuccess);
                    context.go(AppRoutes.homeRoute);
                  }
                  if (state is LoginErrorState) {
                    customSnackBar(context, message: state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return LoginButton(
                    enabled: _isButtonEnabled,
                    onPressed: _submitLogin,
                    isLoading: state is LoginLoadingState,
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
