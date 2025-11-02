sealed class VerifyResetCodeEvent {
  const VerifyResetCodeEvent();
}

class VerifyResetCode extends VerifyResetCodeEvent {
  final String code;

  const VerifyResetCode({required this.code});
}
