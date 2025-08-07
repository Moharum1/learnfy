import 'package:bloc/bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  void togglePasswordVisible() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void toggleTermAccept(value) {
    emit(state.copyWith(isTermAccepted: value));
  }
}
