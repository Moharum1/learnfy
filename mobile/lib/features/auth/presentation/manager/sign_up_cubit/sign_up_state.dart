part of 'sign_up_cubit.dart';

class SignUpState {
  final bool isTermAccepted;
  final bool isPasswordVisible;

  SignUpState({this.isTermAccepted = false, this.isPasswordVisible = false});

  SignUpState copyWith({
    bool? isTermAccepted,
    bool? isPasswordVisible,
  }) {
    return SignUpState(
      isTermAccepted: isTermAccepted ?? this.isTermAccepted,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
