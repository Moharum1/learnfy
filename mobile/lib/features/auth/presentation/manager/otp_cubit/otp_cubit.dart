import "package:flutter_bloc/flutter_bloc.dart";
import "otp_states.dart";

class OTPCubit extends Cubit<OTPState> {
  OTPCubit() : super(OTPVerfiyInitial());


  Future<void> sendSuccess()async {
    emit(OTPVerifyLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(OTPVerifySuccess());
  }

  Future<void> verify() async {
    emit(OTPVerifyLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(OTPVerifySuccess());
  }
}
