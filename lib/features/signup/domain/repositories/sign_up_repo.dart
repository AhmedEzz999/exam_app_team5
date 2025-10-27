import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/sign_up_entity.dart';
import '../entities/user_entity.dart';

abstract interface class SignUpRepo {
  Future<Either<Failures, SignUpEntity>> signUp({required UserEntity user});
}
