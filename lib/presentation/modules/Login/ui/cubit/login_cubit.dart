import 'package:apppalma/presentation/modules/Login/models/email.dart';
import 'package:apppalma/presentation/modules/Login/models/password.dart';
import 'package:apppalma/presentation/modules/Login/resources/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();
  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
        name: name, isValid: Formz.validate([name, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password, isValid: Formz.validate([state.name, password])));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final resp = await _authenticationRepository.logIn(
          state.name.value, state.password.value);
      if (resp == 200) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
        ));
      }
    } on Exception {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
