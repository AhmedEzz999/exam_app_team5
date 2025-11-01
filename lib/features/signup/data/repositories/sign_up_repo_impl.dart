import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/sign_up_repo_contract.dart';
import '../datasources/remote/sign_up_remote_data_source_contract.dart';

@Injectable(as: SignUpRepoContract)
class SignUpRepoImpl implements SignUpRepoContract {
  SignUpRepoImpl({required this.remoteDataSource});
  final SignUpRemoteDataSourceContract remoteDataSource;
  @override
  Future<Either<Failure, SignUpEntity>> signUp({
    required UserEntity user,
  }) async {
    try {
      final response = await remoteDataSource.signUp(user: user);
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
