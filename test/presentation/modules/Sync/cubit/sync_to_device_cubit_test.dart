import 'package:apppalma/presentation/modules/Sync/cubit/sync_to_device_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_database.dart';

void main() {
  test('SynToDeviceCubit returns empty timestamps when local data is empty',
      () async {
    ensureTestDatabase();
    await initializeDateFormatting('es', null);
    final cubit = SynToDeviceCubit();

    await cubit.getFechasUltimaActualizacion();

    expect(cubit.state.loteFechaUltimaActualizacion, '');
    expect(cubit.state.plagaFechaUltimaActualizacion, '');
    expect(cubit.state.enfermedadFechaUltimaActualizacion, '');
    expect(cubit.state.agroquimicoFechaUltimaActualizacion, '');
    expect(cubit.state.fertilizanteFechaUltimaActualizacion, '');
  });
}
