import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../view_models/cubit/login_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_routes/app_routes.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../core/widgets/custom_fixed_clickable_text_widget.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_toast_widget.dart';
import '../../view_models/cubit/login_cubit.dart';
import 'remember_and_forget_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody>
    with AppValidators, ShowToasts {
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        onChanged: _hasPressedButton ? _validateSignInForm : null,

        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            CustomTextfield(
              hint: AppStrings.emailHint,
              label: AppStrings.emailLabel,
              validator: validateEmail,
              controller: _emailController,
            ),
            24.verticalSpace,
            CustomTextfield.password(
              hint: AppStrings.passwordHint,
              label: AppStrings.passwordLabel,
              validator: validatePassword,
              controller: _passwordController,
            ),
            12.verticalSpace,
            CustomRememberAndForget(
              onPressed: () => context.pushNamed(AppRoutes.forgetPasswordRoute),
            ),
            32.verticalSpace,
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  successToast(context, title: AppStrings.loginSuccessToast);
                  context.goNamed(AppRoutes.homeRoute);
                }
                if (state is LoginErrorState) {
                  errorToast(context, title: state.errorMessage);
                }
              },
              builder: (context, state) {
                return state is LoginLoadingState
                    ? const CustomLoadingWidget()
                    : CustomElevatedButton(
                        widget: Text(
                          AppStrings.loginButton,
                          style: AppTextStyles.kBlack18Mediam(),
                        ),
                        onPressed: _isButtonEnabled ? _submitLogin : null,
                      );
              },
            ),
            16.verticalSpace,
            Center(
              child: CustomFixedTextAndClickableText(
                fixedText: AppStrings.dontHaveAccount,
                clickableText: AppStrings.signUpButton,
                onTap: () {
                  context.pushNamed(AppRoutes.signUpRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
