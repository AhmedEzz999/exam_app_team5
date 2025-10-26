import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/di/di.dart';
import '../view_models/cubit/login_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider<LoginCubit>(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginViewBody(),
      ),
    );
  }
}
