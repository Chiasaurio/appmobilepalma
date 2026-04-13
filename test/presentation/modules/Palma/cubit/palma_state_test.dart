import 'package:apppalma/presentation/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PalmaState', () {
    test('PalmaInitial defaults to a blank state', () {
      const state = PalmaInitial();

      expect(state.status, FormStatus.noSubmitted);
      expect(state.palmas, isNull);
      expect(state.palmaSeleccionada, isNull);
      expect(state.nombreLote, isNull);
    });

    test('PalmaInitial copyWith updates scalar fields', () {
      const state = PalmaInitial();
      final updated = state.copyWith(
        nombreLote: 'Lote 1',
        orientacion: 'Norte',
        lineaPalma: 4,
      );

      expect(updated.nombreLote, 'Lote 1');
      expect(updated.orientacion, 'Norte');
      expect(updated.lineaPalma, 4);
    });

    test('ErradicacionConCausa copyWith updates scalar fields', () {
      const state = ErradicacionConCausa();
      final updated = state.copyWith(
        causa: 'Falla',
        numeroPalma: 12,
        orientacion: 'Sur',
      );

      expect(updated.causa, 'Falla');
      expect(updated.numeroPalma, 12);
      expect(updated.orientacion, 'Sur');
    });
  });
}
