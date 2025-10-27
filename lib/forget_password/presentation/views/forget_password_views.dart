import 'package:flutter/material.dart';

import '../widgets/elevated_button_widget.dart';
import '../widgets/email_field_widget.dart';

class ForgetPasswordViews extends StatelessWidget {
  const ForgetPasswordViews({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          spacing: 10,
          children: [
            Text('Forget password',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xff0F0F0F),
            ),),
            Text('Please enter your email associated to\n your account',
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff535353),
              ),
            ),
            EmailFieldWidget(controller: TextEditingController(),),
            SizedBox(height: 20),
            ElevatedButtonWidget(),
          ],
        ),
      ),

    );
  }
}
