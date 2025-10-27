import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/user_entity.dart';
import 'user.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  SignUpResponse({this.message, this.token, this.user});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
  String? message;
  String? token;
  User? user;

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

  UserEntity toEntity() {
    return UserEntity(token: token ?? '', userId: user?.id ?? '');
  }
}
