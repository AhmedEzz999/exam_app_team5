sealed class VerifyResetCodeEvent {
  const VerifyResetCodeEvent();
}

class VerifyResetCode extends VerifyResetCodeEvent {
  final String code;

  const VerifyResetCode({required this.code});
}

class ResentCode extends VerifyResetCodeEvent {
  final String email;

  ResentCode({required this.email});
}
