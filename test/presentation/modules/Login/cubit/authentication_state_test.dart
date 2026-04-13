import 'package:apppalma/presentation/modules/Login/cubit/authentication_cubit.dart';
import 'package:apppalma/presentation/modules/Login/resources/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationState', () {
    test('defaults to unknown status', () {
      const state = AuthenticationState();

      expect(state.status, AuthenticationStatus.unknown);
    });

    test('copyWith updates the status', () {
      const state = AuthenticationState();

      expect(state.copyWith(status: AuthenticationStatus.authenticated).status,
          AuthenticationStatus.authenticated);
    });
  });
}
