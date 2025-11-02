import '../../../../../core/constants/app_routes/app_routes.dart';
import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../core/widgets/custom_toast_widget.dart';
import '../../view_models/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../view_models/forget_password/forget_password_events.dart';
import 'custom_forget_password_info_sectio.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody>
    with AppValidators, ShowToasts {
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
      onChanged: _validateForm,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomForgetPasswordInfoSection(
              title: AppStrings.forgetPassword,
              subTitle: AppStrings.forgetPasswordDesc,
            ),
            CustomTextfield(
              hint: AppStrings.emailHint,
              label: AppStrings.emailLabel,
              controller: _emailController,
              validator: validateEmail,
            ),
            48.verticalSpace,
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                if (state is ForgetPasswordLoadingState) {
                  return const CustomLoadingWidget();
                } else {
                  return CustomElevatedButton(
                    widget: const Text(AppStrings.forgetPassword),
                    onPressed: _isButtonEnabled ? _submitForgetPassword : null,
                  );
                }
              },
              listener: (context, state) {
                if (state is ForgetPasswordErrorState) {
                  errorToast(context, title: state.error);
                }
                if (state is ForgetPasswordSuccessState) {
                  successToast(context, title: AppStrings.otpSuccessToast);
                  GoRouter.of(context).pushNamed(
                    AppRoutes.verifyResetCodeRoute,
                    extra: state.email,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
