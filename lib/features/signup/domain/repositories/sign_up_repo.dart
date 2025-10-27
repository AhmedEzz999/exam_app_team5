import'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract interface class SignUpRepo {
  Future<Either<Failures, UserEntity>> signUp({required String email, required String password});
}