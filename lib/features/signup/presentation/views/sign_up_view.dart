import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../view_models/signup_cubit/sign_up_cubit.dart';
import '../widgets/sign_up_section.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: IconButton.styleFrom(padding: EdgeInsets.only(left: 16.w)),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          iconSize: 24.w,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(AppStrings.signUpTitle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              6.verticalSpace,
              BlocProvider(
                create: (context) => SignUpCubit(),
                child: const SignUpSection(),
              ),
              6.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: AppTextStyles.kBlack16Regular(),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppStrings.loginButton,
                      style: AppTextStyles.kBlack12UnderLineRegular().copyWith(
                        fontSize: 16.sp,
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
