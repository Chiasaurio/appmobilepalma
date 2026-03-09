import 'package:drift/drift.dart';

class ProductoAgroquimico extends Table {
  IntColumn get idProductoAgroquimico => integer()();
  TextColumn get nombreProductoAgroquimico => text()();
  TextColumn get tipoProductoAgroquimico => text()();
  TextColumn get claseProducto => text()();
  TextColumn get ingredienteActivoProductoAgroquimico => text()();
  IntColumn get periodoCarenciaProductoAgroquimico => integer()();
  TextColumn get presentacionProductoAgroquimico => text()();
  DateTimeColumn get fechaUltimaActualizacion => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {idProductoAgroquimico};
}
