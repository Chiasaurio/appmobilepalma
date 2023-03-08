import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Plateos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombreLote => text()();
  DateTimeColumn get fechaIngreso => dateTime()();
  DateTimeColumn get fechaSalida => dateTime().nullable()();
  IntColumn get cantidadPlateada => integer()();
  BoolColumn get completado => boolean().withDefault(const Constant(false))();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}

class PlateoDiario extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idPlateo =>
      integer().customConstraint('NOT NULL REFERENCES plateos(id)')();
  DateTimeColumn get fecha => dateTime()();
  IntColumn get cantidadPlateada => integer()();
  TextColumn get tipoPlateo => text()();
  TextColumn get responsable => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}

class PlateoConPlateosDiarias {
  final Plateo plateo;
  final List<PlateoDiarioData> plateosDiarias;

  PlateoConPlateosDiarias({
    required this.plateo,
    required this.plateosDiarias,
  });
}
