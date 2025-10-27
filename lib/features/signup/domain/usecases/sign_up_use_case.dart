import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/sign_up_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/sign_up_repo.dart';

class SignUpUseCase {
  SignUpUseCase({required this.signUpRepo});
  final SignUpRepo signUpRepo;

  Future<Either<Failures, SignUpEntity>> call({required UserEntity user}) {
    return signUpRepo.signUp(user: user);
  }
}
