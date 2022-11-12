// These imports are only needed to open the database
import 'dart:io';

import 'package:apppalma/moor/daos/cosecha_daos.dart';
import 'package:apppalma/moor/daos/enfermedades_dao.dart';
import 'package:apppalma/moor/daos/fumigacion_dao.dart';
import 'package:apppalma/moor/daos/lote_dao.dart';
import 'package:apppalma/moor/daos/plagas_daos.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:apppalma/moor/tables/aplicaciones_table.dart';
import 'package:apppalma/moor/tables/censo_table.dart';
import 'package:apppalma/moor/tables/cosechas_table.dart';
import 'package:apppalma/moor/tables/enfermedades_table.dart';
import 'package:apppalma/moor/tables/lotes_table.dart';
import 'package:apppalma/moor/tables/palmas_table.dart';
import 'package:apppalma/moor/tables/plagas_table.dart';
import 'package:apppalma/moor/tables/plateos_table.dart';
import 'package:apppalma/moor/tables/podas_table.dart';
import 'package:apppalma/moor/tables/productoagroquimico_table.dart';
import 'package:apppalma/moor/tables/registroenfermedad_table.dart';
import 'package:apppalma/moor/tables/registrotratamiento_table.dart';
import 'package:apppalma/moor/tables/viajes_table.dart';
import 'daos/palma_daos.dart';
import 'daos/plateos_dao.dart';
import 'daos/podas_dao.dart';
import 'daos/producto_dao.dart';
import 'daos/viajes_dao.dart';

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
  Lotes,
  Palmas,
  Plagas,
  Plateos,
  PlateoDiario,
  Podas,
  PodaDiaria,
  ProductoAgroquimico,
  RegistroEnfermedad,
  RegistroTratamiento,
  Viajes,
  CensoEtapasPlaga,
], daos: [
  CosechaDao,
  CosechaDiariaDao,
  EnfermedadesDao,
  FumigacionDao,
  LoteDao,
  PalmaDao,
  PlagasDao,
  PodaDao,
  PlateoDao,
  ProductoAgroquimicoDao,
  ViajesDao
])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {}
        },
      );
}
