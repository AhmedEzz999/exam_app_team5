import 'package:exam_app/core/constants/app_routes/app_routes.dart';
import 'package:exam_app/features/forget_password/presentation/views/reset_password_view.dart';
import 'package:exam_app/features/home_layout/presentation/views/home_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings/app_strings.dart';
import '../../../features/forget_password/presentation/views/forget_password_view.dart';
import '../../../features/forget_password/presentation/views/verify_reset_code_view.dart';
import '../../../features/login/presentation/views/login_view.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.singInRoute,

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(AppStrings.errorNavigate))),
    routes: [
      GoRoute(
        path: AppRoutes.singInRoute,
        name: AppRoutes.singInRoute,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: AppRoutes.homeRoute,
        name: AppRoutes.homeRoute,
        builder: (context, state) => HomeLayoutView(),
      ),
      GoRoute(
        path: AppRoutes.forgetPasswordRoute,
        name: AppRoutes.forgetPasswordRoute,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.verifyResetCodeRoute,
        name: AppRoutes.verifyResetCodeRoute,

        builder: (context, state) {
          String email = state.extra as String;
          return VerifyResetCodeView(email: email);
        },
      ),
      GoRoute(
        path: AppRoutes.resetPasswordRoute,
        name: AppRoutes.resetPasswordRoute,
        builder: (context, state) {
          final String email = state.extra as String;
          return ResetPasswordView(email: email);
        },
      ),
    ],
  );
}
