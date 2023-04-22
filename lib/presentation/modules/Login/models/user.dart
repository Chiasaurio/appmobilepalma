import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String rol;
  final String cc;

  const User({
    required this.rol,
    required this.cc,
  });

  Map<String, dynamic> toMap() {
    return {
      "rol": rol,
      "cc": cc,
    };
  }

  User copyWith(User? user) {
    return User(
      rol: user?.rol ?? rol,
      cc: user?.cc ?? cc,
    );
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      rol: map['rol'],
      cc: map['cc_usuario'] ?? '',
    );
  }

  @override
  List<Object?> get props => [cc];
}
