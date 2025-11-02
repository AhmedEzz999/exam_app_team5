import 'package:exam_app/features/forget_password/domain/ucecases/reset_password_usecase.dart';
import 'package:exam_app/features/forget_password/presentation/view_models/reset_password/reset_password_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._resetPasswordUsecase)
    : super(ResetPasswordInitialState());
  final ResetPasswordUsecase _resetPasswordUsecase;
  void doIntent(ResetPasswordEvents event) {
    switch (event) {
      case ResetPasswordEvent():
        _resetPassword(email: event.email, newPassword: event.newPassword);
    }
  }

  _resetPassword({required String email, required String newPassword}) async {
    emit(ResetPasswordLoadingState());
    var result = await _resetPasswordUsecase(
      email: email,
      newPassword: newPassword,
    );
    result.fold(
      (error) => emit(ResetPasswordErrorState(error: error.message)),
      (success) => emit(ResetPasswordSuccessState(success.token)),
    );
  }
}
