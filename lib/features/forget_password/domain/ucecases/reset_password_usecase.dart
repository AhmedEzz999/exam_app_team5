import 'package:dartz/dartz.dart';
import 'package:exam_app/features/forget_password/domain/entity/reset_password_entity.dart';
import 'package:exam_app/features/forget_password/domain/repos/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';

@injectable
class ResetPasswordUsecase {
  final ForgetPasswordRepoContract _forgetPassword;
  ResetPasswordUsecase(this._forgetPassword);
  Future<Either<Failure, ResetPasswordEntity>> call({
    required String email,
    required String newPassword,
  }) => _forgetPassword.resetPassword(email: email, newPassword: newPassword);
}
