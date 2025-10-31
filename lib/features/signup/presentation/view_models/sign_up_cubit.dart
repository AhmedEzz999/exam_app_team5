import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/sign_up_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import 'sign_up_events.dart';

part 'sign_up_states.dart';

@injectable
class SignUpCubit extends Cubit<SignupState> {
  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());
  final SignUpUseCase _signUpUseCase;

  void doIntent(SignUpEvents event) {
    switch (event) {
      case SignUp():
        _signUp(user: event.user);
    }
  }

  void _signUp({required UserEntity user}) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase(user: user);
    result.fold(
      (error) => emit(SignUpFailure(errorMessage: error.message)),
      (success) => emit(SignUpSuccess(signUpEntity: success)),
    );
  }
}
