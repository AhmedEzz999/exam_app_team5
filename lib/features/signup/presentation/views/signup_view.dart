import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/app_colors.dart';
import '../widgets/signup_section.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          style: IconButton.styleFrom(padding: EdgeInsets.only(left: 16.w)),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          iconSize: 24.w,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppStrings.signupTitle,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              6.horizontalSpace,
              const SignupSection(),
              6.horizontalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                    ),
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.kPrimaryColor,
                            width: 1.5.w,
                          ),
                        ),
                      ),
                      child: Text(
                        AppStrings.loginButton,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.kPrimaryColor,
                        ),
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
