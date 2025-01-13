import 'package:drift/drift.dart';

class Precipitacion extends Table {
  IntColumn get idPrecipitacion => integer().autoIncrement()();
  DateTimeColumn get fechaRegistroPrecipitacion => dateTime()();
  IntColumn get cantidadPrecipitacion => integer()();
  TextColumn get responsable => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}
