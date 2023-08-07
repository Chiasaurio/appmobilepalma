// These imports are only needed to open the database
import 'dart:io';

import 'package:apppalma/data/moor/tables/tables.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'daos/daos.dart';

part 'moor_database.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  Aplicaciones,
  Censo,
  Cosechas,
  CosechaDiaria,
  Enfermedades,
  Etapas,
  EtapasPlaga,
  Erradicacion,
  Lotes,
  Palmas,
  Plagas,
  Plateos,
  PlateoDiario,
  Podas,
  PodaDiaria,
  ProductoAgroquimico,
  RegistroEnfermedad,
  ImagenRegistroEnfermedad,
  RegistroTratamiento,
  Viajes,
  CensoEtapasPlaga,
  ImagenCensoPlaga,
  Precipitacion,
  Fertilizaciones,
  FertilizacionDiaria
], daos: [
  CosechaDao,
  CosechaDiariaDao,
  EnfermedadesDao,
  ErradicacionesDao,
  FumigacionDao,
  LoteDao,
  PalmaDao,
  PlagasDao,
  PodaDao,
  PlateoDao,
  ProductoAgroquimicoDao,
  RegistroEnfermedadDao,
  ViajesDao,
  FertilizacionDao
])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {}
        },
      );
}
