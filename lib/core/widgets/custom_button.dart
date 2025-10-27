import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.buttonText,
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
    );
  }
}
