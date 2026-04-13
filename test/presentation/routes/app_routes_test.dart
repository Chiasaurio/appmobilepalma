import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart' as app_main;
import 'package:apppalma/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

void main() {
  const routes = <String>[
    '/auth-options',
    '/finca',
    '/pluviometro',
    '/viajes',
    '/viajes/nuevoviaje',
    '/viajes/datosviaje',
    '/lotes',
    '/sincronizar',
    '/sinctoserver',
    '/lote/censo/enfermedades',
    '/lote/censo/enfermedad',
    '/lote/palmas',
    '/lote/cosechas',
    '/lote/cosechas/registrocosechas',
    '/lote/plateos',
    '/lote/plateos/registroplateos',
    '/lote/podas',
    '/lote/podas/registropodas',
    '/lote/censo/registrarplaga',
    '/lote/censo/plagas',
    '/lote/aplicaciones/palmasenfermas',
    '/lote/aplicaciones/censospendientes',
    '/lote/plagas/registrarfumigacion',
    '/lote/fertilizaciones',
    '/lote/fertilizaciones/registrofertilizaciones',
    '/lote/censoproductivo',
    '/lote/censoproductivo/nuevo',
  ];

  setUpAll(() {
    if (!app_main.getIt.isRegistered<AppDatabase>()) {
      app_main.getIt.registerSingleton<AppDatabase>(
        AppDatabase(NativeDatabase.memory()),
        signalsReady: true,
      );
    }
  });

  test('Routes.generateRoutes resolves all known routes', () {
    for (final route in routes) {
      final generated = Routes.generateRoutes(RouteSettings(name: route));
      expect(generated, isNotNull, reason: route);
    }
  });
}
