part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  const LoginState();
}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginEntity loginEntity;
  const LoginSuccessState({required this.loginEntity});
}

final class LoginErrorState extends LoginState {
  final String error;

  const LoginErrorState({required this.error});
}
