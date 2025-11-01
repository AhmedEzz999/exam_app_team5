import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response.g.dart';

@JsonSerializable()
class VerifyResetCodeResponse {
  String? message;
  int? code;

  VerifyResetCodeResponse({this.message, this.code});

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseToJson(this);
}
