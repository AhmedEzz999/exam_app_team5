import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationWidget extends StatelessWidget {
  const VerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 68,
      decoration: BoxDecoration(
        color: Color(0xffDFE7F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,

        ],
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Color(0xff0F0F0F),
        ),
      ),
    );
  }
}
