import 'package:exam_app/core/constants/api_endpoints/api_keys.dart';
import 'package:exam_app/features/forget_password/api/api_client/forget_password_api_client.dart';
import 'package:exam_app/features/forget_password/data/models/forget_password_response/forget_password_response.dart';
import 'package:exam_app/features/forget_password/data/models/reset_password_response/reset_password_response.dart';
import 'package:exam_app/features/forget_password/data/models/verify_reset_code_response/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/remote_data_source_cont.dart';

@Injectable(as: ForgetPasswordRemoteDataSourceContract)
class ForgetPasswordRemoteDataSourceImpl
    extends ForgetPasswordRemoteDataSourceContract {
  final ForgetPasswordApiClient _apiClient;

  ForgetPasswordRemoteDataSourceImpl(this._apiClient);
  @override
  Future<ForgetPasswordResponse> forgetPassword(String email) {
    return _apiClient.forgetPassword({ApiKeys.emain: email});
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
    String email,
    String newPassword,
  ) {
    return _apiClient.resetPassword({
      ApiKeys.emain: email,
      ApiKeys.newPassword: newPassword,
    });
  }

  @override
  Future<VerifyResetCodeResponse> verifyResetCode(String resetCode) {
    return _apiClient.verifyResetCode({ApiKeys.resetCode: resetCode});
  }
}
