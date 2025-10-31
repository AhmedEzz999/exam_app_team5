import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/sign_up_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/sign_up_repo.dart';

class SignUpUseCase {
  SignUpUseCase({required this.signUpRepo});
  final SignUpRepo signUpRepo;

  Future<Either<Failure, SignUpEntity>> call({required UserEntity user}) {
    return signUpRepo.signUp(user: user);
  }
}
