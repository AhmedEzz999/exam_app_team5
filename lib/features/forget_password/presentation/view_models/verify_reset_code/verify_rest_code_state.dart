part of 'verify_rest_code_cubit.dart';

sealed class VerifyRestCodeState {
  const VerifyRestCodeState();
}

final class VerifyRestCodeInitialState extends VerifyRestCodeState {}

final class VerifyRestCodeLoadingState extends VerifyRestCodeState {}

final class VerifyRestCodeErrorState extends VerifyRestCodeState {
  final String error;

  const VerifyRestCodeErrorState({required this.error});
}

final class VerifyRestCodeSuccessState extends VerifyRestCodeState {}
