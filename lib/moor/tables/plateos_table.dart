import 'package:drift/drift.dart';

class Plateos extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get nombreLote => text()();
  DateTimeColumn get fechaIngreso => dateTime()();
  DateTimeColumn get fechaSalida => dateTime().nullable()();
  IntColumn get cantidadPlateada => integer()();
  BoolColumn get completado => boolean().withDefault(Constant(false))();
}

class PlateoDiario extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idPlateo =>
      integer().customConstraint('REFERENCES plateos(id)')();
  DateTimeColumn get fecha => dateTime()();
  IntColumn get cantidadPlateada => integer()();
  TextColumn get tipoPlateo => text()();
}
