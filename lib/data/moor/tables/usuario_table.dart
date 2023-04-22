import 'package:drift/drift.dart';

class Usuario extends Table {
  TextColumn get ccUsuario => text()();
  TextColumn get nombreUsuario => text()();
  TextColumn get cargoEmpresa => text()();
  TextColumn get rol => text()();
  BoolColumn get validado => boolean()();

  @override
  Set<Column> get primaryKey => {ccUsuario};
}
