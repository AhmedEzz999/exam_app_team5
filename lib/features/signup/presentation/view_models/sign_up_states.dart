part of 'sign_up_cubit.dart';

sealed class SignupState {}

final class SignUpInitial extends SignupState {}

final class SignUpLoading extends SignupState {}

final class SignUpSuccess extends SignupState {
  SignUpSuccess({required this.signUpEntity});
  final SignUpEntity signUpEntity;
}

final class SignUpFailure extends SignupState {
  SignUpFailure({required this.errorMessage});
  final String errorMessage;
}
