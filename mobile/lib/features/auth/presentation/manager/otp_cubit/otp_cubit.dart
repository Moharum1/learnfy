import "package:flutter_bloc/flutter_bloc.dart";
import "otp_states.dart";

class OTPCubit extends Cubit<OTPState> {
  OTPCubit() : super(OTPInitial());


  Future<void> sendSuccess()async {
    emit(OTPSendingLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(OTPSendSuccess("SMS"));
  }

  Future<void> verify() async {
    emit(OTPVerifyingLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(OTPVerifySuccess());
  }
}
