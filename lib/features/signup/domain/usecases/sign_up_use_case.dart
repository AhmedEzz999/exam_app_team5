import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/sign_up_repo.dart';

class SignUpUseCase {
  SignUpUseCase({required this.signUpRepo});
  final SignUpRepo signUpRepo;

  Future<Either<Failures, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return signUpRepo.signUp(email: email, password: password);
  }
}
