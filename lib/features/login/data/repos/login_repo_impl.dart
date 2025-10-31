import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repos/login_repo_contract.dart';
import '../data_sources/remote/login_remote_data_source_contract.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl extends LoginRepoContract {
  LoginRepoImpl({required this.remoteDataSource});
  final LoginRemoteDataSourceContract remoteDataSource;
  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(
        email: email,
        password: password,
      );

      return Right(response.toEntity());
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        return Left(ServerFailure(appError.message));
      }
      return const Left(ServerFailure('Network error occurred.'));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Unexpected error occurred.'));
    }
  }
}
