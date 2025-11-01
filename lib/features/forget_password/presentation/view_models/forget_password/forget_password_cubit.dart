import 'package:exam_app/features/forget_password/domain/ucecases/forget_password_usecase.dart';
import 'package:exam_app/features/forget_password/presentation/view_models/forget_password/forget_password_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordUsecase)
    : super(ForgetPasswordInitialState());
  final ForgetPasswordUsecase _forgetPasswordUsecase;

  void doIntety(ForgetPasswordEvents event) {
    switch (event) {
      case ForgetPassword():
        _forgetPassword(email: event.email);
    }
  }

  _forgetPassword({required String email}) async {
    emit(ForgetPasswordLoadingState());
    var result = await _forgetPasswordUsecase(email: email);
    result.fold(
      (error) => emit(ForgetPasswordErrorState(error: error.message)),
      (success) => emit(ForgetPasswordSuccessState()),
    );
  }
}
