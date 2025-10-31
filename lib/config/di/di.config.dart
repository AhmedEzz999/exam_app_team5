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

import '../../features/login/api/api_client/login_api_client.dart' as _i395;
import '../../features/login/api/data_sources/remote/login_remote_datasource_impl.dart'
    as _i710;
import '../../features/login/data/data_sources/remote/login_remote_data_source_contract.dart'
    as _i328;
import '../../features/login/data/repos/login_repo_impl.dart' as _i937;
import '../../features/login/domain/repos/login_repo_contract.dart' as _i909;
import '../../features/login/domain/usecases/login_use_case.dart' as _i420;
import '../../features/login/presentation/view_models/cubit/login_cubit.dart'
    as _i421;
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
    gh.lazySingleton<_i395.LoginApiClient>(
      () => _i395.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i328.LoginRemoteDataSourceContract>(
      () => _i710.LoginRemoteDatasourceImpl(
        loginApiClient: gh<_i395.LoginApiClient>(),
      ),
    );
    gh.factory<_i909.LoginRepoContract>(
      () => _i937.LoginRepoImpl(
        remoteDataSource: gh<_i328.LoginRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i420.LoginUseCase>(
      () => _i420.LoginUseCase(loginRepo: gh<_i909.LoginRepoContract>()),
    );
    gh.factory<_i421.LoginCubit>(
      () => _i421.LoginCubit(gh<_i420.LoginUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i624.DioModule {}
