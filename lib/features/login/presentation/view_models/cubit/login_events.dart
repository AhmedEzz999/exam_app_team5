sealed class LoginEvents {}

class Login extends LoginEvents {
  final String email;
  final String password;

  Login({required this.email, required this.password});
}
