import 'package:apppalma/presentation/modules/Sync/cubit/sync_to_device_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../helpers/presentation_test_data.dart';
import '../../helpers/test_database.dart';

void main() {
  setUpAll(() async {
    final db = ensureTestDatabase();
    await seedPresentationTestGraph(db);
    await initializeDateFormatting('es', null);
  });

  test('SynToDeviceCubit collects local pending records and timestamps',
      () async {
    final cubit = SynToDeviceCubit();
    await cubit.getFechasUltimaActualizacion();

    expect(cubit.state.loteFechaUltimaActualizacion, isNotEmpty);
    expect(cubit.state.plagaFechaUltimaActualizacion, isNotEmpty);
    expect(cubit.state.enfermedadFechaUltimaActualizacion, isNotEmpty);
    expect(cubit.state.agroquimicoFechaUltimaActualizacion, isNotEmpty);
    expect(cubit.state.fertilizanteFechaUltimaActualizacion, isNotEmpty);
  });
}
