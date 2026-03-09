part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({this.status = AuthenticationStatus.unknown});
  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];

  AuthenticationState copyWith({
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(status: status ?? this.status);
  }
}
