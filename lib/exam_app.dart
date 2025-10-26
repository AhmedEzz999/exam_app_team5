import 'package:flutter/material.dart';

import 'core/themes/themes.dart';
import 'features/login/presentation/views/login_view.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      theme: Themes.light(),
      darkTheme: Themes.dark(),
      themeMode: ThemeMode.light,
    );
  }
}
