import 'package:drift/drift.dart';

class ProductoAgroquimico extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombreProductoAgroquimico => text()();
  TextColumn get tipoProductoAgroquimico => text()();
  TextColumn get ingredienteActivoProductoAgroquimico => text()();
  IntColumn get periodoCarenciaProductoAgroquimico => integer()();
  TextColumn get presentacionProductoAgroquimico => text()();
}
