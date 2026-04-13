import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_database.dart';

Future<void> seedPalmaGraph(AppDatabase db) async {
  final now = DateTime(2024, 1, 1, 12);

  await db.loteDao.addLote(
    LotesCompanion(
      nombreLote: const Value('Lote A'),
      hectareas: const Value(10),
      numeropalmas: const Value(100),
      numeroLineas: const Value(5),
      palmasPorLinea: const Value(20),
      fechaUltimaActualizacion: Value(now),
    ),
  );

  await db.enfermedadesDao.insertEnfermedad(
    const EnfermedadesCompanion(
      nombreEnfermedad: Value('Enfermedad A'),
      procedimientoEnfermedad: Value('Procedimiento'),
    ),
  );
  await db.enfermedadesDao.insertEtapa(
    const EtapasCompanion(
      id: Value(1),
      nombreEnfermedad: Value('Enfermedad A'),
      nombreEtapa: Value('Etapa A'),
      procedimientoEtapa: Value('Paso A'),
    ),
  );
  await db.productoAgroquimicoDao.insertProducto(
    ProductoAgroquimicoCompanion(
      idProductoAgroquimico: Value(1),
      nombreProductoAgroquimico: Value('Producto A'),
      tipoProductoAgroquimico: Value('Tipo'),
      claseProducto: Value('Clase'),
      ingredienteActivoProductoAgroquimico: Value('Ingrediente'),
      periodoCarenciaProductoAgroquimico: Value(7),
      presentacionProductoAgroquimico: Value('Litro'),
      fechaUltimaActualizacion: Value(now),
    ),
  );

  final palmaId = await db.palmaDao.insertPalma(
    PalmasCompanion(
      idPalma: const Value(100),
      nombreLote: const Value('Lote A'),
      numerolinea: const Value(1),
      numeroenlinea: const Value(1),
      orientacion: const Value('N'),
      estadopalma: const Value('Pendiente por tratar'),
      sincronizado: const Value(false),
    ),
  );

  await db.palmaDao.insertarEnfermedad(
    RegistroEnfermedadCompanion(
      idRegistroEnfermedad: const Value(900),
      idPalma: Value(palmaId),
      fechaRegistro: Value(now),
      nombreEnfermedad: const Value('Enfermedad A'),
      idEtapaEnfermedad: const Value(1),
      observaciones: const Value('Obs'),
      responsable: const Value('Tester'),
    ),
  );
  final registro = await db.palmaDao.obtenerRegistrosEnfermedad().then(
        (value) => value.first,
      );
  await db.palmaDao.insertarTratamiento(
    RegistroTratamientoCompanion(
      idRegistroEnfermedad: Value(registro.id),
      idProductoAgroquimico: const Value(1),
      tipoControl: const Value('Quimico'),
      dosis: const Value(1.5),
      fechaRegistro: Value(now),
      unidades: const Value('L'),
      responsable: const Value('Tester'),
    ),
    );
  }

void main() {
  test('PalmaCubit covers selection, process lookup and update flow', () async {
    final db = ensureTestDatabase();
    await seedPalmaGraph(db);

    final cubit = PalmaCubit();

    await cubit.initState('Lote A');
    await cubit.obtenerPalmasLote('Lote A');
    expect(cubit.state.palmas != null, isTrue);
    expect(cubit.state.palmas, isNotEmpty);

    final palma = cubit.state.palmas!.first;
    cubit.palmaSeleccionadaChanged(palma);
    await cubit.lineaDePalmaChanged(1);
    await cubit.numeroDePalmaChanged(1);
    await cubit.orientacionChanged('N');

    await cubit.obtenerProcesosPalma();
    expect(cubit.state.status, FormStatus.submissionSuccess);
    expect(cubit.state.palmaSeleccionada != null, isTrue);

    cubit.initErradicacion();
    expect(cubit.state is ErradicacionSinCausa, isTrue);

    await cubit.causaChanged('Causa');
    await cubit.actualizarPalmaErradicada(
      'Causa',
      palma,
      DateTime(2024, 1, 1, 13),
      'Obs',
    );

    final updated = await db.palmaDao.getPalma(palma.id);
    expect(updated?.estadopalma, EstadosPalma.erradicada);
    expect(await db.erradicacionesDao.getRegistrosForSync(), hasLength(1));
  });
}
