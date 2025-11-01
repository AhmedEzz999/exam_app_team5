part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState {
  const ForgetPasswordState();
}

final class ForgetPasswordInitialState extends ForgetPasswordState {}

final class ForgetPasswordLoadingState extends ForgetPasswordState {}

final class ForgetPasswordSuccessState extends ForgetPasswordState {}

final class ForgetPasswordErrorState extends ForgetPasswordState {
  final String error;

  const ForgetPasswordErrorState({required this.error});
}
