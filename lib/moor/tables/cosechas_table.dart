import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Cosechas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombreLote => text()();
  DateTimeColumn get fechaIngreso => dateTime()();
  DateTimeColumn get fechaSalida => dateTime().nullable()();
  IntColumn get cantidadRacimos => integer()();
  IntColumn get kilos => integer()();
  IntColumn get idViaje => integer().nullable()();
  BoolColumn get completada => boolean().withDefault(Constant(false))();
}

class CosechaDiaria extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idCosecha =>
      integer().customConstraint('REFERENCES cosechas(id)')();
  DateTimeColumn get fechaIngreso => dateTime()();
  IntColumn get kilos => integer()();
  IntColumn get cantidadRacimos => integer()();
}

class CosechaDiariaWithCosecha {
  final Cosecha cosecha;
  final CosechaDiariaData cosechadiaria;

  CosechaDiariaWithCosecha({
    required this.cosecha,
    required this.cosechadiaria,
  });
}
