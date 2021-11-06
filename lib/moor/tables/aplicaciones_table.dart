import 'package:drift/drift.dart';

class Aplicaciones extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get dosis => real()();
  IntColumn get area => integer()();
  DateTimeColumn get fechaAplicacion => dateTime()();
  DateTimeColumn get fechaReingreso => dateTime()();
  TextColumn get ccUsuario => text()();
  IntColumn get idCenso => integer().customConstraint('REFERENCES censo(id)')();
  IntColumn get idProductoAgroquimico =>
      integer().customConstraint('REFERENCES producto_agroquimico(id)')();
}
