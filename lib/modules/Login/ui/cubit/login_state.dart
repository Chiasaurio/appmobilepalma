part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.name = const Name.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Name name;
  final Password password;
  final FormzStatus status;

  @override
  List<Object> get props => [name, password, status];

  LoginState copyWith({
    Name? name,
    Password? password,
    FormzStatus? status,
  }) {
    return LoginState(
      name: name ?? this.name,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
