import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/moor/tables/tables.dart';
import 'package:drift/drift.dart';

class RegistroTratamiento extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idRegistroEnfermedad =>
      integer().references(RegistroEnfermedad, #id)();
  IntColumn get idProductoAgroquimico =>
      integer().references(ProductoAgroquimico, #idProductoAgroquimico)();
  TextColumn get tipoControl => text()();
  RealColumn get dosis => real()();
  TextColumn get descripcionProcedimiento => text().nullable()();
  DateTimeColumn get fechaRegistro => dateTime()();
  TextColumn get unidades => text()();
  TextColumn get responsable => text().references(Usuario, #ccUsuario)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}

class EnfermedadConTratamiento {
  final RegistroTratamientoData tratamiento;
  final RegistroEnfermedadData enfermedad;

  EnfermedadConTratamiento({
    required this.tratamiento,
    required this.enfermedad,
  });
}
