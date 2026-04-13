import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
  });

  Future<void> seedCoreGraph() async {
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
    await db.loteDao.addLote(
      LotesCompanion(
        nombreLote: const Value('Lote B'),
        hectareas: const Value(12),
        numeropalmas: const Value(120),
        numeroLineas: const Value(6),
        palmasPorLinea: const Value(20),
        fechaUltimaActualizacion: Value(now.add(const Duration(days: 1))),
      ),
    );

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

    await db.cosechaDao.insertCosecha(
      CosechasCompanion(
        idCosecha: const Value(10),
        nombreLote: const Value('Lote A'),
        fechaIngreso: Value(now),
        cantidadRacimos: const Value(5),
        kilos: const Value(50),
      ),
    );
    await db.cosechaDao.insertCosecha(
      CosechasCompanion(
        idCosecha: const Value(11),
        nombreLote: const Value('Lote A'),
        fechaIngreso: Value(now.add(const Duration(days: 1))),
        cantidadRacimos: const Value(8),
        kilos: const Value(80),
        completada: const Value(true),
        sincronizado: const Value(true),
      ),
    );
    final cosechaActiva = await db.cosechaDao.getCosechaActiva('Lote A');
    if (cosechaActiva != null) {
      await db.cosechaDiariaDao.insertCosechaDiaria(
        CosechaDiariaCompanion(
          idCosecha: Value(cosechaActiva.id),
          fechaIngreso: Value(now),
          kilos: const Value(10),
          cantidadRacimos: const Value(1),
          lineaInicio: const Value('1'),
          numeroInicio: const Value('1'),
          orientacionInicio: const Value('N'),
          lineaFin: const Value('1'),
          numeroFin: const Value('2'),
          orientacionFin: const Value('N'),
          responsable: const Value('Tester'),
        ),
      );
    }

    final plateoId = await db.plateoDao.insertPlateo(
      PlateosCompanion(
        idPlateo: const Value(20),
        nombreLote: const Value('Lote A'),
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
        responsable: const Value('Tester'),
      ),
    );

    final podaId = await db.podaDao.insertPoda(
      PodasCompanion(
        idPoda: const Value(30),
        nombreLote: const Value('Lote A'),
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
        responsable: const Value('Tester'),
      ),
    );

    await db.fertilizanteDao.insertProducto(
      const FertilizanteCompanion(
        nombreFertilizante: Value('Fertilizante A'),
        tipo: Value('Granular'),
        composicion: Value('NPK'),
        porcentaje: Value(10),
        presentacionPnombreFertilizante: Value('Saco'),
      ),
    );
    final fertilizacionId = await db.fertilizacionDao.insertFertilizacion(
      FertilizacionesCompanion(
        idFertilizacion: const Value(40),
        nombreLote: const Value('Lote A'),
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
        responsable: const Value('Tester'),
        nombreFertilizante: const Value('Fertilizante A'),
      ),
    );

    await db.loteDao.agregarPrecipitacion(
      PrecipitacionCompanion(
        fechaRegistroPrecipitacion: Value(now),
        cantidadPrecipitacion: const Value(15),
        responsable: const Value('Tester'),
      ),
    );

    await db.erradicacionesDao.insertErradicacion(
      ErradicacionCompanion(
        idPalma: Value(palmaId),
        causaErradicacion: const Value('Causa'),
        observaciones: const Value('Obs'),
        fechaRegistro: Value(now),
        responsable: const Value('Tester'),
      ),
    );

    await db.censoProductivoDao.insertCenso(
      CensoProductivoCompanion(
        idCensoProductivo: const Value(50),
        fechaCenso: Value(now),
        floresFemeninas: const Value(1),
        floresMasculinas: const Value(2),
        palmasLeidas: const Value(3),
        racimosVerdes: const Value(4),
        racimosPintones: const Value(5),
        racimosSobremaduros: const Value(6),
        racimosMaduros: const Value(7),
        nombreLote: const Value('Lote A'),
        responsable: const Value('Tester'),
      ),
    );

    await db.plagasDao.insertPlagaConEtapas(
      Plaga(
        nombreComunPlaga: 'Plaga C',
        fechaUltimaActualizacion: now.add(const Duration(minutes: 1)),
      ),
      [
        EtapasPlagaCompanion(
          nombrePlaga: const Value('Plaga C'),
          nombreEtapa: const Value('Etapa C'),
          procedimientoEtapa: const Value('Paso C'),
        ),
      ],
    );

    final censoId = await db.into(db.censo).insert(
          CensoCompanion(
            idCenso: const Value(60),
            fechaCenso: Value(now),
            nombreLote: const Value('Lote A'),
            numeroIndividuos: const Value(10),
            nombrePlaga: const Value('Plaga B'),
            responsable: const Value('Tester'),
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
  }

  test('LoteDao loads core lot and sync queries', () async {
    await seedCoreGraph();
    final dao = db.loteDao;

    final lots = await dao.getLotes();
    expect(lots, hasLength(2));
    expect((await dao.getLoteUltimo())?.nombreLote, 'Lote B');

    final pendientes = await dao.getPrecipitacionesPendientesForSync();
    expect(pendientes, hasLength(1));
    await dao.updatePrecipitacion(pendientes.first);
    expect(await dao.getPrecipitacionesPendientesForSync(), isEmpty);

    final lote = await dao.getSingleLote(1);
    expect(lote.lote.nombreLote, 'Lote A');
    expect(lote.cosecha != null, isTrue);
    expect(lote.plateo != null, isTrue);
    expect(lote.poda != null, isTrue);
    expect(lote.fertilizacion != null, isTrue);
    expect(lote.censospendientes, isNotEmpty);
    expect(lote.palmaspendientes, isNotEmpty);

    final lotesConProcesos = await dao.getLotesWithProcesos();
    expect(lotesConProcesos, hasLength(2));
  });

  test('CosechaDao handles active, finalised and sync flows', () async {
    await seedCoreGraph();
    final dao = db.cosechaDao;

    expect((await dao.getCosechasFinalizadas()), hasLength(1));
    expect((await dao.getCosechasForSync()), hasLength(1));
    expect((await dao.getCosechaActiva('Lote A'))?.nombreLote, 'Lote A');
    await expectLater(
        dao.watchCosechasFinalizadas(), emits(isA<List<Cosecha>>()));
    await expectLater(dao.watchCosechaActiva('Lote A'), emits(isA<Cosecha>()));

    final activa = await dao.getCosechaActiva('Lote A');
    final diarias = await db.cosechaDiariaDao.getCosechasDiarias(activa!.id);
    expect(diarias, hasLength(1));
    await dao.updateSyncCosecha(activa, diarias);
    expect((await dao.getCosechasForSync()), hasLength(0));
  });

  test('Plateo and poda DAOs handle active and sync queries', () async {
    await seedCoreGraph();

    final plateoDao = db.plateoDao;
    final podaDao = db.podaDao;

    final plateo = await plateoDao.getPlateoActivo('Lote A');
    expect(plateo != null, isTrue);
    expect(await plateoDao.getPlateosDiarios(plateo!.id), hasLength(1));
    expect(await plateoDao.getPlateosForSync(), hasLength(1));
    await plateoDao.updateSyncPlateo(
        plateo, await plateoDao.getPlateosDiarios(plateo.id));
    expect(await plateoDao.getPlateosForSync(), isEmpty);

    final poda = await podaDao.getPodaActiva('Lote A');
    expect(poda != null, isTrue);
    expect(await podaDao.getPodasDiarias(poda!.id), hasLength(1));
    expect(await podaDao.getPodasForSync(), hasLength(1));
    await podaDao.updateSyncPoda(poda, await podaDao.getPodasDiarias(poda.id));
    expect(await podaDao.getPodasForSync(), isEmpty);
  });

  test('FertilizacionDao and FertilizanteDao handle list and sync flows',
      () async {
    await seedCoreGraph();

    final fertilizacionDao = db.fertilizacionDao;
    final fertilizanteDao = db.fertilizanteDao;

    expect(await fertilizanteDao.getFertilizantes(), hasLength(1));
    expect((await fertilizanteDao.getFertilizanteUltimo())!.nombreFertilizante,
        'Fertilizante A');

    final activa = await fertilizacionDao.getFertilizacionActiva('Lote A');
    expect(activa != null, isTrue);
    expect(await fertilizacionDao.getFertilizacionesDiarias(activa!.id),
        hasLength(1));
    expect(await fertilizacionDao.getFertilizacionForSync(), hasLength(1));
    await fertilizacionDao.updateSyncFertilizacion(
        activa, await fertilizacionDao.getFertilizacionesDiarias(activa.id));
    expect(await fertilizacionDao.getFertilizacionForSync(), isEmpty);
  });

  test('PalmaDao handles disease and treatment queries', () async {
    await seedCoreGraph();
    final dao = db.palmaDao;

    expect(await dao.obtenerPalmas('Lote A'), hasLength(1));
    expect(await dao.obtenerTodasPalmas(), hasLength(1));
    expect((await dao.getPalma(1)) != null, isTrue);
    expect((await dao.obtenerPalma('Lote A', 1, 1, 'N')) != null, isTrue);
    expect(
      (await dao.obtenerPalmaConRegistros('Lote A', 1, 1)) != null,
      isTrue,
    );
    expect(
      await dao.obtenerPalmasSegunEstado('Lote A', 'Pendiente por tratar'),
      hasLength(1),
    );
    expect(await dao.obtenerEnfermedadesyTratamientos(), hasLength(1));
    expect(await dao.getPalmasForSync(), hasLength(1));
    expect(await dao.getRegistrosEnfermedadesForSync(), hasLength(1));
    expect(await dao.getRegistrosTratamientosForSync(), hasLength(1));
  });

  test('PlagasDao and CensoProductivoDao handle sync and lookup flows',
      () async {
    await seedCoreGraph();
    final plagasDao = db.plagasDao;
    final censoProductivoDao = db.censoProductivoDao;
    final erradicacionesDao = db.erradicacionesDao;
    final registroEnfermedadDao = db.registroEnfermedadDao;

    expect(await plagasDao.obtenerPlagaConEtapas(), isNotEmpty);
    expect((await plagasDao.getPlagaUltimo())?.nombreComunPlaga, isNotEmpty);
    expect(await plagasDao.obtenerTodosCensos(), isNotEmpty);
    expect(await plagasDao.getCensosPendientes('Lote A'), isNotEmpty);
    expect(
      await plagasDao.getCensosPendientes('Lote A', 'Pendiente por fumigar'),
      isNotEmpty,
    );
    expect(await plagasDao.getCensosFumigados(), isEmpty);
    final censo = await plagasDao.getRegistroCenso(1);
    expect(censo != null, isTrue);
    expect(await plagasDao.getCensosEtapasForSync(censo!), hasLength(1));
    expect(await plagasDao.getImagenesCensoForSync(censo), hasLength(1));
    await plagasDao.updateSyncCenso(
        censo, await plagasDao.getCensosEtapasForSync(censo));
    expect(await plagasDao.getCensosForSync(), isEmpty);

    expect(await censoProductivoDao.getCensos(), hasLength(1));
    expect(await censoProductivoDao.getCensosPorLote('Lote A'), hasLength(1));
    expect(await censoProductivoDao.getCensosPendientesForSync(), hasLength(1));
    await censoProductivoDao.updateCensoSyncTrue(
      (await censoProductivoDao.getCensos()).first,
    );
    expect(await censoProductivoDao.getCensosPendientesForSync(), isEmpty);

    expect(await erradicacionesDao.getRegistrosForSync(), hasLength(1));
    expect(
      (await registroEnfermedadDao.getRegistroEnfermedad(900)) != null,
      isTrue,
    );
    final registroRows = await db.palmaDao.obtenerRegistrosEnfermedad();
    final localRegistro =
        await registroEnfermedadDao.getLocalRegistroEnfermedad(
      registroRows.first.id,
    );
    expect(localRegistro != null, isTrue);
    await registroEnfermedadDao.updateSyncRegistro(
      localRegistro!,
      const [],
    );
  });
}
