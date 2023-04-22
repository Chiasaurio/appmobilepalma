import 'package:apppalma/presentation/modules/Login/resources/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState()) {
    _authenticationRepository.status
        .listen((status) => mapAuthenticationOnLoadingToState(s: status));
  }

  final _storage = const FlutterSecureStorage();
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  Future<void> mapAuthenticationOnLoadingToState(
      {AuthenticationStatus s = AuthenticationStatus.unknown}) async {
    if (s == AuthenticationStatus.authenticated ||
        s == AuthenticationStatus.unknown) {
      final jwt = await _storage.read(key: 'token');
      final email = await _storage.read(key: 'email');
      final password = await _storage.read(key: 'password');

      if (jwt == null && email == null && password == null) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      } else {
        emit(state.copyWith(status: AuthenticationStatus.authenticated));
      }
    } else if (s == AuthenticationStatus.unauthenticated) {
      emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
    } else {
      emit(state.copyWith(status: AuthenticationStatus.unknown));
    }
  }

  void logout() {
    _authenticationRepository.logOut();
  }
}
