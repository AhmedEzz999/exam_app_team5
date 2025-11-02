part of 'reset_password_cubit.dart';

sealed class ResetPasswordState {
  const ResetPasswordState();
}

final class ResetPasswordInitialState extends ResetPasswordState {}

final class ResetPasswordLoadingState extends ResetPasswordState {}

final class ResetPasswordErrorState extends ResetPasswordState {
  final String error;

  const ResetPasswordErrorState({required this.error});
}

final class ResetPasswordSuccessState extends ResetPasswordState {
  final String token;
  const ResetPasswordSuccessState(this.token);
}
