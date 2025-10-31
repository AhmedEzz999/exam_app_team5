import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/login_entity.dart';
import 'user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  String? token;
  User? user;

  LoginResponse({this.message, this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  LoginEntity toEntity() => LoginEntity(token: token, id: user?.id);
}
