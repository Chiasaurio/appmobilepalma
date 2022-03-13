import 'package:apppalma/modules/Login/models/user.dart';
import 'package:apppalma/modules/Login/resources/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();
  final _storage = const FlutterSecureStorage();

  AuthenticationBloc() : super(const AuthenticationState.unknown()) {
    _authenticationRepository.status
        .listen((status) => add(AuthenticationChange(status: status)));
    on<AuthenticationEvent>((event, emit) async {
      if (event is AuthenticationChange) {
        final status = await _mapAuthenticationOnLoadingToState(event);
        emit(status);
      }
      if (event is AuthenticationLogoutRequested) {
        _authenticationRepository.logOut();
      }
    });
  }

  Future<AuthenticationState> _mapAuthenticationOnLoadingToState(
      AuthenticationChange event) async {
    if (event.status == AuthenticationStatus.authenticated ||
        event.status == AuthenticationStatus.unknown) {
      final jwt = await _storage.read(key: 'token');
      final email = await _storage.read(key: 'email');
      final password = await _storage.read(key: 'password');

      if (jwt == null && email == null && password == null) {
        return const AuthenticationState.unauthenticated();
      } else {
        return const AuthenticationState.authenticated();
      }
    } else if (event.status == AuthenticationStatus.unauthenticated) {
      return const AuthenticationState.unauthenticated();
    } else {
      return const AuthenticationState.unknown();
    }
  }
}
