import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Enfermedades extends Table {
  TextColumn get nombreEnfermedad => text()();
  TextColumn get procedimientoEnfermedad => text()();
  DateTimeColumn get fechaUltimaActualizacion => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {nombreEnfermedad};
}

class Etapas extends Table {
  IntColumn get id => integer()();
  TextColumn get nombreEnfermedad => text().customConstraint(
      'NOT NULL REFERENCES enfermedades(nombre_enfermedad)')();
  TextColumn get nombreEtapa => text()();
  TextColumn get procedimientoEtapa => text()();
  @override
  Set<Column> get primaryKey => {id};
}

class EnfermedadConEtapas {
  final Enfermedade enfermedad;
  final List<Etapa> etapas;

  factory EnfermedadConEtapas.otraEnfermedad() {
    return EnfermedadConEtapas(
        enfermedad: const Enfermedade(
            nombreEnfermedad: "Otra", procedimientoEnfermedad: ""),
        etapas: []);
  }

  EnfermedadConEtapas({
    required this.enfermedad,
    required this.etapas,
  });
}
