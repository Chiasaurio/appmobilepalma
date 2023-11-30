import 'package:drift/drift.dart';

class Usuario extends Table {
  TextColumn get ccUsuario => text().unique()();
  TextColumn get nombreUsuario => text()();
  TextColumn get cargoEmpresa => text()();
  TextColumn get rol => text()();
  BoolColumn get validado => boolean()();
  DateTimeColumn get fechaUltimaActualizacion => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {ccUsuario};
}
