import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';

class CustomRememberAndForget extends StatefulWidget {
  const CustomRememberAndForget({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<CustomRememberAndForget> createState() =>
      _CustomRememberAndForgetState();
}

class _CustomRememberAndForgetState extends State<CustomRememberAndForget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      isThreeLine: false,
      contentPadding: EdgeInsets.zero,
      leading: Checkbox(
        activeColor: AppColors.kPrimaryColor,
        value: isSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(2.r),
        ),
        side: BorderSide(color: AppColors.kGreyColor, width: 2.w),
        onChanged: (value) {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
      title: Text(
        AppStrings.rememberMe,
        style: AppTextStyles.kBlack13Regular(),
      ),
      trailing: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          AppStrings.forgetPassword,
          style: AppTextStyles.kBlack12UnderLineRegular(),
        ),
      ),
    );
  }
}
