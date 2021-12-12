import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

class RegistroEnfermedad extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get fechaRegistro => dateTime()();
  DateTimeColumn get horaRegistro => dateTime().nullable()();
  IntColumn get idPalma => integer()();
  TextColumn get nombreEnfermedad => text()();
  IntColumn get idEtapaEnfermedad => integer().nullable()();
  TextColumn get observaciones => text().nullable()();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_palma) REFERENCES palmas(id)',
        'FOREIGN KEY(nombre_enfermedad) REFERENCES enfermedades(nombre_enfermedad)',
        'FOREIGN KEY(id_etapa_enfermedad) REFERENCES etapas(id)',
      ];
}

class PalmaConEnfermedad {
  final Palma palma;
  final RegistroEnfermedadData enfermedad;

  PalmaConEnfermedad({
    required this.palma,
    required this.enfermedad,
  });
}
