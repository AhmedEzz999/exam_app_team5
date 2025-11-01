import 'package:dartz/dartz.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/forget_password/domain/entity/forget_password_entity.dart';
import 'package:exam_app/features/forget_password/domain/repos/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  ForgetPasswordUsecase(this._forgetPasswordRepoContract);
  Future<Either<Failure, ForgetPasswordEntity>> call({required String email}) =>
      _forgetPasswordRepoContract.forgetPassword(email: email);
}
