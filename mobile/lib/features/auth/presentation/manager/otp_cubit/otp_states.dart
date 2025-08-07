abstract class OTPState {}

// Initial state (no action yet)
class OTPInitial extends OTPState {}

// Loading states (separate for sending/verifying)
class OTPSendingLoading extends OTPState {}

class OTPVerifyingLoading extends OTPState {}

// Success states
class OTPSendSuccess extends OTPState {
  // Code sent to user
  final String deliveryMethod; // e.g., "SMS", "Email"
  OTPSendSuccess(this.deliveryMethod);
}

class OTPVerifySuccess extends OTPState {} // Correct code entered

// Failure states (could also separate send/verify failures)
class OTPSendFailure extends OTPState {
  final String error;
  OTPSendFailure(this.error);
}

class OTPVerifyFailure extends OTPState {
  final String error;
  final int remainingAttempts;
  OTPVerifyFailure(this.error, this.remainingAttempts);
}
