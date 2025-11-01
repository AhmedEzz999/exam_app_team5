import 'package:exam_app/core/constants/app_strings/app_strings.dart';
import 'package:exam_app/core/styles/app_text_styles.dart';
import 'package:exam_app/core/utils/validator.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_form_field.dart';
import 'package:exam_app/features/forget_password/presentation/view_models/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_models/forget_password/forget_password_events.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody>
    with AppValidators {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _globalKey;
  bool _isButtonEnabled = false;
  @override
  void initState() {
    _emailController = TextEditingController();
    _globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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

  void _submitForgetPassword() {
    context.read<ForgetPasswordCubit>().doIntety(
      ForgetPassword(_emailController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: _validateForm,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            40.verticalSpace,
            Center(
              child: Text(
                AppStrings.forgetPassword,
                style: AppTextStyles.kBlack18Mediam(),
              ),
            ),
            16.verticalSpace,
            Center(
              child: SizedBox(
                width: 275.w,
                child: Text(
                  AppStrings.forgetPasswordDesc,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.kGrey14Regular(),
                ),
              ),
            ),
            24.verticalSpace,
            CustomTextfield(
              hint: AppStrings.emailHint,
              label: AppStrings.emailLabel,
              controller: _emailController,
              validator: validateEmail,
              isValid: _globalKey.currentState?.validate() ?? false,
            ),
            48.verticalSpace,
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (BuildContext context, state) {
                if (state is ForgetPasswordLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return CustomElevatedButton(
                    buttonText: AppStrings.continueLabel,
                    onPressed: _isButtonEnabled ? _submitForgetPassword : null,
                  );
                }
              },
              listener: (BuildContext context, state) {
                if (state is ForgetPasswordErrorState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
                if (state is ForgetPasswordSuccessState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Success')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
