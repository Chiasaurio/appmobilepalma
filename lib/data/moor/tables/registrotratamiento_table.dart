import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class RegistroTratamiento extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idRegistroEnfermedad => integer()
      .customConstraint('NOT NULL REFERENCES registro_enfermedad(id)')();
  IntColumn get idProductoAgroquimico => integer()
      .customConstraint('NOT NULL REFERENCES producto_agroquimico(id)')();
  TextColumn get tipoControl => text()();
  RealColumn get dosis => real()();
  TextColumn get descripcionProcedimiento => text().nullable()();
  DateTimeColumn get fechaRegistro => dateTime()();
  TextColumn get responsable => text()();
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
