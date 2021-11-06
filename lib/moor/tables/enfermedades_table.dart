import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Enfermedades extends Table {
  IntColumn get id => integer()();
  TextColumn get nombreEnfermedad => text()();
  TextColumn get procedimientoEnfermedad => text()();

  Set<Column> get primaryKey => {id};
}

class Etapas extends Table {
  IntColumn get id => integer()();
  TextColumn get nombreEnfermedad =>
      text().customConstraint('REFERENCES enfermedades(nombre_enfermedad)')();
  TextColumn get nombreEtapa => text()();
  TextColumn get procedimientoEtapa => text()();
  Set<Column> get primaryKey => {id};
}

class EnfermedadConEtapas {
  final Enfermedade enfermedad;
  final List<Etapa> etapas;

  EnfermedadConEtapas({
    required this.enfermedad,
    required this.etapas,
  });
}
