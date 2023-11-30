import 'package:apppalma/data/moor/tables/tables.dart';
import 'package:drift/drift.dart';

class Precipitacion extends Table {
  IntColumn get idPrecipitacion => integer().autoIncrement()();
  DateTimeColumn get fechaRegistroPrecipitacion => dateTime()();
  IntColumn get cantidadPrecipitacion => integer()();
  TextColumn get responsable => text().references(Usuario, #ccUsuario)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}
