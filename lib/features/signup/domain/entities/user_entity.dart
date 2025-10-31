class UserEntity {
  factory UserEntity.fromMap(Map<String, dynamic> data) => UserEntity(
    username: data['username'].toString(),
    firstName: data['firstName'].toString(),
    lastName: data['lastName'].toString(),
    email: data['email'].toString(),
    password: data['password'].toString(),
    rePassword: data['rePassword'].toString(),
    phone: data['phone'].toString(),
  );

  UserEntity({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  Map<String, dynamic> toMap() => {
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'rePassword': rePassword,
    'phone': phone,
  };
}
