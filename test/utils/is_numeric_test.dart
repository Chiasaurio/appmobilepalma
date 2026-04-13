import 'package:apppalma/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('isNumeric accepts and rejects the expected strings', () {
    expect(isNumeric('12.5'), isTrue);
    expect(isNumeric('0'), isTrue);
    expect(isNumeric(''), isFalse);
    expect(isNumeric('abc'), isFalse);
  });
}
