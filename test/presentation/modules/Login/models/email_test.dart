import 'package:apppalma/presentation/modules/Login/models/email.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('Name', () {
    test('is valid for strings between 1 and 50 characters', () {
      expect(Name.dirty('a').isValid, isTrue);
      expect(Name.dirty(repeatedChar('a', 50)).isValid, isTrue);
    });

    test('is invalid for empty strings and values longer than 50 characters',
        () {
      expect(Name.dirty().isValid, isFalse);
      expect(Name.dirty('').isValid, isFalse);
      expect(Name.dirty(repeatedChar('a', 51)).isValid, isFalse);
    });

    test('has a pure invalid initial value', () {
      const name = Name.pure();

      expect(name.value, '');
      expect(name.isPure, isTrue);
      expect(name.isValid, isFalse);
    });
  });
}
