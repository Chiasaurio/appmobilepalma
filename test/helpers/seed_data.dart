import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

Future<void> seedCoreGraph(AppDatabase db) async {
  final existingLots = await db.loteDao.getLotes();
  if (existingLots.any((lote) => lote.nombreLote == 'Lote A')) {
    return;
  }

  final now = DateTime(2024, 1, 1, 12);

  await db.loteDao.addLotes([
    LotesCompanion(
      nombreLote: const Value('Lote A'),
      hectareas: const Value(10),
      numeropalmas: const Value(100),
      numeroLineas: const Value(5),
      palmasPorLinea: const Value(20),
      fechaUltimaActualizacion: Value(now),
    ),
  ]);
  await db.loteDao.addLotes([
    LotesCompanion(
      nombreLote: const Value('Lote B'),
      hectareas: const Value(12),
      numeropalmas: const Value(120),
      numeroLineas: const Value(6),
      palmasPorLinea: const Value(20),
      fechaUltimaActualizacion: Value(now.add(const Duration(days: 1))),
    ),
  ]);

  await db.plagasDao.insertPlagas(
    [
      Plaga(
        nombreComunPlaga: 'Plaga A',
        fechaUltimaActualizacion: now,
      ),
      Plaga(
        nombreComunPlaga: 'Plaga B',
        fechaUltimaActualizacion: now.add(const Duration(minutes: 30)),
      ),
    ],
    [
      EtapasPlagaCompanion(
        nombrePlaga: const Value('Plaga A'),
        nombreEtapa: const Value('Etapa 1'),
        procedimientoEtapa: const Value('Procedimiento'),
      ),
    ],
  );
  await db.enfermedadesDao.insertEnfermedad(
    const EnfermedadesCompanion(
      nombreEnfermedad: Value('Enfermedad A'),
      procedimientoEnfermedad: Value('Tratamiento'),
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

Future<void> seedLote(AppDatabase db, String nombreLote) async {
  await db.loteDao.addLotes([
    LotesCompanion(
      nombreLote: Value(nombreLote),
      hectareas: const Value(10),
      numeropalmas: const Value(100),
      numeroLineas: const Value(5),
      palmasPorLinea: const Value(20),
      fechaUltimaActualizacion: Value(DateTime(2024, 1, 1, 12)),
    ),
  ]);
}

Future<void> seedProductOnly(AppDatabase db, String name) async {
  await db.productoAgroquimicoDao.insertProducto(
    ProductoAgroquimicoCompanion(
      nombreProductoAgroquimico: Value(name),
      tipoProductoAgroquimico: const Value('Tipo'),
      claseProducto: const Value('Clase'),
      ingredienteActivoProductoAgroquimico: const Value('Ingrediente'),
      periodoCarenciaProductoAgroquimico: const Value(7),
      presentacionProductoAgroquimico: const Value('Litro'),
      fechaUltimaActualizacion: Value(DateTime(2024, 1, 1, 12)),
    ),
  );
}

Future<void> seedFertilizante(AppDatabase db, String name) async {
  await db.fertilizanteDao.insertProducto(
    FertilizanteCompanion(
      nombreFertilizante: Value(name),
      tipo: const Value('Granular'),
      composicion: const Value('NPK'),
      porcentaje: const Value(10),
      presentacionPnombreFertilizante: const Value('Saco'),
    ),
  );
}

Future<void> seedCensoProductivo(AppDatabase db, String lote) async {
  await db.censoProductivoDao.insertCenso(
    CensoProductivoCompanion(
      fechaCenso: Value(DateTime(2024, 1, 1, 12)),
      floresFemeninas: const Value(5),
      floresMasculinas: const Value(6),
      palmasLeidas: const Value(20),
      racimosVerdes: const Value(1),
      racimosPintones: const Value(2),
      racimosSobremaduros: const Value(3),
      racimosMaduros: const Value(4),
      nombreLote: Value(lote),
      responsable: const Value('Tester'),
    ),
  );
}
