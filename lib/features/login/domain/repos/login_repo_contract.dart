import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/login_entity.dart';

abstract class LoginRepoContract {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });
}
