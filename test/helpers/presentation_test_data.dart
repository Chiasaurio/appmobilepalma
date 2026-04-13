import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'seed_data.dart';

Future<void> seedPresentationTestGraph(AppDatabase db) async {
  final existingLots = await db.loteDao.getLotes();
  if (existingLots.any((lote) => lote.nombreLote == 'Lote Demo')) {
    return;
  }

  await seedCoreGraph(db);

  final now = DateTime(2024, 1, 2, 12);

  await db.loteDao.addLotes([
    LotesCompanion(
      nombreLote: const Value('Lote Demo'),
      hectareas: const Value(18),
      numeropalmas: const Value(180),
      numeroLineas: const Value(9),
      palmasPorLinea: const Value(20),
      fechaUltimaActualizacion: Value(now),
    ),
  ]);

  await db.fertilizanteDao.insertProducto(
    FertilizanteCompanion(
      nombreFertilizante: const Value('Fertilizante Demo'),
      tipo: const Value('Granular'),
      composicion: const Value('NPK'),
      porcentaje: const Value(12),
      presentacionPnombreFertilizante: const Value('Saco'),
      fechaUltimaActualizacion: Value(now),
    ),
  );

  await db.enfermedadesDao.insertEnfermedad(
    EnfermedadesCompanion(
      nombreEnfermedad: const Value('Enfermedad Demo'),
      procedimientoEnfermedad: const Value('Tratamiento'),
      fechaUltimaActualizacion: Value(now),
    ),
  );
  await db.enfermedadesDao.insertEtapa(
    EtapasCompanion(
      nombreEnfermedad: const Value('Enfermedad Demo'),
      nombreEtapa: const Value('Etapa Demo'),
      procedimientoEtapa: const Value('Paso Demo'),
    ),
  );

  final cosechaId = await db.cosechaDao.insertCosecha(
    CosechasCompanion(
      nombreLote: const Value('Lote Demo'),
      fechaIngreso: Value(now),
      cantidadRacimos: const Value(7),
      kilos: const Value(70),
    ),
  );
  await db.cosechaDiariaDao.insertCosechaDiaria(
    CosechaDiariaCompanion(
      idCosecha: Value(cosechaId),
      fechaIngreso: Value(now),
      kilos: const Value(10),
      cantidadRacimos: const Value(1),
      lineaInicio: const Value('1'),
      numeroInicio: const Value('1'),
      orientacionInicio: const Value('N'),
      lineaFin: const Value('1'),
      numeroFin: const Value('2'),
      orientacionFin: const Value('N'),
      responsable: const Value('Demo'),
    ),
  );

  final plateoId = await db.plateoDao.insertPlateo(
    PlateosCompanion(
      nombreLote: const Value('Lote Demo'),
      tipoPlateo: const Value('Manual'),
      fechaIngreso: Value(now),
      cantidadPlateada: const Value(0),
    ),
  );
  await db.plateoDao.insertPlateoDiario(
    PlateoDiarioCompanion(
      idPlateo: Value(plateoId),
      fecha: Value(now),
      cantidadPlateada: const Value(3),
      lineaInicio: const Value('1'),
      numeroInicio: const Value('1'),
      orientacionInicio: const Value('N'),
      lineaFin: const Value('1'),
      numeroFin: const Value('3'),
      orientacionFin: const Value('N'),
      responsable: const Value('Demo'),
    ),
  );

  final podaId = await db.podaDao.insertPoda(
    PodasCompanion(
      nombreLote: const Value('Lote Demo'),
      fechaIngreso: Value(now),
      cantidadPodada: const Value(0),
    ),
  );
  await db.podaDao.insertPodaDiaria(
    PodaDiariaCompanion(
      idPoda: Value(podaId),
      fechaIngreso: Value(now),
      cantidadPodada: const Value(2),
      lineaInicio: const Value('1'),
      numeroInicio: const Value('4'),
      orientacionInicio: const Value('N'),
      lineaFin: const Value('1'),
      numeroFin: const Value('5'),
      orientacionFin: const Value('N'),
      responsable: const Value('Demo'),
    ),
  );

  final fertilizacionId = await db.fertilizacionDao.insertFertilizacion(
    FertilizacionesCompanion(
      nombreLote: const Value('Lote Demo'),
      fechaIngreso: Value(now),
      cantidadFertilizada: const Value(0),
    ),
  );
  await db.fertilizacionDao.insertFertilizacionDiaria(
    FertilizacionDiariaCompanion(
      idFertilizacion: Value(fertilizacionId),
      fecha: Value(now),
      cantidadFertilizada: const Value(4),
      dosis: const Value(1.5),
      unidades: const Value('kg'),
      lineaInicio: const Value('1'),
      numeroInicio: const Value('6'),
      orientacionInicio: const Value('N'),
      lineaFin: const Value('1'),
      numeroFin: const Value('7'),
      orientacionFin: const Value('N'),
      responsable: const Value('Demo'),
      nombreFertilizante: const Value('Fertilizante Demo'),
    ),
  );

  await db.loteDao.agregarPrecipitacion(
    PrecipitacionCompanion(
      fechaRegistroPrecipitacion: Value(now),
      cantidadPrecipitacion: const Value(15),
      responsable: const Value('Demo'),
    ),
  );

  final viajeId = await db.viajesDao.insertViaje(
    ViajesCompanion(
      cantidadRacimos: const Value(7),
      kilos: const Value(70),
      completado: const Value(false),
      horaCargue: Value(now),
      horaSalida: Value(now.add(const Duration(hours: 1))),
      responsable: const Value('Demo'),
    ),
  );
  await db.viajesDao.updateViaje(
    (await db.viajesDao.getViaje(viajeId))!,
  );

  final censoProductivoId = await db.censoProductivoDao.insertCenso(
    CensoProductivoCompanion(
      fechaCenso: Value(now),
      floresFemeninas: const Value(1),
      floresMasculinas: const Value(2),
      palmasLeidas: const Value(3),
      racimosVerdes: const Value(4),
      racimosPintones: const Value(5),
      racimosSobremaduros: const Value(6),
      racimosMaduros: const Value(7),
      nombreLote: const Value('Lote Demo'),
      responsable: const Value('Demo'),
    ),
  );
  await db.censoProductivoDao.updateCenso(
    (await db.censoProductivoDao.getCensos().then((censos) =>
        censos.firstWhere((censo) => censo.id == censoProductivoId))),
  );

  final censoId = await db.into(db.censo).insert(
        CensoCompanion(
          fechaCenso: Value(now),
          nombreLote: const Value('Lote Demo'),
          numeroIndividuos: const Value(10),
          nombrePlaga: const Value('Plaga B'),
          responsable: const Value('Demo'),
          numerolinea: const Value(1),
          numeroenlinea: const Value(1),
          orientacion: const Value('N'),
        ),
      );
  await db.into(db.censoEtapasPlaga).insert(
        CensoEtapasPlagaCompanion(
          idCenso: Value(censoId),
          idEtapasplaga: const Value(1),
          numeroIndividuos: const Value(3),
        ),
      );
  await db.into(db.imagenCensoPlaga).insert(
        ImagenCensoPlagaCompanion(
          idCenso: Value(censoId),
          imagen: Value(Uint8List.fromList([1, 2, 3])),
        ),
      );
  final censoData = await db.plagasDao.getRegistroCenso(censoId);
  if (censoData != null) {
    await db.fumigacionDao.insertarAplicacion(
      AplicacionesCompanion(
        fechaAplicacion: Value(now),
        fechaReingreso: Value(now.add(const Duration(days: 1))),
        dosis: const Value(1.0),
        unidades: const Value('L'),
        idCenso: Value(censoData.idCenso ?? censoData.id),
        idProductoAgroquimico: const Value(1),
        area: const Value(5),
        responsable: const Value('Demo'),
      ),
      censoData,
    );
  }

  final palmas = await db.palmaDao.obtenerPalmas('Lote A');
  if (palmas.isNotEmpty) {
    await db.erradicacionesDao.insertErradicacion(
      ErradicacionCompanion(
        idPalma: Value(palmas.first.id),
        causaErradicacion: const Value('Demo'),
        observaciones: const Value('Demo'),
        fechaRegistro: Value(now),
        responsable: const Value('Demo'),
      ),
    );
  }
}
