import 'package:apppalma/presentation/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlagasState', () {
    test('defaults to an empty form', () {
      const state = PlagasState();

      expect(state.status, FormStatus.noSubmitted);
      expect(state.etapasSeleccionada, isEmpty);
      expect(state.otraplaga, isFalse);
      expect(state.plagas, isNull);
      expect(state.plagaSeleccionada, isNull);
    });

    test('copyWith updates scalar fields', () {
      const state = PlagasState();
      final updated = state.copyWith(
        observaciones: 'obs',
        numeroIndividuos: 10,
        otraplaga: true,
      );

      expect(updated.observaciones, 'obs');
      expect(updated.numeroIndividuos, 10);
      expect(updated.otraplaga, isTrue);
    });
  });
}
