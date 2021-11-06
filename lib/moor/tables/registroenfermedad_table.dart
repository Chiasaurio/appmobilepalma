import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

class RegistroEnfermedad extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get fechaRegistro => dateTime()();
  DateTimeColumn get horaRegistro => dateTime()();
  IntColumn get idPalma => integer()();
  IntColumn get idEnfermedad => integer()();
  IntColumn get idEtapaEnfermedad => integer()();
  TextColumn get observaciones => text().nullable()();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_palma) REFERENCES palmas(id)',
        'FOREIGN KEY(id_enfermedad) REFERENCES enfermedades(id)',
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
