import 'package:apppalma/data/moor/tables/tables.dart';
import 'package:drift/drift.dart';

class Aplicaciones extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get dosis => real()();
  IntColumn get area => integer()();
  TextColumn get unidades => text()();
  DateTimeColumn get fechaAplicacion => dateTime()();
  DateTimeColumn get fechaReingreso => dateTime()();
  IntColumn get idCenso => integer().references(Censo, #id)();
  IntColumn get idCensoFromServer =>
      integer().references(Censo, #idCenso).nullable()();
  IntColumn get idProductoAgroquimico =>
      integer().references(ProductoAgroquimico, #idProductoAgroquimico)();
  TextColumn get responsable => text().references(Usuario, #ccUsuario)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}
