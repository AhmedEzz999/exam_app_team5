import 'package:dartz/dartz.dart';
import 'package:exam_app/features/forget_password/domain/entity/forget_password_entity.dart';
import 'package:exam_app/features/forget_password/domain/entity/reset_password_entity.dart';
import 'package:exam_app/features/forget_password/domain/entity/verify_reset_code_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class ForgetPasswordRepoContract {
  Future<Either<Failure, ForgetPasswordEntity>> forgetPassword({
    required String email,
  });

  Future<Either<Failure, VerifyResetCodeEntity>> verifyResetCode({
    required String resetCode,
  });

  Future<Either<Failure, ResetPasswordEntity>> resetPassword({
    required String email,
    required String newPassword,
  });
}
