import 'package:exam_app/config/router/app_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/themes/themes.dart';
import 'features/login/presentation/views/login_view.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp.router(
        routerConfig: AppRouter.goRouter,
        theme: Themes.light(),
        darkTheme: Themes.dark(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
