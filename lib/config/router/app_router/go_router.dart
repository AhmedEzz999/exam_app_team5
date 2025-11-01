import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes/app_routes.dart';
import '../../../core/constants/app_strings/app_strings.dart';
import '../../../features/home_layout/presentation/views/home_layout_view.dart';
import '../../../features/login/presentation/views/login_view.dart';
import '../../../features/signup/presentation/views/sign_up_view.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.signInRoute,
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text(AppStrings.errorNavigate))),
    routes: [
      GoRoute(
        path: AppRoutes.signInRoute,
        name: AppRoutes.signInRoute,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.signUpRoute,
        name: AppRoutes.signUpRoute,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.homeRoute,
        name: AppRoutes.homeRoute,
        builder: (context, state) => const HomeLayoutView(),
      ),
    ],
  );
}
