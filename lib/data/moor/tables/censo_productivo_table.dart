import 'package:drift/drift.dart';

import 'tables.dart';

class CensoProductivo extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idCensoProductivo => integer().nullable()();
  DateTimeColumn get fechaCenso => dateTime()();
  IntColumn get floresFemeninas => integer().nullable()();
  IntColumn get floresMasculinas => integer().nullable()();
  IntColumn get palmasLeidas => integer().nullable()();
  IntColumn get racimosVerdes => integer().nullable()();
  IntColumn get racimosPintones => integer().nullable()();
  IntColumn get racimosSobremaduros => integer().nullable()();
  IntColumn get racimosMaduros => integer().nullable()();
  TextColumn get nombreLote => text().references(Lotes, #nombreLote)();
  TextColumn get responsable => text().references(Usuario, #ccUsuario)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}
