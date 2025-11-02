// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/forget_password/api/api_client/forget_password_api_client.dart'
    as _i892;
import '../../features/forget_password/api/data_sources/remote/forget_password_remote_data_source_impl.dart'
    as _i973;
import '../../features/forget_password/data/data_sources/remote/remote_data_source_cont.dart'
    as _i161;
import '../../features/forget_password/data/repos/forget_password_repo_impl.dart'
    as _i216;
import '../../features/forget_password/domain/repos/forget_password_repo_contract.dart'
    as _i377;
import '../../features/forget_password/domain/ucecases/forget_password_usecase.dart'
    as _i982;
import '../../features/forget_password/domain/ucecases/reset_password_usecase.dart'
    as _i939;
import '../../features/forget_password/domain/ucecases/verify_reset_otp_usecase.dart'
    as _i492;
import '../../features/forget_password/presentation/view_models/forget_password/forget_password_cubit.dart'
    as _i201;
import '../../features/forget_password/presentation/view_models/reset_password/reset_password_cubit.dart'
    as _i107;
import '../../features/forget_password/presentation/view_models/verify_reset_code/verify_rest_code_cubit.dart'
    as _i433;
import '../../features/login/api/api_client/login_api_client.dart' as _i395;
import '../../features/login/api/data_sources/remote/login_remote_datasource_impl.dart'
    as _i710;
import '../../features/login/data/data_sources/remote/login_remote_data_source_contract.dart'
    as _i328;
import '../../features/login/data/repos/login_repo_impl.dart' as _i937;
import '../../features/login/domain/repos/login_repo_contract.dart' as _i909;
import '../../features/login/domain/usecases/login_use_case.dart' as _i1005;
import '../../features/login/presentation/view_models/cubit/login_cubit.dart'
    as _i421;
import '../../features/signup/api/api_client/sign_up_api_client.dart' as _i786;
import '../../features/signup/api/data_sources/remote/sign_up_remote_datasource_impl.dart'
    as _i542;
import '../../features/signup/data/datasources/remote/sign_up_remote_data_source_contract.dart'
    as _i431;
import '../../features/signup/data/repositories/sign_up_repo_impl.dart' as _i17;
import '../../features/signup/domain/repositories/sign_up_repo_contract.dart'
    as _i553;
import '../../features/signup/domain/usecases/sign_up_use_case.dart' as _i594;
import '../../features/signup/presentation/view_models/sign_up_cubit.dart'
    as _i493;
import '../modules/dio_module/dio_module.dart' as _i624;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i892.ForgetPasswordApiClient>(
      () => _i892.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i395.LoginApiClient>(
      () => _i395.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i786.SignUpApiClient>(
      () => _i786.SignUpApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i161.ForgetPasswordRemoteDataSourceContract>(
      () => _i973.ForgetPasswordRemoteDataSourceImpl(
        gh<_i892.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i377.ForgetPasswordRepoContract>(
      () => _i216.ForgetPasswordRepoImpl(
        remoteDataSource: gh<_i161.ForgetPasswordRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i328.LoginRemoteDataSourceContract>(
      () => _i710.LoginRemoteDatasourceImpl(
        loginApiClient: gh<_i395.LoginApiClient>(),
      ),
    );
    gh.factory<_i431.SignUpRemoteDataSourceContract>(
      () => _i542.SignUpRemoteDatasourceImpl(
        signUpApiClient: gh<_i786.SignUpApiClient>(),
      ),
    );
    gh.factory<_i553.SignUpRepoContract>(
      () => _i17.SignUpRepoImpl(
        remoteDataSource: gh<_i431.SignUpRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i909.LoginRepoContract>(
      () => _i937.LoginRepoImpl(
        remoteDataSource: gh<_i328.LoginRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i939.ResetPasswordUsecase>(
      () => _i939.ResetPasswordUsecase(gh<_i377.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i982.ForgetPasswordUsecase>(
      () => _i982.ForgetPasswordUsecase(gh<_i377.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i492.VerifyResetOtpUsecase>(
      () => _i492.VerifyResetOtpUsecase(gh<_i377.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i433.VerifyRestCodeCubit>(
      () => _i433.VerifyRestCodeCubit(gh<_i492.VerifyResetOtpUsecase>()),
    );
    gh.factory<_i1005.LoginUseCase>(
      () => _i1005.LoginUseCase(loginRepo: gh<_i909.LoginRepoContract>()),
    );
    gh.factory<_i594.SignUpUseCase>(
      () => _i594.SignUpUseCase(signUpRepo: gh<_i553.SignUpRepoContract>()),
    );
    gh.factory<_i107.ResetPasswordCubit>(
      () => _i107.ResetPasswordCubit(gh<_i939.ResetPasswordUsecase>()),
    );
    gh.factory<_i201.ForgetPasswordCubit>(
      () => _i201.ForgetPasswordCubit(gh<_i982.ForgetPasswordUsecase>()),
    );
    gh.factory<_i421.LoginCubit>(
      () => _i421.LoginCubit(gh<_i1005.LoginUseCase>()),
    );
    gh.factory<_i493.SignUpCubit>(
      () => _i493.SignUpCubit(gh<_i594.SignUpUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i624.DioModule {}
