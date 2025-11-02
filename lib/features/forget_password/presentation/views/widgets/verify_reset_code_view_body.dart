import 'package:exam_app/core/constants/app_strings/app_strings.dart';
import 'package:exam_app/core/styles/app_colors.dart';
import 'package:exam_app/core/styles/app_text_styles.dart';
import 'package:exam_app/features/forget_password/presentation/view_models/verify_reset_code/verify_reset_code_event.dart';
import 'package:exam_app/features/forget_password/presentation/view_models/verify_reset_code/verify_rest_code_cubit.dart';
import 'package:exam_app/features/forget_password/presentation/views/widgets/custom_forget_password_info_sectio.dart';
import 'package:exam_app/features/forget_password/presentation/views/widgets/pin_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/widgets/custom_fixed_clickable_text_widget.dart';

class VerifyResetCodeViewBody extends StatefulWidget {
  const VerifyResetCodeViewBody({super.key});

  @override
  State<VerifyResetCodeViewBody> createState() =>
      _VerifyResetCodeViewBodyState();
}

class _VerifyResetCodeViewBodyState extends State<VerifyResetCodeViewBody>
    with PinThemes {
  late TextEditingController _codeController;
  @override
  void initState() {
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyRestCodeCubit, VerifyRestCodeState>(
      listener: (context, state) {
        if (state is VerifyRestCodeSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Success")));
        }
        if (state is VerifyRestCodeErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                CustomForgetPasswordInfoSection(
                  title: AppStrings.emailVerification,
                  subTitle: AppStrings.emailVerificationDesc,
                ),
                BlocBuilder<VerifyRestCodeCubit, VerifyRestCodeState>(
                  builder: (context, state) {
                    return Pinput(
                      forceErrorState: state is VerifyRestCodeErrorState,
                      length: 6,
                      controller: _codeController,
                      onCompleted: (value) {
                        context.read<VerifyRestCodeCubit>().doIntent(
                          VerifyResetCode(code: _codeController.text),
                        );
                      },
                      errorPinTheme: defaultPinTheme,
                      errorBuilder: (errorText, pin) => Padding(
                        padding: EdgeInsets.only(top: 8.0.h),
                        child: Row(
                          children: [
                            Text(
                              AppStrings.invalidCode,
                              style: AppTextStyles.kBlack13Regular().copyWith(
                                color: AppColors.kRedErrorColor,
                              ),
                            ),
                            4.verticalSpace,
                            Icon(
                              Icons.info_outlined,
                              color: AppColors.kRedErrorColor,
                            ),
                          ],
                        ),
                      ),
                      errorText: AppStrings.invalidCode,
                      defaultPinTheme: errorPinTheme,
                    );
                  },
                ),
                24.verticalSpace,
                Center(
                  child: CustomFixedTextAndClickableText(
                    fixedText: AppStrings.didntReceiveCode,
                    clickableText: AppStrings.resent,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
