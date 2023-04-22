// part of 'authentication_bloc.dart';

// /// Representa el estado de la autenticación
// class AuthenticationState extends Equatable {
//   final AuthenticationStatus status;
//   final User? user;

//   /// constructor vacio del estado
//   const AuthenticationState._({
//     this.status = AuthenticationStatus.unknown,
//     this.user,
//   });

//   /// constructor del estado de la autenticación desconocido
//   const AuthenticationState.unknown() : this._();

//   /// constructor del estado de la autenticación autenticado
//   const AuthenticationState.authenticated()
//       : this._(
//           status: AuthenticationStatus.authenticated,
//           // user: user,
//         );

//   const AuthenticationState.registerAuthenticated(User user)
//       : this._(
//           status: AuthenticationStatus.authenticated,
//           user: user,
//         );

//   /// constructor del estado de la autenticación no autenticado
//   const AuthenticationState.unauthenticated()
//       : this._(status: AuthenticationStatus.unauthenticated);

//   AuthenticationState copyWith({
//     required AuthenticationStatus status,
//     User? user,
//   }) {
//     return AuthenticationState._(
//       status: status,
//       user: user ?? this.user,
//     );
//   }

//   @override
//   List<Object?> get props => [status, user];

//   @override
//   String toString() => 'Authentication State { status: $status, user: $user }';
// }
