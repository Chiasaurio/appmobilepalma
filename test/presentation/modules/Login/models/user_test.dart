import 'package:apppalma/presentation/modules/Login/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    test('toMap returns the expected keys and values', () {
      const user = User(rol: 'admin', cc: '123');

      expect(user.toMap(), <String, dynamic>{'rol': 'admin', 'cc': '123'});
    });

    test('fromMap reads cc_usuario and defaults to empty string when missing',
        () {
      final user = User.fromMap(<String, dynamic>{
        'rol': 'admin',
        'cc_usuario': '456',
      });

      expect(user.rol, 'admin');
      expect(user.cc, '456');
    });

    test('fromMap defaults cc to empty string when cc_usuario is absent', () {
      final user = User.fromMap(<String, dynamic>{'rol': 'admin'});

      expect(user.cc, '');
    });

    test('copyWith preserves existing values when null is passed', () {
      const user = User(rol: 'admin', cc: '123');

      expect(user.copyWith(null), user);
      expect(
        user.copyWith(const User(rol: 'guest', cc: '123')),
        const User(rol: 'guest', cc: '123'),
      );
    });
  });
}
