import 'package:apppalma/presentation/modules/Palma/cubit/palma_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/presentation_test_data.dart';
import '../../helpers/test_database.dart';

void main() {
  setUpAll(() async {
    final db = ensureTestDatabase();
    await seedPresentationTestGraph(db);
  });

  test('PalmaCubit handles a missing palm lookup without crashing', () async {
    final cubit = PalmaCubit();
    await cubit.initState('Lote Demo');
    await cubit.lineaDePalmaChanged(99);
    await cubit.numeroDePalmaChanged(99);
    await cubit.orientacionChanged('N');

    await cubit.obtenerProcesosPalma();

    expect(cubit.state.palmaSeleccionada, isNull);
    expect(cubit.state.nombreLote, 'Lote Demo');
  });
}
