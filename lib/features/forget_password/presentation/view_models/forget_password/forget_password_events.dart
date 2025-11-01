sealed class ForgetPasswordEvents {
  const ForgetPasswordEvents();
}

class ForgetPassword extends ForgetPasswordEvents {
  final String email;

  const ForgetPassword(this.email);
}
