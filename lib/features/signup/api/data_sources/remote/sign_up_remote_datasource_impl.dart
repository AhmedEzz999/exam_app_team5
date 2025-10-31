import 'package:injectable/injectable.dart';

import '../../../../../core/constants/api_endpoints/api_keys.dart';
import '../../../data/datasources/remote/sign_up_remote_data_source_contract.dart';
import '../../../data/models/sign_up_response/sign/sign_up_response.dart';
import '../../../domain/entities/user_entity.dart';
import '../../api_client/sign_up_api_client.dart';

@Injectable(as: SignUpRemoteDataSourceContract)
class SignUpRemoteDatasourceImpl implements SignUpRemoteDataSourceContract {
  SignUpRemoteDatasourceImpl({required this.loginApiClient});
  final SignUpApiClient loginApiClient;
  @override
  Future<SignUpResponse> signUp({required UserEntity user}) {
    return loginApiClient.signUp({
      ApiKeys.username: user.username,
      ApiKeys.firstName: user.firstName,
      ApiKeys.lastName: user.lastName,
      ApiKeys.email: user.email,
      ApiKeys.password: user.password,
      ApiKeys.rePassword: user.rePassword,
      ApiKeys.phone: user.phone,
    });
  }
}
