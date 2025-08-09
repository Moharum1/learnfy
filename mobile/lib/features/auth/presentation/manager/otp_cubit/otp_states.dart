// base generic class for all states
abstract class OTPState {}

class OTPVerfiyInitial extends OTPState {}

class OTPVerifySuccess extends OTPState {} // Correct code entered

class OTPVerifyLoading extends OTPState {}

class OTPVerifyFailure extends OTPState {
  final String error;
  final int remainingAttempts;
  OTPVerifyFailure(this.error, this.remainingAttempts);
}