import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CosechaStateLoaded', () {
    test('defaults to an unloaded form', () {
      const state = CosechaStateLoaded();

      expect(state.isLoaded, isFalse);
      expect(state.status, FormStatus.noSubmitted);
      expect(state.statusMsg, '');
      expect(state.cosecha, isNull);
      expect(state.cosechasDiarias, isNull);
    });

    test('copyWith updates scalar fields', () {
      const state = CosechaStateLoaded();
      final updated = state.copyWith(
        isLoaded: true,
        status: FormStatus.submissionSuccess,
        statusMsg: 'ok',
      );

      expect(updated.isLoaded, isTrue);
      expect(updated.status, FormStatus.submissionSuccess);
      expect(updated.statusMsg, 'ok');
    });
  });
}
