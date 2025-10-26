import 'package:flutter/material.dart';

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
          borderRadius: BorderRadiusGeometry.circular(2),
        ),
        side: const BorderSide(color: AppColors.kGreyColor, width: 2),
        onChanged: (v) {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
      title: Text('Remember me', style: AppTextStyles.kBlack13Regular()),
      trailing: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          'Forget password?',
          style: AppTextStyles.kBlack12UnderLineRegular(),
        ),
      ),
    );
  }
}
