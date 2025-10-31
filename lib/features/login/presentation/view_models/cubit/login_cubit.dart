import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/login_use_case.dart';
import 'login_events.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitialState());
  final LoginUseCase _loginUseCase;

  void doIntent(LoginEvents event) {
    switch (event) {
      case Login():
        _login(email: event.email, password: event.password);
    }
  }

  _login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final result = await _loginUseCase(email: email, password: password);
    result.fold(
      (error) => emit(LoginErrorState(error: error.message)),
      (success) => emit(LoginSuccessState(loginEntity: success)),
    );
  }
}
