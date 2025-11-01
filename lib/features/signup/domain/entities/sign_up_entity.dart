class SignUpEntity {
  SignUpEntity({required this.token, required this.userId});

  final String token;
  final String userId;

  @override
  String toString() => 'SignUpEntity(token: $token, userId: $userId)';
}
