import 'package:apppalma/presentation/modules/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_database.dart';

void main() {
  test('SyncToServerCubit collects empty sync queues without errors', () async {
    ensureTestDatabase();
    final cubit = SyncToServerCubit();

    await cubit.getRegistrosPendientes();

    expect(cubit.state.loaded, isTrue);
    expect(cubit.state.cosechasConDiariasPendientes, isEmpty);
    expect(cubit.state.podasConDiariasPendientes, isEmpty);
    expect(cubit.state.plateosConDiariasPendientes, isEmpty);
    expect(cubit.state.fertilizacionesConDiariasPendientes, isEmpty);
    expect(cubit.state.palmasPendientes, isEmpty);
    expect(cubit.state.enfermedadesPendientes, isEmpty);
    expect(cubit.state.tratamientosPendientes, isEmpty);
    expect(cubit.state.erradicacionesPendientes, isEmpty);
    expect(cubit.state.censosPendientes, isEmpty);
    expect(cubit.state.fumigacionesPendientes, isEmpty);
    expect(cubit.state.viajesPendientes, isEmpty);
    expect(cubit.state.precipitacionesPendientes, isEmpty);
    expect(cubit.state.censosProductivosPendientes, isEmpty);

    await cubit.syncRegistros();
  });
}
