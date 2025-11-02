import 'package:exam_app/features/forget_password/domain/ucecases/verify_reset_otp_usecase.dart';
import 'package:exam_app/features/forget_password/presentation/view_models/verify_reset_code/verify_reset_code_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'verify_rest_code_state.dart';

@injectable
class VerifyRestCodeCubit extends Cubit<VerifyRestCodeState> {
  VerifyRestCodeCubit(this._otpUsecase) : super(VerifyRestCodeInitialState());
  bool isValidate = false;

  final VerifyResetOtpUsecase _otpUsecase;
  doIntent(VerifyResetCodeEvent event) {
    switch (event) {
      case VerifyResetCode():
        _verifyCode(code: event.code);
    }
  }

  _verifyCode({required String code}) async {
    emit(VerifyRestCodeLoadingState());
    var response = await _otpUsecase(code: code);
    response.fold(
      (error) {
        isValidate = false;
        emit(VerifyRestCodeErrorState(error: error.message));
      },
      (success) {
        isValidate = true;
        emit(VerifyRestCodeSuccessState());
      },
    );
  }
}
