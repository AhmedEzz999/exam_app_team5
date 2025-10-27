import 'package:flutter/material.dart';

import '../widgets/verification_widget.dart';

class VerificationCodeViews extends StatelessWidget {
  const VerificationCodeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('Password',
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          children: [
            Text('Email verification',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff0F0F0F),
              ),),
            Text('Please enter your code that send to your \n email address',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff535353),
              ),
            ),
            Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                VerificationWidget(),
                VerificationWidget(),
                VerificationWidget(),
                VerificationWidget(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive code?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff0F0F0F),
                ),),
                Text(' Resend',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff02369C),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff02369C),
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
