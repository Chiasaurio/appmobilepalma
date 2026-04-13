import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Censo_Productivo/cubit/censo_productivo_cubit.dart';
import 'package:apppalma/presentation/modules/Login/cubit/authentication_cubit.dart';
import 'package:apppalma/presentation/modules/Login/resources/authentication_repository.dart';
import 'package:apppalma/presentation/modules/Login/ui/cubit/login_cubit.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/presentation/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/presentation/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/presentation/modules/Fertilizaciones/cubit/fertilizaciones_cubit.dart';
import 'package:apppalma/presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:apppalma/presentation/modules/Pluviometro/cubit/pluviometro_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

import '../../helpers/seed_data.dart';
import '../../helpers/test_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = ensureTestDatabase();
  });

  test('AuthenticationCubit accepts the unauthenticated branch', () async {
    final cubit = AuthenticationCubit();

    await cubit.mapAuthenticationOnLoadingToState(
      s: AuthenticationStatus.unauthenticated,
    );

    expect(cubit.state.status, AuthenticationStatus.unauthenticated);
    await cubit.close();
  });

  test('LoginCubit keeps invalid form submissions local', () async {
    final cubit = LoginCubit();

    cubit.nameChanged('');
    cubit.passwordChanged('');
    await cubit.signUpFormSubmitted();

    expect(cubit.state.isValid, isFalse);
    expect(cubit.state.status, FormzSubmissionStatus.initial);
    await cubit.close();
  });

  test('LoteslistCubit loads and stores lotes from the database', () async {
    await seedLote(db, 'Lote Unitario');
    final cubit = LoteslistCubit();

    await cubit.obtenerTodosLotesWithProcesos();
    expect(cubit.state, isA<LotesListLoaded>());
    expect((cubit.state as LotesListLoaded).lotes, isNotEmpty);

    await cubit.addLotesFromServerToLocal([
      LotesCompanion(
        nombreLote: const Value('Lote Extra'),
        hectareas: const Value(5),
        numeropalmas: const Value(50),
        numeroLineas: const Value(3),
        palmasPorLinea: const Value(15),
        fechaUltimaActualizacion: Value(DateTime(2024, 1, 2, 12)),
      ),
    ]);

    await cubit.obtenerTodosLotesWithProcesos();
    expect(
      (cubit.state as LotesListLoaded).lotes.any(
            (lote) => lote.lote.nombreLote == 'Lote Extra',
          ),
      isTrue,
    );
  });

  test('LoteDetailCubit selects and reloads the chosen lot', () async {
    await seedLote(db, 'Lote Detail');
    final lotes = await db.loteDao.getLotesWithProcesos();
    final cubit = LoteDetailCubit();

    cubit.loteEscogido(lotes.first);
    expect(cubit.state, isA<LoteChoosed>());

    await cubit.reloadLote(lotes.first.lote.id);
    expect(cubit.state, isA<LoteChoosed>());
  });

  test('CosechaCubit handles the full harvest lifecycle', () async {
    const lote = 'Lote Cosecha';
    await seedLote(db, lote);
    final cubit = CosechaCubit();

    await cubit.comenzarNuevaCosecha(lote, DateTime(2024, 1, 1, 7));
    await cubit.obtenerCosechaActiva(lote);
    expect(cubit.state.isLoaded, isTrue);
    expect(cubit.state.cosecha != null, isTrue);

    final cosecha = cubit.state.cosecha!;
    await cubit.insertarCosechaDiaria(
      DateTime(2024, 1, 1, 8),
      12,
      25,
      cosecha,
      '1',
      '1',
      'N',
      '1',
      '5',
      'N',
    );
    await cubit.obtenerCosechaActiva(lote);
    expect(cubit.state.cosechasDiarias, isNotEmpty);

    await cubit.finalizarCosecha(cosecha, DateTime(2024, 1, 1, 18));
    final finalizadas = await cubit.obtenerCosechasFinalizadas();
    expect(
      finalizadas.any((item) => item.nombreLote == lote && item.completada),
      isTrue,
    );
  });

  test('PlateosCubit handles plateo creation, daily records and closeout',
      () async {
    const lote = 'Lote Plateo';
    await seedLote(db, lote);
    final cubit = PlateosCubit();

    await cubit.comenzarNuevoPlateo(lote, DateTime(2024, 1, 3, 7), 'Manual');
    await cubit.obtenerPlateoActivo(lote);
    expect(cubit.state.isLoaded, isTrue);
    expect(cubit.state.plateo != null, isTrue);

    final plateo = cubit.state.plateo!;
    await cubit.insertarPlateoDiario(
      DateTime(2024, 1, 3, 8),
      6,
      plateo,
      '1',
      '1',
      'N',
      '1',
      '5',
      'N',
    );
    await cubit.obtenerPlateoActivo(lote);
    expect(cubit.state.plateosDiarios, isNotEmpty);

    await cubit.finalizarPlateo(plateo, DateTime(2024, 1, 3, 18));
    final active = await db.plateoDao.getPlateoActivo(lote);
    expect(active == null, isTrue);
  });

  test('PodasCubit handles poda creation, daily records and closeout',
      () async {
    const lote = 'Lote Poda';
    await seedLote(db, lote);
    final cubit = PodasCubit();

    await cubit.comenzarNuevaPoda(lote, DateTime(2024, 1, 4, 7));
    await cubit.obtenerPodaActiva(lote);
    expect(cubit.state.isLoaded, isTrue);
    expect(cubit.state.poda != null, isTrue);

    final poda = cubit.state.poda!;
    await cubit.insertarPodaDiaria(
      DateTime(2024, 1, 4, 8),
      4,
      poda,
      '1',
      '1',
      'N',
      '1',
      '5',
      'N',
    );
    await cubit.obtenerPodaActiva(lote);
    expect(cubit.state.podasDiarias, isNotEmpty);

    await cubit.finalizarPoda(poda, DateTime(2024, 1, 4, 18));
    final active = await db.podaDao.getPodaActiva(lote);
    expect(active == null, isTrue);
  });

  test('FertilizacionCubit handles fertilization flow and fertilizer loading',
      () async {
    const lote = 'Lote Fert';
    await seedLote(db, lote);
    await seedFertilizante(db, 'Fertilizante Base');
    final cubit = FertilizacionCubit();

    await cubit.cargarFertilizantes();
    expect(cubit.state.fertilizantes, isNotEmpty);

    await cubit.comenzarNuevaFertilizacion(
        lote, DateTime(2024, 1, 5, 7));
    await cubit.obtenerFertilizacionActiva(lote);
    expect(cubit.state.isLoaded, isTrue);
    expect(cubit.state.fertilizacion != null, isTrue);

    final fertilizacion = cubit.state.fertilizacion!;
    await cubit.insertarFertilizacionDiaria(
      DateTime(2024, 1, 5, 8),
      7,
      'Fertilizante Base',
      3.5,
      'L',
      fertilizacion,
      '1',
      '1',
      'N',
      '1',
      '5',
      'N',
    );
    await cubit.obtenerFertilizacionActiva(lote);
    expect(cubit.state.fertilizacionDarias, isNotEmpty);

    await cubit.finalizarFertilizacion(
        fertilizacion, DateTime(2024, 1, 5, 18));
    final active = await db.fertilizacionDao.getFertilizacionActiva(lote);
    expect(active == null, isTrue);
  });

  test('ViajeCubit aggregates harvests and finalizes a trip', () async {
    const lote = 'Lote Viaje';
    await seedLote(db, lote);
    final cosechaCubit = CosechaCubit();
    await cosechaCubit.comenzarNuevaCosecha(lote, DateTime(2024, 1, 6, 7));
    await cosechaCubit.obtenerCosechaActiva(lote);
    final cosecha = cosechaCubit.state.cosecha!;

    final cubit = ViajeCubit();
    cubit.agregarCosechaAlViaje(cosecha);
    expect(cubit.state.cosechasDelViaje, hasLength(1));

    cubit.setHoraCarga(const TimeOfDay(hour: 8, minute: 15));
    cubit.setHoraSalida(const TimeOfDay(hour: 17, minute: 45));
    await cubit.finalizarViaje();

    expect(cubit.state.status, FormStatus.submissionSuccess);
    final viaje = await db.viajesDao.getRegistrosForSync();
    expect(viaje, hasLength(1));
  });

  test('PluviometroCubit stores precipitation records', () async {
    const lote = 'Lote Lluvia';
    await seedLote(db, lote);
    final cubit = PluviometroCubit();

    final ok = await cubit.agregarPrecipitacion(24, DateTime(2024, 1, 7));
    expect(ok, isTrue);
    final pendientes = await db.loteDao.getPrecipitacionesPendientesForSync();
    expect(pendientes, isNotEmpty);
  });

  test('CensoProductivoCubit creates, updates and loads records', () async {
    const lote = 'Lote Censo';
    await seedLote(db, lote);
    final cubit = CensoProductivoCubit();

    final created = await cubit.registrarCensoProductivo(
      fechaCenso: DateTime(2024, 1, 8),
      nombreLote: lote,
      floresFemeninas: 10,
      floresMasculinas: 11,
      palmasLeidas: 12,
      racimosVerdes: 1,
      racimosPintones: 2,
      racimosSobremaduros: 3,
      racimosMaduros: 4,
    );
    expect(created, isTrue);

    await cubit.getAllCensosProductvos(lote);
    expect(cubit.state.censos, isNotEmpty);
    expect(
      cubit.state.censos!.every((censo) => censo.nombreLote == lote),
      isTrue,
    );

    final censo = cubit.state.censos!.first;
    final updated = await cubit.actualizarCensoProductivo(
      fechaCenso: censo.fechaCenso,
      nombreLote: lote,
      idCenso: censo.id,
      floresFemeninas: 20,
      floresMasculinas: 21,
      palmasLeidas: 22,
      racimosVerdes: 5,
      racimosPintones: 6,
      racimosSobremaduros: 7,
      racimosMaduros: 8,
    );
    expect(updated, isTrue);
  });
}
