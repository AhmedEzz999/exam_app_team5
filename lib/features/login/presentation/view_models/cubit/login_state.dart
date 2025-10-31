part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  const LoginState();
}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  const LoginSuccessState({required this.loginEntity});
  final LoginEntity loginEntity;
}

final class LoginErrorState extends LoginState {
  const LoginErrorState({required this.errorMessage});
  final String errorMessage;
}
