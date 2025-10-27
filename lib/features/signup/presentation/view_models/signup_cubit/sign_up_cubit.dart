import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());
  final SignUpUseCase signUpUseCase;
  Future<void> signUp({required String email, required String password}) async {
    emit(SignUpLoading());
    final result = await signUpUseCase(email: email, password: password);
    result.fold(
      (failure) {
        emit(SignUpFailure(errorMessage: failure.errorMessage));
      },
      (userEntity) {
        emit(SignUpSuccess(userEntity: userEntity));
      },
    );
  }
}
