import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/moor/tables/lotes_table.dart';
import 'package:apppalma/presentation/modules/Aplicaciones/ui/aplicaciones_page.dart';
import 'package:apppalma/presentation/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/presentation/modules/Censo/ui/censo_page.dart';
import 'package:apppalma/presentation/modules/Censo_Productivo/cubit/censo_productivo_cubit.dart';
import 'package:apppalma/presentation/modules/Censo_Productivo/page.dart';
import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/modules/Cosechas/ui/cosecha_page.dart';
import 'package:apppalma/presentation/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/presentation/modules/Enfermedad/enfermedad_page.dart';
import 'package:apppalma/presentation/modules/Fertilizaciones/cubit/fertilizaciones_cubit.dart';
import 'package:apppalma/presentation/modules/Fertilizaciones/ui/fertilizacion_page.dart';
import 'package:apppalma/presentation/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/presentation/modules/Login/cubit/authentication_cubit.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/presentation/modules/LoteDetail/ui/lote_page.dart';
import 'package:apppalma/presentation/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/presentation/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/presentation/modules/Palma/ui/palmas_page.dart';
import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/presentation/modules/Plateos/ui/plateo_page.dart';
import 'package:apppalma/presentation/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/presentation/modules/Podas/ui/poda_page.dart';
import 'package:apppalma/presentation/modules/Sync/cubit/sync_to_device_cubit.dart';
import 'package:apppalma/presentation/modules/Sync/sincronizar_page.dart';
import 'package:apppalma/presentation/modules/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/presentation/modules/SyncToServer/ui/sincronizar_a_servidor_page.dart';
import 'package:apppalma/presentation/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../helpers/seed_data.dart';
import '../../helpers/test_database.dart';

void main() {
  late AppDatabase db;
  late LoteWithProcesos loteA;
  late LoteDetailCubit loteDetailCubit;
  late LoteslistCubit loteslistCubit;
  late CensoProductivoCubit censoProductivoCubit;
  late CosechaCubit cosechaCubit;
  late PlateosCubit plateosCubit;
  late PodasCubit podasCubit;
  late FertilizacionCubit fertilizacionCubit;
  late TratamientoCubit tratamientoCubit;
  late EnfermedadCubit enfermedadCubit;
  late PalmaCubit palmaCubit;
  late CensosCubit censosCubit;
  late FumigacionCubit fumigacionCubit;
  late SynToDeviceCubit syncToDeviceCubit;
  late SyncToServerCubit syncToServerCubit;
  late AuthenticationCubit authenticationCubit;

  Future<void> pumpWithProviders(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: authenticationCubit),
          BlocProvider.value(value: loteDetailCubit),
          BlocProvider.value(value: loteslistCubit),
          BlocProvider.value(value: censoProductivoCubit),
          BlocProvider.value(value: cosechaCubit),
          BlocProvider.value(value: plateosCubit),
          BlocProvider.value(value: podasCubit),
          BlocProvider.value(value: fertilizacionCubit),
          BlocProvider.value(value: tratamientoCubit),
          BlocProvider.value(value: enfermedadCubit),
          BlocProvider.value(value: palmaCubit),
          BlocProvider.value(value: censosCubit),
          BlocProvider.value(value: fumigacionCubit),
          BlocProvider.value(value: syncToDeviceCubit),
          BlocProvider.value(value: syncToServerCubit),
        ],
        child: MaterialApp(
          onGenerateRoute: Routes.generateRoutes,
          home: child,
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
  }

  Future<void> seedActiveProcesses() async {
    final base = DateTime(2024, 2, 1, 7);

    await seedCoreGraph(db);
    await seedFertilizante(db, 'Fertilizante Widget');
    await seedCensoProductivo(db, 'Lote A');

    await cosechaCubit.comenzarNuevaCosecha('Lote A', base);
    await cosechaCubit.obtenerCosechaActiva('Lote A');
    final cosecha = cosechaCubit.state.cosecha!;
    await cosechaCubit.insertarCosechaDiaria(
      base.add(const Duration(hours: 1)),
      12,
      20,
      cosecha,
      '1',
      '1',
      'N',
      '1',
      '5',
      'N',
    );
    await cosechaCubit.obtenerCosechaActiva('Lote A');

    await plateosCubit.comenzarNuevoPlateo('Lote A', base, 'Manual');
    await plateosCubit.obtenerPlateoActivo('Lote A');
    final plateo = plateosCubit.state.plateo!;
    await plateosCubit.insertarPlateoDiario(
      base.add(const Duration(hours: 1)),
      4,
      plateo,
      '1',
      '1',
      'N',
      '1',
      '5',
      'N',
    );
    await plateosCubit.obtenerPlateoActivo('Lote A');

    await podasCubit.comenzarNuevaPoda('Lote A', base);
    await podasCubit.obtenerPodaActiva('Lote A');
    final poda = podasCubit.state.poda!;
    await podasCubit.insertarPodaDiaria(
      base.add(const Duration(hours: 1)),
      2,
      poda,
      '1',
      '1',
      'N',
      '1',
      '5',
      'N',
    );
    await podasCubit.obtenerPodaActiva('Lote A');

    await fertilizacionCubit.comenzarNuevaFertilizacion('Lote A', base);
    await fertilizacionCubit.obtenerFertilizacionActiva('Lote A');
    final fertilizacion = fertilizacionCubit.state.fertilizacion!;
    await fertilizacionCubit.insertarFertilizacionDiaria(
      base.add(const Duration(hours: 1)),
      3,
      'Fertilizante Widget',
      2.0,
      'Kg',
      fertilizacion,
      '1',
      '1',
      'N',
      '1',
      '5',
      'N',
    );
    await fertilizacionCubit.obtenerFertilizacionActiva('Lote A');

    await censoProductivoCubit.getAllCensosProductvos('Lote A');
    await tratamientoCubit.obtenerPalmasEnfermas('Lote A');
    await enfermedadCubit.obtenerTodasEnfermedadesConEtapas();
    await palmaCubit.initState('Lote A');
    await palmaCubit.obtenerPalmasLote('Lote A');
    await censosCubit.obtenerCensosPendientes('Lote A');
    await syncToDeviceCubit.getFechasUltimaActualizacion();
    await syncToServerCubit.getRegistrosPendientes();
  }

  setUpAll(() async {
    db = ensureTestDatabase();
    await initializeDateFormatting('es', null);

    authenticationCubit = AuthenticationCubit();
    loteDetailCubit = LoteDetailCubit();
    loteslistCubit = LoteslistCubit();
    censoProductivoCubit = CensoProductivoCubit();
    cosechaCubit = CosechaCubit();
    plateosCubit = PlateosCubit();
    podasCubit = PodasCubit();
    fertilizacionCubit = FertilizacionCubit();
    tratamientoCubit = TratamientoCubit();
    enfermedadCubit = EnfermedadCubit();
    palmaCubit = PalmaCubit();
    censosCubit = CensosCubit(db);
    fumigacionCubit = FumigacionCubit();
    syncToDeviceCubit = SynToDeviceCubit();
    syncToServerCubit = SyncToServerCubit();

    await seedActiveProcesses();
    loteA = (await db.loteDao.getLotesWithProcesos())
        .firstWhere((lote) => lote.lote.nombreLote == 'Lote A');
    loteDetailCubit.loteEscogido(loteA);
    await loteDetailCubit.reloadLote(loteA.lote.id);
    await loteslistCubit.obtenerTodosLotesWithProcesos();
  });

  tearDownAll(() async {
    await authenticationCubit.close();
    await loteDetailCubit.close();
    await loteslistCubit.close();
    await censoProductivoCubit.close();
    await cosechaCubit.close();
    await plateosCubit.close();
    await podasCubit.close();
    await fertilizacionCubit.close();
    await enfermedadCubit.close();
    await palmaCubit.close();
    await censosCubit.close();
    await fumigacionCubit.close();
    await syncToDeviceCubit.close();
    await syncToServerCubit.close();
  });

  testWidgets('LotePage opens the seeded productiva and fitosanitaria routes',
      (tester) async {
    await pumpWithProviders(
      tester,
      LotePage(routeName: '/lote', lote: loteA),
    );

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.tap(find.text('Productiva'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.textContaining('Continuar cosecha'), findsOneWidget);
    expect(find.textContaining('Continuar plateo'), findsOneWidget);
    expect(find.textContaining('Continuar poda'), findsOneWidget);
    expect(find.textContaining('fertiliz'), findsOneWidget);
    expect(find.text('Censo productivo'), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.tap(find.text('Fitosanitaria'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Ver palmas'), findsOneWidget);
    expect(find.textContaining('enfermedades'), findsOneWidget);
    expect(find.textContaining('plagas'), findsOneWidget);
  });

  testWidgets('Sync and standalone pages render with seeded data',
      (tester) async {
    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      CosechaPage(routeName: '/lote/cosechas'),
    );
    expect(find.byType(CosechaPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      PlateoPage(routeName: '/lote/plateos'),
    );
    expect(find.byType(PlateoPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      PodaPage(routeName: '/lote/podas'),
    );
    expect(find.byType(PodaPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      FertilizacionPage(routeName: '/lote/fertilizaciones'),
    );
    expect(find.byType(FertilizacionPage), findsOneWidget);

    await pumpWithProviders(
      tester,
      const SincronizacionPage(routeName: '/sincronizar'),
    );
    expect(find.byType(SincronizacionPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      SyncToServerPage(routeName: '/sinctoserver'),
    );
    expect(find.byType(SyncToServerPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      CensoProductivoPage(routeName: '/lote/censoproductivo'),
    );
    expect(find.byType(CensoProductivoPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      CensoPage(routeName: '/lote/censo/enfermedades'),
    );
    expect(find.byType(CensoPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      EnfermedadPage(routeName: '/lote/censo/enfermedad'),
    );
    expect(find.byType(EnfermedadPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      PalmasPage(),
    );
    expect(find.byType(PalmasPage), findsOneWidget);
  });

  testWidgets('Aplicaciones and palms side screens render', (tester) async {
    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      const AplicacionesPage(routeName: '/lote/censo/plagas'),
    );
    expect(find.byType(AplicacionesPage), findsOneWidget);

    loteDetailCubit.loteEscogido(loteA);
    await tester.pump(const Duration(milliseconds: 500));
    await pumpWithProviders(
      tester,
      PalmasPage(),
    );
    expect(find.byType(PalmasPage), findsOneWidget);
    await tester.tap(find.text('Buscar palma'));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.tap(find.text('Lista de palmas'));
    await tester.pump(const Duration(milliseconds: 500));
  });
}

