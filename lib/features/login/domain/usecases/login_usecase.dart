import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../entities/login_entity.dart';
import '../repos/login_repo_contract.dart';

@injectable
class LoginUsecase {
  final LoginRepoContract loginRepo;

  LoginUsecase({required this.loginRepo});
  Future<Either<Failure, LoginEntity>> call({
    required String email,
    required String password,
  }) => loginRepo.login(email: email, password: password);
}
