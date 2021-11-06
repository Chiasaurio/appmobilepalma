import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

class RegistroTratamiento extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idRegistroEnfermedad =>
      integer().customConstraint('REFERENCES registro_enfermedad(id)')();
  IntColumn get idProductoAgroquimico =>
      integer().customConstraint('REFERENCES producto_agroquimico(id)')();
  TextColumn get tipoControl => text()();
  RealColumn get dosis => real()();
  TextColumn get descripcionProcedimiento => text().nullable()();
  DateTimeColumn get fechaRegistro => dateTime()();
}

class EnfermedadConTratamiento {
  final RegistroTratamientoData tratamiento;
  final RegistroEnfermedadData enfermedad;

  EnfermedadConTratamiento({
    required this.tratamiento,
    required this.enfermedad,
  });
}
