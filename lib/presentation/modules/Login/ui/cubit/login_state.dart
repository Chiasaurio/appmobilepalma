part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.name = const Name.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
  });

  final Name name;
  final bool isValid;
  final Password password;
  final FormzSubmissionStatus status;

  @override
  List<Object> get props => [name, password, status];

  LoginState copyWith({
    Name? name,
    bool? isValid,
    Password? password,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      name: name ?? this.name,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
