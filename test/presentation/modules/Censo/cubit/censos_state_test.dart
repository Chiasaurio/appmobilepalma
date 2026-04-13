import 'package:apppalma/presentation/modules/Censo/cubit/censos_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CensosState', () {
    test('defaults to initial status', () {
      const state = CensosState();

      expect(state.status, CensoStatus.initial);
      expect(state.censos, isNull);
      expect(state.censo, isNull);
      expect(state.filtro, isNull);
    });

    test('copyWith updates scalar fields', () {
      const state = CensosState();
      final updated = state.copyWith(
        filtro: '2024',
        status: CensoStatus.loaded,
      );

      expect(updated.filtro, '2024');
      expect(updated.status, CensoStatus.loaded);
    });
  });
}
