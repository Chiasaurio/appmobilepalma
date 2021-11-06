import 'package:drift/drift.dart';

class Podas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombreLote => text()();
  DateTimeColumn get fechaIngreso => dateTime()();
  DateTimeColumn get fechaSalida => dateTime().nullable()();
  IntColumn get cantidadPodada => integer()();
  BoolColumn get completada => boolean().withDefault(Constant(false))();
}

class PodaDiaria extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idPoda => integer().customConstraint('REFERENCES podas(id)')();
  DateTimeColumn get fechaIngreso => dateTime()();
  IntColumn get cantidadPodada => integer()();
}
