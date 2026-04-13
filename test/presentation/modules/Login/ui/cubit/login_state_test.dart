import 'package:apppalma/presentation/modules/Login/ui/cubit/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

void main() {
  group('LoginState', () {
    test('defaults to a clean form', () {
      const state = LoginState();

      expect(state.isValid, isFalse);
      expect(state.status, FormzSubmissionStatus.initial);
    });

    test('copyWith updates the form fields', () {
      const state = LoginState();
      final updated = state.copyWith(
        isValid: true,
        status: FormzSubmissionStatus.success,
      );

      expect(updated.isValid, isTrue);
      expect(updated.status, FormzSubmissionStatus.success);
    });
  });
}
