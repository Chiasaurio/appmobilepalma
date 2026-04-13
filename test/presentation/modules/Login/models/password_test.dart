import 'package:apppalma/presentation/modules/Login/models/password.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('Password', () {
    test('is valid for strings between 1 and 50 characters', () {
      expect(Password.dirty('1').isValid, isTrue);
      expect(Password.dirty(repeatedChar('a', 50)).isValid, isTrue);
    });

    test('is invalid for empty strings and values longer than 50 characters',
        () {
      expect(Password.dirty().isValid, isFalse);
      expect(Password.dirty('').isValid, isFalse);
      expect(Password.dirty(repeatedChar('a', 51)).isValid, isFalse);
    });

    test('has a pure invalid initial value', () {
      const password = Password.pure();

      expect(password.value, '');
      expect(password.isPure, isTrue);
      expect(password.isValid, isFalse);
    });
  });
}
