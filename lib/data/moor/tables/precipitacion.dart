import 'package:drift/drift.dart';

class Precipitacion extends Table {
  IntColumn get idPrecipitacion => integer().autoIncrement()();
  DateTimeColumn get fechaRegistroPrecipitacion => dateTime()();
  IntColumn get cantidadPrecipitacion => integer()();
}
