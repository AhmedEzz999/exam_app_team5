import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/sign_up_entity.dart';
import '../entities/user_entity.dart';

abstract interface class SignUpRepoContract {
  Future<Either<Failure, SignUpEntity>> signUp({required UserEntity user});
}
