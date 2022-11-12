import 'package:drift/drift.dart';

class Viajes extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get horaCargue => dateTime()();
  DateTimeColumn get horaSalida => dateTime().nullable()();
  IntColumn get cantidadRacimos => integer()();
  IntColumn get kilos => integer().nullable()();
  RealColumn get kilosExtractora => real().nullable()();
  BoolColumn get completado => boolean().withDefault(Constant(false))();
  // @override
  // Set<Column> get primaryKey => {id, nombreLote};
}
