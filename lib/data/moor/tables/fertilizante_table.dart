import 'package:drift/drift.dart';

class Fertilizante extends Table {
  TextColumn get nombreFertilizante => text()();
  TextColumn get tipo => text()();
  TextColumn get composicion => text()();
  RealColumn get porcentaje => real()();
  TextColumn get presentacionPnombreFertilizante => text()();
  DateTimeColumn get fechaUltimaActualizacion => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {nombreFertilizante};
}
