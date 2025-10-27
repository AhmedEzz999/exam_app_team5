import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/login_usecase.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUsecase) : super(LoginInitialState());
  final LoginUsecase loginUsecase;

  login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final result = await loginUsecase(email: email, password: password);
    result.fold(
      (error) => emit(LoginErrorState(error: error.message)),
      (success) => emit(LoginSuccessState(loginEntity: success)),
    );
  }
}
