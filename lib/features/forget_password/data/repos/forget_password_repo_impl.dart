import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/features/forget_password/domain/entity/forget_password_entity.dart';
import 'package:exam_app/features/forget_password/domain/entity/reset_password_entity.dart';
import 'package:exam_app/features/forget_password/domain/entity/verify_reset_code_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/forget_password_repo_contract.dart';
import '../data_sources/remote/remote_data_source_cont.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl extends ForgetPasswordRepoContract {
  ForgetPasswordRepoImpl({required this.remoteDataSource});
  final ForgetPasswordRemoteDataSourceContract remoteDataSource;

  @override
  Future<Either<Failure, ForgetPasswordEntity>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await remoteDataSource.forgetPassword(email);

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

  @override
  Future<Either<Failure, ResetPasswordEntity>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final response = await remoteDataSource.resetPassword(email, newPassword);

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

  @override
  Future<Either<Failure, VerifyResetCodeEntity>> verifyResetCode({
    required String resetCode,
  }) async {
    try {
      final response = await remoteDataSource.verifyResetCode(resetCode);

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
