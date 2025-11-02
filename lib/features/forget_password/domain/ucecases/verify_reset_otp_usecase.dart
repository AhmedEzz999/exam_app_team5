import 'package:dartz/dartz.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/forget_password/domain/entity/verify_reset_code_entity.dart';
import 'package:exam_app/features/forget_password/domain/repos/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetOtpUsecase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  VerifyResetOtpUsecase(this._forgetPasswordRepoContract);

  Future<Either<Failure, VerifyResetCodeEntity>> call({required String code}) =>
      _forgetPasswordRepoContract.verifyResetCode(resetCode: code);
}
