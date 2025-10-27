import 'package:flutter/material.dart';

import '../views/verification_code_views.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 48),
        backgroundColor: Color(0xff02369C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCodeViews()));
        },
        child: Text('Continue',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xffF9F9F9),
          ),
        )
    );
  }
}
