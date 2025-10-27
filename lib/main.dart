import 'package:exam_app/forget_password/presentation/views/forget_password_views.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Exam App',
        home: ForgetPasswordViews()
    );
  }
}
