import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  SignUpCubit() : super(SignUpInitial());
  // final SignUpUseCase signUpUseCase;
  Future<void> signUp({required UserEntity user}) async {
    emit(SignUpLoading());
    // final result = await signUpUseCase(user: user);
    // result.fold(
    //   (failure) {
    //     emit(SignUpFailure(errorMessage: failure.errorMessage));
    //   },
    //   (signUpEntity) {
    //     emit(SignUpSuccess(signUpEntity: signUpEntity));
    //   },
    // );
    Future.delayed(const Duration(seconds: 2), () {
      emit(SignUpSuccess());
    });
  }
}
