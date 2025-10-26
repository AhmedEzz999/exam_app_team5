import 'package:flutter/material.dart';

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
      height: 48,
      child: ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
    );
  }
}
