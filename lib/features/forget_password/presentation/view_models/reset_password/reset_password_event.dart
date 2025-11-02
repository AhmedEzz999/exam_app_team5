sealed class ResetPasswordEvents {
  const ResetPasswordEvents();
}

class ResetPasswordEvent extends ResetPasswordEvents {
  final String email;
  final String newPassword;

  const ResetPasswordEvent({required this.email, required this.newPassword});
}
