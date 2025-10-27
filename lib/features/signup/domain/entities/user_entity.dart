class UserEntity {
  factory UserEntity.fromMap(Map<String, dynamic> data) => UserEntity(
    username: data['username']?.toString(),
    firstName: data['firstName']?.toString(),
    lastName: data['lastName']?.toString(),
    email: data['email']?.toString(),
    password: data['password']?.toString(),
    rePassword: data['rePassword']?.toString(),
    phone: data['phone']?.toString(),
  );

  UserEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  Map<String, dynamic> toMap() => {
    if (username != null) 'username': username,
    if (firstName != null) 'firstName': firstName,
    if (lastName != null) 'lastName': lastName,
    if (email != null) 'email': email,
    if (password != null) 'password': password,
    if (rePassword != null) 'rePassword': rePassword,
    if (phone != null) 'phone': phone,
  };
  @override
  String toString() {
    return 'User(username: $username, firstName: $firstName, lastName: $lastName, email: $email, password: $password, rePassword: $rePassword, phone: $phone)';
  }
}
