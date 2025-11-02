import 'package:exam_app/core/constants/app_routes/app_routes.dart';
import 'package:exam_app/core/constants/app_strings/app_strings.dart';
import 'package:exam_app/core/utils/validator.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_form_field.dart';
import 'package:exam_app/features/forget_password/presentation/view_models/reset_password/reset_password_cubit.dart';
import 'package:exam_app/features/forget_password/presentation/view_models/reset_password/reset_password_event.dart';
import 'package:exam_app/features/forget_password/presentation/views/widgets/custom_forget_password_info_sectio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.email});
  final String email;
  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody>
    with AppValidators {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late GlobalKey<FormState> _key;
  bool _isButtonEnabled = false;
  @override
  void initState() {
    _key = GlobalKey<FormState>();
    _confirmPasswordController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final bool isValid = _key.currentState?.validate() ?? false;

    if (isValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isValid;
      });
    }
  }

  void _submitResetPassword() {
    context.read<ResetPasswordCubit>().doIntent(
      ResetPasswordEvent(
        email: widget.email,
        newPassword: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Form(
        onChanged: _validateForm,
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomForgetPasswordInfoSection(
              title: AppStrings.resetPassword,
              subTitle: AppStrings.resetPasswordDesc,
            ),
            CustomTextfield(
              hint: AppStrings.passwordHint,
              label: AppStrings.passwordLabel,
              controller: _passwordController,
              validator: validateSignUpPassword,
            ),
            24.verticalSpace,
            CustomTextfield(
              hint: AppStrings.confirmPasswordHint,
              label: AppStrings.confirmPasswordLabel,
              controller: _confirmPasswordController,
              validator: (value) => validateConfirmPassword(
                _passwordController.text,
                _confirmPasswordController.text,
              ),
            ),
            48.verticalSpace,
            BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccessState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.token)));
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.singInRoute);
                }
                if (state is ResetPasswordErrorState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                return state is ResetPasswordLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : CustomElevatedButton(
                        buttonText: AppStrings.continueLabel,
                        onPressed: _isButtonEnabled
                            ? _submitResetPassword
                            : null,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
