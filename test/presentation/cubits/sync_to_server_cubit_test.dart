import 'package:apppalma/presentation/modules/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/presentation_test_data.dart';
import '../../helpers/test_database.dart';

void main() {
  setUpAll(() async {
    final db = ensureTestDatabase();
    await seedPresentationTestGraph(db);
  });

  test('SyncToServerCubit collects pending local records', () async {
    final cubit = SyncToServerCubit();
    await cubit.getRegistrosPendientes();

    expect(cubit.state.loaded, isTrue);
    expect(cubit.state.cosechasConDiariasPendientes, isNotEmpty);
    expect(cubit.state.podasConDiariasPendientes, isNotEmpty);
    expect(cubit.state.plateosConDiariasPendientes, isNotEmpty);
    expect(cubit.state.fertilizacionesConDiariasPendientes, isNotEmpty);
    expect(cubit.state.palmasPendientes, isNotEmpty);
    expect(cubit.state.enfermedadesPendientes, isNotEmpty);
    expect(cubit.state.tratamientosPendientes, isNotEmpty);
    expect(cubit.state.erradicacionesPendientes, isNotEmpty);
    expect(cubit.state.censosPendientes, isNotEmpty);
    expect(cubit.state.fumigacionesPendientes, isNotEmpty);
    expect(cubit.state.viajesPendientes, isNotEmpty);
    expect(cubit.state.precipitacionesPendientes, isNotEmpty);
    expect(cubit.state.censosProductivosPendientes, isNotEmpty);
  });
}
